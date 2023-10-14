
obj/user/echo:     file format elf64-x86-64


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
  80003c:	e8 11 01 00 00       	callq  800152 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  800059:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
  80005d:	7e 38                	jle    800097 <umain+0x54>
  80005f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800063:	48 83 c0 08          	add    $0x8,%rax
  800067:	48 8b 00             	mov    (%rax),%rax
  80006a:	48 be 00 41 80 00 00 	movabs $0x804100,%rsi
  800071:	00 00 00 
  800074:	48 89 c7             	mov    %rax,%rdi
  800077:	48 b8 c6 03 80 00 00 	movabs $0x8003c6,%rax
  80007e:	00 00 00 
  800081:	ff d0                	callq  *%rax
  800083:	85 c0                	test   %eax,%eax
  800085:	75 10                	jne    800097 <umain+0x54>
  800087:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
  80008e:	83 6d ec 01          	subl   $0x1,-0x14(%rbp)
  800092:	48 83 45 e0 08       	addq   $0x8,-0x20(%rbp)
  800097:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80009e:	eb 7e                	jmp    80011e <umain+0xdb>
  8000a0:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  8000a4:	7e 20                	jle    8000c6 <umain+0x83>
  8000a6:	ba 01 00 00 00       	mov    $0x1,%edx
  8000ab:	48 be 03 41 80 00 00 	movabs $0x804103,%rsi
  8000b2:	00 00 00 
  8000b5:	bf 01 00 00 00       	mov    $0x1,%edi
  8000ba:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  8000c1:	00 00 00 
  8000c4:	ff d0                	callq  *%rax
  8000c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000c9:	48 98                	cltq   
  8000cb:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8000d2:	00 
  8000d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8000d7:	48 01 d0             	add    %rdx,%rax
  8000da:	48 8b 00             	mov    (%rax),%rax
  8000dd:	48 89 c7             	mov    %rax,%rdi
  8000e0:	48 b8 f8 01 80 00 00 	movabs $0x8001f8,%rax
  8000e7:	00 00 00 
  8000ea:	ff d0                	callq  *%rax
  8000ec:	48 63 d0             	movslq %eax,%rdx
  8000ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000f2:	48 98                	cltq   
  8000f4:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
  8000fb:	00 
  8000fc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800100:	48 01 c8             	add    %rcx,%rax
  800103:	48 8b 00             	mov    (%rax),%rax
  800106:	48 89 c6             	mov    %rax,%rsi
  800109:	bf 01 00 00 00       	mov    $0x1,%edi
  80010e:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  800115:	00 00 00 
  800118:	ff d0                	callq  *%rax
  80011a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80011e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800121:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  800124:	0f 8c 76 ff ff ff    	jl     8000a0 <umain+0x5d>
  80012a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80012e:	75 20                	jne    800150 <umain+0x10d>
  800130:	ba 01 00 00 00       	mov    $0x1,%edx
  800135:	48 be 05 41 80 00 00 	movabs $0x804105,%rsi
  80013c:	00 00 00 
  80013f:	bf 01 00 00 00       	mov    $0x1,%edi
  800144:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  80014b:	00 00 00 
  80014e:	ff d0                	callq  *%rax
  800150:	c9                   	leaveq 
  800151:	c3                   	retq   

0000000000800152 <libmain>:
  800152:	55                   	push   %rbp
  800153:	48 89 e5             	mov    %rsp,%rbp
  800156:	48 83 ec 10          	sub    $0x10,%rsp
  80015a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80015d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800161:	48 b8 17 0b 80 00 00 	movabs $0x800b17,%rax
  800168:	00 00 00 
  80016b:	ff d0                	callq  *%rax
  80016d:	25 ff 03 00 00       	and    $0x3ff,%eax
  800172:	48 98                	cltq   
  800174:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80017b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800182:	00 00 00 
  800185:	48 01 c2             	add    %rax,%rdx
  800188:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80018f:	00 00 00 
  800192:	48 89 10             	mov    %rdx,(%rax)
  800195:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800199:	7e 14                	jle    8001af <libmain+0x5d>
  80019b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80019f:	48 8b 10             	mov    (%rax),%rdx
  8001a2:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8001a9:	00 00 00 
  8001ac:	48 89 10             	mov    %rdx,(%rax)
  8001af:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001b6:	48 89 d6             	mov    %rdx,%rsi
  8001b9:	89 c7                	mov    %eax,%edi
  8001bb:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001c2:	00 00 00 
  8001c5:	ff d0                	callq  *%rax
  8001c7:	48 b8 d5 01 80 00 00 	movabs $0x8001d5,%rax
  8001ce:	00 00 00 
  8001d1:	ff d0                	callq  *%rax
  8001d3:	c9                   	leaveq 
  8001d4:	c3                   	retq   

00000000008001d5 <exit>:
  8001d5:	55                   	push   %rbp
  8001d6:	48 89 e5             	mov    %rsp,%rbp
  8001d9:	48 b8 b2 13 80 00 00 	movabs $0x8013b2,%rax
  8001e0:	00 00 00 
  8001e3:	ff d0                	callq  *%rax
  8001e5:	bf 00 00 00 00       	mov    $0x0,%edi
  8001ea:	48 b8 d3 0a 80 00 00 	movabs $0x800ad3,%rax
  8001f1:	00 00 00 
  8001f4:	ff d0                	callq  *%rax
  8001f6:	5d                   	pop    %rbp
  8001f7:	c3                   	retq   

00000000008001f8 <strlen>:
  8001f8:	55                   	push   %rbp
  8001f9:	48 89 e5             	mov    %rsp,%rbp
  8001fc:	48 83 ec 18          	sub    $0x18,%rsp
  800200:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800204:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80020b:	eb 09                	jmp    800216 <strlen+0x1e>
  80020d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800211:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800216:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80021a:	0f b6 00             	movzbl (%rax),%eax
  80021d:	84 c0                	test   %al,%al
  80021f:	75 ec                	jne    80020d <strlen+0x15>
  800221:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800224:	c9                   	leaveq 
  800225:	c3                   	retq   

0000000000800226 <strnlen>:
  800226:	55                   	push   %rbp
  800227:	48 89 e5             	mov    %rsp,%rbp
  80022a:	48 83 ec 20          	sub    $0x20,%rsp
  80022e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800232:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800236:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80023d:	eb 0e                	jmp    80024d <strnlen+0x27>
  80023f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800243:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800248:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80024d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800252:	74 0b                	je     80025f <strnlen+0x39>
  800254:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800258:	0f b6 00             	movzbl (%rax),%eax
  80025b:	84 c0                	test   %al,%al
  80025d:	75 e0                	jne    80023f <strnlen+0x19>
  80025f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800262:	c9                   	leaveq 
  800263:	c3                   	retq   

0000000000800264 <strcpy>:
  800264:	55                   	push   %rbp
  800265:	48 89 e5             	mov    %rsp,%rbp
  800268:	48 83 ec 20          	sub    $0x20,%rsp
  80026c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800270:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800274:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800278:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80027c:	90                   	nop
  80027d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800281:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800285:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800289:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80028d:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800291:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800295:	0f b6 12             	movzbl (%rdx),%edx
  800298:	88 10                	mov    %dl,(%rax)
  80029a:	0f b6 00             	movzbl (%rax),%eax
  80029d:	84 c0                	test   %al,%al
  80029f:	75 dc                	jne    80027d <strcpy+0x19>
  8002a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8002a5:	c9                   	leaveq 
  8002a6:	c3                   	retq   

00000000008002a7 <strcat>:
  8002a7:	55                   	push   %rbp
  8002a8:	48 89 e5             	mov    %rsp,%rbp
  8002ab:	48 83 ec 20          	sub    $0x20,%rsp
  8002af:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8002b3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8002b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002bb:	48 89 c7             	mov    %rax,%rdi
  8002be:	48 b8 f8 01 80 00 00 	movabs $0x8001f8,%rax
  8002c5:	00 00 00 
  8002c8:	ff d0                	callq  *%rax
  8002ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8002cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002d0:	48 63 d0             	movslq %eax,%rdx
  8002d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002d7:	48 01 c2             	add    %rax,%rdx
  8002da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8002de:	48 89 c6             	mov    %rax,%rsi
  8002e1:	48 89 d7             	mov    %rdx,%rdi
  8002e4:	48 b8 64 02 80 00 00 	movabs $0x800264,%rax
  8002eb:	00 00 00 
  8002ee:	ff d0                	callq  *%rax
  8002f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002f4:	c9                   	leaveq 
  8002f5:	c3                   	retq   

00000000008002f6 <strncpy>:
  8002f6:	55                   	push   %rbp
  8002f7:	48 89 e5             	mov    %rsp,%rbp
  8002fa:	48 83 ec 28          	sub    $0x28,%rsp
  8002fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800302:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800306:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80030a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80030e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800312:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  800319:	00 
  80031a:	eb 2a                	jmp    800346 <strncpy+0x50>
  80031c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800320:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800324:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800328:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80032c:	0f b6 12             	movzbl (%rdx),%edx
  80032f:	88 10                	mov    %dl,(%rax)
  800331:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800335:	0f b6 00             	movzbl (%rax),%eax
  800338:	84 c0                	test   %al,%al
  80033a:	74 05                	je     800341 <strncpy+0x4b>
  80033c:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  800341:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800346:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80034a:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80034e:	72 cc                	jb     80031c <strncpy+0x26>
  800350:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800354:	c9                   	leaveq 
  800355:	c3                   	retq   

0000000000800356 <strlcpy>:
  800356:	55                   	push   %rbp
  800357:	48 89 e5             	mov    %rsp,%rbp
  80035a:	48 83 ec 28          	sub    $0x28,%rsp
  80035e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800362:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800366:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80036a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80036e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800372:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800377:	74 3d                	je     8003b6 <strlcpy+0x60>
  800379:	eb 1d                	jmp    800398 <strlcpy+0x42>
  80037b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80037f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800383:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800387:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80038b:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80038f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800393:	0f b6 12             	movzbl (%rdx),%edx
  800396:	88 10                	mov    %dl,(%rax)
  800398:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80039d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8003a2:	74 0b                	je     8003af <strlcpy+0x59>
  8003a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8003a8:	0f b6 00             	movzbl (%rax),%eax
  8003ab:	84 c0                	test   %al,%al
  8003ad:	75 cc                	jne    80037b <strlcpy+0x25>
  8003af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8003b3:	c6 00 00             	movb   $0x0,(%rax)
  8003b6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8003ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003be:	48 29 c2             	sub    %rax,%rdx
  8003c1:	48 89 d0             	mov    %rdx,%rax
  8003c4:	c9                   	leaveq 
  8003c5:	c3                   	retq   

00000000008003c6 <strcmp>:
  8003c6:	55                   	push   %rbp
  8003c7:	48 89 e5             	mov    %rsp,%rbp
  8003ca:	48 83 ec 10          	sub    $0x10,%rsp
  8003ce:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8003d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003d6:	eb 0a                	jmp    8003e2 <strcmp+0x1c>
  8003d8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8003dd:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8003e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003e6:	0f b6 00             	movzbl (%rax),%eax
  8003e9:	84 c0                	test   %al,%al
  8003eb:	74 12                	je     8003ff <strcmp+0x39>
  8003ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003f1:	0f b6 10             	movzbl (%rax),%edx
  8003f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f8:	0f b6 00             	movzbl (%rax),%eax
  8003fb:	38 c2                	cmp    %al,%dl
  8003fd:	74 d9                	je     8003d8 <strcmp+0x12>
  8003ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800403:	0f b6 00             	movzbl (%rax),%eax
  800406:	0f b6 d0             	movzbl %al,%edx
  800409:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80040d:	0f b6 00             	movzbl (%rax),%eax
  800410:	0f b6 c0             	movzbl %al,%eax
  800413:	29 c2                	sub    %eax,%edx
  800415:	89 d0                	mov    %edx,%eax
  800417:	c9                   	leaveq 
  800418:	c3                   	retq   

0000000000800419 <strncmp>:
  800419:	55                   	push   %rbp
  80041a:	48 89 e5             	mov    %rsp,%rbp
  80041d:	48 83 ec 18          	sub    $0x18,%rsp
  800421:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800425:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800429:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80042d:	eb 0f                	jmp    80043e <strncmp+0x25>
  80042f:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  800434:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800439:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80043e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800443:	74 1d                	je     800462 <strncmp+0x49>
  800445:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800449:	0f b6 00             	movzbl (%rax),%eax
  80044c:	84 c0                	test   %al,%al
  80044e:	74 12                	je     800462 <strncmp+0x49>
  800450:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800454:	0f b6 10             	movzbl (%rax),%edx
  800457:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80045b:	0f b6 00             	movzbl (%rax),%eax
  80045e:	38 c2                	cmp    %al,%dl
  800460:	74 cd                	je     80042f <strncmp+0x16>
  800462:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800467:	75 07                	jne    800470 <strncmp+0x57>
  800469:	b8 00 00 00 00       	mov    $0x0,%eax
  80046e:	eb 18                	jmp    800488 <strncmp+0x6f>
  800470:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800474:	0f b6 00             	movzbl (%rax),%eax
  800477:	0f b6 d0             	movzbl %al,%edx
  80047a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80047e:	0f b6 00             	movzbl (%rax),%eax
  800481:	0f b6 c0             	movzbl %al,%eax
  800484:	29 c2                	sub    %eax,%edx
  800486:	89 d0                	mov    %edx,%eax
  800488:	c9                   	leaveq 
  800489:	c3                   	retq   

000000000080048a <strchr>:
  80048a:	55                   	push   %rbp
  80048b:	48 89 e5             	mov    %rsp,%rbp
  80048e:	48 83 ec 0c          	sub    $0xc,%rsp
  800492:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800496:	89 f0                	mov    %esi,%eax
  800498:	88 45 f4             	mov    %al,-0xc(%rbp)
  80049b:	eb 17                	jmp    8004b4 <strchr+0x2a>
  80049d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004a1:	0f b6 00             	movzbl (%rax),%eax
  8004a4:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8004a7:	75 06                	jne    8004af <strchr+0x25>
  8004a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004ad:	eb 15                	jmp    8004c4 <strchr+0x3a>
  8004af:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8004b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004b8:	0f b6 00             	movzbl (%rax),%eax
  8004bb:	84 c0                	test   %al,%al
  8004bd:	75 de                	jne    80049d <strchr+0x13>
  8004bf:	b8 00 00 00 00       	mov    $0x0,%eax
  8004c4:	c9                   	leaveq 
  8004c5:	c3                   	retq   

00000000008004c6 <strfind>:
  8004c6:	55                   	push   %rbp
  8004c7:	48 89 e5             	mov    %rsp,%rbp
  8004ca:	48 83 ec 0c          	sub    $0xc,%rsp
  8004ce:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8004d2:	89 f0                	mov    %esi,%eax
  8004d4:	88 45 f4             	mov    %al,-0xc(%rbp)
  8004d7:	eb 13                	jmp    8004ec <strfind+0x26>
  8004d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004dd:	0f b6 00             	movzbl (%rax),%eax
  8004e0:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8004e3:	75 02                	jne    8004e7 <strfind+0x21>
  8004e5:	eb 10                	jmp    8004f7 <strfind+0x31>
  8004e7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8004ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004f0:	0f b6 00             	movzbl (%rax),%eax
  8004f3:	84 c0                	test   %al,%al
  8004f5:	75 e2                	jne    8004d9 <strfind+0x13>
  8004f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004fb:	c9                   	leaveq 
  8004fc:	c3                   	retq   

00000000008004fd <memset>:
  8004fd:	55                   	push   %rbp
  8004fe:	48 89 e5             	mov    %rsp,%rbp
  800501:	48 83 ec 18          	sub    $0x18,%rsp
  800505:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800509:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80050c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800510:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800515:	75 06                	jne    80051d <memset+0x20>
  800517:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80051b:	eb 69                	jmp    800586 <memset+0x89>
  80051d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800521:	83 e0 03             	and    $0x3,%eax
  800524:	48 85 c0             	test   %rax,%rax
  800527:	75 48                	jne    800571 <memset+0x74>
  800529:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80052d:	83 e0 03             	and    $0x3,%eax
  800530:	48 85 c0             	test   %rax,%rax
  800533:	75 3c                	jne    800571 <memset+0x74>
  800535:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80053c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80053f:	c1 e0 18             	shl    $0x18,%eax
  800542:	89 c2                	mov    %eax,%edx
  800544:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800547:	c1 e0 10             	shl    $0x10,%eax
  80054a:	09 c2                	or     %eax,%edx
  80054c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80054f:	c1 e0 08             	shl    $0x8,%eax
  800552:	09 d0                	or     %edx,%eax
  800554:	09 45 f4             	or     %eax,-0xc(%rbp)
  800557:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80055b:	48 c1 e8 02          	shr    $0x2,%rax
  80055f:	48 89 c1             	mov    %rax,%rcx
  800562:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800566:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800569:	48 89 d7             	mov    %rdx,%rdi
  80056c:	fc                   	cld    
  80056d:	f3 ab                	rep stos %eax,%es:(%rdi)
  80056f:	eb 11                	jmp    800582 <memset+0x85>
  800571:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800575:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800578:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80057c:	48 89 d7             	mov    %rdx,%rdi
  80057f:	fc                   	cld    
  800580:	f3 aa                	rep stos %al,%es:(%rdi)
  800582:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800586:	c9                   	leaveq 
  800587:	c3                   	retq   

0000000000800588 <memmove>:
  800588:	55                   	push   %rbp
  800589:	48 89 e5             	mov    %rsp,%rbp
  80058c:	48 83 ec 28          	sub    $0x28,%rsp
  800590:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800594:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800598:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80059c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8005a0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005a8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8005ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005b0:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8005b4:	0f 83 88 00 00 00    	jae    800642 <memmove+0xba>
  8005ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005be:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8005c2:	48 01 d0             	add    %rdx,%rax
  8005c5:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8005c9:	76 77                	jbe    800642 <memmove+0xba>
  8005cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005cf:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8005d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005d7:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8005db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005df:	83 e0 03             	and    $0x3,%eax
  8005e2:	48 85 c0             	test   %rax,%rax
  8005e5:	75 3b                	jne    800622 <memmove+0x9a>
  8005e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005eb:	83 e0 03             	and    $0x3,%eax
  8005ee:	48 85 c0             	test   %rax,%rax
  8005f1:	75 2f                	jne    800622 <memmove+0x9a>
  8005f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005f7:	83 e0 03             	and    $0x3,%eax
  8005fa:	48 85 c0             	test   %rax,%rax
  8005fd:	75 23                	jne    800622 <memmove+0x9a>
  8005ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800603:	48 83 e8 04          	sub    $0x4,%rax
  800607:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80060b:	48 83 ea 04          	sub    $0x4,%rdx
  80060f:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  800613:	48 c1 e9 02          	shr    $0x2,%rcx
  800617:	48 89 c7             	mov    %rax,%rdi
  80061a:	48 89 d6             	mov    %rdx,%rsi
  80061d:	fd                   	std    
  80061e:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  800620:	eb 1d                	jmp    80063f <memmove+0xb7>
  800622:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800626:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80062a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80062e:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  800632:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800636:	48 89 d7             	mov    %rdx,%rdi
  800639:	48 89 c1             	mov    %rax,%rcx
  80063c:	fd                   	std    
  80063d:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80063f:	fc                   	cld    
  800640:	eb 57                	jmp    800699 <memmove+0x111>
  800642:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800646:	83 e0 03             	and    $0x3,%eax
  800649:	48 85 c0             	test   %rax,%rax
  80064c:	75 36                	jne    800684 <memmove+0xfc>
  80064e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800652:	83 e0 03             	and    $0x3,%eax
  800655:	48 85 c0             	test   %rax,%rax
  800658:	75 2a                	jne    800684 <memmove+0xfc>
  80065a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80065e:	83 e0 03             	and    $0x3,%eax
  800661:	48 85 c0             	test   %rax,%rax
  800664:	75 1e                	jne    800684 <memmove+0xfc>
  800666:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80066a:	48 c1 e8 02          	shr    $0x2,%rax
  80066e:	48 89 c1             	mov    %rax,%rcx
  800671:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800675:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800679:	48 89 c7             	mov    %rax,%rdi
  80067c:	48 89 d6             	mov    %rdx,%rsi
  80067f:	fc                   	cld    
  800680:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  800682:	eb 15                	jmp    800699 <memmove+0x111>
  800684:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800688:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80068c:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  800690:	48 89 c7             	mov    %rax,%rdi
  800693:	48 89 d6             	mov    %rdx,%rsi
  800696:	fc                   	cld    
  800697:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  800699:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80069d:	c9                   	leaveq 
  80069e:	c3                   	retq   

000000000080069f <memcpy>:
  80069f:	55                   	push   %rbp
  8006a0:	48 89 e5             	mov    %rsp,%rbp
  8006a3:	48 83 ec 18          	sub    $0x18,%rsp
  8006a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8006ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006af:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8006b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b7:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8006bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006bf:	48 89 ce             	mov    %rcx,%rsi
  8006c2:	48 89 c7             	mov    %rax,%rdi
  8006c5:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  8006cc:	00 00 00 
  8006cf:	ff d0                	callq  *%rax
  8006d1:	c9                   	leaveq 
  8006d2:	c3                   	retq   

00000000008006d3 <memcmp>:
  8006d3:	55                   	push   %rbp
  8006d4:	48 89 e5             	mov    %rsp,%rbp
  8006d7:	48 83 ec 28          	sub    $0x28,%rsp
  8006db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8006e3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8006e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006eb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006ef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8006f3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8006f7:	eb 36                	jmp    80072f <memcmp+0x5c>
  8006f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006fd:	0f b6 10             	movzbl (%rax),%edx
  800700:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800704:	0f b6 00             	movzbl (%rax),%eax
  800707:	38 c2                	cmp    %al,%dl
  800709:	74 1a                	je     800725 <memcmp+0x52>
  80070b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80070f:	0f b6 00             	movzbl (%rax),%eax
  800712:	0f b6 d0             	movzbl %al,%edx
  800715:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800719:	0f b6 00             	movzbl (%rax),%eax
  80071c:	0f b6 c0             	movzbl %al,%eax
  80071f:	29 c2                	sub    %eax,%edx
  800721:	89 d0                	mov    %edx,%eax
  800723:	eb 20                	jmp    800745 <memcmp+0x72>
  800725:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80072a:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80072f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800733:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800737:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80073b:	48 85 c0             	test   %rax,%rax
  80073e:	75 b9                	jne    8006f9 <memcmp+0x26>
  800740:	b8 00 00 00 00       	mov    $0x0,%eax
  800745:	c9                   	leaveq 
  800746:	c3                   	retq   

0000000000800747 <memfind>:
  800747:	55                   	push   %rbp
  800748:	48 89 e5             	mov    %rsp,%rbp
  80074b:	48 83 ec 28          	sub    $0x28,%rsp
  80074f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800753:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800756:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80075a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80075e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800762:	48 01 d0             	add    %rdx,%rax
  800765:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800769:	eb 15                	jmp    800780 <memfind+0x39>
  80076b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80076f:	0f b6 10             	movzbl (%rax),%edx
  800772:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800775:	38 c2                	cmp    %al,%dl
  800777:	75 02                	jne    80077b <memfind+0x34>
  800779:	eb 0f                	jmp    80078a <memfind+0x43>
  80077b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800780:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800784:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  800788:	72 e1                	jb     80076b <memfind+0x24>
  80078a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078e:	c9                   	leaveq 
  80078f:	c3                   	retq   

0000000000800790 <strtol>:
  800790:	55                   	push   %rbp
  800791:	48 89 e5             	mov    %rsp,%rbp
  800794:	48 83 ec 34          	sub    $0x34,%rsp
  800798:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80079c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8007a0:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8007a3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8007aa:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8007b1:	00 
  8007b2:	eb 05                	jmp    8007b9 <strtol+0x29>
  8007b4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8007b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007bd:	0f b6 00             	movzbl (%rax),%eax
  8007c0:	3c 20                	cmp    $0x20,%al
  8007c2:	74 f0                	je     8007b4 <strtol+0x24>
  8007c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007c8:	0f b6 00             	movzbl (%rax),%eax
  8007cb:	3c 09                	cmp    $0x9,%al
  8007cd:	74 e5                	je     8007b4 <strtol+0x24>
  8007cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007d3:	0f b6 00             	movzbl (%rax),%eax
  8007d6:	3c 2b                	cmp    $0x2b,%al
  8007d8:	75 07                	jne    8007e1 <strtol+0x51>
  8007da:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8007df:	eb 17                	jmp    8007f8 <strtol+0x68>
  8007e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007e5:	0f b6 00             	movzbl (%rax),%eax
  8007e8:	3c 2d                	cmp    $0x2d,%al
  8007ea:	75 0c                	jne    8007f8 <strtol+0x68>
  8007ec:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8007f1:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8007f8:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8007fc:	74 06                	je     800804 <strtol+0x74>
  8007fe:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  800802:	75 28                	jne    80082c <strtol+0x9c>
  800804:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800808:	0f b6 00             	movzbl (%rax),%eax
  80080b:	3c 30                	cmp    $0x30,%al
  80080d:	75 1d                	jne    80082c <strtol+0x9c>
  80080f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800813:	48 83 c0 01          	add    $0x1,%rax
  800817:	0f b6 00             	movzbl (%rax),%eax
  80081a:	3c 78                	cmp    $0x78,%al
  80081c:	75 0e                	jne    80082c <strtol+0x9c>
  80081e:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  800823:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80082a:	eb 2c                	jmp    800858 <strtol+0xc8>
  80082c:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  800830:	75 19                	jne    80084b <strtol+0xbb>
  800832:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800836:	0f b6 00             	movzbl (%rax),%eax
  800839:	3c 30                	cmp    $0x30,%al
  80083b:	75 0e                	jne    80084b <strtol+0xbb>
  80083d:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  800842:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  800849:	eb 0d                	jmp    800858 <strtol+0xc8>
  80084b:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80084f:	75 07                	jne    800858 <strtol+0xc8>
  800851:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  800858:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80085c:	0f b6 00             	movzbl (%rax),%eax
  80085f:	3c 2f                	cmp    $0x2f,%al
  800861:	7e 1d                	jle    800880 <strtol+0xf0>
  800863:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800867:	0f b6 00             	movzbl (%rax),%eax
  80086a:	3c 39                	cmp    $0x39,%al
  80086c:	7f 12                	jg     800880 <strtol+0xf0>
  80086e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800872:	0f b6 00             	movzbl (%rax),%eax
  800875:	0f be c0             	movsbl %al,%eax
  800878:	83 e8 30             	sub    $0x30,%eax
  80087b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80087e:	eb 4e                	jmp    8008ce <strtol+0x13e>
  800880:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800884:	0f b6 00             	movzbl (%rax),%eax
  800887:	3c 60                	cmp    $0x60,%al
  800889:	7e 1d                	jle    8008a8 <strtol+0x118>
  80088b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80088f:	0f b6 00             	movzbl (%rax),%eax
  800892:	3c 7a                	cmp    $0x7a,%al
  800894:	7f 12                	jg     8008a8 <strtol+0x118>
  800896:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80089a:	0f b6 00             	movzbl (%rax),%eax
  80089d:	0f be c0             	movsbl %al,%eax
  8008a0:	83 e8 57             	sub    $0x57,%eax
  8008a3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8008a6:	eb 26                	jmp    8008ce <strtol+0x13e>
  8008a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8008ac:	0f b6 00             	movzbl (%rax),%eax
  8008af:	3c 40                	cmp    $0x40,%al
  8008b1:	7e 48                	jle    8008fb <strtol+0x16b>
  8008b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8008b7:	0f b6 00             	movzbl (%rax),%eax
  8008ba:	3c 5a                	cmp    $0x5a,%al
  8008bc:	7f 3d                	jg     8008fb <strtol+0x16b>
  8008be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8008c2:	0f b6 00             	movzbl (%rax),%eax
  8008c5:	0f be c0             	movsbl %al,%eax
  8008c8:	83 e8 37             	sub    $0x37,%eax
  8008cb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8008ce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8008d1:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8008d4:	7c 02                	jl     8008d8 <strtol+0x148>
  8008d6:	eb 23                	jmp    8008fb <strtol+0x16b>
  8008d8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8008dd:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8008e0:	48 98                	cltq   
  8008e2:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8008e7:	48 89 c2             	mov    %rax,%rdx
  8008ea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8008ed:	48 98                	cltq   
  8008ef:	48 01 d0             	add    %rdx,%rax
  8008f2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8008f6:	e9 5d ff ff ff       	jmpq   800858 <strtol+0xc8>
  8008fb:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  800900:	74 0b                	je     80090d <strtol+0x17d>
  800902:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800906:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80090a:	48 89 10             	mov    %rdx,(%rax)
  80090d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800911:	74 09                	je     80091c <strtol+0x18c>
  800913:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800917:	48 f7 d8             	neg    %rax
  80091a:	eb 04                	jmp    800920 <strtol+0x190>
  80091c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800920:	c9                   	leaveq 
  800921:	c3                   	retq   

0000000000800922 <strstr>:
  800922:	55                   	push   %rbp
  800923:	48 89 e5             	mov    %rsp,%rbp
  800926:	48 83 ec 30          	sub    $0x30,%rsp
  80092a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80092e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800932:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800936:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80093a:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80093e:	0f b6 00             	movzbl (%rax),%eax
  800941:	88 45 ff             	mov    %al,-0x1(%rbp)
  800944:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  800948:	75 06                	jne    800950 <strstr+0x2e>
  80094a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80094e:	eb 6b                	jmp    8009bb <strstr+0x99>
  800950:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800954:	48 89 c7             	mov    %rax,%rdi
  800957:	48 b8 f8 01 80 00 00 	movabs $0x8001f8,%rax
  80095e:	00 00 00 
  800961:	ff d0                	callq  *%rax
  800963:	48 98                	cltq   
  800965:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800969:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80096d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800971:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800975:	0f b6 00             	movzbl (%rax),%eax
  800978:	88 45 ef             	mov    %al,-0x11(%rbp)
  80097b:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80097f:	75 07                	jne    800988 <strstr+0x66>
  800981:	b8 00 00 00 00       	mov    $0x0,%eax
  800986:	eb 33                	jmp    8009bb <strstr+0x99>
  800988:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80098c:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80098f:	75 d8                	jne    800969 <strstr+0x47>
  800991:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800995:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  800999:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80099d:	48 89 ce             	mov    %rcx,%rsi
  8009a0:	48 89 c7             	mov    %rax,%rdi
  8009a3:	48 b8 19 04 80 00 00 	movabs $0x800419,%rax
  8009aa:	00 00 00 
  8009ad:	ff d0                	callq  *%rax
  8009af:	85 c0                	test   %eax,%eax
  8009b1:	75 b6                	jne    800969 <strstr+0x47>
  8009b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009b7:	48 83 e8 01          	sub    $0x1,%rax
  8009bb:	c9                   	leaveq 
  8009bc:	c3                   	retq   

00000000008009bd <syscall>:
  8009bd:	55                   	push   %rbp
  8009be:	48 89 e5             	mov    %rsp,%rbp
  8009c1:	53                   	push   %rbx
  8009c2:	48 83 ec 48          	sub    $0x48,%rsp
  8009c6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8009c9:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8009cc:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8009d0:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8009d4:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8009d8:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8009dc:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8009df:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8009e3:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8009e7:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8009eb:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8009ef:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8009f3:	4c 89 c3             	mov    %r8,%rbx
  8009f6:	cd 30                	int    $0x30
  8009f8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8009fc:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a00:	74 3e                	je     800a40 <syscall+0x83>
  800a02:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800a07:	7e 37                	jle    800a40 <syscall+0x83>
  800a09:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a0d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800a10:	49 89 d0             	mov    %rdx,%r8
  800a13:	89 c1                	mov    %eax,%ecx
  800a15:	48 ba 11 41 80 00 00 	movabs $0x804111,%rdx
  800a1c:	00 00 00 
  800a1f:	be 24 00 00 00       	mov    $0x24,%esi
  800a24:	48 bf 2e 41 80 00 00 	movabs $0x80412e,%rdi
  800a2b:	00 00 00 
  800a2e:	b8 00 00 00 00       	mov    $0x0,%eax
  800a33:	49 b9 24 31 80 00 00 	movabs $0x803124,%r9
  800a3a:	00 00 00 
  800a3d:	41 ff d1             	callq  *%r9
  800a40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a44:	48 83 c4 48          	add    $0x48,%rsp
  800a48:	5b                   	pop    %rbx
  800a49:	5d                   	pop    %rbp
  800a4a:	c3                   	retq   

0000000000800a4b <sys_cputs>:
  800a4b:	55                   	push   %rbp
  800a4c:	48 89 e5             	mov    %rsp,%rbp
  800a4f:	48 83 ec 20          	sub    $0x20,%rsp
  800a53:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800a57:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a5b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a5f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800a63:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800a6a:	00 
  800a6b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800a71:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800a77:	48 89 d1             	mov    %rdx,%rcx
  800a7a:	48 89 c2             	mov    %rax,%rdx
  800a7d:	be 00 00 00 00       	mov    $0x0,%esi
  800a82:	bf 00 00 00 00       	mov    $0x0,%edi
  800a87:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800a8e:	00 00 00 
  800a91:	ff d0                	callq  *%rax
  800a93:	c9                   	leaveq 
  800a94:	c3                   	retq   

0000000000800a95 <sys_cgetc>:
  800a95:	55                   	push   %rbp
  800a96:	48 89 e5             	mov    %rsp,%rbp
  800a99:	48 83 ec 10          	sub    $0x10,%rsp
  800a9d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800aa4:	00 
  800aa5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800aab:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800ab1:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ab6:	ba 00 00 00 00       	mov    $0x0,%edx
  800abb:	be 00 00 00 00       	mov    $0x0,%esi
  800ac0:	bf 01 00 00 00       	mov    $0x1,%edi
  800ac5:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800acc:	00 00 00 
  800acf:	ff d0                	callq  *%rax
  800ad1:	c9                   	leaveq 
  800ad2:	c3                   	retq   

0000000000800ad3 <sys_env_destroy>:
  800ad3:	55                   	push   %rbp
  800ad4:	48 89 e5             	mov    %rsp,%rbp
  800ad7:	48 83 ec 10          	sub    $0x10,%rsp
  800adb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800ade:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ae1:	48 98                	cltq   
  800ae3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800aea:	00 
  800aeb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800af1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800af7:	b9 00 00 00 00       	mov    $0x0,%ecx
  800afc:	48 89 c2             	mov    %rax,%rdx
  800aff:	be 01 00 00 00       	mov    $0x1,%esi
  800b04:	bf 03 00 00 00       	mov    $0x3,%edi
  800b09:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800b10:	00 00 00 
  800b13:	ff d0                	callq  *%rax
  800b15:	c9                   	leaveq 
  800b16:	c3                   	retq   

0000000000800b17 <sys_getenvid>:
  800b17:	55                   	push   %rbp
  800b18:	48 89 e5             	mov    %rsp,%rbp
  800b1b:	48 83 ec 10          	sub    $0x10,%rsp
  800b1f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800b26:	00 
  800b27:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800b2d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800b33:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b38:	ba 00 00 00 00       	mov    $0x0,%edx
  800b3d:	be 00 00 00 00       	mov    $0x0,%esi
  800b42:	bf 02 00 00 00       	mov    $0x2,%edi
  800b47:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800b4e:	00 00 00 
  800b51:	ff d0                	callq  *%rax
  800b53:	c9                   	leaveq 
  800b54:	c3                   	retq   

0000000000800b55 <sys_yield>:
  800b55:	55                   	push   %rbp
  800b56:	48 89 e5             	mov    %rsp,%rbp
  800b59:	48 83 ec 10          	sub    $0x10,%rsp
  800b5d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800b64:	00 
  800b65:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800b6b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800b71:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b76:	ba 00 00 00 00       	mov    $0x0,%edx
  800b7b:	be 00 00 00 00       	mov    $0x0,%esi
  800b80:	bf 0b 00 00 00       	mov    $0xb,%edi
  800b85:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800b8c:	00 00 00 
  800b8f:	ff d0                	callq  *%rax
  800b91:	c9                   	leaveq 
  800b92:	c3                   	retq   

0000000000800b93 <sys_page_alloc>:
  800b93:	55                   	push   %rbp
  800b94:	48 89 e5             	mov    %rsp,%rbp
  800b97:	48 83 ec 20          	sub    $0x20,%rsp
  800b9b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800b9e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ba2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800ba5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800ba8:	48 63 c8             	movslq %eax,%rcx
  800bab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800baf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800bb2:	48 98                	cltq   
  800bb4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800bbb:	00 
  800bbc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800bc2:	49 89 c8             	mov    %rcx,%r8
  800bc5:	48 89 d1             	mov    %rdx,%rcx
  800bc8:	48 89 c2             	mov    %rax,%rdx
  800bcb:	be 01 00 00 00       	mov    $0x1,%esi
  800bd0:	bf 04 00 00 00       	mov    $0x4,%edi
  800bd5:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800bdc:	00 00 00 
  800bdf:	ff d0                	callq  *%rax
  800be1:	c9                   	leaveq 
  800be2:	c3                   	retq   

0000000000800be3 <sys_page_map>:
  800be3:	55                   	push   %rbp
  800be4:	48 89 e5             	mov    %rsp,%rbp
  800be7:	48 83 ec 30          	sub    $0x30,%rsp
  800beb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800bee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800bf2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800bf5:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  800bf9:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  800bfd:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800c00:	48 63 c8             	movslq %eax,%rcx
  800c03:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  800c07:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800c0a:	48 63 f0             	movslq %eax,%rsi
  800c0d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800c14:	48 98                	cltq   
  800c16:	48 89 0c 24          	mov    %rcx,(%rsp)
  800c1a:	49 89 f9             	mov    %rdi,%r9
  800c1d:	49 89 f0             	mov    %rsi,%r8
  800c20:	48 89 d1             	mov    %rdx,%rcx
  800c23:	48 89 c2             	mov    %rax,%rdx
  800c26:	be 01 00 00 00       	mov    $0x1,%esi
  800c2b:	bf 05 00 00 00       	mov    $0x5,%edi
  800c30:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800c37:	00 00 00 
  800c3a:	ff d0                	callq  *%rax
  800c3c:	c9                   	leaveq 
  800c3d:	c3                   	retq   

0000000000800c3e <sys_page_unmap>:
  800c3e:	55                   	push   %rbp
  800c3f:	48 89 e5             	mov    %rsp,%rbp
  800c42:	48 83 ec 20          	sub    $0x20,%rsp
  800c46:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c49:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c4d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c51:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800c54:	48 98                	cltq   
  800c56:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800c5d:	00 
  800c5e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800c64:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800c6a:	48 89 d1             	mov    %rdx,%rcx
  800c6d:	48 89 c2             	mov    %rax,%rdx
  800c70:	be 01 00 00 00       	mov    $0x1,%esi
  800c75:	bf 06 00 00 00       	mov    $0x6,%edi
  800c7a:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800c81:	00 00 00 
  800c84:	ff d0                	callq  *%rax
  800c86:	c9                   	leaveq 
  800c87:	c3                   	retq   

0000000000800c88 <sys_env_set_status>:
  800c88:	55                   	push   %rbp
  800c89:	48 89 e5             	mov    %rsp,%rbp
  800c8c:	48 83 ec 10          	sub    $0x10,%rsp
  800c90:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c93:	89 75 f8             	mov    %esi,-0x8(%rbp)
  800c96:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800c99:	48 63 d0             	movslq %eax,%rdx
  800c9c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800c9f:	48 98                	cltq   
  800ca1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800ca8:	00 
  800ca9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800caf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800cb5:	48 89 d1             	mov    %rdx,%rcx
  800cb8:	48 89 c2             	mov    %rax,%rdx
  800cbb:	be 01 00 00 00       	mov    $0x1,%esi
  800cc0:	bf 08 00 00 00       	mov    $0x8,%edi
  800cc5:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800ccc:	00 00 00 
  800ccf:	ff d0                	callq  *%rax
  800cd1:	c9                   	leaveq 
  800cd2:	c3                   	retq   

0000000000800cd3 <sys_env_set_trapframe>:
  800cd3:	55                   	push   %rbp
  800cd4:	48 89 e5             	mov    %rsp,%rbp
  800cd7:	48 83 ec 20          	sub    $0x20,%rsp
  800cdb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800cde:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ce2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ce6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ce9:	48 98                	cltq   
  800ceb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800cf2:	00 
  800cf3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800cf9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800cff:	48 89 d1             	mov    %rdx,%rcx
  800d02:	48 89 c2             	mov    %rax,%rdx
  800d05:	be 01 00 00 00       	mov    $0x1,%esi
  800d0a:	bf 09 00 00 00       	mov    $0x9,%edi
  800d0f:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800d16:	00 00 00 
  800d19:	ff d0                	callq  *%rax
  800d1b:	c9                   	leaveq 
  800d1c:	c3                   	retq   

0000000000800d1d <sys_env_set_pgfault_upcall>:
  800d1d:	55                   	push   %rbp
  800d1e:	48 89 e5             	mov    %rsp,%rbp
  800d21:	48 83 ec 20          	sub    $0x20,%rsp
  800d25:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d28:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d2c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d30:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d33:	48 98                	cltq   
  800d35:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800d3c:	00 
  800d3d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800d43:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800d49:	48 89 d1             	mov    %rdx,%rcx
  800d4c:	48 89 c2             	mov    %rax,%rdx
  800d4f:	be 01 00 00 00       	mov    $0x1,%esi
  800d54:	bf 0a 00 00 00       	mov    $0xa,%edi
  800d59:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800d60:	00 00 00 
  800d63:	ff d0                	callq  *%rax
  800d65:	c9                   	leaveq 
  800d66:	c3                   	retq   

0000000000800d67 <sys_ipc_try_send>:
  800d67:	55                   	push   %rbp
  800d68:	48 89 e5             	mov    %rsp,%rbp
  800d6b:	48 83 ec 20          	sub    $0x20,%rsp
  800d6f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d72:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d76:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800d7a:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  800d7d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800d80:	48 63 f0             	movslq %eax,%rsi
  800d83:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800d87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d8a:	48 98                	cltq   
  800d8c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d90:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800d97:	00 
  800d98:	49 89 f1             	mov    %rsi,%r9
  800d9b:	49 89 c8             	mov    %rcx,%r8
  800d9e:	48 89 d1             	mov    %rdx,%rcx
  800da1:	48 89 c2             	mov    %rax,%rdx
  800da4:	be 00 00 00 00       	mov    $0x0,%esi
  800da9:	bf 0c 00 00 00       	mov    $0xc,%edi
  800dae:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800db5:	00 00 00 
  800db8:	ff d0                	callq  *%rax
  800dba:	c9                   	leaveq 
  800dbb:	c3                   	retq   

0000000000800dbc <sys_ipc_recv>:
  800dbc:	55                   	push   %rbp
  800dbd:	48 89 e5             	mov    %rsp,%rbp
  800dc0:	48 83 ec 10          	sub    $0x10,%rsp
  800dc4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800dc8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800dcc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800dd3:	00 
  800dd4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800dda:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800de0:	b9 00 00 00 00       	mov    $0x0,%ecx
  800de5:	48 89 c2             	mov    %rax,%rdx
  800de8:	be 01 00 00 00       	mov    $0x1,%esi
  800ded:	bf 0d 00 00 00       	mov    $0xd,%edi
  800df2:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800df9:	00 00 00 
  800dfc:	ff d0                	callq  *%rax
  800dfe:	c9                   	leaveq 
  800dff:	c3                   	retq   

0000000000800e00 <sys_time_msec>:
  800e00:	55                   	push   %rbp
  800e01:	48 89 e5             	mov    %rsp,%rbp
  800e04:	48 83 ec 10          	sub    $0x10,%rsp
  800e08:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800e0f:	00 
  800e10:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800e16:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800e1c:	b9 00 00 00 00       	mov    $0x0,%ecx
  800e21:	ba 00 00 00 00       	mov    $0x0,%edx
  800e26:	be 00 00 00 00       	mov    $0x0,%esi
  800e2b:	bf 0e 00 00 00       	mov    $0xe,%edi
  800e30:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800e37:	00 00 00 
  800e3a:	ff d0                	callq  *%rax
  800e3c:	c9                   	leaveq 
  800e3d:	c3                   	retq   

0000000000800e3e <sys_net_transmit>:
  800e3e:	55                   	push   %rbp
  800e3f:	48 89 e5             	mov    %rsp,%rbp
  800e42:	48 83 ec 20          	sub    $0x20,%rsp
  800e46:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800e4a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  800e4d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800e50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800e54:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800e5b:	00 
  800e5c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800e62:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800e68:	48 89 d1             	mov    %rdx,%rcx
  800e6b:	48 89 c2             	mov    %rax,%rdx
  800e6e:	be 00 00 00 00       	mov    $0x0,%esi
  800e73:	bf 0f 00 00 00       	mov    $0xf,%edi
  800e78:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800e7f:	00 00 00 
  800e82:	ff d0                	callq  *%rax
  800e84:	c9                   	leaveq 
  800e85:	c3                   	retq   

0000000000800e86 <sys_net_receive>:
  800e86:	55                   	push   %rbp
  800e87:	48 89 e5             	mov    %rsp,%rbp
  800e8a:	48 83 ec 20          	sub    $0x20,%rsp
  800e8e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800e92:	89 75 f4             	mov    %esi,-0xc(%rbp)
  800e95:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800e98:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800e9c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800ea3:	00 
  800ea4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800eaa:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800eb0:	48 89 d1             	mov    %rdx,%rcx
  800eb3:	48 89 c2             	mov    %rax,%rdx
  800eb6:	be 00 00 00 00       	mov    $0x0,%esi
  800ebb:	bf 10 00 00 00       	mov    $0x10,%edi
  800ec0:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800ec7:	00 00 00 
  800eca:	ff d0                	callq  *%rax
  800ecc:	c9                   	leaveq 
  800ecd:	c3                   	retq   

0000000000800ece <sys_ept_map>:
  800ece:	55                   	push   %rbp
  800ecf:	48 89 e5             	mov    %rsp,%rbp
  800ed2:	48 83 ec 30          	sub    $0x30,%rsp
  800ed6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800ed9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800edd:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800ee0:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  800ee4:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  800ee8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800eeb:	48 63 c8             	movslq %eax,%rcx
  800eee:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  800ef2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800ef5:	48 63 f0             	movslq %eax,%rsi
  800ef8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800efc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800eff:	48 98                	cltq   
  800f01:	48 89 0c 24          	mov    %rcx,(%rsp)
  800f05:	49 89 f9             	mov    %rdi,%r9
  800f08:	49 89 f0             	mov    %rsi,%r8
  800f0b:	48 89 d1             	mov    %rdx,%rcx
  800f0e:	48 89 c2             	mov    %rax,%rdx
  800f11:	be 00 00 00 00       	mov    $0x0,%esi
  800f16:	bf 11 00 00 00       	mov    $0x11,%edi
  800f1b:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800f22:	00 00 00 
  800f25:	ff d0                	callq  *%rax
  800f27:	c9                   	leaveq 
  800f28:	c3                   	retq   

0000000000800f29 <sys_env_mkguest>:
  800f29:	55                   	push   %rbp
  800f2a:	48 89 e5             	mov    %rsp,%rbp
  800f2d:	48 83 ec 20          	sub    $0x20,%rsp
  800f31:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800f35:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f39:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800f3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f41:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800f48:	00 
  800f49:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800f4f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800f55:	48 89 d1             	mov    %rdx,%rcx
  800f58:	48 89 c2             	mov    %rax,%rdx
  800f5b:	be 00 00 00 00       	mov    $0x0,%esi
  800f60:	bf 12 00 00 00       	mov    $0x12,%edi
  800f65:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800f6c:	00 00 00 
  800f6f:	ff d0                	callq  *%rax
  800f71:	c9                   	leaveq 
  800f72:	c3                   	retq   

0000000000800f73 <sys_vmx_list_vms>:
  800f73:	55                   	push   %rbp
  800f74:	48 89 e5             	mov    %rsp,%rbp
  800f77:	48 83 ec 10          	sub    $0x10,%rsp
  800f7b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800f82:	00 
  800f83:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800f89:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800f8f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800f94:	ba 00 00 00 00       	mov    $0x0,%edx
  800f99:	be 00 00 00 00       	mov    $0x0,%esi
  800f9e:	bf 13 00 00 00       	mov    $0x13,%edi
  800fa3:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800faa:	00 00 00 
  800fad:	ff d0                	callq  *%rax
  800faf:	c9                   	leaveq 
  800fb0:	c3                   	retq   

0000000000800fb1 <sys_vmx_sel_resume>:
  800fb1:	55                   	push   %rbp
  800fb2:	48 89 e5             	mov    %rsp,%rbp
  800fb5:	48 83 ec 10          	sub    $0x10,%rsp
  800fb9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800fbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fbf:	48 98                	cltq   
  800fc1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800fc8:	00 
  800fc9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800fcf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800fd5:	b9 00 00 00 00       	mov    $0x0,%ecx
  800fda:	48 89 c2             	mov    %rax,%rdx
  800fdd:	be 00 00 00 00       	mov    $0x0,%esi
  800fe2:	bf 14 00 00 00       	mov    $0x14,%edi
  800fe7:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  800fee:	00 00 00 
  800ff1:	ff d0                	callq  *%rax
  800ff3:	c9                   	leaveq 
  800ff4:	c3                   	retq   

0000000000800ff5 <sys_vmx_get_vmdisk_number>:
  800ff5:	55                   	push   %rbp
  800ff6:	48 89 e5             	mov    %rsp,%rbp
  800ff9:	48 83 ec 10          	sub    $0x10,%rsp
  800ffd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801004:	00 
  801005:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80100b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801011:	b9 00 00 00 00       	mov    $0x0,%ecx
  801016:	ba 00 00 00 00       	mov    $0x0,%edx
  80101b:	be 00 00 00 00       	mov    $0x0,%esi
  801020:	bf 15 00 00 00       	mov    $0x15,%edi
  801025:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  80102c:	00 00 00 
  80102f:	ff d0                	callq  *%rax
  801031:	c9                   	leaveq 
  801032:	c3                   	retq   

0000000000801033 <sys_vmx_incr_vmdisk_number>:
  801033:	55                   	push   %rbp
  801034:	48 89 e5             	mov    %rsp,%rbp
  801037:	48 83 ec 10          	sub    $0x10,%rsp
  80103b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801042:	00 
  801043:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801049:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80104f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801054:	ba 00 00 00 00       	mov    $0x0,%edx
  801059:	be 00 00 00 00       	mov    $0x0,%esi
  80105e:	bf 16 00 00 00       	mov    $0x16,%edi
  801063:	48 b8 bd 09 80 00 00 	movabs $0x8009bd,%rax
  80106a:	00 00 00 
  80106d:	ff d0                	callq  *%rax
  80106f:	c9                   	leaveq 
  801070:	c3                   	retq   

0000000000801071 <fd2num>:
  801071:	55                   	push   %rbp
  801072:	48 89 e5             	mov    %rsp,%rbp
  801075:	48 83 ec 08          	sub    $0x8,%rsp
  801079:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80107d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801081:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801088:	ff ff ff 
  80108b:	48 01 d0             	add    %rdx,%rax
  80108e:	48 c1 e8 0c          	shr    $0xc,%rax
  801092:	c9                   	leaveq 
  801093:	c3                   	retq   

0000000000801094 <fd2data>:
  801094:	55                   	push   %rbp
  801095:	48 89 e5             	mov    %rsp,%rbp
  801098:	48 83 ec 08          	sub    $0x8,%rsp
  80109c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010a4:	48 89 c7             	mov    %rax,%rdi
  8010a7:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  8010ae:	00 00 00 
  8010b1:	ff d0                	callq  *%rax
  8010b3:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8010b9:	48 c1 e0 0c          	shl    $0xc,%rax
  8010bd:	c9                   	leaveq 
  8010be:	c3                   	retq   

00000000008010bf <fd_alloc>:
  8010bf:	55                   	push   %rbp
  8010c0:	48 89 e5             	mov    %rsp,%rbp
  8010c3:	48 83 ec 18          	sub    $0x18,%rsp
  8010c7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010cb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8010d2:	eb 6b                	jmp    80113f <fd_alloc+0x80>
  8010d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010d7:	48 98                	cltq   
  8010d9:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8010df:	48 c1 e0 0c          	shl    $0xc,%rax
  8010e3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8010e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010eb:	48 c1 e8 15          	shr    $0x15,%rax
  8010ef:	48 89 c2             	mov    %rax,%rdx
  8010f2:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8010f9:	01 00 00 
  8010fc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801100:	83 e0 01             	and    $0x1,%eax
  801103:	48 85 c0             	test   %rax,%rax
  801106:	74 21                	je     801129 <fd_alloc+0x6a>
  801108:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80110c:	48 c1 e8 0c          	shr    $0xc,%rax
  801110:	48 89 c2             	mov    %rax,%rdx
  801113:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80111a:	01 00 00 
  80111d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801121:	83 e0 01             	and    $0x1,%eax
  801124:	48 85 c0             	test   %rax,%rax
  801127:	75 12                	jne    80113b <fd_alloc+0x7c>
  801129:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80112d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801131:	48 89 10             	mov    %rdx,(%rax)
  801134:	b8 00 00 00 00       	mov    $0x0,%eax
  801139:	eb 1a                	jmp    801155 <fd_alloc+0x96>
  80113b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80113f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801143:	7e 8f                	jle    8010d4 <fd_alloc+0x15>
  801145:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801149:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801150:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801155:	c9                   	leaveq 
  801156:	c3                   	retq   

0000000000801157 <fd_lookup>:
  801157:	55                   	push   %rbp
  801158:	48 89 e5             	mov    %rsp,%rbp
  80115b:	48 83 ec 20          	sub    $0x20,%rsp
  80115f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801162:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801166:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80116a:	78 06                	js     801172 <fd_lookup+0x1b>
  80116c:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801170:	7e 07                	jle    801179 <fd_lookup+0x22>
  801172:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801177:	eb 6c                	jmp    8011e5 <fd_lookup+0x8e>
  801179:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80117c:	48 98                	cltq   
  80117e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801184:	48 c1 e0 0c          	shl    $0xc,%rax
  801188:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80118c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801190:	48 c1 e8 15          	shr    $0x15,%rax
  801194:	48 89 c2             	mov    %rax,%rdx
  801197:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80119e:	01 00 00 
  8011a1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8011a5:	83 e0 01             	and    $0x1,%eax
  8011a8:	48 85 c0             	test   %rax,%rax
  8011ab:	74 21                	je     8011ce <fd_lookup+0x77>
  8011ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011b1:	48 c1 e8 0c          	shr    $0xc,%rax
  8011b5:	48 89 c2             	mov    %rax,%rdx
  8011b8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8011bf:	01 00 00 
  8011c2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8011c6:	83 e0 01             	and    $0x1,%eax
  8011c9:	48 85 c0             	test   %rax,%rax
  8011cc:	75 07                	jne    8011d5 <fd_lookup+0x7e>
  8011ce:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8011d3:	eb 10                	jmp    8011e5 <fd_lookup+0x8e>
  8011d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011d9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8011dd:	48 89 10             	mov    %rdx,(%rax)
  8011e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8011e5:	c9                   	leaveq 
  8011e6:	c3                   	retq   

00000000008011e7 <fd_close>:
  8011e7:	55                   	push   %rbp
  8011e8:	48 89 e5             	mov    %rsp,%rbp
  8011eb:	48 83 ec 30          	sub    $0x30,%rsp
  8011ef:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8011f3:	89 f0                	mov    %esi,%eax
  8011f5:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8011f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8011fc:	48 89 c7             	mov    %rax,%rdi
  8011ff:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  801206:	00 00 00 
  801209:	ff d0                	callq  *%rax
  80120b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80120f:	48 89 d6             	mov    %rdx,%rsi
  801212:	89 c7                	mov    %eax,%edi
  801214:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  80121b:	00 00 00 
  80121e:	ff d0                	callq  *%rax
  801220:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801223:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801227:	78 0a                	js     801233 <fd_close+0x4c>
  801229:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80122d:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801231:	74 12                	je     801245 <fd_close+0x5e>
  801233:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801237:	74 05                	je     80123e <fd_close+0x57>
  801239:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80123c:	eb 05                	jmp    801243 <fd_close+0x5c>
  80123e:	b8 00 00 00 00       	mov    $0x0,%eax
  801243:	eb 69                	jmp    8012ae <fd_close+0xc7>
  801245:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801249:	8b 00                	mov    (%rax),%eax
  80124b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80124f:	48 89 d6             	mov    %rdx,%rsi
  801252:	89 c7                	mov    %eax,%edi
  801254:	48 b8 b0 12 80 00 00 	movabs $0x8012b0,%rax
  80125b:	00 00 00 
  80125e:	ff d0                	callq  *%rax
  801260:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801263:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801267:	78 2a                	js     801293 <fd_close+0xac>
  801269:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80126d:	48 8b 40 20          	mov    0x20(%rax),%rax
  801271:	48 85 c0             	test   %rax,%rax
  801274:	74 16                	je     80128c <fd_close+0xa5>
  801276:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80127a:	48 8b 40 20          	mov    0x20(%rax),%rax
  80127e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801282:	48 89 d7             	mov    %rdx,%rdi
  801285:	ff d0                	callq  *%rax
  801287:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80128a:	eb 07                	jmp    801293 <fd_close+0xac>
  80128c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801293:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801297:	48 89 c6             	mov    %rax,%rsi
  80129a:	bf 00 00 00 00       	mov    $0x0,%edi
  80129f:	48 b8 3e 0c 80 00 00 	movabs $0x800c3e,%rax
  8012a6:	00 00 00 
  8012a9:	ff d0                	callq  *%rax
  8012ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012ae:	c9                   	leaveq 
  8012af:	c3                   	retq   

00000000008012b0 <dev_lookup>:
  8012b0:	55                   	push   %rbp
  8012b1:	48 89 e5             	mov    %rsp,%rbp
  8012b4:	48 83 ec 20          	sub    $0x20,%rsp
  8012b8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8012bb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8012c6:	eb 41                	jmp    801309 <dev_lookup+0x59>
  8012c8:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8012cf:	00 00 00 
  8012d2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8012d5:	48 63 d2             	movslq %edx,%rdx
  8012d8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8012dc:	8b 00                	mov    (%rax),%eax
  8012de:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8012e1:	75 22                	jne    801305 <dev_lookup+0x55>
  8012e3:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8012ea:	00 00 00 
  8012ed:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8012f0:	48 63 d2             	movslq %edx,%rdx
  8012f3:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8012f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012fb:	48 89 10             	mov    %rdx,(%rax)
  8012fe:	b8 00 00 00 00       	mov    $0x0,%eax
  801303:	eb 60                	jmp    801365 <dev_lookup+0xb5>
  801305:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801309:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801310:	00 00 00 
  801313:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801316:	48 63 d2             	movslq %edx,%rdx
  801319:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80131d:	48 85 c0             	test   %rax,%rax
  801320:	75 a6                	jne    8012c8 <dev_lookup+0x18>
  801322:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  801329:	00 00 00 
  80132c:	48 8b 00             	mov    (%rax),%rax
  80132f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801335:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801338:	89 c6                	mov    %eax,%esi
  80133a:	48 bf 40 41 80 00 00 	movabs $0x804140,%rdi
  801341:	00 00 00 
  801344:	b8 00 00 00 00       	mov    $0x0,%eax
  801349:	48 b9 5d 33 80 00 00 	movabs $0x80335d,%rcx
  801350:	00 00 00 
  801353:	ff d1                	callq  *%rcx
  801355:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801359:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801360:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801365:	c9                   	leaveq 
  801366:	c3                   	retq   

0000000000801367 <close>:
  801367:	55                   	push   %rbp
  801368:	48 89 e5             	mov    %rsp,%rbp
  80136b:	48 83 ec 20          	sub    $0x20,%rsp
  80136f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801372:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801376:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801379:	48 89 d6             	mov    %rdx,%rsi
  80137c:	89 c7                	mov    %eax,%edi
  80137e:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  801385:	00 00 00 
  801388:	ff d0                	callq  *%rax
  80138a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80138d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801391:	79 05                	jns    801398 <close+0x31>
  801393:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801396:	eb 18                	jmp    8013b0 <close+0x49>
  801398:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80139c:	be 01 00 00 00       	mov    $0x1,%esi
  8013a1:	48 89 c7             	mov    %rax,%rdi
  8013a4:	48 b8 e7 11 80 00 00 	movabs $0x8011e7,%rax
  8013ab:	00 00 00 
  8013ae:	ff d0                	callq  *%rax
  8013b0:	c9                   	leaveq 
  8013b1:	c3                   	retq   

00000000008013b2 <close_all>:
  8013b2:	55                   	push   %rbp
  8013b3:	48 89 e5             	mov    %rsp,%rbp
  8013b6:	48 83 ec 10          	sub    $0x10,%rsp
  8013ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8013c1:	eb 15                	jmp    8013d8 <close_all+0x26>
  8013c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013c6:	89 c7                	mov    %eax,%edi
  8013c8:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  8013cf:	00 00 00 
  8013d2:	ff d0                	callq  *%rax
  8013d4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8013d8:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8013dc:	7e e5                	jle    8013c3 <close_all+0x11>
  8013de:	c9                   	leaveq 
  8013df:	c3                   	retq   

00000000008013e0 <dup>:
  8013e0:	55                   	push   %rbp
  8013e1:	48 89 e5             	mov    %rsp,%rbp
  8013e4:	48 83 ec 40          	sub    $0x40,%rsp
  8013e8:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8013eb:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8013ee:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8013f2:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8013f5:	48 89 d6             	mov    %rdx,%rsi
  8013f8:	89 c7                	mov    %eax,%edi
  8013fa:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  801401:	00 00 00 
  801404:	ff d0                	callq  *%rax
  801406:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801409:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80140d:	79 08                	jns    801417 <dup+0x37>
  80140f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801412:	e9 70 01 00 00       	jmpq   801587 <dup+0x1a7>
  801417:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80141a:	89 c7                	mov    %eax,%edi
  80141c:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  801423:	00 00 00 
  801426:	ff d0                	callq  *%rax
  801428:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80142b:	48 98                	cltq   
  80142d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801433:	48 c1 e0 0c          	shl    $0xc,%rax
  801437:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80143b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80143f:	48 89 c7             	mov    %rax,%rdi
  801442:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  801449:	00 00 00 
  80144c:	ff d0                	callq  *%rax
  80144e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801452:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801456:	48 89 c7             	mov    %rax,%rdi
  801459:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  801460:	00 00 00 
  801463:	ff d0                	callq  *%rax
  801465:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801469:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80146d:	48 c1 e8 15          	shr    $0x15,%rax
  801471:	48 89 c2             	mov    %rax,%rdx
  801474:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80147b:	01 00 00 
  80147e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801482:	83 e0 01             	and    $0x1,%eax
  801485:	48 85 c0             	test   %rax,%rax
  801488:	74 73                	je     8014fd <dup+0x11d>
  80148a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80148e:	48 c1 e8 0c          	shr    $0xc,%rax
  801492:	48 89 c2             	mov    %rax,%rdx
  801495:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80149c:	01 00 00 
  80149f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8014a3:	83 e0 01             	and    $0x1,%eax
  8014a6:	48 85 c0             	test   %rax,%rax
  8014a9:	74 52                	je     8014fd <dup+0x11d>
  8014ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014af:	48 c1 e8 0c          	shr    $0xc,%rax
  8014b3:	48 89 c2             	mov    %rax,%rdx
  8014b6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8014bd:	01 00 00 
  8014c0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8014c4:	25 07 0e 00 00       	and    $0xe07,%eax
  8014c9:	89 c1                	mov    %eax,%ecx
  8014cb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8014cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014d3:	41 89 c8             	mov    %ecx,%r8d
  8014d6:	48 89 d1             	mov    %rdx,%rcx
  8014d9:	ba 00 00 00 00       	mov    $0x0,%edx
  8014de:	48 89 c6             	mov    %rax,%rsi
  8014e1:	bf 00 00 00 00       	mov    $0x0,%edi
  8014e6:	48 b8 e3 0b 80 00 00 	movabs $0x800be3,%rax
  8014ed:	00 00 00 
  8014f0:	ff d0                	callq  *%rax
  8014f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8014f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8014f9:	79 02                	jns    8014fd <dup+0x11d>
  8014fb:	eb 57                	jmp    801554 <dup+0x174>
  8014fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801501:	48 c1 e8 0c          	shr    $0xc,%rax
  801505:	48 89 c2             	mov    %rax,%rdx
  801508:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80150f:	01 00 00 
  801512:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801516:	25 07 0e 00 00       	and    $0xe07,%eax
  80151b:	89 c1                	mov    %eax,%ecx
  80151d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801521:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801525:	41 89 c8             	mov    %ecx,%r8d
  801528:	48 89 d1             	mov    %rdx,%rcx
  80152b:	ba 00 00 00 00       	mov    $0x0,%edx
  801530:	48 89 c6             	mov    %rax,%rsi
  801533:	bf 00 00 00 00       	mov    $0x0,%edi
  801538:	48 b8 e3 0b 80 00 00 	movabs $0x800be3,%rax
  80153f:	00 00 00 
  801542:	ff d0                	callq  *%rax
  801544:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801547:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80154b:	79 02                	jns    80154f <dup+0x16f>
  80154d:	eb 05                	jmp    801554 <dup+0x174>
  80154f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  801552:	eb 33                	jmp    801587 <dup+0x1a7>
  801554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801558:	48 89 c6             	mov    %rax,%rsi
  80155b:	bf 00 00 00 00       	mov    $0x0,%edi
  801560:	48 b8 3e 0c 80 00 00 	movabs $0x800c3e,%rax
  801567:	00 00 00 
  80156a:	ff d0                	callq  *%rax
  80156c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801570:	48 89 c6             	mov    %rax,%rsi
  801573:	bf 00 00 00 00       	mov    $0x0,%edi
  801578:	48 b8 3e 0c 80 00 00 	movabs $0x800c3e,%rax
  80157f:	00 00 00 
  801582:	ff d0                	callq  *%rax
  801584:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801587:	c9                   	leaveq 
  801588:	c3                   	retq   

0000000000801589 <read>:
  801589:	55                   	push   %rbp
  80158a:	48 89 e5             	mov    %rsp,%rbp
  80158d:	48 83 ec 40          	sub    $0x40,%rsp
  801591:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801594:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801598:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80159c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8015a0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8015a3:	48 89 d6             	mov    %rdx,%rsi
  8015a6:	89 c7                	mov    %eax,%edi
  8015a8:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  8015af:	00 00 00 
  8015b2:	ff d0                	callq  *%rax
  8015b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8015b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8015bb:	78 24                	js     8015e1 <read+0x58>
  8015bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015c1:	8b 00                	mov    (%rax),%eax
  8015c3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8015c7:	48 89 d6             	mov    %rdx,%rsi
  8015ca:	89 c7                	mov    %eax,%edi
  8015cc:	48 b8 b0 12 80 00 00 	movabs $0x8012b0,%rax
  8015d3:	00 00 00 
  8015d6:	ff d0                	callq  *%rax
  8015d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8015db:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8015df:	79 05                	jns    8015e6 <read+0x5d>
  8015e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8015e4:	eb 76                	jmp    80165c <read+0xd3>
  8015e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015ea:	8b 40 08             	mov    0x8(%rax),%eax
  8015ed:	83 e0 03             	and    $0x3,%eax
  8015f0:	83 f8 01             	cmp    $0x1,%eax
  8015f3:	75 3a                	jne    80162f <read+0xa6>
  8015f5:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8015fc:	00 00 00 
  8015ff:	48 8b 00             	mov    (%rax),%rax
  801602:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801608:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80160b:	89 c6                	mov    %eax,%esi
  80160d:	48 bf 5f 41 80 00 00 	movabs $0x80415f,%rdi
  801614:	00 00 00 
  801617:	b8 00 00 00 00       	mov    $0x0,%eax
  80161c:	48 b9 5d 33 80 00 00 	movabs $0x80335d,%rcx
  801623:	00 00 00 
  801626:	ff d1                	callq  *%rcx
  801628:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80162d:	eb 2d                	jmp    80165c <read+0xd3>
  80162f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801633:	48 8b 40 10          	mov    0x10(%rax),%rax
  801637:	48 85 c0             	test   %rax,%rax
  80163a:	75 07                	jne    801643 <read+0xba>
  80163c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  801641:	eb 19                	jmp    80165c <read+0xd3>
  801643:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801647:	48 8b 40 10          	mov    0x10(%rax),%rax
  80164b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80164f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801653:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  801657:	48 89 cf             	mov    %rcx,%rdi
  80165a:	ff d0                	callq  *%rax
  80165c:	c9                   	leaveq 
  80165d:	c3                   	retq   

000000000080165e <readn>:
  80165e:	55                   	push   %rbp
  80165f:	48 89 e5             	mov    %rsp,%rbp
  801662:	48 83 ec 30          	sub    $0x30,%rsp
  801666:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801669:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80166d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801671:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801678:	eb 49                	jmp    8016c3 <readn+0x65>
  80167a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80167d:	48 98                	cltq   
  80167f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801683:	48 29 c2             	sub    %rax,%rdx
  801686:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801689:	48 63 c8             	movslq %eax,%rcx
  80168c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801690:	48 01 c1             	add    %rax,%rcx
  801693:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801696:	48 89 ce             	mov    %rcx,%rsi
  801699:	89 c7                	mov    %eax,%edi
  80169b:	48 b8 89 15 80 00 00 	movabs $0x801589,%rax
  8016a2:	00 00 00 
  8016a5:	ff d0                	callq  *%rax
  8016a7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8016aa:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8016ae:	79 05                	jns    8016b5 <readn+0x57>
  8016b0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8016b3:	eb 1c                	jmp    8016d1 <readn+0x73>
  8016b5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8016b9:	75 02                	jne    8016bd <readn+0x5f>
  8016bb:	eb 11                	jmp    8016ce <readn+0x70>
  8016bd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8016c0:	01 45 fc             	add    %eax,-0x4(%rbp)
  8016c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8016c6:	48 98                	cltq   
  8016c8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8016cc:	72 ac                	jb     80167a <readn+0x1c>
  8016ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8016d1:	c9                   	leaveq 
  8016d2:	c3                   	retq   

00000000008016d3 <write>:
  8016d3:	55                   	push   %rbp
  8016d4:	48 89 e5             	mov    %rsp,%rbp
  8016d7:	48 83 ec 40          	sub    $0x40,%rsp
  8016db:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8016de:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8016e2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8016e6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8016ea:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8016ed:	48 89 d6             	mov    %rdx,%rsi
  8016f0:	89 c7                	mov    %eax,%edi
  8016f2:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  8016f9:	00 00 00 
  8016fc:	ff d0                	callq  *%rax
  8016fe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801701:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801705:	78 24                	js     80172b <write+0x58>
  801707:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80170b:	8b 00                	mov    (%rax),%eax
  80170d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801711:	48 89 d6             	mov    %rdx,%rsi
  801714:	89 c7                	mov    %eax,%edi
  801716:	48 b8 b0 12 80 00 00 	movabs $0x8012b0,%rax
  80171d:	00 00 00 
  801720:	ff d0                	callq  *%rax
  801722:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801725:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801729:	79 05                	jns    801730 <write+0x5d>
  80172b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80172e:	eb 75                	jmp    8017a5 <write+0xd2>
  801730:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801734:	8b 40 08             	mov    0x8(%rax),%eax
  801737:	83 e0 03             	and    $0x3,%eax
  80173a:	85 c0                	test   %eax,%eax
  80173c:	75 3a                	jne    801778 <write+0xa5>
  80173e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  801745:	00 00 00 
  801748:	48 8b 00             	mov    (%rax),%rax
  80174b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801751:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801754:	89 c6                	mov    %eax,%esi
  801756:	48 bf 7b 41 80 00 00 	movabs $0x80417b,%rdi
  80175d:	00 00 00 
  801760:	b8 00 00 00 00       	mov    $0x0,%eax
  801765:	48 b9 5d 33 80 00 00 	movabs $0x80335d,%rcx
  80176c:	00 00 00 
  80176f:	ff d1                	callq  *%rcx
  801771:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801776:	eb 2d                	jmp    8017a5 <write+0xd2>
  801778:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80177c:	48 8b 40 18          	mov    0x18(%rax),%rax
  801780:	48 85 c0             	test   %rax,%rax
  801783:	75 07                	jne    80178c <write+0xb9>
  801785:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80178a:	eb 19                	jmp    8017a5 <write+0xd2>
  80178c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801790:	48 8b 40 18          	mov    0x18(%rax),%rax
  801794:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801798:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80179c:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8017a0:	48 89 cf             	mov    %rcx,%rdi
  8017a3:	ff d0                	callq  *%rax
  8017a5:	c9                   	leaveq 
  8017a6:	c3                   	retq   

00000000008017a7 <seek>:
  8017a7:	55                   	push   %rbp
  8017a8:	48 89 e5             	mov    %rsp,%rbp
  8017ab:	48 83 ec 18          	sub    $0x18,%rsp
  8017af:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8017b2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8017b5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8017b9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017bc:	48 89 d6             	mov    %rdx,%rsi
  8017bf:	89 c7                	mov    %eax,%edi
  8017c1:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  8017c8:	00 00 00 
  8017cb:	ff d0                	callq  *%rax
  8017cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8017d0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8017d4:	79 05                	jns    8017db <seek+0x34>
  8017d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017d9:	eb 0f                	jmp    8017ea <seek+0x43>
  8017db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017df:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8017e2:	89 50 04             	mov    %edx,0x4(%rax)
  8017e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8017ea:	c9                   	leaveq 
  8017eb:	c3                   	retq   

00000000008017ec <ftruncate>:
  8017ec:	55                   	push   %rbp
  8017ed:	48 89 e5             	mov    %rsp,%rbp
  8017f0:	48 83 ec 30          	sub    $0x30,%rsp
  8017f4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017f7:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8017fa:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8017fe:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801801:	48 89 d6             	mov    %rdx,%rsi
  801804:	89 c7                	mov    %eax,%edi
  801806:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  80180d:	00 00 00 
  801810:	ff d0                	callq  *%rax
  801812:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801815:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801819:	78 24                	js     80183f <ftruncate+0x53>
  80181b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80181f:	8b 00                	mov    (%rax),%eax
  801821:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801825:	48 89 d6             	mov    %rdx,%rsi
  801828:	89 c7                	mov    %eax,%edi
  80182a:	48 b8 b0 12 80 00 00 	movabs $0x8012b0,%rax
  801831:	00 00 00 
  801834:	ff d0                	callq  *%rax
  801836:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801839:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80183d:	79 05                	jns    801844 <ftruncate+0x58>
  80183f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801842:	eb 72                	jmp    8018b6 <ftruncate+0xca>
  801844:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801848:	8b 40 08             	mov    0x8(%rax),%eax
  80184b:	83 e0 03             	and    $0x3,%eax
  80184e:	85 c0                	test   %eax,%eax
  801850:	75 3a                	jne    80188c <ftruncate+0xa0>
  801852:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  801859:	00 00 00 
  80185c:	48 8b 00             	mov    (%rax),%rax
  80185f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801865:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801868:	89 c6                	mov    %eax,%esi
  80186a:	48 bf 98 41 80 00 00 	movabs $0x804198,%rdi
  801871:	00 00 00 
  801874:	b8 00 00 00 00       	mov    $0x0,%eax
  801879:	48 b9 5d 33 80 00 00 	movabs $0x80335d,%rcx
  801880:	00 00 00 
  801883:	ff d1                	callq  *%rcx
  801885:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80188a:	eb 2a                	jmp    8018b6 <ftruncate+0xca>
  80188c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801890:	48 8b 40 30          	mov    0x30(%rax),%rax
  801894:	48 85 c0             	test   %rax,%rax
  801897:	75 07                	jne    8018a0 <ftruncate+0xb4>
  801899:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80189e:	eb 16                	jmp    8018b6 <ftruncate+0xca>
  8018a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018a4:	48 8b 40 30          	mov    0x30(%rax),%rax
  8018a8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018ac:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8018af:	89 ce                	mov    %ecx,%esi
  8018b1:	48 89 d7             	mov    %rdx,%rdi
  8018b4:	ff d0                	callq  *%rax
  8018b6:	c9                   	leaveq 
  8018b7:	c3                   	retq   

00000000008018b8 <fstat>:
  8018b8:	55                   	push   %rbp
  8018b9:	48 89 e5             	mov    %rsp,%rbp
  8018bc:	48 83 ec 30          	sub    $0x30,%rsp
  8018c0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8018c3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018c7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8018cb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8018ce:	48 89 d6             	mov    %rdx,%rsi
  8018d1:	89 c7                	mov    %eax,%edi
  8018d3:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  8018da:	00 00 00 
  8018dd:	ff d0                	callq  *%rax
  8018df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8018e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8018e6:	78 24                	js     80190c <fstat+0x54>
  8018e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ec:	8b 00                	mov    (%rax),%eax
  8018ee:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8018f2:	48 89 d6             	mov    %rdx,%rsi
  8018f5:	89 c7                	mov    %eax,%edi
  8018f7:	48 b8 b0 12 80 00 00 	movabs $0x8012b0,%rax
  8018fe:	00 00 00 
  801901:	ff d0                	callq  *%rax
  801903:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801906:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80190a:	79 05                	jns    801911 <fstat+0x59>
  80190c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80190f:	eb 5e                	jmp    80196f <fstat+0xb7>
  801911:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801915:	48 8b 40 28          	mov    0x28(%rax),%rax
  801919:	48 85 c0             	test   %rax,%rax
  80191c:	75 07                	jne    801925 <fstat+0x6d>
  80191e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  801923:	eb 4a                	jmp    80196f <fstat+0xb7>
  801925:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801929:	c6 00 00             	movb   $0x0,(%rax)
  80192c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801930:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  801937:	00 00 00 
  80193a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80193e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  801945:	00 00 00 
  801948:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80194c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801950:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  801957:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80195b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80195f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801963:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801967:	48 89 ce             	mov    %rcx,%rsi
  80196a:	48 89 d7             	mov    %rdx,%rdi
  80196d:	ff d0                	callq  *%rax
  80196f:	c9                   	leaveq 
  801970:	c3                   	retq   

0000000000801971 <stat>:
  801971:	55                   	push   %rbp
  801972:	48 89 e5             	mov    %rsp,%rbp
  801975:	48 83 ec 20          	sub    $0x20,%rsp
  801979:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80197d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801981:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801985:	be 00 00 00 00       	mov    $0x0,%esi
  80198a:	48 89 c7             	mov    %rax,%rdi
  80198d:	48 b8 5f 1a 80 00 00 	movabs $0x801a5f,%rax
  801994:	00 00 00 
  801997:	ff d0                	callq  *%rax
  801999:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80199c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8019a0:	79 05                	jns    8019a7 <stat+0x36>
  8019a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019a5:	eb 2f                	jmp    8019d6 <stat+0x65>
  8019a7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8019ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019ae:	48 89 d6             	mov    %rdx,%rsi
  8019b1:	89 c7                	mov    %eax,%edi
  8019b3:	48 b8 b8 18 80 00 00 	movabs $0x8018b8,%rax
  8019ba:	00 00 00 
  8019bd:	ff d0                	callq  *%rax
  8019bf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8019c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019c5:	89 c7                	mov    %eax,%edi
  8019c7:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  8019ce:	00 00 00 
  8019d1:	ff d0                	callq  *%rax
  8019d3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019d6:	c9                   	leaveq 
  8019d7:	c3                   	retq   

00000000008019d8 <fsipc>:
  8019d8:	55                   	push   %rbp
  8019d9:	48 89 e5             	mov    %rsp,%rbp
  8019dc:	48 83 ec 10          	sub    $0x10,%rsp
  8019e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019e3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019e7:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8019ee:	00 00 00 
  8019f1:	8b 00                	mov    (%rax),%eax
  8019f3:	85 c0                	test   %eax,%eax
  8019f5:	75 1d                	jne    801a14 <fsipc+0x3c>
  8019f7:	bf 01 00 00 00       	mov    $0x1,%edi
  8019fc:	48 b8 fd 3f 80 00 00 	movabs $0x803ffd,%rax
  801a03:	00 00 00 
  801a06:	ff d0                	callq  *%rax
  801a08:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  801a0f:	00 00 00 
  801a12:	89 02                	mov    %eax,(%rdx)
  801a14:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  801a1b:	00 00 00 
  801a1e:	8b 00                	mov    (%rax),%eax
  801a20:	8b 75 fc             	mov    -0x4(%rbp),%esi
  801a23:	b9 07 00 00 00       	mov    $0x7,%ecx
  801a28:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  801a2f:	00 00 00 
  801a32:	89 c7                	mov    %eax,%edi
  801a34:	48 b8 67 3f 80 00 00 	movabs $0x803f67,%rax
  801a3b:	00 00 00 
  801a3e:	ff d0                	callq  *%rax
  801a40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a44:	ba 00 00 00 00       	mov    $0x0,%edx
  801a49:	48 89 c6             	mov    %rax,%rsi
  801a4c:	bf 00 00 00 00       	mov    $0x0,%edi
  801a51:	48 b8 a6 3e 80 00 00 	movabs $0x803ea6,%rax
  801a58:	00 00 00 
  801a5b:	ff d0                	callq  *%rax
  801a5d:	c9                   	leaveq 
  801a5e:	c3                   	retq   

0000000000801a5f <open>:
  801a5f:	55                   	push   %rbp
  801a60:	48 89 e5             	mov    %rsp,%rbp
  801a63:	48 83 ec 20          	sub    $0x20,%rsp
  801a67:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a6b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801a6e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a72:	48 89 c7             	mov    %rax,%rdi
  801a75:	48 b8 f8 01 80 00 00 	movabs $0x8001f8,%rax
  801a7c:	00 00 00 
  801a7f:	ff d0                	callq  *%rax
  801a81:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  801a86:	7e 0a                	jle    801a92 <open+0x33>
  801a88:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  801a8d:	e9 a5 00 00 00       	jmpq   801b37 <open+0xd8>
  801a92:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801a96:	48 89 c7             	mov    %rax,%rdi
  801a99:	48 b8 bf 10 80 00 00 	movabs $0x8010bf,%rax
  801aa0:	00 00 00 
  801aa3:	ff d0                	callq  *%rax
  801aa5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801aa8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801aac:	79 08                	jns    801ab6 <open+0x57>
  801aae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ab1:	e9 81 00 00 00       	jmpq   801b37 <open+0xd8>
  801ab6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801aba:	48 89 c6             	mov    %rax,%rsi
  801abd:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  801ac4:	00 00 00 
  801ac7:	48 b8 64 02 80 00 00 	movabs $0x800264,%rax
  801ace:	00 00 00 
  801ad1:	ff d0                	callq  *%rax
  801ad3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801ada:	00 00 00 
  801add:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801ae0:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  801ae6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801aea:	48 89 c6             	mov    %rax,%rsi
  801aed:	bf 01 00 00 00       	mov    $0x1,%edi
  801af2:	48 b8 d8 19 80 00 00 	movabs $0x8019d8,%rax
  801af9:	00 00 00 
  801afc:	ff d0                	callq  *%rax
  801afe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801b01:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801b05:	79 1d                	jns    801b24 <open+0xc5>
  801b07:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b0b:	be 00 00 00 00       	mov    $0x0,%esi
  801b10:	48 89 c7             	mov    %rax,%rdi
  801b13:	48 b8 e7 11 80 00 00 	movabs $0x8011e7,%rax
  801b1a:	00 00 00 
  801b1d:	ff d0                	callq  *%rax
  801b1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b22:	eb 13                	jmp    801b37 <open+0xd8>
  801b24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b28:	48 89 c7             	mov    %rax,%rdi
  801b2b:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  801b32:	00 00 00 
  801b35:	ff d0                	callq  *%rax
  801b37:	c9                   	leaveq 
  801b38:	c3                   	retq   

0000000000801b39 <devfile_flush>:
  801b39:	55                   	push   %rbp
  801b3a:	48 89 e5             	mov    %rsp,%rbp
  801b3d:	48 83 ec 10          	sub    $0x10,%rsp
  801b41:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b49:	8b 50 0c             	mov    0xc(%rax),%edx
  801b4c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801b53:	00 00 00 
  801b56:	89 10                	mov    %edx,(%rax)
  801b58:	be 00 00 00 00       	mov    $0x0,%esi
  801b5d:	bf 06 00 00 00       	mov    $0x6,%edi
  801b62:	48 b8 d8 19 80 00 00 	movabs $0x8019d8,%rax
  801b69:	00 00 00 
  801b6c:	ff d0                	callq  *%rax
  801b6e:	c9                   	leaveq 
  801b6f:	c3                   	retq   

0000000000801b70 <devfile_read>:
  801b70:	55                   	push   %rbp
  801b71:	48 89 e5             	mov    %rsp,%rbp
  801b74:	48 83 ec 30          	sub    $0x30,%rsp
  801b78:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b7c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b80:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b88:	8b 50 0c             	mov    0xc(%rax),%edx
  801b8b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801b92:	00 00 00 
  801b95:	89 10                	mov    %edx,(%rax)
  801b97:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801b9e:	00 00 00 
  801ba1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801ba5:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801ba9:	be 00 00 00 00       	mov    $0x0,%esi
  801bae:	bf 03 00 00 00       	mov    $0x3,%edi
  801bb3:	48 b8 d8 19 80 00 00 	movabs $0x8019d8,%rax
  801bba:	00 00 00 
  801bbd:	ff d0                	callq  *%rax
  801bbf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801bc2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801bc6:	79 08                	jns    801bd0 <devfile_read+0x60>
  801bc8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bcb:	e9 a4 00 00 00       	jmpq   801c74 <devfile_read+0x104>
  801bd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bd3:	48 98                	cltq   
  801bd5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801bd9:	76 35                	jbe    801c10 <devfile_read+0xa0>
  801bdb:	48 b9 be 41 80 00 00 	movabs $0x8041be,%rcx
  801be2:	00 00 00 
  801be5:	48 ba c5 41 80 00 00 	movabs $0x8041c5,%rdx
  801bec:	00 00 00 
  801bef:	be 89 00 00 00       	mov    $0x89,%esi
  801bf4:	48 bf da 41 80 00 00 	movabs $0x8041da,%rdi
  801bfb:	00 00 00 
  801bfe:	b8 00 00 00 00       	mov    $0x0,%eax
  801c03:	49 b8 24 31 80 00 00 	movabs $0x803124,%r8
  801c0a:	00 00 00 
  801c0d:	41 ff d0             	callq  *%r8
  801c10:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  801c17:	7e 35                	jle    801c4e <devfile_read+0xde>
  801c19:	48 b9 e8 41 80 00 00 	movabs $0x8041e8,%rcx
  801c20:	00 00 00 
  801c23:	48 ba c5 41 80 00 00 	movabs $0x8041c5,%rdx
  801c2a:	00 00 00 
  801c2d:	be 8a 00 00 00       	mov    $0x8a,%esi
  801c32:	48 bf da 41 80 00 00 	movabs $0x8041da,%rdi
  801c39:	00 00 00 
  801c3c:	b8 00 00 00 00       	mov    $0x0,%eax
  801c41:	49 b8 24 31 80 00 00 	movabs $0x803124,%r8
  801c48:	00 00 00 
  801c4b:	41 ff d0             	callq  *%r8
  801c4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c51:	48 63 d0             	movslq %eax,%rdx
  801c54:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c58:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  801c5f:	00 00 00 
  801c62:	48 89 c7             	mov    %rax,%rdi
  801c65:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  801c6c:	00 00 00 
  801c6f:	ff d0                	callq  *%rax
  801c71:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c74:	c9                   	leaveq 
  801c75:	c3                   	retq   

0000000000801c76 <devfile_write>:
  801c76:	55                   	push   %rbp
  801c77:	48 89 e5             	mov    %rsp,%rbp
  801c7a:	48 83 ec 40          	sub    $0x40,%rsp
  801c7e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801c82:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801c86:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  801c8a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801c8e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801c92:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  801c99:	00 
  801c9a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c9e:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  801ca2:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  801ca7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  801cab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801caf:	8b 50 0c             	mov    0xc(%rax),%edx
  801cb2:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801cb9:	00 00 00 
  801cbc:	89 10                	mov    %edx,(%rax)
  801cbe:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801cc5:	00 00 00 
  801cc8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801ccc:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801cd0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801cd4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801cd8:	48 89 c6             	mov    %rax,%rsi
  801cdb:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  801ce2:	00 00 00 
  801ce5:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  801cec:	00 00 00 
  801cef:	ff d0                	callq  *%rax
  801cf1:	be 00 00 00 00       	mov    $0x0,%esi
  801cf6:	bf 04 00 00 00       	mov    $0x4,%edi
  801cfb:	48 b8 d8 19 80 00 00 	movabs $0x8019d8,%rax
  801d02:	00 00 00 
  801d05:	ff d0                	callq  *%rax
  801d07:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801d0a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801d0e:	79 05                	jns    801d15 <devfile_write+0x9f>
  801d10:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d13:	eb 43                	jmp    801d58 <devfile_write+0xe2>
  801d15:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d18:	48 98                	cltq   
  801d1a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  801d1e:	76 35                	jbe    801d55 <devfile_write+0xdf>
  801d20:	48 b9 be 41 80 00 00 	movabs $0x8041be,%rcx
  801d27:	00 00 00 
  801d2a:	48 ba c5 41 80 00 00 	movabs $0x8041c5,%rdx
  801d31:	00 00 00 
  801d34:	be a8 00 00 00       	mov    $0xa8,%esi
  801d39:	48 bf da 41 80 00 00 	movabs $0x8041da,%rdi
  801d40:	00 00 00 
  801d43:	b8 00 00 00 00       	mov    $0x0,%eax
  801d48:	49 b8 24 31 80 00 00 	movabs $0x803124,%r8
  801d4f:	00 00 00 
  801d52:	41 ff d0             	callq  *%r8
  801d55:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d58:	c9                   	leaveq 
  801d59:	c3                   	retq   

0000000000801d5a <devfile_stat>:
  801d5a:	55                   	push   %rbp
  801d5b:	48 89 e5             	mov    %rsp,%rbp
  801d5e:	48 83 ec 20          	sub    $0x20,%rsp
  801d62:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801d66:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d6e:	8b 50 0c             	mov    0xc(%rax),%edx
  801d71:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801d78:	00 00 00 
  801d7b:	89 10                	mov    %edx,(%rax)
  801d7d:	be 00 00 00 00       	mov    $0x0,%esi
  801d82:	bf 05 00 00 00       	mov    $0x5,%edi
  801d87:	48 b8 d8 19 80 00 00 	movabs $0x8019d8,%rax
  801d8e:	00 00 00 
  801d91:	ff d0                	callq  *%rax
  801d93:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801d96:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801d9a:	79 05                	jns    801da1 <devfile_stat+0x47>
  801d9c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d9f:	eb 56                	jmp    801df7 <devfile_stat+0x9d>
  801da1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801da5:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  801dac:	00 00 00 
  801daf:	48 89 c7             	mov    %rax,%rdi
  801db2:	48 b8 64 02 80 00 00 	movabs $0x800264,%rax
  801db9:	00 00 00 
  801dbc:	ff d0                	callq  *%rax
  801dbe:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801dc5:	00 00 00 
  801dc8:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  801dce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801dd2:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  801dd8:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801ddf:	00 00 00 
  801de2:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  801de8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801dec:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  801df2:	b8 00 00 00 00       	mov    $0x0,%eax
  801df7:	c9                   	leaveq 
  801df8:	c3                   	retq   

0000000000801df9 <devfile_trunc>:
  801df9:	55                   	push   %rbp
  801dfa:	48 89 e5             	mov    %rsp,%rbp
  801dfd:	48 83 ec 10          	sub    $0x10,%rsp
  801e01:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e05:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e0c:	8b 50 0c             	mov    0xc(%rax),%edx
  801e0f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801e16:	00 00 00 
  801e19:	89 10                	mov    %edx,(%rax)
  801e1b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801e22:	00 00 00 
  801e25:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e28:	89 50 04             	mov    %edx,0x4(%rax)
  801e2b:	be 00 00 00 00       	mov    $0x0,%esi
  801e30:	bf 02 00 00 00       	mov    $0x2,%edi
  801e35:	48 b8 d8 19 80 00 00 	movabs $0x8019d8,%rax
  801e3c:	00 00 00 
  801e3f:	ff d0                	callq  *%rax
  801e41:	c9                   	leaveq 
  801e42:	c3                   	retq   

0000000000801e43 <remove>:
  801e43:	55                   	push   %rbp
  801e44:	48 89 e5             	mov    %rsp,%rbp
  801e47:	48 83 ec 10          	sub    $0x10,%rsp
  801e4b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e53:	48 89 c7             	mov    %rax,%rdi
  801e56:	48 b8 f8 01 80 00 00 	movabs $0x8001f8,%rax
  801e5d:	00 00 00 
  801e60:	ff d0                	callq  *%rax
  801e62:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  801e67:	7e 07                	jle    801e70 <remove+0x2d>
  801e69:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  801e6e:	eb 33                	jmp    801ea3 <remove+0x60>
  801e70:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e74:	48 89 c6             	mov    %rax,%rsi
  801e77:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  801e7e:	00 00 00 
  801e81:	48 b8 64 02 80 00 00 	movabs $0x800264,%rax
  801e88:	00 00 00 
  801e8b:	ff d0                	callq  *%rax
  801e8d:	be 00 00 00 00       	mov    $0x0,%esi
  801e92:	bf 07 00 00 00       	mov    $0x7,%edi
  801e97:	48 b8 d8 19 80 00 00 	movabs $0x8019d8,%rax
  801e9e:	00 00 00 
  801ea1:	ff d0                	callq  *%rax
  801ea3:	c9                   	leaveq 
  801ea4:	c3                   	retq   

0000000000801ea5 <sync>:
  801ea5:	55                   	push   %rbp
  801ea6:	48 89 e5             	mov    %rsp,%rbp
  801ea9:	be 00 00 00 00       	mov    $0x0,%esi
  801eae:	bf 08 00 00 00       	mov    $0x8,%edi
  801eb3:	48 b8 d8 19 80 00 00 	movabs $0x8019d8,%rax
  801eba:	00 00 00 
  801ebd:	ff d0                	callq  *%rax
  801ebf:	5d                   	pop    %rbp
  801ec0:	c3                   	retq   

0000000000801ec1 <copy>:
  801ec1:	55                   	push   %rbp
  801ec2:	48 89 e5             	mov    %rsp,%rbp
  801ec5:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  801ecc:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  801ed3:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  801eda:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  801ee1:	be 00 00 00 00       	mov    $0x0,%esi
  801ee6:	48 89 c7             	mov    %rax,%rdi
  801ee9:	48 b8 5f 1a 80 00 00 	movabs $0x801a5f,%rax
  801ef0:	00 00 00 
  801ef3:	ff d0                	callq  *%rax
  801ef5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ef8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801efc:	79 28                	jns    801f26 <copy+0x65>
  801efe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f01:	89 c6                	mov    %eax,%esi
  801f03:	48 bf f4 41 80 00 00 	movabs $0x8041f4,%rdi
  801f0a:	00 00 00 
  801f0d:	b8 00 00 00 00       	mov    $0x0,%eax
  801f12:	48 ba 5d 33 80 00 00 	movabs $0x80335d,%rdx
  801f19:	00 00 00 
  801f1c:	ff d2                	callq  *%rdx
  801f1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f21:	e9 74 01 00 00       	jmpq   80209a <copy+0x1d9>
  801f26:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  801f2d:	be 01 01 00 00       	mov    $0x101,%esi
  801f32:	48 89 c7             	mov    %rax,%rdi
  801f35:	48 b8 5f 1a 80 00 00 	movabs $0x801a5f,%rax
  801f3c:	00 00 00 
  801f3f:	ff d0                	callq  *%rax
  801f41:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801f44:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801f48:	79 39                	jns    801f83 <copy+0xc2>
  801f4a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f4d:	89 c6                	mov    %eax,%esi
  801f4f:	48 bf 0a 42 80 00 00 	movabs $0x80420a,%rdi
  801f56:	00 00 00 
  801f59:	b8 00 00 00 00       	mov    $0x0,%eax
  801f5e:	48 ba 5d 33 80 00 00 	movabs $0x80335d,%rdx
  801f65:	00 00 00 
  801f68:	ff d2                	callq  *%rdx
  801f6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f6d:	89 c7                	mov    %eax,%edi
  801f6f:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  801f76:	00 00 00 
  801f79:	ff d0                	callq  *%rax
  801f7b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f7e:	e9 17 01 00 00       	jmpq   80209a <copy+0x1d9>
  801f83:	eb 74                	jmp    801ff9 <copy+0x138>
  801f85:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801f88:	48 63 d0             	movslq %eax,%rdx
  801f8b:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  801f92:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f95:	48 89 ce             	mov    %rcx,%rsi
  801f98:	89 c7                	mov    %eax,%edi
  801f9a:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  801fa1:	00 00 00 
  801fa4:	ff d0                	callq  *%rax
  801fa6:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801fa9:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  801fad:	79 4a                	jns    801ff9 <copy+0x138>
  801faf:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801fb2:	89 c6                	mov    %eax,%esi
  801fb4:	48 bf 24 42 80 00 00 	movabs $0x804224,%rdi
  801fbb:	00 00 00 
  801fbe:	b8 00 00 00 00       	mov    $0x0,%eax
  801fc3:	48 ba 5d 33 80 00 00 	movabs $0x80335d,%rdx
  801fca:	00 00 00 
  801fcd:	ff d2                	callq  *%rdx
  801fcf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fd2:	89 c7                	mov    %eax,%edi
  801fd4:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  801fdb:	00 00 00 
  801fde:	ff d0                	callq  *%rax
  801fe0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801fe3:	89 c7                	mov    %eax,%edi
  801fe5:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  801fec:	00 00 00 
  801fef:	ff d0                	callq  *%rax
  801ff1:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801ff4:	e9 a1 00 00 00       	jmpq   80209a <copy+0x1d9>
  801ff9:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802000:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802003:	ba 00 02 00 00       	mov    $0x200,%edx
  802008:	48 89 ce             	mov    %rcx,%rsi
  80200b:	89 c7                	mov    %eax,%edi
  80200d:	48 b8 89 15 80 00 00 	movabs $0x801589,%rax
  802014:	00 00 00 
  802017:	ff d0                	callq  *%rax
  802019:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80201c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802020:	0f 8f 5f ff ff ff    	jg     801f85 <copy+0xc4>
  802026:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80202a:	79 47                	jns    802073 <copy+0x1b2>
  80202c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80202f:	89 c6                	mov    %eax,%esi
  802031:	48 bf 37 42 80 00 00 	movabs $0x804237,%rdi
  802038:	00 00 00 
  80203b:	b8 00 00 00 00       	mov    $0x0,%eax
  802040:	48 ba 5d 33 80 00 00 	movabs $0x80335d,%rdx
  802047:	00 00 00 
  80204a:	ff d2                	callq  *%rdx
  80204c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80204f:	89 c7                	mov    %eax,%edi
  802051:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  802058:	00 00 00 
  80205b:	ff d0                	callq  *%rax
  80205d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802060:	89 c7                	mov    %eax,%edi
  802062:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  802069:	00 00 00 
  80206c:	ff d0                	callq  *%rax
  80206e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802071:	eb 27                	jmp    80209a <copy+0x1d9>
  802073:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802076:	89 c7                	mov    %eax,%edi
  802078:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  80207f:	00 00 00 
  802082:	ff d0                	callq  *%rax
  802084:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802087:	89 c7                	mov    %eax,%edi
  802089:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  802090:	00 00 00 
  802093:	ff d0                	callq  *%rax
  802095:	b8 00 00 00 00       	mov    $0x0,%eax
  80209a:	c9                   	leaveq 
  80209b:	c3                   	retq   

000000000080209c <fd2sockid>:
  80209c:	55                   	push   %rbp
  80209d:	48 89 e5             	mov    %rsp,%rbp
  8020a0:	48 83 ec 20          	sub    $0x20,%rsp
  8020a4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020a7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8020ab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020ae:	48 89 d6             	mov    %rdx,%rsi
  8020b1:	89 c7                	mov    %eax,%edi
  8020b3:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  8020ba:	00 00 00 
  8020bd:	ff d0                	callq  *%rax
  8020bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020c6:	79 05                	jns    8020cd <fd2sockid+0x31>
  8020c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020cb:	eb 24                	jmp    8020f1 <fd2sockid+0x55>
  8020cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020d1:	8b 10                	mov    (%rax),%edx
  8020d3:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  8020da:	00 00 00 
  8020dd:	8b 00                	mov    (%rax),%eax
  8020df:	39 c2                	cmp    %eax,%edx
  8020e1:	74 07                	je     8020ea <fd2sockid+0x4e>
  8020e3:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8020e8:	eb 07                	jmp    8020f1 <fd2sockid+0x55>
  8020ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020ee:	8b 40 0c             	mov    0xc(%rax),%eax
  8020f1:	c9                   	leaveq 
  8020f2:	c3                   	retq   

00000000008020f3 <alloc_sockfd>:
  8020f3:	55                   	push   %rbp
  8020f4:	48 89 e5             	mov    %rsp,%rbp
  8020f7:	48 83 ec 20          	sub    $0x20,%rsp
  8020fb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020fe:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802102:	48 89 c7             	mov    %rax,%rdi
  802105:	48 b8 bf 10 80 00 00 	movabs $0x8010bf,%rax
  80210c:	00 00 00 
  80210f:	ff d0                	callq  *%rax
  802111:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802114:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802118:	78 26                	js     802140 <alloc_sockfd+0x4d>
  80211a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80211e:	ba 07 04 00 00       	mov    $0x407,%edx
  802123:	48 89 c6             	mov    %rax,%rsi
  802126:	bf 00 00 00 00       	mov    $0x0,%edi
  80212b:	48 b8 93 0b 80 00 00 	movabs $0x800b93,%rax
  802132:	00 00 00 
  802135:	ff d0                	callq  *%rax
  802137:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80213a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80213e:	79 16                	jns    802156 <alloc_sockfd+0x63>
  802140:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802143:	89 c7                	mov    %eax,%edi
  802145:	48 b8 00 26 80 00 00 	movabs $0x802600,%rax
  80214c:	00 00 00 
  80214f:	ff d0                	callq  *%rax
  802151:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802154:	eb 3a                	jmp    802190 <alloc_sockfd+0x9d>
  802156:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80215a:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802161:	00 00 00 
  802164:	8b 12                	mov    (%rdx),%edx
  802166:	89 10                	mov    %edx,(%rax)
  802168:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80216c:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802173:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802177:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80217a:	89 50 0c             	mov    %edx,0xc(%rax)
  80217d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802181:	48 89 c7             	mov    %rax,%rdi
  802184:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  80218b:	00 00 00 
  80218e:	ff d0                	callq  *%rax
  802190:	c9                   	leaveq 
  802191:	c3                   	retq   

0000000000802192 <accept>:
  802192:	55                   	push   %rbp
  802193:	48 89 e5             	mov    %rsp,%rbp
  802196:	48 83 ec 30          	sub    $0x30,%rsp
  80219a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80219d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8021a1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8021a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021a8:	89 c7                	mov    %eax,%edi
  8021aa:	48 b8 9c 20 80 00 00 	movabs $0x80209c,%rax
  8021b1:	00 00 00 
  8021b4:	ff d0                	callq  *%rax
  8021b6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021b9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021bd:	79 05                	jns    8021c4 <accept+0x32>
  8021bf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021c2:	eb 3b                	jmp    8021ff <accept+0x6d>
  8021c4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8021c8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8021cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021cf:	48 89 ce             	mov    %rcx,%rsi
  8021d2:	89 c7                	mov    %eax,%edi
  8021d4:	48 b8 dd 24 80 00 00 	movabs $0x8024dd,%rax
  8021db:	00 00 00 
  8021de:	ff d0                	callq  *%rax
  8021e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021e7:	79 05                	jns    8021ee <accept+0x5c>
  8021e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021ec:	eb 11                	jmp    8021ff <accept+0x6d>
  8021ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021f1:	89 c7                	mov    %eax,%edi
  8021f3:	48 b8 f3 20 80 00 00 	movabs $0x8020f3,%rax
  8021fa:	00 00 00 
  8021fd:	ff d0                	callq  *%rax
  8021ff:	c9                   	leaveq 
  802200:	c3                   	retq   

0000000000802201 <bind>:
  802201:	55                   	push   %rbp
  802202:	48 89 e5             	mov    %rsp,%rbp
  802205:	48 83 ec 20          	sub    $0x20,%rsp
  802209:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80220c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802210:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802213:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802216:	89 c7                	mov    %eax,%edi
  802218:	48 b8 9c 20 80 00 00 	movabs $0x80209c,%rax
  80221f:	00 00 00 
  802222:	ff d0                	callq  *%rax
  802224:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802227:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80222b:	79 05                	jns    802232 <bind+0x31>
  80222d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802230:	eb 1b                	jmp    80224d <bind+0x4c>
  802232:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802235:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802239:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80223c:	48 89 ce             	mov    %rcx,%rsi
  80223f:	89 c7                	mov    %eax,%edi
  802241:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  802248:	00 00 00 
  80224b:	ff d0                	callq  *%rax
  80224d:	c9                   	leaveq 
  80224e:	c3                   	retq   

000000000080224f <shutdown>:
  80224f:	55                   	push   %rbp
  802250:	48 89 e5             	mov    %rsp,%rbp
  802253:	48 83 ec 20          	sub    $0x20,%rsp
  802257:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80225a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80225d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802260:	89 c7                	mov    %eax,%edi
  802262:	48 b8 9c 20 80 00 00 	movabs $0x80209c,%rax
  802269:	00 00 00 
  80226c:	ff d0                	callq  *%rax
  80226e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802271:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802275:	79 05                	jns    80227c <shutdown+0x2d>
  802277:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80227a:	eb 16                	jmp    802292 <shutdown+0x43>
  80227c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80227f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802282:	89 d6                	mov    %edx,%esi
  802284:	89 c7                	mov    %eax,%edi
  802286:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  80228d:	00 00 00 
  802290:	ff d0                	callq  *%rax
  802292:	c9                   	leaveq 
  802293:	c3                   	retq   

0000000000802294 <devsock_close>:
  802294:	55                   	push   %rbp
  802295:	48 89 e5             	mov    %rsp,%rbp
  802298:	48 83 ec 10          	sub    $0x10,%rsp
  80229c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8022a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022a4:	48 89 c7             	mov    %rax,%rdi
  8022a7:	48 b8 6f 40 80 00 00 	movabs $0x80406f,%rax
  8022ae:	00 00 00 
  8022b1:	ff d0                	callq  *%rax
  8022b3:	83 f8 01             	cmp    $0x1,%eax
  8022b6:	75 17                	jne    8022cf <devsock_close+0x3b>
  8022b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022bc:	8b 40 0c             	mov    0xc(%rax),%eax
  8022bf:	89 c7                	mov    %eax,%edi
  8022c1:	48 b8 00 26 80 00 00 	movabs $0x802600,%rax
  8022c8:	00 00 00 
  8022cb:	ff d0                	callq  *%rax
  8022cd:	eb 05                	jmp    8022d4 <devsock_close+0x40>
  8022cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8022d4:	c9                   	leaveq 
  8022d5:	c3                   	retq   

00000000008022d6 <connect>:
  8022d6:	55                   	push   %rbp
  8022d7:	48 89 e5             	mov    %rsp,%rbp
  8022da:	48 83 ec 20          	sub    $0x20,%rsp
  8022de:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8022e1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8022e5:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8022e8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022eb:	89 c7                	mov    %eax,%edi
  8022ed:	48 b8 9c 20 80 00 00 	movabs $0x80209c,%rax
  8022f4:	00 00 00 
  8022f7:	ff d0                	callq  *%rax
  8022f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802300:	79 05                	jns    802307 <connect+0x31>
  802302:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802305:	eb 1b                	jmp    802322 <connect+0x4c>
  802307:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80230a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80230e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802311:	48 89 ce             	mov    %rcx,%rsi
  802314:	89 c7                	mov    %eax,%edi
  802316:	48 b8 2d 26 80 00 00 	movabs $0x80262d,%rax
  80231d:	00 00 00 
  802320:	ff d0                	callq  *%rax
  802322:	c9                   	leaveq 
  802323:	c3                   	retq   

0000000000802324 <listen>:
  802324:	55                   	push   %rbp
  802325:	48 89 e5             	mov    %rsp,%rbp
  802328:	48 83 ec 20          	sub    $0x20,%rsp
  80232c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80232f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802332:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802335:	89 c7                	mov    %eax,%edi
  802337:	48 b8 9c 20 80 00 00 	movabs $0x80209c,%rax
  80233e:	00 00 00 
  802341:	ff d0                	callq  *%rax
  802343:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802346:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80234a:	79 05                	jns    802351 <listen+0x2d>
  80234c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80234f:	eb 16                	jmp    802367 <listen+0x43>
  802351:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802354:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802357:	89 d6                	mov    %edx,%esi
  802359:	89 c7                	mov    %eax,%edi
  80235b:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  802362:	00 00 00 
  802365:	ff d0                	callq  *%rax
  802367:	c9                   	leaveq 
  802368:	c3                   	retq   

0000000000802369 <devsock_read>:
  802369:	55                   	push   %rbp
  80236a:	48 89 e5             	mov    %rsp,%rbp
  80236d:	48 83 ec 20          	sub    $0x20,%rsp
  802371:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802375:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802379:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80237d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802381:	89 c2                	mov    %eax,%edx
  802383:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802387:	8b 40 0c             	mov    0xc(%rax),%eax
  80238a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80238e:	b9 00 00 00 00       	mov    $0x0,%ecx
  802393:	89 c7                	mov    %eax,%edi
  802395:	48 b8 d1 26 80 00 00 	movabs $0x8026d1,%rax
  80239c:	00 00 00 
  80239f:	ff d0                	callq  *%rax
  8023a1:	c9                   	leaveq 
  8023a2:	c3                   	retq   

00000000008023a3 <devsock_write>:
  8023a3:	55                   	push   %rbp
  8023a4:	48 89 e5             	mov    %rsp,%rbp
  8023a7:	48 83 ec 20          	sub    $0x20,%rsp
  8023ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8023af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023b3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8023b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023bb:	89 c2                	mov    %eax,%edx
  8023bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023c1:	8b 40 0c             	mov    0xc(%rax),%eax
  8023c4:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8023c8:	b9 00 00 00 00       	mov    $0x0,%ecx
  8023cd:	89 c7                	mov    %eax,%edi
  8023cf:	48 b8 9d 27 80 00 00 	movabs $0x80279d,%rax
  8023d6:	00 00 00 
  8023d9:	ff d0                	callq  *%rax
  8023db:	c9                   	leaveq 
  8023dc:	c3                   	retq   

00000000008023dd <devsock_stat>:
  8023dd:	55                   	push   %rbp
  8023de:	48 89 e5             	mov    %rsp,%rbp
  8023e1:	48 83 ec 10          	sub    $0x10,%rsp
  8023e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8023e9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023f1:	48 be 52 42 80 00 00 	movabs $0x804252,%rsi
  8023f8:	00 00 00 
  8023fb:	48 89 c7             	mov    %rax,%rdi
  8023fe:	48 b8 64 02 80 00 00 	movabs $0x800264,%rax
  802405:	00 00 00 
  802408:	ff d0                	callq  *%rax
  80240a:	b8 00 00 00 00       	mov    $0x0,%eax
  80240f:	c9                   	leaveq 
  802410:	c3                   	retq   

0000000000802411 <socket>:
  802411:	55                   	push   %rbp
  802412:	48 89 e5             	mov    %rsp,%rbp
  802415:	48 83 ec 20          	sub    $0x20,%rsp
  802419:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80241c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80241f:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  802422:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802425:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  802428:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80242b:	89 ce                	mov    %ecx,%esi
  80242d:	89 c7                	mov    %eax,%edi
  80242f:	48 b8 55 28 80 00 00 	movabs $0x802855,%rax
  802436:	00 00 00 
  802439:	ff d0                	callq  *%rax
  80243b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80243e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802442:	79 05                	jns    802449 <socket+0x38>
  802444:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802447:	eb 11                	jmp    80245a <socket+0x49>
  802449:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80244c:	89 c7                	mov    %eax,%edi
  80244e:	48 b8 f3 20 80 00 00 	movabs $0x8020f3,%rax
  802455:	00 00 00 
  802458:	ff d0                	callq  *%rax
  80245a:	c9                   	leaveq 
  80245b:	c3                   	retq   

000000000080245c <nsipc>:
  80245c:	55                   	push   %rbp
  80245d:	48 89 e5             	mov    %rsp,%rbp
  802460:	48 83 ec 10          	sub    $0x10,%rsp
  802464:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802467:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80246e:	00 00 00 
  802471:	8b 00                	mov    (%rax),%eax
  802473:	85 c0                	test   %eax,%eax
  802475:	75 1d                	jne    802494 <nsipc+0x38>
  802477:	bf 02 00 00 00       	mov    $0x2,%edi
  80247c:	48 b8 fd 3f 80 00 00 	movabs $0x803ffd,%rax
  802483:	00 00 00 
  802486:	ff d0                	callq  *%rax
  802488:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  80248f:	00 00 00 
  802492:	89 02                	mov    %eax,(%rdx)
  802494:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80249b:	00 00 00 
  80249e:	8b 00                	mov    (%rax),%eax
  8024a0:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8024a3:	b9 07 00 00 00       	mov    $0x7,%ecx
  8024a8:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8024af:	00 00 00 
  8024b2:	89 c7                	mov    %eax,%edi
  8024b4:	48 b8 67 3f 80 00 00 	movabs $0x803f67,%rax
  8024bb:	00 00 00 
  8024be:	ff d0                	callq  *%rax
  8024c0:	ba 00 00 00 00       	mov    $0x0,%edx
  8024c5:	be 00 00 00 00       	mov    $0x0,%esi
  8024ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8024cf:	48 b8 a6 3e 80 00 00 	movabs $0x803ea6,%rax
  8024d6:	00 00 00 
  8024d9:	ff d0                	callq  *%rax
  8024db:	c9                   	leaveq 
  8024dc:	c3                   	retq   

00000000008024dd <nsipc_accept>:
  8024dd:	55                   	push   %rbp
  8024de:	48 89 e5             	mov    %rsp,%rbp
  8024e1:	48 83 ec 30          	sub    $0x30,%rsp
  8024e5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024e8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8024ec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8024f0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8024f7:	00 00 00 
  8024fa:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8024fd:	89 10                	mov    %edx,(%rax)
  8024ff:	bf 01 00 00 00       	mov    $0x1,%edi
  802504:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  80250b:	00 00 00 
  80250e:	ff d0                	callq  *%rax
  802510:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802513:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802517:	78 3e                	js     802557 <nsipc_accept+0x7a>
  802519:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802520:	00 00 00 
  802523:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802527:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80252b:	8b 40 10             	mov    0x10(%rax),%eax
  80252e:	89 c2                	mov    %eax,%edx
  802530:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  802534:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802538:	48 89 ce             	mov    %rcx,%rsi
  80253b:	48 89 c7             	mov    %rax,%rdi
  80253e:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  802545:	00 00 00 
  802548:	ff d0                	callq  *%rax
  80254a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80254e:	8b 50 10             	mov    0x10(%rax),%edx
  802551:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802555:	89 10                	mov    %edx,(%rax)
  802557:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80255a:	c9                   	leaveq 
  80255b:	c3                   	retq   

000000000080255c <nsipc_bind>:
  80255c:	55                   	push   %rbp
  80255d:	48 89 e5             	mov    %rsp,%rbp
  802560:	48 83 ec 10          	sub    $0x10,%rsp
  802564:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802567:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80256b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80256e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802575:	00 00 00 
  802578:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80257b:	89 10                	mov    %edx,(%rax)
  80257d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  802580:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802584:	48 89 c6             	mov    %rax,%rsi
  802587:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80258e:	00 00 00 
  802591:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  802598:	00 00 00 
  80259b:	ff d0                	callq  *%rax
  80259d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8025a4:	00 00 00 
  8025a7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8025aa:	89 50 14             	mov    %edx,0x14(%rax)
  8025ad:	bf 02 00 00 00       	mov    $0x2,%edi
  8025b2:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  8025b9:	00 00 00 
  8025bc:	ff d0                	callq  *%rax
  8025be:	c9                   	leaveq 
  8025bf:	c3                   	retq   

00000000008025c0 <nsipc_shutdown>:
  8025c0:	55                   	push   %rbp
  8025c1:	48 89 e5             	mov    %rsp,%rbp
  8025c4:	48 83 ec 10          	sub    $0x10,%rsp
  8025c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8025cb:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8025ce:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8025d5:	00 00 00 
  8025d8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025db:	89 10                	mov    %edx,(%rax)
  8025dd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8025e4:	00 00 00 
  8025e7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8025ea:	89 50 04             	mov    %edx,0x4(%rax)
  8025ed:	bf 03 00 00 00       	mov    $0x3,%edi
  8025f2:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  8025f9:	00 00 00 
  8025fc:	ff d0                	callq  *%rax
  8025fe:	c9                   	leaveq 
  8025ff:	c3                   	retq   

0000000000802600 <nsipc_close>:
  802600:	55                   	push   %rbp
  802601:	48 89 e5             	mov    %rsp,%rbp
  802604:	48 83 ec 10          	sub    $0x10,%rsp
  802608:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80260b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802612:	00 00 00 
  802615:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802618:	89 10                	mov    %edx,(%rax)
  80261a:	bf 04 00 00 00       	mov    $0x4,%edi
  80261f:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  802626:	00 00 00 
  802629:	ff d0                	callq  *%rax
  80262b:	c9                   	leaveq 
  80262c:	c3                   	retq   

000000000080262d <nsipc_connect>:
  80262d:	55                   	push   %rbp
  80262e:	48 89 e5             	mov    %rsp,%rbp
  802631:	48 83 ec 10          	sub    $0x10,%rsp
  802635:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802638:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80263c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80263f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802646:	00 00 00 
  802649:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80264c:	89 10                	mov    %edx,(%rax)
  80264e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  802651:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802655:	48 89 c6             	mov    %rax,%rsi
  802658:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80265f:	00 00 00 
  802662:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  802669:	00 00 00 
  80266c:	ff d0                	callq  *%rax
  80266e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802675:	00 00 00 
  802678:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80267b:	89 50 14             	mov    %edx,0x14(%rax)
  80267e:	bf 05 00 00 00       	mov    $0x5,%edi
  802683:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  80268a:	00 00 00 
  80268d:	ff d0                	callq  *%rax
  80268f:	c9                   	leaveq 
  802690:	c3                   	retq   

0000000000802691 <nsipc_listen>:
  802691:	55                   	push   %rbp
  802692:	48 89 e5             	mov    %rsp,%rbp
  802695:	48 83 ec 10          	sub    $0x10,%rsp
  802699:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80269c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80269f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8026a6:	00 00 00 
  8026a9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8026ac:	89 10                	mov    %edx,(%rax)
  8026ae:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8026b5:	00 00 00 
  8026b8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8026bb:	89 50 04             	mov    %edx,0x4(%rax)
  8026be:	bf 06 00 00 00       	mov    $0x6,%edi
  8026c3:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  8026ca:	00 00 00 
  8026cd:	ff d0                	callq  *%rax
  8026cf:	c9                   	leaveq 
  8026d0:	c3                   	retq   

00000000008026d1 <nsipc_recv>:
  8026d1:	55                   	push   %rbp
  8026d2:	48 89 e5             	mov    %rsp,%rbp
  8026d5:	48 83 ec 30          	sub    $0x30,%rsp
  8026d9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8026dc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026e0:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8026e3:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8026e6:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8026ed:	00 00 00 
  8026f0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8026f3:	89 10                	mov    %edx,(%rax)
  8026f5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8026fc:	00 00 00 
  8026ff:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802702:	89 50 04             	mov    %edx,0x4(%rax)
  802705:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80270c:	00 00 00 
  80270f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802712:	89 50 08             	mov    %edx,0x8(%rax)
  802715:	bf 07 00 00 00       	mov    $0x7,%edi
  80271a:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  802721:	00 00 00 
  802724:	ff d0                	callq  *%rax
  802726:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802729:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80272d:	78 69                	js     802798 <nsipc_recv+0xc7>
  80272f:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  802736:	7f 08                	jg     802740 <nsipc_recv+0x6f>
  802738:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80273b:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80273e:	7e 35                	jle    802775 <nsipc_recv+0xa4>
  802740:	48 b9 59 42 80 00 00 	movabs $0x804259,%rcx
  802747:	00 00 00 
  80274a:	48 ba 6e 42 80 00 00 	movabs $0x80426e,%rdx
  802751:	00 00 00 
  802754:	be 62 00 00 00       	mov    $0x62,%esi
  802759:	48 bf 83 42 80 00 00 	movabs $0x804283,%rdi
  802760:	00 00 00 
  802763:	b8 00 00 00 00       	mov    $0x0,%eax
  802768:	49 b8 24 31 80 00 00 	movabs $0x803124,%r8
  80276f:	00 00 00 
  802772:	41 ff d0             	callq  *%r8
  802775:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802778:	48 63 d0             	movslq %eax,%rdx
  80277b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80277f:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  802786:	00 00 00 
  802789:	48 89 c7             	mov    %rax,%rdi
  80278c:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  802793:	00 00 00 
  802796:	ff d0                	callq  *%rax
  802798:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80279b:	c9                   	leaveq 
  80279c:	c3                   	retq   

000000000080279d <nsipc_send>:
  80279d:	55                   	push   %rbp
  80279e:	48 89 e5             	mov    %rsp,%rbp
  8027a1:	48 83 ec 20          	sub    $0x20,%rsp
  8027a5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8027a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8027ac:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8027af:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8027b2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8027b9:	00 00 00 
  8027bc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8027bf:	89 10                	mov    %edx,(%rax)
  8027c1:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8027c8:	7e 35                	jle    8027ff <nsipc_send+0x62>
  8027ca:	48 b9 92 42 80 00 00 	movabs $0x804292,%rcx
  8027d1:	00 00 00 
  8027d4:	48 ba 6e 42 80 00 00 	movabs $0x80426e,%rdx
  8027db:	00 00 00 
  8027de:	be 6d 00 00 00       	mov    $0x6d,%esi
  8027e3:	48 bf 83 42 80 00 00 	movabs $0x804283,%rdi
  8027ea:	00 00 00 
  8027ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8027f2:	49 b8 24 31 80 00 00 	movabs $0x803124,%r8
  8027f9:	00 00 00 
  8027fc:	41 ff d0             	callq  *%r8
  8027ff:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802802:	48 63 d0             	movslq %eax,%rdx
  802805:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802809:	48 89 c6             	mov    %rax,%rsi
  80280c:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  802813:	00 00 00 
  802816:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  80281d:	00 00 00 
  802820:	ff d0                	callq  *%rax
  802822:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802829:	00 00 00 
  80282c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80282f:	89 50 04             	mov    %edx,0x4(%rax)
  802832:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802839:	00 00 00 
  80283c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80283f:	89 50 08             	mov    %edx,0x8(%rax)
  802842:	bf 08 00 00 00       	mov    $0x8,%edi
  802847:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  80284e:	00 00 00 
  802851:	ff d0                	callq  *%rax
  802853:	c9                   	leaveq 
  802854:	c3                   	retq   

0000000000802855 <nsipc_socket>:
  802855:	55                   	push   %rbp
  802856:	48 89 e5             	mov    %rsp,%rbp
  802859:	48 83 ec 10          	sub    $0x10,%rsp
  80285d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802860:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802863:	89 55 f4             	mov    %edx,-0xc(%rbp)
  802866:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80286d:	00 00 00 
  802870:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802873:	89 10                	mov    %edx,(%rax)
  802875:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80287c:	00 00 00 
  80287f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  802882:	89 50 04             	mov    %edx,0x4(%rax)
  802885:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80288c:	00 00 00 
  80288f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802892:	89 50 08             	mov    %edx,0x8(%rax)
  802895:	bf 09 00 00 00       	mov    $0x9,%edi
  80289a:	48 b8 5c 24 80 00 00 	movabs $0x80245c,%rax
  8028a1:	00 00 00 
  8028a4:	ff d0                	callq  *%rax
  8028a6:	c9                   	leaveq 
  8028a7:	c3                   	retq   

00000000008028a8 <pipe>:
  8028a8:	55                   	push   %rbp
  8028a9:	48 89 e5             	mov    %rsp,%rbp
  8028ac:	53                   	push   %rbx
  8028ad:	48 83 ec 38          	sub    $0x38,%rsp
  8028b1:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8028b5:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8028b9:	48 89 c7             	mov    %rax,%rdi
  8028bc:	48 b8 bf 10 80 00 00 	movabs $0x8010bf,%rax
  8028c3:	00 00 00 
  8028c6:	ff d0                	callq  *%rax
  8028c8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028cf:	0f 88 bf 01 00 00    	js     802a94 <pipe+0x1ec>
  8028d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028d9:	ba 07 04 00 00       	mov    $0x407,%edx
  8028de:	48 89 c6             	mov    %rax,%rsi
  8028e1:	bf 00 00 00 00       	mov    $0x0,%edi
  8028e6:	48 b8 93 0b 80 00 00 	movabs $0x800b93,%rax
  8028ed:	00 00 00 
  8028f0:	ff d0                	callq  *%rax
  8028f2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028f5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028f9:	0f 88 95 01 00 00    	js     802a94 <pipe+0x1ec>
  8028ff:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  802903:	48 89 c7             	mov    %rax,%rdi
  802906:	48 b8 bf 10 80 00 00 	movabs $0x8010bf,%rax
  80290d:	00 00 00 
  802910:	ff d0                	callq  *%rax
  802912:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802915:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802919:	0f 88 5d 01 00 00    	js     802a7c <pipe+0x1d4>
  80291f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802923:	ba 07 04 00 00       	mov    $0x407,%edx
  802928:	48 89 c6             	mov    %rax,%rsi
  80292b:	bf 00 00 00 00       	mov    $0x0,%edi
  802930:	48 b8 93 0b 80 00 00 	movabs $0x800b93,%rax
  802937:	00 00 00 
  80293a:	ff d0                	callq  *%rax
  80293c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80293f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802943:	0f 88 33 01 00 00    	js     802a7c <pipe+0x1d4>
  802949:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80294d:	48 89 c7             	mov    %rax,%rdi
  802950:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  802957:	00 00 00 
  80295a:	ff d0                	callq  *%rax
  80295c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802960:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802964:	ba 07 04 00 00       	mov    $0x407,%edx
  802969:	48 89 c6             	mov    %rax,%rsi
  80296c:	bf 00 00 00 00       	mov    $0x0,%edi
  802971:	48 b8 93 0b 80 00 00 	movabs $0x800b93,%rax
  802978:	00 00 00 
  80297b:	ff d0                	callq  *%rax
  80297d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802980:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802984:	79 05                	jns    80298b <pipe+0xe3>
  802986:	e9 d9 00 00 00       	jmpq   802a64 <pipe+0x1bc>
  80298b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80298f:	48 89 c7             	mov    %rax,%rdi
  802992:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  802999:	00 00 00 
  80299c:	ff d0                	callq  *%rax
  80299e:	48 89 c2             	mov    %rax,%rdx
  8029a1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029a5:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8029ab:	48 89 d1             	mov    %rdx,%rcx
  8029ae:	ba 00 00 00 00       	mov    $0x0,%edx
  8029b3:	48 89 c6             	mov    %rax,%rsi
  8029b6:	bf 00 00 00 00       	mov    $0x0,%edi
  8029bb:	48 b8 e3 0b 80 00 00 	movabs $0x800be3,%rax
  8029c2:	00 00 00 
  8029c5:	ff d0                	callq  *%rax
  8029c7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029ca:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8029ce:	79 1b                	jns    8029eb <pipe+0x143>
  8029d0:	90                   	nop
  8029d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029d5:	48 89 c6             	mov    %rax,%rsi
  8029d8:	bf 00 00 00 00       	mov    $0x0,%edi
  8029dd:	48 b8 3e 0c 80 00 00 	movabs $0x800c3e,%rax
  8029e4:	00 00 00 
  8029e7:	ff d0                	callq  *%rax
  8029e9:	eb 79                	jmp    802a64 <pipe+0x1bc>
  8029eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029ef:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8029f6:	00 00 00 
  8029f9:	8b 12                	mov    (%rdx),%edx
  8029fb:	89 10                	mov    %edx,(%rax)
  8029fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a01:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  802a08:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a0c:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  802a13:	00 00 00 
  802a16:	8b 12                	mov    (%rdx),%edx
  802a18:	89 10                	mov    %edx,(%rax)
  802a1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a1e:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  802a25:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a29:	48 89 c7             	mov    %rax,%rdi
  802a2c:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  802a33:	00 00 00 
  802a36:	ff d0                	callq  *%rax
  802a38:	89 c2                	mov    %eax,%edx
  802a3a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802a3e:	89 10                	mov    %edx,(%rax)
  802a40:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802a44:	48 8d 58 04          	lea    0x4(%rax),%rbx
  802a48:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a4c:	48 89 c7             	mov    %rax,%rdi
  802a4f:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  802a56:	00 00 00 
  802a59:	ff d0                	callq  *%rax
  802a5b:	89 03                	mov    %eax,(%rbx)
  802a5d:	b8 00 00 00 00       	mov    $0x0,%eax
  802a62:	eb 33                	jmp    802a97 <pipe+0x1ef>
  802a64:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a68:	48 89 c6             	mov    %rax,%rsi
  802a6b:	bf 00 00 00 00       	mov    $0x0,%edi
  802a70:	48 b8 3e 0c 80 00 00 	movabs $0x800c3e,%rax
  802a77:	00 00 00 
  802a7a:	ff d0                	callq  *%rax
  802a7c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a80:	48 89 c6             	mov    %rax,%rsi
  802a83:	bf 00 00 00 00       	mov    $0x0,%edi
  802a88:	48 b8 3e 0c 80 00 00 	movabs $0x800c3e,%rax
  802a8f:	00 00 00 
  802a92:	ff d0                	callq  *%rax
  802a94:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a97:	48 83 c4 38          	add    $0x38,%rsp
  802a9b:	5b                   	pop    %rbx
  802a9c:	5d                   	pop    %rbp
  802a9d:	c3                   	retq   

0000000000802a9e <_pipeisclosed>:
  802a9e:	55                   	push   %rbp
  802a9f:	48 89 e5             	mov    %rsp,%rbp
  802aa2:	53                   	push   %rbx
  802aa3:	48 83 ec 28          	sub    $0x28,%rsp
  802aa7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802aab:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802aaf:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802ab6:	00 00 00 
  802ab9:	48 8b 00             	mov    (%rax),%rax
  802abc:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ac2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802ac5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ac9:	48 89 c7             	mov    %rax,%rdi
  802acc:	48 b8 6f 40 80 00 00 	movabs $0x80406f,%rax
  802ad3:	00 00 00 
  802ad6:	ff d0                	callq  *%rax
  802ad8:	89 c3                	mov    %eax,%ebx
  802ada:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ade:	48 89 c7             	mov    %rax,%rdi
  802ae1:	48 b8 6f 40 80 00 00 	movabs $0x80406f,%rax
  802ae8:	00 00 00 
  802aeb:	ff d0                	callq  *%rax
  802aed:	39 c3                	cmp    %eax,%ebx
  802aef:	0f 94 c0             	sete   %al
  802af2:	0f b6 c0             	movzbl %al,%eax
  802af5:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802af8:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802aff:	00 00 00 
  802b02:	48 8b 00             	mov    (%rax),%rax
  802b05:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b0b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  802b0e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b11:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  802b14:	75 05                	jne    802b1b <_pipeisclosed+0x7d>
  802b16:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802b19:	eb 4f                	jmp    802b6a <_pipeisclosed+0xcc>
  802b1b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b1e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  802b21:	74 42                	je     802b65 <_pipeisclosed+0xc7>
  802b23:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  802b27:	75 3c                	jne    802b65 <_pipeisclosed+0xc7>
  802b29:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802b30:	00 00 00 
  802b33:	48 8b 00             	mov    (%rax),%rax
  802b36:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  802b3c:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  802b3f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b42:	89 c6                	mov    %eax,%esi
  802b44:	48 bf a3 42 80 00 00 	movabs $0x8042a3,%rdi
  802b4b:	00 00 00 
  802b4e:	b8 00 00 00 00       	mov    $0x0,%eax
  802b53:	49 b8 5d 33 80 00 00 	movabs $0x80335d,%r8
  802b5a:	00 00 00 
  802b5d:	41 ff d0             	callq  *%r8
  802b60:	e9 4a ff ff ff       	jmpq   802aaf <_pipeisclosed+0x11>
  802b65:	e9 45 ff ff ff       	jmpq   802aaf <_pipeisclosed+0x11>
  802b6a:	48 83 c4 28          	add    $0x28,%rsp
  802b6e:	5b                   	pop    %rbx
  802b6f:	5d                   	pop    %rbp
  802b70:	c3                   	retq   

0000000000802b71 <pipeisclosed>:
  802b71:	55                   	push   %rbp
  802b72:	48 89 e5             	mov    %rsp,%rbp
  802b75:	48 83 ec 30          	sub    $0x30,%rsp
  802b79:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802b7c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b80:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b83:	48 89 d6             	mov    %rdx,%rsi
  802b86:	89 c7                	mov    %eax,%edi
  802b88:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  802b8f:	00 00 00 
  802b92:	ff d0                	callq  *%rax
  802b94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b9b:	79 05                	jns    802ba2 <pipeisclosed+0x31>
  802b9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ba0:	eb 31                	jmp    802bd3 <pipeisclosed+0x62>
  802ba2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ba6:	48 89 c7             	mov    %rax,%rdi
  802ba9:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  802bb0:	00 00 00 
  802bb3:	ff d0                	callq  *%rax
  802bb5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802bb9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bbd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802bc1:	48 89 d6             	mov    %rdx,%rsi
  802bc4:	48 89 c7             	mov    %rax,%rdi
  802bc7:	48 b8 9e 2a 80 00 00 	movabs $0x802a9e,%rax
  802bce:	00 00 00 
  802bd1:	ff d0                	callq  *%rax
  802bd3:	c9                   	leaveq 
  802bd4:	c3                   	retq   

0000000000802bd5 <devpipe_read>:
  802bd5:	55                   	push   %rbp
  802bd6:	48 89 e5             	mov    %rsp,%rbp
  802bd9:	48 83 ec 40          	sub    $0x40,%rsp
  802bdd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802be1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802be5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802be9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bed:	48 89 c7             	mov    %rax,%rdi
  802bf0:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  802bf7:	00 00 00 
  802bfa:	ff d0                	callq  *%rax
  802bfc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802c00:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c04:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802c08:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  802c0f:	00 
  802c10:	e9 92 00 00 00       	jmpq   802ca7 <devpipe_read+0xd2>
  802c15:	eb 41                	jmp    802c58 <devpipe_read+0x83>
  802c17:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  802c1c:	74 09                	je     802c27 <devpipe_read+0x52>
  802c1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c22:	e9 92 00 00 00       	jmpq   802cb9 <devpipe_read+0xe4>
  802c27:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c2b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c2f:	48 89 d6             	mov    %rdx,%rsi
  802c32:	48 89 c7             	mov    %rax,%rdi
  802c35:	48 b8 9e 2a 80 00 00 	movabs $0x802a9e,%rax
  802c3c:	00 00 00 
  802c3f:	ff d0                	callq  *%rax
  802c41:	85 c0                	test   %eax,%eax
  802c43:	74 07                	je     802c4c <devpipe_read+0x77>
  802c45:	b8 00 00 00 00       	mov    $0x0,%eax
  802c4a:	eb 6d                	jmp    802cb9 <devpipe_read+0xe4>
  802c4c:	48 b8 55 0b 80 00 00 	movabs $0x800b55,%rax
  802c53:	00 00 00 
  802c56:	ff d0                	callq  *%rax
  802c58:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c5c:	8b 10                	mov    (%rax),%edx
  802c5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c62:	8b 40 04             	mov    0x4(%rax),%eax
  802c65:	39 c2                	cmp    %eax,%edx
  802c67:	74 ae                	je     802c17 <devpipe_read+0x42>
  802c69:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c6d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c71:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  802c75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c79:	8b 00                	mov    (%rax),%eax
  802c7b:	99                   	cltd   
  802c7c:	c1 ea 1b             	shr    $0x1b,%edx
  802c7f:	01 d0                	add    %edx,%eax
  802c81:	83 e0 1f             	and    $0x1f,%eax
  802c84:	29 d0                	sub    %edx,%eax
  802c86:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c8a:	48 98                	cltq   
  802c8c:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  802c91:	88 01                	mov    %al,(%rcx)
  802c93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c97:	8b 00                	mov    (%rax),%eax
  802c99:	8d 50 01             	lea    0x1(%rax),%edx
  802c9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ca0:	89 10                	mov    %edx,(%rax)
  802ca2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802ca7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cab:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802caf:	0f 82 60 ff ff ff    	jb     802c15 <devpipe_read+0x40>
  802cb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cb9:	c9                   	leaveq 
  802cba:	c3                   	retq   

0000000000802cbb <devpipe_write>:
  802cbb:	55                   	push   %rbp
  802cbc:	48 89 e5             	mov    %rsp,%rbp
  802cbf:	48 83 ec 40          	sub    $0x40,%rsp
  802cc3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802cc7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ccb:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802ccf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802cd3:	48 89 c7             	mov    %rax,%rdi
  802cd6:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  802cdd:	00 00 00 
  802ce0:	ff d0                	callq  *%rax
  802ce2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802ce6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802cea:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802cee:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  802cf5:	00 
  802cf6:	e9 8e 00 00 00       	jmpq   802d89 <devpipe_write+0xce>
  802cfb:	eb 31                	jmp    802d2e <devpipe_write+0x73>
  802cfd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802d01:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d05:	48 89 d6             	mov    %rdx,%rsi
  802d08:	48 89 c7             	mov    %rax,%rdi
  802d0b:	48 b8 9e 2a 80 00 00 	movabs $0x802a9e,%rax
  802d12:	00 00 00 
  802d15:	ff d0                	callq  *%rax
  802d17:	85 c0                	test   %eax,%eax
  802d19:	74 07                	je     802d22 <devpipe_write+0x67>
  802d1b:	b8 00 00 00 00       	mov    $0x0,%eax
  802d20:	eb 79                	jmp    802d9b <devpipe_write+0xe0>
  802d22:	48 b8 55 0b 80 00 00 	movabs $0x800b55,%rax
  802d29:	00 00 00 
  802d2c:	ff d0                	callq  *%rax
  802d2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d32:	8b 40 04             	mov    0x4(%rax),%eax
  802d35:	48 63 d0             	movslq %eax,%rdx
  802d38:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d3c:	8b 00                	mov    (%rax),%eax
  802d3e:	48 98                	cltq   
  802d40:	48 83 c0 20          	add    $0x20,%rax
  802d44:	48 39 c2             	cmp    %rax,%rdx
  802d47:	73 b4                	jae    802cfd <devpipe_write+0x42>
  802d49:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d4d:	8b 40 04             	mov    0x4(%rax),%eax
  802d50:	99                   	cltd   
  802d51:	c1 ea 1b             	shr    $0x1b,%edx
  802d54:	01 d0                	add    %edx,%eax
  802d56:	83 e0 1f             	and    $0x1f,%eax
  802d59:	29 d0                	sub    %edx,%eax
  802d5b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802d5f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802d63:	48 01 ca             	add    %rcx,%rdx
  802d66:	0f b6 0a             	movzbl (%rdx),%ecx
  802d69:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802d6d:	48 98                	cltq   
  802d6f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  802d73:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d77:	8b 40 04             	mov    0x4(%rax),%eax
  802d7a:	8d 50 01             	lea    0x1(%rax),%edx
  802d7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d81:	89 50 04             	mov    %edx,0x4(%rax)
  802d84:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802d89:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d8d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802d91:	0f 82 64 ff ff ff    	jb     802cfb <devpipe_write+0x40>
  802d97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d9b:	c9                   	leaveq 
  802d9c:	c3                   	retq   

0000000000802d9d <devpipe_stat>:
  802d9d:	55                   	push   %rbp
  802d9e:	48 89 e5             	mov    %rsp,%rbp
  802da1:	48 83 ec 20          	sub    $0x20,%rsp
  802da5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802da9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802dad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802db1:	48 89 c7             	mov    %rax,%rdi
  802db4:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  802dbb:	00 00 00 
  802dbe:	ff d0                	callq  *%rax
  802dc0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802dc4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802dc8:	48 be b6 42 80 00 00 	movabs $0x8042b6,%rsi
  802dcf:	00 00 00 
  802dd2:	48 89 c7             	mov    %rax,%rdi
  802dd5:	48 b8 64 02 80 00 00 	movabs $0x800264,%rax
  802ddc:	00 00 00 
  802ddf:	ff d0                	callq  *%rax
  802de1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802de5:	8b 50 04             	mov    0x4(%rax),%edx
  802de8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802dec:	8b 00                	mov    (%rax),%eax
  802dee:	29 c2                	sub    %eax,%edx
  802df0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802df4:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802dfa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802dfe:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802e05:	00 00 00 
  802e08:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802e0c:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  802e13:	00 00 00 
  802e16:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  802e1d:	b8 00 00 00 00       	mov    $0x0,%eax
  802e22:	c9                   	leaveq 
  802e23:	c3                   	retq   

0000000000802e24 <devpipe_close>:
  802e24:	55                   	push   %rbp
  802e25:	48 89 e5             	mov    %rsp,%rbp
  802e28:	48 83 ec 10          	sub    $0x10,%rsp
  802e2c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e30:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e34:	48 89 c6             	mov    %rax,%rsi
  802e37:	bf 00 00 00 00       	mov    $0x0,%edi
  802e3c:	48 b8 3e 0c 80 00 00 	movabs $0x800c3e,%rax
  802e43:	00 00 00 
  802e46:	ff d0                	callq  *%rax
  802e48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e4c:	48 89 c7             	mov    %rax,%rdi
  802e4f:	48 b8 94 10 80 00 00 	movabs $0x801094,%rax
  802e56:	00 00 00 
  802e59:	ff d0                	callq  *%rax
  802e5b:	48 89 c6             	mov    %rax,%rsi
  802e5e:	bf 00 00 00 00       	mov    $0x0,%edi
  802e63:	48 b8 3e 0c 80 00 00 	movabs $0x800c3e,%rax
  802e6a:	00 00 00 
  802e6d:	ff d0                	callq  *%rax
  802e6f:	c9                   	leaveq 
  802e70:	c3                   	retq   

0000000000802e71 <cputchar>:
  802e71:	55                   	push   %rbp
  802e72:	48 89 e5             	mov    %rsp,%rbp
  802e75:	48 83 ec 20          	sub    $0x20,%rsp
  802e79:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e7c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e7f:	88 45 ff             	mov    %al,-0x1(%rbp)
  802e82:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  802e86:	be 01 00 00 00       	mov    $0x1,%esi
  802e8b:	48 89 c7             	mov    %rax,%rdi
  802e8e:	48 b8 4b 0a 80 00 00 	movabs $0x800a4b,%rax
  802e95:	00 00 00 
  802e98:	ff d0                	callq  *%rax
  802e9a:	c9                   	leaveq 
  802e9b:	c3                   	retq   

0000000000802e9c <getchar>:
  802e9c:	55                   	push   %rbp
  802e9d:	48 89 e5             	mov    %rsp,%rbp
  802ea0:	48 83 ec 10          	sub    $0x10,%rsp
  802ea4:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  802ea8:	ba 01 00 00 00       	mov    $0x1,%edx
  802ead:	48 89 c6             	mov    %rax,%rsi
  802eb0:	bf 00 00 00 00       	mov    $0x0,%edi
  802eb5:	48 b8 89 15 80 00 00 	movabs $0x801589,%rax
  802ebc:	00 00 00 
  802ebf:	ff d0                	callq  *%rax
  802ec1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ec4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ec8:	79 05                	jns    802ecf <getchar+0x33>
  802eca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ecd:	eb 14                	jmp    802ee3 <getchar+0x47>
  802ecf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ed3:	7f 07                	jg     802edc <getchar+0x40>
  802ed5:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  802eda:	eb 07                	jmp    802ee3 <getchar+0x47>
  802edc:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  802ee0:	0f b6 c0             	movzbl %al,%eax
  802ee3:	c9                   	leaveq 
  802ee4:	c3                   	retq   

0000000000802ee5 <iscons>:
  802ee5:	55                   	push   %rbp
  802ee6:	48 89 e5             	mov    %rsp,%rbp
  802ee9:	48 83 ec 20          	sub    $0x20,%rsp
  802eed:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ef0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ef4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ef7:	48 89 d6             	mov    %rdx,%rsi
  802efa:	89 c7                	mov    %eax,%edi
  802efc:	48 b8 57 11 80 00 00 	movabs $0x801157,%rax
  802f03:	00 00 00 
  802f06:	ff d0                	callq  *%rax
  802f08:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f0b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f0f:	79 05                	jns    802f16 <iscons+0x31>
  802f11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f14:	eb 1a                	jmp    802f30 <iscons+0x4b>
  802f16:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f1a:	8b 10                	mov    (%rax),%edx
  802f1c:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  802f23:	00 00 00 
  802f26:	8b 00                	mov    (%rax),%eax
  802f28:	39 c2                	cmp    %eax,%edx
  802f2a:	0f 94 c0             	sete   %al
  802f2d:	0f b6 c0             	movzbl %al,%eax
  802f30:	c9                   	leaveq 
  802f31:	c3                   	retq   

0000000000802f32 <opencons>:
  802f32:	55                   	push   %rbp
  802f33:	48 89 e5             	mov    %rsp,%rbp
  802f36:	48 83 ec 10          	sub    $0x10,%rsp
  802f3a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802f3e:	48 89 c7             	mov    %rax,%rdi
  802f41:	48 b8 bf 10 80 00 00 	movabs $0x8010bf,%rax
  802f48:	00 00 00 
  802f4b:	ff d0                	callq  *%rax
  802f4d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f50:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f54:	79 05                	jns    802f5b <opencons+0x29>
  802f56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f59:	eb 5b                	jmp    802fb6 <opencons+0x84>
  802f5b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f5f:	ba 07 04 00 00       	mov    $0x407,%edx
  802f64:	48 89 c6             	mov    %rax,%rsi
  802f67:	bf 00 00 00 00       	mov    $0x0,%edi
  802f6c:	48 b8 93 0b 80 00 00 	movabs $0x800b93,%rax
  802f73:	00 00 00 
  802f76:	ff d0                	callq  *%rax
  802f78:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f7b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f7f:	79 05                	jns    802f86 <opencons+0x54>
  802f81:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f84:	eb 30                	jmp    802fb6 <opencons+0x84>
  802f86:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f8a:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  802f91:	00 00 00 
  802f94:	8b 12                	mov    (%rdx),%edx
  802f96:	89 10                	mov    %edx,(%rax)
  802f98:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f9c:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802fa3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fa7:	48 89 c7             	mov    %rax,%rdi
  802faa:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  802fb1:	00 00 00 
  802fb4:	ff d0                	callq  *%rax
  802fb6:	c9                   	leaveq 
  802fb7:	c3                   	retq   

0000000000802fb8 <devcons_read>:
  802fb8:	55                   	push   %rbp
  802fb9:	48 89 e5             	mov    %rsp,%rbp
  802fbc:	48 83 ec 30          	sub    $0x30,%rsp
  802fc0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fc4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fc8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802fcc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802fd1:	75 07                	jne    802fda <devcons_read+0x22>
  802fd3:	b8 00 00 00 00       	mov    $0x0,%eax
  802fd8:	eb 4b                	jmp    803025 <devcons_read+0x6d>
  802fda:	eb 0c                	jmp    802fe8 <devcons_read+0x30>
  802fdc:	48 b8 55 0b 80 00 00 	movabs $0x800b55,%rax
  802fe3:	00 00 00 
  802fe6:	ff d0                	callq  *%rax
  802fe8:	48 b8 95 0a 80 00 00 	movabs $0x800a95,%rax
  802fef:	00 00 00 
  802ff2:	ff d0                	callq  *%rax
  802ff4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ff7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ffb:	74 df                	je     802fdc <devcons_read+0x24>
  802ffd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803001:	79 05                	jns    803008 <devcons_read+0x50>
  803003:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803006:	eb 1d                	jmp    803025 <devcons_read+0x6d>
  803008:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80300c:	75 07                	jne    803015 <devcons_read+0x5d>
  80300e:	b8 00 00 00 00       	mov    $0x0,%eax
  803013:	eb 10                	jmp    803025 <devcons_read+0x6d>
  803015:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803018:	89 c2                	mov    %eax,%edx
  80301a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80301e:	88 10                	mov    %dl,(%rax)
  803020:	b8 01 00 00 00       	mov    $0x1,%eax
  803025:	c9                   	leaveq 
  803026:	c3                   	retq   

0000000000803027 <devcons_write>:
  803027:	55                   	push   %rbp
  803028:	48 89 e5             	mov    %rsp,%rbp
  80302b:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803032:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803039:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803040:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803047:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80304e:	eb 76                	jmp    8030c6 <devcons_write+0x9f>
  803050:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803057:	89 c2                	mov    %eax,%edx
  803059:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80305c:	29 c2                	sub    %eax,%edx
  80305e:	89 d0                	mov    %edx,%eax
  803060:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803063:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803066:	83 f8 7f             	cmp    $0x7f,%eax
  803069:	76 07                	jbe    803072 <devcons_write+0x4b>
  80306b:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803072:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803075:	48 63 d0             	movslq %eax,%rdx
  803078:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80307b:	48 63 c8             	movslq %eax,%rcx
  80307e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803085:	48 01 c1             	add    %rax,%rcx
  803088:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80308f:	48 89 ce             	mov    %rcx,%rsi
  803092:	48 89 c7             	mov    %rax,%rdi
  803095:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  80309c:	00 00 00 
  80309f:	ff d0                	callq  *%rax
  8030a1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8030a4:	48 63 d0             	movslq %eax,%rdx
  8030a7:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8030ae:	48 89 d6             	mov    %rdx,%rsi
  8030b1:	48 89 c7             	mov    %rax,%rdi
  8030b4:	48 b8 4b 0a 80 00 00 	movabs $0x800a4b,%rax
  8030bb:	00 00 00 
  8030be:	ff d0                	callq  *%rax
  8030c0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8030c3:	01 45 fc             	add    %eax,-0x4(%rbp)
  8030c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030c9:	48 98                	cltq   
  8030cb:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8030d2:	0f 82 78 ff ff ff    	jb     803050 <devcons_write+0x29>
  8030d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030db:	c9                   	leaveq 
  8030dc:	c3                   	retq   

00000000008030dd <devcons_close>:
  8030dd:	55                   	push   %rbp
  8030de:	48 89 e5             	mov    %rsp,%rbp
  8030e1:	48 83 ec 08          	sub    $0x8,%rsp
  8030e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8030ee:	c9                   	leaveq 
  8030ef:	c3                   	retq   

00000000008030f0 <devcons_stat>:
  8030f0:	55                   	push   %rbp
  8030f1:	48 89 e5             	mov    %rsp,%rbp
  8030f4:	48 83 ec 10          	sub    $0x10,%rsp
  8030f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030fc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803100:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803104:	48 be c2 42 80 00 00 	movabs $0x8042c2,%rsi
  80310b:	00 00 00 
  80310e:	48 89 c7             	mov    %rax,%rdi
  803111:	48 b8 64 02 80 00 00 	movabs $0x800264,%rax
  803118:	00 00 00 
  80311b:	ff d0                	callq  *%rax
  80311d:	b8 00 00 00 00       	mov    $0x0,%eax
  803122:	c9                   	leaveq 
  803123:	c3                   	retq   

0000000000803124 <_panic>:
  803124:	55                   	push   %rbp
  803125:	48 89 e5             	mov    %rsp,%rbp
  803128:	53                   	push   %rbx
  803129:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803130:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803137:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80313d:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803144:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80314b:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803152:	84 c0                	test   %al,%al
  803154:	74 23                	je     803179 <_panic+0x55>
  803156:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80315d:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803161:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803165:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803169:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80316d:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803171:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803175:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803179:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803180:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803187:	00 00 00 
  80318a:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  803191:	00 00 00 
  803194:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803198:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80319f:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8031a6:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8031ad:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8031b4:	00 00 00 
  8031b7:	48 8b 18             	mov    (%rax),%rbx
  8031ba:	48 b8 17 0b 80 00 00 	movabs $0x800b17,%rax
  8031c1:	00 00 00 
  8031c4:	ff d0                	callq  *%rax
  8031c6:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8031cc:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8031d3:	41 89 c8             	mov    %ecx,%r8d
  8031d6:	48 89 d1             	mov    %rdx,%rcx
  8031d9:	48 89 da             	mov    %rbx,%rdx
  8031dc:	89 c6                	mov    %eax,%esi
  8031de:	48 bf d0 42 80 00 00 	movabs $0x8042d0,%rdi
  8031e5:	00 00 00 
  8031e8:	b8 00 00 00 00       	mov    $0x0,%eax
  8031ed:	49 b9 5d 33 80 00 00 	movabs $0x80335d,%r9
  8031f4:	00 00 00 
  8031f7:	41 ff d1             	callq  *%r9
  8031fa:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  803201:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803208:	48 89 d6             	mov    %rdx,%rsi
  80320b:	48 89 c7             	mov    %rax,%rdi
  80320e:	48 b8 b1 32 80 00 00 	movabs $0x8032b1,%rax
  803215:	00 00 00 
  803218:	ff d0                	callq  *%rax
  80321a:	48 bf f3 42 80 00 00 	movabs $0x8042f3,%rdi
  803221:	00 00 00 
  803224:	b8 00 00 00 00       	mov    $0x0,%eax
  803229:	48 ba 5d 33 80 00 00 	movabs $0x80335d,%rdx
  803230:	00 00 00 
  803233:	ff d2                	callq  *%rdx
  803235:	cc                   	int3   
  803236:	eb fd                	jmp    803235 <_panic+0x111>

0000000000803238 <putch>:
  803238:	55                   	push   %rbp
  803239:	48 89 e5             	mov    %rsp,%rbp
  80323c:	48 83 ec 10          	sub    $0x10,%rsp
  803240:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803243:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803247:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80324b:	8b 00                	mov    (%rax),%eax
  80324d:	8d 48 01             	lea    0x1(%rax),%ecx
  803250:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803254:	89 0a                	mov    %ecx,(%rdx)
  803256:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803259:	89 d1                	mov    %edx,%ecx
  80325b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80325f:	48 98                	cltq   
  803261:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803265:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803269:	8b 00                	mov    (%rax),%eax
  80326b:	3d ff 00 00 00       	cmp    $0xff,%eax
  803270:	75 2c                	jne    80329e <putch+0x66>
  803272:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803276:	8b 00                	mov    (%rax),%eax
  803278:	48 98                	cltq   
  80327a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80327e:	48 83 c2 08          	add    $0x8,%rdx
  803282:	48 89 c6             	mov    %rax,%rsi
  803285:	48 89 d7             	mov    %rdx,%rdi
  803288:	48 b8 4b 0a 80 00 00 	movabs $0x800a4b,%rax
  80328f:	00 00 00 
  803292:	ff d0                	callq  *%rax
  803294:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803298:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80329e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032a2:	8b 40 04             	mov    0x4(%rax),%eax
  8032a5:	8d 50 01             	lea    0x1(%rax),%edx
  8032a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032ac:	89 50 04             	mov    %edx,0x4(%rax)
  8032af:	c9                   	leaveq 
  8032b0:	c3                   	retq   

00000000008032b1 <vcprintf>:
  8032b1:	55                   	push   %rbp
  8032b2:	48 89 e5             	mov    %rsp,%rbp
  8032b5:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8032bc:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8032c3:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8032ca:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8032d1:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8032d8:	48 8b 0a             	mov    (%rdx),%rcx
  8032db:	48 89 08             	mov    %rcx,(%rax)
  8032de:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8032e2:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8032e6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8032ea:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8032ee:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8032f5:	00 00 00 
  8032f8:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8032ff:	00 00 00 
  803302:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  803309:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  803310:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803317:	48 89 c6             	mov    %rax,%rsi
  80331a:	48 bf 38 32 80 00 00 	movabs $0x803238,%rdi
  803321:	00 00 00 
  803324:	48 b8 10 37 80 00 00 	movabs $0x803710,%rax
  80332b:	00 00 00 
  80332e:	ff d0                	callq  *%rax
  803330:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  803336:	48 98                	cltq   
  803338:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80333f:	48 83 c2 08          	add    $0x8,%rdx
  803343:	48 89 c6             	mov    %rax,%rsi
  803346:	48 89 d7             	mov    %rdx,%rdi
  803349:	48 b8 4b 0a 80 00 00 	movabs $0x800a4b,%rax
  803350:	00 00 00 
  803353:	ff d0                	callq  *%rax
  803355:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80335b:	c9                   	leaveq 
  80335c:	c3                   	retq   

000000000080335d <cprintf>:
  80335d:	55                   	push   %rbp
  80335e:	48 89 e5             	mov    %rsp,%rbp
  803361:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  803368:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80336f:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803376:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80337d:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803384:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80338b:	84 c0                	test   %al,%al
  80338d:	74 20                	je     8033af <cprintf+0x52>
  80338f:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803393:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803397:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80339b:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80339f:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8033a3:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8033a7:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8033ab:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8033af:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8033b6:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8033bd:	00 00 00 
  8033c0:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8033c7:	00 00 00 
  8033ca:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8033ce:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8033d5:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8033dc:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8033e3:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8033ea:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8033f1:	48 8b 0a             	mov    (%rdx),%rcx
  8033f4:	48 89 08             	mov    %rcx,(%rax)
  8033f7:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8033fb:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8033ff:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803403:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803407:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80340e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803415:	48 89 d6             	mov    %rdx,%rsi
  803418:	48 89 c7             	mov    %rax,%rdi
  80341b:	48 b8 b1 32 80 00 00 	movabs $0x8032b1,%rax
  803422:	00 00 00 
  803425:	ff d0                	callq  *%rax
  803427:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80342d:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803433:	c9                   	leaveq 
  803434:	c3                   	retq   

0000000000803435 <printnum>:
  803435:	55                   	push   %rbp
  803436:	48 89 e5             	mov    %rsp,%rbp
  803439:	53                   	push   %rbx
  80343a:	48 83 ec 38          	sub    $0x38,%rsp
  80343e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803442:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803446:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80344a:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80344d:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  803451:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  803455:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803458:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80345c:	77 3b                	ja     803499 <printnum+0x64>
  80345e:	8b 45 d0             	mov    -0x30(%rbp),%eax
  803461:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  803465:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  803468:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80346c:	ba 00 00 00 00       	mov    $0x0,%edx
  803471:	48 f7 f3             	div    %rbx
  803474:	48 89 c2             	mov    %rax,%rdx
  803477:	8b 7d cc             	mov    -0x34(%rbp),%edi
  80347a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80347d:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  803481:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803485:	41 89 f9             	mov    %edi,%r9d
  803488:	48 89 c7             	mov    %rax,%rdi
  80348b:	48 b8 35 34 80 00 00 	movabs $0x803435,%rax
  803492:	00 00 00 
  803495:	ff d0                	callq  *%rax
  803497:	eb 1e                	jmp    8034b7 <printnum+0x82>
  803499:	eb 12                	jmp    8034ad <printnum+0x78>
  80349b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80349f:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8034a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034a6:	48 89 ce             	mov    %rcx,%rsi
  8034a9:	89 d7                	mov    %edx,%edi
  8034ab:	ff d0                	callq  *%rax
  8034ad:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8034b1:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8034b5:	7f e4                	jg     80349b <printnum+0x66>
  8034b7:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8034ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8034be:	ba 00 00 00 00       	mov    $0x0,%edx
  8034c3:	48 f7 f1             	div    %rcx
  8034c6:	48 89 d0             	mov    %rdx,%rax
  8034c9:	48 ba f0 44 80 00 00 	movabs $0x8044f0,%rdx
  8034d0:	00 00 00 
  8034d3:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8034d7:	0f be d0             	movsbl %al,%edx
  8034da:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8034de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034e2:	48 89 ce             	mov    %rcx,%rsi
  8034e5:	89 d7                	mov    %edx,%edi
  8034e7:	ff d0                	callq  *%rax
  8034e9:	48 83 c4 38          	add    $0x38,%rsp
  8034ed:	5b                   	pop    %rbx
  8034ee:	5d                   	pop    %rbp
  8034ef:	c3                   	retq   

00000000008034f0 <getuint>:
  8034f0:	55                   	push   %rbp
  8034f1:	48 89 e5             	mov    %rsp,%rbp
  8034f4:	48 83 ec 1c          	sub    $0x1c,%rsp
  8034f8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034fc:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8034ff:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  803503:	7e 52                	jle    803557 <getuint+0x67>
  803505:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803509:	8b 00                	mov    (%rax),%eax
  80350b:	83 f8 30             	cmp    $0x30,%eax
  80350e:	73 24                	jae    803534 <getuint+0x44>
  803510:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803514:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803518:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80351c:	8b 00                	mov    (%rax),%eax
  80351e:	89 c0                	mov    %eax,%eax
  803520:	48 01 d0             	add    %rdx,%rax
  803523:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803527:	8b 12                	mov    (%rdx),%edx
  803529:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80352c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803530:	89 0a                	mov    %ecx,(%rdx)
  803532:	eb 17                	jmp    80354b <getuint+0x5b>
  803534:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803538:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80353c:	48 89 d0             	mov    %rdx,%rax
  80353f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  803543:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803547:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80354b:	48 8b 00             	mov    (%rax),%rax
  80354e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803552:	e9 a3 00 00 00       	jmpq   8035fa <getuint+0x10a>
  803557:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80355b:	74 4f                	je     8035ac <getuint+0xbc>
  80355d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803561:	8b 00                	mov    (%rax),%eax
  803563:	83 f8 30             	cmp    $0x30,%eax
  803566:	73 24                	jae    80358c <getuint+0x9c>
  803568:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80356c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803570:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803574:	8b 00                	mov    (%rax),%eax
  803576:	89 c0                	mov    %eax,%eax
  803578:	48 01 d0             	add    %rdx,%rax
  80357b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80357f:	8b 12                	mov    (%rdx),%edx
  803581:	8d 4a 08             	lea    0x8(%rdx),%ecx
  803584:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803588:	89 0a                	mov    %ecx,(%rdx)
  80358a:	eb 17                	jmp    8035a3 <getuint+0xb3>
  80358c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803590:	48 8b 50 08          	mov    0x8(%rax),%rdx
  803594:	48 89 d0             	mov    %rdx,%rax
  803597:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80359b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80359f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8035a3:	48 8b 00             	mov    (%rax),%rax
  8035a6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8035aa:	eb 4e                	jmp    8035fa <getuint+0x10a>
  8035ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035b0:	8b 00                	mov    (%rax),%eax
  8035b2:	83 f8 30             	cmp    $0x30,%eax
  8035b5:	73 24                	jae    8035db <getuint+0xeb>
  8035b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035bb:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8035bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035c3:	8b 00                	mov    (%rax),%eax
  8035c5:	89 c0                	mov    %eax,%eax
  8035c7:	48 01 d0             	add    %rdx,%rax
  8035ca:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035ce:	8b 12                	mov    (%rdx),%edx
  8035d0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8035d3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035d7:	89 0a                	mov    %ecx,(%rdx)
  8035d9:	eb 17                	jmp    8035f2 <getuint+0x102>
  8035db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035df:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8035e3:	48 89 d0             	mov    %rdx,%rax
  8035e6:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8035ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035ee:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8035f2:	8b 00                	mov    (%rax),%eax
  8035f4:	89 c0                	mov    %eax,%eax
  8035f6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8035fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035fe:	c9                   	leaveq 
  8035ff:	c3                   	retq   

0000000000803600 <getint>:
  803600:	55                   	push   %rbp
  803601:	48 89 e5             	mov    %rsp,%rbp
  803604:	48 83 ec 1c          	sub    $0x1c,%rsp
  803608:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80360c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80360f:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  803613:	7e 52                	jle    803667 <getint+0x67>
  803615:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803619:	8b 00                	mov    (%rax),%eax
  80361b:	83 f8 30             	cmp    $0x30,%eax
  80361e:	73 24                	jae    803644 <getint+0x44>
  803620:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803624:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803628:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80362c:	8b 00                	mov    (%rax),%eax
  80362e:	89 c0                	mov    %eax,%eax
  803630:	48 01 d0             	add    %rdx,%rax
  803633:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803637:	8b 12                	mov    (%rdx),%edx
  803639:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80363c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803640:	89 0a                	mov    %ecx,(%rdx)
  803642:	eb 17                	jmp    80365b <getint+0x5b>
  803644:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803648:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80364c:	48 89 d0             	mov    %rdx,%rax
  80364f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  803653:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803657:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80365b:	48 8b 00             	mov    (%rax),%rax
  80365e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803662:	e9 a3 00 00 00       	jmpq   80370a <getint+0x10a>
  803667:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80366b:	74 4f                	je     8036bc <getint+0xbc>
  80366d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803671:	8b 00                	mov    (%rax),%eax
  803673:	83 f8 30             	cmp    $0x30,%eax
  803676:	73 24                	jae    80369c <getint+0x9c>
  803678:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80367c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803680:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803684:	8b 00                	mov    (%rax),%eax
  803686:	89 c0                	mov    %eax,%eax
  803688:	48 01 d0             	add    %rdx,%rax
  80368b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80368f:	8b 12                	mov    (%rdx),%edx
  803691:	8d 4a 08             	lea    0x8(%rdx),%ecx
  803694:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803698:	89 0a                	mov    %ecx,(%rdx)
  80369a:	eb 17                	jmp    8036b3 <getint+0xb3>
  80369c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036a0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8036a4:	48 89 d0             	mov    %rdx,%rax
  8036a7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8036ab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036af:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8036b3:	48 8b 00             	mov    (%rax),%rax
  8036b6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8036ba:	eb 4e                	jmp    80370a <getint+0x10a>
  8036bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036c0:	8b 00                	mov    (%rax),%eax
  8036c2:	83 f8 30             	cmp    $0x30,%eax
  8036c5:	73 24                	jae    8036eb <getint+0xeb>
  8036c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036cb:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8036cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036d3:	8b 00                	mov    (%rax),%eax
  8036d5:	89 c0                	mov    %eax,%eax
  8036d7:	48 01 d0             	add    %rdx,%rax
  8036da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036de:	8b 12                	mov    (%rdx),%edx
  8036e0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8036e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036e7:	89 0a                	mov    %ecx,(%rdx)
  8036e9:	eb 17                	jmp    803702 <getint+0x102>
  8036eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036ef:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8036f3:	48 89 d0             	mov    %rdx,%rax
  8036f6:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8036fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036fe:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803702:	8b 00                	mov    (%rax),%eax
  803704:	48 98                	cltq   
  803706:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80370a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80370e:	c9                   	leaveq 
  80370f:	c3                   	retq   

0000000000803710 <vprintfmt>:
  803710:	55                   	push   %rbp
  803711:	48 89 e5             	mov    %rsp,%rbp
  803714:	41 54                	push   %r12
  803716:	53                   	push   %rbx
  803717:	48 83 ec 60          	sub    $0x60,%rsp
  80371b:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80371f:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  803723:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  803727:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80372b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80372f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  803733:	48 8b 0a             	mov    (%rdx),%rcx
  803736:	48 89 08             	mov    %rcx,(%rax)
  803739:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80373d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803741:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803745:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803749:	eb 17                	jmp    803762 <vprintfmt+0x52>
  80374b:	85 db                	test   %ebx,%ebx
  80374d:	0f 84 cc 04 00 00    	je     803c1f <vprintfmt+0x50f>
  803753:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803757:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80375b:	48 89 d6             	mov    %rdx,%rsi
  80375e:	89 df                	mov    %ebx,%edi
  803760:	ff d0                	callq  *%rax
  803762:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803766:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80376a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80376e:	0f b6 00             	movzbl (%rax),%eax
  803771:	0f b6 d8             	movzbl %al,%ebx
  803774:	83 fb 25             	cmp    $0x25,%ebx
  803777:	75 d2                	jne    80374b <vprintfmt+0x3b>
  803779:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  80377d:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  803784:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80378b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  803792:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  803799:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80379d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8037a1:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8037a5:	0f b6 00             	movzbl (%rax),%eax
  8037a8:	0f b6 d8             	movzbl %al,%ebx
  8037ab:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8037ae:	83 f8 55             	cmp    $0x55,%eax
  8037b1:	0f 87 34 04 00 00    	ja     803beb <vprintfmt+0x4db>
  8037b7:	89 c0                	mov    %eax,%eax
  8037b9:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8037c0:	00 
  8037c1:	48 b8 18 45 80 00 00 	movabs $0x804518,%rax
  8037c8:	00 00 00 
  8037cb:	48 01 d0             	add    %rdx,%rax
  8037ce:	48 8b 00             	mov    (%rax),%rax
  8037d1:	ff e0                	jmpq   *%rax
  8037d3:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8037d7:	eb c0                	jmp    803799 <vprintfmt+0x89>
  8037d9:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8037dd:	eb ba                	jmp    803799 <vprintfmt+0x89>
  8037df:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8037e6:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8037e9:	89 d0                	mov    %edx,%eax
  8037eb:	c1 e0 02             	shl    $0x2,%eax
  8037ee:	01 d0                	add    %edx,%eax
  8037f0:	01 c0                	add    %eax,%eax
  8037f2:	01 d8                	add    %ebx,%eax
  8037f4:	83 e8 30             	sub    $0x30,%eax
  8037f7:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8037fa:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8037fe:	0f b6 00             	movzbl (%rax),%eax
  803801:	0f be d8             	movsbl %al,%ebx
  803804:	83 fb 2f             	cmp    $0x2f,%ebx
  803807:	7e 0c                	jle    803815 <vprintfmt+0x105>
  803809:	83 fb 39             	cmp    $0x39,%ebx
  80380c:	7f 07                	jg     803815 <vprintfmt+0x105>
  80380e:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  803813:	eb d1                	jmp    8037e6 <vprintfmt+0xd6>
  803815:	eb 58                	jmp    80386f <vprintfmt+0x15f>
  803817:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80381a:	83 f8 30             	cmp    $0x30,%eax
  80381d:	73 17                	jae    803836 <vprintfmt+0x126>
  80381f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803823:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803826:	89 c0                	mov    %eax,%eax
  803828:	48 01 d0             	add    %rdx,%rax
  80382b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80382e:	83 c2 08             	add    $0x8,%edx
  803831:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803834:	eb 0f                	jmp    803845 <vprintfmt+0x135>
  803836:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80383a:	48 89 d0             	mov    %rdx,%rax
  80383d:	48 83 c2 08          	add    $0x8,%rdx
  803841:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803845:	8b 00                	mov    (%rax),%eax
  803847:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80384a:	eb 23                	jmp    80386f <vprintfmt+0x15f>
  80384c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803850:	79 0c                	jns    80385e <vprintfmt+0x14e>
  803852:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  803859:	e9 3b ff ff ff       	jmpq   803799 <vprintfmt+0x89>
  80385e:	e9 36 ff ff ff       	jmpq   803799 <vprintfmt+0x89>
  803863:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  80386a:	e9 2a ff ff ff       	jmpq   803799 <vprintfmt+0x89>
  80386f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803873:	79 12                	jns    803887 <vprintfmt+0x177>
  803875:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803878:	89 45 dc             	mov    %eax,-0x24(%rbp)
  80387b:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  803882:	e9 12 ff ff ff       	jmpq   803799 <vprintfmt+0x89>
  803887:	e9 0d ff ff ff       	jmpq   803799 <vprintfmt+0x89>
  80388c:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  803890:	e9 04 ff ff ff       	jmpq   803799 <vprintfmt+0x89>
  803895:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803898:	83 f8 30             	cmp    $0x30,%eax
  80389b:	73 17                	jae    8038b4 <vprintfmt+0x1a4>
  80389d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8038a1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8038a4:	89 c0                	mov    %eax,%eax
  8038a6:	48 01 d0             	add    %rdx,%rax
  8038a9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8038ac:	83 c2 08             	add    $0x8,%edx
  8038af:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8038b2:	eb 0f                	jmp    8038c3 <vprintfmt+0x1b3>
  8038b4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8038b8:	48 89 d0             	mov    %rdx,%rax
  8038bb:	48 83 c2 08          	add    $0x8,%rdx
  8038bf:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8038c3:	8b 10                	mov    (%rax),%edx
  8038c5:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8038c9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8038cd:	48 89 ce             	mov    %rcx,%rsi
  8038d0:	89 d7                	mov    %edx,%edi
  8038d2:	ff d0                	callq  *%rax
  8038d4:	e9 40 03 00 00       	jmpq   803c19 <vprintfmt+0x509>
  8038d9:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8038dc:	83 f8 30             	cmp    $0x30,%eax
  8038df:	73 17                	jae    8038f8 <vprintfmt+0x1e8>
  8038e1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8038e5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8038e8:	89 c0                	mov    %eax,%eax
  8038ea:	48 01 d0             	add    %rdx,%rax
  8038ed:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8038f0:	83 c2 08             	add    $0x8,%edx
  8038f3:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8038f6:	eb 0f                	jmp    803907 <vprintfmt+0x1f7>
  8038f8:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8038fc:	48 89 d0             	mov    %rdx,%rax
  8038ff:	48 83 c2 08          	add    $0x8,%rdx
  803903:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803907:	8b 18                	mov    (%rax),%ebx
  803909:	85 db                	test   %ebx,%ebx
  80390b:	79 02                	jns    80390f <vprintfmt+0x1ff>
  80390d:	f7 db                	neg    %ebx
  80390f:	83 fb 15             	cmp    $0x15,%ebx
  803912:	7f 16                	jg     80392a <vprintfmt+0x21a>
  803914:	48 b8 40 44 80 00 00 	movabs $0x804440,%rax
  80391b:	00 00 00 
  80391e:	48 63 d3             	movslq %ebx,%rdx
  803921:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  803925:	4d 85 e4             	test   %r12,%r12
  803928:	75 2e                	jne    803958 <vprintfmt+0x248>
  80392a:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80392e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803932:	89 d9                	mov    %ebx,%ecx
  803934:	48 ba 01 45 80 00 00 	movabs $0x804501,%rdx
  80393b:	00 00 00 
  80393e:	48 89 c7             	mov    %rax,%rdi
  803941:	b8 00 00 00 00       	mov    $0x0,%eax
  803946:	49 b8 28 3c 80 00 00 	movabs $0x803c28,%r8
  80394d:	00 00 00 
  803950:	41 ff d0             	callq  *%r8
  803953:	e9 c1 02 00 00       	jmpq   803c19 <vprintfmt+0x509>
  803958:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80395c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803960:	4c 89 e1             	mov    %r12,%rcx
  803963:	48 ba 0a 45 80 00 00 	movabs $0x80450a,%rdx
  80396a:	00 00 00 
  80396d:	48 89 c7             	mov    %rax,%rdi
  803970:	b8 00 00 00 00       	mov    $0x0,%eax
  803975:	49 b8 28 3c 80 00 00 	movabs $0x803c28,%r8
  80397c:	00 00 00 
  80397f:	41 ff d0             	callq  *%r8
  803982:	e9 92 02 00 00       	jmpq   803c19 <vprintfmt+0x509>
  803987:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80398a:	83 f8 30             	cmp    $0x30,%eax
  80398d:	73 17                	jae    8039a6 <vprintfmt+0x296>
  80398f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803993:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803996:	89 c0                	mov    %eax,%eax
  803998:	48 01 d0             	add    %rdx,%rax
  80399b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80399e:	83 c2 08             	add    $0x8,%edx
  8039a1:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8039a4:	eb 0f                	jmp    8039b5 <vprintfmt+0x2a5>
  8039a6:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8039aa:	48 89 d0             	mov    %rdx,%rax
  8039ad:	48 83 c2 08          	add    $0x8,%rdx
  8039b1:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8039b5:	4c 8b 20             	mov    (%rax),%r12
  8039b8:	4d 85 e4             	test   %r12,%r12
  8039bb:	75 0a                	jne    8039c7 <vprintfmt+0x2b7>
  8039bd:	49 bc 0d 45 80 00 00 	movabs $0x80450d,%r12
  8039c4:	00 00 00 
  8039c7:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8039cb:	7e 3f                	jle    803a0c <vprintfmt+0x2fc>
  8039cd:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8039d1:	74 39                	je     803a0c <vprintfmt+0x2fc>
  8039d3:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8039d6:	48 98                	cltq   
  8039d8:	48 89 c6             	mov    %rax,%rsi
  8039db:	4c 89 e7             	mov    %r12,%rdi
  8039de:	48 b8 26 02 80 00 00 	movabs $0x800226,%rax
  8039e5:	00 00 00 
  8039e8:	ff d0                	callq  *%rax
  8039ea:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8039ed:	eb 17                	jmp    803a06 <vprintfmt+0x2f6>
  8039ef:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8039f3:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8039f7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8039fb:	48 89 ce             	mov    %rcx,%rsi
  8039fe:	89 d7                	mov    %edx,%edi
  803a00:	ff d0                	callq  *%rax
  803a02:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803a06:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803a0a:	7f e3                	jg     8039ef <vprintfmt+0x2df>
  803a0c:	eb 37                	jmp    803a45 <vprintfmt+0x335>
  803a0e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  803a12:	74 1e                	je     803a32 <vprintfmt+0x322>
  803a14:	83 fb 1f             	cmp    $0x1f,%ebx
  803a17:	7e 05                	jle    803a1e <vprintfmt+0x30e>
  803a19:	83 fb 7e             	cmp    $0x7e,%ebx
  803a1c:	7e 14                	jle    803a32 <vprintfmt+0x322>
  803a1e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803a22:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803a26:	48 89 d6             	mov    %rdx,%rsi
  803a29:	bf 3f 00 00 00       	mov    $0x3f,%edi
  803a2e:	ff d0                	callq  *%rax
  803a30:	eb 0f                	jmp    803a41 <vprintfmt+0x331>
  803a32:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803a36:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803a3a:	48 89 d6             	mov    %rdx,%rsi
  803a3d:	89 df                	mov    %ebx,%edi
  803a3f:	ff d0                	callq  *%rax
  803a41:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803a45:	4c 89 e0             	mov    %r12,%rax
  803a48:	4c 8d 60 01          	lea    0x1(%rax),%r12
  803a4c:	0f b6 00             	movzbl (%rax),%eax
  803a4f:	0f be d8             	movsbl %al,%ebx
  803a52:	85 db                	test   %ebx,%ebx
  803a54:	74 10                	je     803a66 <vprintfmt+0x356>
  803a56:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  803a5a:	78 b2                	js     803a0e <vprintfmt+0x2fe>
  803a5c:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  803a60:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  803a64:	79 a8                	jns    803a0e <vprintfmt+0x2fe>
  803a66:	eb 16                	jmp    803a7e <vprintfmt+0x36e>
  803a68:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803a6c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803a70:	48 89 d6             	mov    %rdx,%rsi
  803a73:	bf 20 00 00 00       	mov    $0x20,%edi
  803a78:	ff d0                	callq  *%rax
  803a7a:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803a7e:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803a82:	7f e4                	jg     803a68 <vprintfmt+0x358>
  803a84:	e9 90 01 00 00       	jmpq   803c19 <vprintfmt+0x509>
  803a89:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803a8d:	be 03 00 00 00       	mov    $0x3,%esi
  803a92:	48 89 c7             	mov    %rax,%rdi
  803a95:	48 b8 00 36 80 00 00 	movabs $0x803600,%rax
  803a9c:	00 00 00 
  803a9f:	ff d0                	callq  *%rax
  803aa1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803aa5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803aa9:	48 85 c0             	test   %rax,%rax
  803aac:	79 1d                	jns    803acb <vprintfmt+0x3bb>
  803aae:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803ab2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803ab6:	48 89 d6             	mov    %rdx,%rsi
  803ab9:	bf 2d 00 00 00       	mov    $0x2d,%edi
  803abe:	ff d0                	callq  *%rax
  803ac0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ac4:	48 f7 d8             	neg    %rax
  803ac7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803acb:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  803ad2:	e9 d5 00 00 00       	jmpq   803bac <vprintfmt+0x49c>
  803ad7:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803adb:	be 03 00 00 00       	mov    $0x3,%esi
  803ae0:	48 89 c7             	mov    %rax,%rdi
  803ae3:	48 b8 f0 34 80 00 00 	movabs $0x8034f0,%rax
  803aea:	00 00 00 
  803aed:	ff d0                	callq  *%rax
  803aef:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803af3:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  803afa:	e9 ad 00 00 00       	jmpq   803bac <vprintfmt+0x49c>
  803aff:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803b03:	be 03 00 00 00       	mov    $0x3,%esi
  803b08:	48 89 c7             	mov    %rax,%rdi
  803b0b:	48 b8 f0 34 80 00 00 	movabs $0x8034f0,%rax
  803b12:	00 00 00 
  803b15:	ff d0                	callq  *%rax
  803b17:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803b1b:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  803b22:	e9 85 00 00 00       	jmpq   803bac <vprintfmt+0x49c>
  803b27:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803b2b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803b2f:	48 89 d6             	mov    %rdx,%rsi
  803b32:	bf 30 00 00 00       	mov    $0x30,%edi
  803b37:	ff d0                	callq  *%rax
  803b39:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803b3d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803b41:	48 89 d6             	mov    %rdx,%rsi
  803b44:	bf 78 00 00 00       	mov    $0x78,%edi
  803b49:	ff d0                	callq  *%rax
  803b4b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803b4e:	83 f8 30             	cmp    $0x30,%eax
  803b51:	73 17                	jae    803b6a <vprintfmt+0x45a>
  803b53:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803b57:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803b5a:	89 c0                	mov    %eax,%eax
  803b5c:	48 01 d0             	add    %rdx,%rax
  803b5f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803b62:	83 c2 08             	add    $0x8,%edx
  803b65:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803b68:	eb 0f                	jmp    803b79 <vprintfmt+0x469>
  803b6a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803b6e:	48 89 d0             	mov    %rdx,%rax
  803b71:	48 83 c2 08          	add    $0x8,%rdx
  803b75:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803b79:	48 8b 00             	mov    (%rax),%rax
  803b7c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803b80:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803b87:	eb 23                	jmp    803bac <vprintfmt+0x49c>
  803b89:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803b8d:	be 03 00 00 00       	mov    $0x3,%esi
  803b92:	48 89 c7             	mov    %rax,%rdi
  803b95:	48 b8 f0 34 80 00 00 	movabs $0x8034f0,%rax
  803b9c:	00 00 00 
  803b9f:	ff d0                	callq  *%rax
  803ba1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803ba5:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803bac:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  803bb1:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803bb4:	8b 7d dc             	mov    -0x24(%rbp),%edi
  803bb7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803bbb:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803bbf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803bc3:	45 89 c1             	mov    %r8d,%r9d
  803bc6:	41 89 f8             	mov    %edi,%r8d
  803bc9:	48 89 c7             	mov    %rax,%rdi
  803bcc:	48 b8 35 34 80 00 00 	movabs $0x803435,%rax
  803bd3:	00 00 00 
  803bd6:	ff d0                	callq  *%rax
  803bd8:	eb 3f                	jmp    803c19 <vprintfmt+0x509>
  803bda:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803bde:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803be2:	48 89 d6             	mov    %rdx,%rsi
  803be5:	89 df                	mov    %ebx,%edi
  803be7:	ff d0                	callq  *%rax
  803be9:	eb 2e                	jmp    803c19 <vprintfmt+0x509>
  803beb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803bef:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803bf3:	48 89 d6             	mov    %rdx,%rsi
  803bf6:	bf 25 00 00 00       	mov    $0x25,%edi
  803bfb:	ff d0                	callq  *%rax
  803bfd:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803c02:	eb 05                	jmp    803c09 <vprintfmt+0x4f9>
  803c04:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803c09:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803c0d:	48 83 e8 01          	sub    $0x1,%rax
  803c11:	0f b6 00             	movzbl (%rax),%eax
  803c14:	3c 25                	cmp    $0x25,%al
  803c16:	75 ec                	jne    803c04 <vprintfmt+0x4f4>
  803c18:	90                   	nop
  803c19:	90                   	nop
  803c1a:	e9 43 fb ff ff       	jmpq   803762 <vprintfmt+0x52>
  803c1f:	48 83 c4 60          	add    $0x60,%rsp
  803c23:	5b                   	pop    %rbx
  803c24:	41 5c                	pop    %r12
  803c26:	5d                   	pop    %rbp
  803c27:	c3                   	retq   

0000000000803c28 <printfmt>:
  803c28:	55                   	push   %rbp
  803c29:	48 89 e5             	mov    %rsp,%rbp
  803c2c:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  803c33:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803c3a:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803c41:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803c48:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803c4f:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803c56:	84 c0                	test   %al,%al
  803c58:	74 20                	je     803c7a <printfmt+0x52>
  803c5a:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803c5e:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803c62:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803c66:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803c6a:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803c6e:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803c72:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803c76:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803c7a:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  803c81:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  803c88:	00 00 00 
  803c8b:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  803c92:	00 00 00 
  803c95:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803c99:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803ca0:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803ca7:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  803cae:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  803cb5:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803cbc:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  803cc3:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  803cca:	48 89 c7             	mov    %rax,%rdi
  803ccd:	48 b8 10 37 80 00 00 	movabs $0x803710,%rax
  803cd4:	00 00 00 
  803cd7:	ff d0                	callq  *%rax
  803cd9:	c9                   	leaveq 
  803cda:	c3                   	retq   

0000000000803cdb <sprintputch>:
  803cdb:	55                   	push   %rbp
  803cdc:	48 89 e5             	mov    %rsp,%rbp
  803cdf:	48 83 ec 10          	sub    $0x10,%rsp
  803ce3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ce6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cee:	8b 40 10             	mov    0x10(%rax),%eax
  803cf1:	8d 50 01             	lea    0x1(%rax),%edx
  803cf4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cf8:	89 50 10             	mov    %edx,0x10(%rax)
  803cfb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cff:	48 8b 10             	mov    (%rax),%rdx
  803d02:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d06:	48 8b 40 08          	mov    0x8(%rax),%rax
  803d0a:	48 39 c2             	cmp    %rax,%rdx
  803d0d:	73 17                	jae    803d26 <sprintputch+0x4b>
  803d0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d13:	48 8b 00             	mov    (%rax),%rax
  803d16:	48 8d 48 01          	lea    0x1(%rax),%rcx
  803d1a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d1e:	48 89 0a             	mov    %rcx,(%rdx)
  803d21:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d24:	88 10                	mov    %dl,(%rax)
  803d26:	c9                   	leaveq 
  803d27:	c3                   	retq   

0000000000803d28 <vsnprintf>:
  803d28:	55                   	push   %rbp
  803d29:	48 89 e5             	mov    %rsp,%rbp
  803d2c:	48 83 ec 50          	sub    $0x50,%rsp
  803d30:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803d34:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  803d37:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803d3b:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  803d3f:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  803d43:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  803d47:	48 8b 0a             	mov    (%rdx),%rcx
  803d4a:	48 89 08             	mov    %rcx,(%rax)
  803d4d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803d51:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803d55:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803d59:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803d5d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803d61:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  803d65:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  803d68:	48 98                	cltq   
  803d6a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  803d6e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803d72:	48 01 d0             	add    %rdx,%rax
  803d75:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803d79:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  803d80:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  803d85:	74 06                	je     803d8d <vsnprintf+0x65>
  803d87:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  803d8b:	7f 07                	jg     803d94 <vsnprintf+0x6c>
  803d8d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803d92:	eb 2f                	jmp    803dc3 <vsnprintf+0x9b>
  803d94:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  803d98:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  803d9c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803da0:	48 89 c6             	mov    %rax,%rsi
  803da3:	48 bf db 3c 80 00 00 	movabs $0x803cdb,%rdi
  803daa:	00 00 00 
  803dad:	48 b8 10 37 80 00 00 	movabs $0x803710,%rax
  803db4:	00 00 00 
  803db7:	ff d0                	callq  *%rax
  803db9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803dbd:	c6 00 00             	movb   $0x0,(%rax)
  803dc0:	8b 45 e0             	mov    -0x20(%rbp),%eax
  803dc3:	c9                   	leaveq 
  803dc4:	c3                   	retq   

0000000000803dc5 <snprintf>:
  803dc5:	55                   	push   %rbp
  803dc6:	48 89 e5             	mov    %rsp,%rbp
  803dc9:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  803dd0:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  803dd7:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  803ddd:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803de4:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803deb:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803df2:	84 c0                	test   %al,%al
  803df4:	74 20                	je     803e16 <snprintf+0x51>
  803df6:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803dfa:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803dfe:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803e02:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803e06:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803e0a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803e0e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803e12:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803e16:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  803e1d:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  803e24:	00 00 00 
  803e27:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803e2e:	00 00 00 
  803e31:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803e35:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803e3c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803e43:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803e4a:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  803e51:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803e58:	48 8b 0a             	mov    (%rdx),%rcx
  803e5b:	48 89 08             	mov    %rcx,(%rax)
  803e5e:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803e62:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803e66:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803e6a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803e6e:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  803e75:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  803e7c:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  803e82:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803e89:	48 89 c7             	mov    %rax,%rdi
  803e8c:	48 b8 28 3d 80 00 00 	movabs $0x803d28,%rax
  803e93:	00 00 00 
  803e96:	ff d0                	callq  *%rax
  803e98:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803e9e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803ea4:	c9                   	leaveq 
  803ea5:	c3                   	retq   

0000000000803ea6 <ipc_recv>:
  803ea6:	55                   	push   %rbp
  803ea7:	48 89 e5             	mov    %rsp,%rbp
  803eaa:	48 83 ec 30          	sub    $0x30,%rsp
  803eae:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803eb2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803eb6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803eba:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803ebf:	75 0e                	jne    803ecf <ipc_recv+0x29>
  803ec1:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803ec8:	00 00 00 
  803ecb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803ecf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ed3:	48 89 c7             	mov    %rax,%rdi
  803ed6:	48 b8 bc 0d 80 00 00 	movabs $0x800dbc,%rax
  803edd:	00 00 00 
  803ee0:	ff d0                	callq  *%rax
  803ee2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ee5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ee9:	79 27                	jns    803f12 <ipc_recv+0x6c>
  803eeb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803ef0:	74 0a                	je     803efc <ipc_recv+0x56>
  803ef2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ef6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803efc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803f01:	74 0a                	je     803f0d <ipc_recv+0x67>
  803f03:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f07:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803f0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f10:	eb 53                	jmp    803f65 <ipc_recv+0xbf>
  803f12:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803f17:	74 19                	je     803f32 <ipc_recv+0x8c>
  803f19:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803f20:	00 00 00 
  803f23:	48 8b 00             	mov    (%rax),%rax
  803f26:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803f2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f30:	89 10                	mov    %edx,(%rax)
  803f32:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803f37:	74 19                	je     803f52 <ipc_recv+0xac>
  803f39:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803f40:	00 00 00 
  803f43:	48 8b 00             	mov    (%rax),%rax
  803f46:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803f4c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f50:	89 10                	mov    %edx,(%rax)
  803f52:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803f59:	00 00 00 
  803f5c:	48 8b 00             	mov    (%rax),%rax
  803f5f:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803f65:	c9                   	leaveq 
  803f66:	c3                   	retq   

0000000000803f67 <ipc_send>:
  803f67:	55                   	push   %rbp
  803f68:	48 89 e5             	mov    %rsp,%rbp
  803f6b:	48 83 ec 30          	sub    $0x30,%rsp
  803f6f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f72:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803f75:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803f79:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803f7c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803f81:	75 10                	jne    803f93 <ipc_send+0x2c>
  803f83:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803f8a:	00 00 00 
  803f8d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803f91:	eb 0e                	jmp    803fa1 <ipc_send+0x3a>
  803f93:	eb 0c                	jmp    803fa1 <ipc_send+0x3a>
  803f95:	48 b8 55 0b 80 00 00 	movabs $0x800b55,%rax
  803f9c:	00 00 00 
  803f9f:	ff d0                	callq  *%rax
  803fa1:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803fa4:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803fa7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803fab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fae:	89 c7                	mov    %eax,%edi
  803fb0:	48 b8 67 0d 80 00 00 	movabs $0x800d67,%rax
  803fb7:	00 00 00 
  803fba:	ff d0                	callq  *%rax
  803fbc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fbf:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  803fc3:	74 d0                	je     803f95 <ipc_send+0x2e>
  803fc5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fc9:	79 30                	jns    803ffb <ipc_send+0x94>
  803fcb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fce:	89 c1                	mov    %eax,%ecx
  803fd0:	48 ba c8 47 80 00 00 	movabs $0x8047c8,%rdx
  803fd7:	00 00 00 
  803fda:	be 44 00 00 00       	mov    $0x44,%esi
  803fdf:	48 bf de 47 80 00 00 	movabs $0x8047de,%rdi
  803fe6:	00 00 00 
  803fe9:	b8 00 00 00 00       	mov    $0x0,%eax
  803fee:	49 b8 24 31 80 00 00 	movabs $0x803124,%r8
  803ff5:	00 00 00 
  803ff8:	41 ff d0             	callq  *%r8
  803ffb:	c9                   	leaveq 
  803ffc:	c3                   	retq   

0000000000803ffd <ipc_find_env>:
  803ffd:	55                   	push   %rbp
  803ffe:	48 89 e5             	mov    %rsp,%rbp
  804001:	48 83 ec 14          	sub    $0x14,%rsp
  804005:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804008:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80400f:	eb 4e                	jmp    80405f <ipc_find_env+0x62>
  804011:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804018:	00 00 00 
  80401b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80401e:	48 98                	cltq   
  804020:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804027:	48 01 d0             	add    %rdx,%rax
  80402a:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804030:	8b 00                	mov    (%rax),%eax
  804032:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804035:	75 24                	jne    80405b <ipc_find_env+0x5e>
  804037:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80403e:	00 00 00 
  804041:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804044:	48 98                	cltq   
  804046:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80404d:	48 01 d0             	add    %rdx,%rax
  804050:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804056:	8b 40 08             	mov    0x8(%rax),%eax
  804059:	eb 12                	jmp    80406d <ipc_find_env+0x70>
  80405b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80405f:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804066:	7e a9                	jle    804011 <ipc_find_env+0x14>
  804068:	b8 00 00 00 00       	mov    $0x0,%eax
  80406d:	c9                   	leaveq 
  80406e:	c3                   	retq   

000000000080406f <pageref>:
  80406f:	55                   	push   %rbp
  804070:	48 89 e5             	mov    %rsp,%rbp
  804073:	48 83 ec 18          	sub    $0x18,%rsp
  804077:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80407b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80407f:	48 c1 e8 15          	shr    $0x15,%rax
  804083:	48 89 c2             	mov    %rax,%rdx
  804086:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80408d:	01 00 00 
  804090:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804094:	83 e0 01             	and    $0x1,%eax
  804097:	48 85 c0             	test   %rax,%rax
  80409a:	75 07                	jne    8040a3 <pageref+0x34>
  80409c:	b8 00 00 00 00       	mov    $0x0,%eax
  8040a1:	eb 53                	jmp    8040f6 <pageref+0x87>
  8040a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040a7:	48 c1 e8 0c          	shr    $0xc,%rax
  8040ab:	48 89 c2             	mov    %rax,%rdx
  8040ae:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8040b5:	01 00 00 
  8040b8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8040bc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8040c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040c4:	83 e0 01             	and    $0x1,%eax
  8040c7:	48 85 c0             	test   %rax,%rax
  8040ca:	75 07                	jne    8040d3 <pageref+0x64>
  8040cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8040d1:	eb 23                	jmp    8040f6 <pageref+0x87>
  8040d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040d7:	48 c1 e8 0c          	shr    $0xc,%rax
  8040db:	48 89 c2             	mov    %rax,%rdx
  8040de:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8040e5:	00 00 00 
  8040e8:	48 c1 e2 04          	shl    $0x4,%rdx
  8040ec:	48 01 d0             	add    %rdx,%rax
  8040ef:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8040f3:	0f b7 c0             	movzwl %ax,%eax
  8040f6:	c9                   	leaveq 
  8040f7:	c3                   	retq   
