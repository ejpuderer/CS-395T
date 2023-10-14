
obj/net/testoutput:     file format elf64-x86-64


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
  80003c:	e8 59 05 00 00       	callq  80059a <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	53                   	push   %rbx
  800048:	48 83 ec 28          	sub    $0x28,%rsp
  80004c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80004f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800053:	48 b8 e1 1c 80 00 00 	movabs $0x801ce1,%rax
  80005a:	00 00 00 
  80005d:	ff d0                	callq  *%rax
  80005f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800062:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800069:	00 00 00 
  80006c:	48 bb 80 4c 80 00 00 	movabs $0x804c80,%rbx
  800073:	00 00 00 
  800076:	48 89 18             	mov    %rbx,(%rax)
  800079:	48 b8 db 25 80 00 00 	movabs $0x8025db,%rax
  800080:	00 00 00 
  800083:	ff d0                	callq  *%rax
  800085:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80008c:	00 00 00 
  80008f:	89 02                	mov    %eax,(%rdx)
  800091:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800098:	00 00 00 
  80009b:	8b 00                	mov    (%rax),%eax
  80009d:	85 c0                	test   %eax,%eax
  80009f:	79 2a                	jns    8000cb <umain+0x88>
  8000a1:	48 ba 8b 4c 80 00 00 	movabs $0x804c8b,%rdx
  8000a8:	00 00 00 
  8000ab:	be 17 00 00 00       	mov    $0x17,%esi
  8000b0:	48 bf 99 4c 80 00 00 	movabs $0x804c99,%rdi
  8000b7:	00 00 00 
  8000ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8000bf:	48 b9 40 06 80 00 00 	movabs $0x800640,%rcx
  8000c6:	00 00 00 
  8000c9:	ff d1                	callq  *%rcx
  8000cb:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8000d2:	00 00 00 
  8000d5:	8b 00                	mov    (%rax),%eax
  8000d7:	85 c0                	test   %eax,%eax
  8000d9:	75 16                	jne    8000f1 <umain+0xae>
  8000db:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8000de:	89 c7                	mov    %eax,%edi
  8000e0:	48 b8 83 04 80 00 00 	movabs $0x800483,%rax
  8000e7:	00 00 00 
  8000ea:	ff d0                	callq  *%rax
  8000ec:	e9 50 01 00 00       	jmpq   800241 <umain+0x1fe>
  8000f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  8000f8:	e9 1b 01 00 00       	jmpq   800218 <umain+0x1d5>
  8000fd:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800104:	00 00 00 
  800107:	48 8b 00             	mov    (%rax),%rax
  80010a:	ba 07 00 00 00       	mov    $0x7,%edx
  80010f:	48 89 c6             	mov    %rax,%rsi
  800112:	bf 00 00 00 00       	mov    $0x0,%edi
  800117:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  80011e:	00 00 00 
  800121:	ff d0                	callq  *%rax
  800123:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800126:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80012a:	79 30                	jns    80015c <umain+0x119>
  80012c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80012f:	89 c1                	mov    %eax,%ecx
  800131:	48 ba ad 4c 80 00 00 	movabs $0x804cad,%rdx
  800138:	00 00 00 
  80013b:	be 1f 00 00 00       	mov    $0x1f,%esi
  800140:	48 bf 99 4c 80 00 00 	movabs $0x804c99,%rdi
  800147:	00 00 00 
  80014a:	b8 00 00 00 00       	mov    $0x0,%eax
  80014f:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  800156:	00 00 00 
  800159:	41 ff d0             	callq  *%r8
  80015c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800163:	00 00 00 
  800166:	48 8b 18             	mov    (%rax),%rbx
  800169:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800170:	00 00 00 
  800173:	48 8b 00             	mov    (%rax),%rax
  800176:	48 8d 78 04          	lea    0x4(%rax),%rdi
  80017a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80017d:	89 c1                	mov    %eax,%ecx
  80017f:	48 ba c0 4c 80 00 00 	movabs $0x804cc0,%rdx
  800186:	00 00 00 
  800189:	be fc 0f 00 00       	mov    $0xffc,%esi
  80018e:	b8 00 00 00 00       	mov    $0x0,%eax
  800193:	49 b8 e1 12 80 00 00 	movabs $0x8012e1,%r8
  80019a:	00 00 00 
  80019d:	41 ff d0             	callq  *%r8
  8001a0:	89 03                	mov    %eax,(%rbx)
  8001a2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001a5:	89 c6                	mov    %eax,%esi
  8001a7:	48 bf cc 4c 80 00 00 	movabs $0x804ccc,%rdi
  8001ae:	00 00 00 
  8001b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8001b6:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  8001bd:	00 00 00 
  8001c0:	ff d2                	callq  *%rdx
  8001c2:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001c9:	00 00 00 
  8001cc:	48 8b 10             	mov    (%rax),%rdx
  8001cf:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8001d6:	00 00 00 
  8001d9:	8b 00                	mov    (%rax),%eax
  8001db:	b9 07 00 00 00       	mov    $0x7,%ecx
  8001e0:	be 0b 00 00 00       	mov    $0xb,%esi
  8001e5:	89 c7                	mov    %eax,%edi
  8001e7:	48 b8 11 29 80 00 00 	movabs $0x802911,%rax
  8001ee:	00 00 00 
  8001f1:	ff d0                	callq  *%rax
  8001f3:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001fa:	00 00 00 
  8001fd:	48 8b 00             	mov    (%rax),%rax
  800200:	48 89 c6             	mov    %rax,%rsi
  800203:	bf 00 00 00 00       	mov    $0x0,%edi
  800208:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  80020f:	00 00 00 
  800212:	ff d0                	callq  *%rax
  800214:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  800218:	83 7d ec 09          	cmpl   $0x9,-0x14(%rbp)
  80021c:	0f 8e db fe ff ff    	jle    8000fd <umain+0xba>
  800222:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  800229:	eb 10                	jmp    80023b <umain+0x1f8>
  80022b:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  800232:	00 00 00 
  800235:	ff d0                	callq  *%rax
  800237:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  80023b:	83 7d ec 13          	cmpl   $0x13,-0x14(%rbp)
  80023f:	7e ea                	jle    80022b <umain+0x1e8>
  800241:	48 83 c4 28          	add    $0x28,%rsp
  800245:	5b                   	pop    %rbx
  800246:	5d                   	pop    %rbp
  800247:	c3                   	retq   

0000000000800248 <timer>:
  800248:	55                   	push   %rbp
  800249:	48 89 e5             	mov    %rsp,%rbp
  80024c:	53                   	push   %rbx
  80024d:	48 83 ec 28          	sub    $0x28,%rsp
  800251:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800254:	89 75 d8             	mov    %esi,-0x28(%rbp)
  800257:	48 b8 ca 1f 80 00 00 	movabs $0x801fca,%rax
  80025e:	00 00 00 
  800261:	ff d0                	callq  *%rax
  800263:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800266:	01 d0                	add    %edx,%eax
  800268:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80026b:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800272:	00 00 00 
  800275:	48 bb e8 4c 80 00 00 	movabs $0x804ce8,%rbx
  80027c:	00 00 00 
  80027f:	48 89 18             	mov    %rbx,(%rax)
  800282:	eb 0c                	jmp    800290 <timer+0x48>
  800284:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  80028b:	00 00 00 
  80028e:	ff d0                	callq  *%rax
  800290:	48 b8 ca 1f 80 00 00 	movabs $0x801fca,%rax
  800297:	00 00 00 
  80029a:	ff d0                	callq  *%rax
  80029c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80029f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002a2:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8002a5:	73 06                	jae    8002ad <timer+0x65>
  8002a7:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8002ab:	79 d7                	jns    800284 <timer+0x3c>
  8002ad:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8002b1:	79 30                	jns    8002e3 <timer+0x9b>
  8002b3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002b6:	89 c1                	mov    %eax,%ecx
  8002b8:	48 ba f1 4c 80 00 00 	movabs $0x804cf1,%rdx
  8002bf:	00 00 00 
  8002c2:	be 10 00 00 00       	mov    $0x10,%esi
  8002c7:	48 bf 03 4d 80 00 00 	movabs $0x804d03,%rdi
  8002ce:	00 00 00 
  8002d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8002d6:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8002dd:	00 00 00 
  8002e0:	41 ff d0             	callq  *%r8
  8002e3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8002e6:	b9 00 00 00 00       	mov    $0x0,%ecx
  8002eb:	ba 00 00 00 00       	mov    $0x0,%edx
  8002f0:	be 0c 00 00 00       	mov    $0xc,%esi
  8002f5:	89 c7                	mov    %eax,%edi
  8002f7:	48 b8 11 29 80 00 00 	movabs $0x802911,%rax
  8002fe:	00 00 00 
  800301:	ff d0                	callq  *%rax
  800303:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800307:	ba 00 00 00 00       	mov    $0x0,%edx
  80030c:	be 00 00 00 00       	mov    $0x0,%esi
  800311:	48 89 c7             	mov    %rax,%rdi
  800314:	48 b8 50 28 80 00 00 	movabs $0x802850,%rax
  80031b:	00 00 00 
  80031e:	ff d0                	callq  *%rax
  800320:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800323:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800326:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800329:	39 c2                	cmp    %eax,%edx
  80032b:	74 22                	je     80034f <timer+0x107>
  80032d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800330:	89 c6                	mov    %eax,%esi
  800332:	48 bf 18 4d 80 00 00 	movabs $0x804d18,%rdi
  800339:	00 00 00 
  80033c:	b8 00 00 00 00       	mov    $0x0,%eax
  800341:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  800348:	00 00 00 
  80034b:	ff d2                	callq  *%rdx
  80034d:	eb b4                	jmp    800303 <timer+0xbb>
  80034f:	48 b8 ca 1f 80 00 00 	movabs $0x801fca,%rax
  800356:	00 00 00 
  800359:	ff d0                	callq  *%rax
  80035b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80035e:	01 d0                	add    %edx,%eax
  800360:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800363:	90                   	nop
  800364:	e9 27 ff ff ff       	jmpq   800290 <timer+0x48>

0000000000800369 <input>:
  800369:	55                   	push   %rbp
  80036a:	48 89 e5             	mov    %rsp,%rbp
  80036d:	53                   	push   %rbx
  80036e:	48 83 ec 28          	sub    $0x28,%rsp
  800372:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800375:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80037c:	00 00 00 
  80037f:	48 bb 53 4d 80 00 00 	movabs $0x804d53,%rbx
  800386:	00 00 00 
  800389:	48 89 18             	mov    %rbx,(%rax)
  80038c:	ba 07 00 00 00       	mov    $0x7,%edx
  800391:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  800398:	00 00 00 
  80039b:	bf 00 00 00 00       	mov    $0x0,%edi
  8003a0:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  8003a7:	00 00 00 
  8003aa:	ff d0                	callq  *%rax
  8003ac:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8003af:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8003b3:	79 30                	jns    8003e5 <input+0x7c>
  8003b5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8003b8:	89 c1                	mov    %eax,%ecx
  8003ba:	48 ba 5c 4d 80 00 00 	movabs $0x804d5c,%rdx
  8003c1:	00 00 00 
  8003c4:	be 0e 00 00 00       	mov    $0xe,%esi
  8003c9:	48 bf 6f 4d 80 00 00 	movabs $0x804d6f,%rdi
  8003d0:	00 00 00 
  8003d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d8:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8003df:	00 00 00 
  8003e2:	41 ff d0             	callq  *%r8
  8003e5:	be ee 05 00 00       	mov    $0x5ee,%esi
  8003ea:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8003f1:	00 00 00 
  8003f4:	48 b8 50 20 80 00 00 	movabs $0x802050,%rax
  8003fb:	00 00 00 
  8003fe:	ff d0                	callq  *%rax
  800400:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800403:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800407:	75 0e                	jne    800417 <input+0xae>
  800409:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  800410:	00 00 00 
  800413:	ff d0                	callq  *%rax
  800415:	eb 67                	jmp    80047e <input+0x115>
  800417:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80041b:	79 22                	jns    80043f <input+0xd6>
  80041d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800420:	89 c6                	mov    %eax,%esi
  800422:	48 bf 7e 4d 80 00 00 	movabs $0x804d7e,%rdi
  800429:	00 00 00 
  80042c:	b8 00 00 00 00       	mov    $0x0,%eax
  800431:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  800438:	00 00 00 
  80043b:	ff d2                	callq  *%rdx
  80043d:	eb 3f                	jmp    80047e <input+0x115>
  80043f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800443:	7e 39                	jle    80047e <input+0x115>
  800445:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80044c:	00 00 00 
  80044f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800452:	89 10                	mov    %edx,(%rax)
  800454:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800457:	b9 05 00 00 00       	mov    $0x5,%ecx
  80045c:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  800463:	00 00 00 
  800466:	be 0a 00 00 00       	mov    $0xa,%esi
  80046b:	89 c7                	mov    %eax,%edi
  80046d:	48 b8 11 29 80 00 00 	movabs $0x802911,%rax
  800474:	00 00 00 
  800477:	ff d0                	callq  *%rax
  800479:	e9 0e ff ff ff       	jmpq   80038c <input+0x23>
  80047e:	e9 09 ff ff ff       	jmpq   80038c <input+0x23>

0000000000800483 <output>:
  800483:	55                   	push   %rbp
  800484:	48 89 e5             	mov    %rsp,%rbp
  800487:	53                   	push   %rbx
  800488:	48 83 ec 28          	sub    $0x28,%rsp
  80048c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80048f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800496:	00 00 00 
  800499:	48 bb a0 4d 80 00 00 	movabs $0x804da0,%rbx
  8004a0:	00 00 00 
  8004a3:	48 89 18             	mov    %rbx,(%rax)
  8004a6:	48 8d 45 e4          	lea    -0x1c(%rbp),%rax
  8004aa:	ba 00 00 00 00       	mov    $0x0,%edx
  8004af:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8004b6:	00 00 00 
  8004b9:	48 89 c7             	mov    %rax,%rdi
  8004bc:	48 b8 50 28 80 00 00 	movabs $0x802850,%rax
  8004c3:	00 00 00 
  8004c6:	ff d0                	callq  *%rax
  8004c8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8004cb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8004ce:	3b 45 dc             	cmp    -0x24(%rbp),%eax
  8004d1:	74 35                	je     800508 <output+0x85>
  8004d3:	48 b9 aa 4d 80 00 00 	movabs $0x804daa,%rcx
  8004da:	00 00 00 
  8004dd:	48 ba bb 4d 80 00 00 	movabs $0x804dbb,%rdx
  8004e4:	00 00 00 
  8004e7:	be 11 00 00 00       	mov    $0x11,%esi
  8004ec:	48 bf d0 4d 80 00 00 	movabs $0x804dd0,%rdi
  8004f3:	00 00 00 
  8004f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8004fb:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  800502:	00 00 00 
  800505:	41 ff d0             	callq  *%r8
  800508:	83 7d ec 0b          	cmpl   $0xb,-0x14(%rbp)
  80050c:	74 35                	je     800543 <output+0xc0>
  80050e:	48 b9 e0 4d 80 00 00 	movabs $0x804de0,%rcx
  800515:	00 00 00 
  800518:	48 ba bb 4d 80 00 00 	movabs $0x804dbb,%rdx
  80051f:	00 00 00 
  800522:	be 12 00 00 00       	mov    $0x12,%esi
  800527:	48 bf d0 4d 80 00 00 	movabs $0x804dd0,%rdi
  80052e:	00 00 00 
  800531:	b8 00 00 00 00       	mov    $0x0,%eax
  800536:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80053d:	00 00 00 
  800540:	41 ff d0             	callq  *%r8
  800543:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80054a:	00 00 00 
  80054d:	8b 00                	mov    (%rax),%eax
  80054f:	89 c6                	mov    %eax,%esi
  800551:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  800558:	00 00 00 
  80055b:	48 b8 08 20 80 00 00 	movabs $0x802008,%rax
  800562:	00 00 00 
  800565:	ff d0                	callq  *%rax
  800567:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80056a:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80056e:	79 25                	jns    800595 <output+0x112>
  800570:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800573:	89 c6                	mov    %eax,%esi
  800575:	48 bf f8 4d 80 00 00 	movabs $0x804df8,%rdi
  80057c:	00 00 00 
  80057f:	b8 00 00 00 00       	mov    $0x0,%eax
  800584:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  80058b:	00 00 00 
  80058e:	ff d2                	callq  *%rdx
  800590:	e9 11 ff ff ff       	jmpq   8004a6 <output+0x23>
  800595:	e9 0c ff ff ff       	jmpq   8004a6 <output+0x23>

000000000080059a <libmain>:
  80059a:	55                   	push   %rbp
  80059b:	48 89 e5             	mov    %rsp,%rbp
  80059e:	48 83 ec 10          	sub    $0x10,%rsp
  8005a2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8005a5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8005a9:	48 b8 e1 1c 80 00 00 	movabs $0x801ce1,%rax
  8005b0:	00 00 00 
  8005b3:	ff d0                	callq  *%rax
  8005b5:	25 ff 03 00 00       	and    $0x3ff,%eax
  8005ba:	48 98                	cltq   
  8005bc:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8005c3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8005ca:	00 00 00 
  8005cd:	48 01 c2             	add    %rax,%rdx
  8005d0:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8005d7:	00 00 00 
  8005da:	48 89 10             	mov    %rdx,(%rax)
  8005dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8005e1:	7e 14                	jle    8005f7 <libmain+0x5d>
  8005e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005e7:	48 8b 10             	mov    (%rax),%rdx
  8005ea:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8005f1:	00 00 00 
  8005f4:	48 89 10             	mov    %rdx,(%rax)
  8005f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8005fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005fe:	48 89 d6             	mov    %rdx,%rsi
  800601:	89 c7                	mov    %eax,%edi
  800603:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80060a:	00 00 00 
  80060d:	ff d0                	callq  *%rax
  80060f:	48 b8 1d 06 80 00 00 	movabs $0x80061d,%rax
  800616:	00 00 00 
  800619:	ff d0                	callq  *%rax
  80061b:	c9                   	leaveq 
  80061c:	c3                   	retq   

000000000080061d <exit>:
  80061d:	55                   	push   %rbp
  80061e:	48 89 e5             	mov    %rsp,%rbp
  800621:	48 b8 5a 2d 80 00 00 	movabs $0x802d5a,%rax
  800628:	00 00 00 
  80062b:	ff d0                	callq  *%rax
  80062d:	bf 00 00 00 00       	mov    $0x0,%edi
  800632:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  800639:	00 00 00 
  80063c:	ff d0                	callq  *%rax
  80063e:	5d                   	pop    %rbp
  80063f:	c3                   	retq   

0000000000800640 <_panic>:
  800640:	55                   	push   %rbp
  800641:	48 89 e5             	mov    %rsp,%rbp
  800644:	53                   	push   %rbx
  800645:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80064c:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800653:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800659:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800660:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800667:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80066e:	84 c0                	test   %al,%al
  800670:	74 23                	je     800695 <_panic+0x55>
  800672:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800679:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80067d:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800681:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800685:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800689:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80068d:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800691:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800695:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80069c:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8006a3:	00 00 00 
  8006a6:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8006ad:	00 00 00 
  8006b0:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8006b4:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8006bb:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8006c2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8006c9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8006d0:	00 00 00 
  8006d3:	48 8b 18             	mov    (%rax),%rbx
  8006d6:	48 b8 e1 1c 80 00 00 	movabs $0x801ce1,%rax
  8006dd:	00 00 00 
  8006e0:	ff d0                	callq  *%rax
  8006e2:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8006e8:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8006ef:	41 89 c8             	mov    %ecx,%r8d
  8006f2:	48 89 d1             	mov    %rdx,%rcx
  8006f5:	48 89 da             	mov    %rbx,%rdx
  8006f8:	89 c6                	mov    %eax,%esi
  8006fa:	48 bf 28 4e 80 00 00 	movabs $0x804e28,%rdi
  800701:	00 00 00 
  800704:	b8 00 00 00 00       	mov    $0x0,%eax
  800709:	49 b9 79 08 80 00 00 	movabs $0x800879,%r9
  800710:	00 00 00 
  800713:	41 ff d1             	callq  *%r9
  800716:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80071d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800724:	48 89 d6             	mov    %rdx,%rsi
  800727:	48 89 c7             	mov    %rax,%rdi
  80072a:	48 b8 cd 07 80 00 00 	movabs $0x8007cd,%rax
  800731:	00 00 00 
  800734:	ff d0                	callq  *%rax
  800736:	48 bf 4b 4e 80 00 00 	movabs $0x804e4b,%rdi
  80073d:	00 00 00 
  800740:	b8 00 00 00 00       	mov    $0x0,%eax
  800745:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  80074c:	00 00 00 
  80074f:	ff d2                	callq  *%rdx
  800751:	cc                   	int3   
  800752:	eb fd                	jmp    800751 <_panic+0x111>

0000000000800754 <putch>:
  800754:	55                   	push   %rbp
  800755:	48 89 e5             	mov    %rsp,%rbp
  800758:	48 83 ec 10          	sub    $0x10,%rsp
  80075c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80075f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800763:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800767:	8b 00                	mov    (%rax),%eax
  800769:	8d 48 01             	lea    0x1(%rax),%ecx
  80076c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800770:	89 0a                	mov    %ecx,(%rdx)
  800772:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800775:	89 d1                	mov    %edx,%ecx
  800777:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80077b:	48 98                	cltq   
  80077d:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800781:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800785:	8b 00                	mov    (%rax),%eax
  800787:	3d ff 00 00 00       	cmp    $0xff,%eax
  80078c:	75 2c                	jne    8007ba <putch+0x66>
  80078e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800792:	8b 00                	mov    (%rax),%eax
  800794:	48 98                	cltq   
  800796:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80079a:	48 83 c2 08          	add    $0x8,%rdx
  80079e:	48 89 c6             	mov    %rax,%rsi
  8007a1:	48 89 d7             	mov    %rdx,%rdi
  8007a4:	48 b8 15 1c 80 00 00 	movabs $0x801c15,%rax
  8007ab:	00 00 00 
  8007ae:	ff d0                	callq  *%rax
  8007b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007b4:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8007ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007be:	8b 40 04             	mov    0x4(%rax),%eax
  8007c1:	8d 50 01             	lea    0x1(%rax),%edx
  8007c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007c8:	89 50 04             	mov    %edx,0x4(%rax)
  8007cb:	c9                   	leaveq 
  8007cc:	c3                   	retq   

00000000008007cd <vcprintf>:
  8007cd:	55                   	push   %rbp
  8007ce:	48 89 e5             	mov    %rsp,%rbp
  8007d1:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8007d8:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8007df:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8007e6:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8007ed:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8007f4:	48 8b 0a             	mov    (%rdx),%rcx
  8007f7:	48 89 08             	mov    %rcx,(%rax)
  8007fa:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8007fe:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800802:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800806:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80080a:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800811:	00 00 00 
  800814:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80081b:	00 00 00 
  80081e:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800825:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80082c:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800833:	48 89 c6             	mov    %rax,%rsi
  800836:	48 bf 54 07 80 00 00 	movabs $0x800754,%rdi
  80083d:	00 00 00 
  800840:	48 b8 2c 0c 80 00 00 	movabs $0x800c2c,%rax
  800847:	00 00 00 
  80084a:	ff d0                	callq  *%rax
  80084c:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800852:	48 98                	cltq   
  800854:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80085b:	48 83 c2 08          	add    $0x8,%rdx
  80085f:	48 89 c6             	mov    %rax,%rsi
  800862:	48 89 d7             	mov    %rdx,%rdi
  800865:	48 b8 15 1c 80 00 00 	movabs $0x801c15,%rax
  80086c:	00 00 00 
  80086f:	ff d0                	callq  *%rax
  800871:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800877:	c9                   	leaveq 
  800878:	c3                   	retq   

0000000000800879 <cprintf>:
  800879:	55                   	push   %rbp
  80087a:	48 89 e5             	mov    %rsp,%rbp
  80087d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800884:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80088b:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800892:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800899:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8008a0:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8008a7:	84 c0                	test   %al,%al
  8008a9:	74 20                	je     8008cb <cprintf+0x52>
  8008ab:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8008af:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8008b3:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8008b7:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8008bb:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8008bf:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8008c3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8008c7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8008cb:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8008d2:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8008d9:	00 00 00 
  8008dc:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8008e3:	00 00 00 
  8008e6:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8008ea:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8008f1:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8008f8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8008ff:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800906:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80090d:	48 8b 0a             	mov    (%rdx),%rcx
  800910:	48 89 08             	mov    %rcx,(%rax)
  800913:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800917:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80091b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80091f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800923:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80092a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800931:	48 89 d6             	mov    %rdx,%rsi
  800934:	48 89 c7             	mov    %rax,%rdi
  800937:	48 b8 cd 07 80 00 00 	movabs $0x8007cd,%rax
  80093e:	00 00 00 
  800941:	ff d0                	callq  *%rax
  800943:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800949:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80094f:	c9                   	leaveq 
  800950:	c3                   	retq   

0000000000800951 <printnum>:
  800951:	55                   	push   %rbp
  800952:	48 89 e5             	mov    %rsp,%rbp
  800955:	53                   	push   %rbx
  800956:	48 83 ec 38          	sub    $0x38,%rsp
  80095a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80095e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800962:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800966:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800969:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80096d:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800971:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800974:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800978:	77 3b                	ja     8009b5 <printnum+0x64>
  80097a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80097d:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800981:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800984:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800988:	ba 00 00 00 00       	mov    $0x0,%edx
  80098d:	48 f7 f3             	div    %rbx
  800990:	48 89 c2             	mov    %rax,%rdx
  800993:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800996:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800999:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80099d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a1:	41 89 f9             	mov    %edi,%r9d
  8009a4:	48 89 c7             	mov    %rax,%rdi
  8009a7:	48 b8 51 09 80 00 00 	movabs $0x800951,%rax
  8009ae:	00 00 00 
  8009b1:	ff d0                	callq  *%rax
  8009b3:	eb 1e                	jmp    8009d3 <printnum+0x82>
  8009b5:	eb 12                	jmp    8009c9 <printnum+0x78>
  8009b7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8009bb:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8009be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c2:	48 89 ce             	mov    %rcx,%rsi
  8009c5:	89 d7                	mov    %edx,%edi
  8009c7:	ff d0                	callq  *%rax
  8009c9:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8009cd:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8009d1:	7f e4                	jg     8009b7 <printnum+0x66>
  8009d3:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8009d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009da:	ba 00 00 00 00       	mov    $0x0,%edx
  8009df:	48 f7 f1             	div    %rcx
  8009e2:	48 89 d0             	mov    %rdx,%rax
  8009e5:	48 ba 50 50 80 00 00 	movabs $0x805050,%rdx
  8009ec:	00 00 00 
  8009ef:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8009f3:	0f be d0             	movsbl %al,%edx
  8009f6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8009fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009fe:	48 89 ce             	mov    %rcx,%rsi
  800a01:	89 d7                	mov    %edx,%edi
  800a03:	ff d0                	callq  *%rax
  800a05:	48 83 c4 38          	add    $0x38,%rsp
  800a09:	5b                   	pop    %rbx
  800a0a:	5d                   	pop    %rbp
  800a0b:	c3                   	retq   

0000000000800a0c <getuint>:
  800a0c:	55                   	push   %rbp
  800a0d:	48 89 e5             	mov    %rsp,%rbp
  800a10:	48 83 ec 1c          	sub    $0x1c,%rsp
  800a14:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800a18:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800a1b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800a1f:	7e 52                	jle    800a73 <getuint+0x67>
  800a21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a25:	8b 00                	mov    (%rax),%eax
  800a27:	83 f8 30             	cmp    $0x30,%eax
  800a2a:	73 24                	jae    800a50 <getuint+0x44>
  800a2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a30:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a34:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a38:	8b 00                	mov    (%rax),%eax
  800a3a:	89 c0                	mov    %eax,%eax
  800a3c:	48 01 d0             	add    %rdx,%rax
  800a3f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a43:	8b 12                	mov    (%rdx),%edx
  800a45:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a48:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a4c:	89 0a                	mov    %ecx,(%rdx)
  800a4e:	eb 17                	jmp    800a67 <getuint+0x5b>
  800a50:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a54:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a58:	48 89 d0             	mov    %rdx,%rax
  800a5b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a5f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a63:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a67:	48 8b 00             	mov    (%rax),%rax
  800a6a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a6e:	e9 a3 00 00 00       	jmpq   800b16 <getuint+0x10a>
  800a73:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800a77:	74 4f                	je     800ac8 <getuint+0xbc>
  800a79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a7d:	8b 00                	mov    (%rax),%eax
  800a7f:	83 f8 30             	cmp    $0x30,%eax
  800a82:	73 24                	jae    800aa8 <getuint+0x9c>
  800a84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a88:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a90:	8b 00                	mov    (%rax),%eax
  800a92:	89 c0                	mov    %eax,%eax
  800a94:	48 01 d0             	add    %rdx,%rax
  800a97:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a9b:	8b 12                	mov    (%rdx),%edx
  800a9d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800aa0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aa4:	89 0a                	mov    %ecx,(%rdx)
  800aa6:	eb 17                	jmp    800abf <getuint+0xb3>
  800aa8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aac:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800ab0:	48 89 d0             	mov    %rdx,%rax
  800ab3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800ab7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800abb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800abf:	48 8b 00             	mov    (%rax),%rax
  800ac2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ac6:	eb 4e                	jmp    800b16 <getuint+0x10a>
  800ac8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800acc:	8b 00                	mov    (%rax),%eax
  800ace:	83 f8 30             	cmp    $0x30,%eax
  800ad1:	73 24                	jae    800af7 <getuint+0xeb>
  800ad3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ad7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800adb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800adf:	8b 00                	mov    (%rax),%eax
  800ae1:	89 c0                	mov    %eax,%eax
  800ae3:	48 01 d0             	add    %rdx,%rax
  800ae6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aea:	8b 12                	mov    (%rdx),%edx
  800aec:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800aef:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800af3:	89 0a                	mov    %ecx,(%rdx)
  800af5:	eb 17                	jmp    800b0e <getuint+0x102>
  800af7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800afb:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800aff:	48 89 d0             	mov    %rdx,%rax
  800b02:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b06:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b0a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b0e:	8b 00                	mov    (%rax),%eax
  800b10:	89 c0                	mov    %eax,%eax
  800b12:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800b1a:	c9                   	leaveq 
  800b1b:	c3                   	retq   

0000000000800b1c <getint>:
  800b1c:	55                   	push   %rbp
  800b1d:	48 89 e5             	mov    %rsp,%rbp
  800b20:	48 83 ec 1c          	sub    $0x1c,%rsp
  800b24:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800b28:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800b2b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800b2f:	7e 52                	jle    800b83 <getint+0x67>
  800b31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b35:	8b 00                	mov    (%rax),%eax
  800b37:	83 f8 30             	cmp    $0x30,%eax
  800b3a:	73 24                	jae    800b60 <getint+0x44>
  800b3c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b40:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b48:	8b 00                	mov    (%rax),%eax
  800b4a:	89 c0                	mov    %eax,%eax
  800b4c:	48 01 d0             	add    %rdx,%rax
  800b4f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b53:	8b 12                	mov    (%rdx),%edx
  800b55:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b58:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b5c:	89 0a                	mov    %ecx,(%rdx)
  800b5e:	eb 17                	jmp    800b77 <getint+0x5b>
  800b60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b64:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800b68:	48 89 d0             	mov    %rdx,%rax
  800b6b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b6f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b73:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b77:	48 8b 00             	mov    (%rax),%rax
  800b7a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b7e:	e9 a3 00 00 00       	jmpq   800c26 <getint+0x10a>
  800b83:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800b87:	74 4f                	je     800bd8 <getint+0xbc>
  800b89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b8d:	8b 00                	mov    (%rax),%eax
  800b8f:	83 f8 30             	cmp    $0x30,%eax
  800b92:	73 24                	jae    800bb8 <getint+0x9c>
  800b94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b98:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ba0:	8b 00                	mov    (%rax),%eax
  800ba2:	89 c0                	mov    %eax,%eax
  800ba4:	48 01 d0             	add    %rdx,%rax
  800ba7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bab:	8b 12                	mov    (%rdx),%edx
  800bad:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800bb0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bb4:	89 0a                	mov    %ecx,(%rdx)
  800bb6:	eb 17                	jmp    800bcf <getint+0xb3>
  800bb8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bbc:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800bc0:	48 89 d0             	mov    %rdx,%rax
  800bc3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800bc7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bcb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800bcf:	48 8b 00             	mov    (%rax),%rax
  800bd2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800bd6:	eb 4e                	jmp    800c26 <getint+0x10a>
  800bd8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bdc:	8b 00                	mov    (%rax),%eax
  800bde:	83 f8 30             	cmp    $0x30,%eax
  800be1:	73 24                	jae    800c07 <getint+0xeb>
  800be3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800be7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800beb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bef:	8b 00                	mov    (%rax),%eax
  800bf1:	89 c0                	mov    %eax,%eax
  800bf3:	48 01 d0             	add    %rdx,%rax
  800bf6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bfa:	8b 12                	mov    (%rdx),%edx
  800bfc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800bff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c03:	89 0a                	mov    %ecx,(%rdx)
  800c05:	eb 17                	jmp    800c1e <getint+0x102>
  800c07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c0b:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800c0f:	48 89 d0             	mov    %rdx,%rax
  800c12:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800c16:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c1a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800c1e:	8b 00                	mov    (%rax),%eax
  800c20:	48 98                	cltq   
  800c22:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800c26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800c2a:	c9                   	leaveq 
  800c2b:	c3                   	retq   

0000000000800c2c <vprintfmt>:
  800c2c:	55                   	push   %rbp
  800c2d:	48 89 e5             	mov    %rsp,%rbp
  800c30:	41 54                	push   %r12
  800c32:	53                   	push   %rbx
  800c33:	48 83 ec 60          	sub    $0x60,%rsp
  800c37:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800c3b:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800c3f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c43:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800c47:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c4b:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800c4f:	48 8b 0a             	mov    (%rdx),%rcx
  800c52:	48 89 08             	mov    %rcx,(%rax)
  800c55:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800c59:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800c5d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800c61:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800c65:	eb 17                	jmp    800c7e <vprintfmt+0x52>
  800c67:	85 db                	test   %ebx,%ebx
  800c69:	0f 84 cc 04 00 00    	je     80113b <vprintfmt+0x50f>
  800c6f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c73:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c77:	48 89 d6             	mov    %rdx,%rsi
  800c7a:	89 df                	mov    %ebx,%edi
  800c7c:	ff d0                	callq  *%rax
  800c7e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c82:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c86:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c8a:	0f b6 00             	movzbl (%rax),%eax
  800c8d:	0f b6 d8             	movzbl %al,%ebx
  800c90:	83 fb 25             	cmp    $0x25,%ebx
  800c93:	75 d2                	jne    800c67 <vprintfmt+0x3b>
  800c95:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800c99:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800ca0:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800ca7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800cae:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800cb5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800cb9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800cbd:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800cc1:	0f b6 00             	movzbl (%rax),%eax
  800cc4:	0f b6 d8             	movzbl %al,%ebx
  800cc7:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800cca:	83 f8 55             	cmp    $0x55,%eax
  800ccd:	0f 87 34 04 00 00    	ja     801107 <vprintfmt+0x4db>
  800cd3:	89 c0                	mov    %eax,%eax
  800cd5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800cdc:	00 
  800cdd:	48 b8 78 50 80 00 00 	movabs $0x805078,%rax
  800ce4:	00 00 00 
  800ce7:	48 01 d0             	add    %rdx,%rax
  800cea:	48 8b 00             	mov    (%rax),%rax
  800ced:	ff e0                	jmpq   *%rax
  800cef:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800cf3:	eb c0                	jmp    800cb5 <vprintfmt+0x89>
  800cf5:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800cf9:	eb ba                	jmp    800cb5 <vprintfmt+0x89>
  800cfb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800d02:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800d05:	89 d0                	mov    %edx,%eax
  800d07:	c1 e0 02             	shl    $0x2,%eax
  800d0a:	01 d0                	add    %edx,%eax
  800d0c:	01 c0                	add    %eax,%eax
  800d0e:	01 d8                	add    %ebx,%eax
  800d10:	83 e8 30             	sub    $0x30,%eax
  800d13:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800d16:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d1a:	0f b6 00             	movzbl (%rax),%eax
  800d1d:	0f be d8             	movsbl %al,%ebx
  800d20:	83 fb 2f             	cmp    $0x2f,%ebx
  800d23:	7e 0c                	jle    800d31 <vprintfmt+0x105>
  800d25:	83 fb 39             	cmp    $0x39,%ebx
  800d28:	7f 07                	jg     800d31 <vprintfmt+0x105>
  800d2a:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800d2f:	eb d1                	jmp    800d02 <vprintfmt+0xd6>
  800d31:	eb 58                	jmp    800d8b <vprintfmt+0x15f>
  800d33:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d36:	83 f8 30             	cmp    $0x30,%eax
  800d39:	73 17                	jae    800d52 <vprintfmt+0x126>
  800d3b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d3f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d42:	89 c0                	mov    %eax,%eax
  800d44:	48 01 d0             	add    %rdx,%rax
  800d47:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d4a:	83 c2 08             	add    $0x8,%edx
  800d4d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d50:	eb 0f                	jmp    800d61 <vprintfmt+0x135>
  800d52:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d56:	48 89 d0             	mov    %rdx,%rax
  800d59:	48 83 c2 08          	add    $0x8,%rdx
  800d5d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d61:	8b 00                	mov    (%rax),%eax
  800d63:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800d66:	eb 23                	jmp    800d8b <vprintfmt+0x15f>
  800d68:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d6c:	79 0c                	jns    800d7a <vprintfmt+0x14e>
  800d6e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800d75:	e9 3b ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800d7a:	e9 36 ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800d7f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800d86:	e9 2a ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800d8b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d8f:	79 12                	jns    800da3 <vprintfmt+0x177>
  800d91:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800d94:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800d97:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800d9e:	e9 12 ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800da3:	e9 0d ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800da8:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800dac:	e9 04 ff ff ff       	jmpq   800cb5 <vprintfmt+0x89>
  800db1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800db4:	83 f8 30             	cmp    $0x30,%eax
  800db7:	73 17                	jae    800dd0 <vprintfmt+0x1a4>
  800db9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800dbd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800dc0:	89 c0                	mov    %eax,%eax
  800dc2:	48 01 d0             	add    %rdx,%rax
  800dc5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800dc8:	83 c2 08             	add    $0x8,%edx
  800dcb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800dce:	eb 0f                	jmp    800ddf <vprintfmt+0x1b3>
  800dd0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800dd4:	48 89 d0             	mov    %rdx,%rax
  800dd7:	48 83 c2 08          	add    $0x8,%rdx
  800ddb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ddf:	8b 10                	mov    (%rax),%edx
  800de1:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800de5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800de9:	48 89 ce             	mov    %rcx,%rsi
  800dec:	89 d7                	mov    %edx,%edi
  800dee:	ff d0                	callq  *%rax
  800df0:	e9 40 03 00 00       	jmpq   801135 <vprintfmt+0x509>
  800df5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800df8:	83 f8 30             	cmp    $0x30,%eax
  800dfb:	73 17                	jae    800e14 <vprintfmt+0x1e8>
  800dfd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e01:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e04:	89 c0                	mov    %eax,%eax
  800e06:	48 01 d0             	add    %rdx,%rax
  800e09:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e0c:	83 c2 08             	add    $0x8,%edx
  800e0f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e12:	eb 0f                	jmp    800e23 <vprintfmt+0x1f7>
  800e14:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e18:	48 89 d0             	mov    %rdx,%rax
  800e1b:	48 83 c2 08          	add    $0x8,%rdx
  800e1f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e23:	8b 18                	mov    (%rax),%ebx
  800e25:	85 db                	test   %ebx,%ebx
  800e27:	79 02                	jns    800e2b <vprintfmt+0x1ff>
  800e29:	f7 db                	neg    %ebx
  800e2b:	83 fb 15             	cmp    $0x15,%ebx
  800e2e:	7f 16                	jg     800e46 <vprintfmt+0x21a>
  800e30:	48 b8 a0 4f 80 00 00 	movabs $0x804fa0,%rax
  800e37:	00 00 00 
  800e3a:	48 63 d3             	movslq %ebx,%rdx
  800e3d:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800e41:	4d 85 e4             	test   %r12,%r12
  800e44:	75 2e                	jne    800e74 <vprintfmt+0x248>
  800e46:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e4a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e4e:	89 d9                	mov    %ebx,%ecx
  800e50:	48 ba 61 50 80 00 00 	movabs $0x805061,%rdx
  800e57:	00 00 00 
  800e5a:	48 89 c7             	mov    %rax,%rdi
  800e5d:	b8 00 00 00 00       	mov    $0x0,%eax
  800e62:	49 b8 44 11 80 00 00 	movabs $0x801144,%r8
  800e69:	00 00 00 
  800e6c:	41 ff d0             	callq  *%r8
  800e6f:	e9 c1 02 00 00       	jmpq   801135 <vprintfmt+0x509>
  800e74:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e78:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e7c:	4c 89 e1             	mov    %r12,%rcx
  800e7f:	48 ba 6a 50 80 00 00 	movabs $0x80506a,%rdx
  800e86:	00 00 00 
  800e89:	48 89 c7             	mov    %rax,%rdi
  800e8c:	b8 00 00 00 00       	mov    $0x0,%eax
  800e91:	49 b8 44 11 80 00 00 	movabs $0x801144,%r8
  800e98:	00 00 00 
  800e9b:	41 ff d0             	callq  *%r8
  800e9e:	e9 92 02 00 00       	jmpq   801135 <vprintfmt+0x509>
  800ea3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ea6:	83 f8 30             	cmp    $0x30,%eax
  800ea9:	73 17                	jae    800ec2 <vprintfmt+0x296>
  800eab:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800eaf:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800eb2:	89 c0                	mov    %eax,%eax
  800eb4:	48 01 d0             	add    %rdx,%rax
  800eb7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800eba:	83 c2 08             	add    $0x8,%edx
  800ebd:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ec0:	eb 0f                	jmp    800ed1 <vprintfmt+0x2a5>
  800ec2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ec6:	48 89 d0             	mov    %rdx,%rax
  800ec9:	48 83 c2 08          	add    $0x8,%rdx
  800ecd:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ed1:	4c 8b 20             	mov    (%rax),%r12
  800ed4:	4d 85 e4             	test   %r12,%r12
  800ed7:	75 0a                	jne    800ee3 <vprintfmt+0x2b7>
  800ed9:	49 bc 6d 50 80 00 00 	movabs $0x80506d,%r12
  800ee0:	00 00 00 
  800ee3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ee7:	7e 3f                	jle    800f28 <vprintfmt+0x2fc>
  800ee9:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800eed:	74 39                	je     800f28 <vprintfmt+0x2fc>
  800eef:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ef2:	48 98                	cltq   
  800ef4:	48 89 c6             	mov    %rax,%rsi
  800ef7:	4c 89 e7             	mov    %r12,%rdi
  800efa:	48 b8 f0 13 80 00 00 	movabs $0x8013f0,%rax
  800f01:	00 00 00 
  800f04:	ff d0                	callq  *%rax
  800f06:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800f09:	eb 17                	jmp    800f22 <vprintfmt+0x2f6>
  800f0b:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800f0f:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800f13:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f17:	48 89 ce             	mov    %rcx,%rsi
  800f1a:	89 d7                	mov    %edx,%edi
  800f1c:	ff d0                	callq  *%rax
  800f1e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f22:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800f26:	7f e3                	jg     800f0b <vprintfmt+0x2df>
  800f28:	eb 37                	jmp    800f61 <vprintfmt+0x335>
  800f2a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800f2e:	74 1e                	je     800f4e <vprintfmt+0x322>
  800f30:	83 fb 1f             	cmp    $0x1f,%ebx
  800f33:	7e 05                	jle    800f3a <vprintfmt+0x30e>
  800f35:	83 fb 7e             	cmp    $0x7e,%ebx
  800f38:	7e 14                	jle    800f4e <vprintfmt+0x322>
  800f3a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f3e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f42:	48 89 d6             	mov    %rdx,%rsi
  800f45:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800f4a:	ff d0                	callq  *%rax
  800f4c:	eb 0f                	jmp    800f5d <vprintfmt+0x331>
  800f4e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f52:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f56:	48 89 d6             	mov    %rdx,%rsi
  800f59:	89 df                	mov    %ebx,%edi
  800f5b:	ff d0                	callq  *%rax
  800f5d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f61:	4c 89 e0             	mov    %r12,%rax
  800f64:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800f68:	0f b6 00             	movzbl (%rax),%eax
  800f6b:	0f be d8             	movsbl %al,%ebx
  800f6e:	85 db                	test   %ebx,%ebx
  800f70:	74 10                	je     800f82 <vprintfmt+0x356>
  800f72:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f76:	78 b2                	js     800f2a <vprintfmt+0x2fe>
  800f78:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800f7c:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f80:	79 a8                	jns    800f2a <vprintfmt+0x2fe>
  800f82:	eb 16                	jmp    800f9a <vprintfmt+0x36e>
  800f84:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f88:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f8c:	48 89 d6             	mov    %rdx,%rsi
  800f8f:	bf 20 00 00 00       	mov    $0x20,%edi
  800f94:	ff d0                	callq  *%rax
  800f96:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f9a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800f9e:	7f e4                	jg     800f84 <vprintfmt+0x358>
  800fa0:	e9 90 01 00 00       	jmpq   801135 <vprintfmt+0x509>
  800fa5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800fa9:	be 03 00 00 00       	mov    $0x3,%esi
  800fae:	48 89 c7             	mov    %rax,%rdi
  800fb1:	48 b8 1c 0b 80 00 00 	movabs $0x800b1c,%rax
  800fb8:	00 00 00 
  800fbb:	ff d0                	callq  *%rax
  800fbd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fc1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fc5:	48 85 c0             	test   %rax,%rax
  800fc8:	79 1d                	jns    800fe7 <vprintfmt+0x3bb>
  800fca:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fce:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fd2:	48 89 d6             	mov    %rdx,%rsi
  800fd5:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800fda:	ff d0                	callq  *%rax
  800fdc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe0:	48 f7 d8             	neg    %rax
  800fe3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fe7:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800fee:	e9 d5 00 00 00       	jmpq   8010c8 <vprintfmt+0x49c>
  800ff3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ff7:	be 03 00 00 00       	mov    $0x3,%esi
  800ffc:	48 89 c7             	mov    %rax,%rdi
  800fff:	48 b8 0c 0a 80 00 00 	movabs $0x800a0c,%rax
  801006:	00 00 00 
  801009:	ff d0                	callq  *%rax
  80100b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80100f:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801016:	e9 ad 00 00 00       	jmpq   8010c8 <vprintfmt+0x49c>
  80101b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80101f:	be 03 00 00 00       	mov    $0x3,%esi
  801024:	48 89 c7             	mov    %rax,%rdi
  801027:	48 b8 0c 0a 80 00 00 	movabs $0x800a0c,%rax
  80102e:	00 00 00 
  801031:	ff d0                	callq  *%rax
  801033:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801037:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  80103e:	e9 85 00 00 00       	jmpq   8010c8 <vprintfmt+0x49c>
  801043:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801047:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80104b:	48 89 d6             	mov    %rdx,%rsi
  80104e:	bf 30 00 00 00       	mov    $0x30,%edi
  801053:	ff d0                	callq  *%rax
  801055:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801059:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80105d:	48 89 d6             	mov    %rdx,%rsi
  801060:	bf 78 00 00 00       	mov    $0x78,%edi
  801065:	ff d0                	callq  *%rax
  801067:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80106a:	83 f8 30             	cmp    $0x30,%eax
  80106d:	73 17                	jae    801086 <vprintfmt+0x45a>
  80106f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801073:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801076:	89 c0                	mov    %eax,%eax
  801078:	48 01 d0             	add    %rdx,%rax
  80107b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80107e:	83 c2 08             	add    $0x8,%edx
  801081:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801084:	eb 0f                	jmp    801095 <vprintfmt+0x469>
  801086:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80108a:	48 89 d0             	mov    %rdx,%rax
  80108d:	48 83 c2 08          	add    $0x8,%rdx
  801091:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801095:	48 8b 00             	mov    (%rax),%rax
  801098:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80109c:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8010a3:	eb 23                	jmp    8010c8 <vprintfmt+0x49c>
  8010a5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8010a9:	be 03 00 00 00       	mov    $0x3,%esi
  8010ae:	48 89 c7             	mov    %rax,%rdi
  8010b1:	48 b8 0c 0a 80 00 00 	movabs $0x800a0c,%rax
  8010b8:	00 00 00 
  8010bb:	ff d0                	callq  *%rax
  8010bd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8010c1:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8010c8:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  8010cd:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8010d0:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8010d3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010d7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8010db:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010df:	45 89 c1             	mov    %r8d,%r9d
  8010e2:	41 89 f8             	mov    %edi,%r8d
  8010e5:	48 89 c7             	mov    %rax,%rdi
  8010e8:	48 b8 51 09 80 00 00 	movabs $0x800951,%rax
  8010ef:	00 00 00 
  8010f2:	ff d0                	callq  *%rax
  8010f4:	eb 3f                	jmp    801135 <vprintfmt+0x509>
  8010f6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8010fa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010fe:	48 89 d6             	mov    %rdx,%rsi
  801101:	89 df                	mov    %ebx,%edi
  801103:	ff d0                	callq  *%rax
  801105:	eb 2e                	jmp    801135 <vprintfmt+0x509>
  801107:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80110b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80110f:	48 89 d6             	mov    %rdx,%rsi
  801112:	bf 25 00 00 00       	mov    $0x25,%edi
  801117:	ff d0                	callq  *%rax
  801119:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80111e:	eb 05                	jmp    801125 <vprintfmt+0x4f9>
  801120:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801125:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801129:	48 83 e8 01          	sub    $0x1,%rax
  80112d:	0f b6 00             	movzbl (%rax),%eax
  801130:	3c 25                	cmp    $0x25,%al
  801132:	75 ec                	jne    801120 <vprintfmt+0x4f4>
  801134:	90                   	nop
  801135:	90                   	nop
  801136:	e9 43 fb ff ff       	jmpq   800c7e <vprintfmt+0x52>
  80113b:	48 83 c4 60          	add    $0x60,%rsp
  80113f:	5b                   	pop    %rbx
  801140:	41 5c                	pop    %r12
  801142:	5d                   	pop    %rbp
  801143:	c3                   	retq   

0000000000801144 <printfmt>:
  801144:	55                   	push   %rbp
  801145:	48 89 e5             	mov    %rsp,%rbp
  801148:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  80114f:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801156:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80115d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801164:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80116b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801172:	84 c0                	test   %al,%al
  801174:	74 20                	je     801196 <printfmt+0x52>
  801176:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80117a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80117e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801182:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801186:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80118a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80118e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801192:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801196:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80119d:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  8011a4:	00 00 00 
  8011a7:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  8011ae:	00 00 00 
  8011b1:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8011b5:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8011bc:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8011c3:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8011ca:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  8011d1:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8011d8:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  8011df:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8011e6:	48 89 c7             	mov    %rax,%rdi
  8011e9:	48 b8 2c 0c 80 00 00 	movabs $0x800c2c,%rax
  8011f0:	00 00 00 
  8011f3:	ff d0                	callq  *%rax
  8011f5:	c9                   	leaveq 
  8011f6:	c3                   	retq   

00000000008011f7 <sprintputch>:
  8011f7:	55                   	push   %rbp
  8011f8:	48 89 e5             	mov    %rsp,%rbp
  8011fb:	48 83 ec 10          	sub    $0x10,%rsp
  8011ff:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801202:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801206:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80120a:	8b 40 10             	mov    0x10(%rax),%eax
  80120d:	8d 50 01             	lea    0x1(%rax),%edx
  801210:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801214:	89 50 10             	mov    %edx,0x10(%rax)
  801217:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80121b:	48 8b 10             	mov    (%rax),%rdx
  80121e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801222:	48 8b 40 08          	mov    0x8(%rax),%rax
  801226:	48 39 c2             	cmp    %rax,%rdx
  801229:	73 17                	jae    801242 <sprintputch+0x4b>
  80122b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80122f:	48 8b 00             	mov    (%rax),%rax
  801232:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801236:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80123a:	48 89 0a             	mov    %rcx,(%rdx)
  80123d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801240:	88 10                	mov    %dl,(%rax)
  801242:	c9                   	leaveq 
  801243:	c3                   	retq   

0000000000801244 <vsnprintf>:
  801244:	55                   	push   %rbp
  801245:	48 89 e5             	mov    %rsp,%rbp
  801248:	48 83 ec 50          	sub    $0x50,%rsp
  80124c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801250:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801253:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801257:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80125b:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80125f:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801263:	48 8b 0a             	mov    (%rdx),%rcx
  801266:	48 89 08             	mov    %rcx,(%rax)
  801269:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80126d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801271:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801275:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801279:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80127d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801281:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801284:	48 98                	cltq   
  801286:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80128a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80128e:	48 01 d0             	add    %rdx,%rax
  801291:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801295:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80129c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  8012a1:	74 06                	je     8012a9 <vsnprintf+0x65>
  8012a3:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  8012a7:	7f 07                	jg     8012b0 <vsnprintf+0x6c>
  8012a9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8012ae:	eb 2f                	jmp    8012df <vsnprintf+0x9b>
  8012b0:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  8012b4:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  8012b8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8012bc:	48 89 c6             	mov    %rax,%rsi
  8012bf:	48 bf f7 11 80 00 00 	movabs $0x8011f7,%rdi
  8012c6:	00 00 00 
  8012c9:	48 b8 2c 0c 80 00 00 	movabs $0x800c2c,%rax
  8012d0:	00 00 00 
  8012d3:	ff d0                	callq  *%rax
  8012d5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8012d9:	c6 00 00             	movb   $0x0,(%rax)
  8012dc:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8012df:	c9                   	leaveq 
  8012e0:	c3                   	retq   

00000000008012e1 <snprintf>:
  8012e1:	55                   	push   %rbp
  8012e2:	48 89 e5             	mov    %rsp,%rbp
  8012e5:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8012ec:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8012f3:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8012f9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801300:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801307:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80130e:	84 c0                	test   %al,%al
  801310:	74 20                	je     801332 <snprintf+0x51>
  801312:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801316:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80131a:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80131e:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801322:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801326:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80132a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80132e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801332:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801339:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801340:	00 00 00 
  801343:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80134a:	00 00 00 
  80134d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801351:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801358:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80135f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801366:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80136d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801374:	48 8b 0a             	mov    (%rdx),%rcx
  801377:	48 89 08             	mov    %rcx,(%rax)
  80137a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80137e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801382:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801386:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80138a:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801391:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801398:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80139e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8013a5:	48 89 c7             	mov    %rax,%rdi
  8013a8:	48 b8 44 12 80 00 00 	movabs $0x801244,%rax
  8013af:	00 00 00 
  8013b2:	ff d0                	callq  *%rax
  8013b4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8013ba:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8013c0:	c9                   	leaveq 
  8013c1:	c3                   	retq   

00000000008013c2 <strlen>:
  8013c2:	55                   	push   %rbp
  8013c3:	48 89 e5             	mov    %rsp,%rbp
  8013c6:	48 83 ec 18          	sub    $0x18,%rsp
  8013ca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013ce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8013d5:	eb 09                	jmp    8013e0 <strlen+0x1e>
  8013d7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8013db:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8013e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013e4:	0f b6 00             	movzbl (%rax),%eax
  8013e7:	84 c0                	test   %al,%al
  8013e9:	75 ec                	jne    8013d7 <strlen+0x15>
  8013eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013ee:	c9                   	leaveq 
  8013ef:	c3                   	retq   

00000000008013f0 <strnlen>:
  8013f0:	55                   	push   %rbp
  8013f1:	48 89 e5             	mov    %rsp,%rbp
  8013f4:	48 83 ec 20          	sub    $0x20,%rsp
  8013f8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013fc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801400:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801407:	eb 0e                	jmp    801417 <strnlen+0x27>
  801409:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80140d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801412:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801417:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80141c:	74 0b                	je     801429 <strnlen+0x39>
  80141e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801422:	0f b6 00             	movzbl (%rax),%eax
  801425:	84 c0                	test   %al,%al
  801427:	75 e0                	jne    801409 <strnlen+0x19>
  801429:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80142c:	c9                   	leaveq 
  80142d:	c3                   	retq   

000000000080142e <strcpy>:
  80142e:	55                   	push   %rbp
  80142f:	48 89 e5             	mov    %rsp,%rbp
  801432:	48 83 ec 20          	sub    $0x20,%rsp
  801436:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80143a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80143e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801442:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801446:	90                   	nop
  801447:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80144b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80144f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801453:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801457:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80145b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80145f:	0f b6 12             	movzbl (%rdx),%edx
  801462:	88 10                	mov    %dl,(%rax)
  801464:	0f b6 00             	movzbl (%rax),%eax
  801467:	84 c0                	test   %al,%al
  801469:	75 dc                	jne    801447 <strcpy+0x19>
  80146b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80146f:	c9                   	leaveq 
  801470:	c3                   	retq   

0000000000801471 <strcat>:
  801471:	55                   	push   %rbp
  801472:	48 89 e5             	mov    %rsp,%rbp
  801475:	48 83 ec 20          	sub    $0x20,%rsp
  801479:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80147d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801481:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801485:	48 89 c7             	mov    %rax,%rdi
  801488:	48 b8 c2 13 80 00 00 	movabs $0x8013c2,%rax
  80148f:	00 00 00 
  801492:	ff d0                	callq  *%rax
  801494:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801497:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80149a:	48 63 d0             	movslq %eax,%rdx
  80149d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014a1:	48 01 c2             	add    %rax,%rdx
  8014a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014a8:	48 89 c6             	mov    %rax,%rsi
  8014ab:	48 89 d7             	mov    %rdx,%rdi
  8014ae:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  8014b5:	00 00 00 
  8014b8:	ff d0                	callq  *%rax
  8014ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014be:	c9                   	leaveq 
  8014bf:	c3                   	retq   

00000000008014c0 <strncpy>:
  8014c0:	55                   	push   %rbp
  8014c1:	48 89 e5             	mov    %rsp,%rbp
  8014c4:	48 83 ec 28          	sub    $0x28,%rsp
  8014c8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014cc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014d0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014dc:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8014e3:	00 
  8014e4:	eb 2a                	jmp    801510 <strncpy+0x50>
  8014e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ea:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014ee:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014f2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8014f6:	0f b6 12             	movzbl (%rdx),%edx
  8014f9:	88 10                	mov    %dl,(%rax)
  8014fb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014ff:	0f b6 00             	movzbl (%rax),%eax
  801502:	84 c0                	test   %al,%al
  801504:	74 05                	je     80150b <strncpy+0x4b>
  801506:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80150b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801510:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801514:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801518:	72 cc                	jb     8014e6 <strncpy+0x26>
  80151a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80151e:	c9                   	leaveq 
  80151f:	c3                   	retq   

0000000000801520 <strlcpy>:
  801520:	55                   	push   %rbp
  801521:	48 89 e5             	mov    %rsp,%rbp
  801524:	48 83 ec 28          	sub    $0x28,%rsp
  801528:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80152c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801530:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801534:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801538:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80153c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801541:	74 3d                	je     801580 <strlcpy+0x60>
  801543:	eb 1d                	jmp    801562 <strlcpy+0x42>
  801545:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801549:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80154d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801551:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801555:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801559:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80155d:	0f b6 12             	movzbl (%rdx),%edx
  801560:	88 10                	mov    %dl,(%rax)
  801562:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801567:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80156c:	74 0b                	je     801579 <strlcpy+0x59>
  80156e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801572:	0f b6 00             	movzbl (%rax),%eax
  801575:	84 c0                	test   %al,%al
  801577:	75 cc                	jne    801545 <strlcpy+0x25>
  801579:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80157d:	c6 00 00             	movb   $0x0,(%rax)
  801580:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801584:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801588:	48 29 c2             	sub    %rax,%rdx
  80158b:	48 89 d0             	mov    %rdx,%rax
  80158e:	c9                   	leaveq 
  80158f:	c3                   	retq   

0000000000801590 <strcmp>:
  801590:	55                   	push   %rbp
  801591:	48 89 e5             	mov    %rsp,%rbp
  801594:	48 83 ec 10          	sub    $0x10,%rsp
  801598:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80159c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015a0:	eb 0a                	jmp    8015ac <strcmp+0x1c>
  8015a2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015a7:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b0:	0f b6 00             	movzbl (%rax),%eax
  8015b3:	84 c0                	test   %al,%al
  8015b5:	74 12                	je     8015c9 <strcmp+0x39>
  8015b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015bb:	0f b6 10             	movzbl (%rax),%edx
  8015be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015c2:	0f b6 00             	movzbl (%rax),%eax
  8015c5:	38 c2                	cmp    %al,%dl
  8015c7:	74 d9                	je     8015a2 <strcmp+0x12>
  8015c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015cd:	0f b6 00             	movzbl (%rax),%eax
  8015d0:	0f b6 d0             	movzbl %al,%edx
  8015d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015d7:	0f b6 00             	movzbl (%rax),%eax
  8015da:	0f b6 c0             	movzbl %al,%eax
  8015dd:	29 c2                	sub    %eax,%edx
  8015df:	89 d0                	mov    %edx,%eax
  8015e1:	c9                   	leaveq 
  8015e2:	c3                   	retq   

00000000008015e3 <strncmp>:
  8015e3:	55                   	push   %rbp
  8015e4:	48 89 e5             	mov    %rsp,%rbp
  8015e7:	48 83 ec 18          	sub    $0x18,%rsp
  8015eb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015f3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8015f7:	eb 0f                	jmp    801608 <strncmp+0x25>
  8015f9:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8015fe:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801603:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801608:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80160d:	74 1d                	je     80162c <strncmp+0x49>
  80160f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801613:	0f b6 00             	movzbl (%rax),%eax
  801616:	84 c0                	test   %al,%al
  801618:	74 12                	je     80162c <strncmp+0x49>
  80161a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80161e:	0f b6 10             	movzbl (%rax),%edx
  801621:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801625:	0f b6 00             	movzbl (%rax),%eax
  801628:	38 c2                	cmp    %al,%dl
  80162a:	74 cd                	je     8015f9 <strncmp+0x16>
  80162c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801631:	75 07                	jne    80163a <strncmp+0x57>
  801633:	b8 00 00 00 00       	mov    $0x0,%eax
  801638:	eb 18                	jmp    801652 <strncmp+0x6f>
  80163a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80163e:	0f b6 00             	movzbl (%rax),%eax
  801641:	0f b6 d0             	movzbl %al,%edx
  801644:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801648:	0f b6 00             	movzbl (%rax),%eax
  80164b:	0f b6 c0             	movzbl %al,%eax
  80164e:	29 c2                	sub    %eax,%edx
  801650:	89 d0                	mov    %edx,%eax
  801652:	c9                   	leaveq 
  801653:	c3                   	retq   

0000000000801654 <strchr>:
  801654:	55                   	push   %rbp
  801655:	48 89 e5             	mov    %rsp,%rbp
  801658:	48 83 ec 0c          	sub    $0xc,%rsp
  80165c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801660:	89 f0                	mov    %esi,%eax
  801662:	88 45 f4             	mov    %al,-0xc(%rbp)
  801665:	eb 17                	jmp    80167e <strchr+0x2a>
  801667:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80166b:	0f b6 00             	movzbl (%rax),%eax
  80166e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801671:	75 06                	jne    801679 <strchr+0x25>
  801673:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801677:	eb 15                	jmp    80168e <strchr+0x3a>
  801679:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80167e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801682:	0f b6 00             	movzbl (%rax),%eax
  801685:	84 c0                	test   %al,%al
  801687:	75 de                	jne    801667 <strchr+0x13>
  801689:	b8 00 00 00 00       	mov    $0x0,%eax
  80168e:	c9                   	leaveq 
  80168f:	c3                   	retq   

0000000000801690 <strfind>:
  801690:	55                   	push   %rbp
  801691:	48 89 e5             	mov    %rsp,%rbp
  801694:	48 83 ec 0c          	sub    $0xc,%rsp
  801698:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80169c:	89 f0                	mov    %esi,%eax
  80169e:	88 45 f4             	mov    %al,-0xc(%rbp)
  8016a1:	eb 13                	jmp    8016b6 <strfind+0x26>
  8016a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016a7:	0f b6 00             	movzbl (%rax),%eax
  8016aa:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8016ad:	75 02                	jne    8016b1 <strfind+0x21>
  8016af:	eb 10                	jmp    8016c1 <strfind+0x31>
  8016b1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016ba:	0f b6 00             	movzbl (%rax),%eax
  8016bd:	84 c0                	test   %al,%al
  8016bf:	75 e2                	jne    8016a3 <strfind+0x13>
  8016c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016c5:	c9                   	leaveq 
  8016c6:	c3                   	retq   

00000000008016c7 <memset>:
  8016c7:	55                   	push   %rbp
  8016c8:	48 89 e5             	mov    %rsp,%rbp
  8016cb:	48 83 ec 18          	sub    $0x18,%rsp
  8016cf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016d3:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8016d6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016da:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8016df:	75 06                	jne    8016e7 <memset+0x20>
  8016e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016e5:	eb 69                	jmp    801750 <memset+0x89>
  8016e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016eb:	83 e0 03             	and    $0x3,%eax
  8016ee:	48 85 c0             	test   %rax,%rax
  8016f1:	75 48                	jne    80173b <memset+0x74>
  8016f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016f7:	83 e0 03             	and    $0x3,%eax
  8016fa:	48 85 c0             	test   %rax,%rax
  8016fd:	75 3c                	jne    80173b <memset+0x74>
  8016ff:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801706:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801709:	c1 e0 18             	shl    $0x18,%eax
  80170c:	89 c2                	mov    %eax,%edx
  80170e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801711:	c1 e0 10             	shl    $0x10,%eax
  801714:	09 c2                	or     %eax,%edx
  801716:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801719:	c1 e0 08             	shl    $0x8,%eax
  80171c:	09 d0                	or     %edx,%eax
  80171e:	09 45 f4             	or     %eax,-0xc(%rbp)
  801721:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801725:	48 c1 e8 02          	shr    $0x2,%rax
  801729:	48 89 c1             	mov    %rax,%rcx
  80172c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801730:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801733:	48 89 d7             	mov    %rdx,%rdi
  801736:	fc                   	cld    
  801737:	f3 ab                	rep stos %eax,%es:(%rdi)
  801739:	eb 11                	jmp    80174c <memset+0x85>
  80173b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80173f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801742:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801746:	48 89 d7             	mov    %rdx,%rdi
  801749:	fc                   	cld    
  80174a:	f3 aa                	rep stos %al,%es:(%rdi)
  80174c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801750:	c9                   	leaveq 
  801751:	c3                   	retq   

0000000000801752 <memmove>:
  801752:	55                   	push   %rbp
  801753:	48 89 e5             	mov    %rsp,%rbp
  801756:	48 83 ec 28          	sub    $0x28,%rsp
  80175a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80175e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801762:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801766:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80176a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80176e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801772:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801776:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80177a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80177e:	0f 83 88 00 00 00    	jae    80180c <memmove+0xba>
  801784:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801788:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80178c:	48 01 d0             	add    %rdx,%rax
  80178f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801793:	76 77                	jbe    80180c <memmove+0xba>
  801795:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801799:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80179d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a1:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8017a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017a9:	83 e0 03             	and    $0x3,%eax
  8017ac:	48 85 c0             	test   %rax,%rax
  8017af:	75 3b                	jne    8017ec <memmove+0x9a>
  8017b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b5:	83 e0 03             	and    $0x3,%eax
  8017b8:	48 85 c0             	test   %rax,%rax
  8017bb:	75 2f                	jne    8017ec <memmove+0x9a>
  8017bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c1:	83 e0 03             	and    $0x3,%eax
  8017c4:	48 85 c0             	test   %rax,%rax
  8017c7:	75 23                	jne    8017ec <memmove+0x9a>
  8017c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017cd:	48 83 e8 04          	sub    $0x4,%rax
  8017d1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017d5:	48 83 ea 04          	sub    $0x4,%rdx
  8017d9:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8017dd:	48 c1 e9 02          	shr    $0x2,%rcx
  8017e1:	48 89 c7             	mov    %rax,%rdi
  8017e4:	48 89 d6             	mov    %rdx,%rsi
  8017e7:	fd                   	std    
  8017e8:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8017ea:	eb 1d                	jmp    801809 <memmove+0xb7>
  8017ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017f0:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8017f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017f8:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8017fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801800:	48 89 d7             	mov    %rdx,%rdi
  801803:	48 89 c1             	mov    %rax,%rcx
  801806:	fd                   	std    
  801807:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801809:	fc                   	cld    
  80180a:	eb 57                	jmp    801863 <memmove+0x111>
  80180c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801810:	83 e0 03             	and    $0x3,%eax
  801813:	48 85 c0             	test   %rax,%rax
  801816:	75 36                	jne    80184e <memmove+0xfc>
  801818:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80181c:	83 e0 03             	and    $0x3,%eax
  80181f:	48 85 c0             	test   %rax,%rax
  801822:	75 2a                	jne    80184e <memmove+0xfc>
  801824:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801828:	83 e0 03             	and    $0x3,%eax
  80182b:	48 85 c0             	test   %rax,%rax
  80182e:	75 1e                	jne    80184e <memmove+0xfc>
  801830:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801834:	48 c1 e8 02          	shr    $0x2,%rax
  801838:	48 89 c1             	mov    %rax,%rcx
  80183b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80183f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801843:	48 89 c7             	mov    %rax,%rdi
  801846:	48 89 d6             	mov    %rdx,%rsi
  801849:	fc                   	cld    
  80184a:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80184c:	eb 15                	jmp    801863 <memmove+0x111>
  80184e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801852:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801856:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80185a:	48 89 c7             	mov    %rax,%rdi
  80185d:	48 89 d6             	mov    %rdx,%rsi
  801860:	fc                   	cld    
  801861:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801863:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801867:	c9                   	leaveq 
  801868:	c3                   	retq   

0000000000801869 <memcpy>:
  801869:	55                   	push   %rbp
  80186a:	48 89 e5             	mov    %rsp,%rbp
  80186d:	48 83 ec 18          	sub    $0x18,%rsp
  801871:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801875:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801879:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80187d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801881:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801885:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801889:	48 89 ce             	mov    %rcx,%rsi
  80188c:	48 89 c7             	mov    %rax,%rdi
  80188f:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  801896:	00 00 00 
  801899:	ff d0                	callq  *%rax
  80189b:	c9                   	leaveq 
  80189c:	c3                   	retq   

000000000080189d <memcmp>:
  80189d:	55                   	push   %rbp
  80189e:	48 89 e5             	mov    %rsp,%rbp
  8018a1:	48 83 ec 28          	sub    $0x28,%rsp
  8018a5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018a9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018ad:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018b5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018b9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8018bd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018c1:	eb 36                	jmp    8018f9 <memcmp+0x5c>
  8018c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018c7:	0f b6 10             	movzbl (%rax),%edx
  8018ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018ce:	0f b6 00             	movzbl (%rax),%eax
  8018d1:	38 c2                	cmp    %al,%dl
  8018d3:	74 1a                	je     8018ef <memcmp+0x52>
  8018d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018d9:	0f b6 00             	movzbl (%rax),%eax
  8018dc:	0f b6 d0             	movzbl %al,%edx
  8018df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018e3:	0f b6 00             	movzbl (%rax),%eax
  8018e6:	0f b6 c0             	movzbl %al,%eax
  8018e9:	29 c2                	sub    %eax,%edx
  8018eb:	89 d0                	mov    %edx,%eax
  8018ed:	eb 20                	jmp    80190f <memcmp+0x72>
  8018ef:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8018f4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8018f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018fd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801901:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801905:	48 85 c0             	test   %rax,%rax
  801908:	75 b9                	jne    8018c3 <memcmp+0x26>
  80190a:	b8 00 00 00 00       	mov    $0x0,%eax
  80190f:	c9                   	leaveq 
  801910:	c3                   	retq   

0000000000801911 <memfind>:
  801911:	55                   	push   %rbp
  801912:	48 89 e5             	mov    %rsp,%rbp
  801915:	48 83 ec 28          	sub    $0x28,%rsp
  801919:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80191d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801920:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801924:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801928:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80192c:	48 01 d0             	add    %rdx,%rax
  80192f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801933:	eb 15                	jmp    80194a <memfind+0x39>
  801935:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801939:	0f b6 10             	movzbl (%rax),%edx
  80193c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80193f:	38 c2                	cmp    %al,%dl
  801941:	75 02                	jne    801945 <memfind+0x34>
  801943:	eb 0f                	jmp    801954 <memfind+0x43>
  801945:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80194a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80194e:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801952:	72 e1                	jb     801935 <memfind+0x24>
  801954:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801958:	c9                   	leaveq 
  801959:	c3                   	retq   

000000000080195a <strtol>:
  80195a:	55                   	push   %rbp
  80195b:	48 89 e5             	mov    %rsp,%rbp
  80195e:	48 83 ec 34          	sub    $0x34,%rsp
  801962:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801966:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80196a:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80196d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801974:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80197b:	00 
  80197c:	eb 05                	jmp    801983 <strtol+0x29>
  80197e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801983:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801987:	0f b6 00             	movzbl (%rax),%eax
  80198a:	3c 20                	cmp    $0x20,%al
  80198c:	74 f0                	je     80197e <strtol+0x24>
  80198e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801992:	0f b6 00             	movzbl (%rax),%eax
  801995:	3c 09                	cmp    $0x9,%al
  801997:	74 e5                	je     80197e <strtol+0x24>
  801999:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80199d:	0f b6 00             	movzbl (%rax),%eax
  8019a0:	3c 2b                	cmp    $0x2b,%al
  8019a2:	75 07                	jne    8019ab <strtol+0x51>
  8019a4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019a9:	eb 17                	jmp    8019c2 <strtol+0x68>
  8019ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019af:	0f b6 00             	movzbl (%rax),%eax
  8019b2:	3c 2d                	cmp    $0x2d,%al
  8019b4:	75 0c                	jne    8019c2 <strtol+0x68>
  8019b6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019bb:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8019c2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019c6:	74 06                	je     8019ce <strtol+0x74>
  8019c8:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8019cc:	75 28                	jne    8019f6 <strtol+0x9c>
  8019ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019d2:	0f b6 00             	movzbl (%rax),%eax
  8019d5:	3c 30                	cmp    $0x30,%al
  8019d7:	75 1d                	jne    8019f6 <strtol+0x9c>
  8019d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019dd:	48 83 c0 01          	add    $0x1,%rax
  8019e1:	0f b6 00             	movzbl (%rax),%eax
  8019e4:	3c 78                	cmp    $0x78,%al
  8019e6:	75 0e                	jne    8019f6 <strtol+0x9c>
  8019e8:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8019ed:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8019f4:	eb 2c                	jmp    801a22 <strtol+0xc8>
  8019f6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019fa:	75 19                	jne    801a15 <strtol+0xbb>
  8019fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a00:	0f b6 00             	movzbl (%rax),%eax
  801a03:	3c 30                	cmp    $0x30,%al
  801a05:	75 0e                	jne    801a15 <strtol+0xbb>
  801a07:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a0c:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801a13:	eb 0d                	jmp    801a22 <strtol+0xc8>
  801a15:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801a19:	75 07                	jne    801a22 <strtol+0xc8>
  801a1b:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801a22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a26:	0f b6 00             	movzbl (%rax),%eax
  801a29:	3c 2f                	cmp    $0x2f,%al
  801a2b:	7e 1d                	jle    801a4a <strtol+0xf0>
  801a2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a31:	0f b6 00             	movzbl (%rax),%eax
  801a34:	3c 39                	cmp    $0x39,%al
  801a36:	7f 12                	jg     801a4a <strtol+0xf0>
  801a38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a3c:	0f b6 00             	movzbl (%rax),%eax
  801a3f:	0f be c0             	movsbl %al,%eax
  801a42:	83 e8 30             	sub    $0x30,%eax
  801a45:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a48:	eb 4e                	jmp    801a98 <strtol+0x13e>
  801a4a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a4e:	0f b6 00             	movzbl (%rax),%eax
  801a51:	3c 60                	cmp    $0x60,%al
  801a53:	7e 1d                	jle    801a72 <strtol+0x118>
  801a55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a59:	0f b6 00             	movzbl (%rax),%eax
  801a5c:	3c 7a                	cmp    $0x7a,%al
  801a5e:	7f 12                	jg     801a72 <strtol+0x118>
  801a60:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a64:	0f b6 00             	movzbl (%rax),%eax
  801a67:	0f be c0             	movsbl %al,%eax
  801a6a:	83 e8 57             	sub    $0x57,%eax
  801a6d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a70:	eb 26                	jmp    801a98 <strtol+0x13e>
  801a72:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a76:	0f b6 00             	movzbl (%rax),%eax
  801a79:	3c 40                	cmp    $0x40,%al
  801a7b:	7e 48                	jle    801ac5 <strtol+0x16b>
  801a7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a81:	0f b6 00             	movzbl (%rax),%eax
  801a84:	3c 5a                	cmp    $0x5a,%al
  801a86:	7f 3d                	jg     801ac5 <strtol+0x16b>
  801a88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a8c:	0f b6 00             	movzbl (%rax),%eax
  801a8f:	0f be c0             	movsbl %al,%eax
  801a92:	83 e8 37             	sub    $0x37,%eax
  801a95:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a98:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a9b:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801a9e:	7c 02                	jl     801aa2 <strtol+0x148>
  801aa0:	eb 23                	jmp    801ac5 <strtol+0x16b>
  801aa2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801aa7:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801aaa:	48 98                	cltq   
  801aac:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801ab1:	48 89 c2             	mov    %rax,%rdx
  801ab4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ab7:	48 98                	cltq   
  801ab9:	48 01 d0             	add    %rdx,%rax
  801abc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ac0:	e9 5d ff ff ff       	jmpq   801a22 <strtol+0xc8>
  801ac5:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801aca:	74 0b                	je     801ad7 <strtol+0x17d>
  801acc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801ad0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801ad4:	48 89 10             	mov    %rdx,(%rax)
  801ad7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801adb:	74 09                	je     801ae6 <strtol+0x18c>
  801add:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ae1:	48 f7 d8             	neg    %rax
  801ae4:	eb 04                	jmp    801aea <strtol+0x190>
  801ae6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801aea:	c9                   	leaveq 
  801aeb:	c3                   	retq   

0000000000801aec <strstr>:
  801aec:	55                   	push   %rbp
  801aed:	48 89 e5             	mov    %rsp,%rbp
  801af0:	48 83 ec 30          	sub    $0x30,%rsp
  801af4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801af8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801afc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b00:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b04:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b08:	0f b6 00             	movzbl (%rax),%eax
  801b0b:	88 45 ff             	mov    %al,-0x1(%rbp)
  801b0e:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801b12:	75 06                	jne    801b1a <strstr+0x2e>
  801b14:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b18:	eb 6b                	jmp    801b85 <strstr+0x99>
  801b1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b1e:	48 89 c7             	mov    %rax,%rdi
  801b21:	48 b8 c2 13 80 00 00 	movabs $0x8013c2,%rax
  801b28:	00 00 00 
  801b2b:	ff d0                	callq  *%rax
  801b2d:	48 98                	cltq   
  801b2f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801b33:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b37:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b3b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b3f:	0f b6 00             	movzbl (%rax),%eax
  801b42:	88 45 ef             	mov    %al,-0x11(%rbp)
  801b45:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801b49:	75 07                	jne    801b52 <strstr+0x66>
  801b4b:	b8 00 00 00 00       	mov    $0x0,%eax
  801b50:	eb 33                	jmp    801b85 <strstr+0x99>
  801b52:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801b56:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801b59:	75 d8                	jne    801b33 <strstr+0x47>
  801b5b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b5f:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801b63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b67:	48 89 ce             	mov    %rcx,%rsi
  801b6a:	48 89 c7             	mov    %rax,%rdi
  801b6d:	48 b8 e3 15 80 00 00 	movabs $0x8015e3,%rax
  801b74:	00 00 00 
  801b77:	ff d0                	callq  *%rax
  801b79:	85 c0                	test   %eax,%eax
  801b7b:	75 b6                	jne    801b33 <strstr+0x47>
  801b7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b81:	48 83 e8 01          	sub    $0x1,%rax
  801b85:	c9                   	leaveq 
  801b86:	c3                   	retq   

0000000000801b87 <syscall>:
  801b87:	55                   	push   %rbp
  801b88:	48 89 e5             	mov    %rsp,%rbp
  801b8b:	53                   	push   %rbx
  801b8c:	48 83 ec 48          	sub    $0x48,%rsp
  801b90:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801b93:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801b96:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b9a:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801b9e:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801ba2:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801ba6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801ba9:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801bad:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801bb1:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801bb5:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801bb9:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801bbd:	4c 89 c3             	mov    %r8,%rbx
  801bc0:	cd 30                	int    $0x30
  801bc2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801bc6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801bca:	74 3e                	je     801c0a <syscall+0x83>
  801bcc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801bd1:	7e 37                	jle    801c0a <syscall+0x83>
  801bd3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801bd7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801bda:	49 89 d0             	mov    %rdx,%r8
  801bdd:	89 c1                	mov    %eax,%ecx
  801bdf:	48 ba 28 53 80 00 00 	movabs $0x805328,%rdx
  801be6:	00 00 00 
  801be9:	be 24 00 00 00       	mov    $0x24,%esi
  801bee:	48 bf 45 53 80 00 00 	movabs $0x805345,%rdi
  801bf5:	00 00 00 
  801bf8:	b8 00 00 00 00       	mov    $0x0,%eax
  801bfd:	49 b9 40 06 80 00 00 	movabs $0x800640,%r9
  801c04:	00 00 00 
  801c07:	41 ff d1             	callq  *%r9
  801c0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c0e:	48 83 c4 48          	add    $0x48,%rsp
  801c12:	5b                   	pop    %rbx
  801c13:	5d                   	pop    %rbp
  801c14:	c3                   	retq   

0000000000801c15 <sys_cputs>:
  801c15:	55                   	push   %rbp
  801c16:	48 89 e5             	mov    %rsp,%rbp
  801c19:	48 83 ec 20          	sub    $0x20,%rsp
  801c1d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c21:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c29:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c2d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c34:	00 
  801c35:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c3b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c41:	48 89 d1             	mov    %rdx,%rcx
  801c44:	48 89 c2             	mov    %rax,%rdx
  801c47:	be 00 00 00 00       	mov    $0x0,%esi
  801c4c:	bf 00 00 00 00       	mov    $0x0,%edi
  801c51:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801c58:	00 00 00 
  801c5b:	ff d0                	callq  *%rax
  801c5d:	c9                   	leaveq 
  801c5e:	c3                   	retq   

0000000000801c5f <sys_cgetc>:
  801c5f:	55                   	push   %rbp
  801c60:	48 89 e5             	mov    %rsp,%rbp
  801c63:	48 83 ec 10          	sub    $0x10,%rsp
  801c67:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c6e:	00 
  801c6f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c75:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c7b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c80:	ba 00 00 00 00       	mov    $0x0,%edx
  801c85:	be 00 00 00 00       	mov    $0x0,%esi
  801c8a:	bf 01 00 00 00       	mov    $0x1,%edi
  801c8f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801c96:	00 00 00 
  801c99:	ff d0                	callq  *%rax
  801c9b:	c9                   	leaveq 
  801c9c:	c3                   	retq   

0000000000801c9d <sys_env_destroy>:
  801c9d:	55                   	push   %rbp
  801c9e:	48 89 e5             	mov    %rsp,%rbp
  801ca1:	48 83 ec 10          	sub    $0x10,%rsp
  801ca5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ca8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cab:	48 98                	cltq   
  801cad:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cb4:	00 
  801cb5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cbb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cc1:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cc6:	48 89 c2             	mov    %rax,%rdx
  801cc9:	be 01 00 00 00       	mov    $0x1,%esi
  801cce:	bf 03 00 00 00       	mov    $0x3,%edi
  801cd3:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801cda:	00 00 00 
  801cdd:	ff d0                	callq  *%rax
  801cdf:	c9                   	leaveq 
  801ce0:	c3                   	retq   

0000000000801ce1 <sys_getenvid>:
  801ce1:	55                   	push   %rbp
  801ce2:	48 89 e5             	mov    %rsp,%rbp
  801ce5:	48 83 ec 10          	sub    $0x10,%rsp
  801ce9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cf0:	00 
  801cf1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cf7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cfd:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d02:	ba 00 00 00 00       	mov    $0x0,%edx
  801d07:	be 00 00 00 00       	mov    $0x0,%esi
  801d0c:	bf 02 00 00 00       	mov    $0x2,%edi
  801d11:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801d18:	00 00 00 
  801d1b:	ff d0                	callq  *%rax
  801d1d:	c9                   	leaveq 
  801d1e:	c3                   	retq   

0000000000801d1f <sys_yield>:
  801d1f:	55                   	push   %rbp
  801d20:	48 89 e5             	mov    %rsp,%rbp
  801d23:	48 83 ec 10          	sub    $0x10,%rsp
  801d27:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d2e:	00 
  801d2f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d35:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d3b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d40:	ba 00 00 00 00       	mov    $0x0,%edx
  801d45:	be 00 00 00 00       	mov    $0x0,%esi
  801d4a:	bf 0b 00 00 00       	mov    $0xb,%edi
  801d4f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801d56:	00 00 00 
  801d59:	ff d0                	callq  *%rax
  801d5b:	c9                   	leaveq 
  801d5c:	c3                   	retq   

0000000000801d5d <sys_page_alloc>:
  801d5d:	55                   	push   %rbp
  801d5e:	48 89 e5             	mov    %rsp,%rbp
  801d61:	48 83 ec 20          	sub    $0x20,%rsp
  801d65:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d6c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d6f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d72:	48 63 c8             	movslq %eax,%rcx
  801d75:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d7c:	48 98                	cltq   
  801d7e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d85:	00 
  801d86:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d8c:	49 89 c8             	mov    %rcx,%r8
  801d8f:	48 89 d1             	mov    %rdx,%rcx
  801d92:	48 89 c2             	mov    %rax,%rdx
  801d95:	be 01 00 00 00       	mov    $0x1,%esi
  801d9a:	bf 04 00 00 00       	mov    $0x4,%edi
  801d9f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801da6:	00 00 00 
  801da9:	ff d0                	callq  *%rax
  801dab:	c9                   	leaveq 
  801dac:	c3                   	retq   

0000000000801dad <sys_page_map>:
  801dad:	55                   	push   %rbp
  801dae:	48 89 e5             	mov    %rsp,%rbp
  801db1:	48 83 ec 30          	sub    $0x30,%rsp
  801db5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801db8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dbc:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801dbf:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801dc3:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801dc7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801dca:	48 63 c8             	movslq %eax,%rcx
  801dcd:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801dd1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dd4:	48 63 f0             	movslq %eax,%rsi
  801dd7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ddb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dde:	48 98                	cltq   
  801de0:	48 89 0c 24          	mov    %rcx,(%rsp)
  801de4:	49 89 f9             	mov    %rdi,%r9
  801de7:	49 89 f0             	mov    %rsi,%r8
  801dea:	48 89 d1             	mov    %rdx,%rcx
  801ded:	48 89 c2             	mov    %rax,%rdx
  801df0:	be 01 00 00 00       	mov    $0x1,%esi
  801df5:	bf 05 00 00 00       	mov    $0x5,%edi
  801dfa:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801e01:	00 00 00 
  801e04:	ff d0                	callq  *%rax
  801e06:	c9                   	leaveq 
  801e07:	c3                   	retq   

0000000000801e08 <sys_page_unmap>:
  801e08:	55                   	push   %rbp
  801e09:	48 89 e5             	mov    %rsp,%rbp
  801e0c:	48 83 ec 20          	sub    $0x20,%rsp
  801e10:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e13:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e17:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e1e:	48 98                	cltq   
  801e20:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e27:	00 
  801e28:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e2e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e34:	48 89 d1             	mov    %rdx,%rcx
  801e37:	48 89 c2             	mov    %rax,%rdx
  801e3a:	be 01 00 00 00       	mov    $0x1,%esi
  801e3f:	bf 06 00 00 00       	mov    $0x6,%edi
  801e44:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801e4b:	00 00 00 
  801e4e:	ff d0                	callq  *%rax
  801e50:	c9                   	leaveq 
  801e51:	c3                   	retq   

0000000000801e52 <sys_env_set_status>:
  801e52:	55                   	push   %rbp
  801e53:	48 89 e5             	mov    %rsp,%rbp
  801e56:	48 83 ec 10          	sub    $0x10,%rsp
  801e5a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e5d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801e60:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e63:	48 63 d0             	movslq %eax,%rdx
  801e66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e69:	48 98                	cltq   
  801e6b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e72:	00 
  801e73:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e79:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e7f:	48 89 d1             	mov    %rdx,%rcx
  801e82:	48 89 c2             	mov    %rax,%rdx
  801e85:	be 01 00 00 00       	mov    $0x1,%esi
  801e8a:	bf 08 00 00 00       	mov    $0x8,%edi
  801e8f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801e96:	00 00 00 
  801e99:	ff d0                	callq  *%rax
  801e9b:	c9                   	leaveq 
  801e9c:	c3                   	retq   

0000000000801e9d <sys_env_set_trapframe>:
  801e9d:	55                   	push   %rbp
  801e9e:	48 89 e5             	mov    %rsp,%rbp
  801ea1:	48 83 ec 20          	sub    $0x20,%rsp
  801ea5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ea8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801eac:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eb3:	48 98                	cltq   
  801eb5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ebc:	00 
  801ebd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ec3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ec9:	48 89 d1             	mov    %rdx,%rcx
  801ecc:	48 89 c2             	mov    %rax,%rdx
  801ecf:	be 01 00 00 00       	mov    $0x1,%esi
  801ed4:	bf 09 00 00 00       	mov    $0x9,%edi
  801ed9:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801ee0:	00 00 00 
  801ee3:	ff d0                	callq  *%rax
  801ee5:	c9                   	leaveq 
  801ee6:	c3                   	retq   

0000000000801ee7 <sys_env_set_pgfault_upcall>:
  801ee7:	55                   	push   %rbp
  801ee8:	48 89 e5             	mov    %rsp,%rbp
  801eeb:	48 83 ec 20          	sub    $0x20,%rsp
  801eef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ef2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ef6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801efa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801efd:	48 98                	cltq   
  801eff:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f06:	00 
  801f07:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f0d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f13:	48 89 d1             	mov    %rdx,%rcx
  801f16:	48 89 c2             	mov    %rax,%rdx
  801f19:	be 01 00 00 00       	mov    $0x1,%esi
  801f1e:	bf 0a 00 00 00       	mov    $0xa,%edi
  801f23:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801f2a:	00 00 00 
  801f2d:	ff d0                	callq  *%rax
  801f2f:	c9                   	leaveq 
  801f30:	c3                   	retq   

0000000000801f31 <sys_ipc_try_send>:
  801f31:	55                   	push   %rbp
  801f32:	48 89 e5             	mov    %rsp,%rbp
  801f35:	48 83 ec 20          	sub    $0x20,%rsp
  801f39:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f3c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f40:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801f44:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801f47:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f4a:	48 63 f0             	movslq %eax,%rsi
  801f4d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801f51:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f54:	48 98                	cltq   
  801f56:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f5a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f61:	00 
  801f62:	49 89 f1             	mov    %rsi,%r9
  801f65:	49 89 c8             	mov    %rcx,%r8
  801f68:	48 89 d1             	mov    %rdx,%rcx
  801f6b:	48 89 c2             	mov    %rax,%rdx
  801f6e:	be 00 00 00 00       	mov    $0x0,%esi
  801f73:	bf 0c 00 00 00       	mov    $0xc,%edi
  801f78:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801f7f:	00 00 00 
  801f82:	ff d0                	callq  *%rax
  801f84:	c9                   	leaveq 
  801f85:	c3                   	retq   

0000000000801f86 <sys_ipc_recv>:
  801f86:	55                   	push   %rbp
  801f87:	48 89 e5             	mov    %rsp,%rbp
  801f8a:	48 83 ec 10          	sub    $0x10,%rsp
  801f8e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f96:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f9d:	00 
  801f9e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fa4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801faa:	b9 00 00 00 00       	mov    $0x0,%ecx
  801faf:	48 89 c2             	mov    %rax,%rdx
  801fb2:	be 01 00 00 00       	mov    $0x1,%esi
  801fb7:	bf 0d 00 00 00       	mov    $0xd,%edi
  801fbc:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  801fc3:	00 00 00 
  801fc6:	ff d0                	callq  *%rax
  801fc8:	c9                   	leaveq 
  801fc9:	c3                   	retq   

0000000000801fca <sys_time_msec>:
  801fca:	55                   	push   %rbp
  801fcb:	48 89 e5             	mov    %rsp,%rbp
  801fce:	48 83 ec 10          	sub    $0x10,%rsp
  801fd2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fd9:	00 
  801fda:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fe0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fe6:	b9 00 00 00 00       	mov    $0x0,%ecx
  801feb:	ba 00 00 00 00       	mov    $0x0,%edx
  801ff0:	be 00 00 00 00       	mov    $0x0,%esi
  801ff5:	bf 0e 00 00 00       	mov    $0xe,%edi
  801ffa:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802001:	00 00 00 
  802004:	ff d0                	callq  *%rax
  802006:	c9                   	leaveq 
  802007:	c3                   	retq   

0000000000802008 <sys_net_transmit>:
  802008:	55                   	push   %rbp
  802009:	48 89 e5             	mov    %rsp,%rbp
  80200c:	48 83 ec 20          	sub    $0x20,%rsp
  802010:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802014:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802017:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80201a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80201e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802025:	00 
  802026:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80202c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802032:	48 89 d1             	mov    %rdx,%rcx
  802035:	48 89 c2             	mov    %rax,%rdx
  802038:	be 00 00 00 00       	mov    $0x0,%esi
  80203d:	bf 0f 00 00 00       	mov    $0xf,%edi
  802042:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802049:	00 00 00 
  80204c:	ff d0                	callq  *%rax
  80204e:	c9                   	leaveq 
  80204f:	c3                   	retq   

0000000000802050 <sys_net_receive>:
  802050:	55                   	push   %rbp
  802051:	48 89 e5             	mov    %rsp,%rbp
  802054:	48 83 ec 20          	sub    $0x20,%rsp
  802058:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80205c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80205f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802062:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802066:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80206d:	00 
  80206e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802074:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80207a:	48 89 d1             	mov    %rdx,%rcx
  80207d:	48 89 c2             	mov    %rax,%rdx
  802080:	be 00 00 00 00       	mov    $0x0,%esi
  802085:	bf 10 00 00 00       	mov    $0x10,%edi
  80208a:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802091:	00 00 00 
  802094:	ff d0                	callq  *%rax
  802096:	c9                   	leaveq 
  802097:	c3                   	retq   

0000000000802098 <sys_ept_map>:
  802098:	55                   	push   %rbp
  802099:	48 89 e5             	mov    %rsp,%rbp
  80209c:	48 83 ec 30          	sub    $0x30,%rsp
  8020a0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8020a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020a7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8020aa:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8020ae:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8020b2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8020b5:	48 63 c8             	movslq %eax,%rcx
  8020b8:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8020bc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020bf:	48 63 f0             	movslq %eax,%rsi
  8020c2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020c9:	48 98                	cltq   
  8020cb:	48 89 0c 24          	mov    %rcx,(%rsp)
  8020cf:	49 89 f9             	mov    %rdi,%r9
  8020d2:	49 89 f0             	mov    %rsi,%r8
  8020d5:	48 89 d1             	mov    %rdx,%rcx
  8020d8:	48 89 c2             	mov    %rax,%rdx
  8020db:	be 00 00 00 00       	mov    $0x0,%esi
  8020e0:	bf 11 00 00 00       	mov    $0x11,%edi
  8020e5:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  8020ec:	00 00 00 
  8020ef:	ff d0                	callq  *%rax
  8020f1:	c9                   	leaveq 
  8020f2:	c3                   	retq   

00000000008020f3 <sys_env_mkguest>:
  8020f3:	55                   	push   %rbp
  8020f4:	48 89 e5             	mov    %rsp,%rbp
  8020f7:	48 83 ec 20          	sub    $0x20,%rsp
  8020fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802103:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802107:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80210b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802112:	00 
  802113:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802119:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80211f:	48 89 d1             	mov    %rdx,%rcx
  802122:	48 89 c2             	mov    %rax,%rdx
  802125:	be 00 00 00 00       	mov    $0x0,%esi
  80212a:	bf 12 00 00 00       	mov    $0x12,%edi
  80212f:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802136:	00 00 00 
  802139:	ff d0                	callq  *%rax
  80213b:	c9                   	leaveq 
  80213c:	c3                   	retq   

000000000080213d <sys_vmx_list_vms>:
  80213d:	55                   	push   %rbp
  80213e:	48 89 e5             	mov    %rsp,%rbp
  802141:	48 83 ec 10          	sub    $0x10,%rsp
  802145:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80214c:	00 
  80214d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802153:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802159:	b9 00 00 00 00       	mov    $0x0,%ecx
  80215e:	ba 00 00 00 00       	mov    $0x0,%edx
  802163:	be 00 00 00 00       	mov    $0x0,%esi
  802168:	bf 13 00 00 00       	mov    $0x13,%edi
  80216d:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802174:	00 00 00 
  802177:	ff d0                	callq  *%rax
  802179:	c9                   	leaveq 
  80217a:	c3                   	retq   

000000000080217b <sys_vmx_sel_resume>:
  80217b:	55                   	push   %rbp
  80217c:	48 89 e5             	mov    %rsp,%rbp
  80217f:	48 83 ec 10          	sub    $0x10,%rsp
  802183:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802186:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802189:	48 98                	cltq   
  80218b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802192:	00 
  802193:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802199:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80219f:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021a4:	48 89 c2             	mov    %rax,%rdx
  8021a7:	be 00 00 00 00       	mov    $0x0,%esi
  8021ac:	bf 14 00 00 00       	mov    $0x14,%edi
  8021b1:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  8021b8:	00 00 00 
  8021bb:	ff d0                	callq  *%rax
  8021bd:	c9                   	leaveq 
  8021be:	c3                   	retq   

00000000008021bf <sys_vmx_get_vmdisk_number>:
  8021bf:	55                   	push   %rbp
  8021c0:	48 89 e5             	mov    %rsp,%rbp
  8021c3:	48 83 ec 10          	sub    $0x10,%rsp
  8021c7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021ce:	00 
  8021cf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021d5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021db:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021e0:	ba 00 00 00 00       	mov    $0x0,%edx
  8021e5:	be 00 00 00 00       	mov    $0x0,%esi
  8021ea:	bf 15 00 00 00       	mov    $0x15,%edi
  8021ef:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  8021f6:	00 00 00 
  8021f9:	ff d0                	callq  *%rax
  8021fb:	c9                   	leaveq 
  8021fc:	c3                   	retq   

00000000008021fd <sys_vmx_incr_vmdisk_number>:
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
  802228:	bf 16 00 00 00       	mov    $0x16,%edi
  80222d:	48 b8 87 1b 80 00 00 	movabs $0x801b87,%rax
  802234:	00 00 00 
  802237:	ff d0                	callq  *%rax
  802239:	c9                   	leaveq 
  80223a:	c3                   	retq   

000000000080223b <pgfault>:
  80223b:	55                   	push   %rbp
  80223c:	48 89 e5             	mov    %rsp,%rbp
  80223f:	48 83 ec 30          	sub    $0x30,%rsp
  802243:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802247:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80224b:	48 8b 00             	mov    (%rax),%rax
  80224e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802252:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802256:	48 8b 40 08          	mov    0x8(%rax),%rax
  80225a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80225d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802260:	83 e0 02             	and    $0x2,%eax
  802263:	85 c0                	test   %eax,%eax
  802265:	75 40                	jne    8022a7 <pgfault+0x6c>
  802267:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80226b:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  802272:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802276:	49 89 d0             	mov    %rdx,%r8
  802279:	48 89 c1             	mov    %rax,%rcx
  80227c:	48 ba 58 53 80 00 00 	movabs $0x805358,%rdx
  802283:	00 00 00 
  802286:	be 1f 00 00 00       	mov    $0x1f,%esi
  80228b:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802292:	00 00 00 
  802295:	b8 00 00 00 00       	mov    $0x0,%eax
  80229a:	49 b9 40 06 80 00 00 	movabs $0x800640,%r9
  8022a1:	00 00 00 
  8022a4:	41 ff d1             	callq  *%r9
  8022a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022ab:	48 c1 e8 0c          	shr    $0xc,%rax
  8022af:	48 89 c2             	mov    %rax,%rdx
  8022b2:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022b9:	01 00 00 
  8022bc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022c0:	25 07 08 00 00       	and    $0x807,%eax
  8022c5:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  8022cb:	74 4e                	je     80231b <pgfault+0xe0>
  8022cd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022d1:	48 c1 e8 0c          	shr    $0xc,%rax
  8022d5:	48 89 c2             	mov    %rax,%rdx
  8022d8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022df:	01 00 00 
  8022e2:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8022e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022ea:	49 89 d0             	mov    %rdx,%r8
  8022ed:	48 89 c1             	mov    %rax,%rcx
  8022f0:	48 ba 80 53 80 00 00 	movabs $0x805380,%rdx
  8022f7:	00 00 00 
  8022fa:	be 22 00 00 00       	mov    $0x22,%esi
  8022ff:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802306:	00 00 00 
  802309:	b8 00 00 00 00       	mov    $0x0,%eax
  80230e:	49 b9 40 06 80 00 00 	movabs $0x800640,%r9
  802315:	00 00 00 
  802318:	41 ff d1             	callq  *%r9
  80231b:	ba 07 00 00 00       	mov    $0x7,%edx
  802320:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802325:	bf 00 00 00 00       	mov    $0x0,%edi
  80232a:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  802331:	00 00 00 
  802334:	ff d0                	callq  *%rax
  802336:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802339:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80233d:	79 30                	jns    80236f <pgfault+0x134>
  80233f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802342:	89 c1                	mov    %eax,%ecx
  802344:	48 ba ab 53 80 00 00 	movabs $0x8053ab,%rdx
  80234b:	00 00 00 
  80234e:	be 30 00 00 00       	mov    $0x30,%esi
  802353:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  80235a:	00 00 00 
  80235d:	b8 00 00 00 00       	mov    $0x0,%eax
  802362:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802369:	00 00 00 
  80236c:	41 ff d0             	callq  *%r8
  80236f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802373:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802377:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80237b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802381:	ba 00 10 00 00       	mov    $0x1000,%edx
  802386:	48 89 c6             	mov    %rax,%rsi
  802389:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  80238e:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  802395:	00 00 00 
  802398:	ff d0                	callq  *%rax
  80239a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80239e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8023a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023a6:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8023ac:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8023b2:	48 89 c1             	mov    %rax,%rcx
  8023b5:	ba 00 00 00 00       	mov    $0x0,%edx
  8023ba:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8023bf:	bf 00 00 00 00       	mov    $0x0,%edi
  8023c4:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  8023cb:	00 00 00 
  8023ce:	ff d0                	callq  *%rax
  8023d0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8023d3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023d7:	79 30                	jns    802409 <pgfault+0x1ce>
  8023d9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023dc:	89 c1                	mov    %eax,%ecx
  8023de:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  8023e5:	00 00 00 
  8023e8:	be 35 00 00 00       	mov    $0x35,%esi
  8023ed:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8023f4:	00 00 00 
  8023f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8023fc:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802403:	00 00 00 
  802406:	41 ff d0             	callq  *%r8
  802409:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80240e:	bf 00 00 00 00       	mov    $0x0,%edi
  802413:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  80241a:	00 00 00 
  80241d:	ff d0                	callq  *%rax
  80241f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802422:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802426:	79 30                	jns    802458 <pgfault+0x21d>
  802428:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80242b:	89 c1                	mov    %eax,%ecx
  80242d:	48 ba cf 53 80 00 00 	movabs $0x8053cf,%rdx
  802434:	00 00 00 
  802437:	be 39 00 00 00       	mov    $0x39,%esi
  80243c:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802443:	00 00 00 
  802446:	b8 00 00 00 00       	mov    $0x0,%eax
  80244b:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802452:	00 00 00 
  802455:	41 ff d0             	callq  *%r8
  802458:	c9                   	leaveq 
  802459:	c3                   	retq   

000000000080245a <duppage>:
  80245a:	55                   	push   %rbp
  80245b:	48 89 e5             	mov    %rsp,%rbp
  80245e:	48 83 ec 30          	sub    $0x30,%rsp
  802462:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802465:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802468:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80246b:	c1 e0 0c             	shl    $0xc,%eax
  80246e:	89 c0                	mov    %eax,%eax
  802470:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802474:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80247b:	01 00 00 
  80247e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802481:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802485:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802489:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80248d:	25 02 08 00 00       	and    $0x802,%eax
  802492:	48 85 c0             	test   %rax,%rax
  802495:	74 0e                	je     8024a5 <duppage+0x4b>
  802497:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80249b:	25 00 04 00 00       	and    $0x400,%eax
  8024a0:	48 85 c0             	test   %rax,%rax
  8024a3:	74 70                	je     802515 <duppage+0xbb>
  8024a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024a9:	25 07 0e 00 00       	and    $0xe07,%eax
  8024ae:	89 c6                	mov    %eax,%esi
  8024b0:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8024b4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8024b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024bb:	41 89 f0             	mov    %esi,%r8d
  8024be:	48 89 c6             	mov    %rax,%rsi
  8024c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8024c6:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  8024cd:	00 00 00 
  8024d0:	ff d0                	callq  *%rax
  8024d2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8024d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8024d9:	79 30                	jns    80250b <duppage+0xb1>
  8024db:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024de:	89 c1                	mov    %eax,%ecx
  8024e0:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  8024e7:	00 00 00 
  8024ea:	be 63 00 00 00       	mov    $0x63,%esi
  8024ef:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8024f6:	00 00 00 
  8024f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8024fe:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802505:	00 00 00 
  802508:	41 ff d0             	callq  *%r8
  80250b:	b8 00 00 00 00       	mov    $0x0,%eax
  802510:	e9 c4 00 00 00       	jmpq   8025d9 <duppage+0x17f>
  802515:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802519:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80251c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802520:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802526:	48 89 c6             	mov    %rax,%rsi
  802529:	bf 00 00 00 00       	mov    $0x0,%edi
  80252e:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802535:	00 00 00 
  802538:	ff d0                	callq  *%rax
  80253a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80253d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802541:	79 30                	jns    802573 <duppage+0x119>
  802543:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802546:	89 c1                	mov    %eax,%ecx
  802548:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  80254f:	00 00 00 
  802552:	be 7e 00 00 00       	mov    $0x7e,%esi
  802557:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  80255e:	00 00 00 
  802561:	b8 00 00 00 00       	mov    $0x0,%eax
  802566:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80256d:	00 00 00 
  802570:	41 ff d0             	callq  *%r8
  802573:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802577:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80257b:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802581:	48 89 d1             	mov    %rdx,%rcx
  802584:	ba 00 00 00 00       	mov    $0x0,%edx
  802589:	48 89 c6             	mov    %rax,%rsi
  80258c:	bf 00 00 00 00       	mov    $0x0,%edi
  802591:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802598:	00 00 00 
  80259b:	ff d0                	callq  *%rax
  80259d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8025a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8025a4:	79 30                	jns    8025d6 <duppage+0x17c>
  8025a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025a9:	89 c1                	mov    %eax,%ecx
  8025ab:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  8025b2:	00 00 00 
  8025b5:	be 80 00 00 00       	mov    $0x80,%esi
  8025ba:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8025c1:	00 00 00 
  8025c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8025c9:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8025d0:	00 00 00 
  8025d3:	41 ff d0             	callq  *%r8
  8025d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025d9:	c9                   	leaveq 
  8025da:	c3                   	retq   

00000000008025db <fork>:
  8025db:	55                   	push   %rbp
  8025dc:	48 89 e5             	mov    %rsp,%rbp
  8025df:	48 83 ec 20          	sub    $0x20,%rsp
  8025e3:	48 bf 3b 22 80 00 00 	movabs $0x80223b,%rdi
  8025ea:	00 00 00 
  8025ed:	48 b8 cc 4a 80 00 00 	movabs $0x804acc,%rax
  8025f4:	00 00 00 
  8025f7:	ff d0                	callq  *%rax
  8025f9:	b8 07 00 00 00       	mov    $0x7,%eax
  8025fe:	cd 30                	int    $0x30
  802600:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802603:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802606:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802609:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80260d:	79 08                	jns    802617 <fork+0x3c>
  80260f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802612:	e9 09 02 00 00       	jmpq   802820 <fork+0x245>
  802617:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80261b:	75 3e                	jne    80265b <fork+0x80>
  80261d:	48 b8 e1 1c 80 00 00 	movabs $0x801ce1,%rax
  802624:	00 00 00 
  802627:	ff d0                	callq  *%rax
  802629:	25 ff 03 00 00       	and    $0x3ff,%eax
  80262e:	48 98                	cltq   
  802630:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802637:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80263e:	00 00 00 
  802641:	48 01 c2             	add    %rax,%rdx
  802644:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80264b:	00 00 00 
  80264e:	48 89 10             	mov    %rdx,(%rax)
  802651:	b8 00 00 00 00       	mov    $0x0,%eax
  802656:	e9 c5 01 00 00       	jmpq   802820 <fork+0x245>
  80265b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802662:	e9 a4 00 00 00       	jmpq   80270b <fork+0x130>
  802667:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80266a:	c1 f8 12             	sar    $0x12,%eax
  80266d:	89 c2                	mov    %eax,%edx
  80266f:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802676:	01 00 00 
  802679:	48 63 d2             	movslq %edx,%rdx
  80267c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802680:	83 e0 01             	and    $0x1,%eax
  802683:	48 85 c0             	test   %rax,%rax
  802686:	74 21                	je     8026a9 <fork+0xce>
  802688:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80268b:	c1 f8 09             	sar    $0x9,%eax
  80268e:	89 c2                	mov    %eax,%edx
  802690:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802697:	01 00 00 
  80269a:	48 63 d2             	movslq %edx,%rdx
  80269d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026a1:	83 e0 01             	and    $0x1,%eax
  8026a4:	48 85 c0             	test   %rax,%rax
  8026a7:	75 09                	jne    8026b2 <fork+0xd7>
  8026a9:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8026b0:	eb 59                	jmp    80270b <fork+0x130>
  8026b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026b5:	05 00 02 00 00       	add    $0x200,%eax
  8026ba:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8026bd:	eb 44                	jmp    802703 <fork+0x128>
  8026bf:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8026c6:	01 00 00 
  8026c9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8026cc:	48 63 d2             	movslq %edx,%rdx
  8026cf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026d3:	83 e0 05             	and    $0x5,%eax
  8026d6:	48 83 f8 05          	cmp    $0x5,%rax
  8026da:	74 02                	je     8026de <fork+0x103>
  8026dc:	eb 21                	jmp    8026ff <fork+0x124>
  8026de:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8026e5:	75 02                	jne    8026e9 <fork+0x10e>
  8026e7:	eb 16                	jmp    8026ff <fork+0x124>
  8026e9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8026ec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026ef:	89 d6                	mov    %edx,%esi
  8026f1:	89 c7                	mov    %eax,%edi
  8026f3:	48 b8 5a 24 80 00 00 	movabs $0x80245a,%rax
  8026fa:	00 00 00 
  8026fd:	ff d0                	callq  *%rax
  8026ff:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802703:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802706:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802709:	7c b4                	jl     8026bf <fork+0xe4>
  80270b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80270e:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802713:	0f 86 4e ff ff ff    	jbe    802667 <fork+0x8c>
  802719:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80271c:	ba 07 00 00 00       	mov    $0x7,%edx
  802721:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802726:	89 c7                	mov    %eax,%edi
  802728:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  80272f:	00 00 00 
  802732:	ff d0                	callq  *%rax
  802734:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802737:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80273b:	79 30                	jns    80276d <fork+0x192>
  80273d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802740:	89 c1                	mov    %eax,%ecx
  802742:	48 ba e8 53 80 00 00 	movabs $0x8053e8,%rdx
  802749:	00 00 00 
  80274c:	be bc 00 00 00       	mov    $0xbc,%esi
  802751:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802758:	00 00 00 
  80275b:	b8 00 00 00 00       	mov    $0x0,%eax
  802760:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802767:	00 00 00 
  80276a:	41 ff d0             	callq  *%r8
  80276d:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802774:	00 00 00 
  802777:	48 8b 00             	mov    (%rax),%rax
  80277a:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802781:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802784:	48 89 d6             	mov    %rdx,%rsi
  802787:	89 c7                	mov    %eax,%edi
  802789:	48 b8 e7 1e 80 00 00 	movabs $0x801ee7,%rax
  802790:	00 00 00 
  802793:	ff d0                	callq  *%rax
  802795:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802798:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80279c:	79 30                	jns    8027ce <fork+0x1f3>
  80279e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8027a1:	89 c1                	mov    %eax,%ecx
  8027a3:	48 ba 08 54 80 00 00 	movabs $0x805408,%rdx
  8027aa:	00 00 00 
  8027ad:	be c0 00 00 00       	mov    $0xc0,%esi
  8027b2:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8027b9:	00 00 00 
  8027bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8027c1:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8027c8:	00 00 00 
  8027cb:	41 ff d0             	callq  *%r8
  8027ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027d1:	be 02 00 00 00       	mov    $0x2,%esi
  8027d6:	89 c7                	mov    %eax,%edi
  8027d8:	48 b8 52 1e 80 00 00 	movabs $0x801e52,%rax
  8027df:	00 00 00 
  8027e2:	ff d0                	callq  *%rax
  8027e4:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8027e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8027eb:	79 30                	jns    80281d <fork+0x242>
  8027ed:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8027f0:	89 c1                	mov    %eax,%ecx
  8027f2:	48 ba 27 54 80 00 00 	movabs $0x805427,%rdx
  8027f9:	00 00 00 
  8027fc:	be c5 00 00 00       	mov    $0xc5,%esi
  802801:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802808:	00 00 00 
  80280b:	b8 00 00 00 00       	mov    $0x0,%eax
  802810:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  802817:	00 00 00 
  80281a:	41 ff d0             	callq  *%r8
  80281d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802820:	c9                   	leaveq 
  802821:	c3                   	retq   

0000000000802822 <sfork>:
  802822:	55                   	push   %rbp
  802823:	48 89 e5             	mov    %rsp,%rbp
  802826:	48 ba 3e 54 80 00 00 	movabs $0x80543e,%rdx
  80282d:	00 00 00 
  802830:	be d2 00 00 00       	mov    $0xd2,%esi
  802835:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  80283c:	00 00 00 
  80283f:	b8 00 00 00 00       	mov    $0x0,%eax
  802844:	48 b9 40 06 80 00 00 	movabs $0x800640,%rcx
  80284b:	00 00 00 
  80284e:	ff d1                	callq  *%rcx

0000000000802850 <ipc_recv>:
  802850:	55                   	push   %rbp
  802851:	48 89 e5             	mov    %rsp,%rbp
  802854:	48 83 ec 30          	sub    $0x30,%rsp
  802858:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80285c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802860:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802864:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802869:	75 0e                	jne    802879 <ipc_recv+0x29>
  80286b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802872:	00 00 00 
  802875:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802879:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80287d:	48 89 c7             	mov    %rax,%rdi
  802880:	48 b8 86 1f 80 00 00 	movabs $0x801f86,%rax
  802887:	00 00 00 
  80288a:	ff d0                	callq  *%rax
  80288c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80288f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802893:	79 27                	jns    8028bc <ipc_recv+0x6c>
  802895:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80289a:	74 0a                	je     8028a6 <ipc_recv+0x56>
  80289c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028a0:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8028a6:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8028ab:	74 0a                	je     8028b7 <ipc_recv+0x67>
  8028ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028b1:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8028b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028ba:	eb 53                	jmp    80290f <ipc_recv+0xbf>
  8028bc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8028c1:	74 19                	je     8028dc <ipc_recv+0x8c>
  8028c3:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8028ca:	00 00 00 
  8028cd:	48 8b 00             	mov    (%rax),%rax
  8028d0:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8028d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028da:	89 10                	mov    %edx,(%rax)
  8028dc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8028e1:	74 19                	je     8028fc <ipc_recv+0xac>
  8028e3:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8028ea:	00 00 00 
  8028ed:	48 8b 00             	mov    (%rax),%rax
  8028f0:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8028f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028fa:	89 10                	mov    %edx,(%rax)
  8028fc:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802903:	00 00 00 
  802906:	48 8b 00             	mov    (%rax),%rax
  802909:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  80290f:	c9                   	leaveq 
  802910:	c3                   	retq   

0000000000802911 <ipc_send>:
  802911:	55                   	push   %rbp
  802912:	48 89 e5             	mov    %rsp,%rbp
  802915:	48 83 ec 30          	sub    $0x30,%rsp
  802919:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80291c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80291f:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802923:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802926:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80292b:	75 10                	jne    80293d <ipc_send+0x2c>
  80292d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802934:	00 00 00 
  802937:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80293b:	eb 0e                	jmp    80294b <ipc_send+0x3a>
  80293d:	eb 0c                	jmp    80294b <ipc_send+0x3a>
  80293f:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  802946:	00 00 00 
  802949:	ff d0                	callq  *%rax
  80294b:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80294e:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802951:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802955:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802958:	89 c7                	mov    %eax,%edi
  80295a:	48 b8 31 1f 80 00 00 	movabs $0x801f31,%rax
  802961:	00 00 00 
  802964:	ff d0                	callq  *%rax
  802966:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802969:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80296d:	74 d0                	je     80293f <ipc_send+0x2e>
  80296f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802973:	79 30                	jns    8029a5 <ipc_send+0x94>
  802975:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802978:	89 c1                	mov    %eax,%ecx
  80297a:	48 ba 54 54 80 00 00 	movabs $0x805454,%rdx
  802981:	00 00 00 
  802984:	be 44 00 00 00       	mov    $0x44,%esi
  802989:	48 bf 6a 54 80 00 00 	movabs $0x80546a,%rdi
  802990:	00 00 00 
  802993:	b8 00 00 00 00       	mov    $0x0,%eax
  802998:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  80299f:	00 00 00 
  8029a2:	41 ff d0             	callq  *%r8
  8029a5:	c9                   	leaveq 
  8029a6:	c3                   	retq   

00000000008029a7 <ipc_find_env>:
  8029a7:	55                   	push   %rbp
  8029a8:	48 89 e5             	mov    %rsp,%rbp
  8029ab:	48 83 ec 14          	sub    $0x14,%rsp
  8029af:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029b2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8029b9:	eb 4e                	jmp    802a09 <ipc_find_env+0x62>
  8029bb:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8029c2:	00 00 00 
  8029c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029c8:	48 98                	cltq   
  8029ca:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8029d1:	48 01 d0             	add    %rdx,%rax
  8029d4:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8029da:	8b 00                	mov    (%rax),%eax
  8029dc:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8029df:	75 24                	jne    802a05 <ipc_find_env+0x5e>
  8029e1:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8029e8:	00 00 00 
  8029eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ee:	48 98                	cltq   
  8029f0:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8029f7:	48 01 d0             	add    %rdx,%rax
  8029fa:	48 05 c0 00 00 00    	add    $0xc0,%rax
  802a00:	8b 40 08             	mov    0x8(%rax),%eax
  802a03:	eb 12                	jmp    802a17 <ipc_find_env+0x70>
  802a05:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a09:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802a10:	7e a9                	jle    8029bb <ipc_find_env+0x14>
  802a12:	b8 00 00 00 00       	mov    $0x0,%eax
  802a17:	c9                   	leaveq 
  802a18:	c3                   	retq   

0000000000802a19 <fd2num>:
  802a19:	55                   	push   %rbp
  802a1a:	48 89 e5             	mov    %rsp,%rbp
  802a1d:	48 83 ec 08          	sub    $0x8,%rsp
  802a21:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a25:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802a29:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802a30:	ff ff ff 
  802a33:	48 01 d0             	add    %rdx,%rax
  802a36:	48 c1 e8 0c          	shr    $0xc,%rax
  802a3a:	c9                   	leaveq 
  802a3b:	c3                   	retq   

0000000000802a3c <fd2data>:
  802a3c:	55                   	push   %rbp
  802a3d:	48 89 e5             	mov    %rsp,%rbp
  802a40:	48 83 ec 08          	sub    $0x8,%rsp
  802a44:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a4c:	48 89 c7             	mov    %rax,%rdi
  802a4f:	48 b8 19 2a 80 00 00 	movabs $0x802a19,%rax
  802a56:	00 00 00 
  802a59:	ff d0                	callq  *%rax
  802a5b:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802a61:	48 c1 e0 0c          	shl    $0xc,%rax
  802a65:	c9                   	leaveq 
  802a66:	c3                   	retq   

0000000000802a67 <fd_alloc>:
  802a67:	55                   	push   %rbp
  802a68:	48 89 e5             	mov    %rsp,%rbp
  802a6b:	48 83 ec 18          	sub    $0x18,%rsp
  802a6f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a73:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a7a:	eb 6b                	jmp    802ae7 <fd_alloc+0x80>
  802a7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a7f:	48 98                	cltq   
  802a81:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802a87:	48 c1 e0 0c          	shl    $0xc,%rax
  802a8b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802a8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a93:	48 c1 e8 15          	shr    $0x15,%rax
  802a97:	48 89 c2             	mov    %rax,%rdx
  802a9a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802aa1:	01 00 00 
  802aa4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802aa8:	83 e0 01             	and    $0x1,%eax
  802aab:	48 85 c0             	test   %rax,%rax
  802aae:	74 21                	je     802ad1 <fd_alloc+0x6a>
  802ab0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ab4:	48 c1 e8 0c          	shr    $0xc,%rax
  802ab8:	48 89 c2             	mov    %rax,%rdx
  802abb:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ac2:	01 00 00 
  802ac5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ac9:	83 e0 01             	and    $0x1,%eax
  802acc:	48 85 c0             	test   %rax,%rax
  802acf:	75 12                	jne    802ae3 <fd_alloc+0x7c>
  802ad1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ad5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ad9:	48 89 10             	mov    %rdx,(%rax)
  802adc:	b8 00 00 00 00       	mov    $0x0,%eax
  802ae1:	eb 1a                	jmp    802afd <fd_alloc+0x96>
  802ae3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802ae7:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802aeb:	7e 8f                	jle    802a7c <fd_alloc+0x15>
  802aed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802af1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802af8:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802afd:	c9                   	leaveq 
  802afe:	c3                   	retq   

0000000000802aff <fd_lookup>:
  802aff:	55                   	push   %rbp
  802b00:	48 89 e5             	mov    %rsp,%rbp
  802b03:	48 83 ec 20          	sub    $0x20,%rsp
  802b07:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802b0a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b0e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802b12:	78 06                	js     802b1a <fd_lookup+0x1b>
  802b14:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802b18:	7e 07                	jle    802b21 <fd_lookup+0x22>
  802b1a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b1f:	eb 6c                	jmp    802b8d <fd_lookup+0x8e>
  802b21:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b24:	48 98                	cltq   
  802b26:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802b2c:	48 c1 e0 0c          	shl    $0xc,%rax
  802b30:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802b34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b38:	48 c1 e8 15          	shr    $0x15,%rax
  802b3c:	48 89 c2             	mov    %rax,%rdx
  802b3f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802b46:	01 00 00 
  802b49:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b4d:	83 e0 01             	and    $0x1,%eax
  802b50:	48 85 c0             	test   %rax,%rax
  802b53:	74 21                	je     802b76 <fd_lookup+0x77>
  802b55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b59:	48 c1 e8 0c          	shr    $0xc,%rax
  802b5d:	48 89 c2             	mov    %rax,%rdx
  802b60:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b67:	01 00 00 
  802b6a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b6e:	83 e0 01             	and    $0x1,%eax
  802b71:	48 85 c0             	test   %rax,%rax
  802b74:	75 07                	jne    802b7d <fd_lookup+0x7e>
  802b76:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b7b:	eb 10                	jmp    802b8d <fd_lookup+0x8e>
  802b7d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b81:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802b85:	48 89 10             	mov    %rdx,(%rax)
  802b88:	b8 00 00 00 00       	mov    $0x0,%eax
  802b8d:	c9                   	leaveq 
  802b8e:	c3                   	retq   

0000000000802b8f <fd_close>:
  802b8f:	55                   	push   %rbp
  802b90:	48 89 e5             	mov    %rsp,%rbp
  802b93:	48 83 ec 30          	sub    $0x30,%rsp
  802b97:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802b9b:	89 f0                	mov    %esi,%eax
  802b9d:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802ba0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ba4:	48 89 c7             	mov    %rax,%rdi
  802ba7:	48 b8 19 2a 80 00 00 	movabs $0x802a19,%rax
  802bae:	00 00 00 
  802bb1:	ff d0                	callq  *%rax
  802bb3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802bb7:	48 89 d6             	mov    %rdx,%rsi
  802bba:	89 c7                	mov    %eax,%edi
  802bbc:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  802bc3:	00 00 00 
  802bc6:	ff d0                	callq  *%rax
  802bc8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bcb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bcf:	78 0a                	js     802bdb <fd_close+0x4c>
  802bd1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bd5:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802bd9:	74 12                	je     802bed <fd_close+0x5e>
  802bdb:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802bdf:	74 05                	je     802be6 <fd_close+0x57>
  802be1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802be4:	eb 05                	jmp    802beb <fd_close+0x5c>
  802be6:	b8 00 00 00 00       	mov    $0x0,%eax
  802beb:	eb 69                	jmp    802c56 <fd_close+0xc7>
  802bed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bf1:	8b 00                	mov    (%rax),%eax
  802bf3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802bf7:	48 89 d6             	mov    %rdx,%rsi
  802bfa:	89 c7                	mov    %eax,%edi
  802bfc:	48 b8 58 2c 80 00 00 	movabs $0x802c58,%rax
  802c03:	00 00 00 
  802c06:	ff d0                	callq  *%rax
  802c08:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c0b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c0f:	78 2a                	js     802c3b <fd_close+0xac>
  802c11:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c15:	48 8b 40 20          	mov    0x20(%rax),%rax
  802c19:	48 85 c0             	test   %rax,%rax
  802c1c:	74 16                	je     802c34 <fd_close+0xa5>
  802c1e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c22:	48 8b 40 20          	mov    0x20(%rax),%rax
  802c26:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802c2a:	48 89 d7             	mov    %rdx,%rdi
  802c2d:	ff d0                	callq  *%rax
  802c2f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c32:	eb 07                	jmp    802c3b <fd_close+0xac>
  802c34:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802c3b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c3f:	48 89 c6             	mov    %rax,%rsi
  802c42:	bf 00 00 00 00       	mov    $0x0,%edi
  802c47:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  802c4e:	00 00 00 
  802c51:	ff d0                	callq  *%rax
  802c53:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c56:	c9                   	leaveq 
  802c57:	c3                   	retq   

0000000000802c58 <dev_lookup>:
  802c58:	55                   	push   %rbp
  802c59:	48 89 e5             	mov    %rsp,%rbp
  802c5c:	48 83 ec 20          	sub    $0x20,%rsp
  802c60:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c63:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c67:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802c6e:	eb 41                	jmp    802cb1 <dev_lookup+0x59>
  802c70:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802c77:	00 00 00 
  802c7a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802c7d:	48 63 d2             	movslq %edx,%rdx
  802c80:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c84:	8b 00                	mov    (%rax),%eax
  802c86:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802c89:	75 22                	jne    802cad <dev_lookup+0x55>
  802c8b:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802c92:	00 00 00 
  802c95:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802c98:	48 63 d2             	movslq %edx,%rdx
  802c9b:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802c9f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ca3:	48 89 10             	mov    %rdx,(%rax)
  802ca6:	b8 00 00 00 00       	mov    $0x0,%eax
  802cab:	eb 60                	jmp    802d0d <dev_lookup+0xb5>
  802cad:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802cb1:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802cb8:	00 00 00 
  802cbb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802cbe:	48 63 d2             	movslq %edx,%rdx
  802cc1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802cc5:	48 85 c0             	test   %rax,%rax
  802cc8:	75 a6                	jne    802c70 <dev_lookup+0x18>
  802cca:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802cd1:	00 00 00 
  802cd4:	48 8b 00             	mov    (%rax),%rax
  802cd7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802cdd:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802ce0:	89 c6                	mov    %eax,%esi
  802ce2:	48 bf 78 54 80 00 00 	movabs $0x805478,%rdi
  802ce9:	00 00 00 
  802cec:	b8 00 00 00 00       	mov    $0x0,%eax
  802cf1:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  802cf8:	00 00 00 
  802cfb:	ff d1                	callq  *%rcx
  802cfd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d01:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802d08:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802d0d:	c9                   	leaveq 
  802d0e:	c3                   	retq   

0000000000802d0f <close>:
  802d0f:	55                   	push   %rbp
  802d10:	48 89 e5             	mov    %rsp,%rbp
  802d13:	48 83 ec 20          	sub    $0x20,%rsp
  802d17:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d1a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d1e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d21:	48 89 d6             	mov    %rdx,%rsi
  802d24:	89 c7                	mov    %eax,%edi
  802d26:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  802d2d:	00 00 00 
  802d30:	ff d0                	callq  *%rax
  802d32:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d35:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d39:	79 05                	jns    802d40 <close+0x31>
  802d3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d3e:	eb 18                	jmp    802d58 <close+0x49>
  802d40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d44:	be 01 00 00 00       	mov    $0x1,%esi
  802d49:	48 89 c7             	mov    %rax,%rdi
  802d4c:	48 b8 8f 2b 80 00 00 	movabs $0x802b8f,%rax
  802d53:	00 00 00 
  802d56:	ff d0                	callq  *%rax
  802d58:	c9                   	leaveq 
  802d59:	c3                   	retq   

0000000000802d5a <close_all>:
  802d5a:	55                   	push   %rbp
  802d5b:	48 89 e5             	mov    %rsp,%rbp
  802d5e:	48 83 ec 10          	sub    $0x10,%rsp
  802d62:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d69:	eb 15                	jmp    802d80 <close_all+0x26>
  802d6b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d6e:	89 c7                	mov    %eax,%edi
  802d70:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  802d77:	00 00 00 
  802d7a:	ff d0                	callq  *%rax
  802d7c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802d80:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802d84:	7e e5                	jle    802d6b <close_all+0x11>
  802d86:	c9                   	leaveq 
  802d87:	c3                   	retq   

0000000000802d88 <dup>:
  802d88:	55                   	push   %rbp
  802d89:	48 89 e5             	mov    %rsp,%rbp
  802d8c:	48 83 ec 40          	sub    $0x40,%rsp
  802d90:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802d93:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802d96:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802d9a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802d9d:	48 89 d6             	mov    %rdx,%rsi
  802da0:	89 c7                	mov    %eax,%edi
  802da2:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  802da9:	00 00 00 
  802dac:	ff d0                	callq  *%rax
  802dae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802db1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802db5:	79 08                	jns    802dbf <dup+0x37>
  802db7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dba:	e9 70 01 00 00       	jmpq   802f2f <dup+0x1a7>
  802dbf:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802dc2:	89 c7                	mov    %eax,%edi
  802dc4:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  802dcb:	00 00 00 
  802dce:	ff d0                	callq  *%rax
  802dd0:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802dd3:	48 98                	cltq   
  802dd5:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802ddb:	48 c1 e0 0c          	shl    $0xc,%rax
  802ddf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802de3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802de7:	48 89 c7             	mov    %rax,%rdi
  802dea:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  802df1:	00 00 00 
  802df4:	ff d0                	callq  *%rax
  802df6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802dfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dfe:	48 89 c7             	mov    %rax,%rdi
  802e01:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  802e08:	00 00 00 
  802e0b:	ff d0                	callq  *%rax
  802e0d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802e11:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e15:	48 c1 e8 15          	shr    $0x15,%rax
  802e19:	48 89 c2             	mov    %rax,%rdx
  802e1c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802e23:	01 00 00 
  802e26:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e2a:	83 e0 01             	and    $0x1,%eax
  802e2d:	48 85 c0             	test   %rax,%rax
  802e30:	74 73                	je     802ea5 <dup+0x11d>
  802e32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e36:	48 c1 e8 0c          	shr    $0xc,%rax
  802e3a:	48 89 c2             	mov    %rax,%rdx
  802e3d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e44:	01 00 00 
  802e47:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e4b:	83 e0 01             	and    $0x1,%eax
  802e4e:	48 85 c0             	test   %rax,%rax
  802e51:	74 52                	je     802ea5 <dup+0x11d>
  802e53:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e57:	48 c1 e8 0c          	shr    $0xc,%rax
  802e5b:	48 89 c2             	mov    %rax,%rdx
  802e5e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e65:	01 00 00 
  802e68:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e6c:	25 07 0e 00 00       	and    $0xe07,%eax
  802e71:	89 c1                	mov    %eax,%ecx
  802e73:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e7b:	41 89 c8             	mov    %ecx,%r8d
  802e7e:	48 89 d1             	mov    %rdx,%rcx
  802e81:	ba 00 00 00 00       	mov    $0x0,%edx
  802e86:	48 89 c6             	mov    %rax,%rsi
  802e89:	bf 00 00 00 00       	mov    $0x0,%edi
  802e8e:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802e95:	00 00 00 
  802e98:	ff d0                	callq  *%rax
  802e9a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ea1:	79 02                	jns    802ea5 <dup+0x11d>
  802ea3:	eb 57                	jmp    802efc <dup+0x174>
  802ea5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ea9:	48 c1 e8 0c          	shr    $0xc,%rax
  802ead:	48 89 c2             	mov    %rax,%rdx
  802eb0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802eb7:	01 00 00 
  802eba:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ebe:	25 07 0e 00 00       	and    $0xe07,%eax
  802ec3:	89 c1                	mov    %eax,%ecx
  802ec5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ec9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ecd:	41 89 c8             	mov    %ecx,%r8d
  802ed0:	48 89 d1             	mov    %rdx,%rcx
  802ed3:	ba 00 00 00 00       	mov    $0x0,%edx
  802ed8:	48 89 c6             	mov    %rax,%rsi
  802edb:	bf 00 00 00 00       	mov    $0x0,%edi
  802ee0:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802ee7:	00 00 00 
  802eea:	ff d0                	callq  *%rax
  802eec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ef3:	79 02                	jns    802ef7 <dup+0x16f>
  802ef5:	eb 05                	jmp    802efc <dup+0x174>
  802ef7:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802efa:	eb 33                	jmp    802f2f <dup+0x1a7>
  802efc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f00:	48 89 c6             	mov    %rax,%rsi
  802f03:	bf 00 00 00 00       	mov    $0x0,%edi
  802f08:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  802f0f:	00 00 00 
  802f12:	ff d0                	callq  *%rax
  802f14:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f18:	48 89 c6             	mov    %rax,%rsi
  802f1b:	bf 00 00 00 00       	mov    $0x0,%edi
  802f20:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  802f27:	00 00 00 
  802f2a:	ff d0                	callq  *%rax
  802f2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f2f:	c9                   	leaveq 
  802f30:	c3                   	retq   

0000000000802f31 <read>:
  802f31:	55                   	push   %rbp
  802f32:	48 89 e5             	mov    %rsp,%rbp
  802f35:	48 83 ec 40          	sub    $0x40,%rsp
  802f39:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f3c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f40:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802f44:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f48:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f4b:	48 89 d6             	mov    %rdx,%rsi
  802f4e:	89 c7                	mov    %eax,%edi
  802f50:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  802f57:	00 00 00 
  802f5a:	ff d0                	callq  *%rax
  802f5c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f5f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f63:	78 24                	js     802f89 <read+0x58>
  802f65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f69:	8b 00                	mov    (%rax),%eax
  802f6b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f6f:	48 89 d6             	mov    %rdx,%rsi
  802f72:	89 c7                	mov    %eax,%edi
  802f74:	48 b8 58 2c 80 00 00 	movabs $0x802c58,%rax
  802f7b:	00 00 00 
  802f7e:	ff d0                	callq  *%rax
  802f80:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f83:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f87:	79 05                	jns    802f8e <read+0x5d>
  802f89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f8c:	eb 76                	jmp    803004 <read+0xd3>
  802f8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f92:	8b 40 08             	mov    0x8(%rax),%eax
  802f95:	83 e0 03             	and    $0x3,%eax
  802f98:	83 f8 01             	cmp    $0x1,%eax
  802f9b:	75 3a                	jne    802fd7 <read+0xa6>
  802f9d:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802fa4:	00 00 00 
  802fa7:	48 8b 00             	mov    (%rax),%rax
  802faa:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802fb0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802fb3:	89 c6                	mov    %eax,%esi
  802fb5:	48 bf 97 54 80 00 00 	movabs $0x805497,%rdi
  802fbc:	00 00 00 
  802fbf:	b8 00 00 00 00       	mov    $0x0,%eax
  802fc4:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  802fcb:	00 00 00 
  802fce:	ff d1                	callq  *%rcx
  802fd0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802fd5:	eb 2d                	jmp    803004 <read+0xd3>
  802fd7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fdb:	48 8b 40 10          	mov    0x10(%rax),%rax
  802fdf:	48 85 c0             	test   %rax,%rax
  802fe2:	75 07                	jne    802feb <read+0xba>
  802fe4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802fe9:	eb 19                	jmp    803004 <read+0xd3>
  802feb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fef:	48 8b 40 10          	mov    0x10(%rax),%rax
  802ff3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802ff7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ffb:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802fff:	48 89 cf             	mov    %rcx,%rdi
  803002:	ff d0                	callq  *%rax
  803004:	c9                   	leaveq 
  803005:	c3                   	retq   

0000000000803006 <readn>:
  803006:	55                   	push   %rbp
  803007:	48 89 e5             	mov    %rsp,%rbp
  80300a:	48 83 ec 30          	sub    $0x30,%rsp
  80300e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803011:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803015:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803019:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803020:	eb 49                	jmp    80306b <readn+0x65>
  803022:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803025:	48 98                	cltq   
  803027:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80302b:	48 29 c2             	sub    %rax,%rdx
  80302e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803031:	48 63 c8             	movslq %eax,%rcx
  803034:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803038:	48 01 c1             	add    %rax,%rcx
  80303b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80303e:	48 89 ce             	mov    %rcx,%rsi
  803041:	89 c7                	mov    %eax,%edi
  803043:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  80304a:	00 00 00 
  80304d:	ff d0                	callq  *%rax
  80304f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803052:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803056:	79 05                	jns    80305d <readn+0x57>
  803058:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80305b:	eb 1c                	jmp    803079 <readn+0x73>
  80305d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803061:	75 02                	jne    803065 <readn+0x5f>
  803063:	eb 11                	jmp    803076 <readn+0x70>
  803065:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803068:	01 45 fc             	add    %eax,-0x4(%rbp)
  80306b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80306e:	48 98                	cltq   
  803070:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803074:	72 ac                	jb     803022 <readn+0x1c>
  803076:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803079:	c9                   	leaveq 
  80307a:	c3                   	retq   

000000000080307b <write>:
  80307b:	55                   	push   %rbp
  80307c:	48 89 e5             	mov    %rsp,%rbp
  80307f:	48 83 ec 40          	sub    $0x40,%rsp
  803083:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803086:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80308a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80308e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803092:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803095:	48 89 d6             	mov    %rdx,%rsi
  803098:	89 c7                	mov    %eax,%edi
  80309a:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  8030a1:	00 00 00 
  8030a4:	ff d0                	callq  *%rax
  8030a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030ad:	78 24                	js     8030d3 <write+0x58>
  8030af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030b3:	8b 00                	mov    (%rax),%eax
  8030b5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8030b9:	48 89 d6             	mov    %rdx,%rsi
  8030bc:	89 c7                	mov    %eax,%edi
  8030be:	48 b8 58 2c 80 00 00 	movabs $0x802c58,%rax
  8030c5:	00 00 00 
  8030c8:	ff d0                	callq  *%rax
  8030ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030cd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030d1:	79 05                	jns    8030d8 <write+0x5d>
  8030d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030d6:	eb 75                	jmp    80314d <write+0xd2>
  8030d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030dc:	8b 40 08             	mov    0x8(%rax),%eax
  8030df:	83 e0 03             	and    $0x3,%eax
  8030e2:	85 c0                	test   %eax,%eax
  8030e4:	75 3a                	jne    803120 <write+0xa5>
  8030e6:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8030ed:	00 00 00 
  8030f0:	48 8b 00             	mov    (%rax),%rax
  8030f3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8030f9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8030fc:	89 c6                	mov    %eax,%esi
  8030fe:	48 bf b3 54 80 00 00 	movabs $0x8054b3,%rdi
  803105:	00 00 00 
  803108:	b8 00 00 00 00       	mov    $0x0,%eax
  80310d:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  803114:	00 00 00 
  803117:	ff d1                	callq  *%rcx
  803119:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80311e:	eb 2d                	jmp    80314d <write+0xd2>
  803120:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803124:	48 8b 40 18          	mov    0x18(%rax),%rax
  803128:	48 85 c0             	test   %rax,%rax
  80312b:	75 07                	jne    803134 <write+0xb9>
  80312d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803132:	eb 19                	jmp    80314d <write+0xd2>
  803134:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803138:	48 8b 40 18          	mov    0x18(%rax),%rax
  80313c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803140:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803144:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803148:	48 89 cf             	mov    %rcx,%rdi
  80314b:	ff d0                	callq  *%rax
  80314d:	c9                   	leaveq 
  80314e:	c3                   	retq   

000000000080314f <seek>:
  80314f:	55                   	push   %rbp
  803150:	48 89 e5             	mov    %rsp,%rbp
  803153:	48 83 ec 18          	sub    $0x18,%rsp
  803157:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80315a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80315d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803161:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803164:	48 89 d6             	mov    %rdx,%rsi
  803167:	89 c7                	mov    %eax,%edi
  803169:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  803170:	00 00 00 
  803173:	ff d0                	callq  *%rax
  803175:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803178:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80317c:	79 05                	jns    803183 <seek+0x34>
  80317e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803181:	eb 0f                	jmp    803192 <seek+0x43>
  803183:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803187:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80318a:	89 50 04             	mov    %edx,0x4(%rax)
  80318d:	b8 00 00 00 00       	mov    $0x0,%eax
  803192:	c9                   	leaveq 
  803193:	c3                   	retq   

0000000000803194 <ftruncate>:
  803194:	55                   	push   %rbp
  803195:	48 89 e5             	mov    %rsp,%rbp
  803198:	48 83 ec 30          	sub    $0x30,%rsp
  80319c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80319f:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8031a2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8031a6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8031a9:	48 89 d6             	mov    %rdx,%rsi
  8031ac:	89 c7                	mov    %eax,%edi
  8031ae:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  8031b5:	00 00 00 
  8031b8:	ff d0                	callq  *%rax
  8031ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031c1:	78 24                	js     8031e7 <ftruncate+0x53>
  8031c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031c7:	8b 00                	mov    (%rax),%eax
  8031c9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8031cd:	48 89 d6             	mov    %rdx,%rsi
  8031d0:	89 c7                	mov    %eax,%edi
  8031d2:	48 b8 58 2c 80 00 00 	movabs $0x802c58,%rax
  8031d9:	00 00 00 
  8031dc:	ff d0                	callq  *%rax
  8031de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031e5:	79 05                	jns    8031ec <ftruncate+0x58>
  8031e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031ea:	eb 72                	jmp    80325e <ftruncate+0xca>
  8031ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031f0:	8b 40 08             	mov    0x8(%rax),%eax
  8031f3:	83 e0 03             	and    $0x3,%eax
  8031f6:	85 c0                	test   %eax,%eax
  8031f8:	75 3a                	jne    803234 <ftruncate+0xa0>
  8031fa:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  803201:	00 00 00 
  803204:	48 8b 00             	mov    (%rax),%rax
  803207:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80320d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803210:	89 c6                	mov    %eax,%esi
  803212:	48 bf d0 54 80 00 00 	movabs $0x8054d0,%rdi
  803219:	00 00 00 
  80321c:	b8 00 00 00 00       	mov    $0x0,%eax
  803221:	48 b9 79 08 80 00 00 	movabs $0x800879,%rcx
  803228:	00 00 00 
  80322b:	ff d1                	callq  *%rcx
  80322d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803232:	eb 2a                	jmp    80325e <ftruncate+0xca>
  803234:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803238:	48 8b 40 30          	mov    0x30(%rax),%rax
  80323c:	48 85 c0             	test   %rax,%rax
  80323f:	75 07                	jne    803248 <ftruncate+0xb4>
  803241:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803246:	eb 16                	jmp    80325e <ftruncate+0xca>
  803248:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80324c:	48 8b 40 30          	mov    0x30(%rax),%rax
  803250:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803254:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  803257:	89 ce                	mov    %ecx,%esi
  803259:	48 89 d7             	mov    %rdx,%rdi
  80325c:	ff d0                	callq  *%rax
  80325e:	c9                   	leaveq 
  80325f:	c3                   	retq   

0000000000803260 <fstat>:
  803260:	55                   	push   %rbp
  803261:	48 89 e5             	mov    %rsp,%rbp
  803264:	48 83 ec 30          	sub    $0x30,%rsp
  803268:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80326b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80326f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803273:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803276:	48 89 d6             	mov    %rdx,%rsi
  803279:	89 c7                	mov    %eax,%edi
  80327b:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  803282:	00 00 00 
  803285:	ff d0                	callq  *%rax
  803287:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80328a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80328e:	78 24                	js     8032b4 <fstat+0x54>
  803290:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803294:	8b 00                	mov    (%rax),%eax
  803296:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80329a:	48 89 d6             	mov    %rdx,%rsi
  80329d:	89 c7                	mov    %eax,%edi
  80329f:	48 b8 58 2c 80 00 00 	movabs $0x802c58,%rax
  8032a6:	00 00 00 
  8032a9:	ff d0                	callq  *%rax
  8032ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032ae:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032b2:	79 05                	jns    8032b9 <fstat+0x59>
  8032b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032b7:	eb 5e                	jmp    803317 <fstat+0xb7>
  8032b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032bd:	48 8b 40 28          	mov    0x28(%rax),%rax
  8032c1:	48 85 c0             	test   %rax,%rax
  8032c4:	75 07                	jne    8032cd <fstat+0x6d>
  8032c6:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8032cb:	eb 4a                	jmp    803317 <fstat+0xb7>
  8032cd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032d1:	c6 00 00             	movb   $0x0,(%rax)
  8032d4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032d8:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8032df:	00 00 00 
  8032e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032e6:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8032ed:	00 00 00 
  8032f0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8032f4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032f8:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8032ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803303:	48 8b 40 28          	mov    0x28(%rax),%rax
  803307:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80330b:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80330f:	48 89 ce             	mov    %rcx,%rsi
  803312:	48 89 d7             	mov    %rdx,%rdi
  803315:	ff d0                	callq  *%rax
  803317:	c9                   	leaveq 
  803318:	c3                   	retq   

0000000000803319 <stat>:
  803319:	55                   	push   %rbp
  80331a:	48 89 e5             	mov    %rsp,%rbp
  80331d:	48 83 ec 20          	sub    $0x20,%rsp
  803321:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803325:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803329:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80332d:	be 00 00 00 00       	mov    $0x0,%esi
  803332:	48 89 c7             	mov    %rax,%rdi
  803335:	48 b8 07 34 80 00 00 	movabs $0x803407,%rax
  80333c:	00 00 00 
  80333f:	ff d0                	callq  *%rax
  803341:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803344:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803348:	79 05                	jns    80334f <stat+0x36>
  80334a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80334d:	eb 2f                	jmp    80337e <stat+0x65>
  80334f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803353:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803356:	48 89 d6             	mov    %rdx,%rsi
  803359:	89 c7                	mov    %eax,%edi
  80335b:	48 b8 60 32 80 00 00 	movabs $0x803260,%rax
  803362:	00 00 00 
  803365:	ff d0                	callq  *%rax
  803367:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80336a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80336d:	89 c7                	mov    %eax,%edi
  80336f:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  803376:	00 00 00 
  803379:	ff d0                	callq  *%rax
  80337b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80337e:	c9                   	leaveq 
  80337f:	c3                   	retq   

0000000000803380 <fsipc>:
  803380:	55                   	push   %rbp
  803381:	48 89 e5             	mov    %rsp,%rbp
  803384:	48 83 ec 10          	sub    $0x10,%rsp
  803388:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80338b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80338f:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803396:	00 00 00 
  803399:	8b 00                	mov    (%rax),%eax
  80339b:	85 c0                	test   %eax,%eax
  80339d:	75 1d                	jne    8033bc <fsipc+0x3c>
  80339f:	bf 01 00 00 00       	mov    $0x1,%edi
  8033a4:	48 b8 a7 29 80 00 00 	movabs $0x8029a7,%rax
  8033ab:	00 00 00 
  8033ae:	ff d0                	callq  *%rax
  8033b0:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  8033b7:	00 00 00 
  8033ba:	89 02                	mov    %eax,(%rdx)
  8033bc:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8033c3:	00 00 00 
  8033c6:	8b 00                	mov    (%rax),%eax
  8033c8:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8033cb:	b9 07 00 00 00       	mov    $0x7,%ecx
  8033d0:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8033d7:	00 00 00 
  8033da:	89 c7                	mov    %eax,%edi
  8033dc:	48 b8 11 29 80 00 00 	movabs $0x802911,%rax
  8033e3:	00 00 00 
  8033e6:	ff d0                	callq  *%rax
  8033e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033ec:	ba 00 00 00 00       	mov    $0x0,%edx
  8033f1:	48 89 c6             	mov    %rax,%rsi
  8033f4:	bf 00 00 00 00       	mov    $0x0,%edi
  8033f9:	48 b8 50 28 80 00 00 	movabs $0x802850,%rax
  803400:	00 00 00 
  803403:	ff d0                	callq  *%rax
  803405:	c9                   	leaveq 
  803406:	c3                   	retq   

0000000000803407 <open>:
  803407:	55                   	push   %rbp
  803408:	48 89 e5             	mov    %rsp,%rbp
  80340b:	48 83 ec 20          	sub    $0x20,%rsp
  80340f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803413:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  803416:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80341a:	48 89 c7             	mov    %rax,%rdi
  80341d:	48 b8 c2 13 80 00 00 	movabs $0x8013c2,%rax
  803424:	00 00 00 
  803427:	ff d0                	callq  *%rax
  803429:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80342e:	7e 0a                	jle    80343a <open+0x33>
  803430:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803435:	e9 a5 00 00 00       	jmpq   8034df <open+0xd8>
  80343a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80343e:	48 89 c7             	mov    %rax,%rdi
  803441:	48 b8 67 2a 80 00 00 	movabs $0x802a67,%rax
  803448:	00 00 00 
  80344b:	ff d0                	callq  *%rax
  80344d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803450:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803454:	79 08                	jns    80345e <open+0x57>
  803456:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803459:	e9 81 00 00 00       	jmpq   8034df <open+0xd8>
  80345e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803462:	48 89 c6             	mov    %rax,%rsi
  803465:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  80346c:	00 00 00 
  80346f:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  803476:	00 00 00 
  803479:	ff d0                	callq  *%rax
  80347b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803482:	00 00 00 
  803485:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803488:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80348e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803492:	48 89 c6             	mov    %rax,%rsi
  803495:	bf 01 00 00 00       	mov    $0x1,%edi
  80349a:	48 b8 80 33 80 00 00 	movabs $0x803380,%rax
  8034a1:	00 00 00 
  8034a4:	ff d0                	callq  *%rax
  8034a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034ad:	79 1d                	jns    8034cc <open+0xc5>
  8034af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034b3:	be 00 00 00 00       	mov    $0x0,%esi
  8034b8:	48 89 c7             	mov    %rax,%rdi
  8034bb:	48 b8 8f 2b 80 00 00 	movabs $0x802b8f,%rax
  8034c2:	00 00 00 
  8034c5:	ff d0                	callq  *%rax
  8034c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ca:	eb 13                	jmp    8034df <open+0xd8>
  8034cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034d0:	48 89 c7             	mov    %rax,%rdi
  8034d3:	48 b8 19 2a 80 00 00 	movabs $0x802a19,%rax
  8034da:	00 00 00 
  8034dd:	ff d0                	callq  *%rax
  8034df:	c9                   	leaveq 
  8034e0:	c3                   	retq   

00000000008034e1 <devfile_flush>:
  8034e1:	55                   	push   %rbp
  8034e2:	48 89 e5             	mov    %rsp,%rbp
  8034e5:	48 83 ec 10          	sub    $0x10,%rsp
  8034e9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034f1:	8b 50 0c             	mov    0xc(%rax),%edx
  8034f4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034fb:	00 00 00 
  8034fe:	89 10                	mov    %edx,(%rax)
  803500:	be 00 00 00 00       	mov    $0x0,%esi
  803505:	bf 06 00 00 00       	mov    $0x6,%edi
  80350a:	48 b8 80 33 80 00 00 	movabs $0x803380,%rax
  803511:	00 00 00 
  803514:	ff d0                	callq  *%rax
  803516:	c9                   	leaveq 
  803517:	c3                   	retq   

0000000000803518 <devfile_read>:
  803518:	55                   	push   %rbp
  803519:	48 89 e5             	mov    %rsp,%rbp
  80351c:	48 83 ec 30          	sub    $0x30,%rsp
  803520:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803524:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803528:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80352c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803530:	8b 50 0c             	mov    0xc(%rax),%edx
  803533:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80353a:	00 00 00 
  80353d:	89 10                	mov    %edx,(%rax)
  80353f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803546:	00 00 00 
  803549:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80354d:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803551:	be 00 00 00 00       	mov    $0x0,%esi
  803556:	bf 03 00 00 00       	mov    $0x3,%edi
  80355b:	48 b8 80 33 80 00 00 	movabs $0x803380,%rax
  803562:	00 00 00 
  803565:	ff d0                	callq  *%rax
  803567:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80356a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80356e:	79 08                	jns    803578 <devfile_read+0x60>
  803570:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803573:	e9 a4 00 00 00       	jmpq   80361c <devfile_read+0x104>
  803578:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80357b:	48 98                	cltq   
  80357d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803581:	76 35                	jbe    8035b8 <devfile_read+0xa0>
  803583:	48 b9 f6 54 80 00 00 	movabs $0x8054f6,%rcx
  80358a:	00 00 00 
  80358d:	48 ba fd 54 80 00 00 	movabs $0x8054fd,%rdx
  803594:	00 00 00 
  803597:	be 89 00 00 00       	mov    $0x89,%esi
  80359c:	48 bf 12 55 80 00 00 	movabs $0x805512,%rdi
  8035a3:	00 00 00 
  8035a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8035ab:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8035b2:	00 00 00 
  8035b5:	41 ff d0             	callq  *%r8
  8035b8:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8035bf:	7e 35                	jle    8035f6 <devfile_read+0xde>
  8035c1:	48 b9 20 55 80 00 00 	movabs $0x805520,%rcx
  8035c8:	00 00 00 
  8035cb:	48 ba fd 54 80 00 00 	movabs $0x8054fd,%rdx
  8035d2:	00 00 00 
  8035d5:	be 8a 00 00 00       	mov    $0x8a,%esi
  8035da:	48 bf 12 55 80 00 00 	movabs $0x805512,%rdi
  8035e1:	00 00 00 
  8035e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8035e9:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8035f0:	00 00 00 
  8035f3:	41 ff d0             	callq  *%r8
  8035f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035f9:	48 63 d0             	movslq %eax,%rdx
  8035fc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803600:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803607:	00 00 00 
  80360a:	48 89 c7             	mov    %rax,%rdi
  80360d:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  803614:	00 00 00 
  803617:	ff d0                	callq  *%rax
  803619:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80361c:	c9                   	leaveq 
  80361d:	c3                   	retq   

000000000080361e <devfile_write>:
  80361e:	55                   	push   %rbp
  80361f:	48 89 e5             	mov    %rsp,%rbp
  803622:	48 83 ec 40          	sub    $0x40,%rsp
  803626:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80362a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80362e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803632:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803636:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80363a:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803641:	00 
  803642:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803646:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80364a:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80364f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803653:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803657:	8b 50 0c             	mov    0xc(%rax),%edx
  80365a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803661:	00 00 00 
  803664:	89 10                	mov    %edx,(%rax)
  803666:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80366d:	00 00 00 
  803670:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803674:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803678:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80367c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803680:	48 89 c6             	mov    %rax,%rsi
  803683:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  80368a:	00 00 00 
  80368d:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  803694:	00 00 00 
  803697:	ff d0                	callq  *%rax
  803699:	be 00 00 00 00       	mov    $0x0,%esi
  80369e:	bf 04 00 00 00       	mov    $0x4,%edi
  8036a3:	48 b8 80 33 80 00 00 	movabs $0x803380,%rax
  8036aa:	00 00 00 
  8036ad:	ff d0                	callq  *%rax
  8036af:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036b2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036b6:	79 05                	jns    8036bd <devfile_write+0x9f>
  8036b8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036bb:	eb 43                	jmp    803700 <devfile_write+0xe2>
  8036bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036c0:	48 98                	cltq   
  8036c2:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8036c6:	76 35                	jbe    8036fd <devfile_write+0xdf>
  8036c8:	48 b9 f6 54 80 00 00 	movabs $0x8054f6,%rcx
  8036cf:	00 00 00 
  8036d2:	48 ba fd 54 80 00 00 	movabs $0x8054fd,%rdx
  8036d9:	00 00 00 
  8036dc:	be a8 00 00 00       	mov    $0xa8,%esi
  8036e1:	48 bf 12 55 80 00 00 	movabs $0x805512,%rdi
  8036e8:	00 00 00 
  8036eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8036f0:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8036f7:	00 00 00 
  8036fa:	41 ff d0             	callq  *%r8
  8036fd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803700:	c9                   	leaveq 
  803701:	c3                   	retq   

0000000000803702 <devfile_stat>:
  803702:	55                   	push   %rbp
  803703:	48 89 e5             	mov    %rsp,%rbp
  803706:	48 83 ec 20          	sub    $0x20,%rsp
  80370a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80370e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803712:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803716:	8b 50 0c             	mov    0xc(%rax),%edx
  803719:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803720:	00 00 00 
  803723:	89 10                	mov    %edx,(%rax)
  803725:	be 00 00 00 00       	mov    $0x0,%esi
  80372a:	bf 05 00 00 00       	mov    $0x5,%edi
  80372f:	48 b8 80 33 80 00 00 	movabs $0x803380,%rax
  803736:	00 00 00 
  803739:	ff d0                	callq  *%rax
  80373b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80373e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803742:	79 05                	jns    803749 <devfile_stat+0x47>
  803744:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803747:	eb 56                	jmp    80379f <devfile_stat+0x9d>
  803749:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80374d:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803754:	00 00 00 
  803757:	48 89 c7             	mov    %rax,%rdi
  80375a:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  803761:	00 00 00 
  803764:	ff d0                	callq  *%rax
  803766:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80376d:	00 00 00 
  803770:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803776:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80377a:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803780:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803787:	00 00 00 
  80378a:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803790:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803794:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  80379a:	b8 00 00 00 00       	mov    $0x0,%eax
  80379f:	c9                   	leaveq 
  8037a0:	c3                   	retq   

00000000008037a1 <devfile_trunc>:
  8037a1:	55                   	push   %rbp
  8037a2:	48 89 e5             	mov    %rsp,%rbp
  8037a5:	48 83 ec 10          	sub    $0x10,%rsp
  8037a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037ad:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8037b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037b4:	8b 50 0c             	mov    0xc(%rax),%edx
  8037b7:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037be:	00 00 00 
  8037c1:	89 10                	mov    %edx,(%rax)
  8037c3:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037ca:	00 00 00 
  8037cd:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8037d0:	89 50 04             	mov    %edx,0x4(%rax)
  8037d3:	be 00 00 00 00       	mov    $0x0,%esi
  8037d8:	bf 02 00 00 00       	mov    $0x2,%edi
  8037dd:	48 b8 80 33 80 00 00 	movabs $0x803380,%rax
  8037e4:	00 00 00 
  8037e7:	ff d0                	callq  *%rax
  8037e9:	c9                   	leaveq 
  8037ea:	c3                   	retq   

00000000008037eb <remove>:
  8037eb:	55                   	push   %rbp
  8037ec:	48 89 e5             	mov    %rsp,%rbp
  8037ef:	48 83 ec 10          	sub    $0x10,%rsp
  8037f3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037fb:	48 89 c7             	mov    %rax,%rdi
  8037fe:	48 b8 c2 13 80 00 00 	movabs $0x8013c2,%rax
  803805:	00 00 00 
  803808:	ff d0                	callq  *%rax
  80380a:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80380f:	7e 07                	jle    803818 <remove+0x2d>
  803811:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803816:	eb 33                	jmp    80384b <remove+0x60>
  803818:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80381c:	48 89 c6             	mov    %rax,%rsi
  80381f:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803826:	00 00 00 
  803829:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  803830:	00 00 00 
  803833:	ff d0                	callq  *%rax
  803835:	be 00 00 00 00       	mov    $0x0,%esi
  80383a:	bf 07 00 00 00       	mov    $0x7,%edi
  80383f:	48 b8 80 33 80 00 00 	movabs $0x803380,%rax
  803846:	00 00 00 
  803849:	ff d0                	callq  *%rax
  80384b:	c9                   	leaveq 
  80384c:	c3                   	retq   

000000000080384d <sync>:
  80384d:	55                   	push   %rbp
  80384e:	48 89 e5             	mov    %rsp,%rbp
  803851:	be 00 00 00 00       	mov    $0x0,%esi
  803856:	bf 08 00 00 00       	mov    $0x8,%edi
  80385b:	48 b8 80 33 80 00 00 	movabs $0x803380,%rax
  803862:	00 00 00 
  803865:	ff d0                	callq  *%rax
  803867:	5d                   	pop    %rbp
  803868:	c3                   	retq   

0000000000803869 <copy>:
  803869:	55                   	push   %rbp
  80386a:	48 89 e5             	mov    %rsp,%rbp
  80386d:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803874:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  80387b:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803882:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803889:	be 00 00 00 00       	mov    $0x0,%esi
  80388e:	48 89 c7             	mov    %rax,%rdi
  803891:	48 b8 07 34 80 00 00 	movabs $0x803407,%rax
  803898:	00 00 00 
  80389b:	ff d0                	callq  *%rax
  80389d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038a4:	79 28                	jns    8038ce <copy+0x65>
  8038a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038a9:	89 c6                	mov    %eax,%esi
  8038ab:	48 bf 2c 55 80 00 00 	movabs $0x80552c,%rdi
  8038b2:	00 00 00 
  8038b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8038ba:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  8038c1:	00 00 00 
  8038c4:	ff d2                	callq  *%rdx
  8038c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038c9:	e9 74 01 00 00       	jmpq   803a42 <copy+0x1d9>
  8038ce:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8038d5:	be 01 01 00 00       	mov    $0x101,%esi
  8038da:	48 89 c7             	mov    %rax,%rdi
  8038dd:	48 b8 07 34 80 00 00 	movabs $0x803407,%rax
  8038e4:	00 00 00 
  8038e7:	ff d0                	callq  *%rax
  8038e9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8038ec:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8038f0:	79 39                	jns    80392b <copy+0xc2>
  8038f2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8038f5:	89 c6                	mov    %eax,%esi
  8038f7:	48 bf 42 55 80 00 00 	movabs $0x805542,%rdi
  8038fe:	00 00 00 
  803901:	b8 00 00 00 00       	mov    $0x0,%eax
  803906:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  80390d:	00 00 00 
  803910:	ff d2                	callq  *%rdx
  803912:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803915:	89 c7                	mov    %eax,%edi
  803917:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  80391e:	00 00 00 
  803921:	ff d0                	callq  *%rax
  803923:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803926:	e9 17 01 00 00       	jmpq   803a42 <copy+0x1d9>
  80392b:	eb 74                	jmp    8039a1 <copy+0x138>
  80392d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803930:	48 63 d0             	movslq %eax,%rdx
  803933:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80393a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80393d:	48 89 ce             	mov    %rcx,%rsi
  803940:	89 c7                	mov    %eax,%edi
  803942:	48 b8 7b 30 80 00 00 	movabs $0x80307b,%rax
  803949:	00 00 00 
  80394c:	ff d0                	callq  *%rax
  80394e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803951:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803955:	79 4a                	jns    8039a1 <copy+0x138>
  803957:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80395a:	89 c6                	mov    %eax,%esi
  80395c:	48 bf 5c 55 80 00 00 	movabs $0x80555c,%rdi
  803963:	00 00 00 
  803966:	b8 00 00 00 00       	mov    $0x0,%eax
  80396b:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  803972:	00 00 00 
  803975:	ff d2                	callq  *%rdx
  803977:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80397a:	89 c7                	mov    %eax,%edi
  80397c:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  803983:	00 00 00 
  803986:	ff d0                	callq  *%rax
  803988:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80398b:	89 c7                	mov    %eax,%edi
  80398d:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  803994:	00 00 00 
  803997:	ff d0                	callq  *%rax
  803999:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80399c:	e9 a1 00 00 00       	jmpq   803a42 <copy+0x1d9>
  8039a1:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8039a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039ab:	ba 00 02 00 00       	mov    $0x200,%edx
  8039b0:	48 89 ce             	mov    %rcx,%rsi
  8039b3:	89 c7                	mov    %eax,%edi
  8039b5:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  8039bc:	00 00 00 
  8039bf:	ff d0                	callq  *%rax
  8039c1:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8039c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8039c8:	0f 8f 5f ff ff ff    	jg     80392d <copy+0xc4>
  8039ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8039d2:	79 47                	jns    803a1b <copy+0x1b2>
  8039d4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8039d7:	89 c6                	mov    %eax,%esi
  8039d9:	48 bf 6f 55 80 00 00 	movabs $0x80556f,%rdi
  8039e0:	00 00 00 
  8039e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8039e8:	48 ba 79 08 80 00 00 	movabs $0x800879,%rdx
  8039ef:	00 00 00 
  8039f2:	ff d2                	callq  *%rdx
  8039f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039f7:	89 c7                	mov    %eax,%edi
  8039f9:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  803a00:	00 00 00 
  803a03:	ff d0                	callq  *%rax
  803a05:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a08:	89 c7                	mov    %eax,%edi
  803a0a:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  803a11:	00 00 00 
  803a14:	ff d0                	callq  *%rax
  803a16:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803a19:	eb 27                	jmp    803a42 <copy+0x1d9>
  803a1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a1e:	89 c7                	mov    %eax,%edi
  803a20:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  803a27:	00 00 00 
  803a2a:	ff d0                	callq  *%rax
  803a2c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a2f:	89 c7                	mov    %eax,%edi
  803a31:	48 b8 0f 2d 80 00 00 	movabs $0x802d0f,%rax
  803a38:	00 00 00 
  803a3b:	ff d0                	callq  *%rax
  803a3d:	b8 00 00 00 00       	mov    $0x0,%eax
  803a42:	c9                   	leaveq 
  803a43:	c3                   	retq   

0000000000803a44 <fd2sockid>:
  803a44:	55                   	push   %rbp
  803a45:	48 89 e5             	mov    %rsp,%rbp
  803a48:	48 83 ec 20          	sub    $0x20,%rsp
  803a4c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a4f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803a53:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a56:	48 89 d6             	mov    %rdx,%rsi
  803a59:	89 c7                	mov    %eax,%edi
  803a5b:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  803a62:	00 00 00 
  803a65:	ff d0                	callq  *%rax
  803a67:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a6a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a6e:	79 05                	jns    803a75 <fd2sockid+0x31>
  803a70:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a73:	eb 24                	jmp    803a99 <fd2sockid+0x55>
  803a75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a79:	8b 10                	mov    (%rax),%edx
  803a7b:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803a82:	00 00 00 
  803a85:	8b 00                	mov    (%rax),%eax
  803a87:	39 c2                	cmp    %eax,%edx
  803a89:	74 07                	je     803a92 <fd2sockid+0x4e>
  803a8b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803a90:	eb 07                	jmp    803a99 <fd2sockid+0x55>
  803a92:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a96:	8b 40 0c             	mov    0xc(%rax),%eax
  803a99:	c9                   	leaveq 
  803a9a:	c3                   	retq   

0000000000803a9b <alloc_sockfd>:
  803a9b:	55                   	push   %rbp
  803a9c:	48 89 e5             	mov    %rsp,%rbp
  803a9f:	48 83 ec 20          	sub    $0x20,%rsp
  803aa3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803aa6:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803aaa:	48 89 c7             	mov    %rax,%rdi
  803aad:	48 b8 67 2a 80 00 00 	movabs $0x802a67,%rax
  803ab4:	00 00 00 
  803ab7:	ff d0                	callq  *%rax
  803ab9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803abc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ac0:	78 26                	js     803ae8 <alloc_sockfd+0x4d>
  803ac2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ac6:	ba 07 04 00 00       	mov    $0x407,%edx
  803acb:	48 89 c6             	mov    %rax,%rsi
  803ace:	bf 00 00 00 00       	mov    $0x0,%edi
  803ad3:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  803ada:	00 00 00 
  803add:	ff d0                	callq  *%rax
  803adf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ae2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ae6:	79 16                	jns    803afe <alloc_sockfd+0x63>
  803ae8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803aeb:	89 c7                	mov    %eax,%edi
  803aed:	48 b8 a8 3f 80 00 00 	movabs $0x803fa8,%rax
  803af4:	00 00 00 
  803af7:	ff d0                	callq  *%rax
  803af9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803afc:	eb 3a                	jmp    803b38 <alloc_sockfd+0x9d>
  803afe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b02:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803b09:	00 00 00 
  803b0c:	8b 12                	mov    (%rdx),%edx
  803b0e:	89 10                	mov    %edx,(%rax)
  803b10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b14:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803b1b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b1f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b22:	89 50 0c             	mov    %edx,0xc(%rax)
  803b25:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b29:	48 89 c7             	mov    %rax,%rdi
  803b2c:	48 b8 19 2a 80 00 00 	movabs $0x802a19,%rax
  803b33:	00 00 00 
  803b36:	ff d0                	callq  *%rax
  803b38:	c9                   	leaveq 
  803b39:	c3                   	retq   

0000000000803b3a <accept>:
  803b3a:	55                   	push   %rbp
  803b3b:	48 89 e5             	mov    %rsp,%rbp
  803b3e:	48 83 ec 30          	sub    $0x30,%rsp
  803b42:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b45:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b49:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b4d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b50:	89 c7                	mov    %eax,%edi
  803b52:	48 b8 44 3a 80 00 00 	movabs $0x803a44,%rax
  803b59:	00 00 00 
  803b5c:	ff d0                	callq  *%rax
  803b5e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b61:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b65:	79 05                	jns    803b6c <accept+0x32>
  803b67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b6a:	eb 3b                	jmp    803ba7 <accept+0x6d>
  803b6c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803b70:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803b74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b77:	48 89 ce             	mov    %rcx,%rsi
  803b7a:	89 c7                	mov    %eax,%edi
  803b7c:	48 b8 85 3e 80 00 00 	movabs $0x803e85,%rax
  803b83:	00 00 00 
  803b86:	ff d0                	callq  *%rax
  803b88:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b8b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b8f:	79 05                	jns    803b96 <accept+0x5c>
  803b91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b94:	eb 11                	jmp    803ba7 <accept+0x6d>
  803b96:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b99:	89 c7                	mov    %eax,%edi
  803b9b:	48 b8 9b 3a 80 00 00 	movabs $0x803a9b,%rax
  803ba2:	00 00 00 
  803ba5:	ff d0                	callq  *%rax
  803ba7:	c9                   	leaveq 
  803ba8:	c3                   	retq   

0000000000803ba9 <bind>:
  803ba9:	55                   	push   %rbp
  803baa:	48 89 e5             	mov    %rsp,%rbp
  803bad:	48 83 ec 20          	sub    $0x20,%rsp
  803bb1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bb4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803bb8:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803bbb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bbe:	89 c7                	mov    %eax,%edi
  803bc0:	48 b8 44 3a 80 00 00 	movabs $0x803a44,%rax
  803bc7:	00 00 00 
  803bca:	ff d0                	callq  *%rax
  803bcc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bcf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bd3:	79 05                	jns    803bda <bind+0x31>
  803bd5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd8:	eb 1b                	jmp    803bf5 <bind+0x4c>
  803bda:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803bdd:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803be1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803be4:	48 89 ce             	mov    %rcx,%rsi
  803be7:	89 c7                	mov    %eax,%edi
  803be9:	48 b8 04 3f 80 00 00 	movabs $0x803f04,%rax
  803bf0:	00 00 00 
  803bf3:	ff d0                	callq  *%rax
  803bf5:	c9                   	leaveq 
  803bf6:	c3                   	retq   

0000000000803bf7 <shutdown>:
  803bf7:	55                   	push   %rbp
  803bf8:	48 89 e5             	mov    %rsp,%rbp
  803bfb:	48 83 ec 20          	sub    $0x20,%rsp
  803bff:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c02:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803c05:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c08:	89 c7                	mov    %eax,%edi
  803c0a:	48 b8 44 3a 80 00 00 	movabs $0x803a44,%rax
  803c11:	00 00 00 
  803c14:	ff d0                	callq  *%rax
  803c16:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c19:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c1d:	79 05                	jns    803c24 <shutdown+0x2d>
  803c1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c22:	eb 16                	jmp    803c3a <shutdown+0x43>
  803c24:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c2a:	89 d6                	mov    %edx,%esi
  803c2c:	89 c7                	mov    %eax,%edi
  803c2e:	48 b8 68 3f 80 00 00 	movabs $0x803f68,%rax
  803c35:	00 00 00 
  803c38:	ff d0                	callq  *%rax
  803c3a:	c9                   	leaveq 
  803c3b:	c3                   	retq   

0000000000803c3c <devsock_close>:
  803c3c:	55                   	push   %rbp
  803c3d:	48 89 e5             	mov    %rsp,%rbp
  803c40:	48 83 ec 10          	sub    $0x10,%rsp
  803c44:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c4c:	48 89 c7             	mov    %rax,%rdi
  803c4f:	48 b8 f4 4b 80 00 00 	movabs $0x804bf4,%rax
  803c56:	00 00 00 
  803c59:	ff d0                	callq  *%rax
  803c5b:	83 f8 01             	cmp    $0x1,%eax
  803c5e:	75 17                	jne    803c77 <devsock_close+0x3b>
  803c60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c64:	8b 40 0c             	mov    0xc(%rax),%eax
  803c67:	89 c7                	mov    %eax,%edi
  803c69:	48 b8 a8 3f 80 00 00 	movabs $0x803fa8,%rax
  803c70:	00 00 00 
  803c73:	ff d0                	callq  *%rax
  803c75:	eb 05                	jmp    803c7c <devsock_close+0x40>
  803c77:	b8 00 00 00 00       	mov    $0x0,%eax
  803c7c:	c9                   	leaveq 
  803c7d:	c3                   	retq   

0000000000803c7e <connect>:
  803c7e:	55                   	push   %rbp
  803c7f:	48 89 e5             	mov    %rsp,%rbp
  803c82:	48 83 ec 20          	sub    $0x20,%rsp
  803c86:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c89:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c8d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c90:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c93:	89 c7                	mov    %eax,%edi
  803c95:	48 b8 44 3a 80 00 00 	movabs $0x803a44,%rax
  803c9c:	00 00 00 
  803c9f:	ff d0                	callq  *%rax
  803ca1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ca4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ca8:	79 05                	jns    803caf <connect+0x31>
  803caa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cad:	eb 1b                	jmp    803cca <connect+0x4c>
  803caf:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803cb2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803cb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cb9:	48 89 ce             	mov    %rcx,%rsi
  803cbc:	89 c7                	mov    %eax,%edi
  803cbe:	48 b8 d5 3f 80 00 00 	movabs $0x803fd5,%rax
  803cc5:	00 00 00 
  803cc8:	ff d0                	callq  *%rax
  803cca:	c9                   	leaveq 
  803ccb:	c3                   	retq   

0000000000803ccc <listen>:
  803ccc:	55                   	push   %rbp
  803ccd:	48 89 e5             	mov    %rsp,%rbp
  803cd0:	48 83 ec 20          	sub    $0x20,%rsp
  803cd4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cd7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803cda:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cdd:	89 c7                	mov    %eax,%edi
  803cdf:	48 b8 44 3a 80 00 00 	movabs $0x803a44,%rax
  803ce6:	00 00 00 
  803ce9:	ff d0                	callq  *%rax
  803ceb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cf2:	79 05                	jns    803cf9 <listen+0x2d>
  803cf4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cf7:	eb 16                	jmp    803d0f <listen+0x43>
  803cf9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803cfc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cff:	89 d6                	mov    %edx,%esi
  803d01:	89 c7                	mov    %eax,%edi
  803d03:	48 b8 39 40 80 00 00 	movabs $0x804039,%rax
  803d0a:	00 00 00 
  803d0d:	ff d0                	callq  *%rax
  803d0f:	c9                   	leaveq 
  803d10:	c3                   	retq   

0000000000803d11 <devsock_read>:
  803d11:	55                   	push   %rbp
  803d12:	48 89 e5             	mov    %rsp,%rbp
  803d15:	48 83 ec 20          	sub    $0x20,%rsp
  803d19:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d1d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d21:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803d25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d29:	89 c2                	mov    %eax,%edx
  803d2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d2f:	8b 40 0c             	mov    0xc(%rax),%eax
  803d32:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803d36:	b9 00 00 00 00       	mov    $0x0,%ecx
  803d3b:	89 c7                	mov    %eax,%edi
  803d3d:	48 b8 79 40 80 00 00 	movabs $0x804079,%rax
  803d44:	00 00 00 
  803d47:	ff d0                	callq  *%rax
  803d49:	c9                   	leaveq 
  803d4a:	c3                   	retq   

0000000000803d4b <devsock_write>:
  803d4b:	55                   	push   %rbp
  803d4c:	48 89 e5             	mov    %rsp,%rbp
  803d4f:	48 83 ec 20          	sub    $0x20,%rsp
  803d53:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d57:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d5b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803d5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d63:	89 c2                	mov    %eax,%edx
  803d65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d69:	8b 40 0c             	mov    0xc(%rax),%eax
  803d6c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803d70:	b9 00 00 00 00       	mov    $0x0,%ecx
  803d75:	89 c7                	mov    %eax,%edi
  803d77:	48 b8 45 41 80 00 00 	movabs $0x804145,%rax
  803d7e:	00 00 00 
  803d81:	ff d0                	callq  *%rax
  803d83:	c9                   	leaveq 
  803d84:	c3                   	retq   

0000000000803d85 <devsock_stat>:
  803d85:	55                   	push   %rbp
  803d86:	48 89 e5             	mov    %rsp,%rbp
  803d89:	48 83 ec 10          	sub    $0x10,%rsp
  803d8d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d91:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d99:	48 be 8a 55 80 00 00 	movabs $0x80558a,%rsi
  803da0:	00 00 00 
  803da3:	48 89 c7             	mov    %rax,%rdi
  803da6:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  803dad:	00 00 00 
  803db0:	ff d0                	callq  *%rax
  803db2:	b8 00 00 00 00       	mov    $0x0,%eax
  803db7:	c9                   	leaveq 
  803db8:	c3                   	retq   

0000000000803db9 <socket>:
  803db9:	55                   	push   %rbp
  803dba:	48 89 e5             	mov    %rsp,%rbp
  803dbd:	48 83 ec 20          	sub    $0x20,%rsp
  803dc1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803dc4:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803dc7:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803dca:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803dcd:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803dd0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803dd3:	89 ce                	mov    %ecx,%esi
  803dd5:	89 c7                	mov    %eax,%edi
  803dd7:	48 b8 fd 41 80 00 00 	movabs $0x8041fd,%rax
  803dde:	00 00 00 
  803de1:	ff d0                	callq  *%rax
  803de3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803de6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803dea:	79 05                	jns    803df1 <socket+0x38>
  803dec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803def:	eb 11                	jmp    803e02 <socket+0x49>
  803df1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803df4:	89 c7                	mov    %eax,%edi
  803df6:	48 b8 9b 3a 80 00 00 	movabs $0x803a9b,%rax
  803dfd:	00 00 00 
  803e00:	ff d0                	callq  *%rax
  803e02:	c9                   	leaveq 
  803e03:	c3                   	retq   

0000000000803e04 <nsipc>:
  803e04:	55                   	push   %rbp
  803e05:	48 89 e5             	mov    %rsp,%rbp
  803e08:	48 83 ec 10          	sub    $0x10,%rsp
  803e0c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e0f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803e16:	00 00 00 
  803e19:	8b 00                	mov    (%rax),%eax
  803e1b:	85 c0                	test   %eax,%eax
  803e1d:	75 1d                	jne    803e3c <nsipc+0x38>
  803e1f:	bf 02 00 00 00       	mov    $0x2,%edi
  803e24:	48 b8 a7 29 80 00 00 	movabs $0x8029a7,%rax
  803e2b:	00 00 00 
  803e2e:	ff d0                	callq  *%rax
  803e30:	48 ba 08 80 80 00 00 	movabs $0x808008,%rdx
  803e37:	00 00 00 
  803e3a:	89 02                	mov    %eax,(%rdx)
  803e3c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803e43:	00 00 00 
  803e46:	8b 00                	mov    (%rax),%eax
  803e48:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803e4b:	b9 07 00 00 00       	mov    $0x7,%ecx
  803e50:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803e57:	00 00 00 
  803e5a:	89 c7                	mov    %eax,%edi
  803e5c:	48 b8 11 29 80 00 00 	movabs $0x802911,%rax
  803e63:	00 00 00 
  803e66:	ff d0                	callq  *%rax
  803e68:	ba 00 00 00 00       	mov    $0x0,%edx
  803e6d:	be 00 00 00 00       	mov    $0x0,%esi
  803e72:	bf 00 00 00 00       	mov    $0x0,%edi
  803e77:	48 b8 50 28 80 00 00 	movabs $0x802850,%rax
  803e7e:	00 00 00 
  803e81:	ff d0                	callq  *%rax
  803e83:	c9                   	leaveq 
  803e84:	c3                   	retq   

0000000000803e85 <nsipc_accept>:
  803e85:	55                   	push   %rbp
  803e86:	48 89 e5             	mov    %rsp,%rbp
  803e89:	48 83 ec 30          	sub    $0x30,%rsp
  803e8d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e90:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e94:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e98:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e9f:	00 00 00 
  803ea2:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ea5:	89 10                	mov    %edx,(%rax)
  803ea7:	bf 01 00 00 00       	mov    $0x1,%edi
  803eac:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  803eb3:	00 00 00 
  803eb6:	ff d0                	callq  *%rax
  803eb8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ebb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ebf:	78 3e                	js     803eff <nsipc_accept+0x7a>
  803ec1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ec8:	00 00 00 
  803ecb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ecf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ed3:	8b 40 10             	mov    0x10(%rax),%eax
  803ed6:	89 c2                	mov    %eax,%edx
  803ed8:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803edc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ee0:	48 89 ce             	mov    %rcx,%rsi
  803ee3:	48 89 c7             	mov    %rax,%rdi
  803ee6:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  803eed:	00 00 00 
  803ef0:	ff d0                	callq  *%rax
  803ef2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ef6:	8b 50 10             	mov    0x10(%rax),%edx
  803ef9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803efd:	89 10                	mov    %edx,(%rax)
  803eff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f02:	c9                   	leaveq 
  803f03:	c3                   	retq   

0000000000803f04 <nsipc_bind>:
  803f04:	55                   	push   %rbp
  803f05:	48 89 e5             	mov    %rsp,%rbp
  803f08:	48 83 ec 10          	sub    $0x10,%rsp
  803f0c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f0f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f13:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f16:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f1d:	00 00 00 
  803f20:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f23:	89 10                	mov    %edx,(%rax)
  803f25:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f28:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f2c:	48 89 c6             	mov    %rax,%rsi
  803f2f:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803f36:	00 00 00 
  803f39:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  803f40:	00 00 00 
  803f43:	ff d0                	callq  *%rax
  803f45:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f4c:	00 00 00 
  803f4f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f52:	89 50 14             	mov    %edx,0x14(%rax)
  803f55:	bf 02 00 00 00       	mov    $0x2,%edi
  803f5a:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  803f61:	00 00 00 
  803f64:	ff d0                	callq  *%rax
  803f66:	c9                   	leaveq 
  803f67:	c3                   	retq   

0000000000803f68 <nsipc_shutdown>:
  803f68:	55                   	push   %rbp
  803f69:	48 89 e5             	mov    %rsp,%rbp
  803f6c:	48 83 ec 10          	sub    $0x10,%rsp
  803f70:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f73:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803f76:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f7d:	00 00 00 
  803f80:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f83:	89 10                	mov    %edx,(%rax)
  803f85:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f8c:	00 00 00 
  803f8f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f92:	89 50 04             	mov    %edx,0x4(%rax)
  803f95:	bf 03 00 00 00       	mov    $0x3,%edi
  803f9a:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  803fa1:	00 00 00 
  803fa4:	ff d0                	callq  *%rax
  803fa6:	c9                   	leaveq 
  803fa7:	c3                   	retq   

0000000000803fa8 <nsipc_close>:
  803fa8:	55                   	push   %rbp
  803fa9:	48 89 e5             	mov    %rsp,%rbp
  803fac:	48 83 ec 10          	sub    $0x10,%rsp
  803fb0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fb3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fba:	00 00 00 
  803fbd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fc0:	89 10                	mov    %edx,(%rax)
  803fc2:	bf 04 00 00 00       	mov    $0x4,%edi
  803fc7:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  803fce:	00 00 00 
  803fd1:	ff d0                	callq  *%rax
  803fd3:	c9                   	leaveq 
  803fd4:	c3                   	retq   

0000000000803fd5 <nsipc_connect>:
  803fd5:	55                   	push   %rbp
  803fd6:	48 89 e5             	mov    %rsp,%rbp
  803fd9:	48 83 ec 10          	sub    $0x10,%rsp
  803fdd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fe0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803fe4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803fe7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fee:	00 00 00 
  803ff1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ff4:	89 10                	mov    %edx,(%rax)
  803ff6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ff9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ffd:	48 89 c6             	mov    %rax,%rsi
  804000:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  804007:	00 00 00 
  80400a:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  804011:	00 00 00 
  804014:	ff d0                	callq  *%rax
  804016:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80401d:	00 00 00 
  804020:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804023:	89 50 14             	mov    %edx,0x14(%rax)
  804026:	bf 05 00 00 00       	mov    $0x5,%edi
  80402b:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  804032:	00 00 00 
  804035:	ff d0                	callq  *%rax
  804037:	c9                   	leaveq 
  804038:	c3                   	retq   

0000000000804039 <nsipc_listen>:
  804039:	55                   	push   %rbp
  80403a:	48 89 e5             	mov    %rsp,%rbp
  80403d:	48 83 ec 10          	sub    $0x10,%rsp
  804041:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804044:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804047:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80404e:	00 00 00 
  804051:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804054:	89 10                	mov    %edx,(%rax)
  804056:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80405d:	00 00 00 
  804060:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804063:	89 50 04             	mov    %edx,0x4(%rax)
  804066:	bf 06 00 00 00       	mov    $0x6,%edi
  80406b:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  804072:	00 00 00 
  804075:	ff d0                	callq  *%rax
  804077:	c9                   	leaveq 
  804078:	c3                   	retq   

0000000000804079 <nsipc_recv>:
  804079:	55                   	push   %rbp
  80407a:	48 89 e5             	mov    %rsp,%rbp
  80407d:	48 83 ec 30          	sub    $0x30,%rsp
  804081:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804084:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804088:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80408b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80408e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804095:	00 00 00 
  804098:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80409b:	89 10                	mov    %edx,(%rax)
  80409d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040a4:	00 00 00 
  8040a7:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8040aa:	89 50 04             	mov    %edx,0x4(%rax)
  8040ad:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040b4:	00 00 00 
  8040b7:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8040ba:	89 50 08             	mov    %edx,0x8(%rax)
  8040bd:	bf 07 00 00 00       	mov    $0x7,%edi
  8040c2:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  8040c9:	00 00 00 
  8040cc:	ff d0                	callq  *%rax
  8040ce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040d1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040d5:	78 69                	js     804140 <nsipc_recv+0xc7>
  8040d7:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8040de:	7f 08                	jg     8040e8 <nsipc_recv+0x6f>
  8040e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040e3:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8040e6:	7e 35                	jle    80411d <nsipc_recv+0xa4>
  8040e8:	48 b9 91 55 80 00 00 	movabs $0x805591,%rcx
  8040ef:	00 00 00 
  8040f2:	48 ba a6 55 80 00 00 	movabs $0x8055a6,%rdx
  8040f9:	00 00 00 
  8040fc:	be 62 00 00 00       	mov    $0x62,%esi
  804101:	48 bf bb 55 80 00 00 	movabs $0x8055bb,%rdi
  804108:	00 00 00 
  80410b:	b8 00 00 00 00       	mov    $0x0,%eax
  804110:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  804117:	00 00 00 
  80411a:	41 ff d0             	callq  *%r8
  80411d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804120:	48 63 d0             	movslq %eax,%rdx
  804123:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804127:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  80412e:	00 00 00 
  804131:	48 89 c7             	mov    %rax,%rdi
  804134:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  80413b:	00 00 00 
  80413e:	ff d0                	callq  *%rax
  804140:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804143:	c9                   	leaveq 
  804144:	c3                   	retq   

0000000000804145 <nsipc_send>:
  804145:	55                   	push   %rbp
  804146:	48 89 e5             	mov    %rsp,%rbp
  804149:	48 83 ec 20          	sub    $0x20,%rsp
  80414d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804150:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804154:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804157:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80415a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804161:	00 00 00 
  804164:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804167:	89 10                	mov    %edx,(%rax)
  804169:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  804170:	7e 35                	jle    8041a7 <nsipc_send+0x62>
  804172:	48 b9 ca 55 80 00 00 	movabs $0x8055ca,%rcx
  804179:	00 00 00 
  80417c:	48 ba a6 55 80 00 00 	movabs $0x8055a6,%rdx
  804183:	00 00 00 
  804186:	be 6d 00 00 00       	mov    $0x6d,%esi
  80418b:	48 bf bb 55 80 00 00 	movabs $0x8055bb,%rdi
  804192:	00 00 00 
  804195:	b8 00 00 00 00       	mov    $0x0,%eax
  80419a:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  8041a1:	00 00 00 
  8041a4:	41 ff d0             	callq  *%r8
  8041a7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8041aa:	48 63 d0             	movslq %eax,%rdx
  8041ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041b1:	48 89 c6             	mov    %rax,%rsi
  8041b4:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  8041bb:	00 00 00 
  8041be:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  8041c5:	00 00 00 
  8041c8:	ff d0                	callq  *%rax
  8041ca:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041d1:	00 00 00 
  8041d4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8041d7:	89 50 04             	mov    %edx,0x4(%rax)
  8041da:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041e1:	00 00 00 
  8041e4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8041e7:	89 50 08             	mov    %edx,0x8(%rax)
  8041ea:	bf 08 00 00 00       	mov    $0x8,%edi
  8041ef:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  8041f6:	00 00 00 
  8041f9:	ff d0                	callq  *%rax
  8041fb:	c9                   	leaveq 
  8041fc:	c3                   	retq   

00000000008041fd <nsipc_socket>:
  8041fd:	55                   	push   %rbp
  8041fe:	48 89 e5             	mov    %rsp,%rbp
  804201:	48 83 ec 10          	sub    $0x10,%rsp
  804205:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804208:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80420b:	89 55 f4             	mov    %edx,-0xc(%rbp)
  80420e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804215:	00 00 00 
  804218:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80421b:	89 10                	mov    %edx,(%rax)
  80421d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804224:	00 00 00 
  804227:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80422a:	89 50 04             	mov    %edx,0x4(%rax)
  80422d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804234:	00 00 00 
  804237:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80423a:	89 50 08             	mov    %edx,0x8(%rax)
  80423d:	bf 09 00 00 00       	mov    $0x9,%edi
  804242:	48 b8 04 3e 80 00 00 	movabs $0x803e04,%rax
  804249:	00 00 00 
  80424c:	ff d0                	callq  *%rax
  80424e:	c9                   	leaveq 
  80424f:	c3                   	retq   

0000000000804250 <pipe>:
  804250:	55                   	push   %rbp
  804251:	48 89 e5             	mov    %rsp,%rbp
  804254:	53                   	push   %rbx
  804255:	48 83 ec 38          	sub    $0x38,%rsp
  804259:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80425d:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804261:	48 89 c7             	mov    %rax,%rdi
  804264:	48 b8 67 2a 80 00 00 	movabs $0x802a67,%rax
  80426b:	00 00 00 
  80426e:	ff d0                	callq  *%rax
  804270:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804273:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804277:	0f 88 bf 01 00 00    	js     80443c <pipe+0x1ec>
  80427d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804281:	ba 07 04 00 00       	mov    $0x407,%edx
  804286:	48 89 c6             	mov    %rax,%rsi
  804289:	bf 00 00 00 00       	mov    $0x0,%edi
  80428e:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  804295:	00 00 00 
  804298:	ff d0                	callq  *%rax
  80429a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80429d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042a1:	0f 88 95 01 00 00    	js     80443c <pipe+0x1ec>
  8042a7:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8042ab:	48 89 c7             	mov    %rax,%rdi
  8042ae:	48 b8 67 2a 80 00 00 	movabs $0x802a67,%rax
  8042b5:	00 00 00 
  8042b8:	ff d0                	callq  *%rax
  8042ba:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042c1:	0f 88 5d 01 00 00    	js     804424 <pipe+0x1d4>
  8042c7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042cb:	ba 07 04 00 00       	mov    $0x407,%edx
  8042d0:	48 89 c6             	mov    %rax,%rsi
  8042d3:	bf 00 00 00 00       	mov    $0x0,%edi
  8042d8:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  8042df:	00 00 00 
  8042e2:	ff d0                	callq  *%rax
  8042e4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042e7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042eb:	0f 88 33 01 00 00    	js     804424 <pipe+0x1d4>
  8042f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042f5:	48 89 c7             	mov    %rax,%rdi
  8042f8:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  8042ff:	00 00 00 
  804302:	ff d0                	callq  *%rax
  804304:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804308:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80430c:	ba 07 04 00 00       	mov    $0x407,%edx
  804311:	48 89 c6             	mov    %rax,%rsi
  804314:	bf 00 00 00 00       	mov    $0x0,%edi
  804319:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  804320:	00 00 00 
  804323:	ff d0                	callq  *%rax
  804325:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804328:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80432c:	79 05                	jns    804333 <pipe+0xe3>
  80432e:	e9 d9 00 00 00       	jmpq   80440c <pipe+0x1bc>
  804333:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804337:	48 89 c7             	mov    %rax,%rdi
  80433a:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  804341:	00 00 00 
  804344:	ff d0                	callq  *%rax
  804346:	48 89 c2             	mov    %rax,%rdx
  804349:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80434d:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804353:	48 89 d1             	mov    %rdx,%rcx
  804356:	ba 00 00 00 00       	mov    $0x0,%edx
  80435b:	48 89 c6             	mov    %rax,%rsi
  80435e:	bf 00 00 00 00       	mov    $0x0,%edi
  804363:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  80436a:	00 00 00 
  80436d:	ff d0                	callq  *%rax
  80436f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804372:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804376:	79 1b                	jns    804393 <pipe+0x143>
  804378:	90                   	nop
  804379:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80437d:	48 89 c6             	mov    %rax,%rsi
  804380:	bf 00 00 00 00       	mov    $0x0,%edi
  804385:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  80438c:	00 00 00 
  80438f:	ff d0                	callq  *%rax
  804391:	eb 79                	jmp    80440c <pipe+0x1bc>
  804393:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804397:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80439e:	00 00 00 
  8043a1:	8b 12                	mov    (%rdx),%edx
  8043a3:	89 10                	mov    %edx,(%rax)
  8043a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043a9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8043b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043b4:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  8043bb:	00 00 00 
  8043be:	8b 12                	mov    (%rdx),%edx
  8043c0:	89 10                	mov    %edx,(%rax)
  8043c2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043c6:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8043cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043d1:	48 89 c7             	mov    %rax,%rdi
  8043d4:	48 b8 19 2a 80 00 00 	movabs $0x802a19,%rax
  8043db:	00 00 00 
  8043de:	ff d0                	callq  *%rax
  8043e0:	89 c2                	mov    %eax,%edx
  8043e2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043e6:	89 10                	mov    %edx,(%rax)
  8043e8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043ec:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8043f0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043f4:	48 89 c7             	mov    %rax,%rdi
  8043f7:	48 b8 19 2a 80 00 00 	movabs $0x802a19,%rax
  8043fe:	00 00 00 
  804401:	ff d0                	callq  *%rax
  804403:	89 03                	mov    %eax,(%rbx)
  804405:	b8 00 00 00 00       	mov    $0x0,%eax
  80440a:	eb 33                	jmp    80443f <pipe+0x1ef>
  80440c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804410:	48 89 c6             	mov    %rax,%rsi
  804413:	bf 00 00 00 00       	mov    $0x0,%edi
  804418:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  80441f:	00 00 00 
  804422:	ff d0                	callq  *%rax
  804424:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804428:	48 89 c6             	mov    %rax,%rsi
  80442b:	bf 00 00 00 00       	mov    $0x0,%edi
  804430:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  804437:	00 00 00 
  80443a:	ff d0                	callq  *%rax
  80443c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80443f:	48 83 c4 38          	add    $0x38,%rsp
  804443:	5b                   	pop    %rbx
  804444:	5d                   	pop    %rbp
  804445:	c3                   	retq   

0000000000804446 <_pipeisclosed>:
  804446:	55                   	push   %rbp
  804447:	48 89 e5             	mov    %rsp,%rbp
  80444a:	53                   	push   %rbx
  80444b:	48 83 ec 28          	sub    $0x28,%rsp
  80444f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804453:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804457:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80445e:	00 00 00 
  804461:	48 8b 00             	mov    (%rax),%rax
  804464:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80446a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80446d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804471:	48 89 c7             	mov    %rax,%rdi
  804474:	48 b8 f4 4b 80 00 00 	movabs $0x804bf4,%rax
  80447b:	00 00 00 
  80447e:	ff d0                	callq  *%rax
  804480:	89 c3                	mov    %eax,%ebx
  804482:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804486:	48 89 c7             	mov    %rax,%rdi
  804489:	48 b8 f4 4b 80 00 00 	movabs $0x804bf4,%rax
  804490:	00 00 00 
  804493:	ff d0                	callq  *%rax
  804495:	39 c3                	cmp    %eax,%ebx
  804497:	0f 94 c0             	sete   %al
  80449a:	0f b6 c0             	movzbl %al,%eax
  80449d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8044a0:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8044a7:	00 00 00 
  8044aa:	48 8b 00             	mov    (%rax),%rax
  8044ad:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8044b3:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8044b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044b9:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8044bc:	75 05                	jne    8044c3 <_pipeisclosed+0x7d>
  8044be:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8044c1:	eb 4f                	jmp    804512 <_pipeisclosed+0xcc>
  8044c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044c6:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8044c9:	74 42                	je     80450d <_pipeisclosed+0xc7>
  8044cb:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8044cf:	75 3c                	jne    80450d <_pipeisclosed+0xc7>
  8044d1:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8044d8:	00 00 00 
  8044db:	48 8b 00             	mov    (%rax),%rax
  8044de:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8044e4:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8044e7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044ea:	89 c6                	mov    %eax,%esi
  8044ec:	48 bf db 55 80 00 00 	movabs $0x8055db,%rdi
  8044f3:	00 00 00 
  8044f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8044fb:	49 b8 79 08 80 00 00 	movabs $0x800879,%r8
  804502:	00 00 00 
  804505:	41 ff d0             	callq  *%r8
  804508:	e9 4a ff ff ff       	jmpq   804457 <_pipeisclosed+0x11>
  80450d:	e9 45 ff ff ff       	jmpq   804457 <_pipeisclosed+0x11>
  804512:	48 83 c4 28          	add    $0x28,%rsp
  804516:	5b                   	pop    %rbx
  804517:	5d                   	pop    %rbp
  804518:	c3                   	retq   

0000000000804519 <pipeisclosed>:
  804519:	55                   	push   %rbp
  80451a:	48 89 e5             	mov    %rsp,%rbp
  80451d:	48 83 ec 30          	sub    $0x30,%rsp
  804521:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804524:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804528:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80452b:	48 89 d6             	mov    %rdx,%rsi
  80452e:	89 c7                	mov    %eax,%edi
  804530:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  804537:	00 00 00 
  80453a:	ff d0                	callq  *%rax
  80453c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80453f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804543:	79 05                	jns    80454a <pipeisclosed+0x31>
  804545:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804548:	eb 31                	jmp    80457b <pipeisclosed+0x62>
  80454a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80454e:	48 89 c7             	mov    %rax,%rdi
  804551:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  804558:	00 00 00 
  80455b:	ff d0                	callq  *%rax
  80455d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804561:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804565:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804569:	48 89 d6             	mov    %rdx,%rsi
  80456c:	48 89 c7             	mov    %rax,%rdi
  80456f:	48 b8 46 44 80 00 00 	movabs $0x804446,%rax
  804576:	00 00 00 
  804579:	ff d0                	callq  *%rax
  80457b:	c9                   	leaveq 
  80457c:	c3                   	retq   

000000000080457d <devpipe_read>:
  80457d:	55                   	push   %rbp
  80457e:	48 89 e5             	mov    %rsp,%rbp
  804581:	48 83 ec 40          	sub    $0x40,%rsp
  804585:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804589:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80458d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804591:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804595:	48 89 c7             	mov    %rax,%rdi
  804598:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  80459f:	00 00 00 
  8045a2:	ff d0                	callq  *%rax
  8045a4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045a8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045ac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8045b0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8045b7:	00 
  8045b8:	e9 92 00 00 00       	jmpq   80464f <devpipe_read+0xd2>
  8045bd:	eb 41                	jmp    804600 <devpipe_read+0x83>
  8045bf:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8045c4:	74 09                	je     8045cf <devpipe_read+0x52>
  8045c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045ca:	e9 92 00 00 00       	jmpq   804661 <devpipe_read+0xe4>
  8045cf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8045d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045d7:	48 89 d6             	mov    %rdx,%rsi
  8045da:	48 89 c7             	mov    %rax,%rdi
  8045dd:	48 b8 46 44 80 00 00 	movabs $0x804446,%rax
  8045e4:	00 00 00 
  8045e7:	ff d0                	callq  *%rax
  8045e9:	85 c0                	test   %eax,%eax
  8045eb:	74 07                	je     8045f4 <devpipe_read+0x77>
  8045ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8045f2:	eb 6d                	jmp    804661 <devpipe_read+0xe4>
  8045f4:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  8045fb:	00 00 00 
  8045fe:	ff d0                	callq  *%rax
  804600:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804604:	8b 10                	mov    (%rax),%edx
  804606:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80460a:	8b 40 04             	mov    0x4(%rax),%eax
  80460d:	39 c2                	cmp    %eax,%edx
  80460f:	74 ae                	je     8045bf <devpipe_read+0x42>
  804611:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804615:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804619:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80461d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804621:	8b 00                	mov    (%rax),%eax
  804623:	99                   	cltd   
  804624:	c1 ea 1b             	shr    $0x1b,%edx
  804627:	01 d0                	add    %edx,%eax
  804629:	83 e0 1f             	and    $0x1f,%eax
  80462c:	29 d0                	sub    %edx,%eax
  80462e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804632:	48 98                	cltq   
  804634:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804639:	88 01                	mov    %al,(%rcx)
  80463b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80463f:	8b 00                	mov    (%rax),%eax
  804641:	8d 50 01             	lea    0x1(%rax),%edx
  804644:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804648:	89 10                	mov    %edx,(%rax)
  80464a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80464f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804653:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804657:	0f 82 60 ff ff ff    	jb     8045bd <devpipe_read+0x40>
  80465d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804661:	c9                   	leaveq 
  804662:	c3                   	retq   

0000000000804663 <devpipe_write>:
  804663:	55                   	push   %rbp
  804664:	48 89 e5             	mov    %rsp,%rbp
  804667:	48 83 ec 40          	sub    $0x40,%rsp
  80466b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80466f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804673:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804677:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80467b:	48 89 c7             	mov    %rax,%rdi
  80467e:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  804685:	00 00 00 
  804688:	ff d0                	callq  *%rax
  80468a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80468e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804692:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804696:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80469d:	00 
  80469e:	e9 8e 00 00 00       	jmpq   804731 <devpipe_write+0xce>
  8046a3:	eb 31                	jmp    8046d6 <devpipe_write+0x73>
  8046a5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8046a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046ad:	48 89 d6             	mov    %rdx,%rsi
  8046b0:	48 89 c7             	mov    %rax,%rdi
  8046b3:	48 b8 46 44 80 00 00 	movabs $0x804446,%rax
  8046ba:	00 00 00 
  8046bd:	ff d0                	callq  *%rax
  8046bf:	85 c0                	test   %eax,%eax
  8046c1:	74 07                	je     8046ca <devpipe_write+0x67>
  8046c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8046c8:	eb 79                	jmp    804743 <devpipe_write+0xe0>
  8046ca:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  8046d1:	00 00 00 
  8046d4:	ff d0                	callq  *%rax
  8046d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046da:	8b 40 04             	mov    0x4(%rax),%eax
  8046dd:	48 63 d0             	movslq %eax,%rdx
  8046e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046e4:	8b 00                	mov    (%rax),%eax
  8046e6:	48 98                	cltq   
  8046e8:	48 83 c0 20          	add    $0x20,%rax
  8046ec:	48 39 c2             	cmp    %rax,%rdx
  8046ef:	73 b4                	jae    8046a5 <devpipe_write+0x42>
  8046f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046f5:	8b 40 04             	mov    0x4(%rax),%eax
  8046f8:	99                   	cltd   
  8046f9:	c1 ea 1b             	shr    $0x1b,%edx
  8046fc:	01 d0                	add    %edx,%eax
  8046fe:	83 e0 1f             	and    $0x1f,%eax
  804701:	29 d0                	sub    %edx,%eax
  804703:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804707:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80470b:	48 01 ca             	add    %rcx,%rdx
  80470e:	0f b6 0a             	movzbl (%rdx),%ecx
  804711:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804715:	48 98                	cltq   
  804717:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80471b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80471f:	8b 40 04             	mov    0x4(%rax),%eax
  804722:	8d 50 01             	lea    0x1(%rax),%edx
  804725:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804729:	89 50 04             	mov    %edx,0x4(%rax)
  80472c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804731:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804735:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804739:	0f 82 64 ff ff ff    	jb     8046a3 <devpipe_write+0x40>
  80473f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804743:	c9                   	leaveq 
  804744:	c3                   	retq   

0000000000804745 <devpipe_stat>:
  804745:	55                   	push   %rbp
  804746:	48 89 e5             	mov    %rsp,%rbp
  804749:	48 83 ec 20          	sub    $0x20,%rsp
  80474d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804751:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804755:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804759:	48 89 c7             	mov    %rax,%rdi
  80475c:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  804763:	00 00 00 
  804766:	ff d0                	callq  *%rax
  804768:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80476c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804770:	48 be ee 55 80 00 00 	movabs $0x8055ee,%rsi
  804777:	00 00 00 
  80477a:	48 89 c7             	mov    %rax,%rdi
  80477d:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  804784:	00 00 00 
  804787:	ff d0                	callq  *%rax
  804789:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80478d:	8b 50 04             	mov    0x4(%rax),%edx
  804790:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804794:	8b 00                	mov    (%rax),%eax
  804796:	29 c2                	sub    %eax,%edx
  804798:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80479c:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8047a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047a6:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8047ad:	00 00 00 
  8047b0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047b4:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  8047bb:	00 00 00 
  8047be:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8047c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8047ca:	c9                   	leaveq 
  8047cb:	c3                   	retq   

00000000008047cc <devpipe_close>:
  8047cc:	55                   	push   %rbp
  8047cd:	48 89 e5             	mov    %rsp,%rbp
  8047d0:	48 83 ec 10          	sub    $0x10,%rsp
  8047d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8047d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047dc:	48 89 c6             	mov    %rax,%rsi
  8047df:	bf 00 00 00 00       	mov    $0x0,%edi
  8047e4:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  8047eb:	00 00 00 
  8047ee:	ff d0                	callq  *%rax
  8047f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047f4:	48 89 c7             	mov    %rax,%rdi
  8047f7:	48 b8 3c 2a 80 00 00 	movabs $0x802a3c,%rax
  8047fe:	00 00 00 
  804801:	ff d0                	callq  *%rax
  804803:	48 89 c6             	mov    %rax,%rsi
  804806:	bf 00 00 00 00       	mov    $0x0,%edi
  80480b:	48 b8 08 1e 80 00 00 	movabs $0x801e08,%rax
  804812:	00 00 00 
  804815:	ff d0                	callq  *%rax
  804817:	c9                   	leaveq 
  804818:	c3                   	retq   

0000000000804819 <cputchar>:
  804819:	55                   	push   %rbp
  80481a:	48 89 e5             	mov    %rsp,%rbp
  80481d:	48 83 ec 20          	sub    $0x20,%rsp
  804821:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804824:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804827:	88 45 ff             	mov    %al,-0x1(%rbp)
  80482a:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  80482e:	be 01 00 00 00       	mov    $0x1,%esi
  804833:	48 89 c7             	mov    %rax,%rdi
  804836:	48 b8 15 1c 80 00 00 	movabs $0x801c15,%rax
  80483d:	00 00 00 
  804840:	ff d0                	callq  *%rax
  804842:	c9                   	leaveq 
  804843:	c3                   	retq   

0000000000804844 <getchar>:
  804844:	55                   	push   %rbp
  804845:	48 89 e5             	mov    %rsp,%rbp
  804848:	48 83 ec 10          	sub    $0x10,%rsp
  80484c:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804850:	ba 01 00 00 00       	mov    $0x1,%edx
  804855:	48 89 c6             	mov    %rax,%rsi
  804858:	bf 00 00 00 00       	mov    $0x0,%edi
  80485d:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  804864:	00 00 00 
  804867:	ff d0                	callq  *%rax
  804869:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80486c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804870:	79 05                	jns    804877 <getchar+0x33>
  804872:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804875:	eb 14                	jmp    80488b <getchar+0x47>
  804877:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80487b:	7f 07                	jg     804884 <getchar+0x40>
  80487d:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804882:	eb 07                	jmp    80488b <getchar+0x47>
  804884:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804888:	0f b6 c0             	movzbl %al,%eax
  80488b:	c9                   	leaveq 
  80488c:	c3                   	retq   

000000000080488d <iscons>:
  80488d:	55                   	push   %rbp
  80488e:	48 89 e5             	mov    %rsp,%rbp
  804891:	48 83 ec 20          	sub    $0x20,%rsp
  804895:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804898:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80489c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80489f:	48 89 d6             	mov    %rdx,%rsi
  8048a2:	89 c7                	mov    %eax,%edi
  8048a4:	48 b8 ff 2a 80 00 00 	movabs $0x802aff,%rax
  8048ab:	00 00 00 
  8048ae:	ff d0                	callq  *%rax
  8048b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048b3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048b7:	79 05                	jns    8048be <iscons+0x31>
  8048b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048bc:	eb 1a                	jmp    8048d8 <iscons+0x4b>
  8048be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8048c2:	8b 10                	mov    (%rax),%edx
  8048c4:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8048cb:	00 00 00 
  8048ce:	8b 00                	mov    (%rax),%eax
  8048d0:	39 c2                	cmp    %eax,%edx
  8048d2:	0f 94 c0             	sete   %al
  8048d5:	0f b6 c0             	movzbl %al,%eax
  8048d8:	c9                   	leaveq 
  8048d9:	c3                   	retq   

00000000008048da <opencons>:
  8048da:	55                   	push   %rbp
  8048db:	48 89 e5             	mov    %rsp,%rbp
  8048de:	48 83 ec 10          	sub    $0x10,%rsp
  8048e2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8048e6:	48 89 c7             	mov    %rax,%rdi
  8048e9:	48 b8 67 2a 80 00 00 	movabs $0x802a67,%rax
  8048f0:	00 00 00 
  8048f3:	ff d0                	callq  *%rax
  8048f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048fc:	79 05                	jns    804903 <opencons+0x29>
  8048fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804901:	eb 5b                	jmp    80495e <opencons+0x84>
  804903:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804907:	ba 07 04 00 00       	mov    $0x407,%edx
  80490c:	48 89 c6             	mov    %rax,%rsi
  80490f:	bf 00 00 00 00       	mov    $0x0,%edi
  804914:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  80491b:	00 00 00 
  80491e:	ff d0                	callq  *%rax
  804920:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804923:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804927:	79 05                	jns    80492e <opencons+0x54>
  804929:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80492c:	eb 30                	jmp    80495e <opencons+0x84>
  80492e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804932:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  804939:	00 00 00 
  80493c:	8b 12                	mov    (%rdx),%edx
  80493e:	89 10                	mov    %edx,(%rax)
  804940:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804944:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80494b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80494f:	48 89 c7             	mov    %rax,%rdi
  804952:	48 b8 19 2a 80 00 00 	movabs $0x802a19,%rax
  804959:	00 00 00 
  80495c:	ff d0                	callq  *%rax
  80495e:	c9                   	leaveq 
  80495f:	c3                   	retq   

0000000000804960 <devcons_read>:
  804960:	55                   	push   %rbp
  804961:	48 89 e5             	mov    %rsp,%rbp
  804964:	48 83 ec 30          	sub    $0x30,%rsp
  804968:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80496c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804970:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804974:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804979:	75 07                	jne    804982 <devcons_read+0x22>
  80497b:	b8 00 00 00 00       	mov    $0x0,%eax
  804980:	eb 4b                	jmp    8049cd <devcons_read+0x6d>
  804982:	eb 0c                	jmp    804990 <devcons_read+0x30>
  804984:	48 b8 1f 1d 80 00 00 	movabs $0x801d1f,%rax
  80498b:	00 00 00 
  80498e:	ff d0                	callq  *%rax
  804990:	48 b8 5f 1c 80 00 00 	movabs $0x801c5f,%rax
  804997:	00 00 00 
  80499a:	ff d0                	callq  *%rax
  80499c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80499f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049a3:	74 df                	je     804984 <devcons_read+0x24>
  8049a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049a9:	79 05                	jns    8049b0 <devcons_read+0x50>
  8049ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049ae:	eb 1d                	jmp    8049cd <devcons_read+0x6d>
  8049b0:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8049b4:	75 07                	jne    8049bd <devcons_read+0x5d>
  8049b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8049bb:	eb 10                	jmp    8049cd <devcons_read+0x6d>
  8049bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049c0:	89 c2                	mov    %eax,%edx
  8049c2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049c6:	88 10                	mov    %dl,(%rax)
  8049c8:	b8 01 00 00 00       	mov    $0x1,%eax
  8049cd:	c9                   	leaveq 
  8049ce:	c3                   	retq   

00000000008049cf <devcons_write>:
  8049cf:	55                   	push   %rbp
  8049d0:	48 89 e5             	mov    %rsp,%rbp
  8049d3:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8049da:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8049e1:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8049e8:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8049ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8049f6:	eb 76                	jmp    804a6e <devcons_write+0x9f>
  8049f8:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8049ff:	89 c2                	mov    %eax,%edx
  804a01:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a04:	29 c2                	sub    %eax,%edx
  804a06:	89 d0                	mov    %edx,%eax
  804a08:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804a0b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a0e:	83 f8 7f             	cmp    $0x7f,%eax
  804a11:	76 07                	jbe    804a1a <devcons_write+0x4b>
  804a13:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804a1a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a1d:	48 63 d0             	movslq %eax,%rdx
  804a20:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a23:	48 63 c8             	movslq %eax,%rcx
  804a26:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804a2d:	48 01 c1             	add    %rax,%rcx
  804a30:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804a37:	48 89 ce             	mov    %rcx,%rsi
  804a3a:	48 89 c7             	mov    %rax,%rdi
  804a3d:	48 b8 52 17 80 00 00 	movabs $0x801752,%rax
  804a44:	00 00 00 
  804a47:	ff d0                	callq  *%rax
  804a49:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a4c:	48 63 d0             	movslq %eax,%rdx
  804a4f:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804a56:	48 89 d6             	mov    %rdx,%rsi
  804a59:	48 89 c7             	mov    %rax,%rdi
  804a5c:	48 b8 15 1c 80 00 00 	movabs $0x801c15,%rax
  804a63:	00 00 00 
  804a66:	ff d0                	callq  *%rax
  804a68:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a6b:	01 45 fc             	add    %eax,-0x4(%rbp)
  804a6e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a71:	48 98                	cltq   
  804a73:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804a7a:	0f 82 78 ff ff ff    	jb     8049f8 <devcons_write+0x29>
  804a80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a83:	c9                   	leaveq 
  804a84:	c3                   	retq   

0000000000804a85 <devcons_close>:
  804a85:	55                   	push   %rbp
  804a86:	48 89 e5             	mov    %rsp,%rbp
  804a89:	48 83 ec 08          	sub    $0x8,%rsp
  804a8d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804a91:	b8 00 00 00 00       	mov    $0x0,%eax
  804a96:	c9                   	leaveq 
  804a97:	c3                   	retq   

0000000000804a98 <devcons_stat>:
  804a98:	55                   	push   %rbp
  804a99:	48 89 e5             	mov    %rsp,%rbp
  804a9c:	48 83 ec 10          	sub    $0x10,%rsp
  804aa0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804aa4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804aa8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804aac:	48 be fa 55 80 00 00 	movabs $0x8055fa,%rsi
  804ab3:	00 00 00 
  804ab6:	48 89 c7             	mov    %rax,%rdi
  804ab9:	48 b8 2e 14 80 00 00 	movabs $0x80142e,%rax
  804ac0:	00 00 00 
  804ac3:	ff d0                	callq  *%rax
  804ac5:	b8 00 00 00 00       	mov    $0x0,%eax
  804aca:	c9                   	leaveq 
  804acb:	c3                   	retq   

0000000000804acc <set_pgfault_handler>:
  804acc:	55                   	push   %rbp
  804acd:	48 89 e5             	mov    %rsp,%rbp
  804ad0:	48 83 ec 20          	sub    $0x20,%rsp
  804ad4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804ad8:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804adf:	00 00 00 
  804ae2:	48 8b 00             	mov    (%rax),%rax
  804ae5:	48 85 c0             	test   %rax,%rax
  804ae8:	75 6f                	jne    804b59 <set_pgfault_handler+0x8d>
  804aea:	ba 07 00 00 00       	mov    $0x7,%edx
  804aef:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804af4:	bf 00 00 00 00       	mov    $0x0,%edi
  804af9:	48 b8 5d 1d 80 00 00 	movabs $0x801d5d,%rax
  804b00:	00 00 00 
  804b03:	ff d0                	callq  *%rax
  804b05:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804b08:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b0c:	79 30                	jns    804b3e <set_pgfault_handler+0x72>
  804b0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b11:	89 c1                	mov    %eax,%ecx
  804b13:	48 ba 08 56 80 00 00 	movabs $0x805608,%rdx
  804b1a:	00 00 00 
  804b1d:	be 22 00 00 00       	mov    $0x22,%esi
  804b22:	48 bf 27 56 80 00 00 	movabs $0x805627,%rdi
  804b29:	00 00 00 
  804b2c:	b8 00 00 00 00       	mov    $0x0,%eax
  804b31:	49 b8 40 06 80 00 00 	movabs $0x800640,%r8
  804b38:	00 00 00 
  804b3b:	41 ff d0             	callq  *%r8
  804b3e:	48 be 6c 4b 80 00 00 	movabs $0x804b6c,%rsi
  804b45:	00 00 00 
  804b48:	bf 00 00 00 00       	mov    $0x0,%edi
  804b4d:	48 b8 e7 1e 80 00 00 	movabs $0x801ee7,%rax
  804b54:	00 00 00 
  804b57:	ff d0                	callq  *%rax
  804b59:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b60:	00 00 00 
  804b63:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804b67:	48 89 10             	mov    %rdx,(%rax)
  804b6a:	c9                   	leaveq 
  804b6b:	c3                   	retq   

0000000000804b6c <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804b6c:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804b6f:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804b76:	00 00 00 
call *%rax
  804b79:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804b7b:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804b82:	00 08 
    movq 152(%rsp), %rax
  804b84:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804b8b:	00 
    movq 136(%rsp), %rbx
  804b8c:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804b93:	00 
movq %rbx, (%rax)
  804b94:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804b97:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804b9b:	4c 8b 3c 24          	mov    (%rsp),%r15
  804b9f:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804ba4:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804ba9:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804bae:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804bb3:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804bb8:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804bbd:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804bc2:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804bc7:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804bcc:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804bd1:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804bd6:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804bdb:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804be0:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804be5:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804be9:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804bed:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804bee:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804bf3:	c3                   	retq   

0000000000804bf4 <pageref>:
  804bf4:	55                   	push   %rbp
  804bf5:	48 89 e5             	mov    %rsp,%rbp
  804bf8:	48 83 ec 18          	sub    $0x18,%rsp
  804bfc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804c00:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c04:	48 c1 e8 15          	shr    $0x15,%rax
  804c08:	48 89 c2             	mov    %rax,%rdx
  804c0b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804c12:	01 00 00 
  804c15:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804c19:	83 e0 01             	and    $0x1,%eax
  804c1c:	48 85 c0             	test   %rax,%rax
  804c1f:	75 07                	jne    804c28 <pageref+0x34>
  804c21:	b8 00 00 00 00       	mov    $0x0,%eax
  804c26:	eb 53                	jmp    804c7b <pageref+0x87>
  804c28:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c2c:	48 c1 e8 0c          	shr    $0xc,%rax
  804c30:	48 89 c2             	mov    %rax,%rdx
  804c33:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804c3a:	01 00 00 
  804c3d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804c41:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804c45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c49:	83 e0 01             	and    $0x1,%eax
  804c4c:	48 85 c0             	test   %rax,%rax
  804c4f:	75 07                	jne    804c58 <pageref+0x64>
  804c51:	b8 00 00 00 00       	mov    $0x0,%eax
  804c56:	eb 23                	jmp    804c7b <pageref+0x87>
  804c58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c5c:	48 c1 e8 0c          	shr    $0xc,%rax
  804c60:	48 89 c2             	mov    %rax,%rdx
  804c63:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804c6a:	00 00 00 
  804c6d:	48 c1 e2 04          	shl    $0x4,%rdx
  804c71:	48 01 d0             	add    %rdx,%rax
  804c74:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804c78:	0f b7 c0             	movzwl %ax,%eax
  804c7b:	c9                   	leaveq 
  804c7c:	c3                   	retq   
