
obj/user/primespipe:     file format elf64-x86-64


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
  80003c:	e8 d3 03 00 00       	callq  800414 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <primeproc>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 30          	sub    $0x30,%rsp
  80004b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80004e:	48 8d 4d ec          	lea    -0x14(%rbp),%rcx
  800052:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800055:	ba 04 00 00 00       	mov    $0x4,%edx
  80005a:	48 89 ce             	mov    %rcx,%rsi
  80005d:	89 c7                	mov    %eax,%edi
  80005f:	48 b8 b7 2c 80 00 00 	movabs $0x802cb7,%rax
  800066:	00 00 00 
  800069:	ff d0                	callq  *%rax
  80006b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80006e:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  800072:	74 42                	je     8000b6 <primeproc+0x73>
  800074:	b8 00 00 00 00       	mov    $0x0,%eax
  800079:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80007d:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  800081:	89 c2                	mov    %eax,%edx
  800083:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800086:	41 89 d0             	mov    %edx,%r8d
  800089:	89 c1                	mov    %eax,%ecx
  80008b:	48 ba 00 4b 80 00 00 	movabs $0x804b00,%rdx
  800092:	00 00 00 
  800095:	be 16 00 00 00       	mov    $0x16,%esi
  80009a:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  8000a1:	00 00 00 
  8000a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a9:	49 b9 ba 04 80 00 00 	movabs $0x8004ba,%r9
  8000b0:	00 00 00 
  8000b3:	41 ff d1             	callq  *%r9
  8000b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8000b9:	89 c6                	mov    %eax,%esi
  8000bb:	48 bf 44 4b 80 00 00 	movabs $0x804b44,%rdi
  8000c2:	00 00 00 
  8000c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ca:	48 ba f3 06 80 00 00 	movabs $0x8006f3,%rdx
  8000d1:	00 00 00 
  8000d4:	ff d2                	callq  *%rdx
  8000d6:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8000da:	48 89 c7             	mov    %rax,%rdi
  8000dd:	48 b8 01 3f 80 00 00 	movabs $0x803f01,%rax
  8000e4:	00 00 00 
  8000e7:	ff d0                	callq  *%rax
  8000e9:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8000ec:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8000ef:	85 c0                	test   %eax,%eax
  8000f1:	79 30                	jns    800123 <primeproc+0xe0>
  8000f3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8000f6:	89 c1                	mov    %eax,%ecx
  8000f8:	48 ba 48 4b 80 00 00 	movabs $0x804b48,%rdx
  8000ff:	00 00 00 
  800102:	be 1c 00 00 00       	mov    $0x1c,%esi
  800107:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  80010e:	00 00 00 
  800111:	b8 00 00 00 00       	mov    $0x0,%eax
  800116:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  80011d:	00 00 00 
  800120:	41 ff d0             	callq  *%r8
  800123:	48 b8 55 24 80 00 00 	movabs $0x802455,%rax
  80012a:	00 00 00 
  80012d:	ff d0                	callq  *%rax
  80012f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800132:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800136:	79 30                	jns    800168 <primeproc+0x125>
  800138:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80013b:	89 c1                	mov    %eax,%ecx
  80013d:	48 ba 51 4b 80 00 00 	movabs $0x804b51,%rdx
  800144:	00 00 00 
  800147:	be 1e 00 00 00       	mov    $0x1e,%esi
  80014c:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  800153:	00 00 00 
  800156:	b8 00 00 00 00       	mov    $0x0,%eax
  80015b:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  800162:	00 00 00 
  800165:	41 ff d0             	callq  *%r8
  800168:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80016c:	75 2d                	jne    80019b <primeproc+0x158>
  80016e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800171:	89 c7                	mov    %eax,%edi
  800173:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  80017a:	00 00 00 
  80017d:	ff d0                	callq  *%rax
  80017f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800182:	89 c7                	mov    %eax,%edi
  800184:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  80018b:	00 00 00 
  80018e:	ff d0                	callq  *%rax
  800190:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800193:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800196:	e9 b3 fe ff ff       	jmpq   80004e <primeproc+0xb>
  80019b:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80019e:	89 c7                	mov    %eax,%edi
  8001a0:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  8001a7:	00 00 00 
  8001aa:	ff d0                	callq  *%rax
  8001ac:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8001af:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8001b2:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
  8001b6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8001b9:	ba 04 00 00 00       	mov    $0x4,%edx
  8001be:	48 89 ce             	mov    %rcx,%rsi
  8001c1:	89 c7                	mov    %eax,%edi
  8001c3:	48 b8 b7 2c 80 00 00 	movabs $0x802cb7,%rax
  8001ca:	00 00 00 
  8001cd:	ff d0                	callq  *%rax
  8001cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001d2:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8001d6:	74 4e                	je     800226 <primeproc+0x1e3>
  8001d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8001dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001e1:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  8001e5:	89 c2                	mov    %eax,%edx
  8001e7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001ea:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8001ed:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8001f0:	89 14 24             	mov    %edx,(%rsp)
  8001f3:	41 89 f1             	mov    %esi,%r9d
  8001f6:	41 89 c8             	mov    %ecx,%r8d
  8001f9:	89 c1                	mov    %eax,%ecx
  8001fb:	48 ba 5a 4b 80 00 00 	movabs $0x804b5a,%rdx
  800202:	00 00 00 
  800205:	be 2c 00 00 00       	mov    $0x2c,%esi
  80020a:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  800211:	00 00 00 
  800214:	b8 00 00 00 00       	mov    $0x0,%eax
  800219:	49 ba ba 04 80 00 00 	movabs $0x8004ba,%r10
  800220:	00 00 00 
  800223:	41 ff d2             	callq  *%r10
  800226:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800229:	8b 4d ec             	mov    -0x14(%rbp),%ecx
  80022c:	99                   	cltd   
  80022d:	f7 f9                	idiv   %ecx
  80022f:	89 d0                	mov    %edx,%eax
  800231:	85 c0                	test   %eax,%eax
  800233:	74 6e                	je     8002a3 <primeproc+0x260>
  800235:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
  800239:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80023c:	ba 04 00 00 00       	mov    $0x4,%edx
  800241:	48 89 ce             	mov    %rcx,%rsi
  800244:	89 c7                	mov    %eax,%edi
  800246:	48 b8 2c 2d 80 00 00 	movabs $0x802d2c,%rax
  80024d:	00 00 00 
  800250:	ff d0                	callq  *%rax
  800252:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800255:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  800259:	74 48                	je     8002a3 <primeproc+0x260>
  80025b:	b8 00 00 00 00       	mov    $0x0,%eax
  800260:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800264:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  800268:	89 c1                	mov    %eax,%ecx
  80026a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80026d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800270:	41 89 c9             	mov    %ecx,%r9d
  800273:	41 89 d0             	mov    %edx,%r8d
  800276:	89 c1                	mov    %eax,%ecx
  800278:	48 ba 76 4b 80 00 00 	movabs $0x804b76,%rdx
  80027f:	00 00 00 
  800282:	be 2f 00 00 00       	mov    $0x2f,%esi
  800287:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  80028e:	00 00 00 
  800291:	b8 00 00 00 00       	mov    $0x0,%eax
  800296:	49 ba ba 04 80 00 00 	movabs $0x8004ba,%r10
  80029d:	00 00 00 
  8002a0:	41 ff d2             	callq  *%r10
  8002a3:	e9 0a ff ff ff       	jmpq   8001b2 <primeproc+0x16f>

00000000008002a8 <umain>:
  8002a8:	55                   	push   %rbp
  8002a9:	48 89 e5             	mov    %rsp,%rbp
  8002ac:	53                   	push   %rbx
  8002ad:	48 83 ec 38          	sub    $0x38,%rsp
  8002b1:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8002b4:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  8002b8:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002bf:	00 00 00 
  8002c2:	48 bb 90 4b 80 00 00 	movabs $0x804b90,%rbx
  8002c9:	00 00 00 
  8002cc:	48 89 18             	mov    %rbx,(%rax)
  8002cf:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8002d3:	48 89 c7             	mov    %rax,%rdi
  8002d6:	48 b8 01 3f 80 00 00 	movabs $0x803f01,%rax
  8002dd:	00 00 00 
  8002e0:	ff d0                	callq  *%rax
  8002e2:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8002e5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8002e8:	85 c0                	test   %eax,%eax
  8002ea:	79 30                	jns    80031c <umain+0x74>
  8002ec:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8002ef:	89 c1                	mov    %eax,%ecx
  8002f1:	48 ba 48 4b 80 00 00 	movabs $0x804b48,%rdx
  8002f8:	00 00 00 
  8002fb:	be 3b 00 00 00       	mov    $0x3b,%esi
  800300:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  800307:	00 00 00 
  80030a:	b8 00 00 00 00       	mov    $0x0,%eax
  80030f:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  800316:	00 00 00 
  800319:	41 ff d0             	callq  *%r8
  80031c:	48 b8 55 24 80 00 00 	movabs $0x802455,%rax
  800323:	00 00 00 
  800326:	ff d0                	callq  *%rax
  800328:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80032b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80032f:	79 30                	jns    800361 <umain+0xb9>
  800331:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800334:	89 c1                	mov    %eax,%ecx
  800336:	48 ba 51 4b 80 00 00 	movabs $0x804b51,%rdx
  80033d:	00 00 00 
  800340:	be 3f 00 00 00       	mov    $0x3f,%esi
  800345:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  80034c:	00 00 00 
  80034f:	b8 00 00 00 00       	mov    $0x0,%eax
  800354:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  80035b:	00 00 00 
  80035e:	41 ff d0             	callq  *%r8
  800361:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800365:	75 22                	jne    800389 <umain+0xe1>
  800367:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80036a:	89 c7                	mov    %eax,%edi
  80036c:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  800373:	00 00 00 
  800376:	ff d0                	callq  *%rax
  800378:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80037b:	89 c7                	mov    %eax,%edi
  80037d:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800384:	00 00 00 
  800387:	ff d0                	callq  *%rax
  800389:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80038c:	89 c7                	mov    %eax,%edi
  80038e:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  800395:	00 00 00 
  800398:	ff d0                	callq  *%rax
  80039a:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%rbp)
  8003a1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8003a4:	48 8d 4d e4          	lea    -0x1c(%rbp),%rcx
  8003a8:	ba 04 00 00 00       	mov    $0x4,%edx
  8003ad:	48 89 ce             	mov    %rcx,%rsi
  8003b0:	89 c7                	mov    %eax,%edi
  8003b2:	48 b8 2c 2d 80 00 00 	movabs $0x802d2c,%rax
  8003b9:	00 00 00 
  8003bc:	ff d0                	callq  *%rax
  8003be:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8003c1:	83 7d e8 04          	cmpl   $0x4,-0x18(%rbp)
  8003c5:	74 42                	je     800409 <umain+0x161>
  8003c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8003cc:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8003d0:	0f 4e 45 e8          	cmovle -0x18(%rbp),%eax
  8003d4:	89 c2                	mov    %eax,%edx
  8003d6:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8003d9:	41 89 d0             	mov    %edx,%r8d
  8003dc:	89 c1                	mov    %eax,%ecx
  8003de:	48 ba 9b 4b 80 00 00 	movabs $0x804b9b,%rdx
  8003e5:	00 00 00 
  8003e8:	be 4b 00 00 00       	mov    $0x4b,%esi
  8003ed:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  8003f4:	00 00 00 
  8003f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8003fc:	49 b9 ba 04 80 00 00 	movabs $0x8004ba,%r9
  800403:	00 00 00 
  800406:	41 ff d1             	callq  *%r9
  800409:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80040c:	83 c0 01             	add    $0x1,%eax
  80040f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800412:	eb 8d                	jmp    8003a1 <umain+0xf9>

0000000000800414 <libmain>:
  800414:	55                   	push   %rbp
  800415:	48 89 e5             	mov    %rsp,%rbp
  800418:	48 83 ec 10          	sub    $0x10,%rsp
  80041c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80041f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800423:	48 b8 5b 1b 80 00 00 	movabs $0x801b5b,%rax
  80042a:	00 00 00 
  80042d:	ff d0                	callq  *%rax
  80042f:	25 ff 03 00 00       	and    $0x3ff,%eax
  800434:	48 98                	cltq   
  800436:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80043d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800444:	00 00 00 
  800447:	48 01 c2             	add    %rax,%rdx
  80044a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800451:	00 00 00 
  800454:	48 89 10             	mov    %rdx,(%rax)
  800457:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80045b:	7e 14                	jle    800471 <libmain+0x5d>
  80045d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800461:	48 8b 10             	mov    (%rax),%rdx
  800464:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80046b:	00 00 00 
  80046e:	48 89 10             	mov    %rdx,(%rax)
  800471:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800475:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800478:	48 89 d6             	mov    %rdx,%rsi
  80047b:	89 c7                	mov    %eax,%edi
  80047d:	48 b8 a8 02 80 00 00 	movabs $0x8002a8,%rax
  800484:	00 00 00 
  800487:	ff d0                	callq  *%rax
  800489:	48 b8 97 04 80 00 00 	movabs $0x800497,%rax
  800490:	00 00 00 
  800493:	ff d0                	callq  *%rax
  800495:	c9                   	leaveq 
  800496:	c3                   	retq   

0000000000800497 <exit>:
  800497:	55                   	push   %rbp
  800498:	48 89 e5             	mov    %rsp,%rbp
  80049b:	48 b8 0b 2a 80 00 00 	movabs $0x802a0b,%rax
  8004a2:	00 00 00 
  8004a5:	ff d0                	callq  *%rax
  8004a7:	bf 00 00 00 00       	mov    $0x0,%edi
  8004ac:	48 b8 17 1b 80 00 00 	movabs $0x801b17,%rax
  8004b3:	00 00 00 
  8004b6:	ff d0                	callq  *%rax
  8004b8:	5d                   	pop    %rbp
  8004b9:	c3                   	retq   

00000000008004ba <_panic>:
  8004ba:	55                   	push   %rbp
  8004bb:	48 89 e5             	mov    %rsp,%rbp
  8004be:	53                   	push   %rbx
  8004bf:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8004c6:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8004cd:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8004d3:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8004da:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8004e1:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8004e8:	84 c0                	test   %al,%al
  8004ea:	74 23                	je     80050f <_panic+0x55>
  8004ec:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8004f3:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8004f7:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8004fb:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8004ff:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800503:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800507:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80050b:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80050f:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800516:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80051d:	00 00 00 
  800520:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800527:	00 00 00 
  80052a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80052e:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800535:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80053c:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800543:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80054a:	00 00 00 
  80054d:	48 8b 18             	mov    (%rax),%rbx
  800550:	48 b8 5b 1b 80 00 00 	movabs $0x801b5b,%rax
  800557:	00 00 00 
  80055a:	ff d0                	callq  *%rax
  80055c:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800562:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800569:	41 89 c8             	mov    %ecx,%r8d
  80056c:	48 89 d1             	mov    %rdx,%rcx
  80056f:	48 89 da             	mov    %rbx,%rdx
  800572:	89 c6                	mov    %eax,%esi
  800574:	48 bf c0 4b 80 00 00 	movabs $0x804bc0,%rdi
  80057b:	00 00 00 
  80057e:	b8 00 00 00 00       	mov    $0x0,%eax
  800583:	49 b9 f3 06 80 00 00 	movabs $0x8006f3,%r9
  80058a:	00 00 00 
  80058d:	41 ff d1             	callq  *%r9
  800590:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800597:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80059e:	48 89 d6             	mov    %rdx,%rsi
  8005a1:	48 89 c7             	mov    %rax,%rdi
  8005a4:	48 b8 47 06 80 00 00 	movabs $0x800647,%rax
  8005ab:	00 00 00 
  8005ae:	ff d0                	callq  *%rax
  8005b0:	48 bf e3 4b 80 00 00 	movabs $0x804be3,%rdi
  8005b7:	00 00 00 
  8005ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8005bf:	48 ba f3 06 80 00 00 	movabs $0x8006f3,%rdx
  8005c6:	00 00 00 
  8005c9:	ff d2                	callq  *%rdx
  8005cb:	cc                   	int3   
  8005cc:	eb fd                	jmp    8005cb <_panic+0x111>

00000000008005ce <putch>:
  8005ce:	55                   	push   %rbp
  8005cf:	48 89 e5             	mov    %rsp,%rbp
  8005d2:	48 83 ec 10          	sub    $0x10,%rsp
  8005d6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8005d9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8005dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005e1:	8b 00                	mov    (%rax),%eax
  8005e3:	8d 48 01             	lea    0x1(%rax),%ecx
  8005e6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8005ea:	89 0a                	mov    %ecx,(%rdx)
  8005ec:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8005ef:	89 d1                	mov    %edx,%ecx
  8005f1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8005f5:	48 98                	cltq   
  8005f7:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8005fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005ff:	8b 00                	mov    (%rax),%eax
  800601:	3d ff 00 00 00       	cmp    $0xff,%eax
  800606:	75 2c                	jne    800634 <putch+0x66>
  800608:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80060c:	8b 00                	mov    (%rax),%eax
  80060e:	48 98                	cltq   
  800610:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800614:	48 83 c2 08          	add    $0x8,%rdx
  800618:	48 89 c6             	mov    %rax,%rsi
  80061b:	48 89 d7             	mov    %rdx,%rdi
  80061e:	48 b8 8f 1a 80 00 00 	movabs $0x801a8f,%rax
  800625:	00 00 00 
  800628:	ff d0                	callq  *%rax
  80062a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80062e:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800634:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800638:	8b 40 04             	mov    0x4(%rax),%eax
  80063b:	8d 50 01             	lea    0x1(%rax),%edx
  80063e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800642:	89 50 04             	mov    %edx,0x4(%rax)
  800645:	c9                   	leaveq 
  800646:	c3                   	retq   

0000000000800647 <vcprintf>:
  800647:	55                   	push   %rbp
  800648:	48 89 e5             	mov    %rsp,%rbp
  80064b:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800652:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800659:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800660:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800667:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  80066e:	48 8b 0a             	mov    (%rdx),%rcx
  800671:	48 89 08             	mov    %rcx,(%rax)
  800674:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800678:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80067c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800680:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800684:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80068b:	00 00 00 
  80068e:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800695:	00 00 00 
  800698:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  80069f:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8006a6:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8006ad:	48 89 c6             	mov    %rax,%rsi
  8006b0:	48 bf ce 05 80 00 00 	movabs $0x8005ce,%rdi
  8006b7:	00 00 00 
  8006ba:	48 b8 a6 0a 80 00 00 	movabs $0x800aa6,%rax
  8006c1:	00 00 00 
  8006c4:	ff d0                	callq  *%rax
  8006c6:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8006cc:	48 98                	cltq   
  8006ce:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8006d5:	48 83 c2 08          	add    $0x8,%rdx
  8006d9:	48 89 c6             	mov    %rax,%rsi
  8006dc:	48 89 d7             	mov    %rdx,%rdi
  8006df:	48 b8 8f 1a 80 00 00 	movabs $0x801a8f,%rax
  8006e6:	00 00 00 
  8006e9:	ff d0                	callq  *%rax
  8006eb:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8006f1:	c9                   	leaveq 
  8006f2:	c3                   	retq   

00000000008006f3 <cprintf>:
  8006f3:	55                   	push   %rbp
  8006f4:	48 89 e5             	mov    %rsp,%rbp
  8006f7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8006fe:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800705:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80070c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800713:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80071a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800721:	84 c0                	test   %al,%al
  800723:	74 20                	je     800745 <cprintf+0x52>
  800725:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800729:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80072d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800731:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800735:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800739:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80073d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800741:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800745:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80074c:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800753:	00 00 00 
  800756:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80075d:	00 00 00 
  800760:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800764:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80076b:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800772:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800779:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800780:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800787:	48 8b 0a             	mov    (%rdx),%rcx
  80078a:	48 89 08             	mov    %rcx,(%rax)
  80078d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800791:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800795:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800799:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80079d:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8007a4:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8007ab:	48 89 d6             	mov    %rdx,%rsi
  8007ae:	48 89 c7             	mov    %rax,%rdi
  8007b1:	48 b8 47 06 80 00 00 	movabs $0x800647,%rax
  8007b8:	00 00 00 
  8007bb:	ff d0                	callq  *%rax
  8007bd:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8007c3:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8007c9:	c9                   	leaveq 
  8007ca:	c3                   	retq   

00000000008007cb <printnum>:
  8007cb:	55                   	push   %rbp
  8007cc:	48 89 e5             	mov    %rsp,%rbp
  8007cf:	53                   	push   %rbx
  8007d0:	48 83 ec 38          	sub    $0x38,%rsp
  8007d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8007dc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8007e0:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8007e3:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8007e7:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8007eb:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8007ee:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8007f2:	77 3b                	ja     80082f <printnum+0x64>
  8007f4:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8007f7:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  8007fb:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  8007fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800802:	ba 00 00 00 00       	mov    $0x0,%edx
  800807:	48 f7 f3             	div    %rbx
  80080a:	48 89 c2             	mov    %rax,%rdx
  80080d:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800810:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800813:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800817:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081b:	41 89 f9             	mov    %edi,%r9d
  80081e:	48 89 c7             	mov    %rax,%rdi
  800821:	48 b8 cb 07 80 00 00 	movabs $0x8007cb,%rax
  800828:	00 00 00 
  80082b:	ff d0                	callq  *%rax
  80082d:	eb 1e                	jmp    80084d <printnum+0x82>
  80082f:	eb 12                	jmp    800843 <printnum+0x78>
  800831:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800835:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800838:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083c:	48 89 ce             	mov    %rcx,%rsi
  80083f:	89 d7                	mov    %edx,%edi
  800841:	ff d0                	callq  *%rax
  800843:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800847:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  80084b:	7f e4                	jg     800831 <printnum+0x66>
  80084d:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800850:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800854:	ba 00 00 00 00       	mov    $0x0,%edx
  800859:	48 f7 f1             	div    %rcx
  80085c:	48 89 d0             	mov    %rdx,%rax
  80085f:	48 ba f0 4d 80 00 00 	movabs $0x804df0,%rdx
  800866:	00 00 00 
  800869:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  80086d:	0f be d0             	movsbl %al,%edx
  800870:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800874:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800878:	48 89 ce             	mov    %rcx,%rsi
  80087b:	89 d7                	mov    %edx,%edi
  80087d:	ff d0                	callq  *%rax
  80087f:	48 83 c4 38          	add    $0x38,%rsp
  800883:	5b                   	pop    %rbx
  800884:	5d                   	pop    %rbp
  800885:	c3                   	retq   

0000000000800886 <getuint>:
  800886:	55                   	push   %rbp
  800887:	48 89 e5             	mov    %rsp,%rbp
  80088a:	48 83 ec 1c          	sub    $0x1c,%rsp
  80088e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800892:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800895:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800899:	7e 52                	jle    8008ed <getuint+0x67>
  80089b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80089f:	8b 00                	mov    (%rax),%eax
  8008a1:	83 f8 30             	cmp    $0x30,%eax
  8008a4:	73 24                	jae    8008ca <getuint+0x44>
  8008a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008aa:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b2:	8b 00                	mov    (%rax),%eax
  8008b4:	89 c0                	mov    %eax,%eax
  8008b6:	48 01 d0             	add    %rdx,%rax
  8008b9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008bd:	8b 12                	mov    (%rdx),%edx
  8008bf:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008c2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008c6:	89 0a                	mov    %ecx,(%rdx)
  8008c8:	eb 17                	jmp    8008e1 <getuint+0x5b>
  8008ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ce:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008d2:	48 89 d0             	mov    %rdx,%rax
  8008d5:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008d9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008dd:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008e1:	48 8b 00             	mov    (%rax),%rax
  8008e4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008e8:	e9 a3 00 00 00       	jmpq   800990 <getuint+0x10a>
  8008ed:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8008f1:	74 4f                	je     800942 <getuint+0xbc>
  8008f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008f7:	8b 00                	mov    (%rax),%eax
  8008f9:	83 f8 30             	cmp    $0x30,%eax
  8008fc:	73 24                	jae    800922 <getuint+0x9c>
  8008fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800902:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800906:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80090a:	8b 00                	mov    (%rax),%eax
  80090c:	89 c0                	mov    %eax,%eax
  80090e:	48 01 d0             	add    %rdx,%rax
  800911:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800915:	8b 12                	mov    (%rdx),%edx
  800917:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80091a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80091e:	89 0a                	mov    %ecx,(%rdx)
  800920:	eb 17                	jmp    800939 <getuint+0xb3>
  800922:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800926:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80092a:	48 89 d0             	mov    %rdx,%rax
  80092d:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800931:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800935:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800939:	48 8b 00             	mov    (%rax),%rax
  80093c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800940:	eb 4e                	jmp    800990 <getuint+0x10a>
  800942:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800946:	8b 00                	mov    (%rax),%eax
  800948:	83 f8 30             	cmp    $0x30,%eax
  80094b:	73 24                	jae    800971 <getuint+0xeb>
  80094d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800951:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800955:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800959:	8b 00                	mov    (%rax),%eax
  80095b:	89 c0                	mov    %eax,%eax
  80095d:	48 01 d0             	add    %rdx,%rax
  800960:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800964:	8b 12                	mov    (%rdx),%edx
  800966:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800969:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80096d:	89 0a                	mov    %ecx,(%rdx)
  80096f:	eb 17                	jmp    800988 <getuint+0x102>
  800971:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800975:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800979:	48 89 d0             	mov    %rdx,%rax
  80097c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800980:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800984:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800988:	8b 00                	mov    (%rax),%eax
  80098a:	89 c0                	mov    %eax,%eax
  80098c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800990:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800994:	c9                   	leaveq 
  800995:	c3                   	retq   

0000000000800996 <getint>:
  800996:	55                   	push   %rbp
  800997:	48 89 e5             	mov    %rsp,%rbp
  80099a:	48 83 ec 1c          	sub    $0x1c,%rsp
  80099e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8009a2:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8009a5:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8009a9:	7e 52                	jle    8009fd <getint+0x67>
  8009ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009af:	8b 00                	mov    (%rax),%eax
  8009b1:	83 f8 30             	cmp    $0x30,%eax
  8009b4:	73 24                	jae    8009da <getint+0x44>
  8009b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009ba:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c2:	8b 00                	mov    (%rax),%eax
  8009c4:	89 c0                	mov    %eax,%eax
  8009c6:	48 01 d0             	add    %rdx,%rax
  8009c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009cd:	8b 12                	mov    (%rdx),%edx
  8009cf:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009d2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009d6:	89 0a                	mov    %ecx,(%rdx)
  8009d8:	eb 17                	jmp    8009f1 <getint+0x5b>
  8009da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009de:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009e2:	48 89 d0             	mov    %rdx,%rax
  8009e5:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8009e9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009ed:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009f1:	48 8b 00             	mov    (%rax),%rax
  8009f4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009f8:	e9 a3 00 00 00       	jmpq   800aa0 <getint+0x10a>
  8009fd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800a01:	74 4f                	je     800a52 <getint+0xbc>
  800a03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a07:	8b 00                	mov    (%rax),%eax
  800a09:	83 f8 30             	cmp    $0x30,%eax
  800a0c:	73 24                	jae    800a32 <getint+0x9c>
  800a0e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a12:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a1a:	8b 00                	mov    (%rax),%eax
  800a1c:	89 c0                	mov    %eax,%eax
  800a1e:	48 01 d0             	add    %rdx,%rax
  800a21:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a25:	8b 12                	mov    (%rdx),%edx
  800a27:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a2a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a2e:	89 0a                	mov    %ecx,(%rdx)
  800a30:	eb 17                	jmp    800a49 <getint+0xb3>
  800a32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a36:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a3a:	48 89 d0             	mov    %rdx,%rax
  800a3d:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a41:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a45:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a49:	48 8b 00             	mov    (%rax),%rax
  800a4c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a50:	eb 4e                	jmp    800aa0 <getint+0x10a>
  800a52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a56:	8b 00                	mov    (%rax),%eax
  800a58:	83 f8 30             	cmp    $0x30,%eax
  800a5b:	73 24                	jae    800a81 <getint+0xeb>
  800a5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a61:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a69:	8b 00                	mov    (%rax),%eax
  800a6b:	89 c0                	mov    %eax,%eax
  800a6d:	48 01 d0             	add    %rdx,%rax
  800a70:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a74:	8b 12                	mov    (%rdx),%edx
  800a76:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a79:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a7d:	89 0a                	mov    %ecx,(%rdx)
  800a7f:	eb 17                	jmp    800a98 <getint+0x102>
  800a81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a85:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a89:	48 89 d0             	mov    %rdx,%rax
  800a8c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a90:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a94:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a98:	8b 00                	mov    (%rax),%eax
  800a9a:	48 98                	cltq   
  800a9c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800aa0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800aa4:	c9                   	leaveq 
  800aa5:	c3                   	retq   

0000000000800aa6 <vprintfmt>:
  800aa6:	55                   	push   %rbp
  800aa7:	48 89 e5             	mov    %rsp,%rbp
  800aaa:	41 54                	push   %r12
  800aac:	53                   	push   %rbx
  800aad:	48 83 ec 60          	sub    $0x60,%rsp
  800ab1:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800ab5:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800ab9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800abd:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800ac1:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ac5:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800ac9:	48 8b 0a             	mov    (%rdx),%rcx
  800acc:	48 89 08             	mov    %rcx,(%rax)
  800acf:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ad3:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ad7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800adb:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800adf:	eb 17                	jmp    800af8 <vprintfmt+0x52>
  800ae1:	85 db                	test   %ebx,%ebx
  800ae3:	0f 84 cc 04 00 00    	je     800fb5 <vprintfmt+0x50f>
  800ae9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800aed:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800af1:	48 89 d6             	mov    %rdx,%rsi
  800af4:	89 df                	mov    %ebx,%edi
  800af6:	ff d0                	callq  *%rax
  800af8:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800afc:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800b00:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b04:	0f b6 00             	movzbl (%rax),%eax
  800b07:	0f b6 d8             	movzbl %al,%ebx
  800b0a:	83 fb 25             	cmp    $0x25,%ebx
  800b0d:	75 d2                	jne    800ae1 <vprintfmt+0x3b>
  800b0f:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800b13:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800b1a:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b21:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800b28:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800b2f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b33:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800b37:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b3b:	0f b6 00             	movzbl (%rax),%eax
  800b3e:	0f b6 d8             	movzbl %al,%ebx
  800b41:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800b44:	83 f8 55             	cmp    $0x55,%eax
  800b47:	0f 87 34 04 00 00    	ja     800f81 <vprintfmt+0x4db>
  800b4d:	89 c0                	mov    %eax,%eax
  800b4f:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800b56:	00 
  800b57:	48 b8 18 4e 80 00 00 	movabs $0x804e18,%rax
  800b5e:	00 00 00 
  800b61:	48 01 d0             	add    %rdx,%rax
  800b64:	48 8b 00             	mov    (%rax),%rax
  800b67:	ff e0                	jmpq   *%rax
  800b69:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800b6d:	eb c0                	jmp    800b2f <vprintfmt+0x89>
  800b6f:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800b73:	eb ba                	jmp    800b2f <vprintfmt+0x89>
  800b75:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800b7c:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800b7f:	89 d0                	mov    %edx,%eax
  800b81:	c1 e0 02             	shl    $0x2,%eax
  800b84:	01 d0                	add    %edx,%eax
  800b86:	01 c0                	add    %eax,%eax
  800b88:	01 d8                	add    %ebx,%eax
  800b8a:	83 e8 30             	sub    $0x30,%eax
  800b8d:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b90:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b94:	0f b6 00             	movzbl (%rax),%eax
  800b97:	0f be d8             	movsbl %al,%ebx
  800b9a:	83 fb 2f             	cmp    $0x2f,%ebx
  800b9d:	7e 0c                	jle    800bab <vprintfmt+0x105>
  800b9f:	83 fb 39             	cmp    $0x39,%ebx
  800ba2:	7f 07                	jg     800bab <vprintfmt+0x105>
  800ba4:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800ba9:	eb d1                	jmp    800b7c <vprintfmt+0xd6>
  800bab:	eb 58                	jmp    800c05 <vprintfmt+0x15f>
  800bad:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bb0:	83 f8 30             	cmp    $0x30,%eax
  800bb3:	73 17                	jae    800bcc <vprintfmt+0x126>
  800bb5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800bb9:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bbc:	89 c0                	mov    %eax,%eax
  800bbe:	48 01 d0             	add    %rdx,%rax
  800bc1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bc4:	83 c2 08             	add    $0x8,%edx
  800bc7:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bca:	eb 0f                	jmp    800bdb <vprintfmt+0x135>
  800bcc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800bd0:	48 89 d0             	mov    %rdx,%rax
  800bd3:	48 83 c2 08          	add    $0x8,%rdx
  800bd7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bdb:	8b 00                	mov    (%rax),%eax
  800bdd:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800be0:	eb 23                	jmp    800c05 <vprintfmt+0x15f>
  800be2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800be6:	79 0c                	jns    800bf4 <vprintfmt+0x14e>
  800be8:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800bef:	e9 3b ff ff ff       	jmpq   800b2f <vprintfmt+0x89>
  800bf4:	e9 36 ff ff ff       	jmpq   800b2f <vprintfmt+0x89>
  800bf9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800c00:	e9 2a ff ff ff       	jmpq   800b2f <vprintfmt+0x89>
  800c05:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c09:	79 12                	jns    800c1d <vprintfmt+0x177>
  800c0b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c0e:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800c11:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800c18:	e9 12 ff ff ff       	jmpq   800b2f <vprintfmt+0x89>
  800c1d:	e9 0d ff ff ff       	jmpq   800b2f <vprintfmt+0x89>
  800c22:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800c26:	e9 04 ff ff ff       	jmpq   800b2f <vprintfmt+0x89>
  800c2b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c2e:	83 f8 30             	cmp    $0x30,%eax
  800c31:	73 17                	jae    800c4a <vprintfmt+0x1a4>
  800c33:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c37:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c3a:	89 c0                	mov    %eax,%eax
  800c3c:	48 01 d0             	add    %rdx,%rax
  800c3f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c42:	83 c2 08             	add    $0x8,%edx
  800c45:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c48:	eb 0f                	jmp    800c59 <vprintfmt+0x1b3>
  800c4a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c4e:	48 89 d0             	mov    %rdx,%rax
  800c51:	48 83 c2 08          	add    $0x8,%rdx
  800c55:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c59:	8b 10                	mov    (%rax),%edx
  800c5b:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c5f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c63:	48 89 ce             	mov    %rcx,%rsi
  800c66:	89 d7                	mov    %edx,%edi
  800c68:	ff d0                	callq  *%rax
  800c6a:	e9 40 03 00 00       	jmpq   800faf <vprintfmt+0x509>
  800c6f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c72:	83 f8 30             	cmp    $0x30,%eax
  800c75:	73 17                	jae    800c8e <vprintfmt+0x1e8>
  800c77:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c7b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c7e:	89 c0                	mov    %eax,%eax
  800c80:	48 01 d0             	add    %rdx,%rax
  800c83:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c86:	83 c2 08             	add    $0x8,%edx
  800c89:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c8c:	eb 0f                	jmp    800c9d <vprintfmt+0x1f7>
  800c8e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c92:	48 89 d0             	mov    %rdx,%rax
  800c95:	48 83 c2 08          	add    $0x8,%rdx
  800c99:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c9d:	8b 18                	mov    (%rax),%ebx
  800c9f:	85 db                	test   %ebx,%ebx
  800ca1:	79 02                	jns    800ca5 <vprintfmt+0x1ff>
  800ca3:	f7 db                	neg    %ebx
  800ca5:	83 fb 15             	cmp    $0x15,%ebx
  800ca8:	7f 16                	jg     800cc0 <vprintfmt+0x21a>
  800caa:	48 b8 40 4d 80 00 00 	movabs $0x804d40,%rax
  800cb1:	00 00 00 
  800cb4:	48 63 d3             	movslq %ebx,%rdx
  800cb7:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800cbb:	4d 85 e4             	test   %r12,%r12
  800cbe:	75 2e                	jne    800cee <vprintfmt+0x248>
  800cc0:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800cc4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cc8:	89 d9                	mov    %ebx,%ecx
  800cca:	48 ba 01 4e 80 00 00 	movabs $0x804e01,%rdx
  800cd1:	00 00 00 
  800cd4:	48 89 c7             	mov    %rax,%rdi
  800cd7:	b8 00 00 00 00       	mov    $0x0,%eax
  800cdc:	49 b8 be 0f 80 00 00 	movabs $0x800fbe,%r8
  800ce3:	00 00 00 
  800ce6:	41 ff d0             	callq  *%r8
  800ce9:	e9 c1 02 00 00       	jmpq   800faf <vprintfmt+0x509>
  800cee:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800cf2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cf6:	4c 89 e1             	mov    %r12,%rcx
  800cf9:	48 ba 0a 4e 80 00 00 	movabs $0x804e0a,%rdx
  800d00:	00 00 00 
  800d03:	48 89 c7             	mov    %rax,%rdi
  800d06:	b8 00 00 00 00       	mov    $0x0,%eax
  800d0b:	49 b8 be 0f 80 00 00 	movabs $0x800fbe,%r8
  800d12:	00 00 00 
  800d15:	41 ff d0             	callq  *%r8
  800d18:	e9 92 02 00 00       	jmpq   800faf <vprintfmt+0x509>
  800d1d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d20:	83 f8 30             	cmp    $0x30,%eax
  800d23:	73 17                	jae    800d3c <vprintfmt+0x296>
  800d25:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d29:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d2c:	89 c0                	mov    %eax,%eax
  800d2e:	48 01 d0             	add    %rdx,%rax
  800d31:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d34:	83 c2 08             	add    $0x8,%edx
  800d37:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d3a:	eb 0f                	jmp    800d4b <vprintfmt+0x2a5>
  800d3c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d40:	48 89 d0             	mov    %rdx,%rax
  800d43:	48 83 c2 08          	add    $0x8,%rdx
  800d47:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d4b:	4c 8b 20             	mov    (%rax),%r12
  800d4e:	4d 85 e4             	test   %r12,%r12
  800d51:	75 0a                	jne    800d5d <vprintfmt+0x2b7>
  800d53:	49 bc 0d 4e 80 00 00 	movabs $0x804e0d,%r12
  800d5a:	00 00 00 
  800d5d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d61:	7e 3f                	jle    800da2 <vprintfmt+0x2fc>
  800d63:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800d67:	74 39                	je     800da2 <vprintfmt+0x2fc>
  800d69:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800d6c:	48 98                	cltq   
  800d6e:	48 89 c6             	mov    %rax,%rsi
  800d71:	4c 89 e7             	mov    %r12,%rdi
  800d74:	48 b8 6a 12 80 00 00 	movabs $0x80126a,%rax
  800d7b:	00 00 00 
  800d7e:	ff d0                	callq  *%rax
  800d80:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800d83:	eb 17                	jmp    800d9c <vprintfmt+0x2f6>
  800d85:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800d89:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800d8d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d91:	48 89 ce             	mov    %rcx,%rsi
  800d94:	89 d7                	mov    %edx,%edi
  800d96:	ff d0                	callq  *%rax
  800d98:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d9c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800da0:	7f e3                	jg     800d85 <vprintfmt+0x2df>
  800da2:	eb 37                	jmp    800ddb <vprintfmt+0x335>
  800da4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800da8:	74 1e                	je     800dc8 <vprintfmt+0x322>
  800daa:	83 fb 1f             	cmp    $0x1f,%ebx
  800dad:	7e 05                	jle    800db4 <vprintfmt+0x30e>
  800daf:	83 fb 7e             	cmp    $0x7e,%ebx
  800db2:	7e 14                	jle    800dc8 <vprintfmt+0x322>
  800db4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800db8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dbc:	48 89 d6             	mov    %rdx,%rsi
  800dbf:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800dc4:	ff d0                	callq  *%rax
  800dc6:	eb 0f                	jmp    800dd7 <vprintfmt+0x331>
  800dc8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dcc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dd0:	48 89 d6             	mov    %rdx,%rsi
  800dd3:	89 df                	mov    %ebx,%edi
  800dd5:	ff d0                	callq  *%rax
  800dd7:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ddb:	4c 89 e0             	mov    %r12,%rax
  800dde:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800de2:	0f b6 00             	movzbl (%rax),%eax
  800de5:	0f be d8             	movsbl %al,%ebx
  800de8:	85 db                	test   %ebx,%ebx
  800dea:	74 10                	je     800dfc <vprintfmt+0x356>
  800dec:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800df0:	78 b2                	js     800da4 <vprintfmt+0x2fe>
  800df2:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800df6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800dfa:	79 a8                	jns    800da4 <vprintfmt+0x2fe>
  800dfc:	eb 16                	jmp    800e14 <vprintfmt+0x36e>
  800dfe:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e02:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e06:	48 89 d6             	mov    %rdx,%rsi
  800e09:	bf 20 00 00 00       	mov    $0x20,%edi
  800e0e:	ff d0                	callq  *%rax
  800e10:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800e14:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e18:	7f e4                	jg     800dfe <vprintfmt+0x358>
  800e1a:	e9 90 01 00 00       	jmpq   800faf <vprintfmt+0x509>
  800e1f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e23:	be 03 00 00 00       	mov    $0x3,%esi
  800e28:	48 89 c7             	mov    %rax,%rdi
  800e2b:	48 b8 96 09 80 00 00 	movabs $0x800996,%rax
  800e32:	00 00 00 
  800e35:	ff d0                	callq  *%rax
  800e37:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e3f:	48 85 c0             	test   %rax,%rax
  800e42:	79 1d                	jns    800e61 <vprintfmt+0x3bb>
  800e44:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e48:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e4c:	48 89 d6             	mov    %rdx,%rsi
  800e4f:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800e54:	ff d0                	callq  *%rax
  800e56:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e5a:	48 f7 d8             	neg    %rax
  800e5d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e61:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800e68:	e9 d5 00 00 00       	jmpq   800f42 <vprintfmt+0x49c>
  800e6d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e71:	be 03 00 00 00       	mov    $0x3,%esi
  800e76:	48 89 c7             	mov    %rax,%rdi
  800e79:	48 b8 86 08 80 00 00 	movabs $0x800886,%rax
  800e80:	00 00 00 
  800e83:	ff d0                	callq  *%rax
  800e85:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e89:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800e90:	e9 ad 00 00 00       	jmpq   800f42 <vprintfmt+0x49c>
  800e95:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e99:	be 03 00 00 00       	mov    $0x3,%esi
  800e9e:	48 89 c7             	mov    %rax,%rdi
  800ea1:	48 b8 86 08 80 00 00 	movabs $0x800886,%rax
  800ea8:	00 00 00 
  800eab:	ff d0                	callq  *%rax
  800ead:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800eb1:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800eb8:	e9 85 00 00 00       	jmpq   800f42 <vprintfmt+0x49c>
  800ebd:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ec1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ec5:	48 89 d6             	mov    %rdx,%rsi
  800ec8:	bf 30 00 00 00       	mov    $0x30,%edi
  800ecd:	ff d0                	callq  *%rax
  800ecf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ed3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ed7:	48 89 d6             	mov    %rdx,%rsi
  800eda:	bf 78 00 00 00       	mov    $0x78,%edi
  800edf:	ff d0                	callq  *%rax
  800ee1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ee4:	83 f8 30             	cmp    $0x30,%eax
  800ee7:	73 17                	jae    800f00 <vprintfmt+0x45a>
  800ee9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800eed:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ef0:	89 c0                	mov    %eax,%eax
  800ef2:	48 01 d0             	add    %rdx,%rax
  800ef5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ef8:	83 c2 08             	add    $0x8,%edx
  800efb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800efe:	eb 0f                	jmp    800f0f <vprintfmt+0x469>
  800f00:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800f04:	48 89 d0             	mov    %rdx,%rax
  800f07:	48 83 c2 08          	add    $0x8,%rdx
  800f0b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800f0f:	48 8b 00             	mov    (%rax),%rax
  800f12:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f16:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800f1d:	eb 23                	jmp    800f42 <vprintfmt+0x49c>
  800f1f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f23:	be 03 00 00 00       	mov    $0x3,%esi
  800f28:	48 89 c7             	mov    %rax,%rdi
  800f2b:	48 b8 86 08 80 00 00 	movabs $0x800886,%rax
  800f32:	00 00 00 
  800f35:	ff d0                	callq  *%rax
  800f37:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f3b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800f42:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800f47:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800f4a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800f4d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f51:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800f55:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f59:	45 89 c1             	mov    %r8d,%r9d
  800f5c:	41 89 f8             	mov    %edi,%r8d
  800f5f:	48 89 c7             	mov    %rax,%rdi
  800f62:	48 b8 cb 07 80 00 00 	movabs $0x8007cb,%rax
  800f69:	00 00 00 
  800f6c:	ff d0                	callq  *%rax
  800f6e:	eb 3f                	jmp    800faf <vprintfmt+0x509>
  800f70:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f74:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f78:	48 89 d6             	mov    %rdx,%rsi
  800f7b:	89 df                	mov    %ebx,%edi
  800f7d:	ff d0                	callq  *%rax
  800f7f:	eb 2e                	jmp    800faf <vprintfmt+0x509>
  800f81:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f85:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f89:	48 89 d6             	mov    %rdx,%rsi
  800f8c:	bf 25 00 00 00       	mov    $0x25,%edi
  800f91:	ff d0                	callq  *%rax
  800f93:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f98:	eb 05                	jmp    800f9f <vprintfmt+0x4f9>
  800f9a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f9f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800fa3:	48 83 e8 01          	sub    $0x1,%rax
  800fa7:	0f b6 00             	movzbl (%rax),%eax
  800faa:	3c 25                	cmp    $0x25,%al
  800fac:	75 ec                	jne    800f9a <vprintfmt+0x4f4>
  800fae:	90                   	nop
  800faf:	90                   	nop
  800fb0:	e9 43 fb ff ff       	jmpq   800af8 <vprintfmt+0x52>
  800fb5:	48 83 c4 60          	add    $0x60,%rsp
  800fb9:	5b                   	pop    %rbx
  800fba:	41 5c                	pop    %r12
  800fbc:	5d                   	pop    %rbp
  800fbd:	c3                   	retq   

0000000000800fbe <printfmt>:
  800fbe:	55                   	push   %rbp
  800fbf:	48 89 e5             	mov    %rsp,%rbp
  800fc2:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800fc9:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800fd0:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800fd7:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800fde:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800fe5:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800fec:	84 c0                	test   %al,%al
  800fee:	74 20                	je     801010 <printfmt+0x52>
  800ff0:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800ff4:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800ff8:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800ffc:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801000:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801004:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801008:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80100c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801010:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801017:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  80101e:	00 00 00 
  801021:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  801028:	00 00 00 
  80102b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80102f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801036:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80103d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801044:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80104b:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801052:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801059:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801060:	48 89 c7             	mov    %rax,%rdi
  801063:	48 b8 a6 0a 80 00 00 	movabs $0x800aa6,%rax
  80106a:	00 00 00 
  80106d:	ff d0                	callq  *%rax
  80106f:	c9                   	leaveq 
  801070:	c3                   	retq   

0000000000801071 <sprintputch>:
  801071:	55                   	push   %rbp
  801072:	48 89 e5             	mov    %rsp,%rbp
  801075:	48 83 ec 10          	sub    $0x10,%rsp
  801079:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80107c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801080:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801084:	8b 40 10             	mov    0x10(%rax),%eax
  801087:	8d 50 01             	lea    0x1(%rax),%edx
  80108a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80108e:	89 50 10             	mov    %edx,0x10(%rax)
  801091:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801095:	48 8b 10             	mov    (%rax),%rdx
  801098:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80109c:	48 8b 40 08          	mov    0x8(%rax),%rax
  8010a0:	48 39 c2             	cmp    %rax,%rdx
  8010a3:	73 17                	jae    8010bc <sprintputch+0x4b>
  8010a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010a9:	48 8b 00             	mov    (%rax),%rax
  8010ac:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8010b0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8010b4:	48 89 0a             	mov    %rcx,(%rdx)
  8010b7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8010ba:	88 10                	mov    %dl,(%rax)
  8010bc:	c9                   	leaveq 
  8010bd:	c3                   	retq   

00000000008010be <vsnprintf>:
  8010be:	55                   	push   %rbp
  8010bf:	48 89 e5             	mov    %rsp,%rbp
  8010c2:	48 83 ec 50          	sub    $0x50,%rsp
  8010c6:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8010ca:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8010cd:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8010d1:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8010d5:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8010d9:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8010dd:	48 8b 0a             	mov    (%rdx),%rcx
  8010e0:	48 89 08             	mov    %rcx,(%rax)
  8010e3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8010e7:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8010eb:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8010ef:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8010f3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8010f7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8010fb:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  8010fe:	48 98                	cltq   
  801100:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801104:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801108:	48 01 d0             	add    %rdx,%rax
  80110b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  80110f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801116:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80111b:	74 06                	je     801123 <vsnprintf+0x65>
  80111d:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801121:	7f 07                	jg     80112a <vsnprintf+0x6c>
  801123:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801128:	eb 2f                	jmp    801159 <vsnprintf+0x9b>
  80112a:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  80112e:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801132:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801136:	48 89 c6             	mov    %rax,%rsi
  801139:	48 bf 71 10 80 00 00 	movabs $0x801071,%rdi
  801140:	00 00 00 
  801143:	48 b8 a6 0a 80 00 00 	movabs $0x800aa6,%rax
  80114a:	00 00 00 
  80114d:	ff d0                	callq  *%rax
  80114f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801153:	c6 00 00             	movb   $0x0,(%rax)
  801156:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801159:	c9                   	leaveq 
  80115a:	c3                   	retq   

000000000080115b <snprintf>:
  80115b:	55                   	push   %rbp
  80115c:	48 89 e5             	mov    %rsp,%rbp
  80115f:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801166:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80116d:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801173:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80117a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801181:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801188:	84 c0                	test   %al,%al
  80118a:	74 20                	je     8011ac <snprintf+0x51>
  80118c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801190:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801194:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801198:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80119c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8011a0:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8011a4:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8011a8:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8011ac:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8011b3:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8011ba:	00 00 00 
  8011bd:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8011c4:	00 00 00 
  8011c7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8011cb:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8011d2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8011d9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8011e0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8011e7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8011ee:	48 8b 0a             	mov    (%rdx),%rcx
  8011f1:	48 89 08             	mov    %rcx,(%rax)
  8011f4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8011f8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8011fc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801200:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801204:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80120b:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801212:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801218:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80121f:	48 89 c7             	mov    %rax,%rdi
  801222:	48 b8 be 10 80 00 00 	movabs $0x8010be,%rax
  801229:	00 00 00 
  80122c:	ff d0                	callq  *%rax
  80122e:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801234:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80123a:	c9                   	leaveq 
  80123b:	c3                   	retq   

000000000080123c <strlen>:
  80123c:	55                   	push   %rbp
  80123d:	48 89 e5             	mov    %rsp,%rbp
  801240:	48 83 ec 18          	sub    $0x18,%rsp
  801244:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801248:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80124f:	eb 09                	jmp    80125a <strlen+0x1e>
  801251:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801255:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80125a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80125e:	0f b6 00             	movzbl (%rax),%eax
  801261:	84 c0                	test   %al,%al
  801263:	75 ec                	jne    801251 <strlen+0x15>
  801265:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801268:	c9                   	leaveq 
  801269:	c3                   	retq   

000000000080126a <strnlen>:
  80126a:	55                   	push   %rbp
  80126b:	48 89 e5             	mov    %rsp,%rbp
  80126e:	48 83 ec 20          	sub    $0x20,%rsp
  801272:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801276:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80127a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801281:	eb 0e                	jmp    801291 <strnlen+0x27>
  801283:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801287:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80128c:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801291:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801296:	74 0b                	je     8012a3 <strnlen+0x39>
  801298:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80129c:	0f b6 00             	movzbl (%rax),%eax
  80129f:	84 c0                	test   %al,%al
  8012a1:	75 e0                	jne    801283 <strnlen+0x19>
  8012a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012a6:	c9                   	leaveq 
  8012a7:	c3                   	retq   

00000000008012a8 <strcpy>:
  8012a8:	55                   	push   %rbp
  8012a9:	48 89 e5             	mov    %rsp,%rbp
  8012ac:	48 83 ec 20          	sub    $0x20,%rsp
  8012b0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012b4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012bc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012c0:	90                   	nop
  8012c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012c9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012cd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012d1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8012d5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8012d9:	0f b6 12             	movzbl (%rdx),%edx
  8012dc:	88 10                	mov    %dl,(%rax)
  8012de:	0f b6 00             	movzbl (%rax),%eax
  8012e1:	84 c0                	test   %al,%al
  8012e3:	75 dc                	jne    8012c1 <strcpy+0x19>
  8012e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012e9:	c9                   	leaveq 
  8012ea:	c3                   	retq   

00000000008012eb <strcat>:
  8012eb:	55                   	push   %rbp
  8012ec:	48 89 e5             	mov    %rsp,%rbp
  8012ef:	48 83 ec 20          	sub    $0x20,%rsp
  8012f3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012f7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012ff:	48 89 c7             	mov    %rax,%rdi
  801302:	48 b8 3c 12 80 00 00 	movabs $0x80123c,%rax
  801309:	00 00 00 
  80130c:	ff d0                	callq  *%rax
  80130e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801311:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801314:	48 63 d0             	movslq %eax,%rdx
  801317:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80131b:	48 01 c2             	add    %rax,%rdx
  80131e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801322:	48 89 c6             	mov    %rax,%rsi
  801325:	48 89 d7             	mov    %rdx,%rdi
  801328:	48 b8 a8 12 80 00 00 	movabs $0x8012a8,%rax
  80132f:	00 00 00 
  801332:	ff d0                	callq  *%rax
  801334:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801338:	c9                   	leaveq 
  801339:	c3                   	retq   

000000000080133a <strncpy>:
  80133a:	55                   	push   %rbp
  80133b:	48 89 e5             	mov    %rsp,%rbp
  80133e:	48 83 ec 28          	sub    $0x28,%rsp
  801342:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801346:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80134a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80134e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801352:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801356:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80135d:	00 
  80135e:	eb 2a                	jmp    80138a <strncpy+0x50>
  801360:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801364:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801368:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80136c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801370:	0f b6 12             	movzbl (%rdx),%edx
  801373:	88 10                	mov    %dl,(%rax)
  801375:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801379:	0f b6 00             	movzbl (%rax),%eax
  80137c:	84 c0                	test   %al,%al
  80137e:	74 05                	je     801385 <strncpy+0x4b>
  801380:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801385:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80138a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80138e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801392:	72 cc                	jb     801360 <strncpy+0x26>
  801394:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801398:	c9                   	leaveq 
  801399:	c3                   	retq   

000000000080139a <strlcpy>:
  80139a:	55                   	push   %rbp
  80139b:	48 89 e5             	mov    %rsp,%rbp
  80139e:	48 83 ec 28          	sub    $0x28,%rsp
  8013a2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013a6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013aa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013b2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013b6:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8013bb:	74 3d                	je     8013fa <strlcpy+0x60>
  8013bd:	eb 1d                	jmp    8013dc <strlcpy+0x42>
  8013bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013c3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8013c7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013cb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8013cf:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8013d3:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8013d7:	0f b6 12             	movzbl (%rdx),%edx
  8013da:	88 10                	mov    %dl,(%rax)
  8013dc:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8013e1:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8013e6:	74 0b                	je     8013f3 <strlcpy+0x59>
  8013e8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013ec:	0f b6 00             	movzbl (%rax),%eax
  8013ef:	84 c0                	test   %al,%al
  8013f1:	75 cc                	jne    8013bf <strlcpy+0x25>
  8013f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013f7:	c6 00 00             	movb   $0x0,(%rax)
  8013fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8013fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801402:	48 29 c2             	sub    %rax,%rdx
  801405:	48 89 d0             	mov    %rdx,%rax
  801408:	c9                   	leaveq 
  801409:	c3                   	retq   

000000000080140a <strcmp>:
  80140a:	55                   	push   %rbp
  80140b:	48 89 e5             	mov    %rsp,%rbp
  80140e:	48 83 ec 10          	sub    $0x10,%rsp
  801412:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801416:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80141a:	eb 0a                	jmp    801426 <strcmp+0x1c>
  80141c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801421:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801426:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80142a:	0f b6 00             	movzbl (%rax),%eax
  80142d:	84 c0                	test   %al,%al
  80142f:	74 12                	je     801443 <strcmp+0x39>
  801431:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801435:	0f b6 10             	movzbl (%rax),%edx
  801438:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80143c:	0f b6 00             	movzbl (%rax),%eax
  80143f:	38 c2                	cmp    %al,%dl
  801441:	74 d9                	je     80141c <strcmp+0x12>
  801443:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801447:	0f b6 00             	movzbl (%rax),%eax
  80144a:	0f b6 d0             	movzbl %al,%edx
  80144d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801451:	0f b6 00             	movzbl (%rax),%eax
  801454:	0f b6 c0             	movzbl %al,%eax
  801457:	29 c2                	sub    %eax,%edx
  801459:	89 d0                	mov    %edx,%eax
  80145b:	c9                   	leaveq 
  80145c:	c3                   	retq   

000000000080145d <strncmp>:
  80145d:	55                   	push   %rbp
  80145e:	48 89 e5             	mov    %rsp,%rbp
  801461:	48 83 ec 18          	sub    $0x18,%rsp
  801465:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801469:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80146d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801471:	eb 0f                	jmp    801482 <strncmp+0x25>
  801473:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801478:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80147d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801482:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801487:	74 1d                	je     8014a6 <strncmp+0x49>
  801489:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80148d:	0f b6 00             	movzbl (%rax),%eax
  801490:	84 c0                	test   %al,%al
  801492:	74 12                	je     8014a6 <strncmp+0x49>
  801494:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801498:	0f b6 10             	movzbl (%rax),%edx
  80149b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80149f:	0f b6 00             	movzbl (%rax),%eax
  8014a2:	38 c2                	cmp    %al,%dl
  8014a4:	74 cd                	je     801473 <strncmp+0x16>
  8014a6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8014ab:	75 07                	jne    8014b4 <strncmp+0x57>
  8014ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8014b2:	eb 18                	jmp    8014cc <strncmp+0x6f>
  8014b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b8:	0f b6 00             	movzbl (%rax),%eax
  8014bb:	0f b6 d0             	movzbl %al,%edx
  8014be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014c2:	0f b6 00             	movzbl (%rax),%eax
  8014c5:	0f b6 c0             	movzbl %al,%eax
  8014c8:	29 c2                	sub    %eax,%edx
  8014ca:	89 d0                	mov    %edx,%eax
  8014cc:	c9                   	leaveq 
  8014cd:	c3                   	retq   

00000000008014ce <strchr>:
  8014ce:	55                   	push   %rbp
  8014cf:	48 89 e5             	mov    %rsp,%rbp
  8014d2:	48 83 ec 0c          	sub    $0xc,%rsp
  8014d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014da:	89 f0                	mov    %esi,%eax
  8014dc:	88 45 f4             	mov    %al,-0xc(%rbp)
  8014df:	eb 17                	jmp    8014f8 <strchr+0x2a>
  8014e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014e5:	0f b6 00             	movzbl (%rax),%eax
  8014e8:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8014eb:	75 06                	jne    8014f3 <strchr+0x25>
  8014ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014f1:	eb 15                	jmp    801508 <strchr+0x3a>
  8014f3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014fc:	0f b6 00             	movzbl (%rax),%eax
  8014ff:	84 c0                	test   %al,%al
  801501:	75 de                	jne    8014e1 <strchr+0x13>
  801503:	b8 00 00 00 00       	mov    $0x0,%eax
  801508:	c9                   	leaveq 
  801509:	c3                   	retq   

000000000080150a <strfind>:
  80150a:	55                   	push   %rbp
  80150b:	48 89 e5             	mov    %rsp,%rbp
  80150e:	48 83 ec 0c          	sub    $0xc,%rsp
  801512:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801516:	89 f0                	mov    %esi,%eax
  801518:	88 45 f4             	mov    %al,-0xc(%rbp)
  80151b:	eb 13                	jmp    801530 <strfind+0x26>
  80151d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801521:	0f b6 00             	movzbl (%rax),%eax
  801524:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801527:	75 02                	jne    80152b <strfind+0x21>
  801529:	eb 10                	jmp    80153b <strfind+0x31>
  80152b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801530:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801534:	0f b6 00             	movzbl (%rax),%eax
  801537:	84 c0                	test   %al,%al
  801539:	75 e2                	jne    80151d <strfind+0x13>
  80153b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80153f:	c9                   	leaveq 
  801540:	c3                   	retq   

0000000000801541 <memset>:
  801541:	55                   	push   %rbp
  801542:	48 89 e5             	mov    %rsp,%rbp
  801545:	48 83 ec 18          	sub    $0x18,%rsp
  801549:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80154d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801550:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801554:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801559:	75 06                	jne    801561 <memset+0x20>
  80155b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80155f:	eb 69                	jmp    8015ca <memset+0x89>
  801561:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801565:	83 e0 03             	and    $0x3,%eax
  801568:	48 85 c0             	test   %rax,%rax
  80156b:	75 48                	jne    8015b5 <memset+0x74>
  80156d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801571:	83 e0 03             	and    $0x3,%eax
  801574:	48 85 c0             	test   %rax,%rax
  801577:	75 3c                	jne    8015b5 <memset+0x74>
  801579:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801580:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801583:	c1 e0 18             	shl    $0x18,%eax
  801586:	89 c2                	mov    %eax,%edx
  801588:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80158b:	c1 e0 10             	shl    $0x10,%eax
  80158e:	09 c2                	or     %eax,%edx
  801590:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801593:	c1 e0 08             	shl    $0x8,%eax
  801596:	09 d0                	or     %edx,%eax
  801598:	09 45 f4             	or     %eax,-0xc(%rbp)
  80159b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80159f:	48 c1 e8 02          	shr    $0x2,%rax
  8015a3:	48 89 c1             	mov    %rax,%rcx
  8015a6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015aa:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8015ad:	48 89 d7             	mov    %rdx,%rdi
  8015b0:	fc                   	cld    
  8015b1:	f3 ab                	rep stos %eax,%es:(%rdi)
  8015b3:	eb 11                	jmp    8015c6 <memset+0x85>
  8015b5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015b9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8015bc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8015c0:	48 89 d7             	mov    %rdx,%rdi
  8015c3:	fc                   	cld    
  8015c4:	f3 aa                	rep stos %al,%es:(%rdi)
  8015c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015ca:	c9                   	leaveq 
  8015cb:	c3                   	retq   

00000000008015cc <memmove>:
  8015cc:	55                   	push   %rbp
  8015cd:	48 89 e5             	mov    %rsp,%rbp
  8015d0:	48 83 ec 28          	sub    $0x28,%rsp
  8015d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8015dc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015e0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015e4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015ec:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015f4:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8015f8:	0f 83 88 00 00 00    	jae    801686 <memmove+0xba>
  8015fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801602:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801606:	48 01 d0             	add    %rdx,%rax
  801609:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80160d:	76 77                	jbe    801686 <memmove+0xba>
  80160f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801613:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801617:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161b:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80161f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801623:	83 e0 03             	and    $0x3,%eax
  801626:	48 85 c0             	test   %rax,%rax
  801629:	75 3b                	jne    801666 <memmove+0x9a>
  80162b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80162f:	83 e0 03             	and    $0x3,%eax
  801632:	48 85 c0             	test   %rax,%rax
  801635:	75 2f                	jne    801666 <memmove+0x9a>
  801637:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80163b:	83 e0 03             	and    $0x3,%eax
  80163e:	48 85 c0             	test   %rax,%rax
  801641:	75 23                	jne    801666 <memmove+0x9a>
  801643:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801647:	48 83 e8 04          	sub    $0x4,%rax
  80164b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80164f:	48 83 ea 04          	sub    $0x4,%rdx
  801653:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801657:	48 c1 e9 02          	shr    $0x2,%rcx
  80165b:	48 89 c7             	mov    %rax,%rdi
  80165e:	48 89 d6             	mov    %rdx,%rsi
  801661:	fd                   	std    
  801662:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801664:	eb 1d                	jmp    801683 <memmove+0xb7>
  801666:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80166a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80166e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801672:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801676:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80167a:	48 89 d7             	mov    %rdx,%rdi
  80167d:	48 89 c1             	mov    %rax,%rcx
  801680:	fd                   	std    
  801681:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801683:	fc                   	cld    
  801684:	eb 57                	jmp    8016dd <memmove+0x111>
  801686:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80168a:	83 e0 03             	and    $0x3,%eax
  80168d:	48 85 c0             	test   %rax,%rax
  801690:	75 36                	jne    8016c8 <memmove+0xfc>
  801692:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801696:	83 e0 03             	and    $0x3,%eax
  801699:	48 85 c0             	test   %rax,%rax
  80169c:	75 2a                	jne    8016c8 <memmove+0xfc>
  80169e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016a2:	83 e0 03             	and    $0x3,%eax
  8016a5:	48 85 c0             	test   %rax,%rax
  8016a8:	75 1e                	jne    8016c8 <memmove+0xfc>
  8016aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ae:	48 c1 e8 02          	shr    $0x2,%rax
  8016b2:	48 89 c1             	mov    %rax,%rcx
  8016b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016b9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016bd:	48 89 c7             	mov    %rax,%rdi
  8016c0:	48 89 d6             	mov    %rdx,%rsi
  8016c3:	fc                   	cld    
  8016c4:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8016c6:	eb 15                	jmp    8016dd <memmove+0x111>
  8016c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016cc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016d0:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8016d4:	48 89 c7             	mov    %rax,%rdi
  8016d7:	48 89 d6             	mov    %rdx,%rsi
  8016da:	fc                   	cld    
  8016db:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8016dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016e1:	c9                   	leaveq 
  8016e2:	c3                   	retq   

00000000008016e3 <memcpy>:
  8016e3:	55                   	push   %rbp
  8016e4:	48 89 e5             	mov    %rsp,%rbp
  8016e7:	48 83 ec 18          	sub    $0x18,%rsp
  8016eb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016f3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016f7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016fb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8016ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801703:	48 89 ce             	mov    %rcx,%rsi
  801706:	48 89 c7             	mov    %rax,%rdi
  801709:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  801710:	00 00 00 
  801713:	ff d0                	callq  *%rax
  801715:	c9                   	leaveq 
  801716:	c3                   	retq   

0000000000801717 <memcmp>:
  801717:	55                   	push   %rbp
  801718:	48 89 e5             	mov    %rsp,%rbp
  80171b:	48 83 ec 28          	sub    $0x28,%rsp
  80171f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801723:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801727:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80172b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80172f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801733:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801737:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80173b:	eb 36                	jmp    801773 <memcmp+0x5c>
  80173d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801741:	0f b6 10             	movzbl (%rax),%edx
  801744:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801748:	0f b6 00             	movzbl (%rax),%eax
  80174b:	38 c2                	cmp    %al,%dl
  80174d:	74 1a                	je     801769 <memcmp+0x52>
  80174f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801753:	0f b6 00             	movzbl (%rax),%eax
  801756:	0f b6 d0             	movzbl %al,%edx
  801759:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80175d:	0f b6 00             	movzbl (%rax),%eax
  801760:	0f b6 c0             	movzbl %al,%eax
  801763:	29 c2                	sub    %eax,%edx
  801765:	89 d0                	mov    %edx,%eax
  801767:	eb 20                	jmp    801789 <memcmp+0x72>
  801769:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80176e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801773:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801777:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80177b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80177f:	48 85 c0             	test   %rax,%rax
  801782:	75 b9                	jne    80173d <memcmp+0x26>
  801784:	b8 00 00 00 00       	mov    $0x0,%eax
  801789:	c9                   	leaveq 
  80178a:	c3                   	retq   

000000000080178b <memfind>:
  80178b:	55                   	push   %rbp
  80178c:	48 89 e5             	mov    %rsp,%rbp
  80178f:	48 83 ec 28          	sub    $0x28,%rsp
  801793:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801797:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80179a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80179e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017a6:	48 01 d0             	add    %rdx,%rax
  8017a9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8017ad:	eb 15                	jmp    8017c4 <memfind+0x39>
  8017af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017b3:	0f b6 10             	movzbl (%rax),%edx
  8017b6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8017b9:	38 c2                	cmp    %al,%dl
  8017bb:	75 02                	jne    8017bf <memfind+0x34>
  8017bd:	eb 0f                	jmp    8017ce <memfind+0x43>
  8017bf:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8017c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017c8:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8017cc:	72 e1                	jb     8017af <memfind+0x24>
  8017ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017d2:	c9                   	leaveq 
  8017d3:	c3                   	retq   

00000000008017d4 <strtol>:
  8017d4:	55                   	push   %rbp
  8017d5:	48 89 e5             	mov    %rsp,%rbp
  8017d8:	48 83 ec 34          	sub    $0x34,%rsp
  8017dc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8017e0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8017e4:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8017e7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8017ee:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8017f5:	00 
  8017f6:	eb 05                	jmp    8017fd <strtol+0x29>
  8017f8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801801:	0f b6 00             	movzbl (%rax),%eax
  801804:	3c 20                	cmp    $0x20,%al
  801806:	74 f0                	je     8017f8 <strtol+0x24>
  801808:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180c:	0f b6 00             	movzbl (%rax),%eax
  80180f:	3c 09                	cmp    $0x9,%al
  801811:	74 e5                	je     8017f8 <strtol+0x24>
  801813:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801817:	0f b6 00             	movzbl (%rax),%eax
  80181a:	3c 2b                	cmp    $0x2b,%al
  80181c:	75 07                	jne    801825 <strtol+0x51>
  80181e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801823:	eb 17                	jmp    80183c <strtol+0x68>
  801825:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801829:	0f b6 00             	movzbl (%rax),%eax
  80182c:	3c 2d                	cmp    $0x2d,%al
  80182e:	75 0c                	jne    80183c <strtol+0x68>
  801830:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801835:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80183c:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801840:	74 06                	je     801848 <strtol+0x74>
  801842:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801846:	75 28                	jne    801870 <strtol+0x9c>
  801848:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80184c:	0f b6 00             	movzbl (%rax),%eax
  80184f:	3c 30                	cmp    $0x30,%al
  801851:	75 1d                	jne    801870 <strtol+0x9c>
  801853:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801857:	48 83 c0 01          	add    $0x1,%rax
  80185b:	0f b6 00             	movzbl (%rax),%eax
  80185e:	3c 78                	cmp    $0x78,%al
  801860:	75 0e                	jne    801870 <strtol+0x9c>
  801862:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801867:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80186e:	eb 2c                	jmp    80189c <strtol+0xc8>
  801870:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801874:	75 19                	jne    80188f <strtol+0xbb>
  801876:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80187a:	0f b6 00             	movzbl (%rax),%eax
  80187d:	3c 30                	cmp    $0x30,%al
  80187f:	75 0e                	jne    80188f <strtol+0xbb>
  801881:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801886:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80188d:	eb 0d                	jmp    80189c <strtol+0xc8>
  80188f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801893:	75 07                	jne    80189c <strtol+0xc8>
  801895:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80189c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018a0:	0f b6 00             	movzbl (%rax),%eax
  8018a3:	3c 2f                	cmp    $0x2f,%al
  8018a5:	7e 1d                	jle    8018c4 <strtol+0xf0>
  8018a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018ab:	0f b6 00             	movzbl (%rax),%eax
  8018ae:	3c 39                	cmp    $0x39,%al
  8018b0:	7f 12                	jg     8018c4 <strtol+0xf0>
  8018b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018b6:	0f b6 00             	movzbl (%rax),%eax
  8018b9:	0f be c0             	movsbl %al,%eax
  8018bc:	83 e8 30             	sub    $0x30,%eax
  8018bf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8018c2:	eb 4e                	jmp    801912 <strtol+0x13e>
  8018c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018c8:	0f b6 00             	movzbl (%rax),%eax
  8018cb:	3c 60                	cmp    $0x60,%al
  8018cd:	7e 1d                	jle    8018ec <strtol+0x118>
  8018cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018d3:	0f b6 00             	movzbl (%rax),%eax
  8018d6:	3c 7a                	cmp    $0x7a,%al
  8018d8:	7f 12                	jg     8018ec <strtol+0x118>
  8018da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018de:	0f b6 00             	movzbl (%rax),%eax
  8018e1:	0f be c0             	movsbl %al,%eax
  8018e4:	83 e8 57             	sub    $0x57,%eax
  8018e7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8018ea:	eb 26                	jmp    801912 <strtol+0x13e>
  8018ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018f0:	0f b6 00             	movzbl (%rax),%eax
  8018f3:	3c 40                	cmp    $0x40,%al
  8018f5:	7e 48                	jle    80193f <strtol+0x16b>
  8018f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018fb:	0f b6 00             	movzbl (%rax),%eax
  8018fe:	3c 5a                	cmp    $0x5a,%al
  801900:	7f 3d                	jg     80193f <strtol+0x16b>
  801902:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801906:	0f b6 00             	movzbl (%rax),%eax
  801909:	0f be c0             	movsbl %al,%eax
  80190c:	83 e8 37             	sub    $0x37,%eax
  80190f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801912:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801915:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801918:	7c 02                	jl     80191c <strtol+0x148>
  80191a:	eb 23                	jmp    80193f <strtol+0x16b>
  80191c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801921:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801924:	48 98                	cltq   
  801926:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80192b:	48 89 c2             	mov    %rax,%rdx
  80192e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801931:	48 98                	cltq   
  801933:	48 01 d0             	add    %rdx,%rax
  801936:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80193a:	e9 5d ff ff ff       	jmpq   80189c <strtol+0xc8>
  80193f:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801944:	74 0b                	je     801951 <strtol+0x17d>
  801946:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80194a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80194e:	48 89 10             	mov    %rdx,(%rax)
  801951:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801955:	74 09                	je     801960 <strtol+0x18c>
  801957:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80195b:	48 f7 d8             	neg    %rax
  80195e:	eb 04                	jmp    801964 <strtol+0x190>
  801960:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801964:	c9                   	leaveq 
  801965:	c3                   	retq   

0000000000801966 <strstr>:
  801966:	55                   	push   %rbp
  801967:	48 89 e5             	mov    %rsp,%rbp
  80196a:	48 83 ec 30          	sub    $0x30,%rsp
  80196e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801972:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801976:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80197a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80197e:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801982:	0f b6 00             	movzbl (%rax),%eax
  801985:	88 45 ff             	mov    %al,-0x1(%rbp)
  801988:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80198c:	75 06                	jne    801994 <strstr+0x2e>
  80198e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801992:	eb 6b                	jmp    8019ff <strstr+0x99>
  801994:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801998:	48 89 c7             	mov    %rax,%rdi
  80199b:	48 b8 3c 12 80 00 00 	movabs $0x80123c,%rax
  8019a2:	00 00 00 
  8019a5:	ff d0                	callq  *%rax
  8019a7:	48 98                	cltq   
  8019a9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8019ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019b1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8019b5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8019b9:	0f b6 00             	movzbl (%rax),%eax
  8019bc:	88 45 ef             	mov    %al,-0x11(%rbp)
  8019bf:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8019c3:	75 07                	jne    8019cc <strstr+0x66>
  8019c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8019ca:	eb 33                	jmp    8019ff <strstr+0x99>
  8019cc:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8019d0:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8019d3:	75 d8                	jne    8019ad <strstr+0x47>
  8019d5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019d9:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8019dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019e1:	48 89 ce             	mov    %rcx,%rsi
  8019e4:	48 89 c7             	mov    %rax,%rdi
  8019e7:	48 b8 5d 14 80 00 00 	movabs $0x80145d,%rax
  8019ee:	00 00 00 
  8019f1:	ff d0                	callq  *%rax
  8019f3:	85 c0                	test   %eax,%eax
  8019f5:	75 b6                	jne    8019ad <strstr+0x47>
  8019f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019fb:	48 83 e8 01          	sub    $0x1,%rax
  8019ff:	c9                   	leaveq 
  801a00:	c3                   	retq   

0000000000801a01 <syscall>:
  801a01:	55                   	push   %rbp
  801a02:	48 89 e5             	mov    %rsp,%rbp
  801a05:	53                   	push   %rbx
  801a06:	48 83 ec 48          	sub    $0x48,%rsp
  801a0a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801a0d:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801a10:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801a14:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801a18:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801a1c:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801a20:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801a23:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801a27:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801a2b:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801a2f:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801a33:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801a37:	4c 89 c3             	mov    %r8,%rbx
  801a3a:	cd 30                	int    $0x30
  801a3c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801a40:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801a44:	74 3e                	je     801a84 <syscall+0x83>
  801a46:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801a4b:	7e 37                	jle    801a84 <syscall+0x83>
  801a4d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801a51:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801a54:	49 89 d0             	mov    %rdx,%r8
  801a57:	89 c1                	mov    %eax,%ecx
  801a59:	48 ba c8 50 80 00 00 	movabs $0x8050c8,%rdx
  801a60:	00 00 00 
  801a63:	be 24 00 00 00       	mov    $0x24,%esi
  801a68:	48 bf e5 50 80 00 00 	movabs $0x8050e5,%rdi
  801a6f:	00 00 00 
  801a72:	b8 00 00 00 00       	mov    $0x0,%eax
  801a77:	49 b9 ba 04 80 00 00 	movabs $0x8004ba,%r9
  801a7e:	00 00 00 
  801a81:	41 ff d1             	callq  *%r9
  801a84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a88:	48 83 c4 48          	add    $0x48,%rsp
  801a8c:	5b                   	pop    %rbx
  801a8d:	5d                   	pop    %rbp
  801a8e:	c3                   	retq   

0000000000801a8f <sys_cputs>:
  801a8f:	55                   	push   %rbp
  801a90:	48 89 e5             	mov    %rsp,%rbp
  801a93:	48 83 ec 20          	sub    $0x20,%rsp
  801a97:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a9b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801aa3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aa7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801aae:	00 
  801aaf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ab5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801abb:	48 89 d1             	mov    %rdx,%rcx
  801abe:	48 89 c2             	mov    %rax,%rdx
  801ac1:	be 00 00 00 00       	mov    $0x0,%esi
  801ac6:	bf 00 00 00 00       	mov    $0x0,%edi
  801acb:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801ad2:	00 00 00 
  801ad5:	ff d0                	callq  *%rax
  801ad7:	c9                   	leaveq 
  801ad8:	c3                   	retq   

0000000000801ad9 <sys_cgetc>:
  801ad9:	55                   	push   %rbp
  801ada:	48 89 e5             	mov    %rsp,%rbp
  801add:	48 83 ec 10          	sub    $0x10,%rsp
  801ae1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ae8:	00 
  801ae9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aef:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801af5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801afa:	ba 00 00 00 00       	mov    $0x0,%edx
  801aff:	be 00 00 00 00       	mov    $0x0,%esi
  801b04:	bf 01 00 00 00       	mov    $0x1,%edi
  801b09:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801b10:	00 00 00 
  801b13:	ff d0                	callq  *%rax
  801b15:	c9                   	leaveq 
  801b16:	c3                   	retq   

0000000000801b17 <sys_env_destroy>:
  801b17:	55                   	push   %rbp
  801b18:	48 89 e5             	mov    %rsp,%rbp
  801b1b:	48 83 ec 10          	sub    $0x10,%rsp
  801b1f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b22:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b25:	48 98                	cltq   
  801b27:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b2e:	00 
  801b2f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b35:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b3b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b40:	48 89 c2             	mov    %rax,%rdx
  801b43:	be 01 00 00 00       	mov    $0x1,%esi
  801b48:	bf 03 00 00 00       	mov    $0x3,%edi
  801b4d:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801b54:	00 00 00 
  801b57:	ff d0                	callq  *%rax
  801b59:	c9                   	leaveq 
  801b5a:	c3                   	retq   

0000000000801b5b <sys_getenvid>:
  801b5b:	55                   	push   %rbp
  801b5c:	48 89 e5             	mov    %rsp,%rbp
  801b5f:	48 83 ec 10          	sub    $0x10,%rsp
  801b63:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b6a:	00 
  801b6b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b71:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b77:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b7c:	ba 00 00 00 00       	mov    $0x0,%edx
  801b81:	be 00 00 00 00       	mov    $0x0,%esi
  801b86:	bf 02 00 00 00       	mov    $0x2,%edi
  801b8b:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801b92:	00 00 00 
  801b95:	ff d0                	callq  *%rax
  801b97:	c9                   	leaveq 
  801b98:	c3                   	retq   

0000000000801b99 <sys_yield>:
  801b99:	55                   	push   %rbp
  801b9a:	48 89 e5             	mov    %rsp,%rbp
  801b9d:	48 83 ec 10          	sub    $0x10,%rsp
  801ba1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ba8:	00 
  801ba9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801baf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bb5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bba:	ba 00 00 00 00       	mov    $0x0,%edx
  801bbf:	be 00 00 00 00       	mov    $0x0,%esi
  801bc4:	bf 0b 00 00 00       	mov    $0xb,%edi
  801bc9:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801bd0:	00 00 00 
  801bd3:	ff d0                	callq  *%rax
  801bd5:	c9                   	leaveq 
  801bd6:	c3                   	retq   

0000000000801bd7 <sys_page_alloc>:
  801bd7:	55                   	push   %rbp
  801bd8:	48 89 e5             	mov    %rsp,%rbp
  801bdb:	48 83 ec 20          	sub    $0x20,%rsp
  801bdf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801be2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801be6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801be9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bec:	48 63 c8             	movslq %eax,%rcx
  801bef:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bf3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bf6:	48 98                	cltq   
  801bf8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bff:	00 
  801c00:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c06:	49 89 c8             	mov    %rcx,%r8
  801c09:	48 89 d1             	mov    %rdx,%rcx
  801c0c:	48 89 c2             	mov    %rax,%rdx
  801c0f:	be 01 00 00 00       	mov    $0x1,%esi
  801c14:	bf 04 00 00 00       	mov    $0x4,%edi
  801c19:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801c20:	00 00 00 
  801c23:	ff d0                	callq  *%rax
  801c25:	c9                   	leaveq 
  801c26:	c3                   	retq   

0000000000801c27 <sys_page_map>:
  801c27:	55                   	push   %rbp
  801c28:	48 89 e5             	mov    %rsp,%rbp
  801c2b:	48 83 ec 30          	sub    $0x30,%rsp
  801c2f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c32:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c36:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801c39:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801c3d:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801c41:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801c44:	48 63 c8             	movslq %eax,%rcx
  801c47:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801c4b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c4e:	48 63 f0             	movslq %eax,%rsi
  801c51:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c58:	48 98                	cltq   
  801c5a:	48 89 0c 24          	mov    %rcx,(%rsp)
  801c5e:	49 89 f9             	mov    %rdi,%r9
  801c61:	49 89 f0             	mov    %rsi,%r8
  801c64:	48 89 d1             	mov    %rdx,%rcx
  801c67:	48 89 c2             	mov    %rax,%rdx
  801c6a:	be 01 00 00 00       	mov    $0x1,%esi
  801c6f:	bf 05 00 00 00       	mov    $0x5,%edi
  801c74:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801c7b:	00 00 00 
  801c7e:	ff d0                	callq  *%rax
  801c80:	c9                   	leaveq 
  801c81:	c3                   	retq   

0000000000801c82 <sys_page_unmap>:
  801c82:	55                   	push   %rbp
  801c83:	48 89 e5             	mov    %rsp,%rbp
  801c86:	48 83 ec 20          	sub    $0x20,%rsp
  801c8a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c8d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c91:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c98:	48 98                	cltq   
  801c9a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ca1:	00 
  801ca2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cae:	48 89 d1             	mov    %rdx,%rcx
  801cb1:	48 89 c2             	mov    %rax,%rdx
  801cb4:	be 01 00 00 00       	mov    $0x1,%esi
  801cb9:	bf 06 00 00 00       	mov    $0x6,%edi
  801cbe:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801cc5:	00 00 00 
  801cc8:	ff d0                	callq  *%rax
  801cca:	c9                   	leaveq 
  801ccb:	c3                   	retq   

0000000000801ccc <sys_env_set_status>:
  801ccc:	55                   	push   %rbp
  801ccd:	48 89 e5             	mov    %rsp,%rbp
  801cd0:	48 83 ec 10          	sub    $0x10,%rsp
  801cd4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cd7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801cda:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cdd:	48 63 d0             	movslq %eax,%rdx
  801ce0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ce3:	48 98                	cltq   
  801ce5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cec:	00 
  801ced:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cf3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cf9:	48 89 d1             	mov    %rdx,%rcx
  801cfc:	48 89 c2             	mov    %rax,%rdx
  801cff:	be 01 00 00 00       	mov    $0x1,%esi
  801d04:	bf 08 00 00 00       	mov    $0x8,%edi
  801d09:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801d10:	00 00 00 
  801d13:	ff d0                	callq  *%rax
  801d15:	c9                   	leaveq 
  801d16:	c3                   	retq   

0000000000801d17 <sys_env_set_trapframe>:
  801d17:	55                   	push   %rbp
  801d18:	48 89 e5             	mov    %rsp,%rbp
  801d1b:	48 83 ec 20          	sub    $0x20,%rsp
  801d1f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d22:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d26:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d2a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d2d:	48 98                	cltq   
  801d2f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d36:	00 
  801d37:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d3d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d43:	48 89 d1             	mov    %rdx,%rcx
  801d46:	48 89 c2             	mov    %rax,%rdx
  801d49:	be 01 00 00 00       	mov    $0x1,%esi
  801d4e:	bf 09 00 00 00       	mov    $0x9,%edi
  801d53:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801d5a:	00 00 00 
  801d5d:	ff d0                	callq  *%rax
  801d5f:	c9                   	leaveq 
  801d60:	c3                   	retq   

0000000000801d61 <sys_env_set_pgfault_upcall>:
  801d61:	55                   	push   %rbp
  801d62:	48 89 e5             	mov    %rsp,%rbp
  801d65:	48 83 ec 20          	sub    $0x20,%rsp
  801d69:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d6c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d70:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d77:	48 98                	cltq   
  801d79:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d80:	00 
  801d81:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d87:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d8d:	48 89 d1             	mov    %rdx,%rcx
  801d90:	48 89 c2             	mov    %rax,%rdx
  801d93:	be 01 00 00 00       	mov    $0x1,%esi
  801d98:	bf 0a 00 00 00       	mov    $0xa,%edi
  801d9d:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801da4:	00 00 00 
  801da7:	ff d0                	callq  *%rax
  801da9:	c9                   	leaveq 
  801daa:	c3                   	retq   

0000000000801dab <sys_ipc_try_send>:
  801dab:	55                   	push   %rbp
  801dac:	48 89 e5             	mov    %rsp,%rbp
  801daf:	48 83 ec 20          	sub    $0x20,%rsp
  801db3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801db6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dba:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801dbe:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801dc1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dc4:	48 63 f0             	movslq %eax,%rsi
  801dc7:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801dcb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dce:	48 98                	cltq   
  801dd0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dd4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ddb:	00 
  801ddc:	49 89 f1             	mov    %rsi,%r9
  801ddf:	49 89 c8             	mov    %rcx,%r8
  801de2:	48 89 d1             	mov    %rdx,%rcx
  801de5:	48 89 c2             	mov    %rax,%rdx
  801de8:	be 00 00 00 00       	mov    $0x0,%esi
  801ded:	bf 0c 00 00 00       	mov    $0xc,%edi
  801df2:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801df9:	00 00 00 
  801dfc:	ff d0                	callq  *%rax
  801dfe:	c9                   	leaveq 
  801dff:	c3                   	retq   

0000000000801e00 <sys_ipc_recv>:
  801e00:	55                   	push   %rbp
  801e01:	48 89 e5             	mov    %rsp,%rbp
  801e04:	48 83 ec 10          	sub    $0x10,%rsp
  801e08:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e0c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e10:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e17:	00 
  801e18:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e1e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e24:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e29:	48 89 c2             	mov    %rax,%rdx
  801e2c:	be 01 00 00 00       	mov    $0x1,%esi
  801e31:	bf 0d 00 00 00       	mov    $0xd,%edi
  801e36:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801e3d:	00 00 00 
  801e40:	ff d0                	callq  *%rax
  801e42:	c9                   	leaveq 
  801e43:	c3                   	retq   

0000000000801e44 <sys_time_msec>:
  801e44:	55                   	push   %rbp
  801e45:	48 89 e5             	mov    %rsp,%rbp
  801e48:	48 83 ec 10          	sub    $0x10,%rsp
  801e4c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e53:	00 
  801e54:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e5a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e60:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e65:	ba 00 00 00 00       	mov    $0x0,%edx
  801e6a:	be 00 00 00 00       	mov    $0x0,%esi
  801e6f:	bf 0e 00 00 00       	mov    $0xe,%edi
  801e74:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801e7b:	00 00 00 
  801e7e:	ff d0                	callq  *%rax
  801e80:	c9                   	leaveq 
  801e81:	c3                   	retq   

0000000000801e82 <sys_net_transmit>:
  801e82:	55                   	push   %rbp
  801e83:	48 89 e5             	mov    %rsp,%rbp
  801e86:	48 83 ec 20          	sub    $0x20,%rsp
  801e8a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e8e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e91:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e94:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e98:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e9f:	00 
  801ea0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ea6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801eac:	48 89 d1             	mov    %rdx,%rcx
  801eaf:	48 89 c2             	mov    %rax,%rdx
  801eb2:	be 00 00 00 00       	mov    $0x0,%esi
  801eb7:	bf 0f 00 00 00       	mov    $0xf,%edi
  801ebc:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801ec3:	00 00 00 
  801ec6:	ff d0                	callq  *%rax
  801ec8:	c9                   	leaveq 
  801ec9:	c3                   	retq   

0000000000801eca <sys_net_receive>:
  801eca:	55                   	push   %rbp
  801ecb:	48 89 e5             	mov    %rsp,%rbp
  801ece:	48 83 ec 20          	sub    $0x20,%rsp
  801ed2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ed6:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ed9:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801edc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ee0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ee7:	00 
  801ee8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eee:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ef4:	48 89 d1             	mov    %rdx,%rcx
  801ef7:	48 89 c2             	mov    %rax,%rdx
  801efa:	be 00 00 00 00       	mov    $0x0,%esi
  801eff:	bf 10 00 00 00       	mov    $0x10,%edi
  801f04:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801f0b:	00 00 00 
  801f0e:	ff d0                	callq  *%rax
  801f10:	c9                   	leaveq 
  801f11:	c3                   	retq   

0000000000801f12 <sys_ept_map>:
  801f12:	55                   	push   %rbp
  801f13:	48 89 e5             	mov    %rsp,%rbp
  801f16:	48 83 ec 30          	sub    $0x30,%rsp
  801f1a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f1d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f21:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801f24:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801f28:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801f2c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801f2f:	48 63 c8             	movslq %eax,%rcx
  801f32:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801f36:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f39:	48 63 f0             	movslq %eax,%rsi
  801f3c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f43:	48 98                	cltq   
  801f45:	48 89 0c 24          	mov    %rcx,(%rsp)
  801f49:	49 89 f9             	mov    %rdi,%r9
  801f4c:	49 89 f0             	mov    %rsi,%r8
  801f4f:	48 89 d1             	mov    %rdx,%rcx
  801f52:	48 89 c2             	mov    %rax,%rdx
  801f55:	be 00 00 00 00       	mov    $0x0,%esi
  801f5a:	bf 11 00 00 00       	mov    $0x11,%edi
  801f5f:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801f66:	00 00 00 
  801f69:	ff d0                	callq  *%rax
  801f6b:	c9                   	leaveq 
  801f6c:	c3                   	retq   

0000000000801f6d <sys_env_mkguest>:
  801f6d:	55                   	push   %rbp
  801f6e:	48 89 e5             	mov    %rsp,%rbp
  801f71:	48 83 ec 20          	sub    $0x20,%rsp
  801f75:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f79:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f7d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f85:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f8c:	00 
  801f8d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f93:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f99:	48 89 d1             	mov    %rdx,%rcx
  801f9c:	48 89 c2             	mov    %rax,%rdx
  801f9f:	be 00 00 00 00       	mov    $0x0,%esi
  801fa4:	bf 12 00 00 00       	mov    $0x12,%edi
  801fa9:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801fb0:	00 00 00 
  801fb3:	ff d0                	callq  *%rax
  801fb5:	c9                   	leaveq 
  801fb6:	c3                   	retq   

0000000000801fb7 <sys_vmx_list_vms>:
  801fb7:	55                   	push   %rbp
  801fb8:	48 89 e5             	mov    %rsp,%rbp
  801fbb:	48 83 ec 10          	sub    $0x10,%rsp
  801fbf:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fc6:	00 
  801fc7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fcd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fd3:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fd8:	ba 00 00 00 00       	mov    $0x0,%edx
  801fdd:	be 00 00 00 00       	mov    $0x0,%esi
  801fe2:	bf 13 00 00 00       	mov    $0x13,%edi
  801fe7:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801fee:	00 00 00 
  801ff1:	ff d0                	callq  *%rax
  801ff3:	c9                   	leaveq 
  801ff4:	c3                   	retq   

0000000000801ff5 <sys_vmx_sel_resume>:
  801ff5:	55                   	push   %rbp
  801ff6:	48 89 e5             	mov    %rsp,%rbp
  801ff9:	48 83 ec 10          	sub    $0x10,%rsp
  801ffd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802000:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802003:	48 98                	cltq   
  802005:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80200c:	00 
  80200d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802013:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802019:	b9 00 00 00 00       	mov    $0x0,%ecx
  80201e:	48 89 c2             	mov    %rax,%rdx
  802021:	be 00 00 00 00       	mov    $0x0,%esi
  802026:	bf 14 00 00 00       	mov    $0x14,%edi
  80202b:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  802032:	00 00 00 
  802035:	ff d0                	callq  *%rax
  802037:	c9                   	leaveq 
  802038:	c3                   	retq   

0000000000802039 <sys_vmx_get_vmdisk_number>:
  802039:	55                   	push   %rbp
  80203a:	48 89 e5             	mov    %rsp,%rbp
  80203d:	48 83 ec 10          	sub    $0x10,%rsp
  802041:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802048:	00 
  802049:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80204f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802055:	b9 00 00 00 00       	mov    $0x0,%ecx
  80205a:	ba 00 00 00 00       	mov    $0x0,%edx
  80205f:	be 00 00 00 00       	mov    $0x0,%esi
  802064:	bf 15 00 00 00       	mov    $0x15,%edi
  802069:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  802070:	00 00 00 
  802073:	ff d0                	callq  *%rax
  802075:	c9                   	leaveq 
  802076:	c3                   	retq   

0000000000802077 <sys_vmx_incr_vmdisk_number>:
  802077:	55                   	push   %rbp
  802078:	48 89 e5             	mov    %rsp,%rbp
  80207b:	48 83 ec 10          	sub    $0x10,%rsp
  80207f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802086:	00 
  802087:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80208d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802093:	b9 00 00 00 00       	mov    $0x0,%ecx
  802098:	ba 00 00 00 00       	mov    $0x0,%edx
  80209d:	be 00 00 00 00       	mov    $0x0,%esi
  8020a2:	bf 16 00 00 00       	mov    $0x16,%edi
  8020a7:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  8020ae:	00 00 00 
  8020b1:	ff d0                	callq  *%rax
  8020b3:	c9                   	leaveq 
  8020b4:	c3                   	retq   

00000000008020b5 <pgfault>:
  8020b5:	55                   	push   %rbp
  8020b6:	48 89 e5             	mov    %rsp,%rbp
  8020b9:	48 83 ec 30          	sub    $0x30,%rsp
  8020bd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8020c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020c5:	48 8b 00             	mov    (%rax),%rax
  8020c8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8020cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020d0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8020d4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020da:	83 e0 02             	and    $0x2,%eax
  8020dd:	85 c0                	test   %eax,%eax
  8020df:	75 40                	jne    802121 <pgfault+0x6c>
  8020e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020e5:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  8020ec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020f0:	49 89 d0             	mov    %rdx,%r8
  8020f3:	48 89 c1             	mov    %rax,%rcx
  8020f6:	48 ba f8 50 80 00 00 	movabs $0x8050f8,%rdx
  8020fd:	00 00 00 
  802100:	be 1f 00 00 00       	mov    $0x1f,%esi
  802105:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  80210c:	00 00 00 
  80210f:	b8 00 00 00 00       	mov    $0x0,%eax
  802114:	49 b9 ba 04 80 00 00 	movabs $0x8004ba,%r9
  80211b:	00 00 00 
  80211e:	41 ff d1             	callq  *%r9
  802121:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802125:	48 c1 e8 0c          	shr    $0xc,%rax
  802129:	48 89 c2             	mov    %rax,%rdx
  80212c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802133:	01 00 00 
  802136:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80213a:	25 07 08 00 00       	and    $0x807,%eax
  80213f:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  802145:	74 4e                	je     802195 <pgfault+0xe0>
  802147:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80214b:	48 c1 e8 0c          	shr    $0xc,%rax
  80214f:	48 89 c2             	mov    %rax,%rdx
  802152:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802159:	01 00 00 
  80215c:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802160:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802164:	49 89 d0             	mov    %rdx,%r8
  802167:	48 89 c1             	mov    %rax,%rcx
  80216a:	48 ba 20 51 80 00 00 	movabs $0x805120,%rdx
  802171:	00 00 00 
  802174:	be 22 00 00 00       	mov    $0x22,%esi
  802179:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  802180:	00 00 00 
  802183:	b8 00 00 00 00       	mov    $0x0,%eax
  802188:	49 b9 ba 04 80 00 00 	movabs $0x8004ba,%r9
  80218f:	00 00 00 
  802192:	41 ff d1             	callq  *%r9
  802195:	ba 07 00 00 00       	mov    $0x7,%edx
  80219a:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80219f:	bf 00 00 00 00       	mov    $0x0,%edi
  8021a4:	48 b8 d7 1b 80 00 00 	movabs $0x801bd7,%rax
  8021ab:	00 00 00 
  8021ae:	ff d0                	callq  *%rax
  8021b0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8021b3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8021b7:	79 30                	jns    8021e9 <pgfault+0x134>
  8021b9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021bc:	89 c1                	mov    %eax,%ecx
  8021be:	48 ba 4b 51 80 00 00 	movabs $0x80514b,%rdx
  8021c5:	00 00 00 
  8021c8:	be 30 00 00 00       	mov    $0x30,%esi
  8021cd:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  8021d4:	00 00 00 
  8021d7:	b8 00 00 00 00       	mov    $0x0,%eax
  8021dc:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  8021e3:	00 00 00 
  8021e6:	41 ff d0             	callq  *%r8
  8021e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021ed:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021f5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8021fb:	ba 00 10 00 00       	mov    $0x1000,%edx
  802200:	48 89 c6             	mov    %rax,%rsi
  802203:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802208:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  80220f:	00 00 00 
  802212:	ff d0                	callq  *%rax
  802214:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802218:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80221c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802220:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802226:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80222c:	48 89 c1             	mov    %rax,%rcx
  80222f:	ba 00 00 00 00       	mov    $0x0,%edx
  802234:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802239:	bf 00 00 00 00       	mov    $0x0,%edi
  80223e:	48 b8 27 1c 80 00 00 	movabs $0x801c27,%rax
  802245:	00 00 00 
  802248:	ff d0                	callq  *%rax
  80224a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80224d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802251:	79 30                	jns    802283 <pgfault+0x1ce>
  802253:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802256:	89 c1                	mov    %eax,%ecx
  802258:	48 ba 5e 51 80 00 00 	movabs $0x80515e,%rdx
  80225f:	00 00 00 
  802262:	be 35 00 00 00       	mov    $0x35,%esi
  802267:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  80226e:	00 00 00 
  802271:	b8 00 00 00 00       	mov    $0x0,%eax
  802276:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  80227d:	00 00 00 
  802280:	41 ff d0             	callq  *%r8
  802283:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802288:	bf 00 00 00 00       	mov    $0x0,%edi
  80228d:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  802294:	00 00 00 
  802297:	ff d0                	callq  *%rax
  802299:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80229c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022a0:	79 30                	jns    8022d2 <pgfault+0x21d>
  8022a2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022a5:	89 c1                	mov    %eax,%ecx
  8022a7:	48 ba 6f 51 80 00 00 	movabs $0x80516f,%rdx
  8022ae:	00 00 00 
  8022b1:	be 39 00 00 00       	mov    $0x39,%esi
  8022b6:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  8022bd:	00 00 00 
  8022c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8022c5:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  8022cc:	00 00 00 
  8022cf:	41 ff d0             	callq  *%r8
  8022d2:	c9                   	leaveq 
  8022d3:	c3                   	retq   

00000000008022d4 <duppage>:
  8022d4:	55                   	push   %rbp
  8022d5:	48 89 e5             	mov    %rsp,%rbp
  8022d8:	48 83 ec 30          	sub    $0x30,%rsp
  8022dc:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8022df:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8022e2:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8022e5:	c1 e0 0c             	shl    $0xc,%eax
  8022e8:	89 c0                	mov    %eax,%eax
  8022ea:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8022ee:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022f5:	01 00 00 
  8022f8:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8022fb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022ff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802303:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802307:	25 02 08 00 00       	and    $0x802,%eax
  80230c:	48 85 c0             	test   %rax,%rax
  80230f:	74 0e                	je     80231f <duppage+0x4b>
  802311:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802315:	25 00 04 00 00       	and    $0x400,%eax
  80231a:	48 85 c0             	test   %rax,%rax
  80231d:	74 70                	je     80238f <duppage+0xbb>
  80231f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802323:	25 07 0e 00 00       	and    $0xe07,%eax
  802328:	89 c6                	mov    %eax,%esi
  80232a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80232e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802331:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802335:	41 89 f0             	mov    %esi,%r8d
  802338:	48 89 c6             	mov    %rax,%rsi
  80233b:	bf 00 00 00 00       	mov    $0x0,%edi
  802340:	48 b8 27 1c 80 00 00 	movabs $0x801c27,%rax
  802347:	00 00 00 
  80234a:	ff d0                	callq  *%rax
  80234c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80234f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802353:	79 30                	jns    802385 <duppage+0xb1>
  802355:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802358:	89 c1                	mov    %eax,%ecx
  80235a:	48 ba 5e 51 80 00 00 	movabs $0x80515e,%rdx
  802361:	00 00 00 
  802364:	be 63 00 00 00       	mov    $0x63,%esi
  802369:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  802370:	00 00 00 
  802373:	b8 00 00 00 00       	mov    $0x0,%eax
  802378:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  80237f:	00 00 00 
  802382:	41 ff d0             	callq  *%r8
  802385:	b8 00 00 00 00       	mov    $0x0,%eax
  80238a:	e9 c4 00 00 00       	jmpq   802453 <duppage+0x17f>
  80238f:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802393:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802396:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80239a:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8023a0:	48 89 c6             	mov    %rax,%rsi
  8023a3:	bf 00 00 00 00       	mov    $0x0,%edi
  8023a8:	48 b8 27 1c 80 00 00 	movabs $0x801c27,%rax
  8023af:	00 00 00 
  8023b2:	ff d0                	callq  *%rax
  8023b4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8023b7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8023bb:	79 30                	jns    8023ed <duppage+0x119>
  8023bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023c0:	89 c1                	mov    %eax,%ecx
  8023c2:	48 ba 5e 51 80 00 00 	movabs $0x80515e,%rdx
  8023c9:	00 00 00 
  8023cc:	be 7e 00 00 00       	mov    $0x7e,%esi
  8023d1:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  8023d8:	00 00 00 
  8023db:	b8 00 00 00 00       	mov    $0x0,%eax
  8023e0:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  8023e7:	00 00 00 
  8023ea:	41 ff d0             	callq  *%r8
  8023ed:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8023f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023f5:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8023fb:	48 89 d1             	mov    %rdx,%rcx
  8023fe:	ba 00 00 00 00       	mov    $0x0,%edx
  802403:	48 89 c6             	mov    %rax,%rsi
  802406:	bf 00 00 00 00       	mov    $0x0,%edi
  80240b:	48 b8 27 1c 80 00 00 	movabs $0x801c27,%rax
  802412:	00 00 00 
  802415:	ff d0                	callq  *%rax
  802417:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80241a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80241e:	79 30                	jns    802450 <duppage+0x17c>
  802420:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802423:	89 c1                	mov    %eax,%ecx
  802425:	48 ba 5e 51 80 00 00 	movabs $0x80515e,%rdx
  80242c:	00 00 00 
  80242f:	be 80 00 00 00       	mov    $0x80,%esi
  802434:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  80243b:	00 00 00 
  80243e:	b8 00 00 00 00       	mov    $0x0,%eax
  802443:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  80244a:	00 00 00 
  80244d:	41 ff d0             	callq  *%r8
  802450:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802453:	c9                   	leaveq 
  802454:	c3                   	retq   

0000000000802455 <fork>:
  802455:	55                   	push   %rbp
  802456:	48 89 e5             	mov    %rsp,%rbp
  802459:	48 83 ec 20          	sub    $0x20,%rsp
  80245d:	48 bf b5 20 80 00 00 	movabs $0x8020b5,%rdi
  802464:	00 00 00 
  802467:	48 b8 7d 47 80 00 00 	movabs $0x80477d,%rax
  80246e:	00 00 00 
  802471:	ff d0                	callq  *%rax
  802473:	b8 07 00 00 00       	mov    $0x7,%eax
  802478:	cd 30                	int    $0x30
  80247a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80247d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802480:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802483:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802487:	79 08                	jns    802491 <fork+0x3c>
  802489:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80248c:	e9 09 02 00 00       	jmpq   80269a <fork+0x245>
  802491:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802495:	75 3e                	jne    8024d5 <fork+0x80>
  802497:	48 b8 5b 1b 80 00 00 	movabs $0x801b5b,%rax
  80249e:	00 00 00 
  8024a1:	ff d0                	callq  *%rax
  8024a3:	25 ff 03 00 00       	and    $0x3ff,%eax
  8024a8:	48 98                	cltq   
  8024aa:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8024b1:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8024b8:	00 00 00 
  8024bb:	48 01 c2             	add    %rax,%rdx
  8024be:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8024c5:	00 00 00 
  8024c8:	48 89 10             	mov    %rdx,(%rax)
  8024cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8024d0:	e9 c5 01 00 00       	jmpq   80269a <fork+0x245>
  8024d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8024dc:	e9 a4 00 00 00       	jmpq   802585 <fork+0x130>
  8024e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024e4:	c1 f8 12             	sar    $0x12,%eax
  8024e7:	89 c2                	mov    %eax,%edx
  8024e9:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8024f0:	01 00 00 
  8024f3:	48 63 d2             	movslq %edx,%rdx
  8024f6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024fa:	83 e0 01             	and    $0x1,%eax
  8024fd:	48 85 c0             	test   %rax,%rax
  802500:	74 21                	je     802523 <fork+0xce>
  802502:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802505:	c1 f8 09             	sar    $0x9,%eax
  802508:	89 c2                	mov    %eax,%edx
  80250a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802511:	01 00 00 
  802514:	48 63 d2             	movslq %edx,%rdx
  802517:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80251b:	83 e0 01             	and    $0x1,%eax
  80251e:	48 85 c0             	test   %rax,%rax
  802521:	75 09                	jne    80252c <fork+0xd7>
  802523:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  80252a:	eb 59                	jmp    802585 <fork+0x130>
  80252c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80252f:	05 00 02 00 00       	add    $0x200,%eax
  802534:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802537:	eb 44                	jmp    80257d <fork+0x128>
  802539:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802540:	01 00 00 
  802543:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802546:	48 63 d2             	movslq %edx,%rdx
  802549:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80254d:	83 e0 05             	and    $0x5,%eax
  802550:	48 83 f8 05          	cmp    $0x5,%rax
  802554:	74 02                	je     802558 <fork+0x103>
  802556:	eb 21                	jmp    802579 <fork+0x124>
  802558:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80255f:	75 02                	jne    802563 <fork+0x10e>
  802561:	eb 16                	jmp    802579 <fork+0x124>
  802563:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802566:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802569:	89 d6                	mov    %edx,%esi
  80256b:	89 c7                	mov    %eax,%edi
  80256d:	48 b8 d4 22 80 00 00 	movabs $0x8022d4,%rax
  802574:	00 00 00 
  802577:	ff d0                	callq  *%rax
  802579:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80257d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802580:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802583:	7c b4                	jl     802539 <fork+0xe4>
  802585:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802588:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  80258d:	0f 86 4e ff ff ff    	jbe    8024e1 <fork+0x8c>
  802593:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802596:	ba 07 00 00 00       	mov    $0x7,%edx
  80259b:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8025a0:	89 c7                	mov    %eax,%edi
  8025a2:	48 b8 d7 1b 80 00 00 	movabs $0x801bd7,%rax
  8025a9:	00 00 00 
  8025ac:	ff d0                	callq  *%rax
  8025ae:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8025b1:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8025b5:	79 30                	jns    8025e7 <fork+0x192>
  8025b7:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8025ba:	89 c1                	mov    %eax,%ecx
  8025bc:	48 ba 88 51 80 00 00 	movabs $0x805188,%rdx
  8025c3:	00 00 00 
  8025c6:	be bc 00 00 00       	mov    $0xbc,%esi
  8025cb:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  8025d2:	00 00 00 
  8025d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8025da:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  8025e1:	00 00 00 
  8025e4:	41 ff d0             	callq  *%r8
  8025e7:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025ee:	00 00 00 
  8025f1:	48 8b 00             	mov    (%rax),%rax
  8025f4:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  8025fb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025fe:	48 89 d6             	mov    %rdx,%rsi
  802601:	89 c7                	mov    %eax,%edi
  802603:	48 b8 61 1d 80 00 00 	movabs $0x801d61,%rax
  80260a:	00 00 00 
  80260d:	ff d0                	callq  *%rax
  80260f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802612:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802616:	79 30                	jns    802648 <fork+0x1f3>
  802618:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80261b:	89 c1                	mov    %eax,%ecx
  80261d:	48 ba a8 51 80 00 00 	movabs $0x8051a8,%rdx
  802624:	00 00 00 
  802627:	be c0 00 00 00       	mov    $0xc0,%esi
  80262c:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  802633:	00 00 00 
  802636:	b8 00 00 00 00       	mov    $0x0,%eax
  80263b:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  802642:	00 00 00 
  802645:	41 ff d0             	callq  *%r8
  802648:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80264b:	be 02 00 00 00       	mov    $0x2,%esi
  802650:	89 c7                	mov    %eax,%edi
  802652:	48 b8 cc 1c 80 00 00 	movabs $0x801ccc,%rax
  802659:	00 00 00 
  80265c:	ff d0                	callq  *%rax
  80265e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802661:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802665:	79 30                	jns    802697 <fork+0x242>
  802667:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80266a:	89 c1                	mov    %eax,%ecx
  80266c:	48 ba c7 51 80 00 00 	movabs $0x8051c7,%rdx
  802673:	00 00 00 
  802676:	be c5 00 00 00       	mov    $0xc5,%esi
  80267b:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  802682:	00 00 00 
  802685:	b8 00 00 00 00       	mov    $0x0,%eax
  80268a:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  802691:	00 00 00 
  802694:	41 ff d0             	callq  *%r8
  802697:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80269a:	c9                   	leaveq 
  80269b:	c3                   	retq   

000000000080269c <sfork>:
  80269c:	55                   	push   %rbp
  80269d:	48 89 e5             	mov    %rsp,%rbp
  8026a0:	48 ba de 51 80 00 00 	movabs $0x8051de,%rdx
  8026a7:	00 00 00 
  8026aa:	be d2 00 00 00       	mov    $0xd2,%esi
  8026af:	48 bf 11 51 80 00 00 	movabs $0x805111,%rdi
  8026b6:	00 00 00 
  8026b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8026be:	48 b9 ba 04 80 00 00 	movabs $0x8004ba,%rcx
  8026c5:	00 00 00 
  8026c8:	ff d1                	callq  *%rcx

00000000008026ca <fd2num>:
  8026ca:	55                   	push   %rbp
  8026cb:	48 89 e5             	mov    %rsp,%rbp
  8026ce:	48 83 ec 08          	sub    $0x8,%rsp
  8026d2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026d6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8026da:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8026e1:	ff ff ff 
  8026e4:	48 01 d0             	add    %rdx,%rax
  8026e7:	48 c1 e8 0c          	shr    $0xc,%rax
  8026eb:	c9                   	leaveq 
  8026ec:	c3                   	retq   

00000000008026ed <fd2data>:
  8026ed:	55                   	push   %rbp
  8026ee:	48 89 e5             	mov    %rsp,%rbp
  8026f1:	48 83 ec 08          	sub    $0x8,%rsp
  8026f5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026fd:	48 89 c7             	mov    %rax,%rdi
  802700:	48 b8 ca 26 80 00 00 	movabs $0x8026ca,%rax
  802707:	00 00 00 
  80270a:	ff d0                	callq  *%rax
  80270c:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802712:	48 c1 e0 0c          	shl    $0xc,%rax
  802716:	c9                   	leaveq 
  802717:	c3                   	retq   

0000000000802718 <fd_alloc>:
  802718:	55                   	push   %rbp
  802719:	48 89 e5             	mov    %rsp,%rbp
  80271c:	48 83 ec 18          	sub    $0x18,%rsp
  802720:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802724:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80272b:	eb 6b                	jmp    802798 <fd_alloc+0x80>
  80272d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802730:	48 98                	cltq   
  802732:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802738:	48 c1 e0 0c          	shl    $0xc,%rax
  80273c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802740:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802744:	48 c1 e8 15          	shr    $0x15,%rax
  802748:	48 89 c2             	mov    %rax,%rdx
  80274b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802752:	01 00 00 
  802755:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802759:	83 e0 01             	and    $0x1,%eax
  80275c:	48 85 c0             	test   %rax,%rax
  80275f:	74 21                	je     802782 <fd_alloc+0x6a>
  802761:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802765:	48 c1 e8 0c          	shr    $0xc,%rax
  802769:	48 89 c2             	mov    %rax,%rdx
  80276c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802773:	01 00 00 
  802776:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80277a:	83 e0 01             	and    $0x1,%eax
  80277d:	48 85 c0             	test   %rax,%rax
  802780:	75 12                	jne    802794 <fd_alloc+0x7c>
  802782:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802786:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80278a:	48 89 10             	mov    %rdx,(%rax)
  80278d:	b8 00 00 00 00       	mov    $0x0,%eax
  802792:	eb 1a                	jmp    8027ae <fd_alloc+0x96>
  802794:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802798:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80279c:	7e 8f                	jle    80272d <fd_alloc+0x15>
  80279e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027a2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8027a9:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8027ae:	c9                   	leaveq 
  8027af:	c3                   	retq   

00000000008027b0 <fd_lookup>:
  8027b0:	55                   	push   %rbp
  8027b1:	48 89 e5             	mov    %rsp,%rbp
  8027b4:	48 83 ec 20          	sub    $0x20,%rsp
  8027b8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027bb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8027c3:	78 06                	js     8027cb <fd_lookup+0x1b>
  8027c5:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8027c9:	7e 07                	jle    8027d2 <fd_lookup+0x22>
  8027cb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8027d0:	eb 6c                	jmp    80283e <fd_lookup+0x8e>
  8027d2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027d5:	48 98                	cltq   
  8027d7:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8027dd:	48 c1 e0 0c          	shl    $0xc,%rax
  8027e1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8027e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8027e9:	48 c1 e8 15          	shr    $0x15,%rax
  8027ed:	48 89 c2             	mov    %rax,%rdx
  8027f0:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8027f7:	01 00 00 
  8027fa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027fe:	83 e0 01             	and    $0x1,%eax
  802801:	48 85 c0             	test   %rax,%rax
  802804:	74 21                	je     802827 <fd_lookup+0x77>
  802806:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80280a:	48 c1 e8 0c          	shr    $0xc,%rax
  80280e:	48 89 c2             	mov    %rax,%rdx
  802811:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802818:	01 00 00 
  80281b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80281f:	83 e0 01             	and    $0x1,%eax
  802822:	48 85 c0             	test   %rax,%rax
  802825:	75 07                	jne    80282e <fd_lookup+0x7e>
  802827:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80282c:	eb 10                	jmp    80283e <fd_lookup+0x8e>
  80282e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802832:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802836:	48 89 10             	mov    %rdx,(%rax)
  802839:	b8 00 00 00 00       	mov    $0x0,%eax
  80283e:	c9                   	leaveq 
  80283f:	c3                   	retq   

0000000000802840 <fd_close>:
  802840:	55                   	push   %rbp
  802841:	48 89 e5             	mov    %rsp,%rbp
  802844:	48 83 ec 30          	sub    $0x30,%rsp
  802848:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80284c:	89 f0                	mov    %esi,%eax
  80284e:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802851:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802855:	48 89 c7             	mov    %rax,%rdi
  802858:	48 b8 ca 26 80 00 00 	movabs $0x8026ca,%rax
  80285f:	00 00 00 
  802862:	ff d0                	callq  *%rax
  802864:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802868:	48 89 d6             	mov    %rdx,%rsi
  80286b:	89 c7                	mov    %eax,%edi
  80286d:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  802874:	00 00 00 
  802877:	ff d0                	callq  *%rax
  802879:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80287c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802880:	78 0a                	js     80288c <fd_close+0x4c>
  802882:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802886:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80288a:	74 12                	je     80289e <fd_close+0x5e>
  80288c:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802890:	74 05                	je     802897 <fd_close+0x57>
  802892:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802895:	eb 05                	jmp    80289c <fd_close+0x5c>
  802897:	b8 00 00 00 00       	mov    $0x0,%eax
  80289c:	eb 69                	jmp    802907 <fd_close+0xc7>
  80289e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028a2:	8b 00                	mov    (%rax),%eax
  8028a4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8028a8:	48 89 d6             	mov    %rdx,%rsi
  8028ab:	89 c7                	mov    %eax,%edi
  8028ad:	48 b8 09 29 80 00 00 	movabs $0x802909,%rax
  8028b4:	00 00 00 
  8028b7:	ff d0                	callq  *%rax
  8028b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028c0:	78 2a                	js     8028ec <fd_close+0xac>
  8028c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c6:	48 8b 40 20          	mov    0x20(%rax),%rax
  8028ca:	48 85 c0             	test   %rax,%rax
  8028cd:	74 16                	je     8028e5 <fd_close+0xa5>
  8028cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028d3:	48 8b 40 20          	mov    0x20(%rax),%rax
  8028d7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8028db:	48 89 d7             	mov    %rdx,%rdi
  8028de:	ff d0                	callq  *%rax
  8028e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028e3:	eb 07                	jmp    8028ec <fd_close+0xac>
  8028e5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8028ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028f0:	48 89 c6             	mov    %rax,%rsi
  8028f3:	bf 00 00 00 00       	mov    $0x0,%edi
  8028f8:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  8028ff:	00 00 00 
  802902:	ff d0                	callq  *%rax
  802904:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802907:	c9                   	leaveq 
  802908:	c3                   	retq   

0000000000802909 <dev_lookup>:
  802909:	55                   	push   %rbp
  80290a:	48 89 e5             	mov    %rsp,%rbp
  80290d:	48 83 ec 20          	sub    $0x20,%rsp
  802911:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802914:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802918:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80291f:	eb 41                	jmp    802962 <dev_lookup+0x59>
  802921:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802928:	00 00 00 
  80292b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80292e:	48 63 d2             	movslq %edx,%rdx
  802931:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802935:	8b 00                	mov    (%rax),%eax
  802937:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80293a:	75 22                	jne    80295e <dev_lookup+0x55>
  80293c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802943:	00 00 00 
  802946:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802949:	48 63 d2             	movslq %edx,%rdx
  80294c:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802950:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802954:	48 89 10             	mov    %rdx,(%rax)
  802957:	b8 00 00 00 00       	mov    $0x0,%eax
  80295c:	eb 60                	jmp    8029be <dev_lookup+0xb5>
  80295e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802962:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802969:	00 00 00 
  80296c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80296f:	48 63 d2             	movslq %edx,%rdx
  802972:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802976:	48 85 c0             	test   %rax,%rax
  802979:	75 a6                	jne    802921 <dev_lookup+0x18>
  80297b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802982:	00 00 00 
  802985:	48 8b 00             	mov    (%rax),%rax
  802988:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80298e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802991:	89 c6                	mov    %eax,%esi
  802993:	48 bf f8 51 80 00 00 	movabs $0x8051f8,%rdi
  80299a:	00 00 00 
  80299d:	b8 00 00 00 00       	mov    $0x0,%eax
  8029a2:	48 b9 f3 06 80 00 00 	movabs $0x8006f3,%rcx
  8029a9:	00 00 00 
  8029ac:	ff d1                	callq  *%rcx
  8029ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029b2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8029b9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8029be:	c9                   	leaveq 
  8029bf:	c3                   	retq   

00000000008029c0 <close>:
  8029c0:	55                   	push   %rbp
  8029c1:	48 89 e5             	mov    %rsp,%rbp
  8029c4:	48 83 ec 20          	sub    $0x20,%rsp
  8029c8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029cb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029cf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029d2:	48 89 d6             	mov    %rdx,%rsi
  8029d5:	89 c7                	mov    %eax,%edi
  8029d7:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  8029de:	00 00 00 
  8029e1:	ff d0                	callq  *%rax
  8029e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029ea:	79 05                	jns    8029f1 <close+0x31>
  8029ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ef:	eb 18                	jmp    802a09 <close+0x49>
  8029f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029f5:	be 01 00 00 00       	mov    $0x1,%esi
  8029fa:	48 89 c7             	mov    %rax,%rdi
  8029fd:	48 b8 40 28 80 00 00 	movabs $0x802840,%rax
  802a04:	00 00 00 
  802a07:	ff d0                	callq  *%rax
  802a09:	c9                   	leaveq 
  802a0a:	c3                   	retq   

0000000000802a0b <close_all>:
  802a0b:	55                   	push   %rbp
  802a0c:	48 89 e5             	mov    %rsp,%rbp
  802a0f:	48 83 ec 10          	sub    $0x10,%rsp
  802a13:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a1a:	eb 15                	jmp    802a31 <close_all+0x26>
  802a1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a1f:	89 c7                	mov    %eax,%edi
  802a21:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  802a28:	00 00 00 
  802a2b:	ff d0                	callq  *%rax
  802a2d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a31:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802a35:	7e e5                	jle    802a1c <close_all+0x11>
  802a37:	c9                   	leaveq 
  802a38:	c3                   	retq   

0000000000802a39 <dup>:
  802a39:	55                   	push   %rbp
  802a3a:	48 89 e5             	mov    %rsp,%rbp
  802a3d:	48 83 ec 40          	sub    $0x40,%rsp
  802a41:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802a44:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802a47:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802a4b:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802a4e:	48 89 d6             	mov    %rdx,%rsi
  802a51:	89 c7                	mov    %eax,%edi
  802a53:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  802a5a:	00 00 00 
  802a5d:	ff d0                	callq  *%rax
  802a5f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a62:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a66:	79 08                	jns    802a70 <dup+0x37>
  802a68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a6b:	e9 70 01 00 00       	jmpq   802be0 <dup+0x1a7>
  802a70:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a73:	89 c7                	mov    %eax,%edi
  802a75:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  802a7c:	00 00 00 
  802a7f:	ff d0                	callq  *%rax
  802a81:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a84:	48 98                	cltq   
  802a86:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802a8c:	48 c1 e0 0c          	shl    $0xc,%rax
  802a90:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802a94:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a98:	48 89 c7             	mov    %rax,%rdi
  802a9b:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  802aa2:	00 00 00 
  802aa5:	ff d0                	callq  *%rax
  802aa7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802aab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aaf:	48 89 c7             	mov    %rax,%rdi
  802ab2:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  802ab9:	00 00 00 
  802abc:	ff d0                	callq  *%rax
  802abe:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802ac2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ac6:	48 c1 e8 15          	shr    $0x15,%rax
  802aca:	48 89 c2             	mov    %rax,%rdx
  802acd:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802ad4:	01 00 00 
  802ad7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802adb:	83 e0 01             	and    $0x1,%eax
  802ade:	48 85 c0             	test   %rax,%rax
  802ae1:	74 73                	je     802b56 <dup+0x11d>
  802ae3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ae7:	48 c1 e8 0c          	shr    $0xc,%rax
  802aeb:	48 89 c2             	mov    %rax,%rdx
  802aee:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802af5:	01 00 00 
  802af8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802afc:	83 e0 01             	and    $0x1,%eax
  802aff:	48 85 c0             	test   %rax,%rax
  802b02:	74 52                	je     802b56 <dup+0x11d>
  802b04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b08:	48 c1 e8 0c          	shr    $0xc,%rax
  802b0c:	48 89 c2             	mov    %rax,%rdx
  802b0f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b16:	01 00 00 
  802b19:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b1d:	25 07 0e 00 00       	and    $0xe07,%eax
  802b22:	89 c1                	mov    %eax,%ecx
  802b24:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802b28:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b2c:	41 89 c8             	mov    %ecx,%r8d
  802b2f:	48 89 d1             	mov    %rdx,%rcx
  802b32:	ba 00 00 00 00       	mov    $0x0,%edx
  802b37:	48 89 c6             	mov    %rax,%rsi
  802b3a:	bf 00 00 00 00       	mov    $0x0,%edi
  802b3f:	48 b8 27 1c 80 00 00 	movabs $0x801c27,%rax
  802b46:	00 00 00 
  802b49:	ff d0                	callq  *%rax
  802b4b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b4e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b52:	79 02                	jns    802b56 <dup+0x11d>
  802b54:	eb 57                	jmp    802bad <dup+0x174>
  802b56:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b5a:	48 c1 e8 0c          	shr    $0xc,%rax
  802b5e:	48 89 c2             	mov    %rax,%rdx
  802b61:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b68:	01 00 00 
  802b6b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b6f:	25 07 0e 00 00       	and    $0xe07,%eax
  802b74:	89 c1                	mov    %eax,%ecx
  802b76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b7a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b7e:	41 89 c8             	mov    %ecx,%r8d
  802b81:	48 89 d1             	mov    %rdx,%rcx
  802b84:	ba 00 00 00 00       	mov    $0x0,%edx
  802b89:	48 89 c6             	mov    %rax,%rsi
  802b8c:	bf 00 00 00 00       	mov    $0x0,%edi
  802b91:	48 b8 27 1c 80 00 00 	movabs $0x801c27,%rax
  802b98:	00 00 00 
  802b9b:	ff d0                	callq  *%rax
  802b9d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ba0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ba4:	79 02                	jns    802ba8 <dup+0x16f>
  802ba6:	eb 05                	jmp    802bad <dup+0x174>
  802ba8:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802bab:	eb 33                	jmp    802be0 <dup+0x1a7>
  802bad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bb1:	48 89 c6             	mov    %rax,%rsi
  802bb4:	bf 00 00 00 00       	mov    $0x0,%edi
  802bb9:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  802bc0:	00 00 00 
  802bc3:	ff d0                	callq  *%rax
  802bc5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bc9:	48 89 c6             	mov    %rax,%rsi
  802bcc:	bf 00 00 00 00       	mov    $0x0,%edi
  802bd1:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  802bd8:	00 00 00 
  802bdb:	ff d0                	callq  *%rax
  802bdd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802be0:	c9                   	leaveq 
  802be1:	c3                   	retq   

0000000000802be2 <read>:
  802be2:	55                   	push   %rbp
  802be3:	48 89 e5             	mov    %rsp,%rbp
  802be6:	48 83 ec 40          	sub    $0x40,%rsp
  802bea:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802bed:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802bf1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802bf5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802bf9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802bfc:	48 89 d6             	mov    %rdx,%rsi
  802bff:	89 c7                	mov    %eax,%edi
  802c01:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  802c08:	00 00 00 
  802c0b:	ff d0                	callq  *%rax
  802c0d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c10:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c14:	78 24                	js     802c3a <read+0x58>
  802c16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c1a:	8b 00                	mov    (%rax),%eax
  802c1c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c20:	48 89 d6             	mov    %rdx,%rsi
  802c23:	89 c7                	mov    %eax,%edi
  802c25:	48 b8 09 29 80 00 00 	movabs $0x802909,%rax
  802c2c:	00 00 00 
  802c2f:	ff d0                	callq  *%rax
  802c31:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c34:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c38:	79 05                	jns    802c3f <read+0x5d>
  802c3a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c3d:	eb 76                	jmp    802cb5 <read+0xd3>
  802c3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c43:	8b 40 08             	mov    0x8(%rax),%eax
  802c46:	83 e0 03             	and    $0x3,%eax
  802c49:	83 f8 01             	cmp    $0x1,%eax
  802c4c:	75 3a                	jne    802c88 <read+0xa6>
  802c4e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802c55:	00 00 00 
  802c58:	48 8b 00             	mov    (%rax),%rax
  802c5b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802c61:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802c64:	89 c6                	mov    %eax,%esi
  802c66:	48 bf 17 52 80 00 00 	movabs $0x805217,%rdi
  802c6d:	00 00 00 
  802c70:	b8 00 00 00 00       	mov    $0x0,%eax
  802c75:	48 b9 f3 06 80 00 00 	movabs $0x8006f3,%rcx
  802c7c:	00 00 00 
  802c7f:	ff d1                	callq  *%rcx
  802c81:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c86:	eb 2d                	jmp    802cb5 <read+0xd3>
  802c88:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c8c:	48 8b 40 10          	mov    0x10(%rax),%rax
  802c90:	48 85 c0             	test   %rax,%rax
  802c93:	75 07                	jne    802c9c <read+0xba>
  802c95:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802c9a:	eb 19                	jmp    802cb5 <read+0xd3>
  802c9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ca0:	48 8b 40 10          	mov    0x10(%rax),%rax
  802ca4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802ca8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802cac:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802cb0:	48 89 cf             	mov    %rcx,%rdi
  802cb3:	ff d0                	callq  *%rax
  802cb5:	c9                   	leaveq 
  802cb6:	c3                   	retq   

0000000000802cb7 <readn>:
  802cb7:	55                   	push   %rbp
  802cb8:	48 89 e5             	mov    %rsp,%rbp
  802cbb:	48 83 ec 30          	sub    $0x30,%rsp
  802cbf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802cc2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802cc6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802cca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802cd1:	eb 49                	jmp    802d1c <readn+0x65>
  802cd3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cd6:	48 98                	cltq   
  802cd8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802cdc:	48 29 c2             	sub    %rax,%rdx
  802cdf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ce2:	48 63 c8             	movslq %eax,%rcx
  802ce5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ce9:	48 01 c1             	add    %rax,%rcx
  802cec:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cef:	48 89 ce             	mov    %rcx,%rsi
  802cf2:	89 c7                	mov    %eax,%edi
  802cf4:	48 b8 e2 2b 80 00 00 	movabs $0x802be2,%rax
  802cfb:	00 00 00 
  802cfe:	ff d0                	callq  *%rax
  802d00:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802d03:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d07:	79 05                	jns    802d0e <readn+0x57>
  802d09:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d0c:	eb 1c                	jmp    802d2a <readn+0x73>
  802d0e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d12:	75 02                	jne    802d16 <readn+0x5f>
  802d14:	eb 11                	jmp    802d27 <readn+0x70>
  802d16:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d19:	01 45 fc             	add    %eax,-0x4(%rbp)
  802d1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d1f:	48 98                	cltq   
  802d21:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802d25:	72 ac                	jb     802cd3 <readn+0x1c>
  802d27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d2a:	c9                   	leaveq 
  802d2b:	c3                   	retq   

0000000000802d2c <write>:
  802d2c:	55                   	push   %rbp
  802d2d:	48 89 e5             	mov    %rsp,%rbp
  802d30:	48 83 ec 40          	sub    $0x40,%rsp
  802d34:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d37:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d3b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802d3f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d43:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d46:	48 89 d6             	mov    %rdx,%rsi
  802d49:	89 c7                	mov    %eax,%edi
  802d4b:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  802d52:	00 00 00 
  802d55:	ff d0                	callq  *%rax
  802d57:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d5a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d5e:	78 24                	js     802d84 <write+0x58>
  802d60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d64:	8b 00                	mov    (%rax),%eax
  802d66:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d6a:	48 89 d6             	mov    %rdx,%rsi
  802d6d:	89 c7                	mov    %eax,%edi
  802d6f:	48 b8 09 29 80 00 00 	movabs $0x802909,%rax
  802d76:	00 00 00 
  802d79:	ff d0                	callq  *%rax
  802d7b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d7e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d82:	79 05                	jns    802d89 <write+0x5d>
  802d84:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d87:	eb 75                	jmp    802dfe <write+0xd2>
  802d89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d8d:	8b 40 08             	mov    0x8(%rax),%eax
  802d90:	83 e0 03             	and    $0x3,%eax
  802d93:	85 c0                	test   %eax,%eax
  802d95:	75 3a                	jne    802dd1 <write+0xa5>
  802d97:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802d9e:	00 00 00 
  802da1:	48 8b 00             	mov    (%rax),%rax
  802da4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802daa:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802dad:	89 c6                	mov    %eax,%esi
  802daf:	48 bf 33 52 80 00 00 	movabs $0x805233,%rdi
  802db6:	00 00 00 
  802db9:	b8 00 00 00 00       	mov    $0x0,%eax
  802dbe:	48 b9 f3 06 80 00 00 	movabs $0x8006f3,%rcx
  802dc5:	00 00 00 
  802dc8:	ff d1                	callq  *%rcx
  802dca:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802dcf:	eb 2d                	jmp    802dfe <write+0xd2>
  802dd1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dd5:	48 8b 40 18          	mov    0x18(%rax),%rax
  802dd9:	48 85 c0             	test   %rax,%rax
  802ddc:	75 07                	jne    802de5 <write+0xb9>
  802dde:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802de3:	eb 19                	jmp    802dfe <write+0xd2>
  802de5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802de9:	48 8b 40 18          	mov    0x18(%rax),%rax
  802ded:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802df1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802df5:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802df9:	48 89 cf             	mov    %rcx,%rdi
  802dfc:	ff d0                	callq  *%rax
  802dfe:	c9                   	leaveq 
  802dff:	c3                   	retq   

0000000000802e00 <seek>:
  802e00:	55                   	push   %rbp
  802e01:	48 89 e5             	mov    %rsp,%rbp
  802e04:	48 83 ec 18          	sub    $0x18,%rsp
  802e08:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e0b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802e0e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e12:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e15:	48 89 d6             	mov    %rdx,%rsi
  802e18:	89 c7                	mov    %eax,%edi
  802e1a:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  802e21:	00 00 00 
  802e24:	ff d0                	callq  *%rax
  802e26:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e29:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e2d:	79 05                	jns    802e34 <seek+0x34>
  802e2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e32:	eb 0f                	jmp    802e43 <seek+0x43>
  802e34:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e38:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802e3b:	89 50 04             	mov    %edx,0x4(%rax)
  802e3e:	b8 00 00 00 00       	mov    $0x0,%eax
  802e43:	c9                   	leaveq 
  802e44:	c3                   	retq   

0000000000802e45 <ftruncate>:
  802e45:	55                   	push   %rbp
  802e46:	48 89 e5             	mov    %rsp,%rbp
  802e49:	48 83 ec 30          	sub    $0x30,%rsp
  802e4d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e50:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802e53:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e57:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e5a:	48 89 d6             	mov    %rdx,%rsi
  802e5d:	89 c7                	mov    %eax,%edi
  802e5f:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  802e66:	00 00 00 
  802e69:	ff d0                	callq  *%rax
  802e6b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e6e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e72:	78 24                	js     802e98 <ftruncate+0x53>
  802e74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e78:	8b 00                	mov    (%rax),%eax
  802e7a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e7e:	48 89 d6             	mov    %rdx,%rsi
  802e81:	89 c7                	mov    %eax,%edi
  802e83:	48 b8 09 29 80 00 00 	movabs $0x802909,%rax
  802e8a:	00 00 00 
  802e8d:	ff d0                	callq  *%rax
  802e8f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e92:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e96:	79 05                	jns    802e9d <ftruncate+0x58>
  802e98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e9b:	eb 72                	jmp    802f0f <ftruncate+0xca>
  802e9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ea1:	8b 40 08             	mov    0x8(%rax),%eax
  802ea4:	83 e0 03             	and    $0x3,%eax
  802ea7:	85 c0                	test   %eax,%eax
  802ea9:	75 3a                	jne    802ee5 <ftruncate+0xa0>
  802eab:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802eb2:	00 00 00 
  802eb5:	48 8b 00             	mov    (%rax),%rax
  802eb8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ebe:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ec1:	89 c6                	mov    %eax,%esi
  802ec3:	48 bf 50 52 80 00 00 	movabs $0x805250,%rdi
  802eca:	00 00 00 
  802ecd:	b8 00 00 00 00       	mov    $0x0,%eax
  802ed2:	48 b9 f3 06 80 00 00 	movabs $0x8006f3,%rcx
  802ed9:	00 00 00 
  802edc:	ff d1                	callq  *%rcx
  802ede:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ee3:	eb 2a                	jmp    802f0f <ftruncate+0xca>
  802ee5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ee9:	48 8b 40 30          	mov    0x30(%rax),%rax
  802eed:	48 85 c0             	test   %rax,%rax
  802ef0:	75 07                	jne    802ef9 <ftruncate+0xb4>
  802ef2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ef7:	eb 16                	jmp    802f0f <ftruncate+0xca>
  802ef9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802efd:	48 8b 40 30          	mov    0x30(%rax),%rax
  802f01:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802f05:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802f08:	89 ce                	mov    %ecx,%esi
  802f0a:	48 89 d7             	mov    %rdx,%rdi
  802f0d:	ff d0                	callq  *%rax
  802f0f:	c9                   	leaveq 
  802f10:	c3                   	retq   

0000000000802f11 <fstat>:
  802f11:	55                   	push   %rbp
  802f12:	48 89 e5             	mov    %rsp,%rbp
  802f15:	48 83 ec 30          	sub    $0x30,%rsp
  802f19:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f1c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f20:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f24:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f27:	48 89 d6             	mov    %rdx,%rsi
  802f2a:	89 c7                	mov    %eax,%edi
  802f2c:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  802f33:	00 00 00 
  802f36:	ff d0                	callq  *%rax
  802f38:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f3b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f3f:	78 24                	js     802f65 <fstat+0x54>
  802f41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f45:	8b 00                	mov    (%rax),%eax
  802f47:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f4b:	48 89 d6             	mov    %rdx,%rsi
  802f4e:	89 c7                	mov    %eax,%edi
  802f50:	48 b8 09 29 80 00 00 	movabs $0x802909,%rax
  802f57:	00 00 00 
  802f5a:	ff d0                	callq  *%rax
  802f5c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f5f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f63:	79 05                	jns    802f6a <fstat+0x59>
  802f65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f68:	eb 5e                	jmp    802fc8 <fstat+0xb7>
  802f6a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f6e:	48 8b 40 28          	mov    0x28(%rax),%rax
  802f72:	48 85 c0             	test   %rax,%rax
  802f75:	75 07                	jne    802f7e <fstat+0x6d>
  802f77:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f7c:	eb 4a                	jmp    802fc8 <fstat+0xb7>
  802f7e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f82:	c6 00 00             	movb   $0x0,(%rax)
  802f85:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f89:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802f90:	00 00 00 
  802f93:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f97:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802f9e:	00 00 00 
  802fa1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802fa5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fa9:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802fb0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fb4:	48 8b 40 28          	mov    0x28(%rax),%rax
  802fb8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802fbc:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802fc0:	48 89 ce             	mov    %rcx,%rsi
  802fc3:	48 89 d7             	mov    %rdx,%rdi
  802fc6:	ff d0                	callq  *%rax
  802fc8:	c9                   	leaveq 
  802fc9:	c3                   	retq   

0000000000802fca <stat>:
  802fca:	55                   	push   %rbp
  802fcb:	48 89 e5             	mov    %rsp,%rbp
  802fce:	48 83 ec 20          	sub    $0x20,%rsp
  802fd2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fd6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fde:	be 00 00 00 00       	mov    $0x0,%esi
  802fe3:	48 89 c7             	mov    %rax,%rdi
  802fe6:	48 b8 b8 30 80 00 00 	movabs $0x8030b8,%rax
  802fed:	00 00 00 
  802ff0:	ff d0                	callq  *%rax
  802ff2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ff5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ff9:	79 05                	jns    803000 <stat+0x36>
  802ffb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ffe:	eb 2f                	jmp    80302f <stat+0x65>
  803000:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803004:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803007:	48 89 d6             	mov    %rdx,%rsi
  80300a:	89 c7                	mov    %eax,%edi
  80300c:	48 b8 11 2f 80 00 00 	movabs $0x802f11,%rax
  803013:	00 00 00 
  803016:	ff d0                	callq  *%rax
  803018:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80301b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80301e:	89 c7                	mov    %eax,%edi
  803020:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  803027:	00 00 00 
  80302a:	ff d0                	callq  *%rax
  80302c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80302f:	c9                   	leaveq 
  803030:	c3                   	retq   

0000000000803031 <fsipc>:
  803031:	55                   	push   %rbp
  803032:	48 89 e5             	mov    %rsp,%rbp
  803035:	48 83 ec 10          	sub    $0x10,%rsp
  803039:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80303c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803040:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803047:	00 00 00 
  80304a:	8b 00                	mov    (%rax),%eax
  80304c:	85 c0                	test   %eax,%eax
  80304e:	75 1d                	jne    80306d <fsipc+0x3c>
  803050:	bf 01 00 00 00       	mov    $0x1,%edi
  803055:	48 b8 fc 49 80 00 00 	movabs $0x8049fc,%rax
  80305c:	00 00 00 
  80305f:	ff d0                	callq  *%rax
  803061:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  803068:	00 00 00 
  80306b:	89 02                	mov    %eax,(%rdx)
  80306d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803074:	00 00 00 
  803077:	8b 00                	mov    (%rax),%eax
  803079:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80307c:	b9 07 00 00 00       	mov    $0x7,%ecx
  803081:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  803088:	00 00 00 
  80308b:	89 c7                	mov    %eax,%edi
  80308d:	48 b8 66 49 80 00 00 	movabs $0x804966,%rax
  803094:	00 00 00 
  803097:	ff d0                	callq  *%rax
  803099:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80309d:	ba 00 00 00 00       	mov    $0x0,%edx
  8030a2:	48 89 c6             	mov    %rax,%rsi
  8030a5:	bf 00 00 00 00       	mov    $0x0,%edi
  8030aa:	48 b8 a5 48 80 00 00 	movabs $0x8048a5,%rax
  8030b1:	00 00 00 
  8030b4:	ff d0                	callq  *%rax
  8030b6:	c9                   	leaveq 
  8030b7:	c3                   	retq   

00000000008030b8 <open>:
  8030b8:	55                   	push   %rbp
  8030b9:	48 89 e5             	mov    %rsp,%rbp
  8030bc:	48 83 ec 20          	sub    $0x20,%rsp
  8030c0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030c4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8030c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030cb:	48 89 c7             	mov    %rax,%rdi
  8030ce:	48 b8 3c 12 80 00 00 	movabs $0x80123c,%rax
  8030d5:	00 00 00 
  8030d8:	ff d0                	callq  *%rax
  8030da:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8030df:	7e 0a                	jle    8030eb <open+0x33>
  8030e1:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8030e6:	e9 a5 00 00 00       	jmpq   803190 <open+0xd8>
  8030eb:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8030ef:	48 89 c7             	mov    %rax,%rdi
  8030f2:	48 b8 18 27 80 00 00 	movabs $0x802718,%rax
  8030f9:	00 00 00 
  8030fc:	ff d0                	callq  *%rax
  8030fe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803101:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803105:	79 08                	jns    80310f <open+0x57>
  803107:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80310a:	e9 81 00 00 00       	jmpq   803190 <open+0xd8>
  80310f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803113:	48 89 c6             	mov    %rax,%rsi
  803116:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  80311d:	00 00 00 
  803120:	48 b8 a8 12 80 00 00 	movabs $0x8012a8,%rax
  803127:	00 00 00 
  80312a:	ff d0                	callq  *%rax
  80312c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803133:	00 00 00 
  803136:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803139:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80313f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803143:	48 89 c6             	mov    %rax,%rsi
  803146:	bf 01 00 00 00       	mov    $0x1,%edi
  80314b:	48 b8 31 30 80 00 00 	movabs $0x803031,%rax
  803152:	00 00 00 
  803155:	ff d0                	callq  *%rax
  803157:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80315a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80315e:	79 1d                	jns    80317d <open+0xc5>
  803160:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803164:	be 00 00 00 00       	mov    $0x0,%esi
  803169:	48 89 c7             	mov    %rax,%rdi
  80316c:	48 b8 40 28 80 00 00 	movabs $0x802840,%rax
  803173:	00 00 00 
  803176:	ff d0                	callq  *%rax
  803178:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80317b:	eb 13                	jmp    803190 <open+0xd8>
  80317d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803181:	48 89 c7             	mov    %rax,%rdi
  803184:	48 b8 ca 26 80 00 00 	movabs $0x8026ca,%rax
  80318b:	00 00 00 
  80318e:	ff d0                	callq  *%rax
  803190:	c9                   	leaveq 
  803191:	c3                   	retq   

0000000000803192 <devfile_flush>:
  803192:	55                   	push   %rbp
  803193:	48 89 e5             	mov    %rsp,%rbp
  803196:	48 83 ec 10          	sub    $0x10,%rsp
  80319a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80319e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031a2:	8b 50 0c             	mov    0xc(%rax),%edx
  8031a5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031ac:	00 00 00 
  8031af:	89 10                	mov    %edx,(%rax)
  8031b1:	be 00 00 00 00       	mov    $0x0,%esi
  8031b6:	bf 06 00 00 00       	mov    $0x6,%edi
  8031bb:	48 b8 31 30 80 00 00 	movabs $0x803031,%rax
  8031c2:	00 00 00 
  8031c5:	ff d0                	callq  *%rax
  8031c7:	c9                   	leaveq 
  8031c8:	c3                   	retq   

00000000008031c9 <devfile_read>:
  8031c9:	55                   	push   %rbp
  8031ca:	48 89 e5             	mov    %rsp,%rbp
  8031cd:	48 83 ec 30          	sub    $0x30,%rsp
  8031d1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031d5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031d9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8031dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031e1:	8b 50 0c             	mov    0xc(%rax),%edx
  8031e4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031eb:	00 00 00 
  8031ee:	89 10                	mov    %edx,(%rax)
  8031f0:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031f7:	00 00 00 
  8031fa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8031fe:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803202:	be 00 00 00 00       	mov    $0x0,%esi
  803207:	bf 03 00 00 00       	mov    $0x3,%edi
  80320c:	48 b8 31 30 80 00 00 	movabs $0x803031,%rax
  803213:	00 00 00 
  803216:	ff d0                	callq  *%rax
  803218:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80321b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80321f:	79 08                	jns    803229 <devfile_read+0x60>
  803221:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803224:	e9 a4 00 00 00       	jmpq   8032cd <devfile_read+0x104>
  803229:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80322c:	48 98                	cltq   
  80322e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803232:	76 35                	jbe    803269 <devfile_read+0xa0>
  803234:	48 b9 76 52 80 00 00 	movabs $0x805276,%rcx
  80323b:	00 00 00 
  80323e:	48 ba 7d 52 80 00 00 	movabs $0x80527d,%rdx
  803245:	00 00 00 
  803248:	be 89 00 00 00       	mov    $0x89,%esi
  80324d:	48 bf 92 52 80 00 00 	movabs $0x805292,%rdi
  803254:	00 00 00 
  803257:	b8 00 00 00 00       	mov    $0x0,%eax
  80325c:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  803263:	00 00 00 
  803266:	41 ff d0             	callq  *%r8
  803269:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803270:	7e 35                	jle    8032a7 <devfile_read+0xde>
  803272:	48 b9 a0 52 80 00 00 	movabs $0x8052a0,%rcx
  803279:	00 00 00 
  80327c:	48 ba 7d 52 80 00 00 	movabs $0x80527d,%rdx
  803283:	00 00 00 
  803286:	be 8a 00 00 00       	mov    $0x8a,%esi
  80328b:	48 bf 92 52 80 00 00 	movabs $0x805292,%rdi
  803292:	00 00 00 
  803295:	b8 00 00 00 00       	mov    $0x0,%eax
  80329a:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  8032a1:	00 00 00 
  8032a4:	41 ff d0             	callq  *%r8
  8032a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032aa:	48 63 d0             	movslq %eax,%rdx
  8032ad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032b1:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8032b8:	00 00 00 
  8032bb:	48 89 c7             	mov    %rax,%rdi
  8032be:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  8032c5:	00 00 00 
  8032c8:	ff d0                	callq  *%rax
  8032ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032cd:	c9                   	leaveq 
  8032ce:	c3                   	retq   

00000000008032cf <devfile_write>:
  8032cf:	55                   	push   %rbp
  8032d0:	48 89 e5             	mov    %rsp,%rbp
  8032d3:	48 83 ec 40          	sub    $0x40,%rsp
  8032d7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8032db:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8032df:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8032e3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8032e7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8032eb:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8032f2:	00 
  8032f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032f7:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8032fb:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803300:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803304:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803308:	8b 50 0c             	mov    0xc(%rax),%edx
  80330b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803312:	00 00 00 
  803315:	89 10                	mov    %edx,(%rax)
  803317:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80331e:	00 00 00 
  803321:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803325:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803329:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80332d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803331:	48 89 c6             	mov    %rax,%rsi
  803334:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  80333b:	00 00 00 
  80333e:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  803345:	00 00 00 
  803348:	ff d0                	callq  *%rax
  80334a:	be 00 00 00 00       	mov    $0x0,%esi
  80334f:	bf 04 00 00 00       	mov    $0x4,%edi
  803354:	48 b8 31 30 80 00 00 	movabs $0x803031,%rax
  80335b:	00 00 00 
  80335e:	ff d0                	callq  *%rax
  803360:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803363:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803367:	79 05                	jns    80336e <devfile_write+0x9f>
  803369:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80336c:	eb 43                	jmp    8033b1 <devfile_write+0xe2>
  80336e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803371:	48 98                	cltq   
  803373:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803377:	76 35                	jbe    8033ae <devfile_write+0xdf>
  803379:	48 b9 76 52 80 00 00 	movabs $0x805276,%rcx
  803380:	00 00 00 
  803383:	48 ba 7d 52 80 00 00 	movabs $0x80527d,%rdx
  80338a:	00 00 00 
  80338d:	be a8 00 00 00       	mov    $0xa8,%esi
  803392:	48 bf 92 52 80 00 00 	movabs $0x805292,%rdi
  803399:	00 00 00 
  80339c:	b8 00 00 00 00       	mov    $0x0,%eax
  8033a1:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  8033a8:	00 00 00 
  8033ab:	41 ff d0             	callq  *%r8
  8033ae:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033b1:	c9                   	leaveq 
  8033b2:	c3                   	retq   

00000000008033b3 <devfile_stat>:
  8033b3:	55                   	push   %rbp
  8033b4:	48 89 e5             	mov    %rsp,%rbp
  8033b7:	48 83 ec 20          	sub    $0x20,%rsp
  8033bb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033bf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033c7:	8b 50 0c             	mov    0xc(%rax),%edx
  8033ca:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033d1:	00 00 00 
  8033d4:	89 10                	mov    %edx,(%rax)
  8033d6:	be 00 00 00 00       	mov    $0x0,%esi
  8033db:	bf 05 00 00 00       	mov    $0x5,%edi
  8033e0:	48 b8 31 30 80 00 00 	movabs $0x803031,%rax
  8033e7:	00 00 00 
  8033ea:	ff d0                	callq  *%rax
  8033ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033f3:	79 05                	jns    8033fa <devfile_stat+0x47>
  8033f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f8:	eb 56                	jmp    803450 <devfile_stat+0x9d>
  8033fa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033fe:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803405:	00 00 00 
  803408:	48 89 c7             	mov    %rax,%rdi
  80340b:	48 b8 a8 12 80 00 00 	movabs $0x8012a8,%rax
  803412:	00 00 00 
  803415:	ff d0                	callq  *%rax
  803417:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80341e:	00 00 00 
  803421:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803427:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80342b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803431:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803438:	00 00 00 
  80343b:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803441:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803445:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  80344b:	b8 00 00 00 00       	mov    $0x0,%eax
  803450:	c9                   	leaveq 
  803451:	c3                   	retq   

0000000000803452 <devfile_trunc>:
  803452:	55                   	push   %rbp
  803453:	48 89 e5             	mov    %rsp,%rbp
  803456:	48 83 ec 10          	sub    $0x10,%rsp
  80345a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80345e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803461:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803465:	8b 50 0c             	mov    0xc(%rax),%edx
  803468:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80346f:	00 00 00 
  803472:	89 10                	mov    %edx,(%rax)
  803474:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80347b:	00 00 00 
  80347e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803481:	89 50 04             	mov    %edx,0x4(%rax)
  803484:	be 00 00 00 00       	mov    $0x0,%esi
  803489:	bf 02 00 00 00       	mov    $0x2,%edi
  80348e:	48 b8 31 30 80 00 00 	movabs $0x803031,%rax
  803495:	00 00 00 
  803498:	ff d0                	callq  *%rax
  80349a:	c9                   	leaveq 
  80349b:	c3                   	retq   

000000000080349c <remove>:
  80349c:	55                   	push   %rbp
  80349d:	48 89 e5             	mov    %rsp,%rbp
  8034a0:	48 83 ec 10          	sub    $0x10,%rsp
  8034a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034ac:	48 89 c7             	mov    %rax,%rdi
  8034af:	48 b8 3c 12 80 00 00 	movabs $0x80123c,%rax
  8034b6:	00 00 00 
  8034b9:	ff d0                	callq  *%rax
  8034bb:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8034c0:	7e 07                	jle    8034c9 <remove+0x2d>
  8034c2:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8034c7:	eb 33                	jmp    8034fc <remove+0x60>
  8034c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034cd:	48 89 c6             	mov    %rax,%rsi
  8034d0:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8034d7:	00 00 00 
  8034da:	48 b8 a8 12 80 00 00 	movabs $0x8012a8,%rax
  8034e1:	00 00 00 
  8034e4:	ff d0                	callq  *%rax
  8034e6:	be 00 00 00 00       	mov    $0x0,%esi
  8034eb:	bf 07 00 00 00       	mov    $0x7,%edi
  8034f0:	48 b8 31 30 80 00 00 	movabs $0x803031,%rax
  8034f7:	00 00 00 
  8034fa:	ff d0                	callq  *%rax
  8034fc:	c9                   	leaveq 
  8034fd:	c3                   	retq   

00000000008034fe <sync>:
  8034fe:	55                   	push   %rbp
  8034ff:	48 89 e5             	mov    %rsp,%rbp
  803502:	be 00 00 00 00       	mov    $0x0,%esi
  803507:	bf 08 00 00 00       	mov    $0x8,%edi
  80350c:	48 b8 31 30 80 00 00 	movabs $0x803031,%rax
  803513:	00 00 00 
  803516:	ff d0                	callq  *%rax
  803518:	5d                   	pop    %rbp
  803519:	c3                   	retq   

000000000080351a <copy>:
  80351a:	55                   	push   %rbp
  80351b:	48 89 e5             	mov    %rsp,%rbp
  80351e:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803525:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  80352c:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803533:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  80353a:	be 00 00 00 00       	mov    $0x0,%esi
  80353f:	48 89 c7             	mov    %rax,%rdi
  803542:	48 b8 b8 30 80 00 00 	movabs $0x8030b8,%rax
  803549:	00 00 00 
  80354c:	ff d0                	callq  *%rax
  80354e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803551:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803555:	79 28                	jns    80357f <copy+0x65>
  803557:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80355a:	89 c6                	mov    %eax,%esi
  80355c:	48 bf ac 52 80 00 00 	movabs $0x8052ac,%rdi
  803563:	00 00 00 
  803566:	b8 00 00 00 00       	mov    $0x0,%eax
  80356b:	48 ba f3 06 80 00 00 	movabs $0x8006f3,%rdx
  803572:	00 00 00 
  803575:	ff d2                	callq  *%rdx
  803577:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80357a:	e9 74 01 00 00       	jmpq   8036f3 <copy+0x1d9>
  80357f:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803586:	be 01 01 00 00       	mov    $0x101,%esi
  80358b:	48 89 c7             	mov    %rax,%rdi
  80358e:	48 b8 b8 30 80 00 00 	movabs $0x8030b8,%rax
  803595:	00 00 00 
  803598:	ff d0                	callq  *%rax
  80359a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80359d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8035a1:	79 39                	jns    8035dc <copy+0xc2>
  8035a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035a6:	89 c6                	mov    %eax,%esi
  8035a8:	48 bf c2 52 80 00 00 	movabs $0x8052c2,%rdi
  8035af:	00 00 00 
  8035b2:	b8 00 00 00 00       	mov    $0x0,%eax
  8035b7:	48 ba f3 06 80 00 00 	movabs $0x8006f3,%rdx
  8035be:	00 00 00 
  8035c1:	ff d2                	callq  *%rdx
  8035c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c6:	89 c7                	mov    %eax,%edi
  8035c8:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  8035cf:	00 00 00 
  8035d2:	ff d0                	callq  *%rax
  8035d4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035d7:	e9 17 01 00 00       	jmpq   8036f3 <copy+0x1d9>
  8035dc:	eb 74                	jmp    803652 <copy+0x138>
  8035de:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8035e1:	48 63 d0             	movslq %eax,%rdx
  8035e4:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8035eb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035ee:	48 89 ce             	mov    %rcx,%rsi
  8035f1:	89 c7                	mov    %eax,%edi
  8035f3:	48 b8 2c 2d 80 00 00 	movabs $0x802d2c,%rax
  8035fa:	00 00 00 
  8035fd:	ff d0                	callq  *%rax
  8035ff:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803602:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803606:	79 4a                	jns    803652 <copy+0x138>
  803608:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80360b:	89 c6                	mov    %eax,%esi
  80360d:	48 bf dc 52 80 00 00 	movabs $0x8052dc,%rdi
  803614:	00 00 00 
  803617:	b8 00 00 00 00       	mov    $0x0,%eax
  80361c:	48 ba f3 06 80 00 00 	movabs $0x8006f3,%rdx
  803623:	00 00 00 
  803626:	ff d2                	callq  *%rdx
  803628:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80362b:	89 c7                	mov    %eax,%edi
  80362d:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  803634:	00 00 00 
  803637:	ff d0                	callq  *%rax
  803639:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80363c:	89 c7                	mov    %eax,%edi
  80363e:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  803645:	00 00 00 
  803648:	ff d0                	callq  *%rax
  80364a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80364d:	e9 a1 00 00 00       	jmpq   8036f3 <copy+0x1d9>
  803652:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803659:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80365c:	ba 00 02 00 00       	mov    $0x200,%edx
  803661:	48 89 ce             	mov    %rcx,%rsi
  803664:	89 c7                	mov    %eax,%edi
  803666:	48 b8 e2 2b 80 00 00 	movabs $0x802be2,%rax
  80366d:	00 00 00 
  803670:	ff d0                	callq  *%rax
  803672:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803675:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803679:	0f 8f 5f ff ff ff    	jg     8035de <copy+0xc4>
  80367f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803683:	79 47                	jns    8036cc <copy+0x1b2>
  803685:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803688:	89 c6                	mov    %eax,%esi
  80368a:	48 bf ef 52 80 00 00 	movabs $0x8052ef,%rdi
  803691:	00 00 00 
  803694:	b8 00 00 00 00       	mov    $0x0,%eax
  803699:	48 ba f3 06 80 00 00 	movabs $0x8006f3,%rdx
  8036a0:	00 00 00 
  8036a3:	ff d2                	callq  *%rdx
  8036a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036a8:	89 c7                	mov    %eax,%edi
  8036aa:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  8036b1:	00 00 00 
  8036b4:	ff d0                	callq  *%rax
  8036b6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036b9:	89 c7                	mov    %eax,%edi
  8036bb:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  8036c2:	00 00 00 
  8036c5:	ff d0                	callq  *%rax
  8036c7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8036ca:	eb 27                	jmp    8036f3 <copy+0x1d9>
  8036cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036cf:	89 c7                	mov    %eax,%edi
  8036d1:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  8036d8:	00 00 00 
  8036db:	ff d0                	callq  *%rax
  8036dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036e0:	89 c7                	mov    %eax,%edi
  8036e2:	48 b8 c0 29 80 00 00 	movabs $0x8029c0,%rax
  8036e9:	00 00 00 
  8036ec:	ff d0                	callq  *%rax
  8036ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8036f3:	c9                   	leaveq 
  8036f4:	c3                   	retq   

00000000008036f5 <fd2sockid>:
  8036f5:	55                   	push   %rbp
  8036f6:	48 89 e5             	mov    %rsp,%rbp
  8036f9:	48 83 ec 20          	sub    $0x20,%rsp
  8036fd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803700:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803704:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803707:	48 89 d6             	mov    %rdx,%rsi
  80370a:	89 c7                	mov    %eax,%edi
  80370c:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  803713:	00 00 00 
  803716:	ff d0                	callq  *%rax
  803718:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80371b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80371f:	79 05                	jns    803726 <fd2sockid+0x31>
  803721:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803724:	eb 24                	jmp    80374a <fd2sockid+0x55>
  803726:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80372a:	8b 10                	mov    (%rax),%edx
  80372c:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803733:	00 00 00 
  803736:	8b 00                	mov    (%rax),%eax
  803738:	39 c2                	cmp    %eax,%edx
  80373a:	74 07                	je     803743 <fd2sockid+0x4e>
  80373c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803741:	eb 07                	jmp    80374a <fd2sockid+0x55>
  803743:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803747:	8b 40 0c             	mov    0xc(%rax),%eax
  80374a:	c9                   	leaveq 
  80374b:	c3                   	retq   

000000000080374c <alloc_sockfd>:
  80374c:	55                   	push   %rbp
  80374d:	48 89 e5             	mov    %rsp,%rbp
  803750:	48 83 ec 20          	sub    $0x20,%rsp
  803754:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803757:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80375b:	48 89 c7             	mov    %rax,%rdi
  80375e:	48 b8 18 27 80 00 00 	movabs $0x802718,%rax
  803765:	00 00 00 
  803768:	ff d0                	callq  *%rax
  80376a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80376d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803771:	78 26                	js     803799 <alloc_sockfd+0x4d>
  803773:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803777:	ba 07 04 00 00       	mov    $0x407,%edx
  80377c:	48 89 c6             	mov    %rax,%rsi
  80377f:	bf 00 00 00 00       	mov    $0x0,%edi
  803784:	48 b8 d7 1b 80 00 00 	movabs $0x801bd7,%rax
  80378b:	00 00 00 
  80378e:	ff d0                	callq  *%rax
  803790:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803793:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803797:	79 16                	jns    8037af <alloc_sockfd+0x63>
  803799:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80379c:	89 c7                	mov    %eax,%edi
  80379e:	48 b8 59 3c 80 00 00 	movabs $0x803c59,%rax
  8037a5:	00 00 00 
  8037a8:	ff d0                	callq  *%rax
  8037aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037ad:	eb 3a                	jmp    8037e9 <alloc_sockfd+0x9d>
  8037af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037b3:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8037ba:	00 00 00 
  8037bd:	8b 12                	mov    (%rdx),%edx
  8037bf:	89 10                	mov    %edx,(%rax)
  8037c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037c5:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8037cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037d0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8037d3:	89 50 0c             	mov    %edx,0xc(%rax)
  8037d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037da:	48 89 c7             	mov    %rax,%rdi
  8037dd:	48 b8 ca 26 80 00 00 	movabs $0x8026ca,%rax
  8037e4:	00 00 00 
  8037e7:	ff d0                	callq  *%rax
  8037e9:	c9                   	leaveq 
  8037ea:	c3                   	retq   

00000000008037eb <accept>:
  8037eb:	55                   	push   %rbp
  8037ec:	48 89 e5             	mov    %rsp,%rbp
  8037ef:	48 83 ec 30          	sub    $0x30,%rsp
  8037f3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037f6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037fa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8037fe:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803801:	89 c7                	mov    %eax,%edi
  803803:	48 b8 f5 36 80 00 00 	movabs $0x8036f5,%rax
  80380a:	00 00 00 
  80380d:	ff d0                	callq  *%rax
  80380f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803812:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803816:	79 05                	jns    80381d <accept+0x32>
  803818:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80381b:	eb 3b                	jmp    803858 <accept+0x6d>
  80381d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803821:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803825:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803828:	48 89 ce             	mov    %rcx,%rsi
  80382b:	89 c7                	mov    %eax,%edi
  80382d:	48 b8 36 3b 80 00 00 	movabs $0x803b36,%rax
  803834:	00 00 00 
  803837:	ff d0                	callq  *%rax
  803839:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80383c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803840:	79 05                	jns    803847 <accept+0x5c>
  803842:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803845:	eb 11                	jmp    803858 <accept+0x6d>
  803847:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80384a:	89 c7                	mov    %eax,%edi
  80384c:	48 b8 4c 37 80 00 00 	movabs $0x80374c,%rax
  803853:	00 00 00 
  803856:	ff d0                	callq  *%rax
  803858:	c9                   	leaveq 
  803859:	c3                   	retq   

000000000080385a <bind>:
  80385a:	55                   	push   %rbp
  80385b:	48 89 e5             	mov    %rsp,%rbp
  80385e:	48 83 ec 20          	sub    $0x20,%rsp
  803862:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803865:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803869:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80386c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80386f:	89 c7                	mov    %eax,%edi
  803871:	48 b8 f5 36 80 00 00 	movabs $0x8036f5,%rax
  803878:	00 00 00 
  80387b:	ff d0                	callq  *%rax
  80387d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803880:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803884:	79 05                	jns    80388b <bind+0x31>
  803886:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803889:	eb 1b                	jmp    8038a6 <bind+0x4c>
  80388b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80388e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803892:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803895:	48 89 ce             	mov    %rcx,%rsi
  803898:	89 c7                	mov    %eax,%edi
  80389a:	48 b8 b5 3b 80 00 00 	movabs $0x803bb5,%rax
  8038a1:	00 00 00 
  8038a4:	ff d0                	callq  *%rax
  8038a6:	c9                   	leaveq 
  8038a7:	c3                   	retq   

00000000008038a8 <shutdown>:
  8038a8:	55                   	push   %rbp
  8038a9:	48 89 e5             	mov    %rsp,%rbp
  8038ac:	48 83 ec 20          	sub    $0x20,%rsp
  8038b0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038b3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8038b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038b9:	89 c7                	mov    %eax,%edi
  8038bb:	48 b8 f5 36 80 00 00 	movabs $0x8036f5,%rax
  8038c2:	00 00 00 
  8038c5:	ff d0                	callq  *%rax
  8038c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038ca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038ce:	79 05                	jns    8038d5 <shutdown+0x2d>
  8038d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038d3:	eb 16                	jmp    8038eb <shutdown+0x43>
  8038d5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038db:	89 d6                	mov    %edx,%esi
  8038dd:	89 c7                	mov    %eax,%edi
  8038df:	48 b8 19 3c 80 00 00 	movabs $0x803c19,%rax
  8038e6:	00 00 00 
  8038e9:	ff d0                	callq  *%rax
  8038eb:	c9                   	leaveq 
  8038ec:	c3                   	retq   

00000000008038ed <devsock_close>:
  8038ed:	55                   	push   %rbp
  8038ee:	48 89 e5             	mov    %rsp,%rbp
  8038f1:	48 83 ec 10          	sub    $0x10,%rsp
  8038f5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038fd:	48 89 c7             	mov    %rax,%rdi
  803900:	48 b8 6e 4a 80 00 00 	movabs $0x804a6e,%rax
  803907:	00 00 00 
  80390a:	ff d0                	callq  *%rax
  80390c:	83 f8 01             	cmp    $0x1,%eax
  80390f:	75 17                	jne    803928 <devsock_close+0x3b>
  803911:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803915:	8b 40 0c             	mov    0xc(%rax),%eax
  803918:	89 c7                	mov    %eax,%edi
  80391a:	48 b8 59 3c 80 00 00 	movabs $0x803c59,%rax
  803921:	00 00 00 
  803924:	ff d0                	callq  *%rax
  803926:	eb 05                	jmp    80392d <devsock_close+0x40>
  803928:	b8 00 00 00 00       	mov    $0x0,%eax
  80392d:	c9                   	leaveq 
  80392e:	c3                   	retq   

000000000080392f <connect>:
  80392f:	55                   	push   %rbp
  803930:	48 89 e5             	mov    %rsp,%rbp
  803933:	48 83 ec 20          	sub    $0x20,%rsp
  803937:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80393a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80393e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803941:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803944:	89 c7                	mov    %eax,%edi
  803946:	48 b8 f5 36 80 00 00 	movabs $0x8036f5,%rax
  80394d:	00 00 00 
  803950:	ff d0                	callq  *%rax
  803952:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803955:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803959:	79 05                	jns    803960 <connect+0x31>
  80395b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80395e:	eb 1b                	jmp    80397b <connect+0x4c>
  803960:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803963:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803967:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80396a:	48 89 ce             	mov    %rcx,%rsi
  80396d:	89 c7                	mov    %eax,%edi
  80396f:	48 b8 86 3c 80 00 00 	movabs $0x803c86,%rax
  803976:	00 00 00 
  803979:	ff d0                	callq  *%rax
  80397b:	c9                   	leaveq 
  80397c:	c3                   	retq   

000000000080397d <listen>:
  80397d:	55                   	push   %rbp
  80397e:	48 89 e5             	mov    %rsp,%rbp
  803981:	48 83 ec 20          	sub    $0x20,%rsp
  803985:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803988:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80398b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80398e:	89 c7                	mov    %eax,%edi
  803990:	48 b8 f5 36 80 00 00 	movabs $0x8036f5,%rax
  803997:	00 00 00 
  80399a:	ff d0                	callq  *%rax
  80399c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80399f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039a3:	79 05                	jns    8039aa <listen+0x2d>
  8039a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039a8:	eb 16                	jmp    8039c0 <listen+0x43>
  8039aa:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039b0:	89 d6                	mov    %edx,%esi
  8039b2:	89 c7                	mov    %eax,%edi
  8039b4:	48 b8 ea 3c 80 00 00 	movabs $0x803cea,%rax
  8039bb:	00 00 00 
  8039be:	ff d0                	callq  *%rax
  8039c0:	c9                   	leaveq 
  8039c1:	c3                   	retq   

00000000008039c2 <devsock_read>:
  8039c2:	55                   	push   %rbp
  8039c3:	48 89 e5             	mov    %rsp,%rbp
  8039c6:	48 83 ec 20          	sub    $0x20,%rsp
  8039ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039ce:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039d2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8039d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039da:	89 c2                	mov    %eax,%edx
  8039dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039e0:	8b 40 0c             	mov    0xc(%rax),%eax
  8039e3:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8039e7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8039ec:	89 c7                	mov    %eax,%edi
  8039ee:	48 b8 2a 3d 80 00 00 	movabs $0x803d2a,%rax
  8039f5:	00 00 00 
  8039f8:	ff d0                	callq  *%rax
  8039fa:	c9                   	leaveq 
  8039fb:	c3                   	retq   

00000000008039fc <devsock_write>:
  8039fc:	55                   	push   %rbp
  8039fd:	48 89 e5             	mov    %rsp,%rbp
  803a00:	48 83 ec 20          	sub    $0x20,%rsp
  803a04:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a0c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803a10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a14:	89 c2                	mov    %eax,%edx
  803a16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a1a:	8b 40 0c             	mov    0xc(%rax),%eax
  803a1d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803a21:	b9 00 00 00 00       	mov    $0x0,%ecx
  803a26:	89 c7                	mov    %eax,%edi
  803a28:	48 b8 f6 3d 80 00 00 	movabs $0x803df6,%rax
  803a2f:	00 00 00 
  803a32:	ff d0                	callq  *%rax
  803a34:	c9                   	leaveq 
  803a35:	c3                   	retq   

0000000000803a36 <devsock_stat>:
  803a36:	55                   	push   %rbp
  803a37:	48 89 e5             	mov    %rsp,%rbp
  803a3a:	48 83 ec 10          	sub    $0x10,%rsp
  803a3e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a42:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a46:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a4a:	48 be 0a 53 80 00 00 	movabs $0x80530a,%rsi
  803a51:	00 00 00 
  803a54:	48 89 c7             	mov    %rax,%rdi
  803a57:	48 b8 a8 12 80 00 00 	movabs $0x8012a8,%rax
  803a5e:	00 00 00 
  803a61:	ff d0                	callq  *%rax
  803a63:	b8 00 00 00 00       	mov    $0x0,%eax
  803a68:	c9                   	leaveq 
  803a69:	c3                   	retq   

0000000000803a6a <socket>:
  803a6a:	55                   	push   %rbp
  803a6b:	48 89 e5             	mov    %rsp,%rbp
  803a6e:	48 83 ec 20          	sub    $0x20,%rsp
  803a72:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a75:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803a78:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803a7b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803a7e:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803a81:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a84:	89 ce                	mov    %ecx,%esi
  803a86:	89 c7                	mov    %eax,%edi
  803a88:	48 b8 ae 3e 80 00 00 	movabs $0x803eae,%rax
  803a8f:	00 00 00 
  803a92:	ff d0                	callq  *%rax
  803a94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a9b:	79 05                	jns    803aa2 <socket+0x38>
  803a9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aa0:	eb 11                	jmp    803ab3 <socket+0x49>
  803aa2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aa5:	89 c7                	mov    %eax,%edi
  803aa7:	48 b8 4c 37 80 00 00 	movabs $0x80374c,%rax
  803aae:	00 00 00 
  803ab1:	ff d0                	callq  *%rax
  803ab3:	c9                   	leaveq 
  803ab4:	c3                   	retq   

0000000000803ab5 <nsipc>:
  803ab5:	55                   	push   %rbp
  803ab6:	48 89 e5             	mov    %rsp,%rbp
  803ab9:	48 83 ec 10          	sub    $0x10,%rsp
  803abd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ac0:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803ac7:	00 00 00 
  803aca:	8b 00                	mov    (%rax),%eax
  803acc:	85 c0                	test   %eax,%eax
  803ace:	75 1d                	jne    803aed <nsipc+0x38>
  803ad0:	bf 02 00 00 00       	mov    $0x2,%edi
  803ad5:	48 b8 fc 49 80 00 00 	movabs $0x8049fc,%rax
  803adc:	00 00 00 
  803adf:	ff d0                	callq  *%rax
  803ae1:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803ae8:	00 00 00 
  803aeb:	89 02                	mov    %eax,(%rdx)
  803aed:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803af4:	00 00 00 
  803af7:	8b 00                	mov    (%rax),%eax
  803af9:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803afc:	b9 07 00 00 00       	mov    $0x7,%ecx
  803b01:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803b08:	00 00 00 
  803b0b:	89 c7                	mov    %eax,%edi
  803b0d:	48 b8 66 49 80 00 00 	movabs $0x804966,%rax
  803b14:	00 00 00 
  803b17:	ff d0                	callq  *%rax
  803b19:	ba 00 00 00 00       	mov    $0x0,%edx
  803b1e:	be 00 00 00 00       	mov    $0x0,%esi
  803b23:	bf 00 00 00 00       	mov    $0x0,%edi
  803b28:	48 b8 a5 48 80 00 00 	movabs $0x8048a5,%rax
  803b2f:	00 00 00 
  803b32:	ff d0                	callq  *%rax
  803b34:	c9                   	leaveq 
  803b35:	c3                   	retq   

0000000000803b36 <nsipc_accept>:
  803b36:	55                   	push   %rbp
  803b37:	48 89 e5             	mov    %rsp,%rbp
  803b3a:	48 83 ec 30          	sub    $0x30,%rsp
  803b3e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b41:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b45:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b49:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b50:	00 00 00 
  803b53:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b56:	89 10                	mov    %edx,(%rax)
  803b58:	bf 01 00 00 00       	mov    $0x1,%edi
  803b5d:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803b64:	00 00 00 
  803b67:	ff d0                	callq  *%rax
  803b69:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b6c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b70:	78 3e                	js     803bb0 <nsipc_accept+0x7a>
  803b72:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b79:	00 00 00 
  803b7c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b84:	8b 40 10             	mov    0x10(%rax),%eax
  803b87:	89 c2                	mov    %eax,%edx
  803b89:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803b8d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b91:	48 89 ce             	mov    %rcx,%rsi
  803b94:	48 89 c7             	mov    %rax,%rdi
  803b97:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  803b9e:	00 00 00 
  803ba1:	ff d0                	callq  *%rax
  803ba3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ba7:	8b 50 10             	mov    0x10(%rax),%edx
  803baa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bae:	89 10                	mov    %edx,(%rax)
  803bb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bb3:	c9                   	leaveq 
  803bb4:	c3                   	retq   

0000000000803bb5 <nsipc_bind>:
  803bb5:	55                   	push   %rbp
  803bb6:	48 89 e5             	mov    %rsp,%rbp
  803bb9:	48 83 ec 10          	sub    $0x10,%rsp
  803bbd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803bc0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803bc4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803bc7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bce:	00 00 00 
  803bd1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bd4:	89 10                	mov    %edx,(%rax)
  803bd6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bdd:	48 89 c6             	mov    %rax,%rsi
  803be0:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803be7:	00 00 00 
  803bea:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  803bf1:	00 00 00 
  803bf4:	ff d0                	callq  *%rax
  803bf6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bfd:	00 00 00 
  803c00:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c03:	89 50 14             	mov    %edx,0x14(%rax)
  803c06:	bf 02 00 00 00       	mov    $0x2,%edi
  803c0b:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803c12:	00 00 00 
  803c15:	ff d0                	callq  *%rax
  803c17:	c9                   	leaveq 
  803c18:	c3                   	retq   

0000000000803c19 <nsipc_shutdown>:
  803c19:	55                   	push   %rbp
  803c1a:	48 89 e5             	mov    %rsp,%rbp
  803c1d:	48 83 ec 10          	sub    $0x10,%rsp
  803c21:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c24:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c27:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c2e:	00 00 00 
  803c31:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c34:	89 10                	mov    %edx,(%rax)
  803c36:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c3d:	00 00 00 
  803c40:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c43:	89 50 04             	mov    %edx,0x4(%rax)
  803c46:	bf 03 00 00 00       	mov    $0x3,%edi
  803c4b:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803c52:	00 00 00 
  803c55:	ff d0                	callq  *%rax
  803c57:	c9                   	leaveq 
  803c58:	c3                   	retq   

0000000000803c59 <nsipc_close>:
  803c59:	55                   	push   %rbp
  803c5a:	48 89 e5             	mov    %rsp,%rbp
  803c5d:	48 83 ec 10          	sub    $0x10,%rsp
  803c61:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c64:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c6b:	00 00 00 
  803c6e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c71:	89 10                	mov    %edx,(%rax)
  803c73:	bf 04 00 00 00       	mov    $0x4,%edi
  803c78:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803c7f:	00 00 00 
  803c82:	ff d0                	callq  *%rax
  803c84:	c9                   	leaveq 
  803c85:	c3                   	retq   

0000000000803c86 <nsipc_connect>:
  803c86:	55                   	push   %rbp
  803c87:	48 89 e5             	mov    %rsp,%rbp
  803c8a:	48 83 ec 10          	sub    $0x10,%rsp
  803c8e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c91:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c95:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803c98:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c9f:	00 00 00 
  803ca2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ca5:	89 10                	mov    %edx,(%rax)
  803ca7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803caa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cae:	48 89 c6             	mov    %rax,%rsi
  803cb1:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803cb8:	00 00 00 
  803cbb:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  803cc2:	00 00 00 
  803cc5:	ff d0                	callq  *%rax
  803cc7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cce:	00 00 00 
  803cd1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cd4:	89 50 14             	mov    %edx,0x14(%rax)
  803cd7:	bf 05 00 00 00       	mov    $0x5,%edi
  803cdc:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803ce3:	00 00 00 
  803ce6:	ff d0                	callq  *%rax
  803ce8:	c9                   	leaveq 
  803ce9:	c3                   	retq   

0000000000803cea <nsipc_listen>:
  803cea:	55                   	push   %rbp
  803ceb:	48 89 e5             	mov    %rsp,%rbp
  803cee:	48 83 ec 10          	sub    $0x10,%rsp
  803cf2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cf5:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803cf8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cff:	00 00 00 
  803d02:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d05:	89 10                	mov    %edx,(%rax)
  803d07:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d0e:	00 00 00 
  803d11:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d14:	89 50 04             	mov    %edx,0x4(%rax)
  803d17:	bf 06 00 00 00       	mov    $0x6,%edi
  803d1c:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803d23:	00 00 00 
  803d26:	ff d0                	callq  *%rax
  803d28:	c9                   	leaveq 
  803d29:	c3                   	retq   

0000000000803d2a <nsipc_recv>:
  803d2a:	55                   	push   %rbp
  803d2b:	48 89 e5             	mov    %rsp,%rbp
  803d2e:	48 83 ec 30          	sub    $0x30,%rsp
  803d32:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d35:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d39:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803d3c:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803d3f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d46:	00 00 00 
  803d49:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d4c:	89 10                	mov    %edx,(%rax)
  803d4e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d55:	00 00 00 
  803d58:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d5b:	89 50 04             	mov    %edx,0x4(%rax)
  803d5e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d65:	00 00 00 
  803d68:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803d6b:	89 50 08             	mov    %edx,0x8(%rax)
  803d6e:	bf 07 00 00 00       	mov    $0x7,%edi
  803d73:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803d7a:	00 00 00 
  803d7d:	ff d0                	callq  *%rax
  803d7f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d82:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d86:	78 69                	js     803df1 <nsipc_recv+0xc7>
  803d88:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803d8f:	7f 08                	jg     803d99 <nsipc_recv+0x6f>
  803d91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d94:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803d97:	7e 35                	jle    803dce <nsipc_recv+0xa4>
  803d99:	48 b9 11 53 80 00 00 	movabs $0x805311,%rcx
  803da0:	00 00 00 
  803da3:	48 ba 26 53 80 00 00 	movabs $0x805326,%rdx
  803daa:	00 00 00 
  803dad:	be 62 00 00 00       	mov    $0x62,%esi
  803db2:	48 bf 3b 53 80 00 00 	movabs $0x80533b,%rdi
  803db9:	00 00 00 
  803dbc:	b8 00 00 00 00       	mov    $0x0,%eax
  803dc1:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  803dc8:	00 00 00 
  803dcb:	41 ff d0             	callq  *%r8
  803dce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dd1:	48 63 d0             	movslq %eax,%rdx
  803dd4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803dd8:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803ddf:	00 00 00 
  803de2:	48 89 c7             	mov    %rax,%rdi
  803de5:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  803dec:	00 00 00 
  803def:	ff d0                	callq  *%rax
  803df1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803df4:	c9                   	leaveq 
  803df5:	c3                   	retq   

0000000000803df6 <nsipc_send>:
  803df6:	55                   	push   %rbp
  803df7:	48 89 e5             	mov    %rsp,%rbp
  803dfa:	48 83 ec 20          	sub    $0x20,%rsp
  803dfe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e01:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e05:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803e08:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803e0b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e12:	00 00 00 
  803e15:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e18:	89 10                	mov    %edx,(%rax)
  803e1a:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803e21:	7e 35                	jle    803e58 <nsipc_send+0x62>
  803e23:	48 b9 4a 53 80 00 00 	movabs $0x80534a,%rcx
  803e2a:	00 00 00 
  803e2d:	48 ba 26 53 80 00 00 	movabs $0x805326,%rdx
  803e34:	00 00 00 
  803e37:	be 6d 00 00 00       	mov    $0x6d,%esi
  803e3c:	48 bf 3b 53 80 00 00 	movabs $0x80533b,%rdi
  803e43:	00 00 00 
  803e46:	b8 00 00 00 00       	mov    $0x0,%eax
  803e4b:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  803e52:	00 00 00 
  803e55:	41 ff d0             	callq  *%r8
  803e58:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e5b:	48 63 d0             	movslq %eax,%rdx
  803e5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e62:	48 89 c6             	mov    %rax,%rsi
  803e65:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803e6c:	00 00 00 
  803e6f:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  803e76:	00 00 00 
  803e79:	ff d0                	callq  *%rax
  803e7b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e82:	00 00 00 
  803e85:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e88:	89 50 04             	mov    %edx,0x4(%rax)
  803e8b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e92:	00 00 00 
  803e95:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e98:	89 50 08             	mov    %edx,0x8(%rax)
  803e9b:	bf 08 00 00 00       	mov    $0x8,%edi
  803ea0:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803ea7:	00 00 00 
  803eaa:	ff d0                	callq  *%rax
  803eac:	c9                   	leaveq 
  803ead:	c3                   	retq   

0000000000803eae <nsipc_socket>:
  803eae:	55                   	push   %rbp
  803eaf:	48 89 e5             	mov    %rsp,%rbp
  803eb2:	48 83 ec 10          	sub    $0x10,%rsp
  803eb6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803eb9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803ebc:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803ebf:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ec6:	00 00 00 
  803ec9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ecc:	89 10                	mov    %edx,(%rax)
  803ece:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ed5:	00 00 00 
  803ed8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803edb:	89 50 04             	mov    %edx,0x4(%rax)
  803ede:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ee5:	00 00 00 
  803ee8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803eeb:	89 50 08             	mov    %edx,0x8(%rax)
  803eee:	bf 09 00 00 00       	mov    $0x9,%edi
  803ef3:	48 b8 b5 3a 80 00 00 	movabs $0x803ab5,%rax
  803efa:	00 00 00 
  803efd:	ff d0                	callq  *%rax
  803eff:	c9                   	leaveq 
  803f00:	c3                   	retq   

0000000000803f01 <pipe>:
  803f01:	55                   	push   %rbp
  803f02:	48 89 e5             	mov    %rsp,%rbp
  803f05:	53                   	push   %rbx
  803f06:	48 83 ec 38          	sub    $0x38,%rsp
  803f0a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803f0e:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803f12:	48 89 c7             	mov    %rax,%rdi
  803f15:	48 b8 18 27 80 00 00 	movabs $0x802718,%rax
  803f1c:	00 00 00 
  803f1f:	ff d0                	callq  *%rax
  803f21:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f24:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f28:	0f 88 bf 01 00 00    	js     8040ed <pipe+0x1ec>
  803f2e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f32:	ba 07 04 00 00       	mov    $0x407,%edx
  803f37:	48 89 c6             	mov    %rax,%rsi
  803f3a:	bf 00 00 00 00       	mov    $0x0,%edi
  803f3f:	48 b8 d7 1b 80 00 00 	movabs $0x801bd7,%rax
  803f46:	00 00 00 
  803f49:	ff d0                	callq  *%rax
  803f4b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f4e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f52:	0f 88 95 01 00 00    	js     8040ed <pipe+0x1ec>
  803f58:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803f5c:	48 89 c7             	mov    %rax,%rdi
  803f5f:	48 b8 18 27 80 00 00 	movabs $0x802718,%rax
  803f66:	00 00 00 
  803f69:	ff d0                	callq  *%rax
  803f6b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f6e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f72:	0f 88 5d 01 00 00    	js     8040d5 <pipe+0x1d4>
  803f78:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f7c:	ba 07 04 00 00       	mov    $0x407,%edx
  803f81:	48 89 c6             	mov    %rax,%rsi
  803f84:	bf 00 00 00 00       	mov    $0x0,%edi
  803f89:	48 b8 d7 1b 80 00 00 	movabs $0x801bd7,%rax
  803f90:	00 00 00 
  803f93:	ff d0                	callq  *%rax
  803f95:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f98:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f9c:	0f 88 33 01 00 00    	js     8040d5 <pipe+0x1d4>
  803fa2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fa6:	48 89 c7             	mov    %rax,%rdi
  803fa9:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  803fb0:	00 00 00 
  803fb3:	ff d0                	callq  *%rax
  803fb5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803fb9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fbd:	ba 07 04 00 00       	mov    $0x407,%edx
  803fc2:	48 89 c6             	mov    %rax,%rsi
  803fc5:	bf 00 00 00 00       	mov    $0x0,%edi
  803fca:	48 b8 d7 1b 80 00 00 	movabs $0x801bd7,%rax
  803fd1:	00 00 00 
  803fd4:	ff d0                	callq  *%rax
  803fd6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803fd9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803fdd:	79 05                	jns    803fe4 <pipe+0xe3>
  803fdf:	e9 d9 00 00 00       	jmpq   8040bd <pipe+0x1bc>
  803fe4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fe8:	48 89 c7             	mov    %rax,%rdi
  803feb:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  803ff2:	00 00 00 
  803ff5:	ff d0                	callq  *%rax
  803ff7:	48 89 c2             	mov    %rax,%rdx
  803ffa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ffe:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804004:	48 89 d1             	mov    %rdx,%rcx
  804007:	ba 00 00 00 00       	mov    $0x0,%edx
  80400c:	48 89 c6             	mov    %rax,%rsi
  80400f:	bf 00 00 00 00       	mov    $0x0,%edi
  804014:	48 b8 27 1c 80 00 00 	movabs $0x801c27,%rax
  80401b:	00 00 00 
  80401e:	ff d0                	callq  *%rax
  804020:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804023:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804027:	79 1b                	jns    804044 <pipe+0x143>
  804029:	90                   	nop
  80402a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80402e:	48 89 c6             	mov    %rax,%rsi
  804031:	bf 00 00 00 00       	mov    $0x0,%edi
  804036:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  80403d:	00 00 00 
  804040:	ff d0                	callq  *%rax
  804042:	eb 79                	jmp    8040bd <pipe+0x1bc>
  804044:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804048:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80404f:	00 00 00 
  804052:	8b 12                	mov    (%rdx),%edx
  804054:	89 10                	mov    %edx,(%rax)
  804056:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80405a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804061:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804065:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80406c:	00 00 00 
  80406f:	8b 12                	mov    (%rdx),%edx
  804071:	89 10                	mov    %edx,(%rax)
  804073:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804077:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80407e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804082:	48 89 c7             	mov    %rax,%rdi
  804085:	48 b8 ca 26 80 00 00 	movabs $0x8026ca,%rax
  80408c:	00 00 00 
  80408f:	ff d0                	callq  *%rax
  804091:	89 c2                	mov    %eax,%edx
  804093:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804097:	89 10                	mov    %edx,(%rax)
  804099:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80409d:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8040a1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040a5:	48 89 c7             	mov    %rax,%rdi
  8040a8:	48 b8 ca 26 80 00 00 	movabs $0x8026ca,%rax
  8040af:	00 00 00 
  8040b2:	ff d0                	callq  *%rax
  8040b4:	89 03                	mov    %eax,(%rbx)
  8040b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8040bb:	eb 33                	jmp    8040f0 <pipe+0x1ef>
  8040bd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040c1:	48 89 c6             	mov    %rax,%rsi
  8040c4:	bf 00 00 00 00       	mov    $0x0,%edi
  8040c9:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  8040d0:	00 00 00 
  8040d3:	ff d0                	callq  *%rax
  8040d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040d9:	48 89 c6             	mov    %rax,%rsi
  8040dc:	bf 00 00 00 00       	mov    $0x0,%edi
  8040e1:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  8040e8:	00 00 00 
  8040eb:	ff d0                	callq  *%rax
  8040ed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040f0:	48 83 c4 38          	add    $0x38,%rsp
  8040f4:	5b                   	pop    %rbx
  8040f5:	5d                   	pop    %rbp
  8040f6:	c3                   	retq   

00000000008040f7 <_pipeisclosed>:
  8040f7:	55                   	push   %rbp
  8040f8:	48 89 e5             	mov    %rsp,%rbp
  8040fb:	53                   	push   %rbx
  8040fc:	48 83 ec 28          	sub    $0x28,%rsp
  804100:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804104:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804108:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80410f:	00 00 00 
  804112:	48 8b 00             	mov    (%rax),%rax
  804115:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80411b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80411e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804122:	48 89 c7             	mov    %rax,%rdi
  804125:	48 b8 6e 4a 80 00 00 	movabs $0x804a6e,%rax
  80412c:	00 00 00 
  80412f:	ff d0                	callq  *%rax
  804131:	89 c3                	mov    %eax,%ebx
  804133:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804137:	48 89 c7             	mov    %rax,%rdi
  80413a:	48 b8 6e 4a 80 00 00 	movabs $0x804a6e,%rax
  804141:	00 00 00 
  804144:	ff d0                	callq  *%rax
  804146:	39 c3                	cmp    %eax,%ebx
  804148:	0f 94 c0             	sete   %al
  80414b:	0f b6 c0             	movzbl %al,%eax
  80414e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804151:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804158:	00 00 00 
  80415b:	48 8b 00             	mov    (%rax),%rax
  80415e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804164:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804167:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80416a:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80416d:	75 05                	jne    804174 <_pipeisclosed+0x7d>
  80416f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804172:	eb 4f                	jmp    8041c3 <_pipeisclosed+0xcc>
  804174:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804177:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80417a:	74 42                	je     8041be <_pipeisclosed+0xc7>
  80417c:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804180:	75 3c                	jne    8041be <_pipeisclosed+0xc7>
  804182:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804189:	00 00 00 
  80418c:	48 8b 00             	mov    (%rax),%rax
  80418f:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804195:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804198:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80419b:	89 c6                	mov    %eax,%esi
  80419d:	48 bf 5b 53 80 00 00 	movabs $0x80535b,%rdi
  8041a4:	00 00 00 
  8041a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8041ac:	49 b8 f3 06 80 00 00 	movabs $0x8006f3,%r8
  8041b3:	00 00 00 
  8041b6:	41 ff d0             	callq  *%r8
  8041b9:	e9 4a ff ff ff       	jmpq   804108 <_pipeisclosed+0x11>
  8041be:	e9 45 ff ff ff       	jmpq   804108 <_pipeisclosed+0x11>
  8041c3:	48 83 c4 28          	add    $0x28,%rsp
  8041c7:	5b                   	pop    %rbx
  8041c8:	5d                   	pop    %rbp
  8041c9:	c3                   	retq   

00000000008041ca <pipeisclosed>:
  8041ca:	55                   	push   %rbp
  8041cb:	48 89 e5             	mov    %rsp,%rbp
  8041ce:	48 83 ec 30          	sub    $0x30,%rsp
  8041d2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8041d5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8041d9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8041dc:	48 89 d6             	mov    %rdx,%rsi
  8041df:	89 c7                	mov    %eax,%edi
  8041e1:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  8041e8:	00 00 00 
  8041eb:	ff d0                	callq  *%rax
  8041ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041f4:	79 05                	jns    8041fb <pipeisclosed+0x31>
  8041f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041f9:	eb 31                	jmp    80422c <pipeisclosed+0x62>
  8041fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041ff:	48 89 c7             	mov    %rax,%rdi
  804202:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  804209:	00 00 00 
  80420c:	ff d0                	callq  *%rax
  80420e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804212:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804216:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80421a:	48 89 d6             	mov    %rdx,%rsi
  80421d:	48 89 c7             	mov    %rax,%rdi
  804220:	48 b8 f7 40 80 00 00 	movabs $0x8040f7,%rax
  804227:	00 00 00 
  80422a:	ff d0                	callq  *%rax
  80422c:	c9                   	leaveq 
  80422d:	c3                   	retq   

000000000080422e <devpipe_read>:
  80422e:	55                   	push   %rbp
  80422f:	48 89 e5             	mov    %rsp,%rbp
  804232:	48 83 ec 40          	sub    $0x40,%rsp
  804236:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80423a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80423e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804242:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804246:	48 89 c7             	mov    %rax,%rdi
  804249:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  804250:	00 00 00 
  804253:	ff d0                	callq  *%rax
  804255:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804259:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80425d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804261:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804268:	00 
  804269:	e9 92 00 00 00       	jmpq   804300 <devpipe_read+0xd2>
  80426e:	eb 41                	jmp    8042b1 <devpipe_read+0x83>
  804270:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804275:	74 09                	je     804280 <devpipe_read+0x52>
  804277:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80427b:	e9 92 00 00 00       	jmpq   804312 <devpipe_read+0xe4>
  804280:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804284:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804288:	48 89 d6             	mov    %rdx,%rsi
  80428b:	48 89 c7             	mov    %rax,%rdi
  80428e:	48 b8 f7 40 80 00 00 	movabs $0x8040f7,%rax
  804295:	00 00 00 
  804298:	ff d0                	callq  *%rax
  80429a:	85 c0                	test   %eax,%eax
  80429c:	74 07                	je     8042a5 <devpipe_read+0x77>
  80429e:	b8 00 00 00 00       	mov    $0x0,%eax
  8042a3:	eb 6d                	jmp    804312 <devpipe_read+0xe4>
  8042a5:	48 b8 99 1b 80 00 00 	movabs $0x801b99,%rax
  8042ac:	00 00 00 
  8042af:	ff d0                	callq  *%rax
  8042b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042b5:	8b 10                	mov    (%rax),%edx
  8042b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042bb:	8b 40 04             	mov    0x4(%rax),%eax
  8042be:	39 c2                	cmp    %eax,%edx
  8042c0:	74 ae                	je     804270 <devpipe_read+0x42>
  8042c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8042ca:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8042ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042d2:	8b 00                	mov    (%rax),%eax
  8042d4:	99                   	cltd   
  8042d5:	c1 ea 1b             	shr    $0x1b,%edx
  8042d8:	01 d0                	add    %edx,%eax
  8042da:	83 e0 1f             	and    $0x1f,%eax
  8042dd:	29 d0                	sub    %edx,%eax
  8042df:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042e3:	48 98                	cltq   
  8042e5:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8042ea:	88 01                	mov    %al,(%rcx)
  8042ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042f0:	8b 00                	mov    (%rax),%eax
  8042f2:	8d 50 01             	lea    0x1(%rax),%edx
  8042f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042f9:	89 10                	mov    %edx,(%rax)
  8042fb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804300:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804304:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804308:	0f 82 60 ff ff ff    	jb     80426e <devpipe_read+0x40>
  80430e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804312:	c9                   	leaveq 
  804313:	c3                   	retq   

0000000000804314 <devpipe_write>:
  804314:	55                   	push   %rbp
  804315:	48 89 e5             	mov    %rsp,%rbp
  804318:	48 83 ec 40          	sub    $0x40,%rsp
  80431c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804320:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804324:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804328:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80432c:	48 89 c7             	mov    %rax,%rdi
  80432f:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  804336:	00 00 00 
  804339:	ff d0                	callq  *%rax
  80433b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80433f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804343:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804347:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80434e:	00 
  80434f:	e9 8e 00 00 00       	jmpq   8043e2 <devpipe_write+0xce>
  804354:	eb 31                	jmp    804387 <devpipe_write+0x73>
  804356:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80435a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80435e:	48 89 d6             	mov    %rdx,%rsi
  804361:	48 89 c7             	mov    %rax,%rdi
  804364:	48 b8 f7 40 80 00 00 	movabs $0x8040f7,%rax
  80436b:	00 00 00 
  80436e:	ff d0                	callq  *%rax
  804370:	85 c0                	test   %eax,%eax
  804372:	74 07                	je     80437b <devpipe_write+0x67>
  804374:	b8 00 00 00 00       	mov    $0x0,%eax
  804379:	eb 79                	jmp    8043f4 <devpipe_write+0xe0>
  80437b:	48 b8 99 1b 80 00 00 	movabs $0x801b99,%rax
  804382:	00 00 00 
  804385:	ff d0                	callq  *%rax
  804387:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80438b:	8b 40 04             	mov    0x4(%rax),%eax
  80438e:	48 63 d0             	movslq %eax,%rdx
  804391:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804395:	8b 00                	mov    (%rax),%eax
  804397:	48 98                	cltq   
  804399:	48 83 c0 20          	add    $0x20,%rax
  80439d:	48 39 c2             	cmp    %rax,%rdx
  8043a0:	73 b4                	jae    804356 <devpipe_write+0x42>
  8043a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043a6:	8b 40 04             	mov    0x4(%rax),%eax
  8043a9:	99                   	cltd   
  8043aa:	c1 ea 1b             	shr    $0x1b,%edx
  8043ad:	01 d0                	add    %edx,%eax
  8043af:	83 e0 1f             	and    $0x1f,%eax
  8043b2:	29 d0                	sub    %edx,%eax
  8043b4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8043b8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8043bc:	48 01 ca             	add    %rcx,%rdx
  8043bf:	0f b6 0a             	movzbl (%rdx),%ecx
  8043c2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8043c6:	48 98                	cltq   
  8043c8:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8043cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043d0:	8b 40 04             	mov    0x4(%rax),%eax
  8043d3:	8d 50 01             	lea    0x1(%rax),%edx
  8043d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043da:	89 50 04             	mov    %edx,0x4(%rax)
  8043dd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8043e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043e6:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8043ea:	0f 82 64 ff ff ff    	jb     804354 <devpipe_write+0x40>
  8043f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043f4:	c9                   	leaveq 
  8043f5:	c3                   	retq   

00000000008043f6 <devpipe_stat>:
  8043f6:	55                   	push   %rbp
  8043f7:	48 89 e5             	mov    %rsp,%rbp
  8043fa:	48 83 ec 20          	sub    $0x20,%rsp
  8043fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804402:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804406:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80440a:	48 89 c7             	mov    %rax,%rdi
  80440d:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  804414:	00 00 00 
  804417:	ff d0                	callq  *%rax
  804419:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80441d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804421:	48 be 6e 53 80 00 00 	movabs $0x80536e,%rsi
  804428:	00 00 00 
  80442b:	48 89 c7             	mov    %rax,%rdi
  80442e:	48 b8 a8 12 80 00 00 	movabs $0x8012a8,%rax
  804435:	00 00 00 
  804438:	ff d0                	callq  *%rax
  80443a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80443e:	8b 50 04             	mov    0x4(%rax),%edx
  804441:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804445:	8b 00                	mov    (%rax),%eax
  804447:	29 c2                	sub    %eax,%edx
  804449:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80444d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804453:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804457:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80445e:	00 00 00 
  804461:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804465:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  80446c:	00 00 00 
  80446f:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804476:	b8 00 00 00 00       	mov    $0x0,%eax
  80447b:	c9                   	leaveq 
  80447c:	c3                   	retq   

000000000080447d <devpipe_close>:
  80447d:	55                   	push   %rbp
  80447e:	48 89 e5             	mov    %rsp,%rbp
  804481:	48 83 ec 10          	sub    $0x10,%rsp
  804485:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804489:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80448d:	48 89 c6             	mov    %rax,%rsi
  804490:	bf 00 00 00 00       	mov    $0x0,%edi
  804495:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  80449c:	00 00 00 
  80449f:	ff d0                	callq  *%rax
  8044a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044a5:	48 89 c7             	mov    %rax,%rdi
  8044a8:	48 b8 ed 26 80 00 00 	movabs $0x8026ed,%rax
  8044af:	00 00 00 
  8044b2:	ff d0                	callq  *%rax
  8044b4:	48 89 c6             	mov    %rax,%rsi
  8044b7:	bf 00 00 00 00       	mov    $0x0,%edi
  8044bc:	48 b8 82 1c 80 00 00 	movabs $0x801c82,%rax
  8044c3:	00 00 00 
  8044c6:	ff d0                	callq  *%rax
  8044c8:	c9                   	leaveq 
  8044c9:	c3                   	retq   

00000000008044ca <cputchar>:
  8044ca:	55                   	push   %rbp
  8044cb:	48 89 e5             	mov    %rsp,%rbp
  8044ce:	48 83 ec 20          	sub    $0x20,%rsp
  8044d2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8044d5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044d8:	88 45 ff             	mov    %al,-0x1(%rbp)
  8044db:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8044df:	be 01 00 00 00       	mov    $0x1,%esi
  8044e4:	48 89 c7             	mov    %rax,%rdi
  8044e7:	48 b8 8f 1a 80 00 00 	movabs $0x801a8f,%rax
  8044ee:	00 00 00 
  8044f1:	ff d0                	callq  *%rax
  8044f3:	c9                   	leaveq 
  8044f4:	c3                   	retq   

00000000008044f5 <getchar>:
  8044f5:	55                   	push   %rbp
  8044f6:	48 89 e5             	mov    %rsp,%rbp
  8044f9:	48 83 ec 10          	sub    $0x10,%rsp
  8044fd:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804501:	ba 01 00 00 00       	mov    $0x1,%edx
  804506:	48 89 c6             	mov    %rax,%rsi
  804509:	bf 00 00 00 00       	mov    $0x0,%edi
  80450e:	48 b8 e2 2b 80 00 00 	movabs $0x802be2,%rax
  804515:	00 00 00 
  804518:	ff d0                	callq  *%rax
  80451a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80451d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804521:	79 05                	jns    804528 <getchar+0x33>
  804523:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804526:	eb 14                	jmp    80453c <getchar+0x47>
  804528:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80452c:	7f 07                	jg     804535 <getchar+0x40>
  80452e:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804533:	eb 07                	jmp    80453c <getchar+0x47>
  804535:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804539:	0f b6 c0             	movzbl %al,%eax
  80453c:	c9                   	leaveq 
  80453d:	c3                   	retq   

000000000080453e <iscons>:
  80453e:	55                   	push   %rbp
  80453f:	48 89 e5             	mov    %rsp,%rbp
  804542:	48 83 ec 20          	sub    $0x20,%rsp
  804546:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804549:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80454d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804550:	48 89 d6             	mov    %rdx,%rsi
  804553:	89 c7                	mov    %eax,%edi
  804555:	48 b8 b0 27 80 00 00 	movabs $0x8027b0,%rax
  80455c:	00 00 00 
  80455f:	ff d0                	callq  *%rax
  804561:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804564:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804568:	79 05                	jns    80456f <iscons+0x31>
  80456a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80456d:	eb 1a                	jmp    804589 <iscons+0x4b>
  80456f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804573:	8b 10                	mov    (%rax),%edx
  804575:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80457c:	00 00 00 
  80457f:	8b 00                	mov    (%rax),%eax
  804581:	39 c2                	cmp    %eax,%edx
  804583:	0f 94 c0             	sete   %al
  804586:	0f b6 c0             	movzbl %al,%eax
  804589:	c9                   	leaveq 
  80458a:	c3                   	retq   

000000000080458b <opencons>:
  80458b:	55                   	push   %rbp
  80458c:	48 89 e5             	mov    %rsp,%rbp
  80458f:	48 83 ec 10          	sub    $0x10,%rsp
  804593:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804597:	48 89 c7             	mov    %rax,%rdi
  80459a:	48 b8 18 27 80 00 00 	movabs $0x802718,%rax
  8045a1:	00 00 00 
  8045a4:	ff d0                	callq  *%rax
  8045a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045ad:	79 05                	jns    8045b4 <opencons+0x29>
  8045af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045b2:	eb 5b                	jmp    80460f <opencons+0x84>
  8045b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045b8:	ba 07 04 00 00       	mov    $0x407,%edx
  8045bd:	48 89 c6             	mov    %rax,%rsi
  8045c0:	bf 00 00 00 00       	mov    $0x0,%edi
  8045c5:	48 b8 d7 1b 80 00 00 	movabs $0x801bd7,%rax
  8045cc:	00 00 00 
  8045cf:	ff d0                	callq  *%rax
  8045d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045d8:	79 05                	jns    8045df <opencons+0x54>
  8045da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045dd:	eb 30                	jmp    80460f <opencons+0x84>
  8045df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045e3:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8045ea:	00 00 00 
  8045ed:	8b 12                	mov    (%rdx),%edx
  8045ef:	89 10                	mov    %edx,(%rax)
  8045f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045f5:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8045fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804600:	48 89 c7             	mov    %rax,%rdi
  804603:	48 b8 ca 26 80 00 00 	movabs $0x8026ca,%rax
  80460a:	00 00 00 
  80460d:	ff d0                	callq  *%rax
  80460f:	c9                   	leaveq 
  804610:	c3                   	retq   

0000000000804611 <devcons_read>:
  804611:	55                   	push   %rbp
  804612:	48 89 e5             	mov    %rsp,%rbp
  804615:	48 83 ec 30          	sub    $0x30,%rsp
  804619:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80461d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804621:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804625:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80462a:	75 07                	jne    804633 <devcons_read+0x22>
  80462c:	b8 00 00 00 00       	mov    $0x0,%eax
  804631:	eb 4b                	jmp    80467e <devcons_read+0x6d>
  804633:	eb 0c                	jmp    804641 <devcons_read+0x30>
  804635:	48 b8 99 1b 80 00 00 	movabs $0x801b99,%rax
  80463c:	00 00 00 
  80463f:	ff d0                	callq  *%rax
  804641:	48 b8 d9 1a 80 00 00 	movabs $0x801ad9,%rax
  804648:	00 00 00 
  80464b:	ff d0                	callq  *%rax
  80464d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804650:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804654:	74 df                	je     804635 <devcons_read+0x24>
  804656:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80465a:	79 05                	jns    804661 <devcons_read+0x50>
  80465c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80465f:	eb 1d                	jmp    80467e <devcons_read+0x6d>
  804661:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804665:	75 07                	jne    80466e <devcons_read+0x5d>
  804667:	b8 00 00 00 00       	mov    $0x0,%eax
  80466c:	eb 10                	jmp    80467e <devcons_read+0x6d>
  80466e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804671:	89 c2                	mov    %eax,%edx
  804673:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804677:	88 10                	mov    %dl,(%rax)
  804679:	b8 01 00 00 00       	mov    $0x1,%eax
  80467e:	c9                   	leaveq 
  80467f:	c3                   	retq   

0000000000804680 <devcons_write>:
  804680:	55                   	push   %rbp
  804681:	48 89 e5             	mov    %rsp,%rbp
  804684:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80468b:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804692:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804699:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8046a0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8046a7:	eb 76                	jmp    80471f <devcons_write+0x9f>
  8046a9:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8046b0:	89 c2                	mov    %eax,%edx
  8046b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b5:	29 c2                	sub    %eax,%edx
  8046b7:	89 d0                	mov    %edx,%eax
  8046b9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8046bc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046bf:	83 f8 7f             	cmp    $0x7f,%eax
  8046c2:	76 07                	jbe    8046cb <devcons_write+0x4b>
  8046c4:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8046cb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046ce:	48 63 d0             	movslq %eax,%rdx
  8046d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046d4:	48 63 c8             	movslq %eax,%rcx
  8046d7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8046de:	48 01 c1             	add    %rax,%rcx
  8046e1:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8046e8:	48 89 ce             	mov    %rcx,%rsi
  8046eb:	48 89 c7             	mov    %rax,%rdi
  8046ee:	48 b8 cc 15 80 00 00 	movabs $0x8015cc,%rax
  8046f5:	00 00 00 
  8046f8:	ff d0                	callq  *%rax
  8046fa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046fd:	48 63 d0             	movslq %eax,%rdx
  804700:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804707:	48 89 d6             	mov    %rdx,%rsi
  80470a:	48 89 c7             	mov    %rax,%rdi
  80470d:	48 b8 8f 1a 80 00 00 	movabs $0x801a8f,%rax
  804714:	00 00 00 
  804717:	ff d0                	callq  *%rax
  804719:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80471c:	01 45 fc             	add    %eax,-0x4(%rbp)
  80471f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804722:	48 98                	cltq   
  804724:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80472b:	0f 82 78 ff ff ff    	jb     8046a9 <devcons_write+0x29>
  804731:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804734:	c9                   	leaveq 
  804735:	c3                   	retq   

0000000000804736 <devcons_close>:
  804736:	55                   	push   %rbp
  804737:	48 89 e5             	mov    %rsp,%rbp
  80473a:	48 83 ec 08          	sub    $0x8,%rsp
  80473e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804742:	b8 00 00 00 00       	mov    $0x0,%eax
  804747:	c9                   	leaveq 
  804748:	c3                   	retq   

0000000000804749 <devcons_stat>:
  804749:	55                   	push   %rbp
  80474a:	48 89 e5             	mov    %rsp,%rbp
  80474d:	48 83 ec 10          	sub    $0x10,%rsp
  804751:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804755:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804759:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80475d:	48 be 7a 53 80 00 00 	movabs $0x80537a,%rsi
  804764:	00 00 00 
  804767:	48 89 c7             	mov    %rax,%rdi
  80476a:	48 b8 a8 12 80 00 00 	movabs $0x8012a8,%rax
  804771:	00 00 00 
  804774:	ff d0                	callq  *%rax
  804776:	b8 00 00 00 00       	mov    $0x0,%eax
  80477b:	c9                   	leaveq 
  80477c:	c3                   	retq   

000000000080477d <set_pgfault_handler>:
  80477d:	55                   	push   %rbp
  80477e:	48 89 e5             	mov    %rsp,%rbp
  804781:	48 83 ec 20          	sub    $0x20,%rsp
  804785:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804789:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804790:	00 00 00 
  804793:	48 8b 00             	mov    (%rax),%rax
  804796:	48 85 c0             	test   %rax,%rax
  804799:	75 6f                	jne    80480a <set_pgfault_handler+0x8d>
  80479b:	ba 07 00 00 00       	mov    $0x7,%edx
  8047a0:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8047a5:	bf 00 00 00 00       	mov    $0x0,%edi
  8047aa:	48 b8 d7 1b 80 00 00 	movabs $0x801bd7,%rax
  8047b1:	00 00 00 
  8047b4:	ff d0                	callq  *%rax
  8047b6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047b9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047bd:	79 30                	jns    8047ef <set_pgfault_handler+0x72>
  8047bf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047c2:	89 c1                	mov    %eax,%ecx
  8047c4:	48 ba 88 53 80 00 00 	movabs $0x805388,%rdx
  8047cb:	00 00 00 
  8047ce:	be 22 00 00 00       	mov    $0x22,%esi
  8047d3:	48 bf a7 53 80 00 00 	movabs $0x8053a7,%rdi
  8047da:	00 00 00 
  8047dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8047e2:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  8047e9:	00 00 00 
  8047ec:	41 ff d0             	callq  *%r8
  8047ef:	48 be 1d 48 80 00 00 	movabs $0x80481d,%rsi
  8047f6:	00 00 00 
  8047f9:	bf 00 00 00 00       	mov    $0x0,%edi
  8047fe:	48 b8 61 1d 80 00 00 	movabs $0x801d61,%rax
  804805:	00 00 00 
  804808:	ff d0                	callq  *%rax
  80480a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804811:	00 00 00 
  804814:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804818:	48 89 10             	mov    %rdx,(%rax)
  80481b:	c9                   	leaveq 
  80481c:	c3                   	retq   

000000000080481d <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80481d:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804820:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804827:	00 00 00 
call *%rax
  80482a:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80482c:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804833:	00 08 
    movq 152(%rsp), %rax
  804835:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  80483c:	00 
    movq 136(%rsp), %rbx
  80483d:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804844:	00 
movq %rbx, (%rax)
  804845:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804848:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  80484c:	4c 8b 3c 24          	mov    (%rsp),%r15
  804850:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804855:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  80485a:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  80485f:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804864:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804869:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80486e:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804873:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804878:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  80487d:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804882:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804887:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  80488c:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804891:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804896:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80489a:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80489e:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80489f:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8048a4:	c3                   	retq   

00000000008048a5 <ipc_recv>:
  8048a5:	55                   	push   %rbp
  8048a6:	48 89 e5             	mov    %rsp,%rbp
  8048a9:	48 83 ec 30          	sub    $0x30,%rsp
  8048ad:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048b1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8048b5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8048b9:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8048be:	75 0e                	jne    8048ce <ipc_recv+0x29>
  8048c0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8048c7:	00 00 00 
  8048ca:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8048ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8048d2:	48 89 c7             	mov    %rax,%rdi
  8048d5:	48 b8 00 1e 80 00 00 	movabs $0x801e00,%rax
  8048dc:	00 00 00 
  8048df:	ff d0                	callq  *%rax
  8048e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048e8:	79 27                	jns    804911 <ipc_recv+0x6c>
  8048ea:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8048ef:	74 0a                	je     8048fb <ipc_recv+0x56>
  8048f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048f5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8048fb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804900:	74 0a                	je     80490c <ipc_recv+0x67>
  804902:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804906:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80490c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80490f:	eb 53                	jmp    804964 <ipc_recv+0xbf>
  804911:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804916:	74 19                	je     804931 <ipc_recv+0x8c>
  804918:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80491f:	00 00 00 
  804922:	48 8b 00             	mov    (%rax),%rax
  804925:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80492b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80492f:	89 10                	mov    %edx,(%rax)
  804931:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804936:	74 19                	je     804951 <ipc_recv+0xac>
  804938:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80493f:	00 00 00 
  804942:	48 8b 00             	mov    (%rax),%rax
  804945:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80494b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80494f:	89 10                	mov    %edx,(%rax)
  804951:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804958:	00 00 00 
  80495b:	48 8b 00             	mov    (%rax),%rax
  80495e:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804964:	c9                   	leaveq 
  804965:	c3                   	retq   

0000000000804966 <ipc_send>:
  804966:	55                   	push   %rbp
  804967:	48 89 e5             	mov    %rsp,%rbp
  80496a:	48 83 ec 30          	sub    $0x30,%rsp
  80496e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804971:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804974:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804978:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80497b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804980:	75 10                	jne    804992 <ipc_send+0x2c>
  804982:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804989:	00 00 00 
  80498c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804990:	eb 0e                	jmp    8049a0 <ipc_send+0x3a>
  804992:	eb 0c                	jmp    8049a0 <ipc_send+0x3a>
  804994:	48 b8 99 1b 80 00 00 	movabs $0x801b99,%rax
  80499b:	00 00 00 
  80499e:	ff d0                	callq  *%rax
  8049a0:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8049a3:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8049a6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8049aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8049ad:	89 c7                	mov    %eax,%edi
  8049af:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  8049b6:	00 00 00 
  8049b9:	ff d0                	callq  *%rax
  8049bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049be:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8049c2:	74 d0                	je     804994 <ipc_send+0x2e>
  8049c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049c8:	79 30                	jns    8049fa <ipc_send+0x94>
  8049ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049cd:	89 c1                	mov    %eax,%ecx
  8049cf:	48 ba b8 53 80 00 00 	movabs $0x8053b8,%rdx
  8049d6:	00 00 00 
  8049d9:	be 44 00 00 00       	mov    $0x44,%esi
  8049de:	48 bf ce 53 80 00 00 	movabs $0x8053ce,%rdi
  8049e5:	00 00 00 
  8049e8:	b8 00 00 00 00       	mov    $0x0,%eax
  8049ed:	49 b8 ba 04 80 00 00 	movabs $0x8004ba,%r8
  8049f4:	00 00 00 
  8049f7:	41 ff d0             	callq  *%r8
  8049fa:	c9                   	leaveq 
  8049fb:	c3                   	retq   

00000000008049fc <ipc_find_env>:
  8049fc:	55                   	push   %rbp
  8049fd:	48 89 e5             	mov    %rsp,%rbp
  804a00:	48 83 ec 14          	sub    $0x14,%rsp
  804a04:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804a07:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804a0e:	eb 4e                	jmp    804a5e <ipc_find_env+0x62>
  804a10:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804a17:	00 00 00 
  804a1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a1d:	48 98                	cltq   
  804a1f:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804a26:	48 01 d0             	add    %rdx,%rax
  804a29:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804a2f:	8b 00                	mov    (%rax),%eax
  804a31:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804a34:	75 24                	jne    804a5a <ipc_find_env+0x5e>
  804a36:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804a3d:	00 00 00 
  804a40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a43:	48 98                	cltq   
  804a45:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804a4c:	48 01 d0             	add    %rdx,%rax
  804a4f:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804a55:	8b 40 08             	mov    0x8(%rax),%eax
  804a58:	eb 12                	jmp    804a6c <ipc_find_env+0x70>
  804a5a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804a5e:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804a65:	7e a9                	jle    804a10 <ipc_find_env+0x14>
  804a67:	b8 00 00 00 00       	mov    $0x0,%eax
  804a6c:	c9                   	leaveq 
  804a6d:	c3                   	retq   

0000000000804a6e <pageref>:
  804a6e:	55                   	push   %rbp
  804a6f:	48 89 e5             	mov    %rsp,%rbp
  804a72:	48 83 ec 18          	sub    $0x18,%rsp
  804a76:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a7e:	48 c1 e8 15          	shr    $0x15,%rax
  804a82:	48 89 c2             	mov    %rax,%rdx
  804a85:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804a8c:	01 00 00 
  804a8f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804a93:	83 e0 01             	and    $0x1,%eax
  804a96:	48 85 c0             	test   %rax,%rax
  804a99:	75 07                	jne    804aa2 <pageref+0x34>
  804a9b:	b8 00 00 00 00       	mov    $0x0,%eax
  804aa0:	eb 53                	jmp    804af5 <pageref+0x87>
  804aa2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804aa6:	48 c1 e8 0c          	shr    $0xc,%rax
  804aaa:	48 89 c2             	mov    %rax,%rdx
  804aad:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804ab4:	01 00 00 
  804ab7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804abb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804abf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ac3:	83 e0 01             	and    $0x1,%eax
  804ac6:	48 85 c0             	test   %rax,%rax
  804ac9:	75 07                	jne    804ad2 <pageref+0x64>
  804acb:	b8 00 00 00 00       	mov    $0x0,%eax
  804ad0:	eb 23                	jmp    804af5 <pageref+0x87>
  804ad2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ad6:	48 c1 e8 0c          	shr    $0xc,%rax
  804ada:	48 89 c2             	mov    %rax,%rdx
  804add:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804ae4:	00 00 00 
  804ae7:	48 c1 e2 04          	shl    $0x4,%rdx
  804aeb:	48 01 d0             	add    %rdx,%rax
  804aee:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804af2:	0f b7 c0             	movzwl %ax,%eax
  804af5:	c9                   	leaveq 
  804af6:	c3                   	retq   
