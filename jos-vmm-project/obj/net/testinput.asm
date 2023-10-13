
obj/net/testinput:     file format elf64-x86-64


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
  80003c:	e8 0a 0a 00 00       	callq  800a4b <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <announce>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 30          	sub    $0x30,%rsp
  80004b:	c6 45 e0 52          	movb   $0x52,-0x20(%rbp)
  80004f:	c6 45 e1 54          	movb   $0x54,-0x1f(%rbp)
  800053:	c6 45 e2 00          	movb   $0x0,-0x1e(%rbp)
  800057:	c6 45 e3 12          	movb   $0x12,-0x1d(%rbp)
  80005b:	c6 45 e4 34          	movb   $0x34,-0x1c(%rbp)
  80005f:	c6 45 e5 56          	movb   $0x56,-0x1b(%rbp)
  800063:	48 bf e0 55 80 00 00 	movabs $0x8055e0,%rdi
  80006a:	00 00 00 
  80006d:	48 b8 2e 51 80 00 00 	movabs $0x80512e,%rax
  800074:	00 00 00 
  800077:	ff d0                	callq  *%rax
  800079:	89 45 dc             	mov    %eax,-0x24(%rbp)
  80007c:	48 bf ea 55 80 00 00 	movabs $0x8055ea,%rdi
  800083:	00 00 00 
  800086:	48 b8 2e 51 80 00 00 	movabs $0x80512e,%rax
  80008d:	00 00 00 
  800090:	ff d0                	callq  *%rax
  800092:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800095:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80009c:	00 00 00 
  80009f:	48 8b 00             	mov    (%rax),%rax
  8000a2:	ba 07 00 00 00       	mov    $0x7,%edx
  8000a7:	48 89 c6             	mov    %rax,%rsi
  8000aa:	bf 00 00 00 00       	mov    $0x0,%edi
  8000af:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8000b6:	00 00 00 
  8000b9:	ff d0                	callq  *%rax
  8000bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000c2:	79 30                	jns    8000f4 <announce+0xb1>
  8000c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000c7:	89 c1                	mov    %eax,%ecx
  8000c9:	48 ba f3 55 80 00 00 	movabs $0x8055f3,%rdx
  8000d0:	00 00 00 
  8000d3:	be 1a 00 00 00       	mov    $0x1a,%esi
  8000d8:	48 bf 04 56 80 00 00 	movabs $0x805604,%rdi
  8000df:	00 00 00 
  8000e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8000e7:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8000ee:	00 00 00 
  8000f1:	41 ff d0             	callq  *%r8
  8000f4:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8000fb:	00 00 00 
  8000fe:	48 8b 00             	mov    (%rax),%rax
  800101:	48 83 c0 04          	add    $0x4,%rax
  800105:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800109:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800110:	00 00 00 
  800113:	48 8b 00             	mov    (%rax),%rax
  800116:	c7 00 2a 00 00 00    	movl   $0x2a,(%rax)
  80011c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800120:	ba 06 00 00 00       	mov    $0x6,%edx
  800125:	be ff 00 00 00       	mov    $0xff,%esi
  80012a:	48 89 c7             	mov    %rax,%rdi
  80012d:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  800134:	00 00 00 
  800137:	ff d0                	callq  *%rax
  800139:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80013d:	48 8d 48 06          	lea    0x6(%rax),%rcx
  800141:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800145:	ba 06 00 00 00       	mov    $0x6,%edx
  80014a:	48 89 c6             	mov    %rax,%rsi
  80014d:	48 89 cf             	mov    %rcx,%rdi
  800150:	48 b8 1a 1d 80 00 00 	movabs $0x801d1a,%rax
  800157:	00 00 00 
  80015a:	ff d0                	callq  *%rax
  80015c:	bf 06 08 00 00       	mov    $0x806,%edi
  800161:	48 b8 3d 55 80 00 00 	movabs $0x80553d,%rax
  800168:	00 00 00 
  80016b:	ff d0                	callq  *%rax
  80016d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800171:	66 89 42 0c          	mov    %ax,0xc(%rdx)
  800175:	bf 01 00 00 00       	mov    $0x1,%edi
  80017a:	48 b8 3d 55 80 00 00 	movabs $0x80553d,%rax
  800181:	00 00 00 
  800184:	ff d0                	callq  *%rax
  800186:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80018a:	66 89 42 0e          	mov    %ax,0xe(%rdx)
  80018e:	bf 00 08 00 00       	mov    $0x800,%edi
  800193:	48 b8 3d 55 80 00 00 	movabs $0x80553d,%rax
  80019a:	00 00 00 
  80019d:	ff d0                	callq  *%rax
  80019f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001a3:	66 89 42 10          	mov    %ax,0x10(%rdx)
  8001a7:	bf 04 06 00 00       	mov    $0x604,%edi
  8001ac:	48 b8 3d 55 80 00 00 	movabs $0x80553d,%rax
  8001b3:	00 00 00 
  8001b6:	ff d0                	callq  *%rax
  8001b8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001bc:	66 89 42 12          	mov    %ax,0x12(%rdx)
  8001c0:	bf 01 00 00 00       	mov    $0x1,%edi
  8001c5:	48 b8 3d 55 80 00 00 	movabs $0x80553d,%rax
  8001cc:	00 00 00 
  8001cf:	ff d0                	callq  *%rax
  8001d1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001d5:	66 89 42 14          	mov    %ax,0x14(%rdx)
  8001d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001dd:	48 8d 48 16          	lea    0x16(%rax),%rcx
  8001e1:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8001e5:	ba 06 00 00 00       	mov    $0x6,%edx
  8001ea:	48 89 c6             	mov    %rax,%rsi
  8001ed:	48 89 cf             	mov    %rcx,%rdi
  8001f0:	48 b8 1a 1d 80 00 00 	movabs $0x801d1a,%rax
  8001f7:	00 00 00 
  8001fa:	ff d0                	callq  *%rax
  8001fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800200:	48 8d 48 1c          	lea    0x1c(%rax),%rcx
  800204:	48 8d 45 dc          	lea    -0x24(%rbp),%rax
  800208:	ba 04 00 00 00       	mov    $0x4,%edx
  80020d:	48 89 c6             	mov    %rax,%rsi
  800210:	48 89 cf             	mov    %rcx,%rdi
  800213:	48 b8 1a 1d 80 00 00 	movabs $0x801d1a,%rax
  80021a:	00 00 00 
  80021d:	ff d0                	callq  *%rax
  80021f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800223:	48 83 c0 20          	add    $0x20,%rax
  800227:	ba 06 00 00 00       	mov    $0x6,%edx
  80022c:	be 00 00 00 00       	mov    $0x0,%esi
  800231:	48 89 c7             	mov    %rax,%rdi
  800234:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  80023b:	00 00 00 
  80023e:	ff d0                	callq  *%rax
  800240:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800244:	48 8d 48 26          	lea    0x26(%rax),%rcx
  800248:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80024c:	ba 04 00 00 00       	mov    $0x4,%edx
  800251:	48 89 c6             	mov    %rax,%rsi
  800254:	48 89 cf             	mov    %rcx,%rdi
  800257:	48 b8 1a 1d 80 00 00 	movabs $0x801d1a,%rax
  80025e:	00 00 00 
  800261:	ff d0                	callq  *%rax
  800263:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80026a:	00 00 00 
  80026d:	48 8b 10             	mov    (%rax),%rdx
  800270:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  800277:	00 00 00 
  80027a:	8b 00                	mov    (%rax),%eax
  80027c:	b9 07 00 00 00       	mov    $0x7,%ecx
  800281:	be 0b 00 00 00       	mov    $0xb,%esi
  800286:	89 c7                	mov    %eax,%edi
  800288:	48 b8 c2 2d 80 00 00 	movabs $0x802dc2,%rax
  80028f:	00 00 00 
  800292:	ff d0                	callq  *%rax
  800294:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80029b:	00 00 00 
  80029e:	48 8b 00             	mov    (%rax),%rax
  8002a1:	48 89 c6             	mov    %rax,%rsi
  8002a4:	bf 00 00 00 00       	mov    $0x0,%edi
  8002a9:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8002b0:	00 00 00 
  8002b3:	ff d0                	callq  *%rax
  8002b5:	c9                   	leaveq 
  8002b6:	c3                   	retq   

00000000008002b7 <hexdump>:
  8002b7:	55                   	push   %rbp
  8002b8:	48 89 e5             	mov    %rsp,%rbp
  8002bb:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
  8002c2:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
  8002c6:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
  8002ca:	89 95 7c ff ff ff    	mov    %edx,-0x84(%rbp)
  8002d0:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8002d4:	48 83 c0 50          	add    $0x50,%rax
  8002d8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8002dc:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8002e3:	00 
  8002e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8002eb:	e9 41 01 00 00       	jmpq   800431 <hexdump+0x17a>
  8002f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002f3:	83 e0 0f             	and    $0xf,%eax
  8002f6:	85 c0                	test   %eax,%eax
  8002f8:	75 4d                	jne    800347 <hexdump+0x90>
  8002fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8002fe:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  800302:	48 29 c2             	sub    %rax,%rdx
  800305:	48 89 d0             	mov    %rdx,%rax
  800308:	89 c6                	mov    %eax,%esi
  80030a:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  80030d:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
  800311:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  800315:	41 89 c8             	mov    %ecx,%r8d
  800318:	48 89 d1             	mov    %rdx,%rcx
  80031b:	48 ba 17 56 80 00 00 	movabs $0x805617,%rdx
  800322:	00 00 00 
  800325:	48 89 c7             	mov    %rax,%rdi
  800328:	b8 00 00 00 00       	mov    $0x0,%eax
  80032d:	49 b9 92 17 80 00 00 	movabs $0x801792,%r9
  800334:	00 00 00 
  800337:	41 ff d1             	callq  *%r9
  80033a:	48 98                	cltq   
  80033c:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  800340:	48 01 d0             	add    %rdx,%rax
  800343:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800347:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80034a:	48 63 d0             	movslq %eax,%rdx
  80034d:	48 8b 45 80          	mov    -0x80(%rbp),%rax
  800351:	48 01 d0             	add    %rdx,%rax
  800354:	0f b6 00             	movzbl (%rax),%eax
  800357:	0f b6 d0             	movzbl %al,%edx
  80035a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80035e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800362:	48 29 c1             	sub    %rax,%rcx
  800365:	48 89 c8             	mov    %rcx,%rax
  800368:	89 c6                	mov    %eax,%esi
  80036a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80036e:	89 d1                	mov    %edx,%ecx
  800370:	48 ba 21 56 80 00 00 	movabs $0x805621,%rdx
  800377:	00 00 00 
  80037a:	48 89 c7             	mov    %rax,%rdi
  80037d:	b8 00 00 00 00       	mov    $0x0,%eax
  800382:	49 b8 92 17 80 00 00 	movabs $0x801792,%r8
  800389:	00 00 00 
  80038c:	41 ff d0             	callq  *%r8
  80038f:	48 98                	cltq   
  800391:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  800395:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800398:	99                   	cltd   
  800399:	c1 ea 1c             	shr    $0x1c,%edx
  80039c:	01 d0                	add    %edx,%eax
  80039e:	83 e0 0f             	and    $0xf,%eax
  8003a1:	29 d0                	sub    %edx,%eax
  8003a3:	83 f8 0f             	cmp    $0xf,%eax
  8003a6:	74 0e                	je     8003b6 <hexdump+0xff>
  8003a8:	8b 85 7c ff ff ff    	mov    -0x84(%rbp),%eax
  8003ae:	83 e8 01             	sub    $0x1,%eax
  8003b1:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8003b4:	75 33                	jne    8003e9 <hexdump+0x132>
  8003b6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003ba:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8003be:	48 89 d1             	mov    %rdx,%rcx
  8003c1:	48 29 c1             	sub    %rax,%rcx
  8003c4:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8003c8:	48 89 c2             	mov    %rax,%rdx
  8003cb:	48 89 ce             	mov    %rcx,%rsi
  8003ce:	48 bf 26 56 80 00 00 	movabs $0x805626,%rdi
  8003d5:	00 00 00 
  8003d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8003dd:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  8003e4:	00 00 00 
  8003e7:	ff d1                	callq  *%rcx
  8003e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003ec:	99                   	cltd   
  8003ed:	c1 ea 1f             	shr    $0x1f,%edx
  8003f0:	01 d0                	add    %edx,%eax
  8003f2:	83 e0 01             	and    $0x1,%eax
  8003f5:	29 d0                	sub    %edx,%eax
  8003f7:	83 f8 01             	cmp    $0x1,%eax
  8003fa:	75 0f                	jne    80040b <hexdump+0x154>
  8003fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800400:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800404:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  800408:	c6 00 20             	movb   $0x20,(%rax)
  80040b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80040e:	99                   	cltd   
  80040f:	c1 ea 1c             	shr    $0x1c,%edx
  800412:	01 d0                	add    %edx,%eax
  800414:	83 e0 0f             	and    $0xf,%eax
  800417:	29 d0                	sub    %edx,%eax
  800419:	83 f8 07             	cmp    $0x7,%eax
  80041c:	75 0f                	jne    80042d <hexdump+0x176>
  80041e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800422:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800426:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  80042a:	c6 00 20             	movb   $0x20,(%rax)
  80042d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800431:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800434:	3b 85 7c ff ff ff    	cmp    -0x84(%rbp),%eax
  80043a:	0f 8c b0 fe ff ff    	jl     8002f0 <hexdump+0x39>
  800440:	c9                   	leaveq 
  800441:	c3                   	retq   

0000000000800442 <umain>:
  800442:	55                   	push   %rbp
  800443:	48 89 e5             	mov    %rsp,%rbp
  800446:	53                   	push   %rbx
  800447:	48 83 ec 38          	sub    $0x38,%rsp
  80044b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80044e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800452:	48 b8 92 21 80 00 00 	movabs $0x802192,%rax
  800459:	00 00 00 
  80045c:	ff d0                	callq  *%rax
  80045e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800461:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
  800468:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80046f:	00 00 00 
  800472:	48 bb 2c 56 80 00 00 	movabs $0x80562c,%rbx
  800479:	00 00 00 
  80047c:	48 89 18             	mov    %rbx,(%rax)
  80047f:	48 b8 8c 2a 80 00 00 	movabs $0x802a8c,%rax
  800486:	00 00 00 
  800489:	ff d0                	callq  *%rax
  80048b:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  800492:	00 00 00 
  800495:	89 02                	mov    %eax,(%rdx)
  800497:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80049e:	00 00 00 
  8004a1:	8b 00                	mov    (%rax),%eax
  8004a3:	85 c0                	test   %eax,%eax
  8004a5:	79 2a                	jns    8004d1 <umain+0x8f>
  8004a7:	48 ba 36 56 80 00 00 	movabs $0x805636,%rdx
  8004ae:	00 00 00 
  8004b1:	be 4e 00 00 00       	mov    $0x4e,%esi
  8004b6:	48 bf 04 56 80 00 00 	movabs $0x805604,%rdi
  8004bd:	00 00 00 
  8004c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8004c5:	48 b9 f1 0a 80 00 00 	movabs $0x800af1,%rcx
  8004cc:	00 00 00 
  8004cf:	ff d1                	callq  *%rcx
  8004d1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8004d8:	00 00 00 
  8004db:	8b 00                	mov    (%rax),%eax
  8004dd:	85 c0                	test   %eax,%eax
  8004df:	75 16                	jne    8004f7 <umain+0xb5>
  8004e1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8004e4:	89 c7                	mov    %eax,%edi
  8004e6:	48 b8 34 09 80 00 00 	movabs $0x800934,%rax
  8004ed:	00 00 00 
  8004f0:	ff d0                	callq  *%rax
  8004f2:	e9 fb 01 00 00       	jmpq   8006f2 <umain+0x2b0>
  8004f7:	48 b8 8c 2a 80 00 00 	movabs $0x802a8c,%rax
  8004fe:	00 00 00 
  800501:	ff d0                	callq  *%rax
  800503:	48 ba 04 90 80 00 00 	movabs $0x809004,%rdx
  80050a:	00 00 00 
  80050d:	89 02                	mov    %eax,(%rdx)
  80050f:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  800516:	00 00 00 
  800519:	8b 00                	mov    (%rax),%eax
  80051b:	85 c0                	test   %eax,%eax
  80051d:	79 2a                	jns    800549 <umain+0x107>
  80051f:	48 ba 36 56 80 00 00 	movabs $0x805636,%rdx
  800526:	00 00 00 
  800529:	be 56 00 00 00       	mov    $0x56,%esi
  80052e:	48 bf 04 56 80 00 00 	movabs $0x805604,%rdi
  800535:	00 00 00 
  800538:	b8 00 00 00 00       	mov    $0x0,%eax
  80053d:	48 b9 f1 0a 80 00 00 	movabs $0x800af1,%rcx
  800544:	00 00 00 
  800547:	ff d1                	callq  *%rcx
  800549:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  800550:	00 00 00 
  800553:	8b 00                	mov    (%rax),%eax
  800555:	85 c0                	test   %eax,%eax
  800557:	75 16                	jne    80056f <umain+0x12d>
  800559:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80055c:	89 c7                	mov    %eax,%edi
  80055e:	48 b8 1a 08 80 00 00 	movabs $0x80081a,%rax
  800565:	00 00 00 
  800568:	ff d0                	callq  *%rax
  80056a:	e9 83 01 00 00       	jmpq   8006f2 <umain+0x2b0>
  80056f:	48 bf 44 56 80 00 00 	movabs $0x805644,%rdi
  800576:	00 00 00 
  800579:	b8 00 00 00 00       	mov    $0x0,%eax
  80057e:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  800585:	00 00 00 
  800588:	ff d2                	callq  *%rdx
  80058a:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800591:	00 00 00 
  800594:	ff d0                	callq  *%rax
  800596:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80059d:	00 00 00 
  8005a0:	48 8b 08             	mov    (%rax),%rcx
  8005a3:	48 8d 55 dc          	lea    -0x24(%rbp),%rdx
  8005a7:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8005ab:	48 89 ce             	mov    %rcx,%rsi
  8005ae:	48 89 c7             	mov    %rax,%rdi
  8005b1:	48 b8 01 2d 80 00 00 	movabs $0x802d01,%rax
  8005b8:	00 00 00 
  8005bb:	ff d0                	callq  *%rax
  8005bd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8005c0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8005c4:	79 30                	jns    8005f6 <umain+0x1b4>
  8005c6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8005c9:	89 c1                	mov    %eax,%ecx
  8005cb:	48 ba 61 56 80 00 00 	movabs $0x805661,%rdx
  8005d2:	00 00 00 
  8005d5:	be 65 00 00 00       	mov    $0x65,%esi
  8005da:	48 bf 04 56 80 00 00 	movabs $0x805604,%rdi
  8005e1:	00 00 00 
  8005e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8005e9:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8005f0:	00 00 00 
  8005f3:	41 ff d0             	callq  *%r8
  8005f6:	8b 55 e0             	mov    -0x20(%rbp),%edx
  8005f9:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  800600:	00 00 00 
  800603:	8b 00                	mov    (%rax),%eax
  800605:	39 c2                	cmp    %eax,%edx
  800607:	74 30                	je     800639 <umain+0x1f7>
  800609:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80060c:	89 c1                	mov    %eax,%ecx
  80060e:	48 ba 70 56 80 00 00 	movabs $0x805670,%rdx
  800615:	00 00 00 
  800618:	be 67 00 00 00       	mov    $0x67,%esi
  80061d:	48 bf 04 56 80 00 00 	movabs $0x805604,%rdi
  800624:	00 00 00 
  800627:	b8 00 00 00 00       	mov    $0x0,%eax
  80062c:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  800633:	00 00 00 
  800636:	41 ff d0             	callq  *%r8
  800639:	83 7d e4 0a          	cmpl   $0xa,-0x1c(%rbp)
  80063d:	74 30                	je     80066f <umain+0x22d>
  80063f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800642:	89 c1                	mov    %eax,%ecx
  800644:	48 ba 95 56 80 00 00 	movabs $0x805695,%rdx
  80064b:	00 00 00 
  80064e:	be 69 00 00 00       	mov    $0x69,%esi
  800653:	48 bf 04 56 80 00 00 	movabs $0x805604,%rdi
  80065a:	00 00 00 
  80065d:	b8 00 00 00 00       	mov    $0x0,%eax
  800662:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  800669:	00 00 00 
  80066c:	41 ff d0             	callq  *%r8
  80066f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800676:	00 00 00 
  800679:	48 8b 00             	mov    (%rax),%rax
  80067c:	8b 00                	mov    (%rax),%eax
  80067e:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  800685:	00 00 00 
  800688:	48 8b 12             	mov    (%rdx),%rdx
  80068b:	48 8d 4a 04          	lea    0x4(%rdx),%rcx
  80068f:	89 c2                	mov    %eax,%edx
  800691:	48 89 ce             	mov    %rcx,%rsi
  800694:	48 bf a7 56 80 00 00 	movabs $0x8056a7,%rdi
  80069b:	00 00 00 
  80069e:	48 b8 b7 02 80 00 00 	movabs $0x8002b7,%rax
  8006a5:	00 00 00 
  8006a8:	ff d0                	callq  *%rax
  8006aa:	48 bf af 56 80 00 00 	movabs $0x8056af,%rdi
  8006b1:	00 00 00 
  8006b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8006b9:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  8006c0:	00 00 00 
  8006c3:	ff d2                	callq  *%rdx
  8006c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8006c9:	74 1b                	je     8006e6 <umain+0x2a4>
  8006cb:	48 bf b1 56 80 00 00 	movabs $0x8056b1,%rdi
  8006d2:	00 00 00 
  8006d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8006da:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  8006e1:	00 00 00 
  8006e4:	ff d2                	callq  *%rdx
  8006e6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  8006ed:	e9 a4 fe ff ff       	jmpq   800596 <umain+0x154>
  8006f2:	48 83 c4 38          	add    $0x38,%rsp
  8006f6:	5b                   	pop    %rbx
  8006f7:	5d                   	pop    %rbp
  8006f8:	c3                   	retq   

00000000008006f9 <timer>:
  8006f9:	55                   	push   %rbp
  8006fa:	48 89 e5             	mov    %rsp,%rbp
  8006fd:	53                   	push   %rbx
  8006fe:	48 83 ec 28          	sub    $0x28,%rsp
  800702:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800705:	89 75 d8             	mov    %esi,-0x28(%rbp)
  800708:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  80070f:	00 00 00 
  800712:	ff d0                	callq  *%rax
  800714:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800717:	01 d0                	add    %edx,%eax
  800719:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80071c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800723:	00 00 00 
  800726:	48 bb d0 56 80 00 00 	movabs $0x8056d0,%rbx
  80072d:	00 00 00 
  800730:	48 89 18             	mov    %rbx,(%rax)
  800733:	eb 0c                	jmp    800741 <timer+0x48>
  800735:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  80073c:	00 00 00 
  80073f:	ff d0                	callq  *%rax
  800741:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  800748:	00 00 00 
  80074b:	ff d0                	callq  *%rax
  80074d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800750:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800753:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  800756:	73 06                	jae    80075e <timer+0x65>
  800758:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80075c:	79 d7                	jns    800735 <timer+0x3c>
  80075e:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800762:	79 30                	jns    800794 <timer+0x9b>
  800764:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800767:	89 c1                	mov    %eax,%ecx
  800769:	48 ba d9 56 80 00 00 	movabs $0x8056d9,%rdx
  800770:	00 00 00 
  800773:	be 10 00 00 00       	mov    $0x10,%esi
  800778:	48 bf eb 56 80 00 00 	movabs $0x8056eb,%rdi
  80077f:	00 00 00 
  800782:	b8 00 00 00 00       	mov    $0x0,%eax
  800787:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  80078e:	00 00 00 
  800791:	41 ff d0             	callq  *%r8
  800794:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800797:	b9 00 00 00 00       	mov    $0x0,%ecx
  80079c:	ba 00 00 00 00       	mov    $0x0,%edx
  8007a1:	be 0c 00 00 00       	mov    $0xc,%esi
  8007a6:	89 c7                	mov    %eax,%edi
  8007a8:	48 b8 c2 2d 80 00 00 	movabs $0x802dc2,%rax
  8007af:	00 00 00 
  8007b2:	ff d0                	callq  *%rax
  8007b4:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8007b8:	ba 00 00 00 00       	mov    $0x0,%edx
  8007bd:	be 00 00 00 00       	mov    $0x0,%esi
  8007c2:	48 89 c7             	mov    %rax,%rdi
  8007c5:	48 b8 01 2d 80 00 00 	movabs $0x802d01,%rax
  8007cc:	00 00 00 
  8007cf:	ff d0                	callq  *%rax
  8007d1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8007d4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8007d7:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8007da:	39 c2                	cmp    %eax,%edx
  8007dc:	74 22                	je     800800 <timer+0x107>
  8007de:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8007e1:	89 c6                	mov    %eax,%esi
  8007e3:	48 bf 00 57 80 00 00 	movabs $0x805700,%rdi
  8007ea:	00 00 00 
  8007ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8007f2:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  8007f9:	00 00 00 
  8007fc:	ff d2                	callq  *%rdx
  8007fe:	eb b4                	jmp    8007b4 <timer+0xbb>
  800800:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  800807:	00 00 00 
  80080a:	ff d0                	callq  *%rax
  80080c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80080f:	01 d0                	add    %edx,%eax
  800811:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800814:	90                   	nop
  800815:	e9 27 ff ff ff       	jmpq   800741 <timer+0x48>

000000000080081a <input>:
  80081a:	55                   	push   %rbp
  80081b:	48 89 e5             	mov    %rsp,%rbp
  80081e:	53                   	push   %rbx
  80081f:	48 83 ec 28          	sub    $0x28,%rsp
  800823:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800826:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80082d:	00 00 00 
  800830:	48 bb 3b 57 80 00 00 	movabs $0x80573b,%rbx
  800837:	00 00 00 
  80083a:	48 89 18             	mov    %rbx,(%rax)
  80083d:	ba 07 00 00 00       	mov    $0x7,%edx
  800842:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  800849:	00 00 00 
  80084c:	bf 00 00 00 00       	mov    $0x0,%edi
  800851:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  800858:	00 00 00 
  80085b:	ff d0                	callq  *%rax
  80085d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800860:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800864:	79 30                	jns    800896 <input+0x7c>
  800866:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800869:	89 c1                	mov    %eax,%ecx
  80086b:	48 ba 44 57 80 00 00 	movabs $0x805744,%rdx
  800872:	00 00 00 
  800875:	be 0e 00 00 00       	mov    $0xe,%esi
  80087a:	48 bf 57 57 80 00 00 	movabs $0x805757,%rdi
  800881:	00 00 00 
  800884:	b8 00 00 00 00       	mov    $0x0,%eax
  800889:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  800890:	00 00 00 
  800893:	41 ff d0             	callq  *%r8
  800896:	be ee 05 00 00       	mov    $0x5ee,%esi
  80089b:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8008a2:	00 00 00 
  8008a5:	48 b8 01 25 80 00 00 	movabs $0x802501,%rax
  8008ac:	00 00 00 
  8008af:	ff d0                	callq  *%rax
  8008b1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8008b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8008b8:	75 0e                	jne    8008c8 <input+0xae>
  8008ba:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  8008c1:	00 00 00 
  8008c4:	ff d0                	callq  *%rax
  8008c6:	eb 67                	jmp    80092f <input+0x115>
  8008c8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8008cc:	79 22                	jns    8008f0 <input+0xd6>
  8008ce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8008d1:	89 c6                	mov    %eax,%esi
  8008d3:	48 bf 66 57 80 00 00 	movabs $0x805766,%rdi
  8008da:	00 00 00 
  8008dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8008e2:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  8008e9:	00 00 00 
  8008ec:	ff d2                	callq  *%rdx
  8008ee:	eb 3f                	jmp    80092f <input+0x115>
  8008f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8008f4:	7e 39                	jle    80092f <input+0x115>
  8008f6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8008fd:	00 00 00 
  800900:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800903:	89 10                	mov    %edx,(%rax)
  800905:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800908:	b9 05 00 00 00       	mov    $0x5,%ecx
  80090d:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  800914:	00 00 00 
  800917:	be 0a 00 00 00       	mov    $0xa,%esi
  80091c:	89 c7                	mov    %eax,%edi
  80091e:	48 b8 c2 2d 80 00 00 	movabs $0x802dc2,%rax
  800925:	00 00 00 
  800928:	ff d0                	callq  *%rax
  80092a:	e9 0e ff ff ff       	jmpq   80083d <input+0x23>
  80092f:	e9 09 ff ff ff       	jmpq   80083d <input+0x23>

0000000000800934 <output>:
  800934:	55                   	push   %rbp
  800935:	48 89 e5             	mov    %rsp,%rbp
  800938:	53                   	push   %rbx
  800939:	48 83 ec 28          	sub    $0x28,%rsp
  80093d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800940:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800947:	00 00 00 
  80094a:	48 bb 88 57 80 00 00 	movabs $0x805788,%rbx
  800951:	00 00 00 
  800954:	48 89 18             	mov    %rbx,(%rax)
  800957:	48 8d 45 e4          	lea    -0x1c(%rbp),%rax
  80095b:	ba 00 00 00 00       	mov    $0x0,%edx
  800960:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  800967:	00 00 00 
  80096a:	48 89 c7             	mov    %rax,%rdi
  80096d:	48 b8 01 2d 80 00 00 	movabs $0x802d01,%rax
  800974:	00 00 00 
  800977:	ff d0                	callq  *%rax
  800979:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80097c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80097f:	3b 45 dc             	cmp    -0x24(%rbp),%eax
  800982:	74 35                	je     8009b9 <output+0x85>
  800984:	48 b9 92 57 80 00 00 	movabs $0x805792,%rcx
  80098b:	00 00 00 
  80098e:	48 ba a3 57 80 00 00 	movabs $0x8057a3,%rdx
  800995:	00 00 00 
  800998:	be 11 00 00 00       	mov    $0x11,%esi
  80099d:	48 bf b8 57 80 00 00 	movabs $0x8057b8,%rdi
  8009a4:	00 00 00 
  8009a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8009ac:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8009b3:	00 00 00 
  8009b6:	41 ff d0             	callq  *%r8
  8009b9:	83 7d ec 0b          	cmpl   $0xb,-0x14(%rbp)
  8009bd:	74 35                	je     8009f4 <output+0xc0>
  8009bf:	48 b9 c8 57 80 00 00 	movabs $0x8057c8,%rcx
  8009c6:	00 00 00 
  8009c9:	48 ba a3 57 80 00 00 	movabs $0x8057a3,%rdx
  8009d0:	00 00 00 
  8009d3:	be 12 00 00 00       	mov    $0x12,%esi
  8009d8:	48 bf b8 57 80 00 00 	movabs $0x8057b8,%rdi
  8009df:	00 00 00 
  8009e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8009e7:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8009ee:	00 00 00 
  8009f1:	41 ff d0             	callq  *%r8
  8009f4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8009fb:	00 00 00 
  8009fe:	8b 00                	mov    (%rax),%eax
  800a00:	89 c6                	mov    %eax,%esi
  800a02:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  800a09:	00 00 00 
  800a0c:	48 b8 b9 24 80 00 00 	movabs $0x8024b9,%rax
  800a13:	00 00 00 
  800a16:	ff d0                	callq  *%rax
  800a18:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800a1b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800a1f:	79 25                	jns    800a46 <output+0x112>
  800a21:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800a24:	89 c6                	mov    %eax,%esi
  800a26:	48 bf e0 57 80 00 00 	movabs $0x8057e0,%rdi
  800a2d:	00 00 00 
  800a30:	b8 00 00 00 00       	mov    $0x0,%eax
  800a35:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  800a3c:	00 00 00 
  800a3f:	ff d2                	callq  *%rdx
  800a41:	e9 11 ff ff ff       	jmpq   800957 <output+0x23>
  800a46:	e9 0c ff ff ff       	jmpq   800957 <output+0x23>

0000000000800a4b <libmain>:
  800a4b:	55                   	push   %rbp
  800a4c:	48 89 e5             	mov    %rsp,%rbp
  800a4f:	48 83 ec 10          	sub    $0x10,%rsp
  800a53:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800a56:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a5a:	48 b8 92 21 80 00 00 	movabs $0x802192,%rax
  800a61:	00 00 00 
  800a64:	ff d0                	callq  *%rax
  800a66:	25 ff 03 00 00       	and    $0x3ff,%eax
  800a6b:	48 98                	cltq   
  800a6d:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800a74:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800a7b:	00 00 00 
  800a7e:	48 01 c2             	add    %rax,%rdx
  800a81:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  800a88:	00 00 00 
  800a8b:	48 89 10             	mov    %rdx,(%rax)
  800a8e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800a92:	7e 14                	jle    800aa8 <libmain+0x5d>
  800a94:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a98:	48 8b 10             	mov    (%rax),%rdx
  800a9b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800aa2:	00 00 00 
  800aa5:	48 89 10             	mov    %rdx,(%rax)
  800aa8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800aac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800aaf:	48 89 d6             	mov    %rdx,%rsi
  800ab2:	89 c7                	mov    %eax,%edi
  800ab4:	48 b8 42 04 80 00 00 	movabs $0x800442,%rax
  800abb:	00 00 00 
  800abe:	ff d0                	callq  *%rax
  800ac0:	48 b8 ce 0a 80 00 00 	movabs $0x800ace,%rax
  800ac7:	00 00 00 
  800aca:	ff d0                	callq  *%rax
  800acc:	c9                   	leaveq 
  800acd:	c3                   	retq   

0000000000800ace <exit>:
  800ace:	55                   	push   %rbp
  800acf:	48 89 e5             	mov    %rsp,%rbp
  800ad2:	48 b8 0b 32 80 00 00 	movabs $0x80320b,%rax
  800ad9:	00 00 00 
  800adc:	ff d0                	callq  *%rax
  800ade:	bf 00 00 00 00       	mov    $0x0,%edi
  800ae3:	48 b8 4e 21 80 00 00 	movabs $0x80214e,%rax
  800aea:	00 00 00 
  800aed:	ff d0                	callq  *%rax
  800aef:	5d                   	pop    %rbp
  800af0:	c3                   	retq   

0000000000800af1 <_panic>:
  800af1:	55                   	push   %rbp
  800af2:	48 89 e5             	mov    %rsp,%rbp
  800af5:	53                   	push   %rbx
  800af6:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800afd:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800b04:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800b0a:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800b11:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800b18:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800b1f:	84 c0                	test   %al,%al
  800b21:	74 23                	je     800b46 <_panic+0x55>
  800b23:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800b2a:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800b2e:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800b32:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800b36:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800b3a:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800b3e:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800b42:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800b46:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800b4d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800b54:	00 00 00 
  800b57:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800b5e:	00 00 00 
  800b61:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800b65:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800b6c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800b73:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800b7a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800b81:	00 00 00 
  800b84:	48 8b 18             	mov    (%rax),%rbx
  800b87:	48 b8 92 21 80 00 00 	movabs $0x802192,%rax
  800b8e:	00 00 00 
  800b91:	ff d0                	callq  *%rax
  800b93:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800b99:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800ba0:	41 89 c8             	mov    %ecx,%r8d
  800ba3:	48 89 d1             	mov    %rdx,%rcx
  800ba6:	48 89 da             	mov    %rbx,%rdx
  800ba9:	89 c6                	mov    %eax,%esi
  800bab:	48 bf 10 58 80 00 00 	movabs $0x805810,%rdi
  800bb2:	00 00 00 
  800bb5:	b8 00 00 00 00       	mov    $0x0,%eax
  800bba:	49 b9 2a 0d 80 00 00 	movabs $0x800d2a,%r9
  800bc1:	00 00 00 
  800bc4:	41 ff d1             	callq  *%r9
  800bc7:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800bce:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800bd5:	48 89 d6             	mov    %rdx,%rsi
  800bd8:	48 89 c7             	mov    %rax,%rdi
  800bdb:	48 b8 7e 0c 80 00 00 	movabs $0x800c7e,%rax
  800be2:	00 00 00 
  800be5:	ff d0                	callq  *%rax
  800be7:	48 bf 33 58 80 00 00 	movabs $0x805833,%rdi
  800bee:	00 00 00 
  800bf1:	b8 00 00 00 00       	mov    $0x0,%eax
  800bf6:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  800bfd:	00 00 00 
  800c00:	ff d2                	callq  *%rdx
  800c02:	cc                   	int3   
  800c03:	eb fd                	jmp    800c02 <_panic+0x111>

0000000000800c05 <putch>:
  800c05:	55                   	push   %rbp
  800c06:	48 89 e5             	mov    %rsp,%rbp
  800c09:	48 83 ec 10          	sub    $0x10,%rsp
  800c0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c18:	8b 00                	mov    (%rax),%eax
  800c1a:	8d 48 01             	lea    0x1(%rax),%ecx
  800c1d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c21:	89 0a                	mov    %ecx,(%rdx)
  800c23:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800c26:	89 d1                	mov    %edx,%ecx
  800c28:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c2c:	48 98                	cltq   
  800c2e:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800c32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c36:	8b 00                	mov    (%rax),%eax
  800c38:	3d ff 00 00 00       	cmp    $0xff,%eax
  800c3d:	75 2c                	jne    800c6b <putch+0x66>
  800c3f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c43:	8b 00                	mov    (%rax),%eax
  800c45:	48 98                	cltq   
  800c47:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c4b:	48 83 c2 08          	add    $0x8,%rdx
  800c4f:	48 89 c6             	mov    %rax,%rsi
  800c52:	48 89 d7             	mov    %rdx,%rdi
  800c55:	48 b8 c6 20 80 00 00 	movabs $0x8020c6,%rax
  800c5c:	00 00 00 
  800c5f:	ff d0                	callq  *%rax
  800c61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c65:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800c6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c6f:	8b 40 04             	mov    0x4(%rax),%eax
  800c72:	8d 50 01             	lea    0x1(%rax),%edx
  800c75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c79:	89 50 04             	mov    %edx,0x4(%rax)
  800c7c:	c9                   	leaveq 
  800c7d:	c3                   	retq   

0000000000800c7e <vcprintf>:
  800c7e:	55                   	push   %rbp
  800c7f:	48 89 e5             	mov    %rsp,%rbp
  800c82:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800c89:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800c90:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800c97:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800c9e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800ca5:	48 8b 0a             	mov    (%rdx),%rcx
  800ca8:	48 89 08             	mov    %rcx,(%rax)
  800cab:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800caf:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800cb3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800cb7:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800cbb:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800cc2:	00 00 00 
  800cc5:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800ccc:	00 00 00 
  800ccf:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800cd6:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800cdd:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800ce4:	48 89 c6             	mov    %rax,%rsi
  800ce7:	48 bf 05 0c 80 00 00 	movabs $0x800c05,%rdi
  800cee:	00 00 00 
  800cf1:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  800cf8:	00 00 00 
  800cfb:	ff d0                	callq  *%rax
  800cfd:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800d03:	48 98                	cltq   
  800d05:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800d0c:	48 83 c2 08          	add    $0x8,%rdx
  800d10:	48 89 c6             	mov    %rax,%rsi
  800d13:	48 89 d7             	mov    %rdx,%rdi
  800d16:	48 b8 c6 20 80 00 00 	movabs $0x8020c6,%rax
  800d1d:	00 00 00 
  800d20:	ff d0                	callq  *%rax
  800d22:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800d28:	c9                   	leaveq 
  800d29:	c3                   	retq   

0000000000800d2a <cprintf>:
  800d2a:	55                   	push   %rbp
  800d2b:	48 89 e5             	mov    %rsp,%rbp
  800d2e:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800d35:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800d3c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800d43:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d4a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d51:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800d58:	84 c0                	test   %al,%al
  800d5a:	74 20                	je     800d7c <cprintf+0x52>
  800d5c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800d60:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800d64:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800d68:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800d6c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800d70:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800d74:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800d78:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800d7c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800d83:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800d8a:	00 00 00 
  800d8d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800d94:	00 00 00 
  800d97:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800d9b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800da2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800da9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800db0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800db7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800dbe:	48 8b 0a             	mov    (%rdx),%rcx
  800dc1:	48 89 08             	mov    %rcx,(%rax)
  800dc4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800dc8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800dcc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800dd0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800dd4:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800ddb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800de2:	48 89 d6             	mov    %rdx,%rsi
  800de5:	48 89 c7             	mov    %rax,%rdi
  800de8:	48 b8 7e 0c 80 00 00 	movabs $0x800c7e,%rax
  800def:	00 00 00 
  800df2:	ff d0                	callq  *%rax
  800df4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800dfa:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800e00:	c9                   	leaveq 
  800e01:	c3                   	retq   

0000000000800e02 <printnum>:
  800e02:	55                   	push   %rbp
  800e03:	48 89 e5             	mov    %rsp,%rbp
  800e06:	53                   	push   %rbx
  800e07:	48 83 ec 38          	sub    $0x38,%rsp
  800e0b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e0f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800e13:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800e17:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800e1a:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800e1e:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800e22:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800e25:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800e29:	77 3b                	ja     800e66 <printnum+0x64>
  800e2b:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800e2e:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800e32:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800e35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800e39:	ba 00 00 00 00       	mov    $0x0,%edx
  800e3e:	48 f7 f3             	div    %rbx
  800e41:	48 89 c2             	mov    %rax,%rdx
  800e44:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800e47:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800e4a:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800e4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e52:	41 89 f9             	mov    %edi,%r9d
  800e55:	48 89 c7             	mov    %rax,%rdi
  800e58:	48 b8 02 0e 80 00 00 	movabs $0x800e02,%rax
  800e5f:	00 00 00 
  800e62:	ff d0                	callq  *%rax
  800e64:	eb 1e                	jmp    800e84 <printnum+0x82>
  800e66:	eb 12                	jmp    800e7a <printnum+0x78>
  800e68:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800e6c:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800e6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e73:	48 89 ce             	mov    %rcx,%rsi
  800e76:	89 d7                	mov    %edx,%edi
  800e78:	ff d0                	callq  *%rax
  800e7a:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800e7e:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800e82:	7f e4                	jg     800e68 <printnum+0x66>
  800e84:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800e87:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800e8b:	ba 00 00 00 00       	mov    $0x0,%edx
  800e90:	48 f7 f1             	div    %rcx
  800e93:	48 89 d0             	mov    %rdx,%rax
  800e96:	48 ba 30 5a 80 00 00 	movabs $0x805a30,%rdx
  800e9d:	00 00 00 
  800ea0:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800ea4:	0f be d0             	movsbl %al,%edx
  800ea7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800eab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eaf:	48 89 ce             	mov    %rcx,%rsi
  800eb2:	89 d7                	mov    %edx,%edi
  800eb4:	ff d0                	callq  *%rax
  800eb6:	48 83 c4 38          	add    $0x38,%rsp
  800eba:	5b                   	pop    %rbx
  800ebb:	5d                   	pop    %rbp
  800ebc:	c3                   	retq   

0000000000800ebd <getuint>:
  800ebd:	55                   	push   %rbp
  800ebe:	48 89 e5             	mov    %rsp,%rbp
  800ec1:	48 83 ec 1c          	sub    $0x1c,%rsp
  800ec5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ec9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800ecc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800ed0:	7e 52                	jle    800f24 <getuint+0x67>
  800ed2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ed6:	8b 00                	mov    (%rax),%eax
  800ed8:	83 f8 30             	cmp    $0x30,%eax
  800edb:	73 24                	jae    800f01 <getuint+0x44>
  800edd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ee1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ee5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ee9:	8b 00                	mov    (%rax),%eax
  800eeb:	89 c0                	mov    %eax,%eax
  800eed:	48 01 d0             	add    %rdx,%rax
  800ef0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ef4:	8b 12                	mov    (%rdx),%edx
  800ef6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ef9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800efd:	89 0a                	mov    %ecx,(%rdx)
  800eff:	eb 17                	jmp    800f18 <getuint+0x5b>
  800f01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f05:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800f09:	48 89 d0             	mov    %rdx,%rax
  800f0c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800f10:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f14:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800f18:	48 8b 00             	mov    (%rax),%rax
  800f1b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f1f:	e9 a3 00 00 00       	jmpq   800fc7 <getuint+0x10a>
  800f24:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800f28:	74 4f                	je     800f79 <getuint+0xbc>
  800f2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f2e:	8b 00                	mov    (%rax),%eax
  800f30:	83 f8 30             	cmp    $0x30,%eax
  800f33:	73 24                	jae    800f59 <getuint+0x9c>
  800f35:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f39:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800f3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f41:	8b 00                	mov    (%rax),%eax
  800f43:	89 c0                	mov    %eax,%eax
  800f45:	48 01 d0             	add    %rdx,%rax
  800f48:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f4c:	8b 12                	mov    (%rdx),%edx
  800f4e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800f51:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f55:	89 0a                	mov    %ecx,(%rdx)
  800f57:	eb 17                	jmp    800f70 <getuint+0xb3>
  800f59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f5d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800f61:	48 89 d0             	mov    %rdx,%rax
  800f64:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800f68:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f6c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800f70:	48 8b 00             	mov    (%rax),%rax
  800f73:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f77:	eb 4e                	jmp    800fc7 <getuint+0x10a>
  800f79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f7d:	8b 00                	mov    (%rax),%eax
  800f7f:	83 f8 30             	cmp    $0x30,%eax
  800f82:	73 24                	jae    800fa8 <getuint+0xeb>
  800f84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f88:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800f8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f90:	8b 00                	mov    (%rax),%eax
  800f92:	89 c0                	mov    %eax,%eax
  800f94:	48 01 d0             	add    %rdx,%rax
  800f97:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f9b:	8b 12                	mov    (%rdx),%edx
  800f9d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800fa0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fa4:	89 0a                	mov    %ecx,(%rdx)
  800fa6:	eb 17                	jmp    800fbf <getuint+0x102>
  800fa8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fac:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800fb0:	48 89 d0             	mov    %rdx,%rax
  800fb3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800fb7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fbb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800fbf:	8b 00                	mov    (%rax),%eax
  800fc1:	89 c0                	mov    %eax,%eax
  800fc3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800fc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fcb:	c9                   	leaveq 
  800fcc:	c3                   	retq   

0000000000800fcd <getint>:
  800fcd:	55                   	push   %rbp
  800fce:	48 89 e5             	mov    %rsp,%rbp
  800fd1:	48 83 ec 1c          	sub    $0x1c,%rsp
  800fd5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fd9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800fdc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800fe0:	7e 52                	jle    801034 <getint+0x67>
  800fe2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe6:	8b 00                	mov    (%rax),%eax
  800fe8:	83 f8 30             	cmp    $0x30,%eax
  800feb:	73 24                	jae    801011 <getint+0x44>
  800fed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ff5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff9:	8b 00                	mov    (%rax),%eax
  800ffb:	89 c0                	mov    %eax,%eax
  800ffd:	48 01 d0             	add    %rdx,%rax
  801000:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801004:	8b 12                	mov    (%rdx),%edx
  801006:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801009:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80100d:	89 0a                	mov    %ecx,(%rdx)
  80100f:	eb 17                	jmp    801028 <getint+0x5b>
  801011:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801015:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801019:	48 89 d0             	mov    %rdx,%rax
  80101c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801020:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801024:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801028:	48 8b 00             	mov    (%rax),%rax
  80102b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80102f:	e9 a3 00 00 00       	jmpq   8010d7 <getint+0x10a>
  801034:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801038:	74 4f                	je     801089 <getint+0xbc>
  80103a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80103e:	8b 00                	mov    (%rax),%eax
  801040:	83 f8 30             	cmp    $0x30,%eax
  801043:	73 24                	jae    801069 <getint+0x9c>
  801045:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801049:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80104d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801051:	8b 00                	mov    (%rax),%eax
  801053:	89 c0                	mov    %eax,%eax
  801055:	48 01 d0             	add    %rdx,%rax
  801058:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80105c:	8b 12                	mov    (%rdx),%edx
  80105e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801061:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801065:	89 0a                	mov    %ecx,(%rdx)
  801067:	eb 17                	jmp    801080 <getint+0xb3>
  801069:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80106d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801071:	48 89 d0             	mov    %rdx,%rax
  801074:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801078:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80107c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801080:	48 8b 00             	mov    (%rax),%rax
  801083:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801087:	eb 4e                	jmp    8010d7 <getint+0x10a>
  801089:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108d:	8b 00                	mov    (%rax),%eax
  80108f:	83 f8 30             	cmp    $0x30,%eax
  801092:	73 24                	jae    8010b8 <getint+0xeb>
  801094:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801098:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80109c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010a0:	8b 00                	mov    (%rax),%eax
  8010a2:	89 c0                	mov    %eax,%eax
  8010a4:	48 01 d0             	add    %rdx,%rax
  8010a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010ab:	8b 12                	mov    (%rdx),%edx
  8010ad:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8010b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010b4:	89 0a                	mov    %ecx,(%rdx)
  8010b6:	eb 17                	jmp    8010cf <getint+0x102>
  8010b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010bc:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8010c0:	48 89 d0             	mov    %rdx,%rax
  8010c3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8010c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010cb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8010cf:	8b 00                	mov    (%rax),%eax
  8010d1:	48 98                	cltq   
  8010d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010db:	c9                   	leaveq 
  8010dc:	c3                   	retq   

00000000008010dd <vprintfmt>:
  8010dd:	55                   	push   %rbp
  8010de:	48 89 e5             	mov    %rsp,%rbp
  8010e1:	41 54                	push   %r12
  8010e3:	53                   	push   %rbx
  8010e4:	48 83 ec 60          	sub    $0x60,%rsp
  8010e8:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8010ec:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8010f0:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8010f4:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8010f8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8010fc:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  801100:	48 8b 0a             	mov    (%rdx),%rcx
  801103:	48 89 08             	mov    %rcx,(%rax)
  801106:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80110a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80110e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801112:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801116:	eb 17                	jmp    80112f <vprintfmt+0x52>
  801118:	85 db                	test   %ebx,%ebx
  80111a:	0f 84 cc 04 00 00    	je     8015ec <vprintfmt+0x50f>
  801120:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801124:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801128:	48 89 d6             	mov    %rdx,%rsi
  80112b:	89 df                	mov    %ebx,%edi
  80112d:	ff d0                	callq  *%rax
  80112f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801133:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801137:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80113b:	0f b6 00             	movzbl (%rax),%eax
  80113e:	0f b6 d8             	movzbl %al,%ebx
  801141:	83 fb 25             	cmp    $0x25,%ebx
  801144:	75 d2                	jne    801118 <vprintfmt+0x3b>
  801146:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  80114a:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  801151:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801158:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80115f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801166:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80116a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80116e:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801172:	0f b6 00             	movzbl (%rax),%eax
  801175:	0f b6 d8             	movzbl %al,%ebx
  801178:	8d 43 dd             	lea    -0x23(%rbx),%eax
  80117b:	83 f8 55             	cmp    $0x55,%eax
  80117e:	0f 87 34 04 00 00    	ja     8015b8 <vprintfmt+0x4db>
  801184:	89 c0                	mov    %eax,%eax
  801186:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80118d:	00 
  80118e:	48 b8 58 5a 80 00 00 	movabs $0x805a58,%rax
  801195:	00 00 00 
  801198:	48 01 d0             	add    %rdx,%rax
  80119b:	48 8b 00             	mov    (%rax),%rax
  80119e:	ff e0                	jmpq   *%rax
  8011a0:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8011a4:	eb c0                	jmp    801166 <vprintfmt+0x89>
  8011a6:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8011aa:	eb ba                	jmp    801166 <vprintfmt+0x89>
  8011ac:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8011b3:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8011b6:	89 d0                	mov    %edx,%eax
  8011b8:	c1 e0 02             	shl    $0x2,%eax
  8011bb:	01 d0                	add    %edx,%eax
  8011bd:	01 c0                	add    %eax,%eax
  8011bf:	01 d8                	add    %ebx,%eax
  8011c1:	83 e8 30             	sub    $0x30,%eax
  8011c4:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8011c7:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8011cb:	0f b6 00             	movzbl (%rax),%eax
  8011ce:	0f be d8             	movsbl %al,%ebx
  8011d1:	83 fb 2f             	cmp    $0x2f,%ebx
  8011d4:	7e 0c                	jle    8011e2 <vprintfmt+0x105>
  8011d6:	83 fb 39             	cmp    $0x39,%ebx
  8011d9:	7f 07                	jg     8011e2 <vprintfmt+0x105>
  8011db:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8011e0:	eb d1                	jmp    8011b3 <vprintfmt+0xd6>
  8011e2:	eb 58                	jmp    80123c <vprintfmt+0x15f>
  8011e4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8011e7:	83 f8 30             	cmp    $0x30,%eax
  8011ea:	73 17                	jae    801203 <vprintfmt+0x126>
  8011ec:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8011f0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8011f3:	89 c0                	mov    %eax,%eax
  8011f5:	48 01 d0             	add    %rdx,%rax
  8011f8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8011fb:	83 c2 08             	add    $0x8,%edx
  8011fe:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801201:	eb 0f                	jmp    801212 <vprintfmt+0x135>
  801203:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801207:	48 89 d0             	mov    %rdx,%rax
  80120a:	48 83 c2 08          	add    $0x8,%rdx
  80120e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801212:	8b 00                	mov    (%rax),%eax
  801214:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801217:	eb 23                	jmp    80123c <vprintfmt+0x15f>
  801219:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80121d:	79 0c                	jns    80122b <vprintfmt+0x14e>
  80121f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801226:	e9 3b ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  80122b:	e9 36 ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  801230:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801237:	e9 2a ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  80123c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801240:	79 12                	jns    801254 <vprintfmt+0x177>
  801242:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801245:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801248:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80124f:	e9 12 ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  801254:	e9 0d ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  801259:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  80125d:	e9 04 ff ff ff       	jmpq   801166 <vprintfmt+0x89>
  801262:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801265:	83 f8 30             	cmp    $0x30,%eax
  801268:	73 17                	jae    801281 <vprintfmt+0x1a4>
  80126a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80126e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801271:	89 c0                	mov    %eax,%eax
  801273:	48 01 d0             	add    %rdx,%rax
  801276:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801279:	83 c2 08             	add    $0x8,%edx
  80127c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80127f:	eb 0f                	jmp    801290 <vprintfmt+0x1b3>
  801281:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801285:	48 89 d0             	mov    %rdx,%rax
  801288:	48 83 c2 08          	add    $0x8,%rdx
  80128c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801290:	8b 10                	mov    (%rax),%edx
  801292:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801296:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80129a:	48 89 ce             	mov    %rcx,%rsi
  80129d:	89 d7                	mov    %edx,%edi
  80129f:	ff d0                	callq  *%rax
  8012a1:	e9 40 03 00 00       	jmpq   8015e6 <vprintfmt+0x509>
  8012a6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8012a9:	83 f8 30             	cmp    $0x30,%eax
  8012ac:	73 17                	jae    8012c5 <vprintfmt+0x1e8>
  8012ae:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8012b2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8012b5:	89 c0                	mov    %eax,%eax
  8012b7:	48 01 d0             	add    %rdx,%rax
  8012ba:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012bd:	83 c2 08             	add    $0x8,%edx
  8012c0:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8012c3:	eb 0f                	jmp    8012d4 <vprintfmt+0x1f7>
  8012c5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8012c9:	48 89 d0             	mov    %rdx,%rax
  8012cc:	48 83 c2 08          	add    $0x8,%rdx
  8012d0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8012d4:	8b 18                	mov    (%rax),%ebx
  8012d6:	85 db                	test   %ebx,%ebx
  8012d8:	79 02                	jns    8012dc <vprintfmt+0x1ff>
  8012da:	f7 db                	neg    %ebx
  8012dc:	83 fb 15             	cmp    $0x15,%ebx
  8012df:	7f 16                	jg     8012f7 <vprintfmt+0x21a>
  8012e1:	48 b8 80 59 80 00 00 	movabs $0x805980,%rax
  8012e8:	00 00 00 
  8012eb:	48 63 d3             	movslq %ebx,%rdx
  8012ee:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8012f2:	4d 85 e4             	test   %r12,%r12
  8012f5:	75 2e                	jne    801325 <vprintfmt+0x248>
  8012f7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8012fb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8012ff:	89 d9                	mov    %ebx,%ecx
  801301:	48 ba 41 5a 80 00 00 	movabs $0x805a41,%rdx
  801308:	00 00 00 
  80130b:	48 89 c7             	mov    %rax,%rdi
  80130e:	b8 00 00 00 00       	mov    $0x0,%eax
  801313:	49 b8 f5 15 80 00 00 	movabs $0x8015f5,%r8
  80131a:	00 00 00 
  80131d:	41 ff d0             	callq  *%r8
  801320:	e9 c1 02 00 00       	jmpq   8015e6 <vprintfmt+0x509>
  801325:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801329:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80132d:	4c 89 e1             	mov    %r12,%rcx
  801330:	48 ba 4a 5a 80 00 00 	movabs $0x805a4a,%rdx
  801337:	00 00 00 
  80133a:	48 89 c7             	mov    %rax,%rdi
  80133d:	b8 00 00 00 00       	mov    $0x0,%eax
  801342:	49 b8 f5 15 80 00 00 	movabs $0x8015f5,%r8
  801349:	00 00 00 
  80134c:	41 ff d0             	callq  *%r8
  80134f:	e9 92 02 00 00       	jmpq   8015e6 <vprintfmt+0x509>
  801354:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801357:	83 f8 30             	cmp    $0x30,%eax
  80135a:	73 17                	jae    801373 <vprintfmt+0x296>
  80135c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801360:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801363:	89 c0                	mov    %eax,%eax
  801365:	48 01 d0             	add    %rdx,%rax
  801368:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80136b:	83 c2 08             	add    $0x8,%edx
  80136e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801371:	eb 0f                	jmp    801382 <vprintfmt+0x2a5>
  801373:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801377:	48 89 d0             	mov    %rdx,%rax
  80137a:	48 83 c2 08          	add    $0x8,%rdx
  80137e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801382:	4c 8b 20             	mov    (%rax),%r12
  801385:	4d 85 e4             	test   %r12,%r12
  801388:	75 0a                	jne    801394 <vprintfmt+0x2b7>
  80138a:	49 bc 4d 5a 80 00 00 	movabs $0x805a4d,%r12
  801391:	00 00 00 
  801394:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801398:	7e 3f                	jle    8013d9 <vprintfmt+0x2fc>
  80139a:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  80139e:	74 39                	je     8013d9 <vprintfmt+0x2fc>
  8013a0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8013a3:	48 98                	cltq   
  8013a5:	48 89 c6             	mov    %rax,%rsi
  8013a8:	4c 89 e7             	mov    %r12,%rdi
  8013ab:	48 b8 a1 18 80 00 00 	movabs $0x8018a1,%rax
  8013b2:	00 00 00 
  8013b5:	ff d0                	callq  *%rax
  8013b7:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8013ba:	eb 17                	jmp    8013d3 <vprintfmt+0x2f6>
  8013bc:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8013c0:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8013c4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013c8:	48 89 ce             	mov    %rcx,%rsi
  8013cb:	89 d7                	mov    %edx,%edi
  8013cd:	ff d0                	callq  *%rax
  8013cf:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8013d3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8013d7:	7f e3                	jg     8013bc <vprintfmt+0x2df>
  8013d9:	eb 37                	jmp    801412 <vprintfmt+0x335>
  8013db:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8013df:	74 1e                	je     8013ff <vprintfmt+0x322>
  8013e1:	83 fb 1f             	cmp    $0x1f,%ebx
  8013e4:	7e 05                	jle    8013eb <vprintfmt+0x30e>
  8013e6:	83 fb 7e             	cmp    $0x7e,%ebx
  8013e9:	7e 14                	jle    8013ff <vprintfmt+0x322>
  8013eb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8013ef:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013f3:	48 89 d6             	mov    %rdx,%rsi
  8013f6:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8013fb:	ff d0                	callq  *%rax
  8013fd:	eb 0f                	jmp    80140e <vprintfmt+0x331>
  8013ff:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801403:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801407:	48 89 d6             	mov    %rdx,%rsi
  80140a:	89 df                	mov    %ebx,%edi
  80140c:	ff d0                	callq  *%rax
  80140e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801412:	4c 89 e0             	mov    %r12,%rax
  801415:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801419:	0f b6 00             	movzbl (%rax),%eax
  80141c:	0f be d8             	movsbl %al,%ebx
  80141f:	85 db                	test   %ebx,%ebx
  801421:	74 10                	je     801433 <vprintfmt+0x356>
  801423:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801427:	78 b2                	js     8013db <vprintfmt+0x2fe>
  801429:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80142d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801431:	79 a8                	jns    8013db <vprintfmt+0x2fe>
  801433:	eb 16                	jmp    80144b <vprintfmt+0x36e>
  801435:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801439:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80143d:	48 89 d6             	mov    %rdx,%rsi
  801440:	bf 20 00 00 00       	mov    $0x20,%edi
  801445:	ff d0                	callq  *%rax
  801447:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80144b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80144f:	7f e4                	jg     801435 <vprintfmt+0x358>
  801451:	e9 90 01 00 00       	jmpq   8015e6 <vprintfmt+0x509>
  801456:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80145a:	be 03 00 00 00       	mov    $0x3,%esi
  80145f:	48 89 c7             	mov    %rax,%rdi
  801462:	48 b8 cd 0f 80 00 00 	movabs $0x800fcd,%rax
  801469:	00 00 00 
  80146c:	ff d0                	callq  *%rax
  80146e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801472:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801476:	48 85 c0             	test   %rax,%rax
  801479:	79 1d                	jns    801498 <vprintfmt+0x3bb>
  80147b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80147f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801483:	48 89 d6             	mov    %rdx,%rsi
  801486:	bf 2d 00 00 00       	mov    $0x2d,%edi
  80148b:	ff d0                	callq  *%rax
  80148d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801491:	48 f7 d8             	neg    %rax
  801494:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801498:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80149f:	e9 d5 00 00 00       	jmpq   801579 <vprintfmt+0x49c>
  8014a4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8014a8:	be 03 00 00 00       	mov    $0x3,%esi
  8014ad:	48 89 c7             	mov    %rax,%rdi
  8014b0:	48 b8 bd 0e 80 00 00 	movabs $0x800ebd,%rax
  8014b7:	00 00 00 
  8014ba:	ff d0                	callq  *%rax
  8014bc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8014c0:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8014c7:	e9 ad 00 00 00       	jmpq   801579 <vprintfmt+0x49c>
  8014cc:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8014d0:	be 03 00 00 00       	mov    $0x3,%esi
  8014d5:	48 89 c7             	mov    %rax,%rdi
  8014d8:	48 b8 bd 0e 80 00 00 	movabs $0x800ebd,%rax
  8014df:	00 00 00 
  8014e2:	ff d0                	callq  *%rax
  8014e4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8014e8:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  8014ef:	e9 85 00 00 00       	jmpq   801579 <vprintfmt+0x49c>
  8014f4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8014f8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014fc:	48 89 d6             	mov    %rdx,%rsi
  8014ff:	bf 30 00 00 00       	mov    $0x30,%edi
  801504:	ff d0                	callq  *%rax
  801506:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80150a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80150e:	48 89 d6             	mov    %rdx,%rsi
  801511:	bf 78 00 00 00       	mov    $0x78,%edi
  801516:	ff d0                	callq  *%rax
  801518:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80151b:	83 f8 30             	cmp    $0x30,%eax
  80151e:	73 17                	jae    801537 <vprintfmt+0x45a>
  801520:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801524:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801527:	89 c0                	mov    %eax,%eax
  801529:	48 01 d0             	add    %rdx,%rax
  80152c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80152f:	83 c2 08             	add    $0x8,%edx
  801532:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801535:	eb 0f                	jmp    801546 <vprintfmt+0x469>
  801537:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80153b:	48 89 d0             	mov    %rdx,%rax
  80153e:	48 83 c2 08          	add    $0x8,%rdx
  801542:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801546:	48 8b 00             	mov    (%rax),%rax
  801549:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80154d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801554:	eb 23                	jmp    801579 <vprintfmt+0x49c>
  801556:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80155a:	be 03 00 00 00       	mov    $0x3,%esi
  80155f:	48 89 c7             	mov    %rax,%rdi
  801562:	48 b8 bd 0e 80 00 00 	movabs $0x800ebd,%rax
  801569:	00 00 00 
  80156c:	ff d0                	callq  *%rax
  80156e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801572:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801579:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  80157e:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  801581:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801584:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801588:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80158c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801590:	45 89 c1             	mov    %r8d,%r9d
  801593:	41 89 f8             	mov    %edi,%r8d
  801596:	48 89 c7             	mov    %rax,%rdi
  801599:	48 b8 02 0e 80 00 00 	movabs $0x800e02,%rax
  8015a0:	00 00 00 
  8015a3:	ff d0                	callq  *%rax
  8015a5:	eb 3f                	jmp    8015e6 <vprintfmt+0x509>
  8015a7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015ab:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015af:	48 89 d6             	mov    %rdx,%rsi
  8015b2:	89 df                	mov    %ebx,%edi
  8015b4:	ff d0                	callq  *%rax
  8015b6:	eb 2e                	jmp    8015e6 <vprintfmt+0x509>
  8015b8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015bc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015c0:	48 89 d6             	mov    %rdx,%rsi
  8015c3:	bf 25 00 00 00       	mov    $0x25,%edi
  8015c8:	ff d0                	callq  *%rax
  8015ca:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8015cf:	eb 05                	jmp    8015d6 <vprintfmt+0x4f9>
  8015d1:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8015d6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8015da:	48 83 e8 01          	sub    $0x1,%rax
  8015de:	0f b6 00             	movzbl (%rax),%eax
  8015e1:	3c 25                	cmp    $0x25,%al
  8015e3:	75 ec                	jne    8015d1 <vprintfmt+0x4f4>
  8015e5:	90                   	nop
  8015e6:	90                   	nop
  8015e7:	e9 43 fb ff ff       	jmpq   80112f <vprintfmt+0x52>
  8015ec:	48 83 c4 60          	add    $0x60,%rsp
  8015f0:	5b                   	pop    %rbx
  8015f1:	41 5c                	pop    %r12
  8015f3:	5d                   	pop    %rbp
  8015f4:	c3                   	retq   

00000000008015f5 <printfmt>:
  8015f5:	55                   	push   %rbp
  8015f6:	48 89 e5             	mov    %rsp,%rbp
  8015f9:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  801600:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801607:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80160e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801615:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80161c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801623:	84 c0                	test   %al,%al
  801625:	74 20                	je     801647 <printfmt+0x52>
  801627:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80162b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80162f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801633:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801637:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80163b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80163f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801643:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801647:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80164e:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801655:	00 00 00 
  801658:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80165f:	00 00 00 
  801662:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801666:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80166d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801674:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  80167b:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  801682:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801689:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801690:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801697:	48 89 c7             	mov    %rax,%rdi
  80169a:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  8016a1:	00 00 00 
  8016a4:	ff d0                	callq  *%rax
  8016a6:	c9                   	leaveq 
  8016a7:	c3                   	retq   

00000000008016a8 <sprintputch>:
  8016a8:	55                   	push   %rbp
  8016a9:	48 89 e5             	mov    %rsp,%rbp
  8016ac:	48 83 ec 10          	sub    $0x10,%rsp
  8016b0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8016b3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016bb:	8b 40 10             	mov    0x10(%rax),%eax
  8016be:	8d 50 01             	lea    0x1(%rax),%edx
  8016c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016c5:	89 50 10             	mov    %edx,0x10(%rax)
  8016c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016cc:	48 8b 10             	mov    (%rax),%rdx
  8016cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016d3:	48 8b 40 08          	mov    0x8(%rax),%rax
  8016d7:	48 39 c2             	cmp    %rax,%rdx
  8016da:	73 17                	jae    8016f3 <sprintputch+0x4b>
  8016dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016e0:	48 8b 00             	mov    (%rax),%rax
  8016e3:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8016e7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8016eb:	48 89 0a             	mov    %rcx,(%rdx)
  8016ee:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8016f1:	88 10                	mov    %dl,(%rax)
  8016f3:	c9                   	leaveq 
  8016f4:	c3                   	retq   

00000000008016f5 <vsnprintf>:
  8016f5:	55                   	push   %rbp
  8016f6:	48 89 e5             	mov    %rsp,%rbp
  8016f9:	48 83 ec 50          	sub    $0x50,%rsp
  8016fd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801701:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801704:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801708:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80170c:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801710:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801714:	48 8b 0a             	mov    (%rdx),%rcx
  801717:	48 89 08             	mov    %rcx,(%rax)
  80171a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80171e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801722:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801726:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80172a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80172e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801732:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801735:	48 98                	cltq   
  801737:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80173b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80173f:	48 01 d0             	add    %rdx,%rax
  801742:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801746:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80174d:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801752:	74 06                	je     80175a <vsnprintf+0x65>
  801754:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801758:	7f 07                	jg     801761 <vsnprintf+0x6c>
  80175a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80175f:	eb 2f                	jmp    801790 <vsnprintf+0x9b>
  801761:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801765:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801769:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80176d:	48 89 c6             	mov    %rax,%rsi
  801770:	48 bf a8 16 80 00 00 	movabs $0x8016a8,%rdi
  801777:	00 00 00 
  80177a:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  801781:	00 00 00 
  801784:	ff d0                	callq  *%rax
  801786:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80178a:	c6 00 00             	movb   $0x0,(%rax)
  80178d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801790:	c9                   	leaveq 
  801791:	c3                   	retq   

0000000000801792 <snprintf>:
  801792:	55                   	push   %rbp
  801793:	48 89 e5             	mov    %rsp,%rbp
  801796:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80179d:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8017a4:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8017aa:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8017b1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8017b8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8017bf:	84 c0                	test   %al,%al
  8017c1:	74 20                	je     8017e3 <snprintf+0x51>
  8017c3:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8017c7:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8017cb:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8017cf:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8017d3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8017d7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8017db:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8017df:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8017e3:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8017ea:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8017f1:	00 00 00 
  8017f4:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8017fb:	00 00 00 
  8017fe:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801802:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801809:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801810:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801817:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80181e:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801825:	48 8b 0a             	mov    (%rdx),%rcx
  801828:	48 89 08             	mov    %rcx,(%rax)
  80182b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80182f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801833:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801837:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80183b:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801842:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801849:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80184f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801856:	48 89 c7             	mov    %rax,%rdi
  801859:	48 b8 f5 16 80 00 00 	movabs $0x8016f5,%rax
  801860:	00 00 00 
  801863:	ff d0                	callq  *%rax
  801865:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80186b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801871:	c9                   	leaveq 
  801872:	c3                   	retq   

0000000000801873 <strlen>:
  801873:	55                   	push   %rbp
  801874:	48 89 e5             	mov    %rsp,%rbp
  801877:	48 83 ec 18          	sub    $0x18,%rsp
  80187b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80187f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801886:	eb 09                	jmp    801891 <strlen+0x1e>
  801888:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80188c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801891:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801895:	0f b6 00             	movzbl (%rax),%eax
  801898:	84 c0                	test   %al,%al
  80189a:	75 ec                	jne    801888 <strlen+0x15>
  80189c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80189f:	c9                   	leaveq 
  8018a0:	c3                   	retq   

00000000008018a1 <strnlen>:
  8018a1:	55                   	push   %rbp
  8018a2:	48 89 e5             	mov    %rsp,%rbp
  8018a5:	48 83 ec 20          	sub    $0x20,%rsp
  8018a9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018ad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8018b8:	eb 0e                	jmp    8018c8 <strnlen+0x27>
  8018ba:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8018be:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8018c3:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8018c8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8018cd:	74 0b                	je     8018da <strnlen+0x39>
  8018cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018d3:	0f b6 00             	movzbl (%rax),%eax
  8018d6:	84 c0                	test   %al,%al
  8018d8:	75 e0                	jne    8018ba <strnlen+0x19>
  8018da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018dd:	c9                   	leaveq 
  8018de:	c3                   	retq   

00000000008018df <strcpy>:
  8018df:	55                   	push   %rbp
  8018e0:	48 89 e5             	mov    %rsp,%rbp
  8018e3:	48 83 ec 20          	sub    $0x20,%rsp
  8018e7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018eb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018f3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018f7:	90                   	nop
  8018f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018fc:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801900:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801904:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801908:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80190c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801910:	0f b6 12             	movzbl (%rdx),%edx
  801913:	88 10                	mov    %dl,(%rax)
  801915:	0f b6 00             	movzbl (%rax),%eax
  801918:	84 c0                	test   %al,%al
  80191a:	75 dc                	jne    8018f8 <strcpy+0x19>
  80191c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801920:	c9                   	leaveq 
  801921:	c3                   	retq   

0000000000801922 <strcat>:
  801922:	55                   	push   %rbp
  801923:	48 89 e5             	mov    %rsp,%rbp
  801926:	48 83 ec 20          	sub    $0x20,%rsp
  80192a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80192e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801932:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801936:	48 89 c7             	mov    %rax,%rdi
  801939:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  801940:	00 00 00 
  801943:	ff d0                	callq  *%rax
  801945:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801948:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80194b:	48 63 d0             	movslq %eax,%rdx
  80194e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801952:	48 01 c2             	add    %rax,%rdx
  801955:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801959:	48 89 c6             	mov    %rax,%rsi
  80195c:	48 89 d7             	mov    %rdx,%rdi
  80195f:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  801966:	00 00 00 
  801969:	ff d0                	callq  *%rax
  80196b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80196f:	c9                   	leaveq 
  801970:	c3                   	retq   

0000000000801971 <strncpy>:
  801971:	55                   	push   %rbp
  801972:	48 89 e5             	mov    %rsp,%rbp
  801975:	48 83 ec 28          	sub    $0x28,%rsp
  801979:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80197d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801981:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801985:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801989:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80198d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801994:	00 
  801995:	eb 2a                	jmp    8019c1 <strncpy+0x50>
  801997:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80199b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80199f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8019a3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8019a7:	0f b6 12             	movzbl (%rdx),%edx
  8019aa:	88 10                	mov    %dl,(%rax)
  8019ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8019b0:	0f b6 00             	movzbl (%rax),%eax
  8019b3:	84 c0                	test   %al,%al
  8019b5:	74 05                	je     8019bc <strncpy+0x4b>
  8019b7:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8019bc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8019c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019c5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8019c9:	72 cc                	jb     801997 <strncpy+0x26>
  8019cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8019cf:	c9                   	leaveq 
  8019d0:	c3                   	retq   

00000000008019d1 <strlcpy>:
  8019d1:	55                   	push   %rbp
  8019d2:	48 89 e5             	mov    %rsp,%rbp
  8019d5:	48 83 ec 28          	sub    $0x28,%rsp
  8019d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8019dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8019e1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8019e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019e9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8019ed:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8019f2:	74 3d                	je     801a31 <strlcpy+0x60>
  8019f4:	eb 1d                	jmp    801a13 <strlcpy+0x42>
  8019f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019fa:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8019fe:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a02:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801a06:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801a0a:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801a0e:	0f b6 12             	movzbl (%rdx),%edx
  801a11:	88 10                	mov    %dl,(%rax)
  801a13:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801a18:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801a1d:	74 0b                	je     801a2a <strlcpy+0x59>
  801a1f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801a23:	0f b6 00             	movzbl (%rax),%eax
  801a26:	84 c0                	test   %al,%al
  801a28:	75 cc                	jne    8019f6 <strlcpy+0x25>
  801a2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a2e:	c6 00 00             	movb   $0x0,(%rax)
  801a31:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801a35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a39:	48 29 c2             	sub    %rax,%rdx
  801a3c:	48 89 d0             	mov    %rdx,%rax
  801a3f:	c9                   	leaveq 
  801a40:	c3                   	retq   

0000000000801a41 <strcmp>:
  801a41:	55                   	push   %rbp
  801a42:	48 89 e5             	mov    %rsp,%rbp
  801a45:	48 83 ec 10          	sub    $0x10,%rsp
  801a49:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a4d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a51:	eb 0a                	jmp    801a5d <strcmp+0x1c>
  801a53:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801a58:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801a5d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a61:	0f b6 00             	movzbl (%rax),%eax
  801a64:	84 c0                	test   %al,%al
  801a66:	74 12                	je     801a7a <strcmp+0x39>
  801a68:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a6c:	0f b6 10             	movzbl (%rax),%edx
  801a6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a73:	0f b6 00             	movzbl (%rax),%eax
  801a76:	38 c2                	cmp    %al,%dl
  801a78:	74 d9                	je     801a53 <strcmp+0x12>
  801a7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a7e:	0f b6 00             	movzbl (%rax),%eax
  801a81:	0f b6 d0             	movzbl %al,%edx
  801a84:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a88:	0f b6 00             	movzbl (%rax),%eax
  801a8b:	0f b6 c0             	movzbl %al,%eax
  801a8e:	29 c2                	sub    %eax,%edx
  801a90:	89 d0                	mov    %edx,%eax
  801a92:	c9                   	leaveq 
  801a93:	c3                   	retq   

0000000000801a94 <strncmp>:
  801a94:	55                   	push   %rbp
  801a95:	48 89 e5             	mov    %rsp,%rbp
  801a98:	48 83 ec 18          	sub    $0x18,%rsp
  801a9c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801aa0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aa4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801aa8:	eb 0f                	jmp    801ab9 <strncmp+0x25>
  801aaa:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801aaf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801ab4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801ab9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801abe:	74 1d                	je     801add <strncmp+0x49>
  801ac0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ac4:	0f b6 00             	movzbl (%rax),%eax
  801ac7:	84 c0                	test   %al,%al
  801ac9:	74 12                	je     801add <strncmp+0x49>
  801acb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801acf:	0f b6 10             	movzbl (%rax),%edx
  801ad2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ad6:	0f b6 00             	movzbl (%rax),%eax
  801ad9:	38 c2                	cmp    %al,%dl
  801adb:	74 cd                	je     801aaa <strncmp+0x16>
  801add:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801ae2:	75 07                	jne    801aeb <strncmp+0x57>
  801ae4:	b8 00 00 00 00       	mov    $0x0,%eax
  801ae9:	eb 18                	jmp    801b03 <strncmp+0x6f>
  801aeb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801aef:	0f b6 00             	movzbl (%rax),%eax
  801af2:	0f b6 d0             	movzbl %al,%edx
  801af5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801af9:	0f b6 00             	movzbl (%rax),%eax
  801afc:	0f b6 c0             	movzbl %al,%eax
  801aff:	29 c2                	sub    %eax,%edx
  801b01:	89 d0                	mov    %edx,%eax
  801b03:	c9                   	leaveq 
  801b04:	c3                   	retq   

0000000000801b05 <strchr>:
  801b05:	55                   	push   %rbp
  801b06:	48 89 e5             	mov    %rsp,%rbp
  801b09:	48 83 ec 0c          	sub    $0xc,%rsp
  801b0d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b11:	89 f0                	mov    %esi,%eax
  801b13:	88 45 f4             	mov    %al,-0xc(%rbp)
  801b16:	eb 17                	jmp    801b2f <strchr+0x2a>
  801b18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b1c:	0f b6 00             	movzbl (%rax),%eax
  801b1f:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801b22:	75 06                	jne    801b2a <strchr+0x25>
  801b24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b28:	eb 15                	jmp    801b3f <strchr+0x3a>
  801b2a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b33:	0f b6 00             	movzbl (%rax),%eax
  801b36:	84 c0                	test   %al,%al
  801b38:	75 de                	jne    801b18 <strchr+0x13>
  801b3a:	b8 00 00 00 00       	mov    $0x0,%eax
  801b3f:	c9                   	leaveq 
  801b40:	c3                   	retq   

0000000000801b41 <strfind>:
  801b41:	55                   	push   %rbp
  801b42:	48 89 e5             	mov    %rsp,%rbp
  801b45:	48 83 ec 0c          	sub    $0xc,%rsp
  801b49:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b4d:	89 f0                	mov    %esi,%eax
  801b4f:	88 45 f4             	mov    %al,-0xc(%rbp)
  801b52:	eb 13                	jmp    801b67 <strfind+0x26>
  801b54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b58:	0f b6 00             	movzbl (%rax),%eax
  801b5b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801b5e:	75 02                	jne    801b62 <strfind+0x21>
  801b60:	eb 10                	jmp    801b72 <strfind+0x31>
  801b62:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b6b:	0f b6 00             	movzbl (%rax),%eax
  801b6e:	84 c0                	test   %al,%al
  801b70:	75 e2                	jne    801b54 <strfind+0x13>
  801b72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b76:	c9                   	leaveq 
  801b77:	c3                   	retq   

0000000000801b78 <memset>:
  801b78:	55                   	push   %rbp
  801b79:	48 89 e5             	mov    %rsp,%rbp
  801b7c:	48 83 ec 18          	sub    $0x18,%rsp
  801b80:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b84:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b87:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b8b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801b90:	75 06                	jne    801b98 <memset+0x20>
  801b92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b96:	eb 69                	jmp    801c01 <memset+0x89>
  801b98:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b9c:	83 e0 03             	and    $0x3,%eax
  801b9f:	48 85 c0             	test   %rax,%rax
  801ba2:	75 48                	jne    801bec <memset+0x74>
  801ba4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ba8:	83 e0 03             	and    $0x3,%eax
  801bab:	48 85 c0             	test   %rax,%rax
  801bae:	75 3c                	jne    801bec <memset+0x74>
  801bb0:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801bb7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bba:	c1 e0 18             	shl    $0x18,%eax
  801bbd:	89 c2                	mov    %eax,%edx
  801bbf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bc2:	c1 e0 10             	shl    $0x10,%eax
  801bc5:	09 c2                	or     %eax,%edx
  801bc7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bca:	c1 e0 08             	shl    $0x8,%eax
  801bcd:	09 d0                	or     %edx,%eax
  801bcf:	09 45 f4             	or     %eax,-0xc(%rbp)
  801bd2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bd6:	48 c1 e8 02          	shr    $0x2,%rax
  801bda:	48 89 c1             	mov    %rax,%rcx
  801bdd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801be1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801be4:	48 89 d7             	mov    %rdx,%rdi
  801be7:	fc                   	cld    
  801be8:	f3 ab                	rep stos %eax,%es:(%rdi)
  801bea:	eb 11                	jmp    801bfd <memset+0x85>
  801bec:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801bf0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bf3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801bf7:	48 89 d7             	mov    %rdx,%rdi
  801bfa:	fc                   	cld    
  801bfb:	f3 aa                	rep stos %al,%es:(%rdi)
  801bfd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c01:	c9                   	leaveq 
  801c02:	c3                   	retq   

0000000000801c03 <memmove>:
  801c03:	55                   	push   %rbp
  801c04:	48 89 e5             	mov    %rsp,%rbp
  801c07:	48 83 ec 28          	sub    $0x28,%rsp
  801c0b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801c0f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801c13:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801c17:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c1b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801c1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c23:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801c27:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c2b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801c2f:	0f 83 88 00 00 00    	jae    801cbd <memmove+0xba>
  801c35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c39:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c3d:	48 01 d0             	add    %rdx,%rax
  801c40:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801c44:	76 77                	jbe    801cbd <memmove+0xba>
  801c46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c4a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801c4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c52:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801c56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c5a:	83 e0 03             	and    $0x3,%eax
  801c5d:	48 85 c0             	test   %rax,%rax
  801c60:	75 3b                	jne    801c9d <memmove+0x9a>
  801c62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c66:	83 e0 03             	and    $0x3,%eax
  801c69:	48 85 c0             	test   %rax,%rax
  801c6c:	75 2f                	jne    801c9d <memmove+0x9a>
  801c6e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c72:	83 e0 03             	and    $0x3,%eax
  801c75:	48 85 c0             	test   %rax,%rax
  801c78:	75 23                	jne    801c9d <memmove+0x9a>
  801c7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c7e:	48 83 e8 04          	sub    $0x4,%rax
  801c82:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c86:	48 83 ea 04          	sub    $0x4,%rdx
  801c8a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801c8e:	48 c1 e9 02          	shr    $0x2,%rcx
  801c92:	48 89 c7             	mov    %rax,%rdi
  801c95:	48 89 d6             	mov    %rdx,%rsi
  801c98:	fd                   	std    
  801c99:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801c9b:	eb 1d                	jmp    801cba <memmove+0xb7>
  801c9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ca1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801ca5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ca9:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801cad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cb1:	48 89 d7             	mov    %rdx,%rdi
  801cb4:	48 89 c1             	mov    %rax,%rcx
  801cb7:	fd                   	std    
  801cb8:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801cba:	fc                   	cld    
  801cbb:	eb 57                	jmp    801d14 <memmove+0x111>
  801cbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cc1:	83 e0 03             	and    $0x3,%eax
  801cc4:	48 85 c0             	test   %rax,%rax
  801cc7:	75 36                	jne    801cff <memmove+0xfc>
  801cc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ccd:	83 e0 03             	and    $0x3,%eax
  801cd0:	48 85 c0             	test   %rax,%rax
  801cd3:	75 2a                	jne    801cff <memmove+0xfc>
  801cd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cd9:	83 e0 03             	and    $0x3,%eax
  801cdc:	48 85 c0             	test   %rax,%rax
  801cdf:	75 1e                	jne    801cff <memmove+0xfc>
  801ce1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ce5:	48 c1 e8 02          	shr    $0x2,%rax
  801ce9:	48 89 c1             	mov    %rax,%rcx
  801cec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cf0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801cf4:	48 89 c7             	mov    %rax,%rdi
  801cf7:	48 89 d6             	mov    %rdx,%rsi
  801cfa:	fc                   	cld    
  801cfb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801cfd:	eb 15                	jmp    801d14 <memmove+0x111>
  801cff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d03:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d07:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801d0b:	48 89 c7             	mov    %rax,%rdi
  801d0e:	48 89 d6             	mov    %rdx,%rsi
  801d11:	fc                   	cld    
  801d12:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801d14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d18:	c9                   	leaveq 
  801d19:	c3                   	retq   

0000000000801d1a <memcpy>:
  801d1a:	55                   	push   %rbp
  801d1b:	48 89 e5             	mov    %rsp,%rbp
  801d1e:	48 83 ec 18          	sub    $0x18,%rsp
  801d22:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d26:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d2a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d2e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801d32:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801d36:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d3a:	48 89 ce             	mov    %rcx,%rsi
  801d3d:	48 89 c7             	mov    %rax,%rdi
  801d40:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  801d47:	00 00 00 
  801d4a:	ff d0                	callq  *%rax
  801d4c:	c9                   	leaveq 
  801d4d:	c3                   	retq   

0000000000801d4e <memcmp>:
  801d4e:	55                   	push   %rbp
  801d4f:	48 89 e5             	mov    %rsp,%rbp
  801d52:	48 83 ec 28          	sub    $0x28,%rsp
  801d56:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801d5a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d5e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801d62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d66:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801d6a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d6e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d72:	eb 36                	jmp    801daa <memcmp+0x5c>
  801d74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d78:	0f b6 10             	movzbl (%rax),%edx
  801d7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d7f:	0f b6 00             	movzbl (%rax),%eax
  801d82:	38 c2                	cmp    %al,%dl
  801d84:	74 1a                	je     801da0 <memcmp+0x52>
  801d86:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d8a:	0f b6 00             	movzbl (%rax),%eax
  801d8d:	0f b6 d0             	movzbl %al,%edx
  801d90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d94:	0f b6 00             	movzbl (%rax),%eax
  801d97:	0f b6 c0             	movzbl %al,%eax
  801d9a:	29 c2                	sub    %eax,%edx
  801d9c:	89 d0                	mov    %edx,%eax
  801d9e:	eb 20                	jmp    801dc0 <memcmp+0x72>
  801da0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801da5:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801daa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dae:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801db2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801db6:	48 85 c0             	test   %rax,%rax
  801db9:	75 b9                	jne    801d74 <memcmp+0x26>
  801dbb:	b8 00 00 00 00       	mov    $0x0,%eax
  801dc0:	c9                   	leaveq 
  801dc1:	c3                   	retq   

0000000000801dc2 <memfind>:
  801dc2:	55                   	push   %rbp
  801dc3:	48 89 e5             	mov    %rsp,%rbp
  801dc6:	48 83 ec 28          	sub    $0x28,%rsp
  801dca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801dce:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801dd1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801dd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dd9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801ddd:	48 01 d0             	add    %rdx,%rax
  801de0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801de4:	eb 15                	jmp    801dfb <memfind+0x39>
  801de6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dea:	0f b6 10             	movzbl (%rax),%edx
  801ded:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801df0:	38 c2                	cmp    %al,%dl
  801df2:	75 02                	jne    801df6 <memfind+0x34>
  801df4:	eb 0f                	jmp    801e05 <memfind+0x43>
  801df6:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801dfb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dff:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801e03:	72 e1                	jb     801de6 <memfind+0x24>
  801e05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e09:	c9                   	leaveq 
  801e0a:	c3                   	retq   

0000000000801e0b <strtol>:
  801e0b:	55                   	push   %rbp
  801e0c:	48 89 e5             	mov    %rsp,%rbp
  801e0f:	48 83 ec 34          	sub    $0x34,%rsp
  801e13:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801e17:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801e1b:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801e1e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e25:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801e2c:	00 
  801e2d:	eb 05                	jmp    801e34 <strtol+0x29>
  801e2f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e34:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e38:	0f b6 00             	movzbl (%rax),%eax
  801e3b:	3c 20                	cmp    $0x20,%al
  801e3d:	74 f0                	je     801e2f <strtol+0x24>
  801e3f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e43:	0f b6 00             	movzbl (%rax),%eax
  801e46:	3c 09                	cmp    $0x9,%al
  801e48:	74 e5                	je     801e2f <strtol+0x24>
  801e4a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e4e:	0f b6 00             	movzbl (%rax),%eax
  801e51:	3c 2b                	cmp    $0x2b,%al
  801e53:	75 07                	jne    801e5c <strtol+0x51>
  801e55:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e5a:	eb 17                	jmp    801e73 <strtol+0x68>
  801e5c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e60:	0f b6 00             	movzbl (%rax),%eax
  801e63:	3c 2d                	cmp    $0x2d,%al
  801e65:	75 0c                	jne    801e73 <strtol+0x68>
  801e67:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e6c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801e73:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801e77:	74 06                	je     801e7f <strtol+0x74>
  801e79:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801e7d:	75 28                	jne    801ea7 <strtol+0x9c>
  801e7f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e83:	0f b6 00             	movzbl (%rax),%eax
  801e86:	3c 30                	cmp    $0x30,%al
  801e88:	75 1d                	jne    801ea7 <strtol+0x9c>
  801e8a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e8e:	48 83 c0 01          	add    $0x1,%rax
  801e92:	0f b6 00             	movzbl (%rax),%eax
  801e95:	3c 78                	cmp    $0x78,%al
  801e97:	75 0e                	jne    801ea7 <strtol+0x9c>
  801e99:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801e9e:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801ea5:	eb 2c                	jmp    801ed3 <strtol+0xc8>
  801ea7:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801eab:	75 19                	jne    801ec6 <strtol+0xbb>
  801ead:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eb1:	0f b6 00             	movzbl (%rax),%eax
  801eb4:	3c 30                	cmp    $0x30,%al
  801eb6:	75 0e                	jne    801ec6 <strtol+0xbb>
  801eb8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801ebd:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801ec4:	eb 0d                	jmp    801ed3 <strtol+0xc8>
  801ec6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801eca:	75 07                	jne    801ed3 <strtol+0xc8>
  801ecc:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801ed3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ed7:	0f b6 00             	movzbl (%rax),%eax
  801eda:	3c 2f                	cmp    $0x2f,%al
  801edc:	7e 1d                	jle    801efb <strtol+0xf0>
  801ede:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ee2:	0f b6 00             	movzbl (%rax),%eax
  801ee5:	3c 39                	cmp    $0x39,%al
  801ee7:	7f 12                	jg     801efb <strtol+0xf0>
  801ee9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eed:	0f b6 00             	movzbl (%rax),%eax
  801ef0:	0f be c0             	movsbl %al,%eax
  801ef3:	83 e8 30             	sub    $0x30,%eax
  801ef6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801ef9:	eb 4e                	jmp    801f49 <strtol+0x13e>
  801efb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eff:	0f b6 00             	movzbl (%rax),%eax
  801f02:	3c 60                	cmp    $0x60,%al
  801f04:	7e 1d                	jle    801f23 <strtol+0x118>
  801f06:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f0a:	0f b6 00             	movzbl (%rax),%eax
  801f0d:	3c 7a                	cmp    $0x7a,%al
  801f0f:	7f 12                	jg     801f23 <strtol+0x118>
  801f11:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f15:	0f b6 00             	movzbl (%rax),%eax
  801f18:	0f be c0             	movsbl %al,%eax
  801f1b:	83 e8 57             	sub    $0x57,%eax
  801f1e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f21:	eb 26                	jmp    801f49 <strtol+0x13e>
  801f23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f27:	0f b6 00             	movzbl (%rax),%eax
  801f2a:	3c 40                	cmp    $0x40,%al
  801f2c:	7e 48                	jle    801f76 <strtol+0x16b>
  801f2e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f32:	0f b6 00             	movzbl (%rax),%eax
  801f35:	3c 5a                	cmp    $0x5a,%al
  801f37:	7f 3d                	jg     801f76 <strtol+0x16b>
  801f39:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f3d:	0f b6 00             	movzbl (%rax),%eax
  801f40:	0f be c0             	movsbl %al,%eax
  801f43:	83 e8 37             	sub    $0x37,%eax
  801f46:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f49:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f4c:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801f4f:	7c 02                	jl     801f53 <strtol+0x148>
  801f51:	eb 23                	jmp    801f76 <strtol+0x16b>
  801f53:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f58:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801f5b:	48 98                	cltq   
  801f5d:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801f62:	48 89 c2             	mov    %rax,%rdx
  801f65:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f68:	48 98                	cltq   
  801f6a:	48 01 d0             	add    %rdx,%rax
  801f6d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f71:	e9 5d ff ff ff       	jmpq   801ed3 <strtol+0xc8>
  801f76:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801f7b:	74 0b                	je     801f88 <strtol+0x17d>
  801f7d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801f81:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801f85:	48 89 10             	mov    %rdx,(%rax)
  801f88:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f8c:	74 09                	je     801f97 <strtol+0x18c>
  801f8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f92:	48 f7 d8             	neg    %rax
  801f95:	eb 04                	jmp    801f9b <strtol+0x190>
  801f97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f9b:	c9                   	leaveq 
  801f9c:	c3                   	retq   

0000000000801f9d <strstr>:
  801f9d:	55                   	push   %rbp
  801f9e:	48 89 e5             	mov    %rsp,%rbp
  801fa1:	48 83 ec 30          	sub    $0x30,%rsp
  801fa5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801fa9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801fad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801fb1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801fb5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801fb9:	0f b6 00             	movzbl (%rax),%eax
  801fbc:	88 45 ff             	mov    %al,-0x1(%rbp)
  801fbf:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801fc3:	75 06                	jne    801fcb <strstr+0x2e>
  801fc5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fc9:	eb 6b                	jmp    802036 <strstr+0x99>
  801fcb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801fcf:	48 89 c7             	mov    %rax,%rdi
  801fd2:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  801fd9:	00 00 00 
  801fdc:	ff d0                	callq  *%rax
  801fde:	48 98                	cltq   
  801fe0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fe4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fe8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801fec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ff0:	0f b6 00             	movzbl (%rax),%eax
  801ff3:	88 45 ef             	mov    %al,-0x11(%rbp)
  801ff6:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801ffa:	75 07                	jne    802003 <strstr+0x66>
  801ffc:	b8 00 00 00 00       	mov    $0x0,%eax
  802001:	eb 33                	jmp    802036 <strstr+0x99>
  802003:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  802007:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80200a:	75 d8                	jne    801fe4 <strstr+0x47>
  80200c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802010:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802014:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802018:	48 89 ce             	mov    %rcx,%rsi
  80201b:	48 89 c7             	mov    %rax,%rdi
  80201e:	48 b8 94 1a 80 00 00 	movabs $0x801a94,%rax
  802025:	00 00 00 
  802028:	ff d0                	callq  *%rax
  80202a:	85 c0                	test   %eax,%eax
  80202c:	75 b6                	jne    801fe4 <strstr+0x47>
  80202e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802032:	48 83 e8 01          	sub    $0x1,%rax
  802036:	c9                   	leaveq 
  802037:	c3                   	retq   

0000000000802038 <syscall>:
  802038:	55                   	push   %rbp
  802039:	48 89 e5             	mov    %rsp,%rbp
  80203c:	53                   	push   %rbx
  80203d:	48 83 ec 48          	sub    $0x48,%rsp
  802041:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802044:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802047:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80204b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80204f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  802053:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  802057:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80205a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80205e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  802062:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802066:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  80206a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80206e:	4c 89 c3             	mov    %r8,%rbx
  802071:	cd 30                	int    $0x30
  802073:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802077:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80207b:	74 3e                	je     8020bb <syscall+0x83>
  80207d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802082:	7e 37                	jle    8020bb <syscall+0x83>
  802084:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802088:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80208b:	49 89 d0             	mov    %rdx,%r8
  80208e:	89 c1                	mov    %eax,%ecx
  802090:	48 ba 08 5d 80 00 00 	movabs $0x805d08,%rdx
  802097:	00 00 00 
  80209a:	be 24 00 00 00       	mov    $0x24,%esi
  80209f:	48 bf 25 5d 80 00 00 	movabs $0x805d25,%rdi
  8020a6:	00 00 00 
  8020a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8020ae:	49 b9 f1 0a 80 00 00 	movabs $0x800af1,%r9
  8020b5:	00 00 00 
  8020b8:	41 ff d1             	callq  *%r9
  8020bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020bf:	48 83 c4 48          	add    $0x48,%rsp
  8020c3:	5b                   	pop    %rbx
  8020c4:	5d                   	pop    %rbp
  8020c5:	c3                   	retq   

00000000008020c6 <sys_cputs>:
  8020c6:	55                   	push   %rbp
  8020c7:	48 89 e5             	mov    %rsp,%rbp
  8020ca:	48 83 ec 20          	sub    $0x20,%rsp
  8020ce:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020da:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020de:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8020e5:	00 
  8020e6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020ec:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020f2:	48 89 d1             	mov    %rdx,%rcx
  8020f5:	48 89 c2             	mov    %rax,%rdx
  8020f8:	be 00 00 00 00       	mov    $0x0,%esi
  8020fd:	bf 00 00 00 00       	mov    $0x0,%edi
  802102:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802109:	00 00 00 
  80210c:	ff d0                	callq  *%rax
  80210e:	c9                   	leaveq 
  80210f:	c3                   	retq   

0000000000802110 <sys_cgetc>:
  802110:	55                   	push   %rbp
  802111:	48 89 e5             	mov    %rsp,%rbp
  802114:	48 83 ec 10          	sub    $0x10,%rsp
  802118:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80211f:	00 
  802120:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802126:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80212c:	b9 00 00 00 00       	mov    $0x0,%ecx
  802131:	ba 00 00 00 00       	mov    $0x0,%edx
  802136:	be 00 00 00 00       	mov    $0x0,%esi
  80213b:	bf 01 00 00 00       	mov    $0x1,%edi
  802140:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802147:	00 00 00 
  80214a:	ff d0                	callq  *%rax
  80214c:	c9                   	leaveq 
  80214d:	c3                   	retq   

000000000080214e <sys_env_destroy>:
  80214e:	55                   	push   %rbp
  80214f:	48 89 e5             	mov    %rsp,%rbp
  802152:	48 83 ec 10          	sub    $0x10,%rsp
  802156:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802159:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80215c:	48 98                	cltq   
  80215e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802165:	00 
  802166:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80216c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802172:	b9 00 00 00 00       	mov    $0x0,%ecx
  802177:	48 89 c2             	mov    %rax,%rdx
  80217a:	be 01 00 00 00       	mov    $0x1,%esi
  80217f:	bf 03 00 00 00       	mov    $0x3,%edi
  802184:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  80218b:	00 00 00 
  80218e:	ff d0                	callq  *%rax
  802190:	c9                   	leaveq 
  802191:	c3                   	retq   

0000000000802192 <sys_getenvid>:
  802192:	55                   	push   %rbp
  802193:	48 89 e5             	mov    %rsp,%rbp
  802196:	48 83 ec 10          	sub    $0x10,%rsp
  80219a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021a1:	00 
  8021a2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021a8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021ae:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021b3:	ba 00 00 00 00       	mov    $0x0,%edx
  8021b8:	be 00 00 00 00       	mov    $0x0,%esi
  8021bd:	bf 02 00 00 00       	mov    $0x2,%edi
  8021c2:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8021c9:	00 00 00 
  8021cc:	ff d0                	callq  *%rax
  8021ce:	c9                   	leaveq 
  8021cf:	c3                   	retq   

00000000008021d0 <sys_yield>:
  8021d0:	55                   	push   %rbp
  8021d1:	48 89 e5             	mov    %rsp,%rbp
  8021d4:	48 83 ec 10          	sub    $0x10,%rsp
  8021d8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021df:	00 
  8021e0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021e6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021ec:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021f1:	ba 00 00 00 00       	mov    $0x0,%edx
  8021f6:	be 00 00 00 00       	mov    $0x0,%esi
  8021fb:	bf 0b 00 00 00       	mov    $0xb,%edi
  802200:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802207:	00 00 00 
  80220a:	ff d0                	callq  *%rax
  80220c:	c9                   	leaveq 
  80220d:	c3                   	retq   

000000000080220e <sys_page_alloc>:
  80220e:	55                   	push   %rbp
  80220f:	48 89 e5             	mov    %rsp,%rbp
  802212:	48 83 ec 20          	sub    $0x20,%rsp
  802216:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802219:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80221d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802220:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802223:	48 63 c8             	movslq %eax,%rcx
  802226:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80222a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80222d:	48 98                	cltq   
  80222f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802236:	00 
  802237:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80223d:	49 89 c8             	mov    %rcx,%r8
  802240:	48 89 d1             	mov    %rdx,%rcx
  802243:	48 89 c2             	mov    %rax,%rdx
  802246:	be 01 00 00 00       	mov    $0x1,%esi
  80224b:	bf 04 00 00 00       	mov    $0x4,%edi
  802250:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802257:	00 00 00 
  80225a:	ff d0                	callq  *%rax
  80225c:	c9                   	leaveq 
  80225d:	c3                   	retq   

000000000080225e <sys_page_map>:
  80225e:	55                   	push   %rbp
  80225f:	48 89 e5             	mov    %rsp,%rbp
  802262:	48 83 ec 30          	sub    $0x30,%rsp
  802266:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802269:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80226d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802270:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802274:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802278:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80227b:	48 63 c8             	movslq %eax,%rcx
  80227e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802282:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802285:	48 63 f0             	movslq %eax,%rsi
  802288:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80228c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80228f:	48 98                	cltq   
  802291:	48 89 0c 24          	mov    %rcx,(%rsp)
  802295:	49 89 f9             	mov    %rdi,%r9
  802298:	49 89 f0             	mov    %rsi,%r8
  80229b:	48 89 d1             	mov    %rdx,%rcx
  80229e:	48 89 c2             	mov    %rax,%rdx
  8022a1:	be 01 00 00 00       	mov    $0x1,%esi
  8022a6:	bf 05 00 00 00       	mov    $0x5,%edi
  8022ab:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8022b2:	00 00 00 
  8022b5:	ff d0                	callq  *%rax
  8022b7:	c9                   	leaveq 
  8022b8:	c3                   	retq   

00000000008022b9 <sys_page_unmap>:
  8022b9:	55                   	push   %rbp
  8022ba:	48 89 e5             	mov    %rsp,%rbp
  8022bd:	48 83 ec 20          	sub    $0x20,%rsp
  8022c1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8022c4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8022c8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8022cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022cf:	48 98                	cltq   
  8022d1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8022d8:	00 
  8022d9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022df:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022e5:	48 89 d1             	mov    %rdx,%rcx
  8022e8:	48 89 c2             	mov    %rax,%rdx
  8022eb:	be 01 00 00 00       	mov    $0x1,%esi
  8022f0:	bf 06 00 00 00       	mov    $0x6,%edi
  8022f5:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8022fc:	00 00 00 
  8022ff:	ff d0                	callq  *%rax
  802301:	c9                   	leaveq 
  802302:	c3                   	retq   

0000000000802303 <sys_env_set_status>:
  802303:	55                   	push   %rbp
  802304:	48 89 e5             	mov    %rsp,%rbp
  802307:	48 83 ec 10          	sub    $0x10,%rsp
  80230b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80230e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802311:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802314:	48 63 d0             	movslq %eax,%rdx
  802317:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80231a:	48 98                	cltq   
  80231c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802323:	00 
  802324:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80232a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802330:	48 89 d1             	mov    %rdx,%rcx
  802333:	48 89 c2             	mov    %rax,%rdx
  802336:	be 01 00 00 00       	mov    $0x1,%esi
  80233b:	bf 08 00 00 00       	mov    $0x8,%edi
  802340:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802347:	00 00 00 
  80234a:	ff d0                	callq  *%rax
  80234c:	c9                   	leaveq 
  80234d:	c3                   	retq   

000000000080234e <sys_env_set_trapframe>:
  80234e:	55                   	push   %rbp
  80234f:	48 89 e5             	mov    %rsp,%rbp
  802352:	48 83 ec 20          	sub    $0x20,%rsp
  802356:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802359:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80235d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802361:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802364:	48 98                	cltq   
  802366:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80236d:	00 
  80236e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802374:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80237a:	48 89 d1             	mov    %rdx,%rcx
  80237d:	48 89 c2             	mov    %rax,%rdx
  802380:	be 01 00 00 00       	mov    $0x1,%esi
  802385:	bf 09 00 00 00       	mov    $0x9,%edi
  80238a:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802391:	00 00 00 
  802394:	ff d0                	callq  *%rax
  802396:	c9                   	leaveq 
  802397:	c3                   	retq   

0000000000802398 <sys_env_set_pgfault_upcall>:
  802398:	55                   	push   %rbp
  802399:	48 89 e5             	mov    %rsp,%rbp
  80239c:	48 83 ec 20          	sub    $0x20,%rsp
  8023a0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023a7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023ae:	48 98                	cltq   
  8023b0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8023b7:	00 
  8023b8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023be:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023c4:	48 89 d1             	mov    %rdx,%rcx
  8023c7:	48 89 c2             	mov    %rax,%rdx
  8023ca:	be 01 00 00 00       	mov    $0x1,%esi
  8023cf:	bf 0a 00 00 00       	mov    $0xa,%edi
  8023d4:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8023db:	00 00 00 
  8023de:	ff d0                	callq  *%rax
  8023e0:	c9                   	leaveq 
  8023e1:	c3                   	retq   

00000000008023e2 <sys_ipc_try_send>:
  8023e2:	55                   	push   %rbp
  8023e3:	48 89 e5             	mov    %rsp,%rbp
  8023e6:	48 83 ec 20          	sub    $0x20,%rsp
  8023ea:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023ed:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023f1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8023f5:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8023f8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023fb:	48 63 f0             	movslq %eax,%rsi
  8023fe:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802402:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802405:	48 98                	cltq   
  802407:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80240b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802412:	00 
  802413:	49 89 f1             	mov    %rsi,%r9
  802416:	49 89 c8             	mov    %rcx,%r8
  802419:	48 89 d1             	mov    %rdx,%rcx
  80241c:	48 89 c2             	mov    %rax,%rdx
  80241f:	be 00 00 00 00       	mov    $0x0,%esi
  802424:	bf 0c 00 00 00       	mov    $0xc,%edi
  802429:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802430:	00 00 00 
  802433:	ff d0                	callq  *%rax
  802435:	c9                   	leaveq 
  802436:	c3                   	retq   

0000000000802437 <sys_ipc_recv>:
  802437:	55                   	push   %rbp
  802438:	48 89 e5             	mov    %rsp,%rbp
  80243b:	48 83 ec 10          	sub    $0x10,%rsp
  80243f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802443:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802447:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80244e:	00 
  80244f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802455:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80245b:	b9 00 00 00 00       	mov    $0x0,%ecx
  802460:	48 89 c2             	mov    %rax,%rdx
  802463:	be 01 00 00 00       	mov    $0x1,%esi
  802468:	bf 0d 00 00 00       	mov    $0xd,%edi
  80246d:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802474:	00 00 00 
  802477:	ff d0                	callq  *%rax
  802479:	c9                   	leaveq 
  80247a:	c3                   	retq   

000000000080247b <sys_time_msec>:
  80247b:	55                   	push   %rbp
  80247c:	48 89 e5             	mov    %rsp,%rbp
  80247f:	48 83 ec 10          	sub    $0x10,%rsp
  802483:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80248a:	00 
  80248b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802491:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802497:	b9 00 00 00 00       	mov    $0x0,%ecx
  80249c:	ba 00 00 00 00       	mov    $0x0,%edx
  8024a1:	be 00 00 00 00       	mov    $0x0,%esi
  8024a6:	bf 0e 00 00 00       	mov    $0xe,%edi
  8024ab:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8024b2:	00 00 00 
  8024b5:	ff d0                	callq  *%rax
  8024b7:	c9                   	leaveq 
  8024b8:	c3                   	retq   

00000000008024b9 <sys_net_transmit>:
  8024b9:	55                   	push   %rbp
  8024ba:	48 89 e5             	mov    %rsp,%rbp
  8024bd:	48 83 ec 20          	sub    $0x20,%rsp
  8024c1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024c5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8024c8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8024cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024cf:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8024d6:	00 
  8024d7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8024dd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8024e3:	48 89 d1             	mov    %rdx,%rcx
  8024e6:	48 89 c2             	mov    %rax,%rdx
  8024e9:	be 00 00 00 00       	mov    $0x0,%esi
  8024ee:	bf 0f 00 00 00       	mov    $0xf,%edi
  8024f3:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8024fa:	00 00 00 
  8024fd:	ff d0                	callq  *%rax
  8024ff:	c9                   	leaveq 
  802500:	c3                   	retq   

0000000000802501 <sys_net_receive>:
  802501:	55                   	push   %rbp
  802502:	48 89 e5             	mov    %rsp,%rbp
  802505:	48 83 ec 20          	sub    $0x20,%rsp
  802509:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80250d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802510:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802513:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802517:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80251e:	00 
  80251f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802525:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80252b:	48 89 d1             	mov    %rdx,%rcx
  80252e:	48 89 c2             	mov    %rax,%rdx
  802531:	be 00 00 00 00       	mov    $0x0,%esi
  802536:	bf 10 00 00 00       	mov    $0x10,%edi
  80253b:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802542:	00 00 00 
  802545:	ff d0                	callq  *%rax
  802547:	c9                   	leaveq 
  802548:	c3                   	retq   

0000000000802549 <sys_ept_map>:
  802549:	55                   	push   %rbp
  80254a:	48 89 e5             	mov    %rsp,%rbp
  80254d:	48 83 ec 30          	sub    $0x30,%rsp
  802551:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802554:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802558:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80255b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80255f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802563:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802566:	48 63 c8             	movslq %eax,%rcx
  802569:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80256d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802570:	48 63 f0             	movslq %eax,%rsi
  802573:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802577:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80257a:	48 98                	cltq   
  80257c:	48 89 0c 24          	mov    %rcx,(%rsp)
  802580:	49 89 f9             	mov    %rdi,%r9
  802583:	49 89 f0             	mov    %rsi,%r8
  802586:	48 89 d1             	mov    %rdx,%rcx
  802589:	48 89 c2             	mov    %rax,%rdx
  80258c:	be 00 00 00 00       	mov    $0x0,%esi
  802591:	bf 11 00 00 00       	mov    $0x11,%edi
  802596:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  80259d:	00 00 00 
  8025a0:	ff d0                	callq  *%rax
  8025a2:	c9                   	leaveq 
  8025a3:	c3                   	retq   

00000000008025a4 <sys_env_mkguest>:
  8025a4:	55                   	push   %rbp
  8025a5:	48 89 e5             	mov    %rsp,%rbp
  8025a8:	48 83 ec 20          	sub    $0x20,%rsp
  8025ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025b0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8025b4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8025b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025bc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8025c3:	00 
  8025c4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025ca:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025d0:	48 89 d1             	mov    %rdx,%rcx
  8025d3:	48 89 c2             	mov    %rax,%rdx
  8025d6:	be 00 00 00 00       	mov    $0x0,%esi
  8025db:	bf 12 00 00 00       	mov    $0x12,%edi
  8025e0:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8025e7:	00 00 00 
  8025ea:	ff d0                	callq  *%rax
  8025ec:	c9                   	leaveq 
  8025ed:	c3                   	retq   

00000000008025ee <sys_vmx_list_vms>:
  8025ee:	55                   	push   %rbp
  8025ef:	48 89 e5             	mov    %rsp,%rbp
  8025f2:	48 83 ec 10          	sub    $0x10,%rsp
  8025f6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8025fd:	00 
  8025fe:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802604:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80260a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80260f:	ba 00 00 00 00       	mov    $0x0,%edx
  802614:	be 00 00 00 00       	mov    $0x0,%esi
  802619:	bf 13 00 00 00       	mov    $0x13,%edi
  80261e:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802625:	00 00 00 
  802628:	ff d0                	callq  *%rax
  80262a:	c9                   	leaveq 
  80262b:	c3                   	retq   

000000000080262c <sys_vmx_sel_resume>:
  80262c:	55                   	push   %rbp
  80262d:	48 89 e5             	mov    %rsp,%rbp
  802630:	48 83 ec 10          	sub    $0x10,%rsp
  802634:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802637:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80263a:	48 98                	cltq   
  80263c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802643:	00 
  802644:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80264a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802650:	b9 00 00 00 00       	mov    $0x0,%ecx
  802655:	48 89 c2             	mov    %rax,%rdx
  802658:	be 00 00 00 00       	mov    $0x0,%esi
  80265d:	bf 14 00 00 00       	mov    $0x14,%edi
  802662:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  802669:	00 00 00 
  80266c:	ff d0                	callq  *%rax
  80266e:	c9                   	leaveq 
  80266f:	c3                   	retq   

0000000000802670 <sys_vmx_get_vmdisk_number>:
  802670:	55                   	push   %rbp
  802671:	48 89 e5             	mov    %rsp,%rbp
  802674:	48 83 ec 10          	sub    $0x10,%rsp
  802678:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80267f:	00 
  802680:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802686:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80268c:	b9 00 00 00 00       	mov    $0x0,%ecx
  802691:	ba 00 00 00 00       	mov    $0x0,%edx
  802696:	be 00 00 00 00       	mov    $0x0,%esi
  80269b:	bf 15 00 00 00       	mov    $0x15,%edi
  8026a0:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8026a7:	00 00 00 
  8026aa:	ff d0                	callq  *%rax
  8026ac:	c9                   	leaveq 
  8026ad:	c3                   	retq   

00000000008026ae <sys_vmx_incr_vmdisk_number>:
  8026ae:	55                   	push   %rbp
  8026af:	48 89 e5             	mov    %rsp,%rbp
  8026b2:	48 83 ec 10          	sub    $0x10,%rsp
  8026b6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8026bd:	00 
  8026be:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8026c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8026ca:	b9 00 00 00 00       	mov    $0x0,%ecx
  8026cf:	ba 00 00 00 00       	mov    $0x0,%edx
  8026d4:	be 00 00 00 00       	mov    $0x0,%esi
  8026d9:	bf 16 00 00 00       	mov    $0x16,%edi
  8026de:	48 b8 38 20 80 00 00 	movabs $0x802038,%rax
  8026e5:	00 00 00 
  8026e8:	ff d0                	callq  *%rax
  8026ea:	c9                   	leaveq 
  8026eb:	c3                   	retq   

00000000008026ec <pgfault>:
  8026ec:	55                   	push   %rbp
  8026ed:	48 89 e5             	mov    %rsp,%rbp
  8026f0:	48 83 ec 30          	sub    $0x30,%rsp
  8026f4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8026f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026fc:	48 8b 00             	mov    (%rax),%rax
  8026ff:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802703:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802707:	48 8b 40 08          	mov    0x8(%rax),%rax
  80270b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80270e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802711:	83 e0 02             	and    $0x2,%eax
  802714:	85 c0                	test   %eax,%eax
  802716:	75 40                	jne    802758 <pgfault+0x6c>
  802718:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80271c:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  802723:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802727:	49 89 d0             	mov    %rdx,%r8
  80272a:	48 89 c1             	mov    %rax,%rcx
  80272d:	48 ba 38 5d 80 00 00 	movabs $0x805d38,%rdx
  802734:	00 00 00 
  802737:	be 1f 00 00 00       	mov    $0x1f,%esi
  80273c:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  802743:	00 00 00 
  802746:	b8 00 00 00 00       	mov    $0x0,%eax
  80274b:	49 b9 f1 0a 80 00 00 	movabs $0x800af1,%r9
  802752:	00 00 00 
  802755:	41 ff d1             	callq  *%r9
  802758:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80275c:	48 c1 e8 0c          	shr    $0xc,%rax
  802760:	48 89 c2             	mov    %rax,%rdx
  802763:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80276a:	01 00 00 
  80276d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802771:	25 07 08 00 00       	and    $0x807,%eax
  802776:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  80277c:	74 4e                	je     8027cc <pgfault+0xe0>
  80277e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802782:	48 c1 e8 0c          	shr    $0xc,%rax
  802786:	48 89 c2             	mov    %rax,%rdx
  802789:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802790:	01 00 00 
  802793:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802797:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80279b:	49 89 d0             	mov    %rdx,%r8
  80279e:	48 89 c1             	mov    %rax,%rcx
  8027a1:	48 ba 60 5d 80 00 00 	movabs $0x805d60,%rdx
  8027a8:	00 00 00 
  8027ab:	be 22 00 00 00       	mov    $0x22,%esi
  8027b0:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  8027b7:	00 00 00 
  8027ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8027bf:	49 b9 f1 0a 80 00 00 	movabs $0x800af1,%r9
  8027c6:	00 00 00 
  8027c9:	41 ff d1             	callq  *%r9
  8027cc:	ba 07 00 00 00       	mov    $0x7,%edx
  8027d1:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8027d6:	bf 00 00 00 00       	mov    $0x0,%edi
  8027db:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8027e2:	00 00 00 
  8027e5:	ff d0                	callq  *%rax
  8027e7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027ea:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8027ee:	79 30                	jns    802820 <pgfault+0x134>
  8027f0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027f3:	89 c1                	mov    %eax,%ecx
  8027f5:	48 ba 8b 5d 80 00 00 	movabs $0x805d8b,%rdx
  8027fc:	00 00 00 
  8027ff:	be 30 00 00 00       	mov    $0x30,%esi
  802804:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  80280b:	00 00 00 
  80280e:	b8 00 00 00 00       	mov    $0x0,%eax
  802813:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  80281a:	00 00 00 
  80281d:	41 ff d0             	callq  *%r8
  802820:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802824:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802828:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80282c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802832:	ba 00 10 00 00       	mov    $0x1000,%edx
  802837:	48 89 c6             	mov    %rax,%rsi
  80283a:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  80283f:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  802846:	00 00 00 
  802849:	ff d0                	callq  *%rax
  80284b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80284f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802853:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802857:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80285d:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  802863:	48 89 c1             	mov    %rax,%rcx
  802866:	ba 00 00 00 00       	mov    $0x0,%edx
  80286b:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802870:	bf 00 00 00 00       	mov    $0x0,%edi
  802875:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  80287c:	00 00 00 
  80287f:	ff d0                	callq  *%rax
  802881:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802884:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802888:	79 30                	jns    8028ba <pgfault+0x1ce>
  80288a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80288d:	89 c1                	mov    %eax,%ecx
  80288f:	48 ba 9e 5d 80 00 00 	movabs $0x805d9e,%rdx
  802896:	00 00 00 
  802899:	be 35 00 00 00       	mov    $0x35,%esi
  80289e:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  8028a5:	00 00 00 
  8028a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8028ad:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8028b4:	00 00 00 
  8028b7:	41 ff d0             	callq  *%r8
  8028ba:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8028bf:	bf 00 00 00 00       	mov    $0x0,%edi
  8028c4:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8028cb:	00 00 00 
  8028ce:	ff d0                	callq  *%rax
  8028d0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8028d3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8028d7:	79 30                	jns    802909 <pgfault+0x21d>
  8028d9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8028dc:	89 c1                	mov    %eax,%ecx
  8028de:	48 ba af 5d 80 00 00 	movabs $0x805daf,%rdx
  8028e5:	00 00 00 
  8028e8:	be 39 00 00 00       	mov    $0x39,%esi
  8028ed:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  8028f4:	00 00 00 
  8028f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8028fc:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802903:	00 00 00 
  802906:	41 ff d0             	callq  *%r8
  802909:	c9                   	leaveq 
  80290a:	c3                   	retq   

000000000080290b <duppage>:
  80290b:	55                   	push   %rbp
  80290c:	48 89 e5             	mov    %rsp,%rbp
  80290f:	48 83 ec 30          	sub    $0x30,%rsp
  802913:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802916:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802919:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80291c:	c1 e0 0c             	shl    $0xc,%eax
  80291f:	89 c0                	mov    %eax,%eax
  802921:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802925:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80292c:	01 00 00 
  80292f:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802932:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802936:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80293a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80293e:	25 02 08 00 00       	and    $0x802,%eax
  802943:	48 85 c0             	test   %rax,%rax
  802946:	74 0e                	je     802956 <duppage+0x4b>
  802948:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80294c:	25 00 04 00 00       	and    $0x400,%eax
  802951:	48 85 c0             	test   %rax,%rax
  802954:	74 70                	je     8029c6 <duppage+0xbb>
  802956:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80295a:	25 07 0e 00 00       	and    $0xe07,%eax
  80295f:	89 c6                	mov    %eax,%esi
  802961:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802965:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802968:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80296c:	41 89 f0             	mov    %esi,%r8d
  80296f:	48 89 c6             	mov    %rax,%rsi
  802972:	bf 00 00 00 00       	mov    $0x0,%edi
  802977:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  80297e:	00 00 00 
  802981:	ff d0                	callq  *%rax
  802983:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802986:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80298a:	79 30                	jns    8029bc <duppage+0xb1>
  80298c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80298f:	89 c1                	mov    %eax,%ecx
  802991:	48 ba 9e 5d 80 00 00 	movabs $0x805d9e,%rdx
  802998:	00 00 00 
  80299b:	be 63 00 00 00       	mov    $0x63,%esi
  8029a0:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  8029a7:	00 00 00 
  8029aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8029af:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8029b6:	00 00 00 
  8029b9:	41 ff d0             	callq  *%r8
  8029bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8029c1:	e9 c4 00 00 00       	jmpq   802a8a <duppage+0x17f>
  8029c6:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8029ca:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8029cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8029d1:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8029d7:	48 89 c6             	mov    %rax,%rsi
  8029da:	bf 00 00 00 00       	mov    $0x0,%edi
  8029df:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  8029e6:	00 00 00 
  8029e9:	ff d0                	callq  *%rax
  8029eb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8029f2:	79 30                	jns    802a24 <duppage+0x119>
  8029f4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029f7:	89 c1                	mov    %eax,%ecx
  8029f9:	48 ba 9e 5d 80 00 00 	movabs $0x805d9e,%rdx
  802a00:	00 00 00 
  802a03:	be 7e 00 00 00       	mov    $0x7e,%esi
  802a08:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  802a0f:	00 00 00 
  802a12:	b8 00 00 00 00       	mov    $0x0,%eax
  802a17:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802a1e:	00 00 00 
  802a21:	41 ff d0             	callq  *%r8
  802a24:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802a28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a2c:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802a32:	48 89 d1             	mov    %rdx,%rcx
  802a35:	ba 00 00 00 00       	mov    $0x0,%edx
  802a3a:	48 89 c6             	mov    %rax,%rsi
  802a3d:	bf 00 00 00 00       	mov    $0x0,%edi
  802a42:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  802a49:	00 00 00 
  802a4c:	ff d0                	callq  *%rax
  802a4e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802a51:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802a55:	79 30                	jns    802a87 <duppage+0x17c>
  802a57:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a5a:	89 c1                	mov    %eax,%ecx
  802a5c:	48 ba 9e 5d 80 00 00 	movabs $0x805d9e,%rdx
  802a63:	00 00 00 
  802a66:	be 80 00 00 00       	mov    $0x80,%esi
  802a6b:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  802a72:	00 00 00 
  802a75:	b8 00 00 00 00       	mov    $0x0,%eax
  802a7a:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802a81:	00 00 00 
  802a84:	41 ff d0             	callq  *%r8
  802a87:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a8a:	c9                   	leaveq 
  802a8b:	c3                   	retq   

0000000000802a8c <fork>:
  802a8c:	55                   	push   %rbp
  802a8d:	48 89 e5             	mov    %rsp,%rbp
  802a90:	48 83 ec 20          	sub    $0x20,%rsp
  802a94:	48 bf ec 26 80 00 00 	movabs $0x8026ec,%rdi
  802a9b:	00 00 00 
  802a9e:	48 b8 7d 4f 80 00 00 	movabs $0x804f7d,%rax
  802aa5:	00 00 00 
  802aa8:	ff d0                	callq  *%rax
  802aaa:	b8 07 00 00 00       	mov    $0x7,%eax
  802aaf:	cd 30                	int    $0x30
  802ab1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802ab4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ab7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802aba:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802abe:	79 08                	jns    802ac8 <fork+0x3c>
  802ac0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ac3:	e9 09 02 00 00       	jmpq   802cd1 <fork+0x245>
  802ac8:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802acc:	75 3e                	jne    802b0c <fork+0x80>
  802ace:	48 b8 92 21 80 00 00 	movabs $0x802192,%rax
  802ad5:	00 00 00 
  802ad8:	ff d0                	callq  *%rax
  802ada:	25 ff 03 00 00       	and    $0x3ff,%eax
  802adf:	48 98                	cltq   
  802ae1:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802ae8:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802aef:	00 00 00 
  802af2:	48 01 c2             	add    %rax,%rdx
  802af5:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802afc:	00 00 00 
  802aff:	48 89 10             	mov    %rdx,(%rax)
  802b02:	b8 00 00 00 00       	mov    $0x0,%eax
  802b07:	e9 c5 01 00 00       	jmpq   802cd1 <fork+0x245>
  802b0c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b13:	e9 a4 00 00 00       	jmpq   802bbc <fork+0x130>
  802b18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b1b:	c1 f8 12             	sar    $0x12,%eax
  802b1e:	89 c2                	mov    %eax,%edx
  802b20:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802b27:	01 00 00 
  802b2a:	48 63 d2             	movslq %edx,%rdx
  802b2d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b31:	83 e0 01             	and    $0x1,%eax
  802b34:	48 85 c0             	test   %rax,%rax
  802b37:	74 21                	je     802b5a <fork+0xce>
  802b39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b3c:	c1 f8 09             	sar    $0x9,%eax
  802b3f:	89 c2                	mov    %eax,%edx
  802b41:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802b48:	01 00 00 
  802b4b:	48 63 d2             	movslq %edx,%rdx
  802b4e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b52:	83 e0 01             	and    $0x1,%eax
  802b55:	48 85 c0             	test   %rax,%rax
  802b58:	75 09                	jne    802b63 <fork+0xd7>
  802b5a:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802b61:	eb 59                	jmp    802bbc <fork+0x130>
  802b63:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b66:	05 00 02 00 00       	add    $0x200,%eax
  802b6b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802b6e:	eb 44                	jmp    802bb4 <fork+0x128>
  802b70:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b77:	01 00 00 
  802b7a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802b7d:	48 63 d2             	movslq %edx,%rdx
  802b80:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b84:	83 e0 05             	and    $0x5,%eax
  802b87:	48 83 f8 05          	cmp    $0x5,%rax
  802b8b:	74 02                	je     802b8f <fork+0x103>
  802b8d:	eb 21                	jmp    802bb0 <fork+0x124>
  802b8f:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  802b96:	75 02                	jne    802b9a <fork+0x10e>
  802b98:	eb 16                	jmp    802bb0 <fork+0x124>
  802b9a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802b9d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ba0:	89 d6                	mov    %edx,%esi
  802ba2:	89 c7                	mov    %eax,%edi
  802ba4:	48 b8 0b 29 80 00 00 	movabs $0x80290b,%rax
  802bab:	00 00 00 
  802bae:	ff d0                	callq  *%rax
  802bb0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802bb4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bb7:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802bba:	7c b4                	jl     802b70 <fork+0xe4>
  802bbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bbf:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802bc4:	0f 86 4e ff ff ff    	jbe    802b18 <fork+0x8c>
  802bca:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bcd:	ba 07 00 00 00       	mov    $0x7,%edx
  802bd2:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802bd7:	89 c7                	mov    %eax,%edi
  802bd9:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802be0:	00 00 00 
  802be3:	ff d0                	callq  *%rax
  802be5:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802be8:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802bec:	79 30                	jns    802c1e <fork+0x192>
  802bee:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802bf1:	89 c1                	mov    %eax,%ecx
  802bf3:	48 ba c8 5d 80 00 00 	movabs $0x805dc8,%rdx
  802bfa:	00 00 00 
  802bfd:	be bc 00 00 00       	mov    $0xbc,%esi
  802c02:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  802c09:	00 00 00 
  802c0c:	b8 00 00 00 00       	mov    $0x0,%eax
  802c11:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802c18:	00 00 00 
  802c1b:	41 ff d0             	callq  *%r8
  802c1e:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802c25:	00 00 00 
  802c28:	48 8b 00             	mov    (%rax),%rax
  802c2b:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802c32:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c35:	48 89 d6             	mov    %rdx,%rsi
  802c38:	89 c7                	mov    %eax,%edi
  802c3a:	48 b8 98 23 80 00 00 	movabs $0x802398,%rax
  802c41:	00 00 00 
  802c44:	ff d0                	callq  *%rax
  802c46:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802c49:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802c4d:	79 30                	jns    802c7f <fork+0x1f3>
  802c4f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802c52:	89 c1                	mov    %eax,%ecx
  802c54:	48 ba e8 5d 80 00 00 	movabs $0x805de8,%rdx
  802c5b:	00 00 00 
  802c5e:	be c0 00 00 00       	mov    $0xc0,%esi
  802c63:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  802c6a:	00 00 00 
  802c6d:	b8 00 00 00 00       	mov    $0x0,%eax
  802c72:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802c79:	00 00 00 
  802c7c:	41 ff d0             	callq  *%r8
  802c7f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c82:	be 02 00 00 00       	mov    $0x2,%esi
  802c87:	89 c7                	mov    %eax,%edi
  802c89:	48 b8 03 23 80 00 00 	movabs $0x802303,%rax
  802c90:	00 00 00 
  802c93:	ff d0                	callq  *%rax
  802c95:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802c98:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802c9c:	79 30                	jns    802cce <fork+0x242>
  802c9e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802ca1:	89 c1                	mov    %eax,%ecx
  802ca3:	48 ba 07 5e 80 00 00 	movabs $0x805e07,%rdx
  802caa:	00 00 00 
  802cad:	be c5 00 00 00       	mov    $0xc5,%esi
  802cb2:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  802cb9:	00 00 00 
  802cbc:	b8 00 00 00 00       	mov    $0x0,%eax
  802cc1:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802cc8:	00 00 00 
  802ccb:	41 ff d0             	callq  *%r8
  802cce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cd1:	c9                   	leaveq 
  802cd2:	c3                   	retq   

0000000000802cd3 <sfork>:
  802cd3:	55                   	push   %rbp
  802cd4:	48 89 e5             	mov    %rsp,%rbp
  802cd7:	48 ba 1e 5e 80 00 00 	movabs $0x805e1e,%rdx
  802cde:	00 00 00 
  802ce1:	be d2 00 00 00       	mov    $0xd2,%esi
  802ce6:	48 bf 51 5d 80 00 00 	movabs $0x805d51,%rdi
  802ced:	00 00 00 
  802cf0:	b8 00 00 00 00       	mov    $0x0,%eax
  802cf5:	48 b9 f1 0a 80 00 00 	movabs $0x800af1,%rcx
  802cfc:	00 00 00 
  802cff:	ff d1                	callq  *%rcx

0000000000802d01 <ipc_recv>:
  802d01:	55                   	push   %rbp
  802d02:	48 89 e5             	mov    %rsp,%rbp
  802d05:	48 83 ec 30          	sub    $0x30,%rsp
  802d09:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d0d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d11:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802d15:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802d1a:	75 0e                	jne    802d2a <ipc_recv+0x29>
  802d1c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802d23:	00 00 00 
  802d26:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802d2a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d2e:	48 89 c7             	mov    %rax,%rdi
  802d31:	48 b8 37 24 80 00 00 	movabs $0x802437,%rax
  802d38:	00 00 00 
  802d3b:	ff d0                	callq  *%rax
  802d3d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d40:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d44:	79 27                	jns    802d6d <ipc_recv+0x6c>
  802d46:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802d4b:	74 0a                	je     802d57 <ipc_recv+0x56>
  802d4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d51:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802d57:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802d5c:	74 0a                	je     802d68 <ipc_recv+0x67>
  802d5e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d62:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802d68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d6b:	eb 53                	jmp    802dc0 <ipc_recv+0xbf>
  802d6d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802d72:	74 19                	je     802d8d <ipc_recv+0x8c>
  802d74:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802d7b:	00 00 00 
  802d7e:	48 8b 00             	mov    (%rax),%rax
  802d81:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  802d87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d8b:	89 10                	mov    %edx,(%rax)
  802d8d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802d92:	74 19                	je     802dad <ipc_recv+0xac>
  802d94:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802d9b:	00 00 00 
  802d9e:	48 8b 00             	mov    (%rax),%rax
  802da1:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  802da7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802dab:	89 10                	mov    %edx,(%rax)
  802dad:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802db4:	00 00 00 
  802db7:	48 8b 00             	mov    (%rax),%rax
  802dba:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  802dc0:	c9                   	leaveq 
  802dc1:	c3                   	retq   

0000000000802dc2 <ipc_send>:
  802dc2:	55                   	push   %rbp
  802dc3:	48 89 e5             	mov    %rsp,%rbp
  802dc6:	48 83 ec 30          	sub    $0x30,%rsp
  802dca:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802dcd:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802dd0:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802dd4:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802dd7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802ddc:	75 10                	jne    802dee <ipc_send+0x2c>
  802dde:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802de5:	00 00 00 
  802de8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802dec:	eb 0e                	jmp    802dfc <ipc_send+0x3a>
  802dee:	eb 0c                	jmp    802dfc <ipc_send+0x3a>
  802df0:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  802df7:	00 00 00 
  802dfa:	ff d0                	callq  *%rax
  802dfc:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802dff:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802e02:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e06:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e09:	89 c7                	mov    %eax,%edi
  802e0b:	48 b8 e2 23 80 00 00 	movabs $0x8023e2,%rax
  802e12:	00 00 00 
  802e15:	ff d0                	callq  *%rax
  802e17:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e1a:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  802e1e:	74 d0                	je     802df0 <ipc_send+0x2e>
  802e20:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e24:	79 30                	jns    802e56 <ipc_send+0x94>
  802e26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e29:	89 c1                	mov    %eax,%ecx
  802e2b:	48 ba 34 5e 80 00 00 	movabs $0x805e34,%rdx
  802e32:	00 00 00 
  802e35:	be 44 00 00 00       	mov    $0x44,%esi
  802e3a:	48 bf 4a 5e 80 00 00 	movabs $0x805e4a,%rdi
  802e41:	00 00 00 
  802e44:	b8 00 00 00 00       	mov    $0x0,%eax
  802e49:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  802e50:	00 00 00 
  802e53:	41 ff d0             	callq  *%r8
  802e56:	c9                   	leaveq 
  802e57:	c3                   	retq   

0000000000802e58 <ipc_find_env>:
  802e58:	55                   	push   %rbp
  802e59:	48 89 e5             	mov    %rsp,%rbp
  802e5c:	48 83 ec 14          	sub    $0x14,%rsp
  802e60:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e63:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802e6a:	eb 4e                	jmp    802eba <ipc_find_env+0x62>
  802e6c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802e73:	00 00 00 
  802e76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e79:	48 98                	cltq   
  802e7b:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802e82:	48 01 d0             	add    %rdx,%rax
  802e85:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802e8b:	8b 00                	mov    (%rax),%eax
  802e8d:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802e90:	75 24                	jne    802eb6 <ipc_find_env+0x5e>
  802e92:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802e99:	00 00 00 
  802e9c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e9f:	48 98                	cltq   
  802ea1:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802ea8:	48 01 d0             	add    %rdx,%rax
  802eab:	48 05 c0 00 00 00    	add    $0xc0,%rax
  802eb1:	8b 40 08             	mov    0x8(%rax),%eax
  802eb4:	eb 12                	jmp    802ec8 <ipc_find_env+0x70>
  802eb6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802eba:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802ec1:	7e a9                	jle    802e6c <ipc_find_env+0x14>
  802ec3:	b8 00 00 00 00       	mov    $0x0,%eax
  802ec8:	c9                   	leaveq 
  802ec9:	c3                   	retq   

0000000000802eca <fd2num>:
  802eca:	55                   	push   %rbp
  802ecb:	48 89 e5             	mov    %rsp,%rbp
  802ece:	48 83 ec 08          	sub    $0x8,%rsp
  802ed2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ed6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802eda:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802ee1:	ff ff ff 
  802ee4:	48 01 d0             	add    %rdx,%rax
  802ee7:	48 c1 e8 0c          	shr    $0xc,%rax
  802eeb:	c9                   	leaveq 
  802eec:	c3                   	retq   

0000000000802eed <fd2data>:
  802eed:	55                   	push   %rbp
  802eee:	48 89 e5             	mov    %rsp,%rbp
  802ef1:	48 83 ec 08          	sub    $0x8,%rsp
  802ef5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ef9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802efd:	48 89 c7             	mov    %rax,%rdi
  802f00:	48 b8 ca 2e 80 00 00 	movabs $0x802eca,%rax
  802f07:	00 00 00 
  802f0a:	ff d0                	callq  *%rax
  802f0c:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802f12:	48 c1 e0 0c          	shl    $0xc,%rax
  802f16:	c9                   	leaveq 
  802f17:	c3                   	retq   

0000000000802f18 <fd_alloc>:
  802f18:	55                   	push   %rbp
  802f19:	48 89 e5             	mov    %rsp,%rbp
  802f1c:	48 83 ec 18          	sub    $0x18,%rsp
  802f20:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f24:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802f2b:	eb 6b                	jmp    802f98 <fd_alloc+0x80>
  802f2d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f30:	48 98                	cltq   
  802f32:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802f38:	48 c1 e0 0c          	shl    $0xc,%rax
  802f3c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802f40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f44:	48 c1 e8 15          	shr    $0x15,%rax
  802f48:	48 89 c2             	mov    %rax,%rdx
  802f4b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802f52:	01 00 00 
  802f55:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f59:	83 e0 01             	and    $0x1,%eax
  802f5c:	48 85 c0             	test   %rax,%rax
  802f5f:	74 21                	je     802f82 <fd_alloc+0x6a>
  802f61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f65:	48 c1 e8 0c          	shr    $0xc,%rax
  802f69:	48 89 c2             	mov    %rax,%rdx
  802f6c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f73:	01 00 00 
  802f76:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f7a:	83 e0 01             	and    $0x1,%eax
  802f7d:	48 85 c0             	test   %rax,%rax
  802f80:	75 12                	jne    802f94 <fd_alloc+0x7c>
  802f82:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f86:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f8a:	48 89 10             	mov    %rdx,(%rax)
  802f8d:	b8 00 00 00 00       	mov    $0x0,%eax
  802f92:	eb 1a                	jmp    802fae <fd_alloc+0x96>
  802f94:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802f98:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802f9c:	7e 8f                	jle    802f2d <fd_alloc+0x15>
  802f9e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fa2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802fa9:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802fae:	c9                   	leaveq 
  802faf:	c3                   	retq   

0000000000802fb0 <fd_lookup>:
  802fb0:	55                   	push   %rbp
  802fb1:	48 89 e5             	mov    %rsp,%rbp
  802fb4:	48 83 ec 20          	sub    $0x20,%rsp
  802fb8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fbb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fbf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802fc3:	78 06                	js     802fcb <fd_lookup+0x1b>
  802fc5:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802fc9:	7e 07                	jle    802fd2 <fd_lookup+0x22>
  802fcb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802fd0:	eb 6c                	jmp    80303e <fd_lookup+0x8e>
  802fd2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fd5:	48 98                	cltq   
  802fd7:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802fdd:	48 c1 e0 0c          	shl    $0xc,%rax
  802fe1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802fe5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fe9:	48 c1 e8 15          	shr    $0x15,%rax
  802fed:	48 89 c2             	mov    %rax,%rdx
  802ff0:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802ff7:	01 00 00 
  802ffa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ffe:	83 e0 01             	and    $0x1,%eax
  803001:	48 85 c0             	test   %rax,%rax
  803004:	74 21                	je     803027 <fd_lookup+0x77>
  803006:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80300a:	48 c1 e8 0c          	shr    $0xc,%rax
  80300e:	48 89 c2             	mov    %rax,%rdx
  803011:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803018:	01 00 00 
  80301b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80301f:	83 e0 01             	and    $0x1,%eax
  803022:	48 85 c0             	test   %rax,%rax
  803025:	75 07                	jne    80302e <fd_lookup+0x7e>
  803027:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80302c:	eb 10                	jmp    80303e <fd_lookup+0x8e>
  80302e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803032:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803036:	48 89 10             	mov    %rdx,(%rax)
  803039:	b8 00 00 00 00       	mov    $0x0,%eax
  80303e:	c9                   	leaveq 
  80303f:	c3                   	retq   

0000000000803040 <fd_close>:
  803040:	55                   	push   %rbp
  803041:	48 89 e5             	mov    %rsp,%rbp
  803044:	48 83 ec 30          	sub    $0x30,%rsp
  803048:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80304c:	89 f0                	mov    %esi,%eax
  80304e:	88 45 d4             	mov    %al,-0x2c(%rbp)
  803051:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803055:	48 89 c7             	mov    %rax,%rdi
  803058:	48 b8 ca 2e 80 00 00 	movabs $0x802eca,%rax
  80305f:	00 00 00 
  803062:	ff d0                	callq  *%rax
  803064:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803068:	48 89 d6             	mov    %rdx,%rsi
  80306b:	89 c7                	mov    %eax,%edi
  80306d:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  803074:	00 00 00 
  803077:	ff d0                	callq  *%rax
  803079:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80307c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803080:	78 0a                	js     80308c <fd_close+0x4c>
  803082:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803086:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80308a:	74 12                	je     80309e <fd_close+0x5e>
  80308c:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  803090:	74 05                	je     803097 <fd_close+0x57>
  803092:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803095:	eb 05                	jmp    80309c <fd_close+0x5c>
  803097:	b8 00 00 00 00       	mov    $0x0,%eax
  80309c:	eb 69                	jmp    803107 <fd_close+0xc7>
  80309e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8030a2:	8b 00                	mov    (%rax),%eax
  8030a4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8030a8:	48 89 d6             	mov    %rdx,%rsi
  8030ab:	89 c7                	mov    %eax,%edi
  8030ad:	48 b8 09 31 80 00 00 	movabs $0x803109,%rax
  8030b4:	00 00 00 
  8030b7:	ff d0                	callq  *%rax
  8030b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030c0:	78 2a                	js     8030ec <fd_close+0xac>
  8030c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030c6:	48 8b 40 20          	mov    0x20(%rax),%rax
  8030ca:	48 85 c0             	test   %rax,%rax
  8030cd:	74 16                	je     8030e5 <fd_close+0xa5>
  8030cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030d3:	48 8b 40 20          	mov    0x20(%rax),%rax
  8030d7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8030db:	48 89 d7             	mov    %rdx,%rdi
  8030de:	ff d0                	callq  *%rax
  8030e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030e3:	eb 07                	jmp    8030ec <fd_close+0xac>
  8030e5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8030ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8030f0:	48 89 c6             	mov    %rax,%rsi
  8030f3:	bf 00 00 00 00       	mov    $0x0,%edi
  8030f8:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8030ff:	00 00 00 
  803102:	ff d0                	callq  *%rax
  803104:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803107:	c9                   	leaveq 
  803108:	c3                   	retq   

0000000000803109 <dev_lookup>:
  803109:	55                   	push   %rbp
  80310a:	48 89 e5             	mov    %rsp,%rbp
  80310d:	48 83 ec 20          	sub    $0x20,%rsp
  803111:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803114:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803118:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80311f:	eb 41                	jmp    803162 <dev_lookup+0x59>
  803121:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  803128:	00 00 00 
  80312b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80312e:	48 63 d2             	movslq %edx,%rdx
  803131:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803135:	8b 00                	mov    (%rax),%eax
  803137:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80313a:	75 22                	jne    80315e <dev_lookup+0x55>
  80313c:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  803143:	00 00 00 
  803146:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803149:	48 63 d2             	movslq %edx,%rdx
  80314c:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  803150:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803154:	48 89 10             	mov    %rdx,(%rax)
  803157:	b8 00 00 00 00       	mov    $0x0,%eax
  80315c:	eb 60                	jmp    8031be <dev_lookup+0xb5>
  80315e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803162:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  803169:	00 00 00 
  80316c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80316f:	48 63 d2             	movslq %edx,%rdx
  803172:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803176:	48 85 c0             	test   %rax,%rax
  803179:	75 a6                	jne    803121 <dev_lookup+0x18>
  80317b:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803182:	00 00 00 
  803185:	48 8b 00             	mov    (%rax),%rax
  803188:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80318e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803191:	89 c6                	mov    %eax,%esi
  803193:	48 bf 58 5e 80 00 00 	movabs $0x805e58,%rdi
  80319a:	00 00 00 
  80319d:	b8 00 00 00 00       	mov    $0x0,%eax
  8031a2:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  8031a9:	00 00 00 
  8031ac:	ff d1                	callq  *%rcx
  8031ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031b2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8031b9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8031be:	c9                   	leaveq 
  8031bf:	c3                   	retq   

00000000008031c0 <close>:
  8031c0:	55                   	push   %rbp
  8031c1:	48 89 e5             	mov    %rsp,%rbp
  8031c4:	48 83 ec 20          	sub    $0x20,%rsp
  8031c8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8031cb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8031cf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031d2:	48 89 d6             	mov    %rdx,%rsi
  8031d5:	89 c7                	mov    %eax,%edi
  8031d7:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  8031de:	00 00 00 
  8031e1:	ff d0                	callq  *%rax
  8031e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031ea:	79 05                	jns    8031f1 <close+0x31>
  8031ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031ef:	eb 18                	jmp    803209 <close+0x49>
  8031f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031f5:	be 01 00 00 00       	mov    $0x1,%esi
  8031fa:	48 89 c7             	mov    %rax,%rdi
  8031fd:	48 b8 40 30 80 00 00 	movabs $0x803040,%rax
  803204:	00 00 00 
  803207:	ff d0                	callq  *%rax
  803209:	c9                   	leaveq 
  80320a:	c3                   	retq   

000000000080320b <close_all>:
  80320b:	55                   	push   %rbp
  80320c:	48 89 e5             	mov    %rsp,%rbp
  80320f:	48 83 ec 10          	sub    $0x10,%rsp
  803213:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80321a:	eb 15                	jmp    803231 <close_all+0x26>
  80321c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80321f:	89 c7                	mov    %eax,%edi
  803221:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803228:	00 00 00 
  80322b:	ff d0                	callq  *%rax
  80322d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803231:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  803235:	7e e5                	jle    80321c <close_all+0x11>
  803237:	c9                   	leaveq 
  803238:	c3                   	retq   

0000000000803239 <dup>:
  803239:	55                   	push   %rbp
  80323a:	48 89 e5             	mov    %rsp,%rbp
  80323d:	48 83 ec 40          	sub    $0x40,%rsp
  803241:	89 7d cc             	mov    %edi,-0x34(%rbp)
  803244:	89 75 c8             	mov    %esi,-0x38(%rbp)
  803247:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80324b:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80324e:	48 89 d6             	mov    %rdx,%rsi
  803251:	89 c7                	mov    %eax,%edi
  803253:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  80325a:	00 00 00 
  80325d:	ff d0                	callq  *%rax
  80325f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803262:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803266:	79 08                	jns    803270 <dup+0x37>
  803268:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80326b:	e9 70 01 00 00       	jmpq   8033e0 <dup+0x1a7>
  803270:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803273:	89 c7                	mov    %eax,%edi
  803275:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  80327c:	00 00 00 
  80327f:	ff d0                	callq  *%rax
  803281:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803284:	48 98                	cltq   
  803286:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80328c:	48 c1 e0 0c          	shl    $0xc,%rax
  803290:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803294:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803298:	48 89 c7             	mov    %rax,%rdi
  80329b:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  8032a2:	00 00 00 
  8032a5:	ff d0                	callq  *%rax
  8032a7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8032ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032af:	48 89 c7             	mov    %rax,%rdi
  8032b2:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  8032b9:	00 00 00 
  8032bc:	ff d0                	callq  *%rax
  8032be:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8032c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032c6:	48 c1 e8 15          	shr    $0x15,%rax
  8032ca:	48 89 c2             	mov    %rax,%rdx
  8032cd:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8032d4:	01 00 00 
  8032d7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8032db:	83 e0 01             	and    $0x1,%eax
  8032de:	48 85 c0             	test   %rax,%rax
  8032e1:	74 73                	je     803356 <dup+0x11d>
  8032e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032e7:	48 c1 e8 0c          	shr    $0xc,%rax
  8032eb:	48 89 c2             	mov    %rax,%rdx
  8032ee:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8032f5:	01 00 00 
  8032f8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8032fc:	83 e0 01             	and    $0x1,%eax
  8032ff:	48 85 c0             	test   %rax,%rax
  803302:	74 52                	je     803356 <dup+0x11d>
  803304:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803308:	48 c1 e8 0c          	shr    $0xc,%rax
  80330c:	48 89 c2             	mov    %rax,%rdx
  80330f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803316:	01 00 00 
  803319:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80331d:	25 07 0e 00 00       	and    $0xe07,%eax
  803322:	89 c1                	mov    %eax,%ecx
  803324:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803328:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80332c:	41 89 c8             	mov    %ecx,%r8d
  80332f:	48 89 d1             	mov    %rdx,%rcx
  803332:	ba 00 00 00 00       	mov    $0x0,%edx
  803337:	48 89 c6             	mov    %rax,%rsi
  80333a:	bf 00 00 00 00       	mov    $0x0,%edi
  80333f:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  803346:	00 00 00 
  803349:	ff d0                	callq  *%rax
  80334b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80334e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803352:	79 02                	jns    803356 <dup+0x11d>
  803354:	eb 57                	jmp    8033ad <dup+0x174>
  803356:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80335a:	48 c1 e8 0c          	shr    $0xc,%rax
  80335e:	48 89 c2             	mov    %rax,%rdx
  803361:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803368:	01 00 00 
  80336b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80336f:	25 07 0e 00 00       	and    $0xe07,%eax
  803374:	89 c1                	mov    %eax,%ecx
  803376:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80337a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80337e:	41 89 c8             	mov    %ecx,%r8d
  803381:	48 89 d1             	mov    %rdx,%rcx
  803384:	ba 00 00 00 00       	mov    $0x0,%edx
  803389:	48 89 c6             	mov    %rax,%rsi
  80338c:	bf 00 00 00 00       	mov    $0x0,%edi
  803391:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  803398:	00 00 00 
  80339b:	ff d0                	callq  *%rax
  80339d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033a4:	79 02                	jns    8033a8 <dup+0x16f>
  8033a6:	eb 05                	jmp    8033ad <dup+0x174>
  8033a8:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8033ab:	eb 33                	jmp    8033e0 <dup+0x1a7>
  8033ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033b1:	48 89 c6             	mov    %rax,%rsi
  8033b4:	bf 00 00 00 00       	mov    $0x0,%edi
  8033b9:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8033c0:	00 00 00 
  8033c3:	ff d0                	callq  *%rax
  8033c5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033c9:	48 89 c6             	mov    %rax,%rsi
  8033cc:	bf 00 00 00 00       	mov    $0x0,%edi
  8033d1:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8033d8:	00 00 00 
  8033db:	ff d0                	callq  *%rax
  8033dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033e0:	c9                   	leaveq 
  8033e1:	c3                   	retq   

00000000008033e2 <read>:
  8033e2:	55                   	push   %rbp
  8033e3:	48 89 e5             	mov    %rsp,%rbp
  8033e6:	48 83 ec 40          	sub    $0x40,%rsp
  8033ea:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8033ed:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8033f1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8033f5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8033f9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8033fc:	48 89 d6             	mov    %rdx,%rsi
  8033ff:	89 c7                	mov    %eax,%edi
  803401:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  803408:	00 00 00 
  80340b:	ff d0                	callq  *%rax
  80340d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803410:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803414:	78 24                	js     80343a <read+0x58>
  803416:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80341a:	8b 00                	mov    (%rax),%eax
  80341c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803420:	48 89 d6             	mov    %rdx,%rsi
  803423:	89 c7                	mov    %eax,%edi
  803425:	48 b8 09 31 80 00 00 	movabs $0x803109,%rax
  80342c:	00 00 00 
  80342f:	ff d0                	callq  *%rax
  803431:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803434:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803438:	79 05                	jns    80343f <read+0x5d>
  80343a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80343d:	eb 76                	jmp    8034b5 <read+0xd3>
  80343f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803443:	8b 40 08             	mov    0x8(%rax),%eax
  803446:	83 e0 03             	and    $0x3,%eax
  803449:	83 f8 01             	cmp    $0x1,%eax
  80344c:	75 3a                	jne    803488 <read+0xa6>
  80344e:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803455:	00 00 00 
  803458:	48 8b 00             	mov    (%rax),%rax
  80345b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803461:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803464:	89 c6                	mov    %eax,%esi
  803466:	48 bf 77 5e 80 00 00 	movabs $0x805e77,%rdi
  80346d:	00 00 00 
  803470:	b8 00 00 00 00       	mov    $0x0,%eax
  803475:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  80347c:	00 00 00 
  80347f:	ff d1                	callq  *%rcx
  803481:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803486:	eb 2d                	jmp    8034b5 <read+0xd3>
  803488:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80348c:	48 8b 40 10          	mov    0x10(%rax),%rax
  803490:	48 85 c0             	test   %rax,%rax
  803493:	75 07                	jne    80349c <read+0xba>
  803495:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80349a:	eb 19                	jmp    8034b5 <read+0xd3>
  80349c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034a0:	48 8b 40 10          	mov    0x10(%rax),%rax
  8034a4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8034a8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8034ac:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8034b0:	48 89 cf             	mov    %rcx,%rdi
  8034b3:	ff d0                	callq  *%rax
  8034b5:	c9                   	leaveq 
  8034b6:	c3                   	retq   

00000000008034b7 <readn>:
  8034b7:	55                   	push   %rbp
  8034b8:	48 89 e5             	mov    %rsp,%rbp
  8034bb:	48 83 ec 30          	sub    $0x30,%rsp
  8034bf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034c2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034c6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8034ca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8034d1:	eb 49                	jmp    80351c <readn+0x65>
  8034d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d6:	48 98                	cltq   
  8034d8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8034dc:	48 29 c2             	sub    %rax,%rdx
  8034df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034e2:	48 63 c8             	movslq %eax,%rcx
  8034e5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8034e9:	48 01 c1             	add    %rax,%rcx
  8034ec:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034ef:	48 89 ce             	mov    %rcx,%rsi
  8034f2:	89 c7                	mov    %eax,%edi
  8034f4:	48 b8 e2 33 80 00 00 	movabs $0x8033e2,%rax
  8034fb:	00 00 00 
  8034fe:	ff d0                	callq  *%rax
  803500:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803503:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803507:	79 05                	jns    80350e <readn+0x57>
  803509:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80350c:	eb 1c                	jmp    80352a <readn+0x73>
  80350e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803512:	75 02                	jne    803516 <readn+0x5f>
  803514:	eb 11                	jmp    803527 <readn+0x70>
  803516:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803519:	01 45 fc             	add    %eax,-0x4(%rbp)
  80351c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80351f:	48 98                	cltq   
  803521:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803525:	72 ac                	jb     8034d3 <readn+0x1c>
  803527:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80352a:	c9                   	leaveq 
  80352b:	c3                   	retq   

000000000080352c <write>:
  80352c:	55                   	push   %rbp
  80352d:	48 89 e5             	mov    %rsp,%rbp
  803530:	48 83 ec 40          	sub    $0x40,%rsp
  803534:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803537:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80353b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80353f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803543:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803546:	48 89 d6             	mov    %rdx,%rsi
  803549:	89 c7                	mov    %eax,%edi
  80354b:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  803552:	00 00 00 
  803555:	ff d0                	callq  *%rax
  803557:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80355a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80355e:	78 24                	js     803584 <write+0x58>
  803560:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803564:	8b 00                	mov    (%rax),%eax
  803566:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80356a:	48 89 d6             	mov    %rdx,%rsi
  80356d:	89 c7                	mov    %eax,%edi
  80356f:	48 b8 09 31 80 00 00 	movabs $0x803109,%rax
  803576:	00 00 00 
  803579:	ff d0                	callq  *%rax
  80357b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80357e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803582:	79 05                	jns    803589 <write+0x5d>
  803584:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803587:	eb 75                	jmp    8035fe <write+0xd2>
  803589:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80358d:	8b 40 08             	mov    0x8(%rax),%eax
  803590:	83 e0 03             	and    $0x3,%eax
  803593:	85 c0                	test   %eax,%eax
  803595:	75 3a                	jne    8035d1 <write+0xa5>
  803597:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80359e:	00 00 00 
  8035a1:	48 8b 00             	mov    (%rax),%rax
  8035a4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8035aa:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8035ad:	89 c6                	mov    %eax,%esi
  8035af:	48 bf 93 5e 80 00 00 	movabs $0x805e93,%rdi
  8035b6:	00 00 00 
  8035b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8035be:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  8035c5:	00 00 00 
  8035c8:	ff d1                	callq  *%rcx
  8035ca:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8035cf:	eb 2d                	jmp    8035fe <write+0xd2>
  8035d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035d5:	48 8b 40 18          	mov    0x18(%rax),%rax
  8035d9:	48 85 c0             	test   %rax,%rax
  8035dc:	75 07                	jne    8035e5 <write+0xb9>
  8035de:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8035e3:	eb 19                	jmp    8035fe <write+0xd2>
  8035e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035e9:	48 8b 40 18          	mov    0x18(%rax),%rax
  8035ed:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8035f1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8035f5:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8035f9:	48 89 cf             	mov    %rcx,%rdi
  8035fc:	ff d0                	callq  *%rax
  8035fe:	c9                   	leaveq 
  8035ff:	c3                   	retq   

0000000000803600 <seek>:
  803600:	55                   	push   %rbp
  803601:	48 89 e5             	mov    %rsp,%rbp
  803604:	48 83 ec 18          	sub    $0x18,%rsp
  803608:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80360b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80360e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803612:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803615:	48 89 d6             	mov    %rdx,%rsi
  803618:	89 c7                	mov    %eax,%edi
  80361a:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  803621:	00 00 00 
  803624:	ff d0                	callq  *%rax
  803626:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803629:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80362d:	79 05                	jns    803634 <seek+0x34>
  80362f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803632:	eb 0f                	jmp    803643 <seek+0x43>
  803634:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803638:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80363b:	89 50 04             	mov    %edx,0x4(%rax)
  80363e:	b8 00 00 00 00       	mov    $0x0,%eax
  803643:	c9                   	leaveq 
  803644:	c3                   	retq   

0000000000803645 <ftruncate>:
  803645:	55                   	push   %rbp
  803646:	48 89 e5             	mov    %rsp,%rbp
  803649:	48 83 ec 30          	sub    $0x30,%rsp
  80364d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803650:	89 75 d8             	mov    %esi,-0x28(%rbp)
  803653:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803657:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80365a:	48 89 d6             	mov    %rdx,%rsi
  80365d:	89 c7                	mov    %eax,%edi
  80365f:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  803666:	00 00 00 
  803669:	ff d0                	callq  *%rax
  80366b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80366e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803672:	78 24                	js     803698 <ftruncate+0x53>
  803674:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803678:	8b 00                	mov    (%rax),%eax
  80367a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80367e:	48 89 d6             	mov    %rdx,%rsi
  803681:	89 c7                	mov    %eax,%edi
  803683:	48 b8 09 31 80 00 00 	movabs $0x803109,%rax
  80368a:	00 00 00 
  80368d:	ff d0                	callq  *%rax
  80368f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803692:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803696:	79 05                	jns    80369d <ftruncate+0x58>
  803698:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80369b:	eb 72                	jmp    80370f <ftruncate+0xca>
  80369d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036a1:	8b 40 08             	mov    0x8(%rax),%eax
  8036a4:	83 e0 03             	and    $0x3,%eax
  8036a7:	85 c0                	test   %eax,%eax
  8036a9:	75 3a                	jne    8036e5 <ftruncate+0xa0>
  8036ab:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8036b2:	00 00 00 
  8036b5:	48 8b 00             	mov    (%rax),%rax
  8036b8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8036be:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8036c1:	89 c6                	mov    %eax,%esi
  8036c3:	48 bf b0 5e 80 00 00 	movabs $0x805eb0,%rdi
  8036ca:	00 00 00 
  8036cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8036d2:	48 b9 2a 0d 80 00 00 	movabs $0x800d2a,%rcx
  8036d9:	00 00 00 
  8036dc:	ff d1                	callq  *%rcx
  8036de:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8036e3:	eb 2a                	jmp    80370f <ftruncate+0xca>
  8036e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036e9:	48 8b 40 30          	mov    0x30(%rax),%rax
  8036ed:	48 85 c0             	test   %rax,%rax
  8036f0:	75 07                	jne    8036f9 <ftruncate+0xb4>
  8036f2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8036f7:	eb 16                	jmp    80370f <ftruncate+0xca>
  8036f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036fd:	48 8b 40 30          	mov    0x30(%rax),%rax
  803701:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803705:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  803708:	89 ce                	mov    %ecx,%esi
  80370a:	48 89 d7             	mov    %rdx,%rdi
  80370d:	ff d0                	callq  *%rax
  80370f:	c9                   	leaveq 
  803710:	c3                   	retq   

0000000000803711 <fstat>:
  803711:	55                   	push   %rbp
  803712:	48 89 e5             	mov    %rsp,%rbp
  803715:	48 83 ec 30          	sub    $0x30,%rsp
  803719:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80371c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803720:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803724:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803727:	48 89 d6             	mov    %rdx,%rsi
  80372a:	89 c7                	mov    %eax,%edi
  80372c:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  803733:	00 00 00 
  803736:	ff d0                	callq  *%rax
  803738:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80373b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80373f:	78 24                	js     803765 <fstat+0x54>
  803741:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803745:	8b 00                	mov    (%rax),%eax
  803747:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80374b:	48 89 d6             	mov    %rdx,%rsi
  80374e:	89 c7                	mov    %eax,%edi
  803750:	48 b8 09 31 80 00 00 	movabs $0x803109,%rax
  803757:	00 00 00 
  80375a:	ff d0                	callq  *%rax
  80375c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80375f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803763:	79 05                	jns    80376a <fstat+0x59>
  803765:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803768:	eb 5e                	jmp    8037c8 <fstat+0xb7>
  80376a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80376e:	48 8b 40 28          	mov    0x28(%rax),%rax
  803772:	48 85 c0             	test   %rax,%rax
  803775:	75 07                	jne    80377e <fstat+0x6d>
  803777:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80377c:	eb 4a                	jmp    8037c8 <fstat+0xb7>
  80377e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803782:	c6 00 00             	movb   $0x0,(%rax)
  803785:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803789:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  803790:	00 00 00 
  803793:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803797:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80379e:	00 00 00 
  8037a1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8037a5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037a9:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8037b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037b4:	48 8b 40 28          	mov    0x28(%rax),%rax
  8037b8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8037bc:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8037c0:	48 89 ce             	mov    %rcx,%rsi
  8037c3:	48 89 d7             	mov    %rdx,%rdi
  8037c6:	ff d0                	callq  *%rax
  8037c8:	c9                   	leaveq 
  8037c9:	c3                   	retq   

00000000008037ca <stat>:
  8037ca:	55                   	push   %rbp
  8037cb:	48 89 e5             	mov    %rsp,%rbp
  8037ce:	48 83 ec 20          	sub    $0x20,%rsp
  8037d2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8037d6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037de:	be 00 00 00 00       	mov    $0x0,%esi
  8037e3:	48 89 c7             	mov    %rax,%rdi
  8037e6:	48 b8 b8 38 80 00 00 	movabs $0x8038b8,%rax
  8037ed:	00 00 00 
  8037f0:	ff d0                	callq  *%rax
  8037f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037f9:	79 05                	jns    803800 <stat+0x36>
  8037fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037fe:	eb 2f                	jmp    80382f <stat+0x65>
  803800:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803804:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803807:	48 89 d6             	mov    %rdx,%rsi
  80380a:	89 c7                	mov    %eax,%edi
  80380c:	48 b8 11 37 80 00 00 	movabs $0x803711,%rax
  803813:	00 00 00 
  803816:	ff d0                	callq  *%rax
  803818:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80381b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80381e:	89 c7                	mov    %eax,%edi
  803820:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803827:	00 00 00 
  80382a:	ff d0                	callq  *%rax
  80382c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80382f:	c9                   	leaveq 
  803830:	c3                   	retq   

0000000000803831 <fsipc>:
  803831:	55                   	push   %rbp
  803832:	48 89 e5             	mov    %rsp,%rbp
  803835:	48 83 ec 10          	sub    $0x10,%rsp
  803839:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80383c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803840:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  803847:	00 00 00 
  80384a:	8b 00                	mov    (%rax),%eax
  80384c:	85 c0                	test   %eax,%eax
  80384e:	75 1d                	jne    80386d <fsipc+0x3c>
  803850:	bf 01 00 00 00       	mov    $0x1,%edi
  803855:	48 b8 58 2e 80 00 00 	movabs $0x802e58,%rax
  80385c:	00 00 00 
  80385f:	ff d0                	callq  *%rax
  803861:	48 ba 08 90 80 00 00 	movabs $0x809008,%rdx
  803868:	00 00 00 
  80386b:	89 02                	mov    %eax,(%rdx)
  80386d:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  803874:	00 00 00 
  803877:	8b 00                	mov    (%rax),%eax
  803879:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80387c:	b9 07 00 00 00       	mov    $0x7,%ecx
  803881:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  803888:	00 00 00 
  80388b:	89 c7                	mov    %eax,%edi
  80388d:	48 b8 c2 2d 80 00 00 	movabs $0x802dc2,%rax
  803894:	00 00 00 
  803897:	ff d0                	callq  *%rax
  803899:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80389d:	ba 00 00 00 00       	mov    $0x0,%edx
  8038a2:	48 89 c6             	mov    %rax,%rsi
  8038a5:	bf 00 00 00 00       	mov    $0x0,%edi
  8038aa:	48 b8 01 2d 80 00 00 	movabs $0x802d01,%rax
  8038b1:	00 00 00 
  8038b4:	ff d0                	callq  *%rax
  8038b6:	c9                   	leaveq 
  8038b7:	c3                   	retq   

00000000008038b8 <open>:
  8038b8:	55                   	push   %rbp
  8038b9:	48 89 e5             	mov    %rsp,%rbp
  8038bc:	48 83 ec 20          	sub    $0x20,%rsp
  8038c0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8038c4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8038c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038cb:	48 89 c7             	mov    %rax,%rdi
  8038ce:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  8038d5:	00 00 00 
  8038d8:	ff d0                	callq  *%rax
  8038da:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8038df:	7e 0a                	jle    8038eb <open+0x33>
  8038e1:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8038e6:	e9 a5 00 00 00       	jmpq   803990 <open+0xd8>
  8038eb:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8038ef:	48 89 c7             	mov    %rax,%rdi
  8038f2:	48 b8 18 2f 80 00 00 	movabs $0x802f18,%rax
  8038f9:	00 00 00 
  8038fc:	ff d0                	callq  *%rax
  8038fe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803901:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803905:	79 08                	jns    80390f <open+0x57>
  803907:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80390a:	e9 81 00 00 00       	jmpq   803990 <open+0xd8>
  80390f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803913:	48 89 c6             	mov    %rax,%rsi
  803916:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  80391d:	00 00 00 
  803920:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  803927:	00 00 00 
  80392a:	ff d0                	callq  *%rax
  80392c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803933:	00 00 00 
  803936:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803939:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80393f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803943:	48 89 c6             	mov    %rax,%rsi
  803946:	bf 01 00 00 00       	mov    $0x1,%edi
  80394b:	48 b8 31 38 80 00 00 	movabs $0x803831,%rax
  803952:	00 00 00 
  803955:	ff d0                	callq  *%rax
  803957:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80395a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80395e:	79 1d                	jns    80397d <open+0xc5>
  803960:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803964:	be 00 00 00 00       	mov    $0x0,%esi
  803969:	48 89 c7             	mov    %rax,%rdi
  80396c:	48 b8 40 30 80 00 00 	movabs $0x803040,%rax
  803973:	00 00 00 
  803976:	ff d0                	callq  *%rax
  803978:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80397b:	eb 13                	jmp    803990 <open+0xd8>
  80397d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803981:	48 89 c7             	mov    %rax,%rdi
  803984:	48 b8 ca 2e 80 00 00 	movabs $0x802eca,%rax
  80398b:	00 00 00 
  80398e:	ff d0                	callq  *%rax
  803990:	c9                   	leaveq 
  803991:	c3                   	retq   

0000000000803992 <devfile_flush>:
  803992:	55                   	push   %rbp
  803993:	48 89 e5             	mov    %rsp,%rbp
  803996:	48 83 ec 10          	sub    $0x10,%rsp
  80399a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80399e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039a2:	8b 50 0c             	mov    0xc(%rax),%edx
  8039a5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039ac:	00 00 00 
  8039af:	89 10                	mov    %edx,(%rax)
  8039b1:	be 00 00 00 00       	mov    $0x0,%esi
  8039b6:	bf 06 00 00 00       	mov    $0x6,%edi
  8039bb:	48 b8 31 38 80 00 00 	movabs $0x803831,%rax
  8039c2:	00 00 00 
  8039c5:	ff d0                	callq  *%rax
  8039c7:	c9                   	leaveq 
  8039c8:	c3                   	retq   

00000000008039c9 <devfile_read>:
  8039c9:	55                   	push   %rbp
  8039ca:	48 89 e5             	mov    %rsp,%rbp
  8039cd:	48 83 ec 30          	sub    $0x30,%rsp
  8039d1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8039d5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8039d9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8039dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039e1:	8b 50 0c             	mov    0xc(%rax),%edx
  8039e4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039eb:	00 00 00 
  8039ee:	89 10                	mov    %edx,(%rax)
  8039f0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039f7:	00 00 00 
  8039fa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8039fe:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803a02:	be 00 00 00 00       	mov    $0x0,%esi
  803a07:	bf 03 00 00 00       	mov    $0x3,%edi
  803a0c:	48 b8 31 38 80 00 00 	movabs $0x803831,%rax
  803a13:	00 00 00 
  803a16:	ff d0                	callq  *%rax
  803a18:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a1b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a1f:	79 08                	jns    803a29 <devfile_read+0x60>
  803a21:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a24:	e9 a4 00 00 00       	jmpq   803acd <devfile_read+0x104>
  803a29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a2c:	48 98                	cltq   
  803a2e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803a32:	76 35                	jbe    803a69 <devfile_read+0xa0>
  803a34:	48 b9 d6 5e 80 00 00 	movabs $0x805ed6,%rcx
  803a3b:	00 00 00 
  803a3e:	48 ba dd 5e 80 00 00 	movabs $0x805edd,%rdx
  803a45:	00 00 00 
  803a48:	be 89 00 00 00       	mov    $0x89,%esi
  803a4d:	48 bf f2 5e 80 00 00 	movabs $0x805ef2,%rdi
  803a54:	00 00 00 
  803a57:	b8 00 00 00 00       	mov    $0x0,%eax
  803a5c:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  803a63:	00 00 00 
  803a66:	41 ff d0             	callq  *%r8
  803a69:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803a70:	7e 35                	jle    803aa7 <devfile_read+0xde>
  803a72:	48 b9 00 5f 80 00 00 	movabs $0x805f00,%rcx
  803a79:	00 00 00 
  803a7c:	48 ba dd 5e 80 00 00 	movabs $0x805edd,%rdx
  803a83:	00 00 00 
  803a86:	be 8a 00 00 00       	mov    $0x8a,%esi
  803a8b:	48 bf f2 5e 80 00 00 	movabs $0x805ef2,%rdi
  803a92:	00 00 00 
  803a95:	b8 00 00 00 00       	mov    $0x0,%eax
  803a9a:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  803aa1:	00 00 00 
  803aa4:	41 ff d0             	callq  *%r8
  803aa7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aaa:	48 63 d0             	movslq %eax,%rdx
  803aad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ab1:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803ab8:	00 00 00 
  803abb:	48 89 c7             	mov    %rax,%rdi
  803abe:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  803ac5:	00 00 00 
  803ac8:	ff d0                	callq  *%rax
  803aca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803acd:	c9                   	leaveq 
  803ace:	c3                   	retq   

0000000000803acf <devfile_write>:
  803acf:	55                   	push   %rbp
  803ad0:	48 89 e5             	mov    %rsp,%rbp
  803ad3:	48 83 ec 40          	sub    $0x40,%rsp
  803ad7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803adb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803adf:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803ae3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803ae7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803aeb:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803af2:	00 
  803af3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803af7:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803afb:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803b00:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803b04:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b08:	8b 50 0c             	mov    0xc(%rax),%edx
  803b0b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b12:	00 00 00 
  803b15:	89 10                	mov    %edx,(%rax)
  803b17:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b1e:	00 00 00 
  803b21:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803b25:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803b29:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803b2d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b31:	48 89 c6             	mov    %rax,%rsi
  803b34:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  803b3b:	00 00 00 
  803b3e:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  803b45:	00 00 00 
  803b48:	ff d0                	callq  *%rax
  803b4a:	be 00 00 00 00       	mov    $0x0,%esi
  803b4f:	bf 04 00 00 00       	mov    $0x4,%edi
  803b54:	48 b8 31 38 80 00 00 	movabs $0x803831,%rax
  803b5b:	00 00 00 
  803b5e:	ff d0                	callq  *%rax
  803b60:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b63:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b67:	79 05                	jns    803b6e <devfile_write+0x9f>
  803b69:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b6c:	eb 43                	jmp    803bb1 <devfile_write+0xe2>
  803b6e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b71:	48 98                	cltq   
  803b73:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803b77:	76 35                	jbe    803bae <devfile_write+0xdf>
  803b79:	48 b9 d6 5e 80 00 00 	movabs $0x805ed6,%rcx
  803b80:	00 00 00 
  803b83:	48 ba dd 5e 80 00 00 	movabs $0x805edd,%rdx
  803b8a:	00 00 00 
  803b8d:	be a8 00 00 00       	mov    $0xa8,%esi
  803b92:	48 bf f2 5e 80 00 00 	movabs $0x805ef2,%rdi
  803b99:	00 00 00 
  803b9c:	b8 00 00 00 00       	mov    $0x0,%eax
  803ba1:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  803ba8:	00 00 00 
  803bab:	41 ff d0             	callq  *%r8
  803bae:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bb1:	c9                   	leaveq 
  803bb2:	c3                   	retq   

0000000000803bb3 <devfile_stat>:
  803bb3:	55                   	push   %rbp
  803bb4:	48 89 e5             	mov    %rsp,%rbp
  803bb7:	48 83 ec 20          	sub    $0x20,%rsp
  803bbb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803bbf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803bc3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803bc7:	8b 50 0c             	mov    0xc(%rax),%edx
  803bca:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803bd1:	00 00 00 
  803bd4:	89 10                	mov    %edx,(%rax)
  803bd6:	be 00 00 00 00       	mov    $0x0,%esi
  803bdb:	bf 05 00 00 00       	mov    $0x5,%edi
  803be0:	48 b8 31 38 80 00 00 	movabs $0x803831,%rax
  803be7:	00 00 00 
  803bea:	ff d0                	callq  *%rax
  803bec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bf3:	79 05                	jns    803bfa <devfile_stat+0x47>
  803bf5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bf8:	eb 56                	jmp    803c50 <devfile_stat+0x9d>
  803bfa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bfe:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803c05:	00 00 00 
  803c08:	48 89 c7             	mov    %rax,%rdi
  803c0b:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  803c12:	00 00 00 
  803c15:	ff d0                	callq  *%rax
  803c17:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c1e:	00 00 00 
  803c21:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803c27:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c2b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803c31:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c38:	00 00 00 
  803c3b:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803c41:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c45:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803c4b:	b8 00 00 00 00       	mov    $0x0,%eax
  803c50:	c9                   	leaveq 
  803c51:	c3                   	retq   

0000000000803c52 <devfile_trunc>:
  803c52:	55                   	push   %rbp
  803c53:	48 89 e5             	mov    %rsp,%rbp
  803c56:	48 83 ec 10          	sub    $0x10,%rsp
  803c5a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c5e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803c61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c65:	8b 50 0c             	mov    0xc(%rax),%edx
  803c68:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c6f:	00 00 00 
  803c72:	89 10                	mov    %edx,(%rax)
  803c74:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c7b:	00 00 00 
  803c7e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803c81:	89 50 04             	mov    %edx,0x4(%rax)
  803c84:	be 00 00 00 00       	mov    $0x0,%esi
  803c89:	bf 02 00 00 00       	mov    $0x2,%edi
  803c8e:	48 b8 31 38 80 00 00 	movabs $0x803831,%rax
  803c95:	00 00 00 
  803c98:	ff d0                	callq  *%rax
  803c9a:	c9                   	leaveq 
  803c9b:	c3                   	retq   

0000000000803c9c <remove>:
  803c9c:	55                   	push   %rbp
  803c9d:	48 89 e5             	mov    %rsp,%rbp
  803ca0:	48 83 ec 10          	sub    $0x10,%rsp
  803ca4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ca8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cac:	48 89 c7             	mov    %rax,%rdi
  803caf:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  803cb6:	00 00 00 
  803cb9:	ff d0                	callq  *%rax
  803cbb:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803cc0:	7e 07                	jle    803cc9 <remove+0x2d>
  803cc2:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803cc7:	eb 33                	jmp    803cfc <remove+0x60>
  803cc9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ccd:	48 89 c6             	mov    %rax,%rsi
  803cd0:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  803cd7:	00 00 00 
  803cda:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  803ce1:	00 00 00 
  803ce4:	ff d0                	callq  *%rax
  803ce6:	be 00 00 00 00       	mov    $0x0,%esi
  803ceb:	bf 07 00 00 00       	mov    $0x7,%edi
  803cf0:	48 b8 31 38 80 00 00 	movabs $0x803831,%rax
  803cf7:	00 00 00 
  803cfa:	ff d0                	callq  *%rax
  803cfc:	c9                   	leaveq 
  803cfd:	c3                   	retq   

0000000000803cfe <sync>:
  803cfe:	55                   	push   %rbp
  803cff:	48 89 e5             	mov    %rsp,%rbp
  803d02:	be 00 00 00 00       	mov    $0x0,%esi
  803d07:	bf 08 00 00 00       	mov    $0x8,%edi
  803d0c:	48 b8 31 38 80 00 00 	movabs $0x803831,%rax
  803d13:	00 00 00 
  803d16:	ff d0                	callq  *%rax
  803d18:	5d                   	pop    %rbp
  803d19:	c3                   	retq   

0000000000803d1a <copy>:
  803d1a:	55                   	push   %rbp
  803d1b:	48 89 e5             	mov    %rsp,%rbp
  803d1e:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803d25:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803d2c:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803d33:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803d3a:	be 00 00 00 00       	mov    $0x0,%esi
  803d3f:	48 89 c7             	mov    %rax,%rdi
  803d42:	48 b8 b8 38 80 00 00 	movabs $0x8038b8,%rax
  803d49:	00 00 00 
  803d4c:	ff d0                	callq  *%rax
  803d4e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d51:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d55:	79 28                	jns    803d7f <copy+0x65>
  803d57:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d5a:	89 c6                	mov    %eax,%esi
  803d5c:	48 bf 0c 5f 80 00 00 	movabs $0x805f0c,%rdi
  803d63:	00 00 00 
  803d66:	b8 00 00 00 00       	mov    $0x0,%eax
  803d6b:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  803d72:	00 00 00 
  803d75:	ff d2                	callq  *%rdx
  803d77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d7a:	e9 74 01 00 00       	jmpq   803ef3 <copy+0x1d9>
  803d7f:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803d86:	be 01 01 00 00       	mov    $0x101,%esi
  803d8b:	48 89 c7             	mov    %rax,%rdi
  803d8e:	48 b8 b8 38 80 00 00 	movabs $0x8038b8,%rax
  803d95:	00 00 00 
  803d98:	ff d0                	callq  *%rax
  803d9a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803d9d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803da1:	79 39                	jns    803ddc <copy+0xc2>
  803da3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803da6:	89 c6                	mov    %eax,%esi
  803da8:	48 bf 22 5f 80 00 00 	movabs $0x805f22,%rdi
  803daf:	00 00 00 
  803db2:	b8 00 00 00 00       	mov    $0x0,%eax
  803db7:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  803dbe:	00 00 00 
  803dc1:	ff d2                	callq  *%rdx
  803dc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dc6:	89 c7                	mov    %eax,%edi
  803dc8:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803dcf:	00 00 00 
  803dd2:	ff d0                	callq  *%rax
  803dd4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803dd7:	e9 17 01 00 00       	jmpq   803ef3 <copy+0x1d9>
  803ddc:	eb 74                	jmp    803e52 <copy+0x138>
  803dde:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803de1:	48 63 d0             	movslq %eax,%rdx
  803de4:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803deb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803dee:	48 89 ce             	mov    %rcx,%rsi
  803df1:	89 c7                	mov    %eax,%edi
  803df3:	48 b8 2c 35 80 00 00 	movabs $0x80352c,%rax
  803dfa:	00 00 00 
  803dfd:	ff d0                	callq  *%rax
  803dff:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803e02:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803e06:	79 4a                	jns    803e52 <copy+0x138>
  803e08:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803e0b:	89 c6                	mov    %eax,%esi
  803e0d:	48 bf 3c 5f 80 00 00 	movabs $0x805f3c,%rdi
  803e14:	00 00 00 
  803e17:	b8 00 00 00 00       	mov    $0x0,%eax
  803e1c:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  803e23:	00 00 00 
  803e26:	ff d2                	callq  *%rdx
  803e28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e2b:	89 c7                	mov    %eax,%edi
  803e2d:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803e34:	00 00 00 
  803e37:	ff d0                	callq  *%rax
  803e39:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e3c:	89 c7                	mov    %eax,%edi
  803e3e:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803e45:	00 00 00 
  803e48:	ff d0                	callq  *%rax
  803e4a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803e4d:	e9 a1 00 00 00       	jmpq   803ef3 <copy+0x1d9>
  803e52:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803e59:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e5c:	ba 00 02 00 00       	mov    $0x200,%edx
  803e61:	48 89 ce             	mov    %rcx,%rsi
  803e64:	89 c7                	mov    %eax,%edi
  803e66:	48 b8 e2 33 80 00 00 	movabs $0x8033e2,%rax
  803e6d:	00 00 00 
  803e70:	ff d0                	callq  *%rax
  803e72:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803e75:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803e79:	0f 8f 5f ff ff ff    	jg     803dde <copy+0xc4>
  803e7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803e83:	79 47                	jns    803ecc <copy+0x1b2>
  803e85:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803e88:	89 c6                	mov    %eax,%esi
  803e8a:	48 bf 4f 5f 80 00 00 	movabs $0x805f4f,%rdi
  803e91:	00 00 00 
  803e94:	b8 00 00 00 00       	mov    $0x0,%eax
  803e99:	48 ba 2a 0d 80 00 00 	movabs $0x800d2a,%rdx
  803ea0:	00 00 00 
  803ea3:	ff d2                	callq  *%rdx
  803ea5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ea8:	89 c7                	mov    %eax,%edi
  803eaa:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803eb1:	00 00 00 
  803eb4:	ff d0                	callq  *%rax
  803eb6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803eb9:	89 c7                	mov    %eax,%edi
  803ebb:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803ec2:	00 00 00 
  803ec5:	ff d0                	callq  *%rax
  803ec7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803eca:	eb 27                	jmp    803ef3 <copy+0x1d9>
  803ecc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ecf:	89 c7                	mov    %eax,%edi
  803ed1:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803ed8:	00 00 00 
  803edb:	ff d0                	callq  *%rax
  803edd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ee0:	89 c7                	mov    %eax,%edi
  803ee2:	48 b8 c0 31 80 00 00 	movabs $0x8031c0,%rax
  803ee9:	00 00 00 
  803eec:	ff d0                	callq  *%rax
  803eee:	b8 00 00 00 00       	mov    $0x0,%eax
  803ef3:	c9                   	leaveq 
  803ef4:	c3                   	retq   

0000000000803ef5 <fd2sockid>:
  803ef5:	55                   	push   %rbp
  803ef6:	48 89 e5             	mov    %rsp,%rbp
  803ef9:	48 83 ec 20          	sub    $0x20,%rsp
  803efd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f00:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803f04:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f07:	48 89 d6             	mov    %rdx,%rsi
  803f0a:	89 c7                	mov    %eax,%edi
  803f0c:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  803f13:	00 00 00 
  803f16:	ff d0                	callq  *%rax
  803f18:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f1b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f1f:	79 05                	jns    803f26 <fd2sockid+0x31>
  803f21:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f24:	eb 24                	jmp    803f4a <fd2sockid+0x55>
  803f26:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f2a:	8b 10                	mov    (%rax),%edx
  803f2c:	48 b8 a0 80 80 00 00 	movabs $0x8080a0,%rax
  803f33:	00 00 00 
  803f36:	8b 00                	mov    (%rax),%eax
  803f38:	39 c2                	cmp    %eax,%edx
  803f3a:	74 07                	je     803f43 <fd2sockid+0x4e>
  803f3c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803f41:	eb 07                	jmp    803f4a <fd2sockid+0x55>
  803f43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f47:	8b 40 0c             	mov    0xc(%rax),%eax
  803f4a:	c9                   	leaveq 
  803f4b:	c3                   	retq   

0000000000803f4c <alloc_sockfd>:
  803f4c:	55                   	push   %rbp
  803f4d:	48 89 e5             	mov    %rsp,%rbp
  803f50:	48 83 ec 20          	sub    $0x20,%rsp
  803f54:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f57:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803f5b:	48 89 c7             	mov    %rax,%rdi
  803f5e:	48 b8 18 2f 80 00 00 	movabs $0x802f18,%rax
  803f65:	00 00 00 
  803f68:	ff d0                	callq  *%rax
  803f6a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f6d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f71:	78 26                	js     803f99 <alloc_sockfd+0x4d>
  803f73:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f77:	ba 07 04 00 00       	mov    $0x407,%edx
  803f7c:	48 89 c6             	mov    %rax,%rsi
  803f7f:	bf 00 00 00 00       	mov    $0x0,%edi
  803f84:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  803f8b:	00 00 00 
  803f8e:	ff d0                	callq  *%rax
  803f90:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f93:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f97:	79 16                	jns    803faf <alloc_sockfd+0x63>
  803f99:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f9c:	89 c7                	mov    %eax,%edi
  803f9e:	48 b8 59 44 80 00 00 	movabs $0x804459,%rax
  803fa5:	00 00 00 
  803fa8:	ff d0                	callq  *%rax
  803faa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fad:	eb 3a                	jmp    803fe9 <alloc_sockfd+0x9d>
  803faf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fb3:	48 ba a0 80 80 00 00 	movabs $0x8080a0,%rdx
  803fba:	00 00 00 
  803fbd:	8b 12                	mov    (%rdx),%edx
  803fbf:	89 10                	mov    %edx,(%rax)
  803fc1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fc5:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803fcc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fd0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803fd3:	89 50 0c             	mov    %edx,0xc(%rax)
  803fd6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fda:	48 89 c7             	mov    %rax,%rdi
  803fdd:	48 b8 ca 2e 80 00 00 	movabs $0x802eca,%rax
  803fe4:	00 00 00 
  803fe7:	ff d0                	callq  *%rax
  803fe9:	c9                   	leaveq 
  803fea:	c3                   	retq   

0000000000803feb <accept>:
  803feb:	55                   	push   %rbp
  803fec:	48 89 e5             	mov    %rsp,%rbp
  803fef:	48 83 ec 30          	sub    $0x30,%rsp
  803ff3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ff6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ffa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ffe:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804001:	89 c7                	mov    %eax,%edi
  804003:	48 b8 f5 3e 80 00 00 	movabs $0x803ef5,%rax
  80400a:	00 00 00 
  80400d:	ff d0                	callq  *%rax
  80400f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804012:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804016:	79 05                	jns    80401d <accept+0x32>
  804018:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80401b:	eb 3b                	jmp    804058 <accept+0x6d>
  80401d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  804021:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804025:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804028:	48 89 ce             	mov    %rcx,%rsi
  80402b:	89 c7                	mov    %eax,%edi
  80402d:	48 b8 36 43 80 00 00 	movabs $0x804336,%rax
  804034:	00 00 00 
  804037:	ff d0                	callq  *%rax
  804039:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80403c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804040:	79 05                	jns    804047 <accept+0x5c>
  804042:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804045:	eb 11                	jmp    804058 <accept+0x6d>
  804047:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80404a:	89 c7                	mov    %eax,%edi
  80404c:	48 b8 4c 3f 80 00 00 	movabs $0x803f4c,%rax
  804053:	00 00 00 
  804056:	ff d0                	callq  *%rax
  804058:	c9                   	leaveq 
  804059:	c3                   	retq   

000000000080405a <bind>:
  80405a:	55                   	push   %rbp
  80405b:	48 89 e5             	mov    %rsp,%rbp
  80405e:	48 83 ec 20          	sub    $0x20,%rsp
  804062:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804065:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804069:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80406c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80406f:	89 c7                	mov    %eax,%edi
  804071:	48 b8 f5 3e 80 00 00 	movabs $0x803ef5,%rax
  804078:	00 00 00 
  80407b:	ff d0                	callq  *%rax
  80407d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804080:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804084:	79 05                	jns    80408b <bind+0x31>
  804086:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804089:	eb 1b                	jmp    8040a6 <bind+0x4c>
  80408b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80408e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804092:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804095:	48 89 ce             	mov    %rcx,%rsi
  804098:	89 c7                	mov    %eax,%edi
  80409a:	48 b8 b5 43 80 00 00 	movabs $0x8043b5,%rax
  8040a1:	00 00 00 
  8040a4:	ff d0                	callq  *%rax
  8040a6:	c9                   	leaveq 
  8040a7:	c3                   	retq   

00000000008040a8 <shutdown>:
  8040a8:	55                   	push   %rbp
  8040a9:	48 89 e5             	mov    %rsp,%rbp
  8040ac:	48 83 ec 20          	sub    $0x20,%rsp
  8040b0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040b3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8040b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040b9:	89 c7                	mov    %eax,%edi
  8040bb:	48 b8 f5 3e 80 00 00 	movabs $0x803ef5,%rax
  8040c2:	00 00 00 
  8040c5:	ff d0                	callq  *%rax
  8040c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040ca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040ce:	79 05                	jns    8040d5 <shutdown+0x2d>
  8040d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040d3:	eb 16                	jmp    8040eb <shutdown+0x43>
  8040d5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8040d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040db:	89 d6                	mov    %edx,%esi
  8040dd:	89 c7                	mov    %eax,%edi
  8040df:	48 b8 19 44 80 00 00 	movabs $0x804419,%rax
  8040e6:	00 00 00 
  8040e9:	ff d0                	callq  *%rax
  8040eb:	c9                   	leaveq 
  8040ec:	c3                   	retq   

00000000008040ed <devsock_close>:
  8040ed:	55                   	push   %rbp
  8040ee:	48 89 e5             	mov    %rsp,%rbp
  8040f1:	48 83 ec 10          	sub    $0x10,%rsp
  8040f5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040fd:	48 89 c7             	mov    %rax,%rdi
  804100:	48 b8 a5 50 80 00 00 	movabs $0x8050a5,%rax
  804107:	00 00 00 
  80410a:	ff d0                	callq  *%rax
  80410c:	83 f8 01             	cmp    $0x1,%eax
  80410f:	75 17                	jne    804128 <devsock_close+0x3b>
  804111:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804115:	8b 40 0c             	mov    0xc(%rax),%eax
  804118:	89 c7                	mov    %eax,%edi
  80411a:	48 b8 59 44 80 00 00 	movabs $0x804459,%rax
  804121:	00 00 00 
  804124:	ff d0                	callq  *%rax
  804126:	eb 05                	jmp    80412d <devsock_close+0x40>
  804128:	b8 00 00 00 00       	mov    $0x0,%eax
  80412d:	c9                   	leaveq 
  80412e:	c3                   	retq   

000000000080412f <connect>:
  80412f:	55                   	push   %rbp
  804130:	48 89 e5             	mov    %rsp,%rbp
  804133:	48 83 ec 20          	sub    $0x20,%rsp
  804137:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80413a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80413e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804141:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804144:	89 c7                	mov    %eax,%edi
  804146:	48 b8 f5 3e 80 00 00 	movabs $0x803ef5,%rax
  80414d:	00 00 00 
  804150:	ff d0                	callq  *%rax
  804152:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804155:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804159:	79 05                	jns    804160 <connect+0x31>
  80415b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80415e:	eb 1b                	jmp    80417b <connect+0x4c>
  804160:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804163:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804167:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80416a:	48 89 ce             	mov    %rcx,%rsi
  80416d:	89 c7                	mov    %eax,%edi
  80416f:	48 b8 86 44 80 00 00 	movabs $0x804486,%rax
  804176:	00 00 00 
  804179:	ff d0                	callq  *%rax
  80417b:	c9                   	leaveq 
  80417c:	c3                   	retq   

000000000080417d <listen>:
  80417d:	55                   	push   %rbp
  80417e:	48 89 e5             	mov    %rsp,%rbp
  804181:	48 83 ec 20          	sub    $0x20,%rsp
  804185:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804188:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80418b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80418e:	89 c7                	mov    %eax,%edi
  804190:	48 b8 f5 3e 80 00 00 	movabs $0x803ef5,%rax
  804197:	00 00 00 
  80419a:	ff d0                	callq  *%rax
  80419c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80419f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041a3:	79 05                	jns    8041aa <listen+0x2d>
  8041a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041a8:	eb 16                	jmp    8041c0 <listen+0x43>
  8041aa:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8041ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041b0:	89 d6                	mov    %edx,%esi
  8041b2:	89 c7                	mov    %eax,%edi
  8041b4:	48 b8 ea 44 80 00 00 	movabs $0x8044ea,%rax
  8041bb:	00 00 00 
  8041be:	ff d0                	callq  *%rax
  8041c0:	c9                   	leaveq 
  8041c1:	c3                   	retq   

00000000008041c2 <devsock_read>:
  8041c2:	55                   	push   %rbp
  8041c3:	48 89 e5             	mov    %rsp,%rbp
  8041c6:	48 83 ec 20          	sub    $0x20,%rsp
  8041ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8041ce:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8041d2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8041d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041da:	89 c2                	mov    %eax,%edx
  8041dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041e0:	8b 40 0c             	mov    0xc(%rax),%eax
  8041e3:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8041e7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8041ec:	89 c7                	mov    %eax,%edi
  8041ee:	48 b8 2a 45 80 00 00 	movabs $0x80452a,%rax
  8041f5:	00 00 00 
  8041f8:	ff d0                	callq  *%rax
  8041fa:	c9                   	leaveq 
  8041fb:	c3                   	retq   

00000000008041fc <devsock_write>:
  8041fc:	55                   	push   %rbp
  8041fd:	48 89 e5             	mov    %rsp,%rbp
  804200:	48 83 ec 20          	sub    $0x20,%rsp
  804204:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804208:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80420c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804210:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804214:	89 c2                	mov    %eax,%edx
  804216:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80421a:	8b 40 0c             	mov    0xc(%rax),%eax
  80421d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  804221:	b9 00 00 00 00       	mov    $0x0,%ecx
  804226:	89 c7                	mov    %eax,%edi
  804228:	48 b8 f6 45 80 00 00 	movabs $0x8045f6,%rax
  80422f:	00 00 00 
  804232:	ff d0                	callq  *%rax
  804234:	c9                   	leaveq 
  804235:	c3                   	retq   

0000000000804236 <devsock_stat>:
  804236:	55                   	push   %rbp
  804237:	48 89 e5             	mov    %rsp,%rbp
  80423a:	48 83 ec 10          	sub    $0x10,%rsp
  80423e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804242:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804246:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80424a:	48 be 6a 5f 80 00 00 	movabs $0x805f6a,%rsi
  804251:	00 00 00 
  804254:	48 89 c7             	mov    %rax,%rdi
  804257:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  80425e:	00 00 00 
  804261:	ff d0                	callq  *%rax
  804263:	b8 00 00 00 00       	mov    $0x0,%eax
  804268:	c9                   	leaveq 
  804269:	c3                   	retq   

000000000080426a <socket>:
  80426a:	55                   	push   %rbp
  80426b:	48 89 e5             	mov    %rsp,%rbp
  80426e:	48 83 ec 20          	sub    $0x20,%rsp
  804272:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804275:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804278:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80427b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80427e:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804281:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804284:	89 ce                	mov    %ecx,%esi
  804286:	89 c7                	mov    %eax,%edi
  804288:	48 b8 ae 46 80 00 00 	movabs $0x8046ae,%rax
  80428f:	00 00 00 
  804292:	ff d0                	callq  *%rax
  804294:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804297:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80429b:	79 05                	jns    8042a2 <socket+0x38>
  80429d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042a0:	eb 11                	jmp    8042b3 <socket+0x49>
  8042a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042a5:	89 c7                	mov    %eax,%edi
  8042a7:	48 b8 4c 3f 80 00 00 	movabs $0x803f4c,%rax
  8042ae:	00 00 00 
  8042b1:	ff d0                	callq  *%rax
  8042b3:	c9                   	leaveq 
  8042b4:	c3                   	retq   

00000000008042b5 <nsipc>:
  8042b5:	55                   	push   %rbp
  8042b6:	48 89 e5             	mov    %rsp,%rbp
  8042b9:	48 83 ec 10          	sub    $0x10,%rsp
  8042bd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8042c0:	48 b8 0c 90 80 00 00 	movabs $0x80900c,%rax
  8042c7:	00 00 00 
  8042ca:	8b 00                	mov    (%rax),%eax
  8042cc:	85 c0                	test   %eax,%eax
  8042ce:	75 1d                	jne    8042ed <nsipc+0x38>
  8042d0:	bf 02 00 00 00       	mov    $0x2,%edi
  8042d5:	48 b8 58 2e 80 00 00 	movabs $0x802e58,%rax
  8042dc:	00 00 00 
  8042df:	ff d0                	callq  *%rax
  8042e1:	48 ba 0c 90 80 00 00 	movabs $0x80900c,%rdx
  8042e8:	00 00 00 
  8042eb:	89 02                	mov    %eax,(%rdx)
  8042ed:	48 b8 0c 90 80 00 00 	movabs $0x80900c,%rax
  8042f4:	00 00 00 
  8042f7:	8b 00                	mov    (%rax),%eax
  8042f9:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8042fc:	b9 07 00 00 00       	mov    $0x7,%ecx
  804301:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  804308:	00 00 00 
  80430b:	89 c7                	mov    %eax,%edi
  80430d:	48 b8 c2 2d 80 00 00 	movabs $0x802dc2,%rax
  804314:	00 00 00 
  804317:	ff d0                	callq  *%rax
  804319:	ba 00 00 00 00       	mov    $0x0,%edx
  80431e:	be 00 00 00 00       	mov    $0x0,%esi
  804323:	bf 00 00 00 00       	mov    $0x0,%edi
  804328:	48 b8 01 2d 80 00 00 	movabs $0x802d01,%rax
  80432f:	00 00 00 
  804332:	ff d0                	callq  *%rax
  804334:	c9                   	leaveq 
  804335:	c3                   	retq   

0000000000804336 <nsipc_accept>:
  804336:	55                   	push   %rbp
  804337:	48 89 e5             	mov    %rsp,%rbp
  80433a:	48 83 ec 30          	sub    $0x30,%rsp
  80433e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804341:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804345:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804349:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804350:	00 00 00 
  804353:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804356:	89 10                	mov    %edx,(%rax)
  804358:	bf 01 00 00 00       	mov    $0x1,%edi
  80435d:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  804364:	00 00 00 
  804367:	ff d0                	callq  *%rax
  804369:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80436c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804370:	78 3e                	js     8043b0 <nsipc_accept+0x7a>
  804372:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804379:	00 00 00 
  80437c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804380:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804384:	8b 40 10             	mov    0x10(%rax),%eax
  804387:	89 c2                	mov    %eax,%edx
  804389:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80438d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804391:	48 89 ce             	mov    %rcx,%rsi
  804394:	48 89 c7             	mov    %rax,%rdi
  804397:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  80439e:	00 00 00 
  8043a1:	ff d0                	callq  *%rax
  8043a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043a7:	8b 50 10             	mov    0x10(%rax),%edx
  8043aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043ae:	89 10                	mov    %edx,(%rax)
  8043b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043b3:	c9                   	leaveq 
  8043b4:	c3                   	retq   

00000000008043b5 <nsipc_bind>:
  8043b5:	55                   	push   %rbp
  8043b6:	48 89 e5             	mov    %rsp,%rbp
  8043b9:	48 83 ec 10          	sub    $0x10,%rsp
  8043bd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8043c0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8043c4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8043c7:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8043ce:	00 00 00 
  8043d1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8043d4:	89 10                	mov    %edx,(%rax)
  8043d6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8043d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043dd:	48 89 c6             	mov    %rax,%rsi
  8043e0:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8043e7:	00 00 00 
  8043ea:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  8043f1:	00 00 00 
  8043f4:	ff d0                	callq  *%rax
  8043f6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8043fd:	00 00 00 
  804400:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804403:	89 50 14             	mov    %edx,0x14(%rax)
  804406:	bf 02 00 00 00       	mov    $0x2,%edi
  80440b:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  804412:	00 00 00 
  804415:	ff d0                	callq  *%rax
  804417:	c9                   	leaveq 
  804418:	c3                   	retq   

0000000000804419 <nsipc_shutdown>:
  804419:	55                   	push   %rbp
  80441a:	48 89 e5             	mov    %rsp,%rbp
  80441d:	48 83 ec 10          	sub    $0x10,%rsp
  804421:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804424:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804427:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80442e:	00 00 00 
  804431:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804434:	89 10                	mov    %edx,(%rax)
  804436:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80443d:	00 00 00 
  804440:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804443:	89 50 04             	mov    %edx,0x4(%rax)
  804446:	bf 03 00 00 00       	mov    $0x3,%edi
  80444b:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  804452:	00 00 00 
  804455:	ff d0                	callq  *%rax
  804457:	c9                   	leaveq 
  804458:	c3                   	retq   

0000000000804459 <nsipc_close>:
  804459:	55                   	push   %rbp
  80445a:	48 89 e5             	mov    %rsp,%rbp
  80445d:	48 83 ec 10          	sub    $0x10,%rsp
  804461:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804464:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80446b:	00 00 00 
  80446e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804471:	89 10                	mov    %edx,(%rax)
  804473:	bf 04 00 00 00       	mov    $0x4,%edi
  804478:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  80447f:	00 00 00 
  804482:	ff d0                	callq  *%rax
  804484:	c9                   	leaveq 
  804485:	c3                   	retq   

0000000000804486 <nsipc_connect>:
  804486:	55                   	push   %rbp
  804487:	48 89 e5             	mov    %rsp,%rbp
  80448a:	48 83 ec 10          	sub    $0x10,%rsp
  80448e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804491:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804495:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804498:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80449f:	00 00 00 
  8044a2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8044a5:	89 10                	mov    %edx,(%rax)
  8044a7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8044aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044ae:	48 89 c6             	mov    %rax,%rsi
  8044b1:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8044b8:	00 00 00 
  8044bb:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  8044c2:	00 00 00 
  8044c5:	ff d0                	callq  *%rax
  8044c7:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044ce:	00 00 00 
  8044d1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8044d4:	89 50 14             	mov    %edx,0x14(%rax)
  8044d7:	bf 05 00 00 00       	mov    $0x5,%edi
  8044dc:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  8044e3:	00 00 00 
  8044e6:	ff d0                	callq  *%rax
  8044e8:	c9                   	leaveq 
  8044e9:	c3                   	retq   

00000000008044ea <nsipc_listen>:
  8044ea:	55                   	push   %rbp
  8044eb:	48 89 e5             	mov    %rsp,%rbp
  8044ee:	48 83 ec 10          	sub    $0x10,%rsp
  8044f2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8044f5:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8044f8:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044ff:	00 00 00 
  804502:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804505:	89 10                	mov    %edx,(%rax)
  804507:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80450e:	00 00 00 
  804511:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804514:	89 50 04             	mov    %edx,0x4(%rax)
  804517:	bf 06 00 00 00       	mov    $0x6,%edi
  80451c:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  804523:	00 00 00 
  804526:	ff d0                	callq  *%rax
  804528:	c9                   	leaveq 
  804529:	c3                   	retq   

000000000080452a <nsipc_recv>:
  80452a:	55                   	push   %rbp
  80452b:	48 89 e5             	mov    %rsp,%rbp
  80452e:	48 83 ec 30          	sub    $0x30,%rsp
  804532:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804535:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804539:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80453c:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80453f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804546:	00 00 00 
  804549:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80454c:	89 10                	mov    %edx,(%rax)
  80454e:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804555:	00 00 00 
  804558:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80455b:	89 50 04             	mov    %edx,0x4(%rax)
  80455e:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804565:	00 00 00 
  804568:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80456b:	89 50 08             	mov    %edx,0x8(%rax)
  80456e:	bf 07 00 00 00       	mov    $0x7,%edi
  804573:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  80457a:	00 00 00 
  80457d:	ff d0                	callq  *%rax
  80457f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804582:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804586:	78 69                	js     8045f1 <nsipc_recv+0xc7>
  804588:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80458f:	7f 08                	jg     804599 <nsipc_recv+0x6f>
  804591:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804594:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804597:	7e 35                	jle    8045ce <nsipc_recv+0xa4>
  804599:	48 b9 71 5f 80 00 00 	movabs $0x805f71,%rcx
  8045a0:	00 00 00 
  8045a3:	48 ba 86 5f 80 00 00 	movabs $0x805f86,%rdx
  8045aa:	00 00 00 
  8045ad:	be 62 00 00 00       	mov    $0x62,%esi
  8045b2:	48 bf 9b 5f 80 00 00 	movabs $0x805f9b,%rdi
  8045b9:	00 00 00 
  8045bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8045c1:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  8045c8:	00 00 00 
  8045cb:	41 ff d0             	callq  *%r8
  8045ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045d1:	48 63 d0             	movslq %eax,%rdx
  8045d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045d8:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  8045df:	00 00 00 
  8045e2:	48 89 c7             	mov    %rax,%rdi
  8045e5:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  8045ec:	00 00 00 
  8045ef:	ff d0                	callq  *%rax
  8045f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045f4:	c9                   	leaveq 
  8045f5:	c3                   	retq   

00000000008045f6 <nsipc_send>:
  8045f6:	55                   	push   %rbp
  8045f7:	48 89 e5             	mov    %rsp,%rbp
  8045fa:	48 83 ec 20          	sub    $0x20,%rsp
  8045fe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804601:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804605:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804608:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80460b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804612:	00 00 00 
  804615:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804618:	89 10                	mov    %edx,(%rax)
  80461a:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  804621:	7e 35                	jle    804658 <nsipc_send+0x62>
  804623:	48 b9 aa 5f 80 00 00 	movabs $0x805faa,%rcx
  80462a:	00 00 00 
  80462d:	48 ba 86 5f 80 00 00 	movabs $0x805f86,%rdx
  804634:	00 00 00 
  804637:	be 6d 00 00 00       	mov    $0x6d,%esi
  80463c:	48 bf 9b 5f 80 00 00 	movabs $0x805f9b,%rdi
  804643:	00 00 00 
  804646:	b8 00 00 00 00       	mov    $0x0,%eax
  80464b:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  804652:	00 00 00 
  804655:	41 ff d0             	callq  *%r8
  804658:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80465b:	48 63 d0             	movslq %eax,%rdx
  80465e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804662:	48 89 c6             	mov    %rax,%rsi
  804665:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  80466c:	00 00 00 
  80466f:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  804676:	00 00 00 
  804679:	ff d0                	callq  *%rax
  80467b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804682:	00 00 00 
  804685:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804688:	89 50 04             	mov    %edx,0x4(%rax)
  80468b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804692:	00 00 00 
  804695:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804698:	89 50 08             	mov    %edx,0x8(%rax)
  80469b:	bf 08 00 00 00       	mov    $0x8,%edi
  8046a0:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  8046a7:	00 00 00 
  8046aa:	ff d0                	callq  *%rax
  8046ac:	c9                   	leaveq 
  8046ad:	c3                   	retq   

00000000008046ae <nsipc_socket>:
  8046ae:	55                   	push   %rbp
  8046af:	48 89 e5             	mov    %rsp,%rbp
  8046b2:	48 83 ec 10          	sub    $0x10,%rsp
  8046b6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8046b9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8046bc:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8046bf:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8046c6:	00 00 00 
  8046c9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8046cc:	89 10                	mov    %edx,(%rax)
  8046ce:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8046d5:	00 00 00 
  8046d8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8046db:	89 50 04             	mov    %edx,0x4(%rax)
  8046de:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8046e5:	00 00 00 
  8046e8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8046eb:	89 50 08             	mov    %edx,0x8(%rax)
  8046ee:	bf 09 00 00 00       	mov    $0x9,%edi
  8046f3:	48 b8 b5 42 80 00 00 	movabs $0x8042b5,%rax
  8046fa:	00 00 00 
  8046fd:	ff d0                	callq  *%rax
  8046ff:	c9                   	leaveq 
  804700:	c3                   	retq   

0000000000804701 <pipe>:
  804701:	55                   	push   %rbp
  804702:	48 89 e5             	mov    %rsp,%rbp
  804705:	53                   	push   %rbx
  804706:	48 83 ec 38          	sub    $0x38,%rsp
  80470a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80470e:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804712:	48 89 c7             	mov    %rax,%rdi
  804715:	48 b8 18 2f 80 00 00 	movabs $0x802f18,%rax
  80471c:	00 00 00 
  80471f:	ff d0                	callq  *%rax
  804721:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804724:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804728:	0f 88 bf 01 00 00    	js     8048ed <pipe+0x1ec>
  80472e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804732:	ba 07 04 00 00       	mov    $0x407,%edx
  804737:	48 89 c6             	mov    %rax,%rsi
  80473a:	bf 00 00 00 00       	mov    $0x0,%edi
  80473f:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  804746:	00 00 00 
  804749:	ff d0                	callq  *%rax
  80474b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80474e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804752:	0f 88 95 01 00 00    	js     8048ed <pipe+0x1ec>
  804758:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80475c:	48 89 c7             	mov    %rax,%rdi
  80475f:	48 b8 18 2f 80 00 00 	movabs $0x802f18,%rax
  804766:	00 00 00 
  804769:	ff d0                	callq  *%rax
  80476b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80476e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804772:	0f 88 5d 01 00 00    	js     8048d5 <pipe+0x1d4>
  804778:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80477c:	ba 07 04 00 00       	mov    $0x407,%edx
  804781:	48 89 c6             	mov    %rax,%rsi
  804784:	bf 00 00 00 00       	mov    $0x0,%edi
  804789:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  804790:	00 00 00 
  804793:	ff d0                	callq  *%rax
  804795:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804798:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80479c:	0f 88 33 01 00 00    	js     8048d5 <pipe+0x1d4>
  8047a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047a6:	48 89 c7             	mov    %rax,%rdi
  8047a9:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  8047b0:	00 00 00 
  8047b3:	ff d0                	callq  *%rax
  8047b5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8047b9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047bd:	ba 07 04 00 00       	mov    $0x407,%edx
  8047c2:	48 89 c6             	mov    %rax,%rsi
  8047c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8047ca:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8047d1:	00 00 00 
  8047d4:	ff d0                	callq  *%rax
  8047d6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8047d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8047dd:	79 05                	jns    8047e4 <pipe+0xe3>
  8047df:	e9 d9 00 00 00       	jmpq   8048bd <pipe+0x1bc>
  8047e4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8047e8:	48 89 c7             	mov    %rax,%rdi
  8047eb:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  8047f2:	00 00 00 
  8047f5:	ff d0                	callq  *%rax
  8047f7:	48 89 c2             	mov    %rax,%rdx
  8047fa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047fe:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804804:	48 89 d1             	mov    %rdx,%rcx
  804807:	ba 00 00 00 00       	mov    $0x0,%edx
  80480c:	48 89 c6             	mov    %rax,%rsi
  80480f:	bf 00 00 00 00       	mov    $0x0,%edi
  804814:	48 b8 5e 22 80 00 00 	movabs $0x80225e,%rax
  80481b:	00 00 00 
  80481e:	ff d0                	callq  *%rax
  804820:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804823:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804827:	79 1b                	jns    804844 <pipe+0x143>
  804829:	90                   	nop
  80482a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80482e:	48 89 c6             	mov    %rax,%rsi
  804831:	bf 00 00 00 00       	mov    $0x0,%edi
  804836:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  80483d:	00 00 00 
  804840:	ff d0                	callq  *%rax
  804842:	eb 79                	jmp    8048bd <pipe+0x1bc>
  804844:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804848:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  80484f:	00 00 00 
  804852:	8b 12                	mov    (%rdx),%edx
  804854:	89 10                	mov    %edx,(%rax)
  804856:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80485a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804861:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804865:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  80486c:	00 00 00 
  80486f:	8b 12                	mov    (%rdx),%edx
  804871:	89 10                	mov    %edx,(%rax)
  804873:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804877:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80487e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804882:	48 89 c7             	mov    %rax,%rdi
  804885:	48 b8 ca 2e 80 00 00 	movabs $0x802eca,%rax
  80488c:	00 00 00 
  80488f:	ff d0                	callq  *%rax
  804891:	89 c2                	mov    %eax,%edx
  804893:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804897:	89 10                	mov    %edx,(%rax)
  804899:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80489d:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8048a1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8048a5:	48 89 c7             	mov    %rax,%rdi
  8048a8:	48 b8 ca 2e 80 00 00 	movabs $0x802eca,%rax
  8048af:	00 00 00 
  8048b2:	ff d0                	callq  *%rax
  8048b4:	89 03                	mov    %eax,(%rbx)
  8048b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8048bb:	eb 33                	jmp    8048f0 <pipe+0x1ef>
  8048bd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8048c1:	48 89 c6             	mov    %rax,%rsi
  8048c4:	bf 00 00 00 00       	mov    $0x0,%edi
  8048c9:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8048d0:	00 00 00 
  8048d3:	ff d0                	callq  *%rax
  8048d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048d9:	48 89 c6             	mov    %rax,%rsi
  8048dc:	bf 00 00 00 00       	mov    $0x0,%edi
  8048e1:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  8048e8:	00 00 00 
  8048eb:	ff d0                	callq  *%rax
  8048ed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048f0:	48 83 c4 38          	add    $0x38,%rsp
  8048f4:	5b                   	pop    %rbx
  8048f5:	5d                   	pop    %rbp
  8048f6:	c3                   	retq   

00000000008048f7 <_pipeisclosed>:
  8048f7:	55                   	push   %rbp
  8048f8:	48 89 e5             	mov    %rsp,%rbp
  8048fb:	53                   	push   %rbx
  8048fc:	48 83 ec 28          	sub    $0x28,%rsp
  804900:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804904:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804908:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80490f:	00 00 00 
  804912:	48 8b 00             	mov    (%rax),%rax
  804915:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80491b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80491e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804922:	48 89 c7             	mov    %rax,%rdi
  804925:	48 b8 a5 50 80 00 00 	movabs $0x8050a5,%rax
  80492c:	00 00 00 
  80492f:	ff d0                	callq  *%rax
  804931:	89 c3                	mov    %eax,%ebx
  804933:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804937:	48 89 c7             	mov    %rax,%rdi
  80493a:	48 b8 a5 50 80 00 00 	movabs $0x8050a5,%rax
  804941:	00 00 00 
  804944:	ff d0                	callq  *%rax
  804946:	39 c3                	cmp    %eax,%ebx
  804948:	0f 94 c0             	sete   %al
  80494b:	0f b6 c0             	movzbl %al,%eax
  80494e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804951:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804958:	00 00 00 
  80495b:	48 8b 00             	mov    (%rax),%rax
  80495e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804964:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804967:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80496a:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80496d:	75 05                	jne    804974 <_pipeisclosed+0x7d>
  80496f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804972:	eb 4f                	jmp    8049c3 <_pipeisclosed+0xcc>
  804974:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804977:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80497a:	74 42                	je     8049be <_pipeisclosed+0xc7>
  80497c:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804980:	75 3c                	jne    8049be <_pipeisclosed+0xc7>
  804982:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804989:	00 00 00 
  80498c:	48 8b 00             	mov    (%rax),%rax
  80498f:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804995:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804998:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80499b:	89 c6                	mov    %eax,%esi
  80499d:	48 bf bb 5f 80 00 00 	movabs $0x805fbb,%rdi
  8049a4:	00 00 00 
  8049a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8049ac:	49 b8 2a 0d 80 00 00 	movabs $0x800d2a,%r8
  8049b3:	00 00 00 
  8049b6:	41 ff d0             	callq  *%r8
  8049b9:	e9 4a ff ff ff       	jmpq   804908 <_pipeisclosed+0x11>
  8049be:	e9 45 ff ff ff       	jmpq   804908 <_pipeisclosed+0x11>
  8049c3:	48 83 c4 28          	add    $0x28,%rsp
  8049c7:	5b                   	pop    %rbx
  8049c8:	5d                   	pop    %rbp
  8049c9:	c3                   	retq   

00000000008049ca <pipeisclosed>:
  8049ca:	55                   	push   %rbp
  8049cb:	48 89 e5             	mov    %rsp,%rbp
  8049ce:	48 83 ec 30          	sub    $0x30,%rsp
  8049d2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8049d5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8049d9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8049dc:	48 89 d6             	mov    %rdx,%rsi
  8049df:	89 c7                	mov    %eax,%edi
  8049e1:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  8049e8:	00 00 00 
  8049eb:	ff d0                	callq  *%rax
  8049ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049f4:	79 05                	jns    8049fb <pipeisclosed+0x31>
  8049f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049f9:	eb 31                	jmp    804a2c <pipeisclosed+0x62>
  8049fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049ff:	48 89 c7             	mov    %rax,%rdi
  804a02:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  804a09:	00 00 00 
  804a0c:	ff d0                	callq  *%rax
  804a0e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804a12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a16:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a1a:	48 89 d6             	mov    %rdx,%rsi
  804a1d:	48 89 c7             	mov    %rax,%rdi
  804a20:	48 b8 f7 48 80 00 00 	movabs $0x8048f7,%rax
  804a27:	00 00 00 
  804a2a:	ff d0                	callq  *%rax
  804a2c:	c9                   	leaveq 
  804a2d:	c3                   	retq   

0000000000804a2e <devpipe_read>:
  804a2e:	55                   	push   %rbp
  804a2f:	48 89 e5             	mov    %rsp,%rbp
  804a32:	48 83 ec 40          	sub    $0x40,%rsp
  804a36:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804a3a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804a3e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804a42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a46:	48 89 c7             	mov    %rax,%rdi
  804a49:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  804a50:	00 00 00 
  804a53:	ff d0                	callq  *%rax
  804a55:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804a59:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804a5d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804a61:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804a68:	00 
  804a69:	e9 92 00 00 00       	jmpq   804b00 <devpipe_read+0xd2>
  804a6e:	eb 41                	jmp    804ab1 <devpipe_read+0x83>
  804a70:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804a75:	74 09                	je     804a80 <devpipe_read+0x52>
  804a77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a7b:	e9 92 00 00 00       	jmpq   804b12 <devpipe_read+0xe4>
  804a80:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a84:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a88:	48 89 d6             	mov    %rdx,%rsi
  804a8b:	48 89 c7             	mov    %rax,%rdi
  804a8e:	48 b8 f7 48 80 00 00 	movabs $0x8048f7,%rax
  804a95:	00 00 00 
  804a98:	ff d0                	callq  *%rax
  804a9a:	85 c0                	test   %eax,%eax
  804a9c:	74 07                	je     804aa5 <devpipe_read+0x77>
  804a9e:	b8 00 00 00 00       	mov    $0x0,%eax
  804aa3:	eb 6d                	jmp    804b12 <devpipe_read+0xe4>
  804aa5:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  804aac:	00 00 00 
  804aaf:	ff d0                	callq  *%rax
  804ab1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ab5:	8b 10                	mov    (%rax),%edx
  804ab7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804abb:	8b 40 04             	mov    0x4(%rax),%eax
  804abe:	39 c2                	cmp    %eax,%edx
  804ac0:	74 ae                	je     804a70 <devpipe_read+0x42>
  804ac2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ac6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804aca:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804ace:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ad2:	8b 00                	mov    (%rax),%eax
  804ad4:	99                   	cltd   
  804ad5:	c1 ea 1b             	shr    $0x1b,%edx
  804ad8:	01 d0                	add    %edx,%eax
  804ada:	83 e0 1f             	and    $0x1f,%eax
  804add:	29 d0                	sub    %edx,%eax
  804adf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804ae3:	48 98                	cltq   
  804ae5:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804aea:	88 01                	mov    %al,(%rcx)
  804aec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804af0:	8b 00                	mov    (%rax),%eax
  804af2:	8d 50 01             	lea    0x1(%rax),%edx
  804af5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804af9:	89 10                	mov    %edx,(%rax)
  804afb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804b00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b04:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804b08:	0f 82 60 ff ff ff    	jb     804a6e <devpipe_read+0x40>
  804b0e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b12:	c9                   	leaveq 
  804b13:	c3                   	retq   

0000000000804b14 <devpipe_write>:
  804b14:	55                   	push   %rbp
  804b15:	48 89 e5             	mov    %rsp,%rbp
  804b18:	48 83 ec 40          	sub    $0x40,%rsp
  804b1c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804b20:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804b24:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804b28:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b2c:	48 89 c7             	mov    %rax,%rdi
  804b2f:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  804b36:	00 00 00 
  804b39:	ff d0                	callq  *%rax
  804b3b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804b3f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804b43:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804b47:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804b4e:	00 
  804b4f:	e9 8e 00 00 00       	jmpq   804be2 <devpipe_write+0xce>
  804b54:	eb 31                	jmp    804b87 <devpipe_write+0x73>
  804b56:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804b5a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b5e:	48 89 d6             	mov    %rdx,%rsi
  804b61:	48 89 c7             	mov    %rax,%rdi
  804b64:	48 b8 f7 48 80 00 00 	movabs $0x8048f7,%rax
  804b6b:	00 00 00 
  804b6e:	ff d0                	callq  *%rax
  804b70:	85 c0                	test   %eax,%eax
  804b72:	74 07                	je     804b7b <devpipe_write+0x67>
  804b74:	b8 00 00 00 00       	mov    $0x0,%eax
  804b79:	eb 79                	jmp    804bf4 <devpipe_write+0xe0>
  804b7b:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  804b82:	00 00 00 
  804b85:	ff d0                	callq  *%rax
  804b87:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b8b:	8b 40 04             	mov    0x4(%rax),%eax
  804b8e:	48 63 d0             	movslq %eax,%rdx
  804b91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b95:	8b 00                	mov    (%rax),%eax
  804b97:	48 98                	cltq   
  804b99:	48 83 c0 20          	add    $0x20,%rax
  804b9d:	48 39 c2             	cmp    %rax,%rdx
  804ba0:	73 b4                	jae    804b56 <devpipe_write+0x42>
  804ba2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ba6:	8b 40 04             	mov    0x4(%rax),%eax
  804ba9:	99                   	cltd   
  804baa:	c1 ea 1b             	shr    $0x1b,%edx
  804bad:	01 d0                	add    %edx,%eax
  804baf:	83 e0 1f             	and    $0x1f,%eax
  804bb2:	29 d0                	sub    %edx,%eax
  804bb4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804bb8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804bbc:	48 01 ca             	add    %rcx,%rdx
  804bbf:	0f b6 0a             	movzbl (%rdx),%ecx
  804bc2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804bc6:	48 98                	cltq   
  804bc8:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804bcc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bd0:	8b 40 04             	mov    0x4(%rax),%eax
  804bd3:	8d 50 01             	lea    0x1(%rax),%edx
  804bd6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bda:	89 50 04             	mov    %edx,0x4(%rax)
  804bdd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804be2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804be6:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804bea:	0f 82 64 ff ff ff    	jb     804b54 <devpipe_write+0x40>
  804bf0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bf4:	c9                   	leaveq 
  804bf5:	c3                   	retq   

0000000000804bf6 <devpipe_stat>:
  804bf6:	55                   	push   %rbp
  804bf7:	48 89 e5             	mov    %rsp,%rbp
  804bfa:	48 83 ec 20          	sub    $0x20,%rsp
  804bfe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804c02:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804c06:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c0a:	48 89 c7             	mov    %rax,%rdi
  804c0d:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  804c14:	00 00 00 
  804c17:	ff d0                	callq  *%rax
  804c19:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804c1d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c21:	48 be ce 5f 80 00 00 	movabs $0x805fce,%rsi
  804c28:	00 00 00 
  804c2b:	48 89 c7             	mov    %rax,%rdi
  804c2e:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  804c35:	00 00 00 
  804c38:	ff d0                	callq  *%rax
  804c3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c3e:	8b 50 04             	mov    0x4(%rax),%edx
  804c41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c45:	8b 00                	mov    (%rax),%eax
  804c47:	29 c2                	sub    %eax,%edx
  804c49:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c4d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804c53:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c57:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804c5e:	00 00 00 
  804c61:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c65:	48 b9 e0 80 80 00 00 	movabs $0x8080e0,%rcx
  804c6c:	00 00 00 
  804c6f:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804c76:	b8 00 00 00 00       	mov    $0x0,%eax
  804c7b:	c9                   	leaveq 
  804c7c:	c3                   	retq   

0000000000804c7d <devpipe_close>:
  804c7d:	55                   	push   %rbp
  804c7e:	48 89 e5             	mov    %rsp,%rbp
  804c81:	48 83 ec 10          	sub    $0x10,%rsp
  804c85:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804c89:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c8d:	48 89 c6             	mov    %rax,%rsi
  804c90:	bf 00 00 00 00       	mov    $0x0,%edi
  804c95:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  804c9c:	00 00 00 
  804c9f:	ff d0                	callq  *%rax
  804ca1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ca5:	48 89 c7             	mov    %rax,%rdi
  804ca8:	48 b8 ed 2e 80 00 00 	movabs $0x802eed,%rax
  804caf:	00 00 00 
  804cb2:	ff d0                	callq  *%rax
  804cb4:	48 89 c6             	mov    %rax,%rsi
  804cb7:	bf 00 00 00 00       	mov    $0x0,%edi
  804cbc:	48 b8 b9 22 80 00 00 	movabs $0x8022b9,%rax
  804cc3:	00 00 00 
  804cc6:	ff d0                	callq  *%rax
  804cc8:	c9                   	leaveq 
  804cc9:	c3                   	retq   

0000000000804cca <cputchar>:
  804cca:	55                   	push   %rbp
  804ccb:	48 89 e5             	mov    %rsp,%rbp
  804cce:	48 83 ec 20          	sub    $0x20,%rsp
  804cd2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804cd5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804cd8:	88 45 ff             	mov    %al,-0x1(%rbp)
  804cdb:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804cdf:	be 01 00 00 00       	mov    $0x1,%esi
  804ce4:	48 89 c7             	mov    %rax,%rdi
  804ce7:	48 b8 c6 20 80 00 00 	movabs $0x8020c6,%rax
  804cee:	00 00 00 
  804cf1:	ff d0                	callq  *%rax
  804cf3:	c9                   	leaveq 
  804cf4:	c3                   	retq   

0000000000804cf5 <getchar>:
  804cf5:	55                   	push   %rbp
  804cf6:	48 89 e5             	mov    %rsp,%rbp
  804cf9:	48 83 ec 10          	sub    $0x10,%rsp
  804cfd:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804d01:	ba 01 00 00 00       	mov    $0x1,%edx
  804d06:	48 89 c6             	mov    %rax,%rsi
  804d09:	bf 00 00 00 00       	mov    $0x0,%edi
  804d0e:	48 b8 e2 33 80 00 00 	movabs $0x8033e2,%rax
  804d15:	00 00 00 
  804d18:	ff d0                	callq  *%rax
  804d1a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d1d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d21:	79 05                	jns    804d28 <getchar+0x33>
  804d23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d26:	eb 14                	jmp    804d3c <getchar+0x47>
  804d28:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d2c:	7f 07                	jg     804d35 <getchar+0x40>
  804d2e:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804d33:	eb 07                	jmp    804d3c <getchar+0x47>
  804d35:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804d39:	0f b6 c0             	movzbl %al,%eax
  804d3c:	c9                   	leaveq 
  804d3d:	c3                   	retq   

0000000000804d3e <iscons>:
  804d3e:	55                   	push   %rbp
  804d3f:	48 89 e5             	mov    %rsp,%rbp
  804d42:	48 83 ec 20          	sub    $0x20,%rsp
  804d46:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804d49:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804d4d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804d50:	48 89 d6             	mov    %rdx,%rsi
  804d53:	89 c7                	mov    %eax,%edi
  804d55:	48 b8 b0 2f 80 00 00 	movabs $0x802fb0,%rax
  804d5c:	00 00 00 
  804d5f:	ff d0                	callq  *%rax
  804d61:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d64:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d68:	79 05                	jns    804d6f <iscons+0x31>
  804d6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d6d:	eb 1a                	jmp    804d89 <iscons+0x4b>
  804d6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d73:	8b 10                	mov    (%rax),%edx
  804d75:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  804d7c:	00 00 00 
  804d7f:	8b 00                	mov    (%rax),%eax
  804d81:	39 c2                	cmp    %eax,%edx
  804d83:	0f 94 c0             	sete   %al
  804d86:	0f b6 c0             	movzbl %al,%eax
  804d89:	c9                   	leaveq 
  804d8a:	c3                   	retq   

0000000000804d8b <opencons>:
  804d8b:	55                   	push   %rbp
  804d8c:	48 89 e5             	mov    %rsp,%rbp
  804d8f:	48 83 ec 10          	sub    $0x10,%rsp
  804d93:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804d97:	48 89 c7             	mov    %rax,%rdi
  804d9a:	48 b8 18 2f 80 00 00 	movabs $0x802f18,%rax
  804da1:	00 00 00 
  804da4:	ff d0                	callq  *%rax
  804da6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804da9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804dad:	79 05                	jns    804db4 <opencons+0x29>
  804daf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804db2:	eb 5b                	jmp    804e0f <opencons+0x84>
  804db4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804db8:	ba 07 04 00 00       	mov    $0x407,%edx
  804dbd:	48 89 c6             	mov    %rax,%rsi
  804dc0:	bf 00 00 00 00       	mov    $0x0,%edi
  804dc5:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  804dcc:	00 00 00 
  804dcf:	ff d0                	callq  *%rax
  804dd1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804dd4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804dd8:	79 05                	jns    804ddf <opencons+0x54>
  804dda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ddd:	eb 30                	jmp    804e0f <opencons+0x84>
  804ddf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804de3:	48 ba 20 81 80 00 00 	movabs $0x808120,%rdx
  804dea:	00 00 00 
  804ded:	8b 12                	mov    (%rdx),%edx
  804def:	89 10                	mov    %edx,(%rax)
  804df1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804df5:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804dfc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e00:	48 89 c7             	mov    %rax,%rdi
  804e03:	48 b8 ca 2e 80 00 00 	movabs $0x802eca,%rax
  804e0a:	00 00 00 
  804e0d:	ff d0                	callq  *%rax
  804e0f:	c9                   	leaveq 
  804e10:	c3                   	retq   

0000000000804e11 <devcons_read>:
  804e11:	55                   	push   %rbp
  804e12:	48 89 e5             	mov    %rsp,%rbp
  804e15:	48 83 ec 30          	sub    $0x30,%rsp
  804e19:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804e1d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804e21:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804e25:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804e2a:	75 07                	jne    804e33 <devcons_read+0x22>
  804e2c:	b8 00 00 00 00       	mov    $0x0,%eax
  804e31:	eb 4b                	jmp    804e7e <devcons_read+0x6d>
  804e33:	eb 0c                	jmp    804e41 <devcons_read+0x30>
  804e35:	48 b8 d0 21 80 00 00 	movabs $0x8021d0,%rax
  804e3c:	00 00 00 
  804e3f:	ff d0                	callq  *%rax
  804e41:	48 b8 10 21 80 00 00 	movabs $0x802110,%rax
  804e48:	00 00 00 
  804e4b:	ff d0                	callq  *%rax
  804e4d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804e50:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e54:	74 df                	je     804e35 <devcons_read+0x24>
  804e56:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e5a:	79 05                	jns    804e61 <devcons_read+0x50>
  804e5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e5f:	eb 1d                	jmp    804e7e <devcons_read+0x6d>
  804e61:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804e65:	75 07                	jne    804e6e <devcons_read+0x5d>
  804e67:	b8 00 00 00 00       	mov    $0x0,%eax
  804e6c:	eb 10                	jmp    804e7e <devcons_read+0x6d>
  804e6e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e71:	89 c2                	mov    %eax,%edx
  804e73:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e77:	88 10                	mov    %dl,(%rax)
  804e79:	b8 01 00 00 00       	mov    $0x1,%eax
  804e7e:	c9                   	leaveq 
  804e7f:	c3                   	retq   

0000000000804e80 <devcons_write>:
  804e80:	55                   	push   %rbp
  804e81:	48 89 e5             	mov    %rsp,%rbp
  804e84:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804e8b:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804e92:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804e99:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804ea0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804ea7:	eb 76                	jmp    804f1f <devcons_write+0x9f>
  804ea9:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804eb0:	89 c2                	mov    %eax,%edx
  804eb2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804eb5:	29 c2                	sub    %eax,%edx
  804eb7:	89 d0                	mov    %edx,%eax
  804eb9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804ebc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804ebf:	83 f8 7f             	cmp    $0x7f,%eax
  804ec2:	76 07                	jbe    804ecb <devcons_write+0x4b>
  804ec4:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804ecb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804ece:	48 63 d0             	movslq %eax,%rdx
  804ed1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ed4:	48 63 c8             	movslq %eax,%rcx
  804ed7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804ede:	48 01 c1             	add    %rax,%rcx
  804ee1:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804ee8:	48 89 ce             	mov    %rcx,%rsi
  804eeb:	48 89 c7             	mov    %rax,%rdi
  804eee:	48 b8 03 1c 80 00 00 	movabs $0x801c03,%rax
  804ef5:	00 00 00 
  804ef8:	ff d0                	callq  *%rax
  804efa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804efd:	48 63 d0             	movslq %eax,%rdx
  804f00:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804f07:	48 89 d6             	mov    %rdx,%rsi
  804f0a:	48 89 c7             	mov    %rax,%rdi
  804f0d:	48 b8 c6 20 80 00 00 	movabs $0x8020c6,%rax
  804f14:	00 00 00 
  804f17:	ff d0                	callq  *%rax
  804f19:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804f1c:	01 45 fc             	add    %eax,-0x4(%rbp)
  804f1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f22:	48 98                	cltq   
  804f24:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804f2b:	0f 82 78 ff ff ff    	jb     804ea9 <devcons_write+0x29>
  804f31:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f34:	c9                   	leaveq 
  804f35:	c3                   	retq   

0000000000804f36 <devcons_close>:
  804f36:	55                   	push   %rbp
  804f37:	48 89 e5             	mov    %rsp,%rbp
  804f3a:	48 83 ec 08          	sub    $0x8,%rsp
  804f3e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804f42:	b8 00 00 00 00       	mov    $0x0,%eax
  804f47:	c9                   	leaveq 
  804f48:	c3                   	retq   

0000000000804f49 <devcons_stat>:
  804f49:	55                   	push   %rbp
  804f4a:	48 89 e5             	mov    %rsp,%rbp
  804f4d:	48 83 ec 10          	sub    $0x10,%rsp
  804f51:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804f55:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804f59:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804f5d:	48 be da 5f 80 00 00 	movabs $0x805fda,%rsi
  804f64:	00 00 00 
  804f67:	48 89 c7             	mov    %rax,%rdi
  804f6a:	48 b8 df 18 80 00 00 	movabs $0x8018df,%rax
  804f71:	00 00 00 
  804f74:	ff d0                	callq  *%rax
  804f76:	b8 00 00 00 00       	mov    $0x0,%eax
  804f7b:	c9                   	leaveq 
  804f7c:	c3                   	retq   

0000000000804f7d <set_pgfault_handler>:
  804f7d:	55                   	push   %rbp
  804f7e:	48 89 e5             	mov    %rsp,%rbp
  804f81:	48 83 ec 20          	sub    $0x20,%rsp
  804f85:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804f89:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804f90:	00 00 00 
  804f93:	48 8b 00             	mov    (%rax),%rax
  804f96:	48 85 c0             	test   %rax,%rax
  804f99:	75 6f                	jne    80500a <set_pgfault_handler+0x8d>
  804f9b:	ba 07 00 00 00       	mov    $0x7,%edx
  804fa0:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804fa5:	bf 00 00 00 00       	mov    $0x0,%edi
  804faa:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  804fb1:	00 00 00 
  804fb4:	ff d0                	callq  *%rax
  804fb6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804fb9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804fbd:	79 30                	jns    804fef <set_pgfault_handler+0x72>
  804fbf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804fc2:	89 c1                	mov    %eax,%ecx
  804fc4:	48 ba e8 5f 80 00 00 	movabs $0x805fe8,%rdx
  804fcb:	00 00 00 
  804fce:	be 22 00 00 00       	mov    $0x22,%esi
  804fd3:	48 bf 07 60 80 00 00 	movabs $0x806007,%rdi
  804fda:	00 00 00 
  804fdd:	b8 00 00 00 00       	mov    $0x0,%eax
  804fe2:	49 b8 f1 0a 80 00 00 	movabs $0x800af1,%r8
  804fe9:	00 00 00 
  804fec:	41 ff d0             	callq  *%r8
  804fef:	48 be 1d 50 80 00 00 	movabs $0x80501d,%rsi
  804ff6:	00 00 00 
  804ff9:	bf 00 00 00 00       	mov    $0x0,%edi
  804ffe:	48 b8 98 23 80 00 00 	movabs $0x802398,%rax
  805005:	00 00 00 
  805008:	ff d0                	callq  *%rax
  80500a:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805011:	00 00 00 
  805014:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805018:	48 89 10             	mov    %rdx,(%rax)
  80501b:	c9                   	leaveq 
  80501c:	c3                   	retq   

000000000080501d <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80501d:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  805020:	48 a1 00 d0 80 00 00 	movabs 0x80d000,%rax
  805027:	00 00 00 
call *%rax
  80502a:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80502c:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  805033:	00 08 
    movq 152(%rsp), %rax
  805035:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  80503c:	00 
    movq 136(%rsp), %rbx
  80503d:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  805044:	00 
movq %rbx, (%rax)
  805045:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  805048:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  80504c:	4c 8b 3c 24          	mov    (%rsp),%r15
  805050:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  805055:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  80505a:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  80505f:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  805064:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  805069:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80506e:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  805073:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  805078:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  80507d:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  805082:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  805087:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  80508c:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  805091:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  805096:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80509a:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80509e:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80509f:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8050a4:	c3                   	retq   

00000000008050a5 <pageref>:
  8050a5:	55                   	push   %rbp
  8050a6:	48 89 e5             	mov    %rsp,%rbp
  8050a9:	48 83 ec 18          	sub    $0x18,%rsp
  8050ad:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8050b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8050b5:	48 c1 e8 15          	shr    $0x15,%rax
  8050b9:	48 89 c2             	mov    %rax,%rdx
  8050bc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8050c3:	01 00 00 
  8050c6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8050ca:	83 e0 01             	and    $0x1,%eax
  8050cd:	48 85 c0             	test   %rax,%rax
  8050d0:	75 07                	jne    8050d9 <pageref+0x34>
  8050d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8050d7:	eb 53                	jmp    80512c <pageref+0x87>
  8050d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8050dd:	48 c1 e8 0c          	shr    $0xc,%rax
  8050e1:	48 89 c2             	mov    %rax,%rdx
  8050e4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8050eb:	01 00 00 
  8050ee:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8050f2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8050f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8050fa:	83 e0 01             	and    $0x1,%eax
  8050fd:	48 85 c0             	test   %rax,%rax
  805100:	75 07                	jne    805109 <pageref+0x64>
  805102:	b8 00 00 00 00       	mov    $0x0,%eax
  805107:	eb 23                	jmp    80512c <pageref+0x87>
  805109:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80510d:	48 c1 e8 0c          	shr    $0xc,%rax
  805111:	48 89 c2             	mov    %rax,%rdx
  805114:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80511b:	00 00 00 
  80511e:	48 c1 e2 04          	shl    $0x4,%rdx
  805122:	48 01 d0             	add    %rdx,%rax
  805125:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  805129:	0f b7 c0             	movzwl %ax,%eax
  80512c:	c9                   	leaveq 
  80512d:	c3                   	retq   

000000000080512e <inet_addr>:
  80512e:	55                   	push   %rbp
  80512f:	48 89 e5             	mov    %rsp,%rbp
  805132:	48 83 ec 20          	sub    $0x20,%rsp
  805136:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80513a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80513e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805142:	48 89 d6             	mov    %rdx,%rsi
  805145:	48 89 c7             	mov    %rax,%rdi
  805148:	48 b8 64 51 80 00 00 	movabs $0x805164,%rax
  80514f:	00 00 00 
  805152:	ff d0                	callq  *%rax
  805154:	85 c0                	test   %eax,%eax
  805156:	74 05                	je     80515d <inet_addr+0x2f>
  805158:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80515b:	eb 05                	jmp    805162 <inet_addr+0x34>
  80515d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  805162:	c9                   	leaveq 
  805163:	c3                   	retq   

0000000000805164 <inet_aton>:
  805164:	55                   	push   %rbp
  805165:	48 89 e5             	mov    %rsp,%rbp
  805168:	48 83 ec 40          	sub    $0x40,%rsp
  80516c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  805170:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  805174:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  805178:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80517c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805180:	0f b6 00             	movzbl (%rax),%eax
  805183:	0f be c0             	movsbl %al,%eax
  805186:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805189:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80518c:	3c 2f                	cmp    $0x2f,%al
  80518e:	76 07                	jbe    805197 <inet_aton+0x33>
  805190:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805193:	3c 39                	cmp    $0x39,%al
  805195:	76 0a                	jbe    8051a1 <inet_aton+0x3d>
  805197:	b8 00 00 00 00       	mov    $0x0,%eax
  80519c:	e9 68 02 00 00       	jmpq   805409 <inet_aton+0x2a5>
  8051a1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8051a8:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  8051af:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  8051b3:	75 40                	jne    8051f5 <inet_aton+0x91>
  8051b5:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8051ba:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8051be:	0f b6 00             	movzbl (%rax),%eax
  8051c1:	0f be c0             	movsbl %al,%eax
  8051c4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8051c7:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  8051cb:	74 06                	je     8051d3 <inet_aton+0x6f>
  8051cd:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  8051d1:	75 1b                	jne    8051ee <inet_aton+0x8a>
  8051d3:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  8051da:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8051df:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8051e3:	0f b6 00             	movzbl (%rax),%eax
  8051e6:	0f be c0             	movsbl %al,%eax
  8051e9:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8051ec:	eb 07                	jmp    8051f5 <inet_aton+0x91>
  8051ee:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  8051f5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051f8:	3c 2f                	cmp    $0x2f,%al
  8051fa:	76 2f                	jbe    80522b <inet_aton+0xc7>
  8051fc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051ff:	3c 39                	cmp    $0x39,%al
  805201:	77 28                	ja     80522b <inet_aton+0xc7>
  805203:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805206:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  80520a:	89 c2                	mov    %eax,%edx
  80520c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80520f:	01 d0                	add    %edx,%eax
  805211:	83 e8 30             	sub    $0x30,%eax
  805214:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805217:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80521c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805220:	0f b6 00             	movzbl (%rax),%eax
  805223:	0f be c0             	movsbl %al,%eax
  805226:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805229:	eb ca                	jmp    8051f5 <inet_aton+0x91>
  80522b:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  80522f:	75 72                	jne    8052a3 <inet_aton+0x13f>
  805231:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805234:	3c 2f                	cmp    $0x2f,%al
  805236:	76 07                	jbe    80523f <inet_aton+0xdb>
  805238:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80523b:	3c 39                	cmp    $0x39,%al
  80523d:	76 1c                	jbe    80525b <inet_aton+0xf7>
  80523f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805242:	3c 60                	cmp    $0x60,%al
  805244:	76 07                	jbe    80524d <inet_aton+0xe9>
  805246:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805249:	3c 66                	cmp    $0x66,%al
  80524b:	76 0e                	jbe    80525b <inet_aton+0xf7>
  80524d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805250:	3c 40                	cmp    $0x40,%al
  805252:	76 4f                	jbe    8052a3 <inet_aton+0x13f>
  805254:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805257:	3c 46                	cmp    $0x46,%al
  805259:	77 48                	ja     8052a3 <inet_aton+0x13f>
  80525b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80525e:	c1 e0 04             	shl    $0x4,%eax
  805261:	89 c2                	mov    %eax,%edx
  805263:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805266:	8d 48 0a             	lea    0xa(%rax),%ecx
  805269:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80526c:	3c 60                	cmp    $0x60,%al
  80526e:	76 0e                	jbe    80527e <inet_aton+0x11a>
  805270:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805273:	3c 7a                	cmp    $0x7a,%al
  805275:	77 07                	ja     80527e <inet_aton+0x11a>
  805277:	b8 61 00 00 00       	mov    $0x61,%eax
  80527c:	eb 05                	jmp    805283 <inet_aton+0x11f>
  80527e:	b8 41 00 00 00       	mov    $0x41,%eax
  805283:	29 c1                	sub    %eax,%ecx
  805285:	89 c8                	mov    %ecx,%eax
  805287:	09 d0                	or     %edx,%eax
  805289:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80528c:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805291:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805295:	0f b6 00             	movzbl (%rax),%eax
  805298:	0f be c0             	movsbl %al,%eax
  80529b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80529e:	e9 52 ff ff ff       	jmpq   8051f5 <inet_aton+0x91>
  8052a3:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  8052a7:	75 40                	jne    8052e9 <inet_aton+0x185>
  8052a9:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8052ad:	48 83 c0 0c          	add    $0xc,%rax
  8052b1:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
  8052b5:	72 0a                	jb     8052c1 <inet_aton+0x15d>
  8052b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8052bc:	e9 48 01 00 00       	jmpq   805409 <inet_aton+0x2a5>
  8052c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8052c5:	48 8d 50 04          	lea    0x4(%rax),%rdx
  8052c9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8052cd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8052d0:	89 10                	mov    %edx,(%rax)
  8052d2:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8052d7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8052db:	0f b6 00             	movzbl (%rax),%eax
  8052de:	0f be c0             	movsbl %al,%eax
  8052e1:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8052e4:	e9 a0 fe ff ff       	jmpq   805189 <inet_aton+0x25>
  8052e9:	90                   	nop
  8052ea:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8052ee:	74 3c                	je     80532c <inet_aton+0x1c8>
  8052f0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052f3:	3c 1f                	cmp    $0x1f,%al
  8052f5:	76 2b                	jbe    805322 <inet_aton+0x1be>
  8052f7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052fa:	84 c0                	test   %al,%al
  8052fc:	78 24                	js     805322 <inet_aton+0x1be>
  8052fe:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  805302:	74 28                	je     80532c <inet_aton+0x1c8>
  805304:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  805308:	74 22                	je     80532c <inet_aton+0x1c8>
  80530a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  80530e:	74 1c                	je     80532c <inet_aton+0x1c8>
  805310:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  805314:	74 16                	je     80532c <inet_aton+0x1c8>
  805316:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  80531a:	74 10                	je     80532c <inet_aton+0x1c8>
  80531c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  805320:	74 0a                	je     80532c <inet_aton+0x1c8>
  805322:	b8 00 00 00 00       	mov    $0x0,%eax
  805327:	e9 dd 00 00 00       	jmpq   805409 <inet_aton+0x2a5>
  80532c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805330:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  805334:	48 29 c2             	sub    %rax,%rdx
  805337:	48 89 d0             	mov    %rdx,%rax
  80533a:	48 c1 f8 02          	sar    $0x2,%rax
  80533e:	83 c0 01             	add    $0x1,%eax
  805341:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  805344:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  805348:	0f 87 98 00 00 00    	ja     8053e6 <inet_aton+0x282>
  80534e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  805351:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  805358:	00 
  805359:	48 b8 18 60 80 00 00 	movabs $0x806018,%rax
  805360:	00 00 00 
  805363:	48 01 d0             	add    %rdx,%rax
  805366:	48 8b 00             	mov    (%rax),%rax
  805369:	ff e0                	jmpq   *%rax
  80536b:	b8 00 00 00 00       	mov    $0x0,%eax
  805370:	e9 94 00 00 00       	jmpq   805409 <inet_aton+0x2a5>
  805375:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  80537c:	76 0a                	jbe    805388 <inet_aton+0x224>
  80537e:	b8 00 00 00 00       	mov    $0x0,%eax
  805383:	e9 81 00 00 00       	jmpq   805409 <inet_aton+0x2a5>
  805388:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80538b:	c1 e0 18             	shl    $0x18,%eax
  80538e:	09 45 fc             	or     %eax,-0x4(%rbp)
  805391:	eb 53                	jmp    8053e6 <inet_aton+0x282>
  805393:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  80539a:	76 07                	jbe    8053a3 <inet_aton+0x23f>
  80539c:	b8 00 00 00 00       	mov    $0x0,%eax
  8053a1:	eb 66                	jmp    805409 <inet_aton+0x2a5>
  8053a3:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8053a6:	c1 e0 18             	shl    $0x18,%eax
  8053a9:	89 c2                	mov    %eax,%edx
  8053ab:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8053ae:	c1 e0 10             	shl    $0x10,%eax
  8053b1:	09 d0                	or     %edx,%eax
  8053b3:	09 45 fc             	or     %eax,-0x4(%rbp)
  8053b6:	eb 2e                	jmp    8053e6 <inet_aton+0x282>
  8053b8:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  8053bf:	76 07                	jbe    8053c8 <inet_aton+0x264>
  8053c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8053c6:	eb 41                	jmp    805409 <inet_aton+0x2a5>
  8053c8:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8053cb:	c1 e0 18             	shl    $0x18,%eax
  8053ce:	89 c2                	mov    %eax,%edx
  8053d0:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8053d3:	c1 e0 10             	shl    $0x10,%eax
  8053d6:	09 c2                	or     %eax,%edx
  8053d8:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8053db:	c1 e0 08             	shl    $0x8,%eax
  8053de:	09 d0                	or     %edx,%eax
  8053e0:	09 45 fc             	or     %eax,-0x4(%rbp)
  8053e3:	eb 01                	jmp    8053e6 <inet_aton+0x282>
  8053e5:	90                   	nop
  8053e6:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  8053eb:	74 17                	je     805404 <inet_aton+0x2a0>
  8053ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8053f0:	89 c7                	mov    %eax,%edi
  8053f2:	48 b8 82 55 80 00 00 	movabs $0x805582,%rax
  8053f9:	00 00 00 
  8053fc:	ff d0                	callq  *%rax
  8053fe:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  805402:	89 02                	mov    %eax,(%rdx)
  805404:	b8 01 00 00 00       	mov    $0x1,%eax
  805409:	c9                   	leaveq 
  80540a:	c3                   	retq   

000000000080540b <inet_ntoa>:
  80540b:	55                   	push   %rbp
  80540c:	48 89 e5             	mov    %rsp,%rbp
  80540f:	48 83 ec 30          	sub    $0x30,%rsp
  805413:	89 7d d0             	mov    %edi,-0x30(%rbp)
  805416:	8b 45 d0             	mov    -0x30(%rbp),%eax
  805419:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80541c:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  805423:	00 00 00 
  805426:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80542a:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80542e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  805432:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  805436:	e9 e0 00 00 00       	jmpq   80551b <inet_ntoa+0x110>
  80543b:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  80543f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805443:	0f b6 08             	movzbl (%rax),%ecx
  805446:	0f b6 d1             	movzbl %cl,%edx
  805449:	89 d0                	mov    %edx,%eax
  80544b:	c1 e0 02             	shl    $0x2,%eax
  80544e:	01 d0                	add    %edx,%eax
  805450:	c1 e0 03             	shl    $0x3,%eax
  805453:	01 d0                	add    %edx,%eax
  805455:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  80545c:	01 d0                	add    %edx,%eax
  80545e:	66 c1 e8 08          	shr    $0x8,%ax
  805462:	c0 e8 03             	shr    $0x3,%al
  805465:	88 45 ed             	mov    %al,-0x13(%rbp)
  805468:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  80546c:	89 d0                	mov    %edx,%eax
  80546e:	c1 e0 02             	shl    $0x2,%eax
  805471:	01 d0                	add    %edx,%eax
  805473:	01 c0                	add    %eax,%eax
  805475:	29 c1                	sub    %eax,%ecx
  805477:	89 c8                	mov    %ecx,%eax
  805479:	88 45 ed             	mov    %al,-0x13(%rbp)
  80547c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805480:	0f b6 00             	movzbl (%rax),%eax
  805483:	0f b6 d0             	movzbl %al,%edx
  805486:	89 d0                	mov    %edx,%eax
  805488:	c1 e0 02             	shl    $0x2,%eax
  80548b:	01 d0                	add    %edx,%eax
  80548d:	c1 e0 03             	shl    $0x3,%eax
  805490:	01 d0                	add    %edx,%eax
  805492:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  805499:	01 d0                	add    %edx,%eax
  80549b:	66 c1 e8 08          	shr    $0x8,%ax
  80549f:	89 c2                	mov    %eax,%edx
  8054a1:	c0 ea 03             	shr    $0x3,%dl
  8054a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8054a8:	88 10                	mov    %dl,(%rax)
  8054aa:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  8054ae:	8d 50 01             	lea    0x1(%rax),%edx
  8054b1:	88 55 ee             	mov    %dl,-0x12(%rbp)
  8054b4:	0f b6 c0             	movzbl %al,%eax
  8054b7:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  8054bb:	83 c2 30             	add    $0x30,%edx
  8054be:	48 98                	cltq   
  8054c0:	88 54 05 e0          	mov    %dl,-0x20(%rbp,%rax,1)
  8054c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8054c8:	0f b6 00             	movzbl (%rax),%eax
  8054cb:	84 c0                	test   %al,%al
  8054cd:	0f 85 6c ff ff ff    	jne    80543f <inet_ntoa+0x34>
  8054d3:	eb 1a                	jmp    8054ef <inet_ntoa+0xe4>
  8054d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8054d9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8054dd:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  8054e1:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  8054e5:	48 63 d2             	movslq %edx,%rdx
  8054e8:	0f b6 54 15 e0       	movzbl -0x20(%rbp,%rdx,1),%edx
  8054ed:	88 10                	mov    %dl,(%rax)
  8054ef:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  8054f3:	8d 50 ff             	lea    -0x1(%rax),%edx
  8054f6:	88 55 ee             	mov    %dl,-0x12(%rbp)
  8054f9:	84 c0                	test   %al,%al
  8054fb:	75 d8                	jne    8054d5 <inet_ntoa+0xca>
  8054fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805501:	48 8d 50 01          	lea    0x1(%rax),%rdx
  805505:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  805509:	c6 00 2e             	movb   $0x2e,(%rax)
  80550c:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  805511:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  805515:	83 c0 01             	add    $0x1,%eax
  805518:	88 45 ef             	mov    %al,-0x11(%rbp)
  80551b:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  80551f:	0f 86 16 ff ff ff    	jbe    80543b <inet_ntoa+0x30>
  805525:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  80552a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80552e:	c6 00 00             	movb   $0x0,(%rax)
  805531:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  805538:	00 00 00 
  80553b:	c9                   	leaveq 
  80553c:	c3                   	retq   

000000000080553d <htons>:
  80553d:	55                   	push   %rbp
  80553e:	48 89 e5             	mov    %rsp,%rbp
  805541:	48 83 ec 04          	sub    $0x4,%rsp
  805545:	89 f8                	mov    %edi,%eax
  805547:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  80554b:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  80554f:	c1 e0 08             	shl    $0x8,%eax
  805552:	89 c2                	mov    %eax,%edx
  805554:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  805558:	66 c1 e8 08          	shr    $0x8,%ax
  80555c:	09 d0                	or     %edx,%eax
  80555e:	c9                   	leaveq 
  80555f:	c3                   	retq   

0000000000805560 <ntohs>:
  805560:	55                   	push   %rbp
  805561:	48 89 e5             	mov    %rsp,%rbp
  805564:	48 83 ec 08          	sub    $0x8,%rsp
  805568:	89 f8                	mov    %edi,%eax
  80556a:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  80556e:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  805572:	89 c7                	mov    %eax,%edi
  805574:	48 b8 3d 55 80 00 00 	movabs $0x80553d,%rax
  80557b:	00 00 00 
  80557e:	ff d0                	callq  *%rax
  805580:	c9                   	leaveq 
  805581:	c3                   	retq   

0000000000805582 <htonl>:
  805582:	55                   	push   %rbp
  805583:	48 89 e5             	mov    %rsp,%rbp
  805586:	48 83 ec 04          	sub    $0x4,%rsp
  80558a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80558d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805590:	c1 e0 18             	shl    $0x18,%eax
  805593:	89 c2                	mov    %eax,%edx
  805595:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805598:	25 00 ff 00 00       	and    $0xff00,%eax
  80559d:	c1 e0 08             	shl    $0x8,%eax
  8055a0:	09 c2                	or     %eax,%edx
  8055a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8055a5:	25 00 00 ff 00       	and    $0xff0000,%eax
  8055aa:	48 c1 e8 08          	shr    $0x8,%rax
  8055ae:	09 c2                	or     %eax,%edx
  8055b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8055b3:	c1 e8 18             	shr    $0x18,%eax
  8055b6:	09 d0                	or     %edx,%eax
  8055b8:	c9                   	leaveq 
  8055b9:	c3                   	retq   

00000000008055ba <ntohl>:
  8055ba:	55                   	push   %rbp
  8055bb:	48 89 e5             	mov    %rsp,%rbp
  8055be:	48 83 ec 08          	sub    $0x8,%rsp
  8055c2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8055c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8055c8:	89 c7                	mov    %eax,%edi
  8055ca:	48 b8 82 55 80 00 00 	movabs $0x805582,%rax
  8055d1:	00 00 00 
  8055d4:	ff d0                	callq  *%rax
  8055d6:	c9                   	leaveq 
  8055d7:	c3                   	retq   
