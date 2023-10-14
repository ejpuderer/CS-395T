
obj/user/testpiperace2:     file format elf64-x86-64


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
  80003c:	e8 e2 02 00 00       	callq  800323 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 40          	sub    $0x40,%rsp
  80004b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80004e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800052:	48 bf 20 4a 80 00 00 	movabs $0x804a20,%rdi
  800059:	00 00 00 
  80005c:	b8 00 00 00 00       	mov    $0x0,%eax
  800061:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  800068:	00 00 00 
  80006b:	ff d2                	callq  *%rdx
  80006d:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800071:	48 89 c7             	mov    %rax,%rdi
  800074:	48 b8 10 3e 80 00 00 	movabs $0x803e10,%rax
  80007b:	00 00 00 
  80007e:	ff d0                	callq  *%rax
  800080:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800083:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800087:	79 30                	jns    8000b9 <umain+0x76>
  800089:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80008c:	89 c1                	mov    %eax,%ecx
  80008e:	48 ba 42 4a 80 00 00 	movabs $0x804a42,%rdx
  800095:	00 00 00 
  800098:	be 0e 00 00 00       	mov    $0xe,%esi
  80009d:	48 bf 4b 4a 80 00 00 	movabs $0x804a4b,%rdi
  8000a4:	00 00 00 
  8000a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ac:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8000b3:	00 00 00 
  8000b6:	41 ff d0             	callq  *%r8
  8000b9:	48 b8 64 23 80 00 00 	movabs $0x802364,%rax
  8000c0:	00 00 00 
  8000c3:	ff d0                	callq  *%rax
  8000c5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000c8:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000cc:	79 30                	jns    8000fe <umain+0xbb>
  8000ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d1:	89 c1                	mov    %eax,%ecx
  8000d3:	48 ba 63 4a 80 00 00 	movabs $0x804a63,%rdx
  8000da:	00 00 00 
  8000dd:	be 10 00 00 00       	mov    $0x10,%esi
  8000e2:	48 bf 4b 4a 80 00 00 	movabs $0x804a4b,%rdi
  8000e9:	00 00 00 
  8000ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f1:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8000f8:	00 00 00 
  8000fb:	41 ff d0             	callq  *%r8
  8000fe:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800102:	0f 85 c0 00 00 00    	jne    8001c8 <umain+0x185>
  800108:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80010b:	89 c7                	mov    %eax,%edi
  80010d:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  800114:	00 00 00 
  800117:	ff d0                	callq  *%rax
  800119:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800120:	e9 8a 00 00 00       	jmpq   8001af <umain+0x16c>
  800125:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  800128:	ba 67 66 66 66       	mov    $0x66666667,%edx
  80012d:	89 c8                	mov    %ecx,%eax
  80012f:	f7 ea                	imul   %edx
  800131:	c1 fa 02             	sar    $0x2,%edx
  800134:	89 c8                	mov    %ecx,%eax
  800136:	c1 f8 1f             	sar    $0x1f,%eax
  800139:	29 c2                	sub    %eax,%edx
  80013b:	89 d0                	mov    %edx,%eax
  80013d:	c1 e0 02             	shl    $0x2,%eax
  800140:	01 d0                	add    %edx,%eax
  800142:	01 c0                	add    %eax,%eax
  800144:	29 c1                	sub    %eax,%ecx
  800146:	89 ca                	mov    %ecx,%edx
  800148:	85 d2                	test   %edx,%edx
  80014a:	75 20                	jne    80016c <umain+0x129>
  80014c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80014f:	89 c6                	mov    %eax,%esi
  800151:	48 bf 6c 4a 80 00 00 	movabs $0x804a6c,%rdi
  800158:	00 00 00 
  80015b:	b8 00 00 00 00       	mov    $0x0,%eax
  800160:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  800167:	00 00 00 
  80016a:	ff d2                	callq  *%rdx
  80016c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80016f:	be 0a 00 00 00       	mov    $0xa,%esi
  800174:	89 c7                	mov    %eax,%edi
  800176:	48 b8 48 29 80 00 00 	movabs $0x802948,%rax
  80017d:	00 00 00 
  800180:	ff d0                	callq  *%rax
  800182:	48 b8 a8 1a 80 00 00 	movabs $0x801aa8,%rax
  800189:	00 00 00 
  80018c:	ff d0                	callq  *%rax
  80018e:	bf 0a 00 00 00       	mov    $0xa,%edi
  800193:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  80019a:	00 00 00 
  80019d:	ff d0                	callq  *%rax
  80019f:	48 b8 a8 1a 80 00 00 	movabs $0x801aa8,%rax
  8001a6:	00 00 00 
  8001a9:	ff d0                	callq  *%rax
  8001ab:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8001af:	81 7d fc c7 00 00 00 	cmpl   $0xc7,-0x4(%rbp)
  8001b6:	0f 8e 69 ff ff ff    	jle    800125 <umain+0xe2>
  8001bc:	48 b8 a6 03 80 00 00 	movabs $0x8003a6,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001cb:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001d0:	48 98                	cltq   
  8001d2:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001d9:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001e0:	00 00 00 
  8001e3:	48 01 d0             	add    %rdx,%rax
  8001e6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8001ea:	eb 4d                	jmp    800239 <umain+0x1f6>
  8001ec:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8001ef:	89 c7                	mov    %eax,%edi
  8001f1:	48 b8 d9 40 80 00 00 	movabs $0x8040d9,%rax
  8001f8:	00 00 00 
  8001fb:	ff d0                	callq  *%rax
  8001fd:	85 c0                	test   %eax,%eax
  8001ff:	74 38                	je     800239 <umain+0x1f6>
  800201:	48 bf 70 4a 80 00 00 	movabs $0x804a70,%rdi
  800208:	00 00 00 
  80020b:	b8 00 00 00 00       	mov    $0x0,%eax
  800210:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  800217:	00 00 00 
  80021a:	ff d2                	callq  *%rdx
  80021c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80021f:	89 c7                	mov    %eax,%edi
  800221:	48 b8 26 1a 80 00 00 	movabs $0x801a26,%rax
  800228:	00 00 00 
  80022b:	ff d0                	callq  *%rax
  80022d:	48 b8 a6 03 80 00 00 	movabs $0x8003a6,%rax
  800234:	00 00 00 
  800237:	ff d0                	callq  *%rax
  800239:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80023d:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  800243:	83 f8 02             	cmp    $0x2,%eax
  800246:	74 a4                	je     8001ec <umain+0x1a9>
  800248:	48 bf 8c 4a 80 00 00 	movabs $0x804a8c,%rdi
  80024f:	00 00 00 
  800252:	b8 00 00 00 00       	mov    $0x0,%eax
  800257:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  80025e:	00 00 00 
  800261:	ff d2                	callq  *%rdx
  800263:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800266:	89 c7                	mov    %eax,%edi
  800268:	48 b8 d9 40 80 00 00 	movabs $0x8040d9,%rax
  80026f:	00 00 00 
  800272:	ff d0                	callq  *%rax
  800274:	85 c0                	test   %eax,%eax
  800276:	74 2a                	je     8002a2 <umain+0x25f>
  800278:	48 ba a8 4a 80 00 00 	movabs $0x804aa8,%rdx
  80027f:	00 00 00 
  800282:	be 41 00 00 00       	mov    $0x41,%esi
  800287:	48 bf 4b 4a 80 00 00 	movabs $0x804a4b,%rdi
  80028e:	00 00 00 
  800291:	b8 00 00 00 00       	mov    $0x0,%eax
  800296:	48 b9 c9 03 80 00 00 	movabs $0x8003c9,%rcx
  80029d:	00 00 00 
  8002a0:	ff d1                	callq  *%rcx
  8002a2:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8002a5:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8002a9:	48 89 d6             	mov    %rdx,%rsi
  8002ac:	89 c7                	mov    %eax,%edi
  8002ae:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  8002b5:	00 00 00 
  8002b8:	ff d0                	callq  *%rax
  8002ba:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8002bd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8002c1:	79 30                	jns    8002f3 <umain+0x2b0>
  8002c3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002c6:	89 c1                	mov    %eax,%ecx
  8002c8:	48 ba d2 4a 80 00 00 	movabs $0x804ad2,%rdx
  8002cf:	00 00 00 
  8002d2:	be 43 00 00 00       	mov    $0x43,%esi
  8002d7:	48 bf 4b 4a 80 00 00 	movabs $0x804a4b,%rdi
  8002de:	00 00 00 
  8002e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8002e6:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8002ed:	00 00 00 
  8002f0:	41 ff d0             	callq  *%r8
  8002f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8002f7:	48 89 c7             	mov    %rax,%rdi
  8002fa:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  800301:	00 00 00 
  800304:	ff d0                	callq  *%rax
  800306:	48 bf ea 4a 80 00 00 	movabs $0x804aea,%rdi
  80030d:	00 00 00 
  800310:	b8 00 00 00 00       	mov    $0x0,%eax
  800315:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  80031c:	00 00 00 
  80031f:	ff d2                	callq  *%rdx
  800321:	c9                   	leaveq 
  800322:	c3                   	retq   

0000000000800323 <libmain>:
  800323:	55                   	push   %rbp
  800324:	48 89 e5             	mov    %rsp,%rbp
  800327:	48 83 ec 10          	sub    $0x10,%rsp
  80032b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80032e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800332:	48 b8 6a 1a 80 00 00 	movabs $0x801a6a,%rax
  800339:	00 00 00 
  80033c:	ff d0                	callq  *%rax
  80033e:	25 ff 03 00 00       	and    $0x3ff,%eax
  800343:	48 98                	cltq   
  800345:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80034c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800353:	00 00 00 
  800356:	48 01 c2             	add    %rax,%rdx
  800359:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800360:	00 00 00 
  800363:	48 89 10             	mov    %rdx,(%rax)
  800366:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80036a:	7e 14                	jle    800380 <libmain+0x5d>
  80036c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800370:	48 8b 10             	mov    (%rax),%rdx
  800373:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80037a:	00 00 00 
  80037d:	48 89 10             	mov    %rdx,(%rax)
  800380:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800384:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800387:	48 89 d6             	mov    %rdx,%rsi
  80038a:	89 c7                	mov    %eax,%edi
  80038c:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800393:	00 00 00 
  800396:	ff d0                	callq  *%rax
  800398:	48 b8 a6 03 80 00 00 	movabs $0x8003a6,%rax
  80039f:	00 00 00 
  8003a2:	ff d0                	callq  *%rax
  8003a4:	c9                   	leaveq 
  8003a5:	c3                   	retq   

00000000008003a6 <exit>:
  8003a6:	55                   	push   %rbp
  8003a7:	48 89 e5             	mov    %rsp,%rbp
  8003aa:	48 b8 1a 29 80 00 00 	movabs $0x80291a,%rax
  8003b1:	00 00 00 
  8003b4:	ff d0                	callq  *%rax
  8003b6:	bf 00 00 00 00       	mov    $0x0,%edi
  8003bb:	48 b8 26 1a 80 00 00 	movabs $0x801a26,%rax
  8003c2:	00 00 00 
  8003c5:	ff d0                	callq  *%rax
  8003c7:	5d                   	pop    %rbp
  8003c8:	c3                   	retq   

00000000008003c9 <_panic>:
  8003c9:	55                   	push   %rbp
  8003ca:	48 89 e5             	mov    %rsp,%rbp
  8003cd:	53                   	push   %rbx
  8003ce:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8003d5:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8003dc:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8003e2:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8003e9:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8003f0:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8003f7:	84 c0                	test   %al,%al
  8003f9:	74 23                	je     80041e <_panic+0x55>
  8003fb:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800402:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800406:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80040a:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80040e:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800412:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800416:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80041a:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80041e:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800425:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80042c:	00 00 00 
  80042f:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800436:	00 00 00 
  800439:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80043d:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800444:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80044b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800452:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800459:	00 00 00 
  80045c:	48 8b 18             	mov    (%rax),%rbx
  80045f:	48 b8 6a 1a 80 00 00 	movabs $0x801a6a,%rax
  800466:	00 00 00 
  800469:	ff d0                	callq  *%rax
  80046b:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800471:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800478:	41 89 c8             	mov    %ecx,%r8d
  80047b:	48 89 d1             	mov    %rdx,%rcx
  80047e:	48 89 da             	mov    %rbx,%rdx
  800481:	89 c6                	mov    %eax,%esi
  800483:	48 bf 08 4b 80 00 00 	movabs $0x804b08,%rdi
  80048a:	00 00 00 
  80048d:	b8 00 00 00 00       	mov    $0x0,%eax
  800492:	49 b9 02 06 80 00 00 	movabs $0x800602,%r9
  800499:	00 00 00 
  80049c:	41 ff d1             	callq  *%r9
  80049f:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8004a6:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8004ad:	48 89 d6             	mov    %rdx,%rsi
  8004b0:	48 89 c7             	mov    %rax,%rdi
  8004b3:	48 b8 56 05 80 00 00 	movabs $0x800556,%rax
  8004ba:	00 00 00 
  8004bd:	ff d0                	callq  *%rax
  8004bf:	48 bf 2b 4b 80 00 00 	movabs $0x804b2b,%rdi
  8004c6:	00 00 00 
  8004c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8004ce:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  8004d5:	00 00 00 
  8004d8:	ff d2                	callq  *%rdx
  8004da:	cc                   	int3   
  8004db:	eb fd                	jmp    8004da <_panic+0x111>

00000000008004dd <putch>:
  8004dd:	55                   	push   %rbp
  8004de:	48 89 e5             	mov    %rsp,%rbp
  8004e1:	48 83 ec 10          	sub    $0x10,%rsp
  8004e5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8004e8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8004ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004f0:	8b 00                	mov    (%rax),%eax
  8004f2:	8d 48 01             	lea    0x1(%rax),%ecx
  8004f5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004f9:	89 0a                	mov    %ecx,(%rdx)
  8004fb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8004fe:	89 d1                	mov    %edx,%ecx
  800500:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800504:	48 98                	cltq   
  800506:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80050a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80050e:	8b 00                	mov    (%rax),%eax
  800510:	3d ff 00 00 00       	cmp    $0xff,%eax
  800515:	75 2c                	jne    800543 <putch+0x66>
  800517:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80051b:	8b 00                	mov    (%rax),%eax
  80051d:	48 98                	cltq   
  80051f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800523:	48 83 c2 08          	add    $0x8,%rdx
  800527:	48 89 c6             	mov    %rax,%rsi
  80052a:	48 89 d7             	mov    %rdx,%rdi
  80052d:	48 b8 9e 19 80 00 00 	movabs $0x80199e,%rax
  800534:	00 00 00 
  800537:	ff d0                	callq  *%rax
  800539:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80053d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800543:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800547:	8b 40 04             	mov    0x4(%rax),%eax
  80054a:	8d 50 01             	lea    0x1(%rax),%edx
  80054d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800551:	89 50 04             	mov    %edx,0x4(%rax)
  800554:	c9                   	leaveq 
  800555:	c3                   	retq   

0000000000800556 <vcprintf>:
  800556:	55                   	push   %rbp
  800557:	48 89 e5             	mov    %rsp,%rbp
  80055a:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800561:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800568:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80056f:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800576:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  80057d:	48 8b 0a             	mov    (%rdx),%rcx
  800580:	48 89 08             	mov    %rcx,(%rax)
  800583:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800587:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80058b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80058f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800593:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80059a:	00 00 00 
  80059d:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8005a4:	00 00 00 
  8005a7:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8005ae:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8005b5:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8005bc:	48 89 c6             	mov    %rax,%rsi
  8005bf:	48 bf dd 04 80 00 00 	movabs $0x8004dd,%rdi
  8005c6:	00 00 00 
  8005c9:	48 b8 b5 09 80 00 00 	movabs $0x8009b5,%rax
  8005d0:	00 00 00 
  8005d3:	ff d0                	callq  *%rax
  8005d5:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8005db:	48 98                	cltq   
  8005dd:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8005e4:	48 83 c2 08          	add    $0x8,%rdx
  8005e8:	48 89 c6             	mov    %rax,%rsi
  8005eb:	48 89 d7             	mov    %rdx,%rdi
  8005ee:	48 b8 9e 19 80 00 00 	movabs $0x80199e,%rax
  8005f5:	00 00 00 
  8005f8:	ff d0                	callq  *%rax
  8005fa:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800600:	c9                   	leaveq 
  800601:	c3                   	retq   

0000000000800602 <cprintf>:
  800602:	55                   	push   %rbp
  800603:	48 89 e5             	mov    %rsp,%rbp
  800606:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80060d:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800614:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80061b:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800622:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800629:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800630:	84 c0                	test   %al,%al
  800632:	74 20                	je     800654 <cprintf+0x52>
  800634:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800638:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80063c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800640:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800644:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800648:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80064c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800650:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800654:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80065b:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800662:	00 00 00 
  800665:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80066c:	00 00 00 
  80066f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800673:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80067a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800681:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800688:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80068f:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800696:	48 8b 0a             	mov    (%rdx),%rcx
  800699:	48 89 08             	mov    %rcx,(%rax)
  80069c:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006a0:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006a4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8006a8:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8006ac:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8006b3:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8006ba:	48 89 d6             	mov    %rdx,%rsi
  8006bd:	48 89 c7             	mov    %rax,%rdi
  8006c0:	48 b8 56 05 80 00 00 	movabs $0x800556,%rax
  8006c7:	00 00 00 
  8006ca:	ff d0                	callq  *%rax
  8006cc:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8006d2:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8006d8:	c9                   	leaveq 
  8006d9:	c3                   	retq   

00000000008006da <printnum>:
  8006da:	55                   	push   %rbp
  8006db:	48 89 e5             	mov    %rsp,%rbp
  8006de:	53                   	push   %rbx
  8006df:	48 83 ec 38          	sub    $0x38,%rsp
  8006e3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006e7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8006eb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8006ef:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8006f2:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8006f6:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8006fa:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8006fd:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800701:	77 3b                	ja     80073e <printnum+0x64>
  800703:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800706:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  80070a:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  80070d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800711:	ba 00 00 00 00       	mov    $0x0,%edx
  800716:	48 f7 f3             	div    %rbx
  800719:	48 89 c2             	mov    %rax,%rdx
  80071c:	8b 7d cc             	mov    -0x34(%rbp),%edi
  80071f:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800722:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800726:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80072a:	41 89 f9             	mov    %edi,%r9d
  80072d:	48 89 c7             	mov    %rax,%rdi
  800730:	48 b8 da 06 80 00 00 	movabs $0x8006da,%rax
  800737:	00 00 00 
  80073a:	ff d0                	callq  *%rax
  80073c:	eb 1e                	jmp    80075c <printnum+0x82>
  80073e:	eb 12                	jmp    800752 <printnum+0x78>
  800740:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800744:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800747:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80074b:	48 89 ce             	mov    %rcx,%rsi
  80074e:	89 d7                	mov    %edx,%edi
  800750:	ff d0                	callq  *%rax
  800752:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800756:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  80075a:	7f e4                	jg     800740 <printnum+0x66>
  80075c:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80075f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800763:	ba 00 00 00 00       	mov    $0x0,%edx
  800768:	48 f7 f1             	div    %rcx
  80076b:	48 89 d0             	mov    %rdx,%rax
  80076e:	48 ba 30 4d 80 00 00 	movabs $0x804d30,%rdx
  800775:	00 00 00 
  800778:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  80077c:	0f be d0             	movsbl %al,%edx
  80077f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800783:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800787:	48 89 ce             	mov    %rcx,%rsi
  80078a:	89 d7                	mov    %edx,%edi
  80078c:	ff d0                	callq  *%rax
  80078e:	48 83 c4 38          	add    $0x38,%rsp
  800792:	5b                   	pop    %rbx
  800793:	5d                   	pop    %rbp
  800794:	c3                   	retq   

0000000000800795 <getuint>:
  800795:	55                   	push   %rbp
  800796:	48 89 e5             	mov    %rsp,%rbp
  800799:	48 83 ec 1c          	sub    $0x1c,%rsp
  80079d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007a1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007a4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007a8:	7e 52                	jle    8007fc <getuint+0x67>
  8007aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ae:	8b 00                	mov    (%rax),%eax
  8007b0:	83 f8 30             	cmp    $0x30,%eax
  8007b3:	73 24                	jae    8007d9 <getuint+0x44>
  8007b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007b9:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c1:	8b 00                	mov    (%rax),%eax
  8007c3:	89 c0                	mov    %eax,%eax
  8007c5:	48 01 d0             	add    %rdx,%rax
  8007c8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007cc:	8b 12                	mov    (%rdx),%edx
  8007ce:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007d1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007d5:	89 0a                	mov    %ecx,(%rdx)
  8007d7:	eb 17                	jmp    8007f0 <getuint+0x5b>
  8007d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007dd:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007e1:	48 89 d0             	mov    %rdx,%rax
  8007e4:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007e8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ec:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007f0:	48 8b 00             	mov    (%rax),%rax
  8007f3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007f7:	e9 a3 00 00 00       	jmpq   80089f <getuint+0x10a>
  8007fc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800800:	74 4f                	je     800851 <getuint+0xbc>
  800802:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800806:	8b 00                	mov    (%rax),%eax
  800808:	83 f8 30             	cmp    $0x30,%eax
  80080b:	73 24                	jae    800831 <getuint+0x9c>
  80080d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800811:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800815:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800819:	8b 00                	mov    (%rax),%eax
  80081b:	89 c0                	mov    %eax,%eax
  80081d:	48 01 d0             	add    %rdx,%rax
  800820:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800824:	8b 12                	mov    (%rdx),%edx
  800826:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800829:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082d:	89 0a                	mov    %ecx,(%rdx)
  80082f:	eb 17                	jmp    800848 <getuint+0xb3>
  800831:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800835:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800839:	48 89 d0             	mov    %rdx,%rax
  80083c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800840:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800844:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800848:	48 8b 00             	mov    (%rax),%rax
  80084b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80084f:	eb 4e                	jmp    80089f <getuint+0x10a>
  800851:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800855:	8b 00                	mov    (%rax),%eax
  800857:	83 f8 30             	cmp    $0x30,%eax
  80085a:	73 24                	jae    800880 <getuint+0xeb>
  80085c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800860:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800864:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800868:	8b 00                	mov    (%rax),%eax
  80086a:	89 c0                	mov    %eax,%eax
  80086c:	48 01 d0             	add    %rdx,%rax
  80086f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800873:	8b 12                	mov    (%rdx),%edx
  800875:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800878:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80087c:	89 0a                	mov    %ecx,(%rdx)
  80087e:	eb 17                	jmp    800897 <getuint+0x102>
  800880:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800884:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800888:	48 89 d0             	mov    %rdx,%rax
  80088b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80088f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800893:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800897:	8b 00                	mov    (%rax),%eax
  800899:	89 c0                	mov    %eax,%eax
  80089b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80089f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008a3:	c9                   	leaveq 
  8008a4:	c3                   	retq   

00000000008008a5 <getint>:
  8008a5:	55                   	push   %rbp
  8008a6:	48 89 e5             	mov    %rsp,%rbp
  8008a9:	48 83 ec 1c          	sub    $0x1c,%rsp
  8008ad:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8008b1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8008b4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8008b8:	7e 52                	jle    80090c <getint+0x67>
  8008ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008be:	8b 00                	mov    (%rax),%eax
  8008c0:	83 f8 30             	cmp    $0x30,%eax
  8008c3:	73 24                	jae    8008e9 <getint+0x44>
  8008c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008c9:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d1:	8b 00                	mov    (%rax),%eax
  8008d3:	89 c0                	mov    %eax,%eax
  8008d5:	48 01 d0             	add    %rdx,%rax
  8008d8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008dc:	8b 12                	mov    (%rdx),%edx
  8008de:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008e5:	89 0a                	mov    %ecx,(%rdx)
  8008e7:	eb 17                	jmp    800900 <getint+0x5b>
  8008e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ed:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008f1:	48 89 d0             	mov    %rdx,%rax
  8008f4:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008f8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008fc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800900:	48 8b 00             	mov    (%rax),%rax
  800903:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800907:	e9 a3 00 00 00       	jmpq   8009af <getint+0x10a>
  80090c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800910:	74 4f                	je     800961 <getint+0xbc>
  800912:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800916:	8b 00                	mov    (%rax),%eax
  800918:	83 f8 30             	cmp    $0x30,%eax
  80091b:	73 24                	jae    800941 <getint+0x9c>
  80091d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800921:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800925:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800929:	8b 00                	mov    (%rax),%eax
  80092b:	89 c0                	mov    %eax,%eax
  80092d:	48 01 d0             	add    %rdx,%rax
  800930:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800934:	8b 12                	mov    (%rdx),%edx
  800936:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800939:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80093d:	89 0a                	mov    %ecx,(%rdx)
  80093f:	eb 17                	jmp    800958 <getint+0xb3>
  800941:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800945:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800949:	48 89 d0             	mov    %rdx,%rax
  80094c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800950:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800954:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800958:	48 8b 00             	mov    (%rax),%rax
  80095b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80095f:	eb 4e                	jmp    8009af <getint+0x10a>
  800961:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800965:	8b 00                	mov    (%rax),%eax
  800967:	83 f8 30             	cmp    $0x30,%eax
  80096a:	73 24                	jae    800990 <getint+0xeb>
  80096c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800970:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800974:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800978:	8b 00                	mov    (%rax),%eax
  80097a:	89 c0                	mov    %eax,%eax
  80097c:	48 01 d0             	add    %rdx,%rax
  80097f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800983:	8b 12                	mov    (%rdx),%edx
  800985:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800988:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80098c:	89 0a                	mov    %ecx,(%rdx)
  80098e:	eb 17                	jmp    8009a7 <getint+0x102>
  800990:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800994:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800998:	48 89 d0             	mov    %rdx,%rax
  80099b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80099f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009a3:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009a7:	8b 00                	mov    (%rax),%eax
  8009a9:	48 98                	cltq   
  8009ab:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009b3:	c9                   	leaveq 
  8009b4:	c3                   	retq   

00000000008009b5 <vprintfmt>:
  8009b5:	55                   	push   %rbp
  8009b6:	48 89 e5             	mov    %rsp,%rbp
  8009b9:	41 54                	push   %r12
  8009bb:	53                   	push   %rbx
  8009bc:	48 83 ec 60          	sub    $0x60,%rsp
  8009c0:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8009c4:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8009c8:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009cc:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8009d0:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8009d4:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8009d8:	48 8b 0a             	mov    (%rdx),%rcx
  8009db:	48 89 08             	mov    %rcx,(%rax)
  8009de:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8009e2:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8009e6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8009ea:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8009ee:	eb 17                	jmp    800a07 <vprintfmt+0x52>
  8009f0:	85 db                	test   %ebx,%ebx
  8009f2:	0f 84 cc 04 00 00    	je     800ec4 <vprintfmt+0x50f>
  8009f8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009fc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a00:	48 89 d6             	mov    %rdx,%rsi
  800a03:	89 df                	mov    %ebx,%edi
  800a05:	ff d0                	callq  *%rax
  800a07:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a0b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a0f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a13:	0f b6 00             	movzbl (%rax),%eax
  800a16:	0f b6 d8             	movzbl %al,%ebx
  800a19:	83 fb 25             	cmp    $0x25,%ebx
  800a1c:	75 d2                	jne    8009f0 <vprintfmt+0x3b>
  800a1e:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a22:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a29:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a30:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a37:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800a3e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a42:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a46:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a4a:	0f b6 00             	movzbl (%rax),%eax
  800a4d:	0f b6 d8             	movzbl %al,%ebx
  800a50:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800a53:	83 f8 55             	cmp    $0x55,%eax
  800a56:	0f 87 34 04 00 00    	ja     800e90 <vprintfmt+0x4db>
  800a5c:	89 c0                	mov    %eax,%eax
  800a5e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800a65:	00 
  800a66:	48 b8 58 4d 80 00 00 	movabs $0x804d58,%rax
  800a6d:	00 00 00 
  800a70:	48 01 d0             	add    %rdx,%rax
  800a73:	48 8b 00             	mov    (%rax),%rax
  800a76:	ff e0                	jmpq   *%rax
  800a78:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800a7c:	eb c0                	jmp    800a3e <vprintfmt+0x89>
  800a7e:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800a82:	eb ba                	jmp    800a3e <vprintfmt+0x89>
  800a84:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800a8b:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800a8e:	89 d0                	mov    %edx,%eax
  800a90:	c1 e0 02             	shl    $0x2,%eax
  800a93:	01 d0                	add    %edx,%eax
  800a95:	01 c0                	add    %eax,%eax
  800a97:	01 d8                	add    %ebx,%eax
  800a99:	83 e8 30             	sub    $0x30,%eax
  800a9c:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a9f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800aa3:	0f b6 00             	movzbl (%rax),%eax
  800aa6:	0f be d8             	movsbl %al,%ebx
  800aa9:	83 fb 2f             	cmp    $0x2f,%ebx
  800aac:	7e 0c                	jle    800aba <vprintfmt+0x105>
  800aae:	83 fb 39             	cmp    $0x39,%ebx
  800ab1:	7f 07                	jg     800aba <vprintfmt+0x105>
  800ab3:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800ab8:	eb d1                	jmp    800a8b <vprintfmt+0xd6>
  800aba:	eb 58                	jmp    800b14 <vprintfmt+0x15f>
  800abc:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800abf:	83 f8 30             	cmp    $0x30,%eax
  800ac2:	73 17                	jae    800adb <vprintfmt+0x126>
  800ac4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ac8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800acb:	89 c0                	mov    %eax,%eax
  800acd:	48 01 d0             	add    %rdx,%rax
  800ad0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ad3:	83 c2 08             	add    $0x8,%edx
  800ad6:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ad9:	eb 0f                	jmp    800aea <vprintfmt+0x135>
  800adb:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800adf:	48 89 d0             	mov    %rdx,%rax
  800ae2:	48 83 c2 08          	add    $0x8,%rdx
  800ae6:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800aea:	8b 00                	mov    (%rax),%eax
  800aec:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800aef:	eb 23                	jmp    800b14 <vprintfmt+0x15f>
  800af1:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800af5:	79 0c                	jns    800b03 <vprintfmt+0x14e>
  800af7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800afe:	e9 3b ff ff ff       	jmpq   800a3e <vprintfmt+0x89>
  800b03:	e9 36 ff ff ff       	jmpq   800a3e <vprintfmt+0x89>
  800b08:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800b0f:	e9 2a ff ff ff       	jmpq   800a3e <vprintfmt+0x89>
  800b14:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b18:	79 12                	jns    800b2c <vprintfmt+0x177>
  800b1a:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b1d:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b20:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b27:	e9 12 ff ff ff       	jmpq   800a3e <vprintfmt+0x89>
  800b2c:	e9 0d ff ff ff       	jmpq   800a3e <vprintfmt+0x89>
  800b31:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b35:	e9 04 ff ff ff       	jmpq   800a3e <vprintfmt+0x89>
  800b3a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b3d:	83 f8 30             	cmp    $0x30,%eax
  800b40:	73 17                	jae    800b59 <vprintfmt+0x1a4>
  800b42:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b46:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b49:	89 c0                	mov    %eax,%eax
  800b4b:	48 01 d0             	add    %rdx,%rax
  800b4e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b51:	83 c2 08             	add    $0x8,%edx
  800b54:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b57:	eb 0f                	jmp    800b68 <vprintfmt+0x1b3>
  800b59:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b5d:	48 89 d0             	mov    %rdx,%rax
  800b60:	48 83 c2 08          	add    $0x8,%rdx
  800b64:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b68:	8b 10                	mov    (%rax),%edx
  800b6a:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b6e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b72:	48 89 ce             	mov    %rcx,%rsi
  800b75:	89 d7                	mov    %edx,%edi
  800b77:	ff d0                	callq  *%rax
  800b79:	e9 40 03 00 00       	jmpq   800ebe <vprintfmt+0x509>
  800b7e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b81:	83 f8 30             	cmp    $0x30,%eax
  800b84:	73 17                	jae    800b9d <vprintfmt+0x1e8>
  800b86:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b8a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b8d:	89 c0                	mov    %eax,%eax
  800b8f:	48 01 d0             	add    %rdx,%rax
  800b92:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b95:	83 c2 08             	add    $0x8,%edx
  800b98:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b9b:	eb 0f                	jmp    800bac <vprintfmt+0x1f7>
  800b9d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ba1:	48 89 d0             	mov    %rdx,%rax
  800ba4:	48 83 c2 08          	add    $0x8,%rdx
  800ba8:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bac:	8b 18                	mov    (%rax),%ebx
  800bae:	85 db                	test   %ebx,%ebx
  800bb0:	79 02                	jns    800bb4 <vprintfmt+0x1ff>
  800bb2:	f7 db                	neg    %ebx
  800bb4:	83 fb 15             	cmp    $0x15,%ebx
  800bb7:	7f 16                	jg     800bcf <vprintfmt+0x21a>
  800bb9:	48 b8 80 4c 80 00 00 	movabs $0x804c80,%rax
  800bc0:	00 00 00 
  800bc3:	48 63 d3             	movslq %ebx,%rdx
  800bc6:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800bca:	4d 85 e4             	test   %r12,%r12
  800bcd:	75 2e                	jne    800bfd <vprintfmt+0x248>
  800bcf:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800bd3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bd7:	89 d9                	mov    %ebx,%ecx
  800bd9:	48 ba 41 4d 80 00 00 	movabs $0x804d41,%rdx
  800be0:	00 00 00 
  800be3:	48 89 c7             	mov    %rax,%rdi
  800be6:	b8 00 00 00 00       	mov    $0x0,%eax
  800beb:	49 b8 cd 0e 80 00 00 	movabs $0x800ecd,%r8
  800bf2:	00 00 00 
  800bf5:	41 ff d0             	callq  *%r8
  800bf8:	e9 c1 02 00 00       	jmpq   800ebe <vprintfmt+0x509>
  800bfd:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c01:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c05:	4c 89 e1             	mov    %r12,%rcx
  800c08:	48 ba 4a 4d 80 00 00 	movabs $0x804d4a,%rdx
  800c0f:	00 00 00 
  800c12:	48 89 c7             	mov    %rax,%rdi
  800c15:	b8 00 00 00 00       	mov    $0x0,%eax
  800c1a:	49 b8 cd 0e 80 00 00 	movabs $0x800ecd,%r8
  800c21:	00 00 00 
  800c24:	41 ff d0             	callq  *%r8
  800c27:	e9 92 02 00 00       	jmpq   800ebe <vprintfmt+0x509>
  800c2c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c2f:	83 f8 30             	cmp    $0x30,%eax
  800c32:	73 17                	jae    800c4b <vprintfmt+0x296>
  800c34:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c38:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c3b:	89 c0                	mov    %eax,%eax
  800c3d:	48 01 d0             	add    %rdx,%rax
  800c40:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c43:	83 c2 08             	add    $0x8,%edx
  800c46:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c49:	eb 0f                	jmp    800c5a <vprintfmt+0x2a5>
  800c4b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c4f:	48 89 d0             	mov    %rdx,%rax
  800c52:	48 83 c2 08          	add    $0x8,%rdx
  800c56:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c5a:	4c 8b 20             	mov    (%rax),%r12
  800c5d:	4d 85 e4             	test   %r12,%r12
  800c60:	75 0a                	jne    800c6c <vprintfmt+0x2b7>
  800c62:	49 bc 4d 4d 80 00 00 	movabs $0x804d4d,%r12
  800c69:	00 00 00 
  800c6c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c70:	7e 3f                	jle    800cb1 <vprintfmt+0x2fc>
  800c72:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800c76:	74 39                	je     800cb1 <vprintfmt+0x2fc>
  800c78:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c7b:	48 98                	cltq   
  800c7d:	48 89 c6             	mov    %rax,%rsi
  800c80:	4c 89 e7             	mov    %r12,%rdi
  800c83:	48 b8 79 11 80 00 00 	movabs $0x801179,%rax
  800c8a:	00 00 00 
  800c8d:	ff d0                	callq  *%rax
  800c8f:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800c92:	eb 17                	jmp    800cab <vprintfmt+0x2f6>
  800c94:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800c98:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c9c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ca0:	48 89 ce             	mov    %rcx,%rsi
  800ca3:	89 d7                	mov    %edx,%edi
  800ca5:	ff d0                	callq  *%rax
  800ca7:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800cab:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800caf:	7f e3                	jg     800c94 <vprintfmt+0x2df>
  800cb1:	eb 37                	jmp    800cea <vprintfmt+0x335>
  800cb3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800cb7:	74 1e                	je     800cd7 <vprintfmt+0x322>
  800cb9:	83 fb 1f             	cmp    $0x1f,%ebx
  800cbc:	7e 05                	jle    800cc3 <vprintfmt+0x30e>
  800cbe:	83 fb 7e             	cmp    $0x7e,%ebx
  800cc1:	7e 14                	jle    800cd7 <vprintfmt+0x322>
  800cc3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cc7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ccb:	48 89 d6             	mov    %rdx,%rsi
  800cce:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800cd3:	ff d0                	callq  *%rax
  800cd5:	eb 0f                	jmp    800ce6 <vprintfmt+0x331>
  800cd7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cdb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cdf:	48 89 d6             	mov    %rdx,%rsi
  800ce2:	89 df                	mov    %ebx,%edi
  800ce4:	ff d0                	callq  *%rax
  800ce6:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800cea:	4c 89 e0             	mov    %r12,%rax
  800ced:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800cf1:	0f b6 00             	movzbl (%rax),%eax
  800cf4:	0f be d8             	movsbl %al,%ebx
  800cf7:	85 db                	test   %ebx,%ebx
  800cf9:	74 10                	je     800d0b <vprintfmt+0x356>
  800cfb:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800cff:	78 b2                	js     800cb3 <vprintfmt+0x2fe>
  800d01:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800d05:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d09:	79 a8                	jns    800cb3 <vprintfmt+0x2fe>
  800d0b:	eb 16                	jmp    800d23 <vprintfmt+0x36e>
  800d0d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d11:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d15:	48 89 d6             	mov    %rdx,%rsi
  800d18:	bf 20 00 00 00       	mov    $0x20,%edi
  800d1d:	ff d0                	callq  *%rax
  800d1f:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d23:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d27:	7f e4                	jg     800d0d <vprintfmt+0x358>
  800d29:	e9 90 01 00 00       	jmpq   800ebe <vprintfmt+0x509>
  800d2e:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d32:	be 03 00 00 00       	mov    $0x3,%esi
  800d37:	48 89 c7             	mov    %rax,%rdi
  800d3a:	48 b8 a5 08 80 00 00 	movabs $0x8008a5,%rax
  800d41:	00 00 00 
  800d44:	ff d0                	callq  *%rax
  800d46:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d4e:	48 85 c0             	test   %rax,%rax
  800d51:	79 1d                	jns    800d70 <vprintfmt+0x3bb>
  800d53:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d57:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d5b:	48 89 d6             	mov    %rdx,%rsi
  800d5e:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800d63:	ff d0                	callq  *%rax
  800d65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d69:	48 f7 d8             	neg    %rax
  800d6c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d70:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d77:	e9 d5 00 00 00       	jmpq   800e51 <vprintfmt+0x49c>
  800d7c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d80:	be 03 00 00 00       	mov    $0x3,%esi
  800d85:	48 89 c7             	mov    %rax,%rdi
  800d88:	48 b8 95 07 80 00 00 	movabs $0x800795,%rax
  800d8f:	00 00 00 
  800d92:	ff d0                	callq  *%rax
  800d94:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d98:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d9f:	e9 ad 00 00 00       	jmpq   800e51 <vprintfmt+0x49c>
  800da4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800da8:	be 03 00 00 00       	mov    $0x3,%esi
  800dad:	48 89 c7             	mov    %rax,%rdi
  800db0:	48 b8 95 07 80 00 00 	movabs $0x800795,%rax
  800db7:	00 00 00 
  800dba:	ff d0                	callq  *%rax
  800dbc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dc0:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800dc7:	e9 85 00 00 00       	jmpq   800e51 <vprintfmt+0x49c>
  800dcc:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dd0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dd4:	48 89 d6             	mov    %rdx,%rsi
  800dd7:	bf 30 00 00 00       	mov    $0x30,%edi
  800ddc:	ff d0                	callq  *%rax
  800dde:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800de2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800de6:	48 89 d6             	mov    %rdx,%rsi
  800de9:	bf 78 00 00 00       	mov    $0x78,%edi
  800dee:	ff d0                	callq  *%rax
  800df0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800df3:	83 f8 30             	cmp    $0x30,%eax
  800df6:	73 17                	jae    800e0f <vprintfmt+0x45a>
  800df8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800dfc:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800dff:	89 c0                	mov    %eax,%eax
  800e01:	48 01 d0             	add    %rdx,%rax
  800e04:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e07:	83 c2 08             	add    $0x8,%edx
  800e0a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e0d:	eb 0f                	jmp    800e1e <vprintfmt+0x469>
  800e0f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e13:	48 89 d0             	mov    %rdx,%rax
  800e16:	48 83 c2 08          	add    $0x8,%rdx
  800e1a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e1e:	48 8b 00             	mov    (%rax),%rax
  800e21:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e25:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e2c:	eb 23                	jmp    800e51 <vprintfmt+0x49c>
  800e2e:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e32:	be 03 00 00 00       	mov    $0x3,%esi
  800e37:	48 89 c7             	mov    %rax,%rdi
  800e3a:	48 b8 95 07 80 00 00 	movabs $0x800795,%rax
  800e41:	00 00 00 
  800e44:	ff d0                	callq  *%rax
  800e46:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e4a:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e51:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800e56:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800e59:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800e5c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e60:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e64:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e68:	45 89 c1             	mov    %r8d,%r9d
  800e6b:	41 89 f8             	mov    %edi,%r8d
  800e6e:	48 89 c7             	mov    %rax,%rdi
  800e71:	48 b8 da 06 80 00 00 	movabs $0x8006da,%rax
  800e78:	00 00 00 
  800e7b:	ff d0                	callq  *%rax
  800e7d:	eb 3f                	jmp    800ebe <vprintfmt+0x509>
  800e7f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e83:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e87:	48 89 d6             	mov    %rdx,%rsi
  800e8a:	89 df                	mov    %ebx,%edi
  800e8c:	ff d0                	callq  *%rax
  800e8e:	eb 2e                	jmp    800ebe <vprintfmt+0x509>
  800e90:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e98:	48 89 d6             	mov    %rdx,%rsi
  800e9b:	bf 25 00 00 00       	mov    $0x25,%edi
  800ea0:	ff d0                	callq  *%rax
  800ea2:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800ea7:	eb 05                	jmp    800eae <vprintfmt+0x4f9>
  800ea9:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800eae:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800eb2:	48 83 e8 01          	sub    $0x1,%rax
  800eb6:	0f b6 00             	movzbl (%rax),%eax
  800eb9:	3c 25                	cmp    $0x25,%al
  800ebb:	75 ec                	jne    800ea9 <vprintfmt+0x4f4>
  800ebd:	90                   	nop
  800ebe:	90                   	nop
  800ebf:	e9 43 fb ff ff       	jmpq   800a07 <vprintfmt+0x52>
  800ec4:	48 83 c4 60          	add    $0x60,%rsp
  800ec8:	5b                   	pop    %rbx
  800ec9:	41 5c                	pop    %r12
  800ecb:	5d                   	pop    %rbp
  800ecc:	c3                   	retq   

0000000000800ecd <printfmt>:
  800ecd:	55                   	push   %rbp
  800ece:	48 89 e5             	mov    %rsp,%rbp
  800ed1:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800ed8:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800edf:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800ee6:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800eed:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800ef4:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800efb:	84 c0                	test   %al,%al
  800efd:	74 20                	je     800f1f <printfmt+0x52>
  800eff:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f03:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f07:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f0b:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f0f:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f13:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f17:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f1b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f1f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800f26:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f2d:	00 00 00 
  800f30:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f37:	00 00 00 
  800f3a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f3e:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f45:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f4c:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800f53:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800f5a:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800f61:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800f68:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800f6f:	48 89 c7             	mov    %rax,%rdi
  800f72:	48 b8 b5 09 80 00 00 	movabs $0x8009b5,%rax
  800f79:	00 00 00 
  800f7c:	ff d0                	callq  *%rax
  800f7e:	c9                   	leaveq 
  800f7f:	c3                   	retq   

0000000000800f80 <sprintputch>:
  800f80:	55                   	push   %rbp
  800f81:	48 89 e5             	mov    %rsp,%rbp
  800f84:	48 83 ec 10          	sub    $0x10,%rsp
  800f88:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800f8b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f93:	8b 40 10             	mov    0x10(%rax),%eax
  800f96:	8d 50 01             	lea    0x1(%rax),%edx
  800f99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f9d:	89 50 10             	mov    %edx,0x10(%rax)
  800fa0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fa4:	48 8b 10             	mov    (%rax),%rdx
  800fa7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fab:	48 8b 40 08          	mov    0x8(%rax),%rax
  800faf:	48 39 c2             	cmp    %rax,%rdx
  800fb2:	73 17                	jae    800fcb <sprintputch+0x4b>
  800fb4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fb8:	48 8b 00             	mov    (%rax),%rax
  800fbb:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800fbf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800fc3:	48 89 0a             	mov    %rcx,(%rdx)
  800fc6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800fc9:	88 10                	mov    %dl,(%rax)
  800fcb:	c9                   	leaveq 
  800fcc:	c3                   	retq   

0000000000800fcd <vsnprintf>:
  800fcd:	55                   	push   %rbp
  800fce:	48 89 e5             	mov    %rsp,%rbp
  800fd1:	48 83 ec 50          	sub    $0x50,%rsp
  800fd5:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800fd9:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800fdc:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800fe0:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800fe4:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800fe8:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800fec:	48 8b 0a             	mov    (%rdx),%rcx
  800fef:	48 89 08             	mov    %rcx,(%rax)
  800ff2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ff6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ffa:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ffe:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801002:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801006:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80100a:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  80100d:	48 98                	cltq   
  80100f:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801013:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801017:	48 01 d0             	add    %rdx,%rax
  80101a:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  80101e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801025:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80102a:	74 06                	je     801032 <vsnprintf+0x65>
  80102c:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801030:	7f 07                	jg     801039 <vsnprintf+0x6c>
  801032:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801037:	eb 2f                	jmp    801068 <vsnprintf+0x9b>
  801039:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  80103d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801041:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801045:	48 89 c6             	mov    %rax,%rsi
  801048:	48 bf 80 0f 80 00 00 	movabs $0x800f80,%rdi
  80104f:	00 00 00 
  801052:	48 b8 b5 09 80 00 00 	movabs $0x8009b5,%rax
  801059:	00 00 00 
  80105c:	ff d0                	callq  *%rax
  80105e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801062:	c6 00 00             	movb   $0x0,(%rax)
  801065:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801068:	c9                   	leaveq 
  801069:	c3                   	retq   

000000000080106a <snprintf>:
  80106a:	55                   	push   %rbp
  80106b:	48 89 e5             	mov    %rsp,%rbp
  80106e:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801075:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80107c:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801082:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801089:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801090:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801097:	84 c0                	test   %al,%al
  801099:	74 20                	je     8010bb <snprintf+0x51>
  80109b:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80109f:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010a3:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8010a7:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8010ab:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8010af:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8010b3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8010b7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8010bb:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8010c2:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8010c9:	00 00 00 
  8010cc:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8010d3:	00 00 00 
  8010d6:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8010da:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8010e1:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8010e8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8010ef:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8010f6:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8010fd:	48 8b 0a             	mov    (%rdx),%rcx
  801100:	48 89 08             	mov    %rcx,(%rax)
  801103:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801107:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80110b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80110f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801113:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80111a:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801121:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801127:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80112e:	48 89 c7             	mov    %rax,%rdi
  801131:	48 b8 cd 0f 80 00 00 	movabs $0x800fcd,%rax
  801138:	00 00 00 
  80113b:	ff d0                	callq  *%rax
  80113d:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801143:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801149:	c9                   	leaveq 
  80114a:	c3                   	retq   

000000000080114b <strlen>:
  80114b:	55                   	push   %rbp
  80114c:	48 89 e5             	mov    %rsp,%rbp
  80114f:	48 83 ec 18          	sub    $0x18,%rsp
  801153:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801157:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80115e:	eb 09                	jmp    801169 <strlen+0x1e>
  801160:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801164:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801169:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80116d:	0f b6 00             	movzbl (%rax),%eax
  801170:	84 c0                	test   %al,%al
  801172:	75 ec                	jne    801160 <strlen+0x15>
  801174:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801177:	c9                   	leaveq 
  801178:	c3                   	retq   

0000000000801179 <strnlen>:
  801179:	55                   	push   %rbp
  80117a:	48 89 e5             	mov    %rsp,%rbp
  80117d:	48 83 ec 20          	sub    $0x20,%rsp
  801181:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801185:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801189:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801190:	eb 0e                	jmp    8011a0 <strnlen+0x27>
  801192:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801196:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80119b:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8011a0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8011a5:	74 0b                	je     8011b2 <strnlen+0x39>
  8011a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ab:	0f b6 00             	movzbl (%rax),%eax
  8011ae:	84 c0                	test   %al,%al
  8011b0:	75 e0                	jne    801192 <strnlen+0x19>
  8011b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011b5:	c9                   	leaveq 
  8011b6:	c3                   	retq   

00000000008011b7 <strcpy>:
  8011b7:	55                   	push   %rbp
  8011b8:	48 89 e5             	mov    %rsp,%rbp
  8011bb:	48 83 ec 20          	sub    $0x20,%rsp
  8011bf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011c3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011cb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011cf:	90                   	nop
  8011d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011d4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011d8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011dc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011e0:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011e4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011e8:	0f b6 12             	movzbl (%rdx),%edx
  8011eb:	88 10                	mov    %dl,(%rax)
  8011ed:	0f b6 00             	movzbl (%rax),%eax
  8011f0:	84 c0                	test   %al,%al
  8011f2:	75 dc                	jne    8011d0 <strcpy+0x19>
  8011f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011f8:	c9                   	leaveq 
  8011f9:	c3                   	retq   

00000000008011fa <strcat>:
  8011fa:	55                   	push   %rbp
  8011fb:	48 89 e5             	mov    %rsp,%rbp
  8011fe:	48 83 ec 20          	sub    $0x20,%rsp
  801202:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801206:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80120a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80120e:	48 89 c7             	mov    %rax,%rdi
  801211:	48 b8 4b 11 80 00 00 	movabs $0x80114b,%rax
  801218:	00 00 00 
  80121b:	ff d0                	callq  *%rax
  80121d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801220:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801223:	48 63 d0             	movslq %eax,%rdx
  801226:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80122a:	48 01 c2             	add    %rax,%rdx
  80122d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801231:	48 89 c6             	mov    %rax,%rsi
  801234:	48 89 d7             	mov    %rdx,%rdi
  801237:	48 b8 b7 11 80 00 00 	movabs $0x8011b7,%rax
  80123e:	00 00 00 
  801241:	ff d0                	callq  *%rax
  801243:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801247:	c9                   	leaveq 
  801248:	c3                   	retq   

0000000000801249 <strncpy>:
  801249:	55                   	push   %rbp
  80124a:	48 89 e5             	mov    %rsp,%rbp
  80124d:	48 83 ec 28          	sub    $0x28,%rsp
  801251:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801255:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801259:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80125d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801261:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801265:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80126c:	00 
  80126d:	eb 2a                	jmp    801299 <strncpy+0x50>
  80126f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801273:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801277:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80127b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80127f:	0f b6 12             	movzbl (%rdx),%edx
  801282:	88 10                	mov    %dl,(%rax)
  801284:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801288:	0f b6 00             	movzbl (%rax),%eax
  80128b:	84 c0                	test   %al,%al
  80128d:	74 05                	je     801294 <strncpy+0x4b>
  80128f:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801294:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801299:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80129d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8012a1:	72 cc                	jb     80126f <strncpy+0x26>
  8012a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012a7:	c9                   	leaveq 
  8012a8:	c3                   	retq   

00000000008012a9 <strlcpy>:
  8012a9:	55                   	push   %rbp
  8012aa:	48 89 e5             	mov    %rsp,%rbp
  8012ad:	48 83 ec 28          	sub    $0x28,%rsp
  8012b1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012b5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012b9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012c5:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012ca:	74 3d                	je     801309 <strlcpy+0x60>
  8012cc:	eb 1d                	jmp    8012eb <strlcpy+0x42>
  8012ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012d2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012d6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012da:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012de:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8012e2:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8012e6:	0f b6 12             	movzbl (%rdx),%edx
  8012e9:	88 10                	mov    %dl,(%rax)
  8012eb:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8012f0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012f5:	74 0b                	je     801302 <strlcpy+0x59>
  8012f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012fb:	0f b6 00             	movzbl (%rax),%eax
  8012fe:	84 c0                	test   %al,%al
  801300:	75 cc                	jne    8012ce <strlcpy+0x25>
  801302:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801306:	c6 00 00             	movb   $0x0,(%rax)
  801309:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80130d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801311:	48 29 c2             	sub    %rax,%rdx
  801314:	48 89 d0             	mov    %rdx,%rax
  801317:	c9                   	leaveq 
  801318:	c3                   	retq   

0000000000801319 <strcmp>:
  801319:	55                   	push   %rbp
  80131a:	48 89 e5             	mov    %rsp,%rbp
  80131d:	48 83 ec 10          	sub    $0x10,%rsp
  801321:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801325:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801329:	eb 0a                	jmp    801335 <strcmp+0x1c>
  80132b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801330:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801335:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801339:	0f b6 00             	movzbl (%rax),%eax
  80133c:	84 c0                	test   %al,%al
  80133e:	74 12                	je     801352 <strcmp+0x39>
  801340:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801344:	0f b6 10             	movzbl (%rax),%edx
  801347:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80134b:	0f b6 00             	movzbl (%rax),%eax
  80134e:	38 c2                	cmp    %al,%dl
  801350:	74 d9                	je     80132b <strcmp+0x12>
  801352:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801356:	0f b6 00             	movzbl (%rax),%eax
  801359:	0f b6 d0             	movzbl %al,%edx
  80135c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801360:	0f b6 00             	movzbl (%rax),%eax
  801363:	0f b6 c0             	movzbl %al,%eax
  801366:	29 c2                	sub    %eax,%edx
  801368:	89 d0                	mov    %edx,%eax
  80136a:	c9                   	leaveq 
  80136b:	c3                   	retq   

000000000080136c <strncmp>:
  80136c:	55                   	push   %rbp
  80136d:	48 89 e5             	mov    %rsp,%rbp
  801370:	48 83 ec 18          	sub    $0x18,%rsp
  801374:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801378:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80137c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801380:	eb 0f                	jmp    801391 <strncmp+0x25>
  801382:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801387:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80138c:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801391:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801396:	74 1d                	je     8013b5 <strncmp+0x49>
  801398:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80139c:	0f b6 00             	movzbl (%rax),%eax
  80139f:	84 c0                	test   %al,%al
  8013a1:	74 12                	je     8013b5 <strncmp+0x49>
  8013a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013a7:	0f b6 10             	movzbl (%rax),%edx
  8013aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013ae:	0f b6 00             	movzbl (%rax),%eax
  8013b1:	38 c2                	cmp    %al,%dl
  8013b3:	74 cd                	je     801382 <strncmp+0x16>
  8013b5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013ba:	75 07                	jne    8013c3 <strncmp+0x57>
  8013bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8013c1:	eb 18                	jmp    8013db <strncmp+0x6f>
  8013c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013c7:	0f b6 00             	movzbl (%rax),%eax
  8013ca:	0f b6 d0             	movzbl %al,%edx
  8013cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013d1:	0f b6 00             	movzbl (%rax),%eax
  8013d4:	0f b6 c0             	movzbl %al,%eax
  8013d7:	29 c2                	sub    %eax,%edx
  8013d9:	89 d0                	mov    %edx,%eax
  8013db:	c9                   	leaveq 
  8013dc:	c3                   	retq   

00000000008013dd <strchr>:
  8013dd:	55                   	push   %rbp
  8013de:	48 89 e5             	mov    %rsp,%rbp
  8013e1:	48 83 ec 0c          	sub    $0xc,%rsp
  8013e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013e9:	89 f0                	mov    %esi,%eax
  8013eb:	88 45 f4             	mov    %al,-0xc(%rbp)
  8013ee:	eb 17                	jmp    801407 <strchr+0x2a>
  8013f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f4:	0f b6 00             	movzbl (%rax),%eax
  8013f7:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8013fa:	75 06                	jne    801402 <strchr+0x25>
  8013fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801400:	eb 15                	jmp    801417 <strchr+0x3a>
  801402:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801407:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80140b:	0f b6 00             	movzbl (%rax),%eax
  80140e:	84 c0                	test   %al,%al
  801410:	75 de                	jne    8013f0 <strchr+0x13>
  801412:	b8 00 00 00 00       	mov    $0x0,%eax
  801417:	c9                   	leaveq 
  801418:	c3                   	retq   

0000000000801419 <strfind>:
  801419:	55                   	push   %rbp
  80141a:	48 89 e5             	mov    %rsp,%rbp
  80141d:	48 83 ec 0c          	sub    $0xc,%rsp
  801421:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801425:	89 f0                	mov    %esi,%eax
  801427:	88 45 f4             	mov    %al,-0xc(%rbp)
  80142a:	eb 13                	jmp    80143f <strfind+0x26>
  80142c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801430:	0f b6 00             	movzbl (%rax),%eax
  801433:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801436:	75 02                	jne    80143a <strfind+0x21>
  801438:	eb 10                	jmp    80144a <strfind+0x31>
  80143a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80143f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801443:	0f b6 00             	movzbl (%rax),%eax
  801446:	84 c0                	test   %al,%al
  801448:	75 e2                	jne    80142c <strfind+0x13>
  80144a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80144e:	c9                   	leaveq 
  80144f:	c3                   	retq   

0000000000801450 <memset>:
  801450:	55                   	push   %rbp
  801451:	48 89 e5             	mov    %rsp,%rbp
  801454:	48 83 ec 18          	sub    $0x18,%rsp
  801458:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80145c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80145f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801463:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801468:	75 06                	jne    801470 <memset+0x20>
  80146a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80146e:	eb 69                	jmp    8014d9 <memset+0x89>
  801470:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801474:	83 e0 03             	and    $0x3,%eax
  801477:	48 85 c0             	test   %rax,%rax
  80147a:	75 48                	jne    8014c4 <memset+0x74>
  80147c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801480:	83 e0 03             	and    $0x3,%eax
  801483:	48 85 c0             	test   %rax,%rax
  801486:	75 3c                	jne    8014c4 <memset+0x74>
  801488:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80148f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801492:	c1 e0 18             	shl    $0x18,%eax
  801495:	89 c2                	mov    %eax,%edx
  801497:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80149a:	c1 e0 10             	shl    $0x10,%eax
  80149d:	09 c2                	or     %eax,%edx
  80149f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014a2:	c1 e0 08             	shl    $0x8,%eax
  8014a5:	09 d0                	or     %edx,%eax
  8014a7:	09 45 f4             	or     %eax,-0xc(%rbp)
  8014aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ae:	48 c1 e8 02          	shr    $0x2,%rax
  8014b2:	48 89 c1             	mov    %rax,%rcx
  8014b5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014b9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014bc:	48 89 d7             	mov    %rdx,%rdi
  8014bf:	fc                   	cld    
  8014c0:	f3 ab                	rep stos %eax,%es:(%rdi)
  8014c2:	eb 11                	jmp    8014d5 <memset+0x85>
  8014c4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014c8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014cb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8014cf:	48 89 d7             	mov    %rdx,%rdi
  8014d2:	fc                   	cld    
  8014d3:	f3 aa                	rep stos %al,%es:(%rdi)
  8014d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d9:	c9                   	leaveq 
  8014da:	c3                   	retq   

00000000008014db <memmove>:
  8014db:	55                   	push   %rbp
  8014dc:	48 89 e5             	mov    %rsp,%rbp
  8014df:	48 83 ec 28          	sub    $0x28,%rsp
  8014e3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014e7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014eb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014ef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014f3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014fb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801503:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801507:	0f 83 88 00 00 00    	jae    801595 <memmove+0xba>
  80150d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801511:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801515:	48 01 d0             	add    %rdx,%rax
  801518:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80151c:	76 77                	jbe    801595 <memmove+0xba>
  80151e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801522:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801526:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80152a:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80152e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801532:	83 e0 03             	and    $0x3,%eax
  801535:	48 85 c0             	test   %rax,%rax
  801538:	75 3b                	jne    801575 <memmove+0x9a>
  80153a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80153e:	83 e0 03             	and    $0x3,%eax
  801541:	48 85 c0             	test   %rax,%rax
  801544:	75 2f                	jne    801575 <memmove+0x9a>
  801546:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80154a:	83 e0 03             	and    $0x3,%eax
  80154d:	48 85 c0             	test   %rax,%rax
  801550:	75 23                	jne    801575 <memmove+0x9a>
  801552:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801556:	48 83 e8 04          	sub    $0x4,%rax
  80155a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80155e:	48 83 ea 04          	sub    $0x4,%rdx
  801562:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801566:	48 c1 e9 02          	shr    $0x2,%rcx
  80156a:	48 89 c7             	mov    %rax,%rdi
  80156d:	48 89 d6             	mov    %rdx,%rsi
  801570:	fd                   	std    
  801571:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801573:	eb 1d                	jmp    801592 <memmove+0xb7>
  801575:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801579:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80157d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801581:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801585:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801589:	48 89 d7             	mov    %rdx,%rdi
  80158c:	48 89 c1             	mov    %rax,%rcx
  80158f:	fd                   	std    
  801590:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801592:	fc                   	cld    
  801593:	eb 57                	jmp    8015ec <memmove+0x111>
  801595:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801599:	83 e0 03             	and    $0x3,%eax
  80159c:	48 85 c0             	test   %rax,%rax
  80159f:	75 36                	jne    8015d7 <memmove+0xfc>
  8015a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015a5:	83 e0 03             	and    $0x3,%eax
  8015a8:	48 85 c0             	test   %rax,%rax
  8015ab:	75 2a                	jne    8015d7 <memmove+0xfc>
  8015ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015b1:	83 e0 03             	and    $0x3,%eax
  8015b4:	48 85 c0             	test   %rax,%rax
  8015b7:	75 1e                	jne    8015d7 <memmove+0xfc>
  8015b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015bd:	48 c1 e8 02          	shr    $0x2,%rax
  8015c1:	48 89 c1             	mov    %rax,%rcx
  8015c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015c8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015cc:	48 89 c7             	mov    %rax,%rdi
  8015cf:	48 89 d6             	mov    %rdx,%rsi
  8015d2:	fc                   	cld    
  8015d3:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015d5:	eb 15                	jmp    8015ec <memmove+0x111>
  8015d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015db:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015df:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8015e3:	48 89 c7             	mov    %rax,%rdi
  8015e6:	48 89 d6             	mov    %rdx,%rsi
  8015e9:	fc                   	cld    
  8015ea:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015f0:	c9                   	leaveq 
  8015f1:	c3                   	retq   

00000000008015f2 <memcpy>:
  8015f2:	55                   	push   %rbp
  8015f3:	48 89 e5             	mov    %rsp,%rbp
  8015f6:	48 83 ec 18          	sub    $0x18,%rsp
  8015fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801602:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801606:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80160a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80160e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801612:	48 89 ce             	mov    %rcx,%rsi
  801615:	48 89 c7             	mov    %rax,%rdi
  801618:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  80161f:	00 00 00 
  801622:	ff d0                	callq  *%rax
  801624:	c9                   	leaveq 
  801625:	c3                   	retq   

0000000000801626 <memcmp>:
  801626:	55                   	push   %rbp
  801627:	48 89 e5             	mov    %rsp,%rbp
  80162a:	48 83 ec 28          	sub    $0x28,%rsp
  80162e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801632:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801636:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80163a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80163e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801642:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801646:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80164a:	eb 36                	jmp    801682 <memcmp+0x5c>
  80164c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801650:	0f b6 10             	movzbl (%rax),%edx
  801653:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801657:	0f b6 00             	movzbl (%rax),%eax
  80165a:	38 c2                	cmp    %al,%dl
  80165c:	74 1a                	je     801678 <memcmp+0x52>
  80165e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801662:	0f b6 00             	movzbl (%rax),%eax
  801665:	0f b6 d0             	movzbl %al,%edx
  801668:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80166c:	0f b6 00             	movzbl (%rax),%eax
  80166f:	0f b6 c0             	movzbl %al,%eax
  801672:	29 c2                	sub    %eax,%edx
  801674:	89 d0                	mov    %edx,%eax
  801676:	eb 20                	jmp    801698 <memcmp+0x72>
  801678:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80167d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801682:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801686:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80168a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80168e:	48 85 c0             	test   %rax,%rax
  801691:	75 b9                	jne    80164c <memcmp+0x26>
  801693:	b8 00 00 00 00       	mov    $0x0,%eax
  801698:	c9                   	leaveq 
  801699:	c3                   	retq   

000000000080169a <memfind>:
  80169a:	55                   	push   %rbp
  80169b:	48 89 e5             	mov    %rsp,%rbp
  80169e:	48 83 ec 28          	sub    $0x28,%rsp
  8016a2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016a6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8016a9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016b5:	48 01 d0             	add    %rdx,%rax
  8016b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016bc:	eb 15                	jmp    8016d3 <memfind+0x39>
  8016be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016c2:	0f b6 10             	movzbl (%rax),%edx
  8016c5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8016c8:	38 c2                	cmp    %al,%dl
  8016ca:	75 02                	jne    8016ce <memfind+0x34>
  8016cc:	eb 0f                	jmp    8016dd <memfind+0x43>
  8016ce:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8016d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016d7:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8016db:	72 e1                	jb     8016be <memfind+0x24>
  8016dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016e1:	c9                   	leaveq 
  8016e2:	c3                   	retq   

00000000008016e3 <strtol>:
  8016e3:	55                   	push   %rbp
  8016e4:	48 89 e5             	mov    %rsp,%rbp
  8016e7:	48 83 ec 34          	sub    $0x34,%rsp
  8016eb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8016ef:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8016f3:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8016f6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8016fd:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801704:	00 
  801705:	eb 05                	jmp    80170c <strtol+0x29>
  801707:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80170c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801710:	0f b6 00             	movzbl (%rax),%eax
  801713:	3c 20                	cmp    $0x20,%al
  801715:	74 f0                	je     801707 <strtol+0x24>
  801717:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80171b:	0f b6 00             	movzbl (%rax),%eax
  80171e:	3c 09                	cmp    $0x9,%al
  801720:	74 e5                	je     801707 <strtol+0x24>
  801722:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801726:	0f b6 00             	movzbl (%rax),%eax
  801729:	3c 2b                	cmp    $0x2b,%al
  80172b:	75 07                	jne    801734 <strtol+0x51>
  80172d:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801732:	eb 17                	jmp    80174b <strtol+0x68>
  801734:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801738:	0f b6 00             	movzbl (%rax),%eax
  80173b:	3c 2d                	cmp    $0x2d,%al
  80173d:	75 0c                	jne    80174b <strtol+0x68>
  80173f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801744:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80174b:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80174f:	74 06                	je     801757 <strtol+0x74>
  801751:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801755:	75 28                	jne    80177f <strtol+0x9c>
  801757:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80175b:	0f b6 00             	movzbl (%rax),%eax
  80175e:	3c 30                	cmp    $0x30,%al
  801760:	75 1d                	jne    80177f <strtol+0x9c>
  801762:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801766:	48 83 c0 01          	add    $0x1,%rax
  80176a:	0f b6 00             	movzbl (%rax),%eax
  80176d:	3c 78                	cmp    $0x78,%al
  80176f:	75 0e                	jne    80177f <strtol+0x9c>
  801771:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801776:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80177d:	eb 2c                	jmp    8017ab <strtol+0xc8>
  80177f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801783:	75 19                	jne    80179e <strtol+0xbb>
  801785:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801789:	0f b6 00             	movzbl (%rax),%eax
  80178c:	3c 30                	cmp    $0x30,%al
  80178e:	75 0e                	jne    80179e <strtol+0xbb>
  801790:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801795:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80179c:	eb 0d                	jmp    8017ab <strtol+0xc8>
  80179e:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017a2:	75 07                	jne    8017ab <strtol+0xc8>
  8017a4:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8017ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017af:	0f b6 00             	movzbl (%rax),%eax
  8017b2:	3c 2f                	cmp    $0x2f,%al
  8017b4:	7e 1d                	jle    8017d3 <strtol+0xf0>
  8017b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ba:	0f b6 00             	movzbl (%rax),%eax
  8017bd:	3c 39                	cmp    $0x39,%al
  8017bf:	7f 12                	jg     8017d3 <strtol+0xf0>
  8017c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c5:	0f b6 00             	movzbl (%rax),%eax
  8017c8:	0f be c0             	movsbl %al,%eax
  8017cb:	83 e8 30             	sub    $0x30,%eax
  8017ce:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017d1:	eb 4e                	jmp    801821 <strtol+0x13e>
  8017d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017d7:	0f b6 00             	movzbl (%rax),%eax
  8017da:	3c 60                	cmp    $0x60,%al
  8017dc:	7e 1d                	jle    8017fb <strtol+0x118>
  8017de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017e2:	0f b6 00             	movzbl (%rax),%eax
  8017e5:	3c 7a                	cmp    $0x7a,%al
  8017e7:	7f 12                	jg     8017fb <strtol+0x118>
  8017e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ed:	0f b6 00             	movzbl (%rax),%eax
  8017f0:	0f be c0             	movsbl %al,%eax
  8017f3:	83 e8 57             	sub    $0x57,%eax
  8017f6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017f9:	eb 26                	jmp    801821 <strtol+0x13e>
  8017fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ff:	0f b6 00             	movzbl (%rax),%eax
  801802:	3c 40                	cmp    $0x40,%al
  801804:	7e 48                	jle    80184e <strtol+0x16b>
  801806:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180a:	0f b6 00             	movzbl (%rax),%eax
  80180d:	3c 5a                	cmp    $0x5a,%al
  80180f:	7f 3d                	jg     80184e <strtol+0x16b>
  801811:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801815:	0f b6 00             	movzbl (%rax),%eax
  801818:	0f be c0             	movsbl %al,%eax
  80181b:	83 e8 37             	sub    $0x37,%eax
  80181e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801821:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801824:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801827:	7c 02                	jl     80182b <strtol+0x148>
  801829:	eb 23                	jmp    80184e <strtol+0x16b>
  80182b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801830:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801833:	48 98                	cltq   
  801835:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80183a:	48 89 c2             	mov    %rax,%rdx
  80183d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801840:	48 98                	cltq   
  801842:	48 01 d0             	add    %rdx,%rax
  801845:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801849:	e9 5d ff ff ff       	jmpq   8017ab <strtol+0xc8>
  80184e:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801853:	74 0b                	je     801860 <strtol+0x17d>
  801855:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801859:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80185d:	48 89 10             	mov    %rdx,(%rax)
  801860:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801864:	74 09                	je     80186f <strtol+0x18c>
  801866:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80186a:	48 f7 d8             	neg    %rax
  80186d:	eb 04                	jmp    801873 <strtol+0x190>
  80186f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801873:	c9                   	leaveq 
  801874:	c3                   	retq   

0000000000801875 <strstr>:
  801875:	55                   	push   %rbp
  801876:	48 89 e5             	mov    %rsp,%rbp
  801879:	48 83 ec 30          	sub    $0x30,%rsp
  80187d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801881:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801885:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801889:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80188d:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801891:	0f b6 00             	movzbl (%rax),%eax
  801894:	88 45 ff             	mov    %al,-0x1(%rbp)
  801897:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80189b:	75 06                	jne    8018a3 <strstr+0x2e>
  80189d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018a1:	eb 6b                	jmp    80190e <strstr+0x99>
  8018a3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018a7:	48 89 c7             	mov    %rax,%rdi
  8018aa:	48 b8 4b 11 80 00 00 	movabs $0x80114b,%rax
  8018b1:	00 00 00 
  8018b4:	ff d0                	callq  *%rax
  8018b6:	48 98                	cltq   
  8018b8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018c0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018c4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018c8:	0f b6 00             	movzbl (%rax),%eax
  8018cb:	88 45 ef             	mov    %al,-0x11(%rbp)
  8018ce:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8018d2:	75 07                	jne    8018db <strstr+0x66>
  8018d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8018d9:	eb 33                	jmp    80190e <strstr+0x99>
  8018db:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8018df:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8018e2:	75 d8                	jne    8018bc <strstr+0x47>
  8018e4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018e8:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8018ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018f0:	48 89 ce             	mov    %rcx,%rsi
  8018f3:	48 89 c7             	mov    %rax,%rdi
  8018f6:	48 b8 6c 13 80 00 00 	movabs $0x80136c,%rax
  8018fd:	00 00 00 
  801900:	ff d0                	callq  *%rax
  801902:	85 c0                	test   %eax,%eax
  801904:	75 b6                	jne    8018bc <strstr+0x47>
  801906:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80190a:	48 83 e8 01          	sub    $0x1,%rax
  80190e:	c9                   	leaveq 
  80190f:	c3                   	retq   

0000000000801910 <syscall>:
  801910:	55                   	push   %rbp
  801911:	48 89 e5             	mov    %rsp,%rbp
  801914:	53                   	push   %rbx
  801915:	48 83 ec 48          	sub    $0x48,%rsp
  801919:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80191c:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80191f:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801923:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801927:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80192b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  80192f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801932:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801936:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80193a:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  80193e:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801942:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801946:	4c 89 c3             	mov    %r8,%rbx
  801949:	cd 30                	int    $0x30
  80194b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80194f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801953:	74 3e                	je     801993 <syscall+0x83>
  801955:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80195a:	7e 37                	jle    801993 <syscall+0x83>
  80195c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801960:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801963:	49 89 d0             	mov    %rdx,%r8
  801966:	89 c1                	mov    %eax,%ecx
  801968:	48 ba 08 50 80 00 00 	movabs $0x805008,%rdx
  80196f:	00 00 00 
  801972:	be 24 00 00 00       	mov    $0x24,%esi
  801977:	48 bf 25 50 80 00 00 	movabs $0x805025,%rdi
  80197e:	00 00 00 
  801981:	b8 00 00 00 00       	mov    $0x0,%eax
  801986:	49 b9 c9 03 80 00 00 	movabs $0x8003c9,%r9
  80198d:	00 00 00 
  801990:	41 ff d1             	callq  *%r9
  801993:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801997:	48 83 c4 48          	add    $0x48,%rsp
  80199b:	5b                   	pop    %rbx
  80199c:	5d                   	pop    %rbp
  80199d:	c3                   	retq   

000000000080199e <sys_cputs>:
  80199e:	55                   	push   %rbp
  80199f:	48 89 e5             	mov    %rsp,%rbp
  8019a2:	48 83 ec 20          	sub    $0x20,%rsp
  8019a6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8019aa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019b2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019b6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019bd:	00 
  8019be:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019ca:	48 89 d1             	mov    %rdx,%rcx
  8019cd:	48 89 c2             	mov    %rax,%rdx
  8019d0:	be 00 00 00 00       	mov    $0x0,%esi
  8019d5:	bf 00 00 00 00       	mov    $0x0,%edi
  8019da:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  8019e1:	00 00 00 
  8019e4:	ff d0                	callq  *%rax
  8019e6:	c9                   	leaveq 
  8019e7:	c3                   	retq   

00000000008019e8 <sys_cgetc>:
  8019e8:	55                   	push   %rbp
  8019e9:	48 89 e5             	mov    %rsp,%rbp
  8019ec:	48 83 ec 10          	sub    $0x10,%rsp
  8019f0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019f7:	00 
  8019f8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019fe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a04:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a09:	ba 00 00 00 00       	mov    $0x0,%edx
  801a0e:	be 00 00 00 00       	mov    $0x0,%esi
  801a13:	bf 01 00 00 00       	mov    $0x1,%edi
  801a18:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801a1f:	00 00 00 
  801a22:	ff d0                	callq  *%rax
  801a24:	c9                   	leaveq 
  801a25:	c3                   	retq   

0000000000801a26 <sys_env_destroy>:
  801a26:	55                   	push   %rbp
  801a27:	48 89 e5             	mov    %rsp,%rbp
  801a2a:	48 83 ec 10          	sub    $0x10,%rsp
  801a2e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a31:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a34:	48 98                	cltq   
  801a36:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a3d:	00 
  801a3e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a44:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a4a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a4f:	48 89 c2             	mov    %rax,%rdx
  801a52:	be 01 00 00 00       	mov    $0x1,%esi
  801a57:	bf 03 00 00 00       	mov    $0x3,%edi
  801a5c:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801a63:	00 00 00 
  801a66:	ff d0                	callq  *%rax
  801a68:	c9                   	leaveq 
  801a69:	c3                   	retq   

0000000000801a6a <sys_getenvid>:
  801a6a:	55                   	push   %rbp
  801a6b:	48 89 e5             	mov    %rsp,%rbp
  801a6e:	48 83 ec 10          	sub    $0x10,%rsp
  801a72:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a79:	00 
  801a7a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a80:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a86:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a8b:	ba 00 00 00 00       	mov    $0x0,%edx
  801a90:	be 00 00 00 00       	mov    $0x0,%esi
  801a95:	bf 02 00 00 00       	mov    $0x2,%edi
  801a9a:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801aa1:	00 00 00 
  801aa4:	ff d0                	callq  *%rax
  801aa6:	c9                   	leaveq 
  801aa7:	c3                   	retq   

0000000000801aa8 <sys_yield>:
  801aa8:	55                   	push   %rbp
  801aa9:	48 89 e5             	mov    %rsp,%rbp
  801aac:	48 83 ec 10          	sub    $0x10,%rsp
  801ab0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ab7:	00 
  801ab8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801abe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ac4:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ac9:	ba 00 00 00 00       	mov    $0x0,%edx
  801ace:	be 00 00 00 00       	mov    $0x0,%esi
  801ad3:	bf 0b 00 00 00       	mov    $0xb,%edi
  801ad8:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801adf:	00 00 00 
  801ae2:	ff d0                	callq  *%rax
  801ae4:	c9                   	leaveq 
  801ae5:	c3                   	retq   

0000000000801ae6 <sys_page_alloc>:
  801ae6:	55                   	push   %rbp
  801ae7:	48 89 e5             	mov    %rsp,%rbp
  801aea:	48 83 ec 20          	sub    $0x20,%rsp
  801aee:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801af1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801af5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801af8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801afb:	48 63 c8             	movslq %eax,%rcx
  801afe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b02:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b05:	48 98                	cltq   
  801b07:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b0e:	00 
  801b0f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b15:	49 89 c8             	mov    %rcx,%r8
  801b18:	48 89 d1             	mov    %rdx,%rcx
  801b1b:	48 89 c2             	mov    %rax,%rdx
  801b1e:	be 01 00 00 00       	mov    $0x1,%esi
  801b23:	bf 04 00 00 00       	mov    $0x4,%edi
  801b28:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801b2f:	00 00 00 
  801b32:	ff d0                	callq  *%rax
  801b34:	c9                   	leaveq 
  801b35:	c3                   	retq   

0000000000801b36 <sys_page_map>:
  801b36:	55                   	push   %rbp
  801b37:	48 89 e5             	mov    %rsp,%rbp
  801b3a:	48 83 ec 30          	sub    $0x30,%rsp
  801b3e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b41:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b45:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b48:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b4c:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b50:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b53:	48 63 c8             	movslq %eax,%rcx
  801b56:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b5a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b5d:	48 63 f0             	movslq %eax,%rsi
  801b60:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b64:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b67:	48 98                	cltq   
  801b69:	48 89 0c 24          	mov    %rcx,(%rsp)
  801b6d:	49 89 f9             	mov    %rdi,%r9
  801b70:	49 89 f0             	mov    %rsi,%r8
  801b73:	48 89 d1             	mov    %rdx,%rcx
  801b76:	48 89 c2             	mov    %rax,%rdx
  801b79:	be 01 00 00 00       	mov    $0x1,%esi
  801b7e:	bf 05 00 00 00       	mov    $0x5,%edi
  801b83:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801b8a:	00 00 00 
  801b8d:	ff d0                	callq  *%rax
  801b8f:	c9                   	leaveq 
  801b90:	c3                   	retq   

0000000000801b91 <sys_page_unmap>:
  801b91:	55                   	push   %rbp
  801b92:	48 89 e5             	mov    %rsp,%rbp
  801b95:	48 83 ec 20          	sub    $0x20,%rsp
  801b99:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b9c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ba0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ba4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ba7:	48 98                	cltq   
  801ba9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bb0:	00 
  801bb1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bb7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bbd:	48 89 d1             	mov    %rdx,%rcx
  801bc0:	48 89 c2             	mov    %rax,%rdx
  801bc3:	be 01 00 00 00       	mov    $0x1,%esi
  801bc8:	bf 06 00 00 00       	mov    $0x6,%edi
  801bcd:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801bd4:	00 00 00 
  801bd7:	ff d0                	callq  *%rax
  801bd9:	c9                   	leaveq 
  801bda:	c3                   	retq   

0000000000801bdb <sys_env_set_status>:
  801bdb:	55                   	push   %rbp
  801bdc:	48 89 e5             	mov    %rsp,%rbp
  801bdf:	48 83 ec 10          	sub    $0x10,%rsp
  801be3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801be6:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801be9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bec:	48 63 d0             	movslq %eax,%rdx
  801bef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bf2:	48 98                	cltq   
  801bf4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bfb:	00 
  801bfc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c02:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c08:	48 89 d1             	mov    %rdx,%rcx
  801c0b:	48 89 c2             	mov    %rax,%rdx
  801c0e:	be 01 00 00 00       	mov    $0x1,%esi
  801c13:	bf 08 00 00 00       	mov    $0x8,%edi
  801c18:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801c1f:	00 00 00 
  801c22:	ff d0                	callq  *%rax
  801c24:	c9                   	leaveq 
  801c25:	c3                   	retq   

0000000000801c26 <sys_env_set_trapframe>:
  801c26:	55                   	push   %rbp
  801c27:	48 89 e5             	mov    %rsp,%rbp
  801c2a:	48 83 ec 20          	sub    $0x20,%rsp
  801c2e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c31:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c35:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c3c:	48 98                	cltq   
  801c3e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c45:	00 
  801c46:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c4c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c52:	48 89 d1             	mov    %rdx,%rcx
  801c55:	48 89 c2             	mov    %rax,%rdx
  801c58:	be 01 00 00 00       	mov    $0x1,%esi
  801c5d:	bf 09 00 00 00       	mov    $0x9,%edi
  801c62:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801c69:	00 00 00 
  801c6c:	ff d0                	callq  *%rax
  801c6e:	c9                   	leaveq 
  801c6f:	c3                   	retq   

0000000000801c70 <sys_env_set_pgfault_upcall>:
  801c70:	55                   	push   %rbp
  801c71:	48 89 e5             	mov    %rsp,%rbp
  801c74:	48 83 ec 20          	sub    $0x20,%rsp
  801c78:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c7b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c7f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c86:	48 98                	cltq   
  801c88:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c8f:	00 
  801c90:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c96:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c9c:	48 89 d1             	mov    %rdx,%rcx
  801c9f:	48 89 c2             	mov    %rax,%rdx
  801ca2:	be 01 00 00 00       	mov    $0x1,%esi
  801ca7:	bf 0a 00 00 00       	mov    $0xa,%edi
  801cac:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801cb3:	00 00 00 
  801cb6:	ff d0                	callq  *%rax
  801cb8:	c9                   	leaveq 
  801cb9:	c3                   	retq   

0000000000801cba <sys_ipc_try_send>:
  801cba:	55                   	push   %rbp
  801cbb:	48 89 e5             	mov    %rsp,%rbp
  801cbe:	48 83 ec 20          	sub    $0x20,%rsp
  801cc2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cc5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cc9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801ccd:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801cd0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cd3:	48 63 f0             	movslq %eax,%rsi
  801cd6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801cda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cdd:	48 98                	cltq   
  801cdf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ce3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cea:	00 
  801ceb:	49 89 f1             	mov    %rsi,%r9
  801cee:	49 89 c8             	mov    %rcx,%r8
  801cf1:	48 89 d1             	mov    %rdx,%rcx
  801cf4:	48 89 c2             	mov    %rax,%rdx
  801cf7:	be 00 00 00 00       	mov    $0x0,%esi
  801cfc:	bf 0c 00 00 00       	mov    $0xc,%edi
  801d01:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801d08:	00 00 00 
  801d0b:	ff d0                	callq  *%rax
  801d0d:	c9                   	leaveq 
  801d0e:	c3                   	retq   

0000000000801d0f <sys_ipc_recv>:
  801d0f:	55                   	push   %rbp
  801d10:	48 89 e5             	mov    %rsp,%rbp
  801d13:	48 83 ec 10          	sub    $0x10,%rsp
  801d17:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d1b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d1f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d26:	00 
  801d27:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d2d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d33:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d38:	48 89 c2             	mov    %rax,%rdx
  801d3b:	be 01 00 00 00       	mov    $0x1,%esi
  801d40:	bf 0d 00 00 00       	mov    $0xd,%edi
  801d45:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801d4c:	00 00 00 
  801d4f:	ff d0                	callq  *%rax
  801d51:	c9                   	leaveq 
  801d52:	c3                   	retq   

0000000000801d53 <sys_time_msec>:
  801d53:	55                   	push   %rbp
  801d54:	48 89 e5             	mov    %rsp,%rbp
  801d57:	48 83 ec 10          	sub    $0x10,%rsp
  801d5b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d62:	00 
  801d63:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d69:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d6f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d74:	ba 00 00 00 00       	mov    $0x0,%edx
  801d79:	be 00 00 00 00       	mov    $0x0,%esi
  801d7e:	bf 0e 00 00 00       	mov    $0xe,%edi
  801d83:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801d8a:	00 00 00 
  801d8d:	ff d0                	callq  *%rax
  801d8f:	c9                   	leaveq 
  801d90:	c3                   	retq   

0000000000801d91 <sys_net_transmit>:
  801d91:	55                   	push   %rbp
  801d92:	48 89 e5             	mov    %rsp,%rbp
  801d95:	48 83 ec 20          	sub    $0x20,%rsp
  801d99:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d9d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801da0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801da3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801da7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dae:	00 
  801daf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801db5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dbb:	48 89 d1             	mov    %rdx,%rcx
  801dbe:	48 89 c2             	mov    %rax,%rdx
  801dc1:	be 00 00 00 00       	mov    $0x0,%esi
  801dc6:	bf 0f 00 00 00       	mov    $0xf,%edi
  801dcb:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801dd2:	00 00 00 
  801dd5:	ff d0                	callq  *%rax
  801dd7:	c9                   	leaveq 
  801dd8:	c3                   	retq   

0000000000801dd9 <sys_net_receive>:
  801dd9:	55                   	push   %rbp
  801dda:	48 89 e5             	mov    %rsp,%rbp
  801ddd:	48 83 ec 20          	sub    $0x20,%rsp
  801de1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801de5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801de8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801deb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801def:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801df6:	00 
  801df7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dfd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e03:	48 89 d1             	mov    %rdx,%rcx
  801e06:	48 89 c2             	mov    %rax,%rdx
  801e09:	be 00 00 00 00       	mov    $0x0,%esi
  801e0e:	bf 10 00 00 00       	mov    $0x10,%edi
  801e13:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801e1a:	00 00 00 
  801e1d:	ff d0                	callq  *%rax
  801e1f:	c9                   	leaveq 
  801e20:	c3                   	retq   

0000000000801e21 <sys_ept_map>:
  801e21:	55                   	push   %rbp
  801e22:	48 89 e5             	mov    %rsp,%rbp
  801e25:	48 83 ec 30          	sub    $0x30,%rsp
  801e29:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e2c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e30:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e33:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e37:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e3b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801e3e:	48 63 c8             	movslq %eax,%rcx
  801e41:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801e45:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e48:	48 63 f0             	movslq %eax,%rsi
  801e4b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e52:	48 98                	cltq   
  801e54:	48 89 0c 24          	mov    %rcx,(%rsp)
  801e58:	49 89 f9             	mov    %rdi,%r9
  801e5b:	49 89 f0             	mov    %rsi,%r8
  801e5e:	48 89 d1             	mov    %rdx,%rcx
  801e61:	48 89 c2             	mov    %rax,%rdx
  801e64:	be 00 00 00 00       	mov    $0x0,%esi
  801e69:	bf 11 00 00 00       	mov    $0x11,%edi
  801e6e:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801e75:	00 00 00 
  801e78:	ff d0                	callq  *%rax
  801e7a:	c9                   	leaveq 
  801e7b:	c3                   	retq   

0000000000801e7c <sys_env_mkguest>:
  801e7c:	55                   	push   %rbp
  801e7d:	48 89 e5             	mov    %rsp,%rbp
  801e80:	48 83 ec 20          	sub    $0x20,%rsp
  801e84:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e88:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e8c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e94:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e9b:	00 
  801e9c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ea2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ea8:	48 89 d1             	mov    %rdx,%rcx
  801eab:	48 89 c2             	mov    %rax,%rdx
  801eae:	be 00 00 00 00       	mov    $0x0,%esi
  801eb3:	bf 12 00 00 00       	mov    $0x12,%edi
  801eb8:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801ebf:	00 00 00 
  801ec2:	ff d0                	callq  *%rax
  801ec4:	c9                   	leaveq 
  801ec5:	c3                   	retq   

0000000000801ec6 <sys_vmx_list_vms>:
  801ec6:	55                   	push   %rbp
  801ec7:	48 89 e5             	mov    %rsp,%rbp
  801eca:	48 83 ec 10          	sub    $0x10,%rsp
  801ece:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ed5:	00 
  801ed6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801edc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ee2:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ee7:	ba 00 00 00 00       	mov    $0x0,%edx
  801eec:	be 00 00 00 00       	mov    $0x0,%esi
  801ef1:	bf 13 00 00 00       	mov    $0x13,%edi
  801ef6:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801efd:	00 00 00 
  801f00:	ff d0                	callq  *%rax
  801f02:	c9                   	leaveq 
  801f03:	c3                   	retq   

0000000000801f04 <sys_vmx_sel_resume>:
  801f04:	55                   	push   %rbp
  801f05:	48 89 e5             	mov    %rsp,%rbp
  801f08:	48 83 ec 10          	sub    $0x10,%rsp
  801f0c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f0f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f12:	48 98                	cltq   
  801f14:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f1b:	00 
  801f1c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f22:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f28:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f2d:	48 89 c2             	mov    %rax,%rdx
  801f30:	be 00 00 00 00       	mov    $0x0,%esi
  801f35:	bf 14 00 00 00       	mov    $0x14,%edi
  801f3a:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801f41:	00 00 00 
  801f44:	ff d0                	callq  *%rax
  801f46:	c9                   	leaveq 
  801f47:	c3                   	retq   

0000000000801f48 <sys_vmx_get_vmdisk_number>:
  801f48:	55                   	push   %rbp
  801f49:	48 89 e5             	mov    %rsp,%rbp
  801f4c:	48 83 ec 10          	sub    $0x10,%rsp
  801f50:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f57:	00 
  801f58:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f5e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f64:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f69:	ba 00 00 00 00       	mov    $0x0,%edx
  801f6e:	be 00 00 00 00       	mov    $0x0,%esi
  801f73:	bf 15 00 00 00       	mov    $0x15,%edi
  801f78:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801f7f:	00 00 00 
  801f82:	ff d0                	callq  *%rax
  801f84:	c9                   	leaveq 
  801f85:	c3                   	retq   

0000000000801f86 <sys_vmx_incr_vmdisk_number>:
  801f86:	55                   	push   %rbp
  801f87:	48 89 e5             	mov    %rsp,%rbp
  801f8a:	48 83 ec 10          	sub    $0x10,%rsp
  801f8e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f95:	00 
  801f96:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f9c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fa2:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fa7:	ba 00 00 00 00       	mov    $0x0,%edx
  801fac:	be 00 00 00 00       	mov    $0x0,%esi
  801fb1:	bf 16 00 00 00       	mov    $0x16,%edi
  801fb6:	48 b8 10 19 80 00 00 	movabs $0x801910,%rax
  801fbd:	00 00 00 
  801fc0:	ff d0                	callq  *%rax
  801fc2:	c9                   	leaveq 
  801fc3:	c3                   	retq   

0000000000801fc4 <pgfault>:
  801fc4:	55                   	push   %rbp
  801fc5:	48 89 e5             	mov    %rsp,%rbp
  801fc8:	48 83 ec 30          	sub    $0x30,%rsp
  801fcc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801fd0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fd4:	48 8b 00             	mov    (%rax),%rax
  801fd7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801fdb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fdf:	48 8b 40 08          	mov    0x8(%rax),%rax
  801fe3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fe6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fe9:	83 e0 02             	and    $0x2,%eax
  801fec:	85 c0                	test   %eax,%eax
  801fee:	75 40                	jne    802030 <pgfault+0x6c>
  801ff0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ff4:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801ffb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fff:	49 89 d0             	mov    %rdx,%r8
  802002:	48 89 c1             	mov    %rax,%rcx
  802005:	48 ba 38 50 80 00 00 	movabs $0x805038,%rdx
  80200c:	00 00 00 
  80200f:	be 1f 00 00 00       	mov    $0x1f,%esi
  802014:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  80201b:	00 00 00 
  80201e:	b8 00 00 00 00       	mov    $0x0,%eax
  802023:	49 b9 c9 03 80 00 00 	movabs $0x8003c9,%r9
  80202a:	00 00 00 
  80202d:	41 ff d1             	callq  *%r9
  802030:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802034:	48 c1 e8 0c          	shr    $0xc,%rax
  802038:	48 89 c2             	mov    %rax,%rdx
  80203b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802042:	01 00 00 
  802045:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802049:	25 07 08 00 00       	and    $0x807,%eax
  80204e:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  802054:	74 4e                	je     8020a4 <pgfault+0xe0>
  802056:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80205a:	48 c1 e8 0c          	shr    $0xc,%rax
  80205e:	48 89 c2             	mov    %rax,%rdx
  802061:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802068:	01 00 00 
  80206b:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80206f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802073:	49 89 d0             	mov    %rdx,%r8
  802076:	48 89 c1             	mov    %rax,%rcx
  802079:	48 ba 60 50 80 00 00 	movabs $0x805060,%rdx
  802080:	00 00 00 
  802083:	be 22 00 00 00       	mov    $0x22,%esi
  802088:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  80208f:	00 00 00 
  802092:	b8 00 00 00 00       	mov    $0x0,%eax
  802097:	49 b9 c9 03 80 00 00 	movabs $0x8003c9,%r9
  80209e:	00 00 00 
  8020a1:	41 ff d1             	callq  *%r9
  8020a4:	ba 07 00 00 00       	mov    $0x7,%edx
  8020a9:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8020b3:	48 b8 e6 1a 80 00 00 	movabs $0x801ae6,%rax
  8020ba:	00 00 00 
  8020bd:	ff d0                	callq  *%rax
  8020bf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020c2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020c6:	79 30                	jns    8020f8 <pgfault+0x134>
  8020c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020cb:	89 c1                	mov    %eax,%ecx
  8020cd:	48 ba 8b 50 80 00 00 	movabs $0x80508b,%rdx
  8020d4:	00 00 00 
  8020d7:	be 30 00 00 00       	mov    $0x30,%esi
  8020dc:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  8020e3:	00 00 00 
  8020e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8020eb:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8020f2:	00 00 00 
  8020f5:	41 ff d0             	callq  *%r8
  8020f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020fc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802100:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802104:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80210a:	ba 00 10 00 00       	mov    $0x1000,%edx
  80210f:	48 89 c6             	mov    %rax,%rsi
  802112:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802117:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  80211e:	00 00 00 
  802121:	ff d0                	callq  *%rax
  802123:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802127:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80212b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80212f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802135:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80213b:	48 89 c1             	mov    %rax,%rcx
  80213e:	ba 00 00 00 00       	mov    $0x0,%edx
  802143:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802148:	bf 00 00 00 00       	mov    $0x0,%edi
  80214d:	48 b8 36 1b 80 00 00 	movabs $0x801b36,%rax
  802154:	00 00 00 
  802157:	ff d0                	callq  *%rax
  802159:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80215c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802160:	79 30                	jns    802192 <pgfault+0x1ce>
  802162:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802165:	89 c1                	mov    %eax,%ecx
  802167:	48 ba 9e 50 80 00 00 	movabs $0x80509e,%rdx
  80216e:	00 00 00 
  802171:	be 35 00 00 00       	mov    $0x35,%esi
  802176:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  80217d:	00 00 00 
  802180:	b8 00 00 00 00       	mov    $0x0,%eax
  802185:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  80218c:	00 00 00 
  80218f:	41 ff d0             	callq  *%r8
  802192:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802197:	bf 00 00 00 00       	mov    $0x0,%edi
  80219c:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  8021a3:	00 00 00 
  8021a6:	ff d0                	callq  *%rax
  8021a8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8021ab:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8021af:	79 30                	jns    8021e1 <pgfault+0x21d>
  8021b1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021b4:	89 c1                	mov    %eax,%ecx
  8021b6:	48 ba af 50 80 00 00 	movabs $0x8050af,%rdx
  8021bd:	00 00 00 
  8021c0:	be 39 00 00 00       	mov    $0x39,%esi
  8021c5:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  8021cc:	00 00 00 
  8021cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8021d4:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8021db:	00 00 00 
  8021de:	41 ff d0             	callq  *%r8
  8021e1:	c9                   	leaveq 
  8021e2:	c3                   	retq   

00000000008021e3 <duppage>:
  8021e3:	55                   	push   %rbp
  8021e4:	48 89 e5             	mov    %rsp,%rbp
  8021e7:	48 83 ec 30          	sub    $0x30,%rsp
  8021eb:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8021ee:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8021f1:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8021f4:	c1 e0 0c             	shl    $0xc,%eax
  8021f7:	89 c0                	mov    %eax,%eax
  8021f9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8021fd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802204:	01 00 00 
  802207:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80220a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80220e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802212:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802216:	25 02 08 00 00       	and    $0x802,%eax
  80221b:	48 85 c0             	test   %rax,%rax
  80221e:	74 0e                	je     80222e <duppage+0x4b>
  802220:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802224:	25 00 04 00 00       	and    $0x400,%eax
  802229:	48 85 c0             	test   %rax,%rax
  80222c:	74 70                	je     80229e <duppage+0xbb>
  80222e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802232:	25 07 0e 00 00       	and    $0xe07,%eax
  802237:	89 c6                	mov    %eax,%esi
  802239:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80223d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802240:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802244:	41 89 f0             	mov    %esi,%r8d
  802247:	48 89 c6             	mov    %rax,%rsi
  80224a:	bf 00 00 00 00       	mov    $0x0,%edi
  80224f:	48 b8 36 1b 80 00 00 	movabs $0x801b36,%rax
  802256:	00 00 00 
  802259:	ff d0                	callq  *%rax
  80225b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80225e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802262:	79 30                	jns    802294 <duppage+0xb1>
  802264:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802267:	89 c1                	mov    %eax,%ecx
  802269:	48 ba 9e 50 80 00 00 	movabs $0x80509e,%rdx
  802270:	00 00 00 
  802273:	be 63 00 00 00       	mov    $0x63,%esi
  802278:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  80227f:	00 00 00 
  802282:	b8 00 00 00 00       	mov    $0x0,%eax
  802287:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  80228e:	00 00 00 
  802291:	41 ff d0             	callq  *%r8
  802294:	b8 00 00 00 00       	mov    $0x0,%eax
  802299:	e9 c4 00 00 00       	jmpq   802362 <duppage+0x17f>
  80229e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8022a2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8022a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022a9:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8022af:	48 89 c6             	mov    %rax,%rsi
  8022b2:	bf 00 00 00 00       	mov    $0x0,%edi
  8022b7:	48 b8 36 1b 80 00 00 	movabs $0x801b36,%rax
  8022be:	00 00 00 
  8022c1:	ff d0                	callq  *%rax
  8022c3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8022c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8022ca:	79 30                	jns    8022fc <duppage+0x119>
  8022cc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022cf:	89 c1                	mov    %eax,%ecx
  8022d1:	48 ba 9e 50 80 00 00 	movabs $0x80509e,%rdx
  8022d8:	00 00 00 
  8022db:	be 7e 00 00 00       	mov    $0x7e,%esi
  8022e0:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  8022e7:	00 00 00 
  8022ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8022ef:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8022f6:	00 00 00 
  8022f9:	41 ff d0             	callq  *%r8
  8022fc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802300:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802304:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80230a:	48 89 d1             	mov    %rdx,%rcx
  80230d:	ba 00 00 00 00       	mov    $0x0,%edx
  802312:	48 89 c6             	mov    %rax,%rsi
  802315:	bf 00 00 00 00       	mov    $0x0,%edi
  80231a:	48 b8 36 1b 80 00 00 	movabs $0x801b36,%rax
  802321:	00 00 00 
  802324:	ff d0                	callq  *%rax
  802326:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802329:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80232d:	79 30                	jns    80235f <duppage+0x17c>
  80232f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802332:	89 c1                	mov    %eax,%ecx
  802334:	48 ba 9e 50 80 00 00 	movabs $0x80509e,%rdx
  80233b:	00 00 00 
  80233e:	be 80 00 00 00       	mov    $0x80,%esi
  802343:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  80234a:	00 00 00 
  80234d:	b8 00 00 00 00       	mov    $0x0,%eax
  802352:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  802359:	00 00 00 
  80235c:	41 ff d0             	callq  *%r8
  80235f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802362:	c9                   	leaveq 
  802363:	c3                   	retq   

0000000000802364 <fork>:
  802364:	55                   	push   %rbp
  802365:	48 89 e5             	mov    %rsp,%rbp
  802368:	48 83 ec 20          	sub    $0x20,%rsp
  80236c:	48 bf c4 1f 80 00 00 	movabs $0x801fc4,%rdi
  802373:	00 00 00 
  802376:	48 b8 8c 46 80 00 00 	movabs $0x80468c,%rax
  80237d:	00 00 00 
  802380:	ff d0                	callq  *%rax
  802382:	b8 07 00 00 00       	mov    $0x7,%eax
  802387:	cd 30                	int    $0x30
  802389:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80238c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80238f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802392:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802396:	79 08                	jns    8023a0 <fork+0x3c>
  802398:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80239b:	e9 09 02 00 00       	jmpq   8025a9 <fork+0x245>
  8023a0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023a4:	75 3e                	jne    8023e4 <fork+0x80>
  8023a6:	48 b8 6a 1a 80 00 00 	movabs $0x801a6a,%rax
  8023ad:	00 00 00 
  8023b0:	ff d0                	callq  *%rax
  8023b2:	25 ff 03 00 00       	and    $0x3ff,%eax
  8023b7:	48 98                	cltq   
  8023b9:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8023c0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8023c7:	00 00 00 
  8023ca:	48 01 c2             	add    %rax,%rdx
  8023cd:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8023d4:	00 00 00 
  8023d7:	48 89 10             	mov    %rdx,(%rax)
  8023da:	b8 00 00 00 00       	mov    $0x0,%eax
  8023df:	e9 c5 01 00 00       	jmpq   8025a9 <fork+0x245>
  8023e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8023eb:	e9 a4 00 00 00       	jmpq   802494 <fork+0x130>
  8023f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023f3:	c1 f8 12             	sar    $0x12,%eax
  8023f6:	89 c2                	mov    %eax,%edx
  8023f8:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8023ff:	01 00 00 
  802402:	48 63 d2             	movslq %edx,%rdx
  802405:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802409:	83 e0 01             	and    $0x1,%eax
  80240c:	48 85 c0             	test   %rax,%rax
  80240f:	74 21                	je     802432 <fork+0xce>
  802411:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802414:	c1 f8 09             	sar    $0x9,%eax
  802417:	89 c2                	mov    %eax,%edx
  802419:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802420:	01 00 00 
  802423:	48 63 d2             	movslq %edx,%rdx
  802426:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80242a:	83 e0 01             	and    $0x1,%eax
  80242d:	48 85 c0             	test   %rax,%rax
  802430:	75 09                	jne    80243b <fork+0xd7>
  802432:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802439:	eb 59                	jmp    802494 <fork+0x130>
  80243b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80243e:	05 00 02 00 00       	add    $0x200,%eax
  802443:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802446:	eb 44                	jmp    80248c <fork+0x128>
  802448:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80244f:	01 00 00 
  802452:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802455:	48 63 d2             	movslq %edx,%rdx
  802458:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80245c:	83 e0 05             	and    $0x5,%eax
  80245f:	48 83 f8 05          	cmp    $0x5,%rax
  802463:	74 02                	je     802467 <fork+0x103>
  802465:	eb 21                	jmp    802488 <fork+0x124>
  802467:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80246e:	75 02                	jne    802472 <fork+0x10e>
  802470:	eb 16                	jmp    802488 <fork+0x124>
  802472:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802475:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802478:	89 d6                	mov    %edx,%esi
  80247a:	89 c7                	mov    %eax,%edi
  80247c:	48 b8 e3 21 80 00 00 	movabs $0x8021e3,%rax
  802483:	00 00 00 
  802486:	ff d0                	callq  *%rax
  802488:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80248c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80248f:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802492:	7c b4                	jl     802448 <fork+0xe4>
  802494:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802497:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  80249c:	0f 86 4e ff ff ff    	jbe    8023f0 <fork+0x8c>
  8024a2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024a5:	ba 07 00 00 00       	mov    $0x7,%edx
  8024aa:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8024af:	89 c7                	mov    %eax,%edi
  8024b1:	48 b8 e6 1a 80 00 00 	movabs $0x801ae6,%rax
  8024b8:	00 00 00 
  8024bb:	ff d0                	callq  *%rax
  8024bd:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8024c0:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8024c4:	79 30                	jns    8024f6 <fork+0x192>
  8024c6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8024c9:	89 c1                	mov    %eax,%ecx
  8024cb:	48 ba c8 50 80 00 00 	movabs $0x8050c8,%rdx
  8024d2:	00 00 00 
  8024d5:	be bc 00 00 00       	mov    $0xbc,%esi
  8024da:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  8024e1:	00 00 00 
  8024e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8024e9:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8024f0:	00 00 00 
  8024f3:	41 ff d0             	callq  *%r8
  8024f6:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8024fd:	00 00 00 
  802500:	48 8b 00             	mov    (%rax),%rax
  802503:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  80250a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80250d:	48 89 d6             	mov    %rdx,%rsi
  802510:	89 c7                	mov    %eax,%edi
  802512:	48 b8 70 1c 80 00 00 	movabs $0x801c70,%rax
  802519:	00 00 00 
  80251c:	ff d0                	callq  *%rax
  80251e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802521:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802525:	79 30                	jns    802557 <fork+0x1f3>
  802527:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80252a:	89 c1                	mov    %eax,%ecx
  80252c:	48 ba e8 50 80 00 00 	movabs $0x8050e8,%rdx
  802533:	00 00 00 
  802536:	be c0 00 00 00       	mov    $0xc0,%esi
  80253b:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  802542:	00 00 00 
  802545:	b8 00 00 00 00       	mov    $0x0,%eax
  80254a:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  802551:	00 00 00 
  802554:	41 ff d0             	callq  *%r8
  802557:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80255a:	be 02 00 00 00       	mov    $0x2,%esi
  80255f:	89 c7                	mov    %eax,%edi
  802561:	48 b8 db 1b 80 00 00 	movabs $0x801bdb,%rax
  802568:	00 00 00 
  80256b:	ff d0                	callq  *%rax
  80256d:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802570:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802574:	79 30                	jns    8025a6 <fork+0x242>
  802576:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802579:	89 c1                	mov    %eax,%ecx
  80257b:	48 ba 07 51 80 00 00 	movabs $0x805107,%rdx
  802582:	00 00 00 
  802585:	be c5 00 00 00       	mov    $0xc5,%esi
  80258a:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  802591:	00 00 00 
  802594:	b8 00 00 00 00       	mov    $0x0,%eax
  802599:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8025a0:	00 00 00 
  8025a3:	41 ff d0             	callq  *%r8
  8025a6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025a9:	c9                   	leaveq 
  8025aa:	c3                   	retq   

00000000008025ab <sfork>:
  8025ab:	55                   	push   %rbp
  8025ac:	48 89 e5             	mov    %rsp,%rbp
  8025af:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  8025b6:	00 00 00 
  8025b9:	be d2 00 00 00       	mov    $0xd2,%esi
  8025be:	48 bf 51 50 80 00 00 	movabs $0x805051,%rdi
  8025c5:	00 00 00 
  8025c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8025cd:	48 b9 c9 03 80 00 00 	movabs $0x8003c9,%rcx
  8025d4:	00 00 00 
  8025d7:	ff d1                	callq  *%rcx

00000000008025d9 <fd2num>:
  8025d9:	55                   	push   %rbp
  8025da:	48 89 e5             	mov    %rsp,%rbp
  8025dd:	48 83 ec 08          	sub    $0x8,%rsp
  8025e1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025e5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8025e9:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8025f0:	ff ff ff 
  8025f3:	48 01 d0             	add    %rdx,%rax
  8025f6:	48 c1 e8 0c          	shr    $0xc,%rax
  8025fa:	c9                   	leaveq 
  8025fb:	c3                   	retq   

00000000008025fc <fd2data>:
  8025fc:	55                   	push   %rbp
  8025fd:	48 89 e5             	mov    %rsp,%rbp
  802600:	48 83 ec 08          	sub    $0x8,%rsp
  802604:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802608:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80260c:	48 89 c7             	mov    %rax,%rdi
  80260f:	48 b8 d9 25 80 00 00 	movabs $0x8025d9,%rax
  802616:	00 00 00 
  802619:	ff d0                	callq  *%rax
  80261b:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802621:	48 c1 e0 0c          	shl    $0xc,%rax
  802625:	c9                   	leaveq 
  802626:	c3                   	retq   

0000000000802627 <fd_alloc>:
  802627:	55                   	push   %rbp
  802628:	48 89 e5             	mov    %rsp,%rbp
  80262b:	48 83 ec 18          	sub    $0x18,%rsp
  80262f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802633:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80263a:	eb 6b                	jmp    8026a7 <fd_alloc+0x80>
  80263c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80263f:	48 98                	cltq   
  802641:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802647:	48 c1 e0 0c          	shl    $0xc,%rax
  80264b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80264f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802653:	48 c1 e8 15          	shr    $0x15,%rax
  802657:	48 89 c2             	mov    %rax,%rdx
  80265a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802661:	01 00 00 
  802664:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802668:	83 e0 01             	and    $0x1,%eax
  80266b:	48 85 c0             	test   %rax,%rax
  80266e:	74 21                	je     802691 <fd_alloc+0x6a>
  802670:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802674:	48 c1 e8 0c          	shr    $0xc,%rax
  802678:	48 89 c2             	mov    %rax,%rdx
  80267b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802682:	01 00 00 
  802685:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802689:	83 e0 01             	and    $0x1,%eax
  80268c:	48 85 c0             	test   %rax,%rax
  80268f:	75 12                	jne    8026a3 <fd_alloc+0x7c>
  802691:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802695:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802699:	48 89 10             	mov    %rdx,(%rax)
  80269c:	b8 00 00 00 00       	mov    $0x0,%eax
  8026a1:	eb 1a                	jmp    8026bd <fd_alloc+0x96>
  8026a3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8026a7:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8026ab:	7e 8f                	jle    80263c <fd_alloc+0x15>
  8026ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026b1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8026b8:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8026bd:	c9                   	leaveq 
  8026be:	c3                   	retq   

00000000008026bf <fd_lookup>:
  8026bf:	55                   	push   %rbp
  8026c0:	48 89 e5             	mov    %rsp,%rbp
  8026c3:	48 83 ec 20          	sub    $0x20,%rsp
  8026c7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8026ca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8026d2:	78 06                	js     8026da <fd_lookup+0x1b>
  8026d4:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8026d8:	7e 07                	jle    8026e1 <fd_lookup+0x22>
  8026da:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8026df:	eb 6c                	jmp    80274d <fd_lookup+0x8e>
  8026e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8026e4:	48 98                	cltq   
  8026e6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8026ec:	48 c1 e0 0c          	shl    $0xc,%rax
  8026f0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8026f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026f8:	48 c1 e8 15          	shr    $0x15,%rax
  8026fc:	48 89 c2             	mov    %rax,%rdx
  8026ff:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802706:	01 00 00 
  802709:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80270d:	83 e0 01             	and    $0x1,%eax
  802710:	48 85 c0             	test   %rax,%rax
  802713:	74 21                	je     802736 <fd_lookup+0x77>
  802715:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802719:	48 c1 e8 0c          	shr    $0xc,%rax
  80271d:	48 89 c2             	mov    %rax,%rdx
  802720:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802727:	01 00 00 
  80272a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80272e:	83 e0 01             	and    $0x1,%eax
  802731:	48 85 c0             	test   %rax,%rax
  802734:	75 07                	jne    80273d <fd_lookup+0x7e>
  802736:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80273b:	eb 10                	jmp    80274d <fd_lookup+0x8e>
  80273d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802741:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802745:	48 89 10             	mov    %rdx,(%rax)
  802748:	b8 00 00 00 00       	mov    $0x0,%eax
  80274d:	c9                   	leaveq 
  80274e:	c3                   	retq   

000000000080274f <fd_close>:
  80274f:	55                   	push   %rbp
  802750:	48 89 e5             	mov    %rsp,%rbp
  802753:	48 83 ec 30          	sub    $0x30,%rsp
  802757:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80275b:	89 f0                	mov    %esi,%eax
  80275d:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802760:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802764:	48 89 c7             	mov    %rax,%rdi
  802767:	48 b8 d9 25 80 00 00 	movabs $0x8025d9,%rax
  80276e:	00 00 00 
  802771:	ff d0                	callq  *%rax
  802773:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802777:	48 89 d6             	mov    %rdx,%rsi
  80277a:	89 c7                	mov    %eax,%edi
  80277c:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  802783:	00 00 00 
  802786:	ff d0                	callq  *%rax
  802788:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80278b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80278f:	78 0a                	js     80279b <fd_close+0x4c>
  802791:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802795:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802799:	74 12                	je     8027ad <fd_close+0x5e>
  80279b:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80279f:	74 05                	je     8027a6 <fd_close+0x57>
  8027a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027a4:	eb 05                	jmp    8027ab <fd_close+0x5c>
  8027a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8027ab:	eb 69                	jmp    802816 <fd_close+0xc7>
  8027ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027b1:	8b 00                	mov    (%rax),%eax
  8027b3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8027b7:	48 89 d6             	mov    %rdx,%rsi
  8027ba:	89 c7                	mov    %eax,%edi
  8027bc:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  8027c3:	00 00 00 
  8027c6:	ff d0                	callq  *%rax
  8027c8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027cb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027cf:	78 2a                	js     8027fb <fd_close+0xac>
  8027d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027d5:	48 8b 40 20          	mov    0x20(%rax),%rax
  8027d9:	48 85 c0             	test   %rax,%rax
  8027dc:	74 16                	je     8027f4 <fd_close+0xa5>
  8027de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027e2:	48 8b 40 20          	mov    0x20(%rax),%rax
  8027e6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8027ea:	48 89 d7             	mov    %rdx,%rdi
  8027ed:	ff d0                	callq  *%rax
  8027ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027f2:	eb 07                	jmp    8027fb <fd_close+0xac>
  8027f4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027ff:	48 89 c6             	mov    %rax,%rsi
  802802:	bf 00 00 00 00       	mov    $0x0,%edi
  802807:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  80280e:	00 00 00 
  802811:	ff d0                	callq  *%rax
  802813:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802816:	c9                   	leaveq 
  802817:	c3                   	retq   

0000000000802818 <dev_lookup>:
  802818:	55                   	push   %rbp
  802819:	48 89 e5             	mov    %rsp,%rbp
  80281c:	48 83 ec 20          	sub    $0x20,%rsp
  802820:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802823:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802827:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80282e:	eb 41                	jmp    802871 <dev_lookup+0x59>
  802830:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802837:	00 00 00 
  80283a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80283d:	48 63 d2             	movslq %edx,%rdx
  802840:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802844:	8b 00                	mov    (%rax),%eax
  802846:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802849:	75 22                	jne    80286d <dev_lookup+0x55>
  80284b:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802852:	00 00 00 
  802855:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802858:	48 63 d2             	movslq %edx,%rdx
  80285b:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80285f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802863:	48 89 10             	mov    %rdx,(%rax)
  802866:	b8 00 00 00 00       	mov    $0x0,%eax
  80286b:	eb 60                	jmp    8028cd <dev_lookup+0xb5>
  80286d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802871:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802878:	00 00 00 
  80287b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80287e:	48 63 d2             	movslq %edx,%rdx
  802881:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802885:	48 85 c0             	test   %rax,%rax
  802888:	75 a6                	jne    802830 <dev_lookup+0x18>
  80288a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802891:	00 00 00 
  802894:	48 8b 00             	mov    (%rax),%rax
  802897:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80289d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8028a0:	89 c6                	mov    %eax,%esi
  8028a2:	48 bf 38 51 80 00 00 	movabs $0x805138,%rdi
  8028a9:	00 00 00 
  8028ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8028b1:	48 b9 02 06 80 00 00 	movabs $0x800602,%rcx
  8028b8:	00 00 00 
  8028bb:	ff d1                	callq  *%rcx
  8028bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8028c1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8028c8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8028cd:	c9                   	leaveq 
  8028ce:	c3                   	retq   

00000000008028cf <close>:
  8028cf:	55                   	push   %rbp
  8028d0:	48 89 e5             	mov    %rsp,%rbp
  8028d3:	48 83 ec 20          	sub    $0x20,%rsp
  8028d7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028da:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028de:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028e1:	48 89 d6             	mov    %rdx,%rsi
  8028e4:	89 c7                	mov    %eax,%edi
  8028e6:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  8028ed:	00 00 00 
  8028f0:	ff d0                	callq  *%rax
  8028f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028f9:	79 05                	jns    802900 <close+0x31>
  8028fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028fe:	eb 18                	jmp    802918 <close+0x49>
  802900:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802904:	be 01 00 00 00       	mov    $0x1,%esi
  802909:	48 89 c7             	mov    %rax,%rdi
  80290c:	48 b8 4f 27 80 00 00 	movabs $0x80274f,%rax
  802913:	00 00 00 
  802916:	ff d0                	callq  *%rax
  802918:	c9                   	leaveq 
  802919:	c3                   	retq   

000000000080291a <close_all>:
  80291a:	55                   	push   %rbp
  80291b:	48 89 e5             	mov    %rsp,%rbp
  80291e:	48 83 ec 10          	sub    $0x10,%rsp
  802922:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802929:	eb 15                	jmp    802940 <close_all+0x26>
  80292b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80292e:	89 c7                	mov    %eax,%edi
  802930:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  802937:	00 00 00 
  80293a:	ff d0                	callq  *%rax
  80293c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802940:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802944:	7e e5                	jle    80292b <close_all+0x11>
  802946:	c9                   	leaveq 
  802947:	c3                   	retq   

0000000000802948 <dup>:
  802948:	55                   	push   %rbp
  802949:	48 89 e5             	mov    %rsp,%rbp
  80294c:	48 83 ec 40          	sub    $0x40,%rsp
  802950:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802953:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802956:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80295a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80295d:	48 89 d6             	mov    %rdx,%rsi
  802960:	89 c7                	mov    %eax,%edi
  802962:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  802969:	00 00 00 
  80296c:	ff d0                	callq  *%rax
  80296e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802971:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802975:	79 08                	jns    80297f <dup+0x37>
  802977:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80297a:	e9 70 01 00 00       	jmpq   802aef <dup+0x1a7>
  80297f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802982:	89 c7                	mov    %eax,%edi
  802984:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  80298b:	00 00 00 
  80298e:	ff d0                	callq  *%rax
  802990:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802993:	48 98                	cltq   
  802995:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80299b:	48 c1 e0 0c          	shl    $0xc,%rax
  80299f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8029a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029a7:	48 89 c7             	mov    %rax,%rdi
  8029aa:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  8029b1:	00 00 00 
  8029b4:	ff d0                	callq  *%rax
  8029b6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8029ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029be:	48 89 c7             	mov    %rax,%rdi
  8029c1:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  8029c8:	00 00 00 
  8029cb:	ff d0                	callq  *%rax
  8029cd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8029d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029d5:	48 c1 e8 15          	shr    $0x15,%rax
  8029d9:	48 89 c2             	mov    %rax,%rdx
  8029dc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8029e3:	01 00 00 
  8029e6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029ea:	83 e0 01             	and    $0x1,%eax
  8029ed:	48 85 c0             	test   %rax,%rax
  8029f0:	74 73                	je     802a65 <dup+0x11d>
  8029f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029f6:	48 c1 e8 0c          	shr    $0xc,%rax
  8029fa:	48 89 c2             	mov    %rax,%rdx
  8029fd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a04:	01 00 00 
  802a07:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a0b:	83 e0 01             	and    $0x1,%eax
  802a0e:	48 85 c0             	test   %rax,%rax
  802a11:	74 52                	je     802a65 <dup+0x11d>
  802a13:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a17:	48 c1 e8 0c          	shr    $0xc,%rax
  802a1b:	48 89 c2             	mov    %rax,%rdx
  802a1e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a25:	01 00 00 
  802a28:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a2c:	25 07 0e 00 00       	and    $0xe07,%eax
  802a31:	89 c1                	mov    %eax,%ecx
  802a33:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802a37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a3b:	41 89 c8             	mov    %ecx,%r8d
  802a3e:	48 89 d1             	mov    %rdx,%rcx
  802a41:	ba 00 00 00 00       	mov    $0x0,%edx
  802a46:	48 89 c6             	mov    %rax,%rsi
  802a49:	bf 00 00 00 00       	mov    $0x0,%edi
  802a4e:	48 b8 36 1b 80 00 00 	movabs $0x801b36,%rax
  802a55:	00 00 00 
  802a58:	ff d0                	callq  *%rax
  802a5a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a5d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a61:	79 02                	jns    802a65 <dup+0x11d>
  802a63:	eb 57                	jmp    802abc <dup+0x174>
  802a65:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a69:	48 c1 e8 0c          	shr    $0xc,%rax
  802a6d:	48 89 c2             	mov    %rax,%rdx
  802a70:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a77:	01 00 00 
  802a7a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a7e:	25 07 0e 00 00       	and    $0xe07,%eax
  802a83:	89 c1                	mov    %eax,%ecx
  802a85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a89:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802a8d:	41 89 c8             	mov    %ecx,%r8d
  802a90:	48 89 d1             	mov    %rdx,%rcx
  802a93:	ba 00 00 00 00       	mov    $0x0,%edx
  802a98:	48 89 c6             	mov    %rax,%rsi
  802a9b:	bf 00 00 00 00       	mov    $0x0,%edi
  802aa0:	48 b8 36 1b 80 00 00 	movabs $0x801b36,%rax
  802aa7:	00 00 00 
  802aaa:	ff d0                	callq  *%rax
  802aac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aaf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ab3:	79 02                	jns    802ab7 <dup+0x16f>
  802ab5:	eb 05                	jmp    802abc <dup+0x174>
  802ab7:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802aba:	eb 33                	jmp    802aef <dup+0x1a7>
  802abc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ac0:	48 89 c6             	mov    %rax,%rsi
  802ac3:	bf 00 00 00 00       	mov    $0x0,%edi
  802ac8:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  802acf:	00 00 00 
  802ad2:	ff d0                	callq  *%rax
  802ad4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ad8:	48 89 c6             	mov    %rax,%rsi
  802adb:	bf 00 00 00 00       	mov    $0x0,%edi
  802ae0:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  802ae7:	00 00 00 
  802aea:	ff d0                	callq  *%rax
  802aec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802aef:	c9                   	leaveq 
  802af0:	c3                   	retq   

0000000000802af1 <read>:
  802af1:	55                   	push   %rbp
  802af2:	48 89 e5             	mov    %rsp,%rbp
  802af5:	48 83 ec 40          	sub    $0x40,%rsp
  802af9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802afc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b00:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b04:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b08:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b0b:	48 89 d6             	mov    %rdx,%rsi
  802b0e:	89 c7                	mov    %eax,%edi
  802b10:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  802b17:	00 00 00 
  802b1a:	ff d0                	callq  *%rax
  802b1c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b1f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b23:	78 24                	js     802b49 <read+0x58>
  802b25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b29:	8b 00                	mov    (%rax),%eax
  802b2b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b2f:	48 89 d6             	mov    %rdx,%rsi
  802b32:	89 c7                	mov    %eax,%edi
  802b34:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  802b3b:	00 00 00 
  802b3e:	ff d0                	callq  *%rax
  802b40:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b43:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b47:	79 05                	jns    802b4e <read+0x5d>
  802b49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b4c:	eb 76                	jmp    802bc4 <read+0xd3>
  802b4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b52:	8b 40 08             	mov    0x8(%rax),%eax
  802b55:	83 e0 03             	and    $0x3,%eax
  802b58:	83 f8 01             	cmp    $0x1,%eax
  802b5b:	75 3a                	jne    802b97 <read+0xa6>
  802b5d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802b64:	00 00 00 
  802b67:	48 8b 00             	mov    (%rax),%rax
  802b6a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b70:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b73:	89 c6                	mov    %eax,%esi
  802b75:	48 bf 57 51 80 00 00 	movabs $0x805157,%rdi
  802b7c:	00 00 00 
  802b7f:	b8 00 00 00 00       	mov    $0x0,%eax
  802b84:	48 b9 02 06 80 00 00 	movabs $0x800602,%rcx
  802b8b:	00 00 00 
  802b8e:	ff d1                	callq  *%rcx
  802b90:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b95:	eb 2d                	jmp    802bc4 <read+0xd3>
  802b97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b9b:	48 8b 40 10          	mov    0x10(%rax),%rax
  802b9f:	48 85 c0             	test   %rax,%rax
  802ba2:	75 07                	jne    802bab <read+0xba>
  802ba4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ba9:	eb 19                	jmp    802bc4 <read+0xd3>
  802bab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802baf:	48 8b 40 10          	mov    0x10(%rax),%rax
  802bb3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802bb7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802bbb:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802bbf:	48 89 cf             	mov    %rcx,%rdi
  802bc2:	ff d0                	callq  *%rax
  802bc4:	c9                   	leaveq 
  802bc5:	c3                   	retq   

0000000000802bc6 <readn>:
  802bc6:	55                   	push   %rbp
  802bc7:	48 89 e5             	mov    %rsp,%rbp
  802bca:	48 83 ec 30          	sub    $0x30,%rsp
  802bce:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802bd1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802bd5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802bd9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802be0:	eb 49                	jmp    802c2b <readn+0x65>
  802be2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802be5:	48 98                	cltq   
  802be7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802beb:	48 29 c2             	sub    %rax,%rdx
  802bee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bf1:	48 63 c8             	movslq %eax,%rcx
  802bf4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bf8:	48 01 c1             	add    %rax,%rcx
  802bfb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bfe:	48 89 ce             	mov    %rcx,%rsi
  802c01:	89 c7                	mov    %eax,%edi
  802c03:	48 b8 f1 2a 80 00 00 	movabs $0x802af1,%rax
  802c0a:	00 00 00 
  802c0d:	ff d0                	callq  *%rax
  802c0f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c12:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c16:	79 05                	jns    802c1d <readn+0x57>
  802c18:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c1b:	eb 1c                	jmp    802c39 <readn+0x73>
  802c1d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c21:	75 02                	jne    802c25 <readn+0x5f>
  802c23:	eb 11                	jmp    802c36 <readn+0x70>
  802c25:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c28:	01 45 fc             	add    %eax,-0x4(%rbp)
  802c2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c2e:	48 98                	cltq   
  802c30:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802c34:	72 ac                	jb     802be2 <readn+0x1c>
  802c36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c39:	c9                   	leaveq 
  802c3a:	c3                   	retq   

0000000000802c3b <write>:
  802c3b:	55                   	push   %rbp
  802c3c:	48 89 e5             	mov    %rsp,%rbp
  802c3f:	48 83 ec 40          	sub    $0x40,%rsp
  802c43:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c46:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802c4a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802c4e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c52:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c55:	48 89 d6             	mov    %rdx,%rsi
  802c58:	89 c7                	mov    %eax,%edi
  802c5a:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  802c61:	00 00 00 
  802c64:	ff d0                	callq  *%rax
  802c66:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c69:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c6d:	78 24                	js     802c93 <write+0x58>
  802c6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c73:	8b 00                	mov    (%rax),%eax
  802c75:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c79:	48 89 d6             	mov    %rdx,%rsi
  802c7c:	89 c7                	mov    %eax,%edi
  802c7e:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  802c85:	00 00 00 
  802c88:	ff d0                	callq  *%rax
  802c8a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c8d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c91:	79 05                	jns    802c98 <write+0x5d>
  802c93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c96:	eb 75                	jmp    802d0d <write+0xd2>
  802c98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c9c:	8b 40 08             	mov    0x8(%rax),%eax
  802c9f:	83 e0 03             	and    $0x3,%eax
  802ca2:	85 c0                	test   %eax,%eax
  802ca4:	75 3a                	jne    802ce0 <write+0xa5>
  802ca6:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802cad:	00 00 00 
  802cb0:	48 8b 00             	mov    (%rax),%rax
  802cb3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802cb9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802cbc:	89 c6                	mov    %eax,%esi
  802cbe:	48 bf 73 51 80 00 00 	movabs $0x805173,%rdi
  802cc5:	00 00 00 
  802cc8:	b8 00 00 00 00       	mov    $0x0,%eax
  802ccd:	48 b9 02 06 80 00 00 	movabs $0x800602,%rcx
  802cd4:	00 00 00 
  802cd7:	ff d1                	callq  *%rcx
  802cd9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802cde:	eb 2d                	jmp    802d0d <write+0xd2>
  802ce0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ce4:	48 8b 40 18          	mov    0x18(%rax),%rax
  802ce8:	48 85 c0             	test   %rax,%rax
  802ceb:	75 07                	jne    802cf4 <write+0xb9>
  802ced:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802cf2:	eb 19                	jmp    802d0d <write+0xd2>
  802cf4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cf8:	48 8b 40 18          	mov    0x18(%rax),%rax
  802cfc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802d00:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802d04:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802d08:	48 89 cf             	mov    %rcx,%rdi
  802d0b:	ff d0                	callq  *%rax
  802d0d:	c9                   	leaveq 
  802d0e:	c3                   	retq   

0000000000802d0f <seek>:
  802d0f:	55                   	push   %rbp
  802d10:	48 89 e5             	mov    %rsp,%rbp
  802d13:	48 83 ec 18          	sub    $0x18,%rsp
  802d17:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d1a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802d1d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d21:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d24:	48 89 d6             	mov    %rdx,%rsi
  802d27:	89 c7                	mov    %eax,%edi
  802d29:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  802d30:	00 00 00 
  802d33:	ff d0                	callq  *%rax
  802d35:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d38:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d3c:	79 05                	jns    802d43 <seek+0x34>
  802d3e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d41:	eb 0f                	jmp    802d52 <seek+0x43>
  802d43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d47:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802d4a:	89 50 04             	mov    %edx,0x4(%rax)
  802d4d:	b8 00 00 00 00       	mov    $0x0,%eax
  802d52:	c9                   	leaveq 
  802d53:	c3                   	retq   

0000000000802d54 <ftruncate>:
  802d54:	55                   	push   %rbp
  802d55:	48 89 e5             	mov    %rsp,%rbp
  802d58:	48 83 ec 30          	sub    $0x30,%rsp
  802d5c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d5f:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802d62:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d66:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d69:	48 89 d6             	mov    %rdx,%rsi
  802d6c:	89 c7                	mov    %eax,%edi
  802d6e:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  802d75:	00 00 00 
  802d78:	ff d0                	callq  *%rax
  802d7a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d7d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d81:	78 24                	js     802da7 <ftruncate+0x53>
  802d83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d87:	8b 00                	mov    (%rax),%eax
  802d89:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d8d:	48 89 d6             	mov    %rdx,%rsi
  802d90:	89 c7                	mov    %eax,%edi
  802d92:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  802d99:	00 00 00 
  802d9c:	ff d0                	callq  *%rax
  802d9e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802da1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802da5:	79 05                	jns    802dac <ftruncate+0x58>
  802da7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802daa:	eb 72                	jmp    802e1e <ftruncate+0xca>
  802dac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802db0:	8b 40 08             	mov    0x8(%rax),%eax
  802db3:	83 e0 03             	and    $0x3,%eax
  802db6:	85 c0                	test   %eax,%eax
  802db8:	75 3a                	jne    802df4 <ftruncate+0xa0>
  802dba:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802dc1:	00 00 00 
  802dc4:	48 8b 00             	mov    (%rax),%rax
  802dc7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802dcd:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802dd0:	89 c6                	mov    %eax,%esi
  802dd2:	48 bf 90 51 80 00 00 	movabs $0x805190,%rdi
  802dd9:	00 00 00 
  802ddc:	b8 00 00 00 00       	mov    $0x0,%eax
  802de1:	48 b9 02 06 80 00 00 	movabs $0x800602,%rcx
  802de8:	00 00 00 
  802deb:	ff d1                	callq  *%rcx
  802ded:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802df2:	eb 2a                	jmp    802e1e <ftruncate+0xca>
  802df4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802df8:	48 8b 40 30          	mov    0x30(%rax),%rax
  802dfc:	48 85 c0             	test   %rax,%rax
  802dff:	75 07                	jne    802e08 <ftruncate+0xb4>
  802e01:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e06:	eb 16                	jmp    802e1e <ftruncate+0xca>
  802e08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e0c:	48 8b 40 30          	mov    0x30(%rax),%rax
  802e10:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e14:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802e17:	89 ce                	mov    %ecx,%esi
  802e19:	48 89 d7             	mov    %rdx,%rdi
  802e1c:	ff d0                	callq  *%rax
  802e1e:	c9                   	leaveq 
  802e1f:	c3                   	retq   

0000000000802e20 <fstat>:
  802e20:	55                   	push   %rbp
  802e21:	48 89 e5             	mov    %rsp,%rbp
  802e24:	48 83 ec 30          	sub    $0x30,%rsp
  802e28:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e2b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e2f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e33:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e36:	48 89 d6             	mov    %rdx,%rsi
  802e39:	89 c7                	mov    %eax,%edi
  802e3b:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  802e42:	00 00 00 
  802e45:	ff d0                	callq  *%rax
  802e47:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e4a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e4e:	78 24                	js     802e74 <fstat+0x54>
  802e50:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e54:	8b 00                	mov    (%rax),%eax
  802e56:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e5a:	48 89 d6             	mov    %rdx,%rsi
  802e5d:	89 c7                	mov    %eax,%edi
  802e5f:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  802e66:	00 00 00 
  802e69:	ff d0                	callq  *%rax
  802e6b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e6e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e72:	79 05                	jns    802e79 <fstat+0x59>
  802e74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e77:	eb 5e                	jmp    802ed7 <fstat+0xb7>
  802e79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e7d:	48 8b 40 28          	mov    0x28(%rax),%rax
  802e81:	48 85 c0             	test   %rax,%rax
  802e84:	75 07                	jne    802e8d <fstat+0x6d>
  802e86:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e8b:	eb 4a                	jmp    802ed7 <fstat+0xb7>
  802e8d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e91:	c6 00 00             	movb   $0x0,(%rax)
  802e94:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e98:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802e9f:	00 00 00 
  802ea2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ea6:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802ead:	00 00 00 
  802eb0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802eb4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802eb8:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802ebf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ec3:	48 8b 40 28          	mov    0x28(%rax),%rax
  802ec7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ecb:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802ecf:	48 89 ce             	mov    %rcx,%rsi
  802ed2:	48 89 d7             	mov    %rdx,%rdi
  802ed5:	ff d0                	callq  *%rax
  802ed7:	c9                   	leaveq 
  802ed8:	c3                   	retq   

0000000000802ed9 <stat>:
  802ed9:	55                   	push   %rbp
  802eda:	48 89 e5             	mov    %rsp,%rbp
  802edd:	48 83 ec 20          	sub    $0x20,%rsp
  802ee1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ee5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ee9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eed:	be 00 00 00 00       	mov    $0x0,%esi
  802ef2:	48 89 c7             	mov    %rax,%rdi
  802ef5:	48 b8 c7 2f 80 00 00 	movabs $0x802fc7,%rax
  802efc:	00 00 00 
  802eff:	ff d0                	callq  *%rax
  802f01:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f04:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f08:	79 05                	jns    802f0f <stat+0x36>
  802f0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f0d:	eb 2f                	jmp    802f3e <stat+0x65>
  802f0f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802f13:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f16:	48 89 d6             	mov    %rdx,%rsi
  802f19:	89 c7                	mov    %eax,%edi
  802f1b:	48 b8 20 2e 80 00 00 	movabs $0x802e20,%rax
  802f22:	00 00 00 
  802f25:	ff d0                	callq  *%rax
  802f27:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802f2a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f2d:	89 c7                	mov    %eax,%edi
  802f2f:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  802f36:	00 00 00 
  802f39:	ff d0                	callq  *%rax
  802f3b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f3e:	c9                   	leaveq 
  802f3f:	c3                   	retq   

0000000000802f40 <fsipc>:
  802f40:	55                   	push   %rbp
  802f41:	48 89 e5             	mov    %rsp,%rbp
  802f44:	48 83 ec 10          	sub    $0x10,%rsp
  802f48:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802f4b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802f4f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f56:	00 00 00 
  802f59:	8b 00                	mov    (%rax),%eax
  802f5b:	85 c0                	test   %eax,%eax
  802f5d:	75 1d                	jne    802f7c <fsipc+0x3c>
  802f5f:	bf 01 00 00 00       	mov    $0x1,%edi
  802f64:	48 b8 0b 49 80 00 00 	movabs $0x80490b,%rax
  802f6b:	00 00 00 
  802f6e:	ff d0                	callq  *%rax
  802f70:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802f77:	00 00 00 
  802f7a:	89 02                	mov    %eax,(%rdx)
  802f7c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f83:	00 00 00 
  802f86:	8b 00                	mov    (%rax),%eax
  802f88:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802f8b:	b9 07 00 00 00       	mov    $0x7,%ecx
  802f90:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802f97:	00 00 00 
  802f9a:	89 c7                	mov    %eax,%edi
  802f9c:	48 b8 75 48 80 00 00 	movabs $0x804875,%rax
  802fa3:	00 00 00 
  802fa6:	ff d0                	callq  *%rax
  802fa8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fac:	ba 00 00 00 00       	mov    $0x0,%edx
  802fb1:	48 89 c6             	mov    %rax,%rsi
  802fb4:	bf 00 00 00 00       	mov    $0x0,%edi
  802fb9:	48 b8 b4 47 80 00 00 	movabs $0x8047b4,%rax
  802fc0:	00 00 00 
  802fc3:	ff d0                	callq  *%rax
  802fc5:	c9                   	leaveq 
  802fc6:	c3                   	retq   

0000000000802fc7 <open>:
  802fc7:	55                   	push   %rbp
  802fc8:	48 89 e5             	mov    %rsp,%rbp
  802fcb:	48 83 ec 20          	sub    $0x20,%rsp
  802fcf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fd3:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802fd6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fda:	48 89 c7             	mov    %rax,%rdi
  802fdd:	48 b8 4b 11 80 00 00 	movabs $0x80114b,%rax
  802fe4:	00 00 00 
  802fe7:	ff d0                	callq  *%rax
  802fe9:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802fee:	7e 0a                	jle    802ffa <open+0x33>
  802ff0:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802ff5:	e9 a5 00 00 00       	jmpq   80309f <open+0xd8>
  802ffa:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802ffe:	48 89 c7             	mov    %rax,%rdi
  803001:	48 b8 27 26 80 00 00 	movabs $0x802627,%rax
  803008:	00 00 00 
  80300b:	ff d0                	callq  *%rax
  80300d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803010:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803014:	79 08                	jns    80301e <open+0x57>
  803016:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803019:	e9 81 00 00 00       	jmpq   80309f <open+0xd8>
  80301e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803022:	48 89 c6             	mov    %rax,%rsi
  803025:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  80302c:	00 00 00 
  80302f:	48 b8 b7 11 80 00 00 	movabs $0x8011b7,%rax
  803036:	00 00 00 
  803039:	ff d0                	callq  *%rax
  80303b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803042:	00 00 00 
  803045:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803048:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80304e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803052:	48 89 c6             	mov    %rax,%rsi
  803055:	bf 01 00 00 00       	mov    $0x1,%edi
  80305a:	48 b8 40 2f 80 00 00 	movabs $0x802f40,%rax
  803061:	00 00 00 
  803064:	ff d0                	callq  *%rax
  803066:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803069:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80306d:	79 1d                	jns    80308c <open+0xc5>
  80306f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803073:	be 00 00 00 00       	mov    $0x0,%esi
  803078:	48 89 c7             	mov    %rax,%rdi
  80307b:	48 b8 4f 27 80 00 00 	movabs $0x80274f,%rax
  803082:	00 00 00 
  803085:	ff d0                	callq  *%rax
  803087:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80308a:	eb 13                	jmp    80309f <open+0xd8>
  80308c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803090:	48 89 c7             	mov    %rax,%rdi
  803093:	48 b8 d9 25 80 00 00 	movabs $0x8025d9,%rax
  80309a:	00 00 00 
  80309d:	ff d0                	callq  *%rax
  80309f:	c9                   	leaveq 
  8030a0:	c3                   	retq   

00000000008030a1 <devfile_flush>:
  8030a1:	55                   	push   %rbp
  8030a2:	48 89 e5             	mov    %rsp,%rbp
  8030a5:	48 83 ec 10          	sub    $0x10,%rsp
  8030a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030b1:	8b 50 0c             	mov    0xc(%rax),%edx
  8030b4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030bb:	00 00 00 
  8030be:	89 10                	mov    %edx,(%rax)
  8030c0:	be 00 00 00 00       	mov    $0x0,%esi
  8030c5:	bf 06 00 00 00       	mov    $0x6,%edi
  8030ca:	48 b8 40 2f 80 00 00 	movabs $0x802f40,%rax
  8030d1:	00 00 00 
  8030d4:	ff d0                	callq  *%rax
  8030d6:	c9                   	leaveq 
  8030d7:	c3                   	retq   

00000000008030d8 <devfile_read>:
  8030d8:	55                   	push   %rbp
  8030d9:	48 89 e5             	mov    %rsp,%rbp
  8030dc:	48 83 ec 30          	sub    $0x30,%rsp
  8030e0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030e4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030e8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8030ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030f0:	8b 50 0c             	mov    0xc(%rax),%edx
  8030f3:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030fa:	00 00 00 
  8030fd:	89 10                	mov    %edx,(%rax)
  8030ff:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803106:	00 00 00 
  803109:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80310d:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803111:	be 00 00 00 00       	mov    $0x0,%esi
  803116:	bf 03 00 00 00       	mov    $0x3,%edi
  80311b:	48 b8 40 2f 80 00 00 	movabs $0x802f40,%rax
  803122:	00 00 00 
  803125:	ff d0                	callq  *%rax
  803127:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80312a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80312e:	79 08                	jns    803138 <devfile_read+0x60>
  803130:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803133:	e9 a4 00 00 00       	jmpq   8031dc <devfile_read+0x104>
  803138:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80313b:	48 98                	cltq   
  80313d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803141:	76 35                	jbe    803178 <devfile_read+0xa0>
  803143:	48 b9 b6 51 80 00 00 	movabs $0x8051b6,%rcx
  80314a:	00 00 00 
  80314d:	48 ba bd 51 80 00 00 	movabs $0x8051bd,%rdx
  803154:	00 00 00 
  803157:	be 89 00 00 00       	mov    $0x89,%esi
  80315c:	48 bf d2 51 80 00 00 	movabs $0x8051d2,%rdi
  803163:	00 00 00 
  803166:	b8 00 00 00 00       	mov    $0x0,%eax
  80316b:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  803172:	00 00 00 
  803175:	41 ff d0             	callq  *%r8
  803178:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80317f:	7e 35                	jle    8031b6 <devfile_read+0xde>
  803181:	48 b9 e0 51 80 00 00 	movabs $0x8051e0,%rcx
  803188:	00 00 00 
  80318b:	48 ba bd 51 80 00 00 	movabs $0x8051bd,%rdx
  803192:	00 00 00 
  803195:	be 8a 00 00 00       	mov    $0x8a,%esi
  80319a:	48 bf d2 51 80 00 00 	movabs $0x8051d2,%rdi
  8031a1:	00 00 00 
  8031a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8031a9:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8031b0:	00 00 00 
  8031b3:	41 ff d0             	callq  *%r8
  8031b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031b9:	48 63 d0             	movslq %eax,%rdx
  8031bc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031c0:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8031c7:	00 00 00 
  8031ca:	48 89 c7             	mov    %rax,%rdi
  8031cd:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  8031d4:	00 00 00 
  8031d7:	ff d0                	callq  *%rax
  8031d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031dc:	c9                   	leaveq 
  8031dd:	c3                   	retq   

00000000008031de <devfile_write>:
  8031de:	55                   	push   %rbp
  8031df:	48 89 e5             	mov    %rsp,%rbp
  8031e2:	48 83 ec 40          	sub    $0x40,%rsp
  8031e6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8031ea:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8031ee:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8031f2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8031f6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8031fa:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803201:	00 
  803202:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803206:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80320a:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80320f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803213:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803217:	8b 50 0c             	mov    0xc(%rax),%edx
  80321a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803221:	00 00 00 
  803224:	89 10                	mov    %edx,(%rax)
  803226:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80322d:	00 00 00 
  803230:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803234:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803238:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80323c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803240:	48 89 c6             	mov    %rax,%rsi
  803243:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  80324a:	00 00 00 
  80324d:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  803254:	00 00 00 
  803257:	ff d0                	callq  *%rax
  803259:	be 00 00 00 00       	mov    $0x0,%esi
  80325e:	bf 04 00 00 00       	mov    $0x4,%edi
  803263:	48 b8 40 2f 80 00 00 	movabs $0x802f40,%rax
  80326a:	00 00 00 
  80326d:	ff d0                	callq  *%rax
  80326f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803272:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803276:	79 05                	jns    80327d <devfile_write+0x9f>
  803278:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80327b:	eb 43                	jmp    8032c0 <devfile_write+0xe2>
  80327d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803280:	48 98                	cltq   
  803282:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803286:	76 35                	jbe    8032bd <devfile_write+0xdf>
  803288:	48 b9 b6 51 80 00 00 	movabs $0x8051b6,%rcx
  80328f:	00 00 00 
  803292:	48 ba bd 51 80 00 00 	movabs $0x8051bd,%rdx
  803299:	00 00 00 
  80329c:	be a8 00 00 00       	mov    $0xa8,%esi
  8032a1:	48 bf d2 51 80 00 00 	movabs $0x8051d2,%rdi
  8032a8:	00 00 00 
  8032ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8032b0:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8032b7:	00 00 00 
  8032ba:	41 ff d0             	callq  *%r8
  8032bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032c0:	c9                   	leaveq 
  8032c1:	c3                   	retq   

00000000008032c2 <devfile_stat>:
  8032c2:	55                   	push   %rbp
  8032c3:	48 89 e5             	mov    %rsp,%rbp
  8032c6:	48 83 ec 20          	sub    $0x20,%rsp
  8032ca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8032ce:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032d6:	8b 50 0c             	mov    0xc(%rax),%edx
  8032d9:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032e0:	00 00 00 
  8032e3:	89 10                	mov    %edx,(%rax)
  8032e5:	be 00 00 00 00       	mov    $0x0,%esi
  8032ea:	bf 05 00 00 00       	mov    $0x5,%edi
  8032ef:	48 b8 40 2f 80 00 00 	movabs $0x802f40,%rax
  8032f6:	00 00 00 
  8032f9:	ff d0                	callq  *%rax
  8032fb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032fe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803302:	79 05                	jns    803309 <devfile_stat+0x47>
  803304:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803307:	eb 56                	jmp    80335f <devfile_stat+0x9d>
  803309:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80330d:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803314:	00 00 00 
  803317:	48 89 c7             	mov    %rax,%rdi
  80331a:	48 b8 b7 11 80 00 00 	movabs $0x8011b7,%rax
  803321:	00 00 00 
  803324:	ff d0                	callq  *%rax
  803326:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80332d:	00 00 00 
  803330:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803336:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80333a:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803340:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803347:	00 00 00 
  80334a:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803350:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803354:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  80335a:	b8 00 00 00 00       	mov    $0x0,%eax
  80335f:	c9                   	leaveq 
  803360:	c3                   	retq   

0000000000803361 <devfile_trunc>:
  803361:	55                   	push   %rbp
  803362:	48 89 e5             	mov    %rsp,%rbp
  803365:	48 83 ec 10          	sub    $0x10,%rsp
  803369:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80336d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803370:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803374:	8b 50 0c             	mov    0xc(%rax),%edx
  803377:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80337e:	00 00 00 
  803381:	89 10                	mov    %edx,(%rax)
  803383:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80338a:	00 00 00 
  80338d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803390:	89 50 04             	mov    %edx,0x4(%rax)
  803393:	be 00 00 00 00       	mov    $0x0,%esi
  803398:	bf 02 00 00 00       	mov    $0x2,%edi
  80339d:	48 b8 40 2f 80 00 00 	movabs $0x802f40,%rax
  8033a4:	00 00 00 
  8033a7:	ff d0                	callq  *%rax
  8033a9:	c9                   	leaveq 
  8033aa:	c3                   	retq   

00000000008033ab <remove>:
  8033ab:	55                   	push   %rbp
  8033ac:	48 89 e5             	mov    %rsp,%rbp
  8033af:	48 83 ec 10          	sub    $0x10,%rsp
  8033b3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8033b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033bb:	48 89 c7             	mov    %rax,%rdi
  8033be:	48 b8 4b 11 80 00 00 	movabs $0x80114b,%rax
  8033c5:	00 00 00 
  8033c8:	ff d0                	callq  *%rax
  8033ca:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8033cf:	7e 07                	jle    8033d8 <remove+0x2d>
  8033d1:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8033d6:	eb 33                	jmp    80340b <remove+0x60>
  8033d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033dc:	48 89 c6             	mov    %rax,%rsi
  8033df:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8033e6:	00 00 00 
  8033e9:	48 b8 b7 11 80 00 00 	movabs $0x8011b7,%rax
  8033f0:	00 00 00 
  8033f3:	ff d0                	callq  *%rax
  8033f5:	be 00 00 00 00       	mov    $0x0,%esi
  8033fa:	bf 07 00 00 00       	mov    $0x7,%edi
  8033ff:	48 b8 40 2f 80 00 00 	movabs $0x802f40,%rax
  803406:	00 00 00 
  803409:	ff d0                	callq  *%rax
  80340b:	c9                   	leaveq 
  80340c:	c3                   	retq   

000000000080340d <sync>:
  80340d:	55                   	push   %rbp
  80340e:	48 89 e5             	mov    %rsp,%rbp
  803411:	be 00 00 00 00       	mov    $0x0,%esi
  803416:	bf 08 00 00 00       	mov    $0x8,%edi
  80341b:	48 b8 40 2f 80 00 00 	movabs $0x802f40,%rax
  803422:	00 00 00 
  803425:	ff d0                	callq  *%rax
  803427:	5d                   	pop    %rbp
  803428:	c3                   	retq   

0000000000803429 <copy>:
  803429:	55                   	push   %rbp
  80342a:	48 89 e5             	mov    %rsp,%rbp
  80342d:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803434:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  80343b:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803442:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803449:	be 00 00 00 00       	mov    $0x0,%esi
  80344e:	48 89 c7             	mov    %rax,%rdi
  803451:	48 b8 c7 2f 80 00 00 	movabs $0x802fc7,%rax
  803458:	00 00 00 
  80345b:	ff d0                	callq  *%rax
  80345d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803460:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803464:	79 28                	jns    80348e <copy+0x65>
  803466:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803469:	89 c6                	mov    %eax,%esi
  80346b:	48 bf ec 51 80 00 00 	movabs $0x8051ec,%rdi
  803472:	00 00 00 
  803475:	b8 00 00 00 00       	mov    $0x0,%eax
  80347a:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  803481:	00 00 00 
  803484:	ff d2                	callq  *%rdx
  803486:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803489:	e9 74 01 00 00       	jmpq   803602 <copy+0x1d9>
  80348e:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803495:	be 01 01 00 00       	mov    $0x101,%esi
  80349a:	48 89 c7             	mov    %rax,%rdi
  80349d:	48 b8 c7 2f 80 00 00 	movabs $0x802fc7,%rax
  8034a4:	00 00 00 
  8034a7:	ff d0                	callq  *%rax
  8034a9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8034ac:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8034b0:	79 39                	jns    8034eb <copy+0xc2>
  8034b2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034b5:	89 c6                	mov    %eax,%esi
  8034b7:	48 bf 02 52 80 00 00 	movabs $0x805202,%rdi
  8034be:	00 00 00 
  8034c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8034c6:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  8034cd:	00 00 00 
  8034d0:	ff d2                	callq  *%rdx
  8034d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d5:	89 c7                	mov    %eax,%edi
  8034d7:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  8034de:	00 00 00 
  8034e1:	ff d0                	callq  *%rax
  8034e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034e6:	e9 17 01 00 00       	jmpq   803602 <copy+0x1d9>
  8034eb:	eb 74                	jmp    803561 <copy+0x138>
  8034ed:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8034f0:	48 63 d0             	movslq %eax,%rdx
  8034f3:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8034fa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034fd:	48 89 ce             	mov    %rcx,%rsi
  803500:	89 c7                	mov    %eax,%edi
  803502:	48 b8 3b 2c 80 00 00 	movabs $0x802c3b,%rax
  803509:	00 00 00 
  80350c:	ff d0                	callq  *%rax
  80350e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803511:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803515:	79 4a                	jns    803561 <copy+0x138>
  803517:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80351a:	89 c6                	mov    %eax,%esi
  80351c:	48 bf 1c 52 80 00 00 	movabs $0x80521c,%rdi
  803523:	00 00 00 
  803526:	b8 00 00 00 00       	mov    $0x0,%eax
  80352b:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  803532:	00 00 00 
  803535:	ff d2                	callq  *%rdx
  803537:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80353a:	89 c7                	mov    %eax,%edi
  80353c:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  803543:	00 00 00 
  803546:	ff d0                	callq  *%rax
  803548:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80354b:	89 c7                	mov    %eax,%edi
  80354d:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  803554:	00 00 00 
  803557:	ff d0                	callq  *%rax
  803559:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80355c:	e9 a1 00 00 00       	jmpq   803602 <copy+0x1d9>
  803561:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803568:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80356b:	ba 00 02 00 00       	mov    $0x200,%edx
  803570:	48 89 ce             	mov    %rcx,%rsi
  803573:	89 c7                	mov    %eax,%edi
  803575:	48 b8 f1 2a 80 00 00 	movabs $0x802af1,%rax
  80357c:	00 00 00 
  80357f:	ff d0                	callq  *%rax
  803581:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803584:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803588:	0f 8f 5f ff ff ff    	jg     8034ed <copy+0xc4>
  80358e:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803592:	79 47                	jns    8035db <copy+0x1b2>
  803594:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803597:	89 c6                	mov    %eax,%esi
  803599:	48 bf 2f 52 80 00 00 	movabs $0x80522f,%rdi
  8035a0:	00 00 00 
  8035a3:	b8 00 00 00 00       	mov    $0x0,%eax
  8035a8:	48 ba 02 06 80 00 00 	movabs $0x800602,%rdx
  8035af:	00 00 00 
  8035b2:	ff d2                	callq  *%rdx
  8035b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035b7:	89 c7                	mov    %eax,%edi
  8035b9:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  8035c0:	00 00 00 
  8035c3:	ff d0                	callq  *%rax
  8035c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035c8:	89 c7                	mov    %eax,%edi
  8035ca:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  8035d1:	00 00 00 
  8035d4:	ff d0                	callq  *%rax
  8035d6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8035d9:	eb 27                	jmp    803602 <copy+0x1d9>
  8035db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035de:	89 c7                	mov    %eax,%edi
  8035e0:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  8035e7:	00 00 00 
  8035ea:	ff d0                	callq  *%rax
  8035ec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035ef:	89 c7                	mov    %eax,%edi
  8035f1:	48 b8 cf 28 80 00 00 	movabs $0x8028cf,%rax
  8035f8:	00 00 00 
  8035fb:	ff d0                	callq  *%rax
  8035fd:	b8 00 00 00 00       	mov    $0x0,%eax
  803602:	c9                   	leaveq 
  803603:	c3                   	retq   

0000000000803604 <fd2sockid>:
  803604:	55                   	push   %rbp
  803605:	48 89 e5             	mov    %rsp,%rbp
  803608:	48 83 ec 20          	sub    $0x20,%rsp
  80360c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80360f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803613:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803616:	48 89 d6             	mov    %rdx,%rsi
  803619:	89 c7                	mov    %eax,%edi
  80361b:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  803622:	00 00 00 
  803625:	ff d0                	callq  *%rax
  803627:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80362a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80362e:	79 05                	jns    803635 <fd2sockid+0x31>
  803630:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803633:	eb 24                	jmp    803659 <fd2sockid+0x55>
  803635:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803639:	8b 10                	mov    (%rax),%edx
  80363b:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803642:	00 00 00 
  803645:	8b 00                	mov    (%rax),%eax
  803647:	39 c2                	cmp    %eax,%edx
  803649:	74 07                	je     803652 <fd2sockid+0x4e>
  80364b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803650:	eb 07                	jmp    803659 <fd2sockid+0x55>
  803652:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803656:	8b 40 0c             	mov    0xc(%rax),%eax
  803659:	c9                   	leaveq 
  80365a:	c3                   	retq   

000000000080365b <alloc_sockfd>:
  80365b:	55                   	push   %rbp
  80365c:	48 89 e5             	mov    %rsp,%rbp
  80365f:	48 83 ec 20          	sub    $0x20,%rsp
  803663:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803666:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80366a:	48 89 c7             	mov    %rax,%rdi
  80366d:	48 b8 27 26 80 00 00 	movabs $0x802627,%rax
  803674:	00 00 00 
  803677:	ff d0                	callq  *%rax
  803679:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80367c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803680:	78 26                	js     8036a8 <alloc_sockfd+0x4d>
  803682:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803686:	ba 07 04 00 00       	mov    $0x407,%edx
  80368b:	48 89 c6             	mov    %rax,%rsi
  80368e:	bf 00 00 00 00       	mov    $0x0,%edi
  803693:	48 b8 e6 1a 80 00 00 	movabs $0x801ae6,%rax
  80369a:	00 00 00 
  80369d:	ff d0                	callq  *%rax
  80369f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036a2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036a6:	79 16                	jns    8036be <alloc_sockfd+0x63>
  8036a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036ab:	89 c7                	mov    %eax,%edi
  8036ad:	48 b8 68 3b 80 00 00 	movabs $0x803b68,%rax
  8036b4:	00 00 00 
  8036b7:	ff d0                	callq  *%rax
  8036b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036bc:	eb 3a                	jmp    8036f8 <alloc_sockfd+0x9d>
  8036be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036c2:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8036c9:	00 00 00 
  8036cc:	8b 12                	mov    (%rdx),%edx
  8036ce:	89 10                	mov    %edx,(%rax)
  8036d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036d4:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8036db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036df:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8036e2:	89 50 0c             	mov    %edx,0xc(%rax)
  8036e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036e9:	48 89 c7             	mov    %rax,%rdi
  8036ec:	48 b8 d9 25 80 00 00 	movabs $0x8025d9,%rax
  8036f3:	00 00 00 
  8036f6:	ff d0                	callq  *%rax
  8036f8:	c9                   	leaveq 
  8036f9:	c3                   	retq   

00000000008036fa <accept>:
  8036fa:	55                   	push   %rbp
  8036fb:	48 89 e5             	mov    %rsp,%rbp
  8036fe:	48 83 ec 30          	sub    $0x30,%rsp
  803702:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803705:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803709:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80370d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803710:	89 c7                	mov    %eax,%edi
  803712:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  803719:	00 00 00 
  80371c:	ff d0                	callq  *%rax
  80371e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803721:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803725:	79 05                	jns    80372c <accept+0x32>
  803727:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80372a:	eb 3b                	jmp    803767 <accept+0x6d>
  80372c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803730:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803734:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803737:	48 89 ce             	mov    %rcx,%rsi
  80373a:	89 c7                	mov    %eax,%edi
  80373c:	48 b8 45 3a 80 00 00 	movabs $0x803a45,%rax
  803743:	00 00 00 
  803746:	ff d0                	callq  *%rax
  803748:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80374b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80374f:	79 05                	jns    803756 <accept+0x5c>
  803751:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803754:	eb 11                	jmp    803767 <accept+0x6d>
  803756:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803759:	89 c7                	mov    %eax,%edi
  80375b:	48 b8 5b 36 80 00 00 	movabs $0x80365b,%rax
  803762:	00 00 00 
  803765:	ff d0                	callq  *%rax
  803767:	c9                   	leaveq 
  803768:	c3                   	retq   

0000000000803769 <bind>:
  803769:	55                   	push   %rbp
  80376a:	48 89 e5             	mov    %rsp,%rbp
  80376d:	48 83 ec 20          	sub    $0x20,%rsp
  803771:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803774:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803778:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80377b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80377e:	89 c7                	mov    %eax,%edi
  803780:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  803787:	00 00 00 
  80378a:	ff d0                	callq  *%rax
  80378c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80378f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803793:	79 05                	jns    80379a <bind+0x31>
  803795:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803798:	eb 1b                	jmp    8037b5 <bind+0x4c>
  80379a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80379d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8037a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037a4:	48 89 ce             	mov    %rcx,%rsi
  8037a7:	89 c7                	mov    %eax,%edi
  8037a9:	48 b8 c4 3a 80 00 00 	movabs $0x803ac4,%rax
  8037b0:	00 00 00 
  8037b3:	ff d0                	callq  *%rax
  8037b5:	c9                   	leaveq 
  8037b6:	c3                   	retq   

00000000008037b7 <shutdown>:
  8037b7:	55                   	push   %rbp
  8037b8:	48 89 e5             	mov    %rsp,%rbp
  8037bb:	48 83 ec 20          	sub    $0x20,%rsp
  8037bf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037c2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8037c5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037c8:	89 c7                	mov    %eax,%edi
  8037ca:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  8037d1:	00 00 00 
  8037d4:	ff d0                	callq  *%rax
  8037d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037dd:	79 05                	jns    8037e4 <shutdown+0x2d>
  8037df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037e2:	eb 16                	jmp    8037fa <shutdown+0x43>
  8037e4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8037e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037ea:	89 d6                	mov    %edx,%esi
  8037ec:	89 c7                	mov    %eax,%edi
  8037ee:	48 b8 28 3b 80 00 00 	movabs $0x803b28,%rax
  8037f5:	00 00 00 
  8037f8:	ff d0                	callq  *%rax
  8037fa:	c9                   	leaveq 
  8037fb:	c3                   	retq   

00000000008037fc <devsock_close>:
  8037fc:	55                   	push   %rbp
  8037fd:	48 89 e5             	mov    %rsp,%rbp
  803800:	48 83 ec 10          	sub    $0x10,%rsp
  803804:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803808:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80380c:	48 89 c7             	mov    %rax,%rdi
  80380f:	48 b8 7d 49 80 00 00 	movabs $0x80497d,%rax
  803816:	00 00 00 
  803819:	ff d0                	callq  *%rax
  80381b:	83 f8 01             	cmp    $0x1,%eax
  80381e:	75 17                	jne    803837 <devsock_close+0x3b>
  803820:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803824:	8b 40 0c             	mov    0xc(%rax),%eax
  803827:	89 c7                	mov    %eax,%edi
  803829:	48 b8 68 3b 80 00 00 	movabs $0x803b68,%rax
  803830:	00 00 00 
  803833:	ff d0                	callq  *%rax
  803835:	eb 05                	jmp    80383c <devsock_close+0x40>
  803837:	b8 00 00 00 00       	mov    $0x0,%eax
  80383c:	c9                   	leaveq 
  80383d:	c3                   	retq   

000000000080383e <connect>:
  80383e:	55                   	push   %rbp
  80383f:	48 89 e5             	mov    %rsp,%rbp
  803842:	48 83 ec 20          	sub    $0x20,%rsp
  803846:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803849:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80384d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803850:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803853:	89 c7                	mov    %eax,%edi
  803855:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  80385c:	00 00 00 
  80385f:	ff d0                	callq  *%rax
  803861:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803864:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803868:	79 05                	jns    80386f <connect+0x31>
  80386a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80386d:	eb 1b                	jmp    80388a <connect+0x4c>
  80386f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803872:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803876:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803879:	48 89 ce             	mov    %rcx,%rsi
  80387c:	89 c7                	mov    %eax,%edi
  80387e:	48 b8 95 3b 80 00 00 	movabs $0x803b95,%rax
  803885:	00 00 00 
  803888:	ff d0                	callq  *%rax
  80388a:	c9                   	leaveq 
  80388b:	c3                   	retq   

000000000080388c <listen>:
  80388c:	55                   	push   %rbp
  80388d:	48 89 e5             	mov    %rsp,%rbp
  803890:	48 83 ec 20          	sub    $0x20,%rsp
  803894:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803897:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80389a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80389d:	89 c7                	mov    %eax,%edi
  80389f:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  8038a6:	00 00 00 
  8038a9:	ff d0                	callq  *%rax
  8038ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038ae:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038b2:	79 05                	jns    8038b9 <listen+0x2d>
  8038b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038b7:	eb 16                	jmp    8038cf <listen+0x43>
  8038b9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038bf:	89 d6                	mov    %edx,%esi
  8038c1:	89 c7                	mov    %eax,%edi
  8038c3:	48 b8 f9 3b 80 00 00 	movabs $0x803bf9,%rax
  8038ca:	00 00 00 
  8038cd:	ff d0                	callq  *%rax
  8038cf:	c9                   	leaveq 
  8038d0:	c3                   	retq   

00000000008038d1 <devsock_read>:
  8038d1:	55                   	push   %rbp
  8038d2:	48 89 e5             	mov    %rsp,%rbp
  8038d5:	48 83 ec 20          	sub    $0x20,%rsp
  8038d9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038dd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038e1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8038e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038e9:	89 c2                	mov    %eax,%edx
  8038eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038ef:	8b 40 0c             	mov    0xc(%rax),%eax
  8038f2:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8038f6:	b9 00 00 00 00       	mov    $0x0,%ecx
  8038fb:	89 c7                	mov    %eax,%edi
  8038fd:	48 b8 39 3c 80 00 00 	movabs $0x803c39,%rax
  803904:	00 00 00 
  803907:	ff d0                	callq  *%rax
  803909:	c9                   	leaveq 
  80390a:	c3                   	retq   

000000000080390b <devsock_write>:
  80390b:	55                   	push   %rbp
  80390c:	48 89 e5             	mov    %rsp,%rbp
  80390f:	48 83 ec 20          	sub    $0x20,%rsp
  803913:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803917:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80391b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80391f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803923:	89 c2                	mov    %eax,%edx
  803925:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803929:	8b 40 0c             	mov    0xc(%rax),%eax
  80392c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803930:	b9 00 00 00 00       	mov    $0x0,%ecx
  803935:	89 c7                	mov    %eax,%edi
  803937:	48 b8 05 3d 80 00 00 	movabs $0x803d05,%rax
  80393e:	00 00 00 
  803941:	ff d0                	callq  *%rax
  803943:	c9                   	leaveq 
  803944:	c3                   	retq   

0000000000803945 <devsock_stat>:
  803945:	55                   	push   %rbp
  803946:	48 89 e5             	mov    %rsp,%rbp
  803949:	48 83 ec 10          	sub    $0x10,%rsp
  80394d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803951:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803955:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803959:	48 be 4a 52 80 00 00 	movabs $0x80524a,%rsi
  803960:	00 00 00 
  803963:	48 89 c7             	mov    %rax,%rdi
  803966:	48 b8 b7 11 80 00 00 	movabs $0x8011b7,%rax
  80396d:	00 00 00 
  803970:	ff d0                	callq  *%rax
  803972:	b8 00 00 00 00       	mov    $0x0,%eax
  803977:	c9                   	leaveq 
  803978:	c3                   	retq   

0000000000803979 <socket>:
  803979:	55                   	push   %rbp
  80397a:	48 89 e5             	mov    %rsp,%rbp
  80397d:	48 83 ec 20          	sub    $0x20,%rsp
  803981:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803984:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803987:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80398a:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80398d:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803990:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803993:	89 ce                	mov    %ecx,%esi
  803995:	89 c7                	mov    %eax,%edi
  803997:	48 b8 bd 3d 80 00 00 	movabs $0x803dbd,%rax
  80399e:	00 00 00 
  8039a1:	ff d0                	callq  *%rax
  8039a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039a6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039aa:	79 05                	jns    8039b1 <socket+0x38>
  8039ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039af:	eb 11                	jmp    8039c2 <socket+0x49>
  8039b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039b4:	89 c7                	mov    %eax,%edi
  8039b6:	48 b8 5b 36 80 00 00 	movabs $0x80365b,%rax
  8039bd:	00 00 00 
  8039c0:	ff d0                	callq  *%rax
  8039c2:	c9                   	leaveq 
  8039c3:	c3                   	retq   

00000000008039c4 <nsipc>:
  8039c4:	55                   	push   %rbp
  8039c5:	48 89 e5             	mov    %rsp,%rbp
  8039c8:	48 83 ec 10          	sub    $0x10,%rsp
  8039cc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039cf:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8039d6:	00 00 00 
  8039d9:	8b 00                	mov    (%rax),%eax
  8039db:	85 c0                	test   %eax,%eax
  8039dd:	75 1d                	jne    8039fc <nsipc+0x38>
  8039df:	bf 02 00 00 00       	mov    $0x2,%edi
  8039e4:	48 b8 0b 49 80 00 00 	movabs $0x80490b,%rax
  8039eb:	00 00 00 
  8039ee:	ff d0                	callq  *%rax
  8039f0:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  8039f7:	00 00 00 
  8039fa:	89 02                	mov    %eax,(%rdx)
  8039fc:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803a03:	00 00 00 
  803a06:	8b 00                	mov    (%rax),%eax
  803a08:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803a0b:	b9 07 00 00 00       	mov    $0x7,%ecx
  803a10:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803a17:	00 00 00 
  803a1a:	89 c7                	mov    %eax,%edi
  803a1c:	48 b8 75 48 80 00 00 	movabs $0x804875,%rax
  803a23:	00 00 00 
  803a26:	ff d0                	callq  *%rax
  803a28:	ba 00 00 00 00       	mov    $0x0,%edx
  803a2d:	be 00 00 00 00       	mov    $0x0,%esi
  803a32:	bf 00 00 00 00       	mov    $0x0,%edi
  803a37:	48 b8 b4 47 80 00 00 	movabs $0x8047b4,%rax
  803a3e:	00 00 00 
  803a41:	ff d0                	callq  *%rax
  803a43:	c9                   	leaveq 
  803a44:	c3                   	retq   

0000000000803a45 <nsipc_accept>:
  803a45:	55                   	push   %rbp
  803a46:	48 89 e5             	mov    %rsp,%rbp
  803a49:	48 83 ec 30          	sub    $0x30,%rsp
  803a4d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a50:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a54:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a58:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a5f:	00 00 00 
  803a62:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803a65:	89 10                	mov    %edx,(%rax)
  803a67:	bf 01 00 00 00       	mov    $0x1,%edi
  803a6c:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803a73:	00 00 00 
  803a76:	ff d0                	callq  *%rax
  803a78:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a7b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a7f:	78 3e                	js     803abf <nsipc_accept+0x7a>
  803a81:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a88:	00 00 00 
  803a8b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a93:	8b 40 10             	mov    0x10(%rax),%eax
  803a96:	89 c2                	mov    %eax,%edx
  803a98:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803a9c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803aa0:	48 89 ce             	mov    %rcx,%rsi
  803aa3:	48 89 c7             	mov    %rax,%rdi
  803aa6:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  803aad:	00 00 00 
  803ab0:	ff d0                	callq  *%rax
  803ab2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ab6:	8b 50 10             	mov    0x10(%rax),%edx
  803ab9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803abd:	89 10                	mov    %edx,(%rax)
  803abf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac2:	c9                   	leaveq 
  803ac3:	c3                   	retq   

0000000000803ac4 <nsipc_bind>:
  803ac4:	55                   	push   %rbp
  803ac5:	48 89 e5             	mov    %rsp,%rbp
  803ac8:	48 83 ec 10          	sub    $0x10,%rsp
  803acc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803acf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ad3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ad6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803add:	00 00 00 
  803ae0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ae3:	89 10                	mov    %edx,(%rax)
  803ae5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ae8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aec:	48 89 c6             	mov    %rax,%rsi
  803aef:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803af6:	00 00 00 
  803af9:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  803b00:	00 00 00 
  803b03:	ff d0                	callq  *%rax
  803b05:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b0c:	00 00 00 
  803b0f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b12:	89 50 14             	mov    %edx,0x14(%rax)
  803b15:	bf 02 00 00 00       	mov    $0x2,%edi
  803b1a:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803b21:	00 00 00 
  803b24:	ff d0                	callq  *%rax
  803b26:	c9                   	leaveq 
  803b27:	c3                   	retq   

0000000000803b28 <nsipc_shutdown>:
  803b28:	55                   	push   %rbp
  803b29:	48 89 e5             	mov    %rsp,%rbp
  803b2c:	48 83 ec 10          	sub    $0x10,%rsp
  803b30:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b33:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803b36:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b3d:	00 00 00 
  803b40:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b43:	89 10                	mov    %edx,(%rax)
  803b45:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b4c:	00 00 00 
  803b4f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b52:	89 50 04             	mov    %edx,0x4(%rax)
  803b55:	bf 03 00 00 00       	mov    $0x3,%edi
  803b5a:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803b61:	00 00 00 
  803b64:	ff d0                	callq  *%rax
  803b66:	c9                   	leaveq 
  803b67:	c3                   	retq   

0000000000803b68 <nsipc_close>:
  803b68:	55                   	push   %rbp
  803b69:	48 89 e5             	mov    %rsp,%rbp
  803b6c:	48 83 ec 10          	sub    $0x10,%rsp
  803b70:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b73:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b7a:	00 00 00 
  803b7d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b80:	89 10                	mov    %edx,(%rax)
  803b82:	bf 04 00 00 00       	mov    $0x4,%edi
  803b87:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803b8e:	00 00 00 
  803b91:	ff d0                	callq  *%rax
  803b93:	c9                   	leaveq 
  803b94:	c3                   	retq   

0000000000803b95 <nsipc_connect>:
  803b95:	55                   	push   %rbp
  803b96:	48 89 e5             	mov    %rsp,%rbp
  803b99:	48 83 ec 10          	sub    $0x10,%rsp
  803b9d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ba0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ba4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ba7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bae:	00 00 00 
  803bb1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bb4:	89 10                	mov    %edx,(%rax)
  803bb6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bb9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bbd:	48 89 c6             	mov    %rax,%rsi
  803bc0:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803bc7:	00 00 00 
  803bca:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  803bd1:	00 00 00 
  803bd4:	ff d0                	callq  *%rax
  803bd6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bdd:	00 00 00 
  803be0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803be3:	89 50 14             	mov    %edx,0x14(%rax)
  803be6:	bf 05 00 00 00       	mov    $0x5,%edi
  803beb:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803bf2:	00 00 00 
  803bf5:	ff d0                	callq  *%rax
  803bf7:	c9                   	leaveq 
  803bf8:	c3                   	retq   

0000000000803bf9 <nsipc_listen>:
  803bf9:	55                   	push   %rbp
  803bfa:	48 89 e5             	mov    %rsp,%rbp
  803bfd:	48 83 ec 10          	sub    $0x10,%rsp
  803c01:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c04:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c07:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c0e:	00 00 00 
  803c11:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c14:	89 10                	mov    %edx,(%rax)
  803c16:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c1d:	00 00 00 
  803c20:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c23:	89 50 04             	mov    %edx,0x4(%rax)
  803c26:	bf 06 00 00 00       	mov    $0x6,%edi
  803c2b:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803c32:	00 00 00 
  803c35:	ff d0                	callq  *%rax
  803c37:	c9                   	leaveq 
  803c38:	c3                   	retq   

0000000000803c39 <nsipc_recv>:
  803c39:	55                   	push   %rbp
  803c3a:	48 89 e5             	mov    %rsp,%rbp
  803c3d:	48 83 ec 30          	sub    $0x30,%rsp
  803c41:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c44:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c48:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c4b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803c4e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c55:	00 00 00 
  803c58:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c5b:	89 10                	mov    %edx,(%rax)
  803c5d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c64:	00 00 00 
  803c67:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c6a:	89 50 04             	mov    %edx,0x4(%rax)
  803c6d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c74:	00 00 00 
  803c77:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803c7a:	89 50 08             	mov    %edx,0x8(%rax)
  803c7d:	bf 07 00 00 00       	mov    $0x7,%edi
  803c82:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803c89:	00 00 00 
  803c8c:	ff d0                	callq  *%rax
  803c8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c91:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c95:	78 69                	js     803d00 <nsipc_recv+0xc7>
  803c97:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803c9e:	7f 08                	jg     803ca8 <nsipc_recv+0x6f>
  803ca0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ca3:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803ca6:	7e 35                	jle    803cdd <nsipc_recv+0xa4>
  803ca8:	48 b9 51 52 80 00 00 	movabs $0x805251,%rcx
  803caf:	00 00 00 
  803cb2:	48 ba 66 52 80 00 00 	movabs $0x805266,%rdx
  803cb9:	00 00 00 
  803cbc:	be 62 00 00 00       	mov    $0x62,%esi
  803cc1:	48 bf 7b 52 80 00 00 	movabs $0x80527b,%rdi
  803cc8:	00 00 00 
  803ccb:	b8 00 00 00 00       	mov    $0x0,%eax
  803cd0:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  803cd7:	00 00 00 
  803cda:	41 ff d0             	callq  *%r8
  803cdd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ce0:	48 63 d0             	movslq %eax,%rdx
  803ce3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ce7:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803cee:	00 00 00 
  803cf1:	48 89 c7             	mov    %rax,%rdi
  803cf4:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  803cfb:	00 00 00 
  803cfe:	ff d0                	callq  *%rax
  803d00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d03:	c9                   	leaveq 
  803d04:	c3                   	retq   

0000000000803d05 <nsipc_send>:
  803d05:	55                   	push   %rbp
  803d06:	48 89 e5             	mov    %rsp,%rbp
  803d09:	48 83 ec 20          	sub    $0x20,%rsp
  803d0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d14:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803d17:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803d1a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d21:	00 00 00 
  803d24:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d27:	89 10                	mov    %edx,(%rax)
  803d29:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803d30:	7e 35                	jle    803d67 <nsipc_send+0x62>
  803d32:	48 b9 8a 52 80 00 00 	movabs $0x80528a,%rcx
  803d39:	00 00 00 
  803d3c:	48 ba 66 52 80 00 00 	movabs $0x805266,%rdx
  803d43:	00 00 00 
  803d46:	be 6d 00 00 00       	mov    $0x6d,%esi
  803d4b:	48 bf 7b 52 80 00 00 	movabs $0x80527b,%rdi
  803d52:	00 00 00 
  803d55:	b8 00 00 00 00       	mov    $0x0,%eax
  803d5a:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  803d61:	00 00 00 
  803d64:	41 ff d0             	callq  *%r8
  803d67:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d6a:	48 63 d0             	movslq %eax,%rdx
  803d6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d71:	48 89 c6             	mov    %rax,%rsi
  803d74:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803d7b:	00 00 00 
  803d7e:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  803d85:	00 00 00 
  803d88:	ff d0                	callq  *%rax
  803d8a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d91:	00 00 00 
  803d94:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d97:	89 50 04             	mov    %edx,0x4(%rax)
  803d9a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803da1:	00 00 00 
  803da4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803da7:	89 50 08             	mov    %edx,0x8(%rax)
  803daa:	bf 08 00 00 00       	mov    $0x8,%edi
  803daf:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803db6:	00 00 00 
  803db9:	ff d0                	callq  *%rax
  803dbb:	c9                   	leaveq 
  803dbc:	c3                   	retq   

0000000000803dbd <nsipc_socket>:
  803dbd:	55                   	push   %rbp
  803dbe:	48 89 e5             	mov    %rsp,%rbp
  803dc1:	48 83 ec 10          	sub    $0x10,%rsp
  803dc5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803dc8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803dcb:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803dce:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dd5:	00 00 00 
  803dd8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ddb:	89 10                	mov    %edx,(%rax)
  803ddd:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803de4:	00 00 00 
  803de7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803dea:	89 50 04             	mov    %edx,0x4(%rax)
  803ded:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803df4:	00 00 00 
  803df7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803dfa:	89 50 08             	mov    %edx,0x8(%rax)
  803dfd:	bf 09 00 00 00       	mov    $0x9,%edi
  803e02:	48 b8 c4 39 80 00 00 	movabs $0x8039c4,%rax
  803e09:	00 00 00 
  803e0c:	ff d0                	callq  *%rax
  803e0e:	c9                   	leaveq 
  803e0f:	c3                   	retq   

0000000000803e10 <pipe>:
  803e10:	55                   	push   %rbp
  803e11:	48 89 e5             	mov    %rsp,%rbp
  803e14:	53                   	push   %rbx
  803e15:	48 83 ec 38          	sub    $0x38,%rsp
  803e19:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803e1d:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803e21:	48 89 c7             	mov    %rax,%rdi
  803e24:	48 b8 27 26 80 00 00 	movabs $0x802627,%rax
  803e2b:	00 00 00 
  803e2e:	ff d0                	callq  *%rax
  803e30:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e33:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e37:	0f 88 bf 01 00 00    	js     803ffc <pipe+0x1ec>
  803e3d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e41:	ba 07 04 00 00       	mov    $0x407,%edx
  803e46:	48 89 c6             	mov    %rax,%rsi
  803e49:	bf 00 00 00 00       	mov    $0x0,%edi
  803e4e:	48 b8 e6 1a 80 00 00 	movabs $0x801ae6,%rax
  803e55:	00 00 00 
  803e58:	ff d0                	callq  *%rax
  803e5a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e5d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e61:	0f 88 95 01 00 00    	js     803ffc <pipe+0x1ec>
  803e67:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803e6b:	48 89 c7             	mov    %rax,%rdi
  803e6e:	48 b8 27 26 80 00 00 	movabs $0x802627,%rax
  803e75:	00 00 00 
  803e78:	ff d0                	callq  *%rax
  803e7a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e7d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e81:	0f 88 5d 01 00 00    	js     803fe4 <pipe+0x1d4>
  803e87:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e8b:	ba 07 04 00 00       	mov    $0x407,%edx
  803e90:	48 89 c6             	mov    %rax,%rsi
  803e93:	bf 00 00 00 00       	mov    $0x0,%edi
  803e98:	48 b8 e6 1a 80 00 00 	movabs $0x801ae6,%rax
  803e9f:	00 00 00 
  803ea2:	ff d0                	callq  *%rax
  803ea4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ea7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803eab:	0f 88 33 01 00 00    	js     803fe4 <pipe+0x1d4>
  803eb1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803eb5:	48 89 c7             	mov    %rax,%rdi
  803eb8:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  803ebf:	00 00 00 
  803ec2:	ff d0                	callq  *%rax
  803ec4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803ec8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ecc:	ba 07 04 00 00       	mov    $0x407,%edx
  803ed1:	48 89 c6             	mov    %rax,%rsi
  803ed4:	bf 00 00 00 00       	mov    $0x0,%edi
  803ed9:	48 b8 e6 1a 80 00 00 	movabs $0x801ae6,%rax
  803ee0:	00 00 00 
  803ee3:	ff d0                	callq  *%rax
  803ee5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ee8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803eec:	79 05                	jns    803ef3 <pipe+0xe3>
  803eee:	e9 d9 00 00 00       	jmpq   803fcc <pipe+0x1bc>
  803ef3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ef7:	48 89 c7             	mov    %rax,%rdi
  803efa:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  803f01:	00 00 00 
  803f04:	ff d0                	callq  *%rax
  803f06:	48 89 c2             	mov    %rax,%rdx
  803f09:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f0d:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803f13:	48 89 d1             	mov    %rdx,%rcx
  803f16:	ba 00 00 00 00       	mov    $0x0,%edx
  803f1b:	48 89 c6             	mov    %rax,%rsi
  803f1e:	bf 00 00 00 00       	mov    $0x0,%edi
  803f23:	48 b8 36 1b 80 00 00 	movabs $0x801b36,%rax
  803f2a:	00 00 00 
  803f2d:	ff d0                	callq  *%rax
  803f2f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f32:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f36:	79 1b                	jns    803f53 <pipe+0x143>
  803f38:	90                   	nop
  803f39:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f3d:	48 89 c6             	mov    %rax,%rsi
  803f40:	bf 00 00 00 00       	mov    $0x0,%edi
  803f45:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  803f4c:	00 00 00 
  803f4f:	ff d0                	callq  *%rax
  803f51:	eb 79                	jmp    803fcc <pipe+0x1bc>
  803f53:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f57:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803f5e:	00 00 00 
  803f61:	8b 12                	mov    (%rdx),%edx
  803f63:	89 10                	mov    %edx,(%rax)
  803f65:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f69:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803f70:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f74:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803f7b:	00 00 00 
  803f7e:	8b 12                	mov    (%rdx),%edx
  803f80:	89 10                	mov    %edx,(%rax)
  803f82:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f86:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803f8d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f91:	48 89 c7             	mov    %rax,%rdi
  803f94:	48 b8 d9 25 80 00 00 	movabs $0x8025d9,%rax
  803f9b:	00 00 00 
  803f9e:	ff d0                	callq  *%rax
  803fa0:	89 c2                	mov    %eax,%edx
  803fa2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803fa6:	89 10                	mov    %edx,(%rax)
  803fa8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803fac:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803fb0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fb4:	48 89 c7             	mov    %rax,%rdi
  803fb7:	48 b8 d9 25 80 00 00 	movabs $0x8025d9,%rax
  803fbe:	00 00 00 
  803fc1:	ff d0                	callq  *%rax
  803fc3:	89 03                	mov    %eax,(%rbx)
  803fc5:	b8 00 00 00 00       	mov    $0x0,%eax
  803fca:	eb 33                	jmp    803fff <pipe+0x1ef>
  803fcc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fd0:	48 89 c6             	mov    %rax,%rsi
  803fd3:	bf 00 00 00 00       	mov    $0x0,%edi
  803fd8:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  803fdf:	00 00 00 
  803fe2:	ff d0                	callq  *%rax
  803fe4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fe8:	48 89 c6             	mov    %rax,%rsi
  803feb:	bf 00 00 00 00       	mov    $0x0,%edi
  803ff0:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  803ff7:	00 00 00 
  803ffa:	ff d0                	callq  *%rax
  803ffc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fff:	48 83 c4 38          	add    $0x38,%rsp
  804003:	5b                   	pop    %rbx
  804004:	5d                   	pop    %rbp
  804005:	c3                   	retq   

0000000000804006 <_pipeisclosed>:
  804006:	55                   	push   %rbp
  804007:	48 89 e5             	mov    %rsp,%rbp
  80400a:	53                   	push   %rbx
  80400b:	48 83 ec 28          	sub    $0x28,%rsp
  80400f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804013:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804017:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80401e:	00 00 00 
  804021:	48 8b 00             	mov    (%rax),%rax
  804024:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80402a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80402d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804031:	48 89 c7             	mov    %rax,%rdi
  804034:	48 b8 7d 49 80 00 00 	movabs $0x80497d,%rax
  80403b:	00 00 00 
  80403e:	ff d0                	callq  *%rax
  804040:	89 c3                	mov    %eax,%ebx
  804042:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804046:	48 89 c7             	mov    %rax,%rdi
  804049:	48 b8 7d 49 80 00 00 	movabs $0x80497d,%rax
  804050:	00 00 00 
  804053:	ff d0                	callq  *%rax
  804055:	39 c3                	cmp    %eax,%ebx
  804057:	0f 94 c0             	sete   %al
  80405a:	0f b6 c0             	movzbl %al,%eax
  80405d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804060:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804067:	00 00 00 
  80406a:	48 8b 00             	mov    (%rax),%rax
  80406d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804073:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804076:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804079:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80407c:	75 05                	jne    804083 <_pipeisclosed+0x7d>
  80407e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804081:	eb 4f                	jmp    8040d2 <_pipeisclosed+0xcc>
  804083:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804086:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804089:	74 42                	je     8040cd <_pipeisclosed+0xc7>
  80408b:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80408f:	75 3c                	jne    8040cd <_pipeisclosed+0xc7>
  804091:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804098:	00 00 00 
  80409b:	48 8b 00             	mov    (%rax),%rax
  80409e:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8040a4:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8040a7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040aa:	89 c6                	mov    %eax,%esi
  8040ac:	48 bf 9b 52 80 00 00 	movabs $0x80529b,%rdi
  8040b3:	00 00 00 
  8040b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8040bb:	49 b8 02 06 80 00 00 	movabs $0x800602,%r8
  8040c2:	00 00 00 
  8040c5:	41 ff d0             	callq  *%r8
  8040c8:	e9 4a ff ff ff       	jmpq   804017 <_pipeisclosed+0x11>
  8040cd:	e9 45 ff ff ff       	jmpq   804017 <_pipeisclosed+0x11>
  8040d2:	48 83 c4 28          	add    $0x28,%rsp
  8040d6:	5b                   	pop    %rbx
  8040d7:	5d                   	pop    %rbp
  8040d8:	c3                   	retq   

00000000008040d9 <pipeisclosed>:
  8040d9:	55                   	push   %rbp
  8040da:	48 89 e5             	mov    %rsp,%rbp
  8040dd:	48 83 ec 30          	sub    $0x30,%rsp
  8040e1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8040e4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8040e8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8040eb:	48 89 d6             	mov    %rdx,%rsi
  8040ee:	89 c7                	mov    %eax,%edi
  8040f0:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  8040f7:	00 00 00 
  8040fa:	ff d0                	callq  *%rax
  8040fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040ff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804103:	79 05                	jns    80410a <pipeisclosed+0x31>
  804105:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804108:	eb 31                	jmp    80413b <pipeisclosed+0x62>
  80410a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80410e:	48 89 c7             	mov    %rax,%rdi
  804111:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  804118:	00 00 00 
  80411b:	ff d0                	callq  *%rax
  80411d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804121:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804125:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804129:	48 89 d6             	mov    %rdx,%rsi
  80412c:	48 89 c7             	mov    %rax,%rdi
  80412f:	48 b8 06 40 80 00 00 	movabs $0x804006,%rax
  804136:	00 00 00 
  804139:	ff d0                	callq  *%rax
  80413b:	c9                   	leaveq 
  80413c:	c3                   	retq   

000000000080413d <devpipe_read>:
  80413d:	55                   	push   %rbp
  80413e:	48 89 e5             	mov    %rsp,%rbp
  804141:	48 83 ec 40          	sub    $0x40,%rsp
  804145:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804149:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80414d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804151:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804155:	48 89 c7             	mov    %rax,%rdi
  804158:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  80415f:	00 00 00 
  804162:	ff d0                	callq  *%rax
  804164:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804168:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80416c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804170:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804177:	00 
  804178:	e9 92 00 00 00       	jmpq   80420f <devpipe_read+0xd2>
  80417d:	eb 41                	jmp    8041c0 <devpipe_read+0x83>
  80417f:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804184:	74 09                	je     80418f <devpipe_read+0x52>
  804186:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80418a:	e9 92 00 00 00       	jmpq   804221 <devpipe_read+0xe4>
  80418f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804193:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804197:	48 89 d6             	mov    %rdx,%rsi
  80419a:	48 89 c7             	mov    %rax,%rdi
  80419d:	48 b8 06 40 80 00 00 	movabs $0x804006,%rax
  8041a4:	00 00 00 
  8041a7:	ff d0                	callq  *%rax
  8041a9:	85 c0                	test   %eax,%eax
  8041ab:	74 07                	je     8041b4 <devpipe_read+0x77>
  8041ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8041b2:	eb 6d                	jmp    804221 <devpipe_read+0xe4>
  8041b4:	48 b8 a8 1a 80 00 00 	movabs $0x801aa8,%rax
  8041bb:	00 00 00 
  8041be:	ff d0                	callq  *%rax
  8041c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041c4:	8b 10                	mov    (%rax),%edx
  8041c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041ca:	8b 40 04             	mov    0x4(%rax),%eax
  8041cd:	39 c2                	cmp    %eax,%edx
  8041cf:	74 ae                	je     80417f <devpipe_read+0x42>
  8041d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041d5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8041d9:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8041dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041e1:	8b 00                	mov    (%rax),%eax
  8041e3:	99                   	cltd   
  8041e4:	c1 ea 1b             	shr    $0x1b,%edx
  8041e7:	01 d0                	add    %edx,%eax
  8041e9:	83 e0 1f             	and    $0x1f,%eax
  8041ec:	29 d0                	sub    %edx,%eax
  8041ee:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8041f2:	48 98                	cltq   
  8041f4:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8041f9:	88 01                	mov    %al,(%rcx)
  8041fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041ff:	8b 00                	mov    (%rax),%eax
  804201:	8d 50 01             	lea    0x1(%rax),%edx
  804204:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804208:	89 10                	mov    %edx,(%rax)
  80420a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80420f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804213:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804217:	0f 82 60 ff ff ff    	jb     80417d <devpipe_read+0x40>
  80421d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804221:	c9                   	leaveq 
  804222:	c3                   	retq   

0000000000804223 <devpipe_write>:
  804223:	55                   	push   %rbp
  804224:	48 89 e5             	mov    %rsp,%rbp
  804227:	48 83 ec 40          	sub    $0x40,%rsp
  80422b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80422f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804233:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804237:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80423b:	48 89 c7             	mov    %rax,%rdi
  80423e:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  804245:	00 00 00 
  804248:	ff d0                	callq  *%rax
  80424a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80424e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804252:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804256:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80425d:	00 
  80425e:	e9 8e 00 00 00       	jmpq   8042f1 <devpipe_write+0xce>
  804263:	eb 31                	jmp    804296 <devpipe_write+0x73>
  804265:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804269:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80426d:	48 89 d6             	mov    %rdx,%rsi
  804270:	48 89 c7             	mov    %rax,%rdi
  804273:	48 b8 06 40 80 00 00 	movabs $0x804006,%rax
  80427a:	00 00 00 
  80427d:	ff d0                	callq  *%rax
  80427f:	85 c0                	test   %eax,%eax
  804281:	74 07                	je     80428a <devpipe_write+0x67>
  804283:	b8 00 00 00 00       	mov    $0x0,%eax
  804288:	eb 79                	jmp    804303 <devpipe_write+0xe0>
  80428a:	48 b8 a8 1a 80 00 00 	movabs $0x801aa8,%rax
  804291:	00 00 00 
  804294:	ff d0                	callq  *%rax
  804296:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80429a:	8b 40 04             	mov    0x4(%rax),%eax
  80429d:	48 63 d0             	movslq %eax,%rdx
  8042a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042a4:	8b 00                	mov    (%rax),%eax
  8042a6:	48 98                	cltq   
  8042a8:	48 83 c0 20          	add    $0x20,%rax
  8042ac:	48 39 c2             	cmp    %rax,%rdx
  8042af:	73 b4                	jae    804265 <devpipe_write+0x42>
  8042b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042b5:	8b 40 04             	mov    0x4(%rax),%eax
  8042b8:	99                   	cltd   
  8042b9:	c1 ea 1b             	shr    $0x1b,%edx
  8042bc:	01 d0                	add    %edx,%eax
  8042be:	83 e0 1f             	and    $0x1f,%eax
  8042c1:	29 d0                	sub    %edx,%eax
  8042c3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8042c7:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8042cb:	48 01 ca             	add    %rcx,%rdx
  8042ce:	0f b6 0a             	movzbl (%rdx),%ecx
  8042d1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042d5:	48 98                	cltq   
  8042d7:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8042db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042df:	8b 40 04             	mov    0x4(%rax),%eax
  8042e2:	8d 50 01             	lea    0x1(%rax),%edx
  8042e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042e9:	89 50 04             	mov    %edx,0x4(%rax)
  8042ec:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8042f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042f5:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8042f9:	0f 82 64 ff ff ff    	jb     804263 <devpipe_write+0x40>
  8042ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804303:	c9                   	leaveq 
  804304:	c3                   	retq   

0000000000804305 <devpipe_stat>:
  804305:	55                   	push   %rbp
  804306:	48 89 e5             	mov    %rsp,%rbp
  804309:	48 83 ec 20          	sub    $0x20,%rsp
  80430d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804311:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804315:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804319:	48 89 c7             	mov    %rax,%rdi
  80431c:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  804323:	00 00 00 
  804326:	ff d0                	callq  *%rax
  804328:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80432c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804330:	48 be ae 52 80 00 00 	movabs $0x8052ae,%rsi
  804337:	00 00 00 
  80433a:	48 89 c7             	mov    %rax,%rdi
  80433d:	48 b8 b7 11 80 00 00 	movabs $0x8011b7,%rax
  804344:	00 00 00 
  804347:	ff d0                	callq  *%rax
  804349:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80434d:	8b 50 04             	mov    0x4(%rax),%edx
  804350:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804354:	8b 00                	mov    (%rax),%eax
  804356:	29 c2                	sub    %eax,%edx
  804358:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80435c:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804362:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804366:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80436d:	00 00 00 
  804370:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804374:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  80437b:	00 00 00 
  80437e:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804385:	b8 00 00 00 00       	mov    $0x0,%eax
  80438a:	c9                   	leaveq 
  80438b:	c3                   	retq   

000000000080438c <devpipe_close>:
  80438c:	55                   	push   %rbp
  80438d:	48 89 e5             	mov    %rsp,%rbp
  804390:	48 83 ec 10          	sub    $0x10,%rsp
  804394:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804398:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80439c:	48 89 c6             	mov    %rax,%rsi
  80439f:	bf 00 00 00 00       	mov    $0x0,%edi
  8043a4:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  8043ab:	00 00 00 
  8043ae:	ff d0                	callq  *%rax
  8043b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043b4:	48 89 c7             	mov    %rax,%rdi
  8043b7:	48 b8 fc 25 80 00 00 	movabs $0x8025fc,%rax
  8043be:	00 00 00 
  8043c1:	ff d0                	callq  *%rax
  8043c3:	48 89 c6             	mov    %rax,%rsi
  8043c6:	bf 00 00 00 00       	mov    $0x0,%edi
  8043cb:	48 b8 91 1b 80 00 00 	movabs $0x801b91,%rax
  8043d2:	00 00 00 
  8043d5:	ff d0                	callq  *%rax
  8043d7:	c9                   	leaveq 
  8043d8:	c3                   	retq   

00000000008043d9 <cputchar>:
  8043d9:	55                   	push   %rbp
  8043da:	48 89 e5             	mov    %rsp,%rbp
  8043dd:	48 83 ec 20          	sub    $0x20,%rsp
  8043e1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8043e4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043e7:	88 45 ff             	mov    %al,-0x1(%rbp)
  8043ea:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8043ee:	be 01 00 00 00       	mov    $0x1,%esi
  8043f3:	48 89 c7             	mov    %rax,%rdi
  8043f6:	48 b8 9e 19 80 00 00 	movabs $0x80199e,%rax
  8043fd:	00 00 00 
  804400:	ff d0                	callq  *%rax
  804402:	c9                   	leaveq 
  804403:	c3                   	retq   

0000000000804404 <getchar>:
  804404:	55                   	push   %rbp
  804405:	48 89 e5             	mov    %rsp,%rbp
  804408:	48 83 ec 10          	sub    $0x10,%rsp
  80440c:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804410:	ba 01 00 00 00       	mov    $0x1,%edx
  804415:	48 89 c6             	mov    %rax,%rsi
  804418:	bf 00 00 00 00       	mov    $0x0,%edi
  80441d:	48 b8 f1 2a 80 00 00 	movabs $0x802af1,%rax
  804424:	00 00 00 
  804427:	ff d0                	callq  *%rax
  804429:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80442c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804430:	79 05                	jns    804437 <getchar+0x33>
  804432:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804435:	eb 14                	jmp    80444b <getchar+0x47>
  804437:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80443b:	7f 07                	jg     804444 <getchar+0x40>
  80443d:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804442:	eb 07                	jmp    80444b <getchar+0x47>
  804444:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804448:	0f b6 c0             	movzbl %al,%eax
  80444b:	c9                   	leaveq 
  80444c:	c3                   	retq   

000000000080444d <iscons>:
  80444d:	55                   	push   %rbp
  80444e:	48 89 e5             	mov    %rsp,%rbp
  804451:	48 83 ec 20          	sub    $0x20,%rsp
  804455:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804458:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80445c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80445f:	48 89 d6             	mov    %rdx,%rsi
  804462:	89 c7                	mov    %eax,%edi
  804464:	48 b8 bf 26 80 00 00 	movabs $0x8026bf,%rax
  80446b:	00 00 00 
  80446e:	ff d0                	callq  *%rax
  804470:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804473:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804477:	79 05                	jns    80447e <iscons+0x31>
  804479:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80447c:	eb 1a                	jmp    804498 <iscons+0x4b>
  80447e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804482:	8b 10                	mov    (%rax),%edx
  804484:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80448b:	00 00 00 
  80448e:	8b 00                	mov    (%rax),%eax
  804490:	39 c2                	cmp    %eax,%edx
  804492:	0f 94 c0             	sete   %al
  804495:	0f b6 c0             	movzbl %al,%eax
  804498:	c9                   	leaveq 
  804499:	c3                   	retq   

000000000080449a <opencons>:
  80449a:	55                   	push   %rbp
  80449b:	48 89 e5             	mov    %rsp,%rbp
  80449e:	48 83 ec 10          	sub    $0x10,%rsp
  8044a2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8044a6:	48 89 c7             	mov    %rax,%rdi
  8044a9:	48 b8 27 26 80 00 00 	movabs $0x802627,%rax
  8044b0:	00 00 00 
  8044b3:	ff d0                	callq  *%rax
  8044b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044bc:	79 05                	jns    8044c3 <opencons+0x29>
  8044be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044c1:	eb 5b                	jmp    80451e <opencons+0x84>
  8044c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044c7:	ba 07 04 00 00       	mov    $0x407,%edx
  8044cc:	48 89 c6             	mov    %rax,%rsi
  8044cf:	bf 00 00 00 00       	mov    $0x0,%edi
  8044d4:	48 b8 e6 1a 80 00 00 	movabs $0x801ae6,%rax
  8044db:	00 00 00 
  8044de:	ff d0                	callq  *%rax
  8044e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044e7:	79 05                	jns    8044ee <opencons+0x54>
  8044e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044ec:	eb 30                	jmp    80451e <opencons+0x84>
  8044ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044f2:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8044f9:	00 00 00 
  8044fc:	8b 12                	mov    (%rdx),%edx
  8044fe:	89 10                	mov    %edx,(%rax)
  804500:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804504:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80450b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80450f:	48 89 c7             	mov    %rax,%rdi
  804512:	48 b8 d9 25 80 00 00 	movabs $0x8025d9,%rax
  804519:	00 00 00 
  80451c:	ff d0                	callq  *%rax
  80451e:	c9                   	leaveq 
  80451f:	c3                   	retq   

0000000000804520 <devcons_read>:
  804520:	55                   	push   %rbp
  804521:	48 89 e5             	mov    %rsp,%rbp
  804524:	48 83 ec 30          	sub    $0x30,%rsp
  804528:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80452c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804530:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804534:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804539:	75 07                	jne    804542 <devcons_read+0x22>
  80453b:	b8 00 00 00 00       	mov    $0x0,%eax
  804540:	eb 4b                	jmp    80458d <devcons_read+0x6d>
  804542:	eb 0c                	jmp    804550 <devcons_read+0x30>
  804544:	48 b8 a8 1a 80 00 00 	movabs $0x801aa8,%rax
  80454b:	00 00 00 
  80454e:	ff d0                	callq  *%rax
  804550:	48 b8 e8 19 80 00 00 	movabs $0x8019e8,%rax
  804557:	00 00 00 
  80455a:	ff d0                	callq  *%rax
  80455c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80455f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804563:	74 df                	je     804544 <devcons_read+0x24>
  804565:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804569:	79 05                	jns    804570 <devcons_read+0x50>
  80456b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80456e:	eb 1d                	jmp    80458d <devcons_read+0x6d>
  804570:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804574:	75 07                	jne    80457d <devcons_read+0x5d>
  804576:	b8 00 00 00 00       	mov    $0x0,%eax
  80457b:	eb 10                	jmp    80458d <devcons_read+0x6d>
  80457d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804580:	89 c2                	mov    %eax,%edx
  804582:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804586:	88 10                	mov    %dl,(%rax)
  804588:	b8 01 00 00 00       	mov    $0x1,%eax
  80458d:	c9                   	leaveq 
  80458e:	c3                   	retq   

000000000080458f <devcons_write>:
  80458f:	55                   	push   %rbp
  804590:	48 89 e5             	mov    %rsp,%rbp
  804593:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80459a:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8045a1:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8045a8:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8045af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8045b6:	eb 76                	jmp    80462e <devcons_write+0x9f>
  8045b8:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8045bf:	89 c2                	mov    %eax,%edx
  8045c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045c4:	29 c2                	sub    %eax,%edx
  8045c6:	89 d0                	mov    %edx,%eax
  8045c8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8045cb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045ce:	83 f8 7f             	cmp    $0x7f,%eax
  8045d1:	76 07                	jbe    8045da <devcons_write+0x4b>
  8045d3:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8045da:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045dd:	48 63 d0             	movslq %eax,%rdx
  8045e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045e3:	48 63 c8             	movslq %eax,%rcx
  8045e6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8045ed:	48 01 c1             	add    %rax,%rcx
  8045f0:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8045f7:	48 89 ce             	mov    %rcx,%rsi
  8045fa:	48 89 c7             	mov    %rax,%rdi
  8045fd:	48 b8 db 14 80 00 00 	movabs $0x8014db,%rax
  804604:	00 00 00 
  804607:	ff d0                	callq  *%rax
  804609:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80460c:	48 63 d0             	movslq %eax,%rdx
  80460f:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804616:	48 89 d6             	mov    %rdx,%rsi
  804619:	48 89 c7             	mov    %rax,%rdi
  80461c:	48 b8 9e 19 80 00 00 	movabs $0x80199e,%rax
  804623:	00 00 00 
  804626:	ff d0                	callq  *%rax
  804628:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80462b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80462e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804631:	48 98                	cltq   
  804633:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80463a:	0f 82 78 ff ff ff    	jb     8045b8 <devcons_write+0x29>
  804640:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804643:	c9                   	leaveq 
  804644:	c3                   	retq   

0000000000804645 <devcons_close>:
  804645:	55                   	push   %rbp
  804646:	48 89 e5             	mov    %rsp,%rbp
  804649:	48 83 ec 08          	sub    $0x8,%rsp
  80464d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804651:	b8 00 00 00 00       	mov    $0x0,%eax
  804656:	c9                   	leaveq 
  804657:	c3                   	retq   

0000000000804658 <devcons_stat>:
  804658:	55                   	push   %rbp
  804659:	48 89 e5             	mov    %rsp,%rbp
  80465c:	48 83 ec 10          	sub    $0x10,%rsp
  804660:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804664:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804668:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80466c:	48 be ba 52 80 00 00 	movabs $0x8052ba,%rsi
  804673:	00 00 00 
  804676:	48 89 c7             	mov    %rax,%rdi
  804679:	48 b8 b7 11 80 00 00 	movabs $0x8011b7,%rax
  804680:	00 00 00 
  804683:	ff d0                	callq  *%rax
  804685:	b8 00 00 00 00       	mov    $0x0,%eax
  80468a:	c9                   	leaveq 
  80468b:	c3                   	retq   

000000000080468c <set_pgfault_handler>:
  80468c:	55                   	push   %rbp
  80468d:	48 89 e5             	mov    %rsp,%rbp
  804690:	48 83 ec 20          	sub    $0x20,%rsp
  804694:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804698:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80469f:	00 00 00 
  8046a2:	48 8b 00             	mov    (%rax),%rax
  8046a5:	48 85 c0             	test   %rax,%rax
  8046a8:	75 6f                	jne    804719 <set_pgfault_handler+0x8d>
  8046aa:	ba 07 00 00 00       	mov    $0x7,%edx
  8046af:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8046b4:	bf 00 00 00 00       	mov    $0x0,%edi
  8046b9:	48 b8 e6 1a 80 00 00 	movabs $0x801ae6,%rax
  8046c0:	00 00 00 
  8046c3:	ff d0                	callq  *%rax
  8046c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046cc:	79 30                	jns    8046fe <set_pgfault_handler+0x72>
  8046ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046d1:	89 c1                	mov    %eax,%ecx
  8046d3:	48 ba c8 52 80 00 00 	movabs $0x8052c8,%rdx
  8046da:	00 00 00 
  8046dd:	be 22 00 00 00       	mov    $0x22,%esi
  8046e2:	48 bf e7 52 80 00 00 	movabs $0x8052e7,%rdi
  8046e9:	00 00 00 
  8046ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8046f1:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  8046f8:	00 00 00 
  8046fb:	41 ff d0             	callq  *%r8
  8046fe:	48 be 2c 47 80 00 00 	movabs $0x80472c,%rsi
  804705:	00 00 00 
  804708:	bf 00 00 00 00       	mov    $0x0,%edi
  80470d:	48 b8 70 1c 80 00 00 	movabs $0x801c70,%rax
  804714:	00 00 00 
  804717:	ff d0                	callq  *%rax
  804719:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804720:	00 00 00 
  804723:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804727:	48 89 10             	mov    %rdx,(%rax)
  80472a:	c9                   	leaveq 
  80472b:	c3                   	retq   

000000000080472c <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80472c:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  80472f:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804736:	00 00 00 
call *%rax
  804739:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80473b:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804742:	00 08 
    movq 152(%rsp), %rax
  804744:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  80474b:	00 
    movq 136(%rsp), %rbx
  80474c:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804753:	00 
movq %rbx, (%rax)
  804754:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804757:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  80475b:	4c 8b 3c 24          	mov    (%rsp),%r15
  80475f:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804764:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804769:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  80476e:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804773:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804778:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80477d:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804782:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804787:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  80478c:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804791:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804796:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  80479b:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  8047a0:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8047a5:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  8047a9:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  8047ad:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  8047ae:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8047b3:	c3                   	retq   

00000000008047b4 <ipc_recv>:
  8047b4:	55                   	push   %rbp
  8047b5:	48 89 e5             	mov    %rsp,%rbp
  8047b8:	48 83 ec 30          	sub    $0x30,%rsp
  8047bc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047c0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8047c4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8047c8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8047cd:	75 0e                	jne    8047dd <ipc_recv+0x29>
  8047cf:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8047d6:	00 00 00 
  8047d9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8047dd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047e1:	48 89 c7             	mov    %rax,%rdi
  8047e4:	48 b8 0f 1d 80 00 00 	movabs $0x801d0f,%rax
  8047eb:	00 00 00 
  8047ee:	ff d0                	callq  *%rax
  8047f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047f3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047f7:	79 27                	jns    804820 <ipc_recv+0x6c>
  8047f9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8047fe:	74 0a                	je     80480a <ipc_recv+0x56>
  804800:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804804:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80480a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80480f:	74 0a                	je     80481b <ipc_recv+0x67>
  804811:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804815:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80481b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80481e:	eb 53                	jmp    804873 <ipc_recv+0xbf>
  804820:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804825:	74 19                	je     804840 <ipc_recv+0x8c>
  804827:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80482e:	00 00 00 
  804831:	48 8b 00             	mov    (%rax),%rax
  804834:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80483a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80483e:	89 10                	mov    %edx,(%rax)
  804840:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804845:	74 19                	je     804860 <ipc_recv+0xac>
  804847:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80484e:	00 00 00 
  804851:	48 8b 00             	mov    (%rax),%rax
  804854:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80485a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80485e:	89 10                	mov    %edx,(%rax)
  804860:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804867:	00 00 00 
  80486a:	48 8b 00             	mov    (%rax),%rax
  80486d:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804873:	c9                   	leaveq 
  804874:	c3                   	retq   

0000000000804875 <ipc_send>:
  804875:	55                   	push   %rbp
  804876:	48 89 e5             	mov    %rsp,%rbp
  804879:	48 83 ec 30          	sub    $0x30,%rsp
  80487d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804880:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804883:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804887:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80488a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80488f:	75 10                	jne    8048a1 <ipc_send+0x2c>
  804891:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804898:	00 00 00 
  80489b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80489f:	eb 0e                	jmp    8048af <ipc_send+0x3a>
  8048a1:	eb 0c                	jmp    8048af <ipc_send+0x3a>
  8048a3:	48 b8 a8 1a 80 00 00 	movabs $0x801aa8,%rax
  8048aa:	00 00 00 
  8048ad:	ff d0                	callq  *%rax
  8048af:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8048b2:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8048b5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8048b9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048bc:	89 c7                	mov    %eax,%edi
  8048be:	48 b8 ba 1c 80 00 00 	movabs $0x801cba,%rax
  8048c5:	00 00 00 
  8048c8:	ff d0                	callq  *%rax
  8048ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048cd:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8048d1:	74 d0                	je     8048a3 <ipc_send+0x2e>
  8048d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048d7:	79 30                	jns    804909 <ipc_send+0x94>
  8048d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048dc:	89 c1                	mov    %eax,%ecx
  8048de:	48 ba f8 52 80 00 00 	movabs $0x8052f8,%rdx
  8048e5:	00 00 00 
  8048e8:	be 44 00 00 00       	mov    $0x44,%esi
  8048ed:	48 bf 0e 53 80 00 00 	movabs $0x80530e,%rdi
  8048f4:	00 00 00 
  8048f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8048fc:	49 b8 c9 03 80 00 00 	movabs $0x8003c9,%r8
  804903:	00 00 00 
  804906:	41 ff d0             	callq  *%r8
  804909:	c9                   	leaveq 
  80490a:	c3                   	retq   

000000000080490b <ipc_find_env>:
  80490b:	55                   	push   %rbp
  80490c:	48 89 e5             	mov    %rsp,%rbp
  80490f:	48 83 ec 14          	sub    $0x14,%rsp
  804913:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804916:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80491d:	eb 4e                	jmp    80496d <ipc_find_env+0x62>
  80491f:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804926:	00 00 00 
  804929:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80492c:	48 98                	cltq   
  80492e:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804935:	48 01 d0             	add    %rdx,%rax
  804938:	48 05 d0 00 00 00    	add    $0xd0,%rax
  80493e:	8b 00                	mov    (%rax),%eax
  804940:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804943:	75 24                	jne    804969 <ipc_find_env+0x5e>
  804945:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80494c:	00 00 00 
  80494f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804952:	48 98                	cltq   
  804954:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80495b:	48 01 d0             	add    %rdx,%rax
  80495e:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804964:	8b 40 08             	mov    0x8(%rax),%eax
  804967:	eb 12                	jmp    80497b <ipc_find_env+0x70>
  804969:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80496d:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804974:	7e a9                	jle    80491f <ipc_find_env+0x14>
  804976:	b8 00 00 00 00       	mov    $0x0,%eax
  80497b:	c9                   	leaveq 
  80497c:	c3                   	retq   

000000000080497d <pageref>:
  80497d:	55                   	push   %rbp
  80497e:	48 89 e5             	mov    %rsp,%rbp
  804981:	48 83 ec 18          	sub    $0x18,%rsp
  804985:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804989:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80498d:	48 c1 e8 15          	shr    $0x15,%rax
  804991:	48 89 c2             	mov    %rax,%rdx
  804994:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80499b:	01 00 00 
  80499e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8049a2:	83 e0 01             	and    $0x1,%eax
  8049a5:	48 85 c0             	test   %rax,%rax
  8049a8:	75 07                	jne    8049b1 <pageref+0x34>
  8049aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8049af:	eb 53                	jmp    804a04 <pageref+0x87>
  8049b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049b5:	48 c1 e8 0c          	shr    $0xc,%rax
  8049b9:	48 89 c2             	mov    %rax,%rdx
  8049bc:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8049c3:	01 00 00 
  8049c6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8049ca:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8049ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049d2:	83 e0 01             	and    $0x1,%eax
  8049d5:	48 85 c0             	test   %rax,%rax
  8049d8:	75 07                	jne    8049e1 <pageref+0x64>
  8049da:	b8 00 00 00 00       	mov    $0x0,%eax
  8049df:	eb 23                	jmp    804a04 <pageref+0x87>
  8049e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049e5:	48 c1 e8 0c          	shr    $0xc,%rax
  8049e9:	48 89 c2             	mov    %rax,%rdx
  8049ec:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8049f3:	00 00 00 
  8049f6:	48 c1 e2 04          	shl    $0x4,%rdx
  8049fa:	48 01 d0             	add    %rdx,%rax
  8049fd:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804a01:	0f b7 c0             	movzwl %ax,%eax
  804a04:	c9                   	leaveq 
  804a05:	c3                   	retq   
