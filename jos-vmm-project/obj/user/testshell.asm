
obj/user/testshell:     file format elf64-x86-64


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
  80003c:	e8 f5 07 00 00       	callq  800836 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 40          	sub    $0x40,%rsp
  80004b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80004e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800052:	bf 00 00 00 00       	mov    $0x0,%edi
  800057:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  80005e:	00 00 00 
  800061:	ff d0                	callq  *%rax
  800063:	bf 01 00 00 00       	mov    $0x1,%edi
  800068:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  80006f:	00 00 00 
  800072:	ff d0                	callq  *%rax
  800074:	48 b8 44 06 80 00 00 	movabs $0x800644,%rax
  80007b:	00 00 00 
  80007e:	ff d0                	callq  *%rax
  800080:	48 b8 44 06 80 00 00 	movabs $0x800644,%rax
  800087:	00 00 00 
  80008a:	ff d0                	callq  *%rax
  80008c:	be 00 00 00 00       	mov    $0x0,%esi
  800091:	48 bf 80 58 80 00 00 	movabs $0x805880,%rdi
  800098:	00 00 00 
  80009b:	48 b8 da 34 80 00 00 	movabs $0x8034da,%rax
  8000a2:	00 00 00 
  8000a5:	ff d0                	callq  *%rax
  8000a7:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8000aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8000ae:	79 30                	jns    8000e0 <umain+0x9d>
  8000b0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8000b3:	89 c1                	mov    %eax,%ecx
  8000b5:	48 ba 8d 58 80 00 00 	movabs $0x80588d,%rdx
  8000bc:	00 00 00 
  8000bf:	be 14 00 00 00       	mov    $0x14,%esi
  8000c4:	48 bf a3 58 80 00 00 	movabs $0x8058a3,%rdi
  8000cb:	00 00 00 
  8000ce:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d3:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  8000da:	00 00 00 
  8000dd:	41 ff d0             	callq  *%r8
  8000e0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8000e4:	48 89 c7             	mov    %rax,%rdi
  8000e7:	48 b8 8d 4e 80 00 00 	movabs $0x804e8d,%rax
  8000ee:	00 00 00 
  8000f1:	ff d0                	callq  *%rax
  8000f3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8000f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8000fa:	79 30                	jns    80012c <umain+0xe9>
  8000fc:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8000ff:	89 c1                	mov    %eax,%ecx
  800101:	48 ba b7 58 80 00 00 	movabs $0x8058b7,%rdx
  800108:	00 00 00 
  80010b:	be 16 00 00 00       	mov    $0x16,%esi
  800110:	48 bf a3 58 80 00 00 	movabs $0x8058a3,%rdi
  800117:	00 00 00 
  80011a:	b8 00 00 00 00       	mov    $0x0,%eax
  80011f:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  800126:	00 00 00 
  800129:	41 ff d0             	callq  *%r8
  80012c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80012f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800132:	48 bf c0 58 80 00 00 	movabs $0x8058c0,%rdi
  800139:	00 00 00 
  80013c:	b8 00 00 00 00       	mov    $0x0,%eax
  800141:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  800148:	00 00 00 
  80014b:	ff d2                	callq  *%rdx
  80014d:	48 b8 77 28 80 00 00 	movabs $0x802877,%rax
  800154:	00 00 00 
  800157:	ff d0                	callq  *%rax
  800159:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80015c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800160:	79 30                	jns    800192 <umain+0x14f>
  800162:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800165:	89 c1                	mov    %eax,%ecx
  800167:	48 ba e4 58 80 00 00 	movabs $0x8058e4,%rdx
  80016e:	00 00 00 
  800171:	be 1b 00 00 00       	mov    $0x1b,%esi
  800176:	48 bf a3 58 80 00 00 	movabs $0x8058a3,%rdi
  80017d:	00 00 00 
  800180:	b8 00 00 00 00       	mov    $0x0,%eax
  800185:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  80018c:	00 00 00 
  80018f:	41 ff d0             	callq  *%r8
  800192:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800196:	0f 85 fb 00 00 00    	jne    800297 <umain+0x254>
  80019c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80019f:	be 00 00 00 00       	mov    $0x0,%esi
  8001a4:	89 c7                	mov    %eax,%edi
  8001a6:	48 b8 5b 2e 80 00 00 	movabs $0x802e5b,%rax
  8001ad:	00 00 00 
  8001b0:	ff d0                	callq  *%rax
  8001b2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001b5:	be 01 00 00 00       	mov    $0x1,%esi
  8001ba:	89 c7                	mov    %eax,%edi
  8001bc:	48 b8 5b 2e 80 00 00 	movabs $0x802e5b,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8001cb:	89 c7                	mov    %eax,%edi
  8001cd:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  8001d4:	00 00 00 
  8001d7:	ff d0                	callq  *%rax
  8001d9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001dc:	89 c7                	mov    %eax,%edi
  8001de:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  8001e5:	00 00 00 
  8001e8:	ff d0                	callq  *%rax
  8001ea:	b9 00 00 00 00       	mov    $0x0,%ecx
  8001ef:	48 ba ed 58 80 00 00 	movabs $0x8058ed,%rdx
  8001f6:	00 00 00 
  8001f9:	48 be f0 58 80 00 00 	movabs $0x8058f0,%rsi
  800200:	00 00 00 
  800203:	48 bf f3 58 80 00 00 	movabs $0x8058f3,%rdi
  80020a:	00 00 00 
  80020d:	b8 00 00 00 00       	mov    $0x0,%eax
  800212:	49 b8 6a 3e 80 00 00 	movabs $0x803e6a,%r8
  800219:	00 00 00 
  80021c:	41 ff d0             	callq  *%r8
  80021f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800222:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800226:	79 30                	jns    800258 <umain+0x215>
  800228:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80022b:	89 c1                	mov    %eax,%ecx
  80022d:	48 ba fb 58 80 00 00 	movabs $0x8058fb,%rdx
  800234:	00 00 00 
  800237:	be 22 00 00 00       	mov    $0x22,%esi
  80023c:	48 bf a3 58 80 00 00 	movabs $0x8058a3,%rdi
  800243:	00 00 00 
  800246:	b8 00 00 00 00       	mov    $0x0,%eax
  80024b:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  800252:	00 00 00 
  800255:	41 ff d0             	callq  *%r8
  800258:	bf 00 00 00 00       	mov    $0x0,%edi
  80025d:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  800264:	00 00 00 
  800267:	ff d0                	callq  *%rax
  800269:	bf 01 00 00 00       	mov    $0x1,%edi
  80026e:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  800275:	00 00 00 
  800278:	ff d0                	callq  *%rax
  80027a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80027d:	89 c7                	mov    %eax,%edi
  80027f:	48 b8 56 54 80 00 00 	movabs $0x805456,%rax
  800286:	00 00 00 
  800289:	ff d0                	callq  *%rax
  80028b:	48 b8 b9 08 80 00 00 	movabs $0x8008b9,%rax
  800292:	00 00 00 
  800295:	ff d0                	callq  *%rax
  800297:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80029a:	89 c7                	mov    %eax,%edi
  80029c:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  8002a3:	00 00 00 
  8002a6:	ff d0                	callq  *%rax
  8002a8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002ab:	89 c7                	mov    %eax,%edi
  8002ad:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  8002b4:	00 00 00 
  8002b7:	ff d0                	callq  *%rax
  8002b9:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8002bc:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8002bf:	be 00 00 00 00       	mov    $0x0,%esi
  8002c4:	48 bf 05 59 80 00 00 	movabs $0x805905,%rdi
  8002cb:	00 00 00 
  8002ce:	48 b8 da 34 80 00 00 	movabs $0x8034da,%rax
  8002d5:	00 00 00 
  8002d8:	ff d0                	callq  *%rax
  8002da:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8002dd:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8002e1:	79 30                	jns    800313 <umain+0x2d0>
  8002e3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002e6:	89 c1                	mov    %eax,%ecx
  8002e8:	48 ba 18 59 80 00 00 	movabs $0x805918,%rdx
  8002ef:	00 00 00 
  8002f2:	be 2d 00 00 00       	mov    $0x2d,%esi
  8002f7:	48 bf a3 58 80 00 00 	movabs $0x8058a3,%rdi
  8002fe:	00 00 00 
  800301:	b8 00 00 00 00       	mov    $0x0,%eax
  800306:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  80030d:	00 00 00 
  800310:	41 ff d0             	callq  *%r8
  800313:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  80031a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800321:	48 8d 4d df          	lea    -0x21(%rbp),%rcx
  800325:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800328:	ba 01 00 00 00       	mov    $0x1,%edx
  80032d:	48 89 ce             	mov    %rcx,%rsi
  800330:	89 c7                	mov    %eax,%edi
  800332:	48 b8 04 30 80 00 00 	movabs $0x803004,%rax
  800339:	00 00 00 
  80033c:	ff d0                	callq  *%rax
  80033e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800341:	48 8d 4d de          	lea    -0x22(%rbp),%rcx
  800345:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800348:	ba 01 00 00 00       	mov    $0x1,%edx
  80034d:	48 89 ce             	mov    %rcx,%rsi
  800350:	89 c7                	mov    %eax,%edi
  800352:	48 b8 04 30 80 00 00 	movabs $0x803004,%rax
  800359:	00 00 00 
  80035c:	ff d0                	callq  *%rax
  80035e:	89 45 e0             	mov    %eax,-0x20(%rbp)
  800361:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800365:	79 30                	jns    800397 <umain+0x354>
  800367:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80036a:	89 c1                	mov    %eax,%ecx
  80036c:	48 ba 3b 59 80 00 00 	movabs $0x80593b,%rdx
  800373:	00 00 00 
  800376:	be 34 00 00 00       	mov    $0x34,%esi
  80037b:	48 bf a3 58 80 00 00 	movabs $0x8058a3,%rdi
  800382:	00 00 00 
  800385:	b8 00 00 00 00       	mov    $0x0,%eax
  80038a:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  800391:	00 00 00 
  800394:	41 ff d0             	callq  *%r8
  800397:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  80039b:	79 30                	jns    8003cd <umain+0x38a>
  80039d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8003a0:	89 c1                	mov    %eax,%ecx
  8003a2:	48 ba 55 59 80 00 00 	movabs $0x805955,%rdx
  8003a9:	00 00 00 
  8003ac:	be 36 00 00 00       	mov    $0x36,%esi
  8003b1:	48 bf a3 58 80 00 00 	movabs $0x8058a3,%rdi
  8003b8:	00 00 00 
  8003bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8003c0:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  8003c7:	00 00 00 
  8003ca:	41 ff d0             	callq  *%r8
  8003cd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8003d1:	75 08                	jne    8003db <umain+0x398>
  8003d3:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8003d7:	75 02                	jne    8003db <umain+0x398>
  8003d9:	eb 4b                	jmp    800426 <umain+0x3e3>
  8003db:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8003df:	75 12                	jne    8003f3 <umain+0x3b0>
  8003e1:	83 7d e0 01          	cmpl   $0x1,-0x20(%rbp)
  8003e5:	75 0c                	jne    8003f3 <umain+0x3b0>
  8003e7:	0f b6 55 df          	movzbl -0x21(%rbp),%edx
  8003eb:	0f b6 45 de          	movzbl -0x22(%rbp),%eax
  8003ef:	38 c2                	cmp    %al,%dl
  8003f1:	74 19                	je     80040c <umain+0x3c9>
  8003f3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8003f6:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8003f9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8003fc:	89 ce                	mov    %ecx,%esi
  8003fe:	89 c7                	mov    %eax,%edi
  800400:	48 b8 44 04 80 00 00 	movabs $0x800444,%rax
  800407:	00 00 00 
  80040a:	ff d0                	callq  *%rax
  80040c:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
  800410:	3c 0a                	cmp    $0xa,%al
  800412:	75 09                	jne    80041d <umain+0x3da>
  800414:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800417:	83 c0 01             	add    $0x1,%eax
  80041a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80041d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800421:	e9 fb fe ff ff       	jmpq   800321 <umain+0x2de>
  800426:	48 bf 6f 59 80 00 00 	movabs $0x80596f,%rdi
  80042d:	00 00 00 
  800430:	b8 00 00 00 00       	mov    $0x0,%eax
  800435:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  80043c:	00 00 00 
  80043f:	ff d2                	callq  *%rdx
static __inline void read_gdtr (uint64_t *gdtbase, uint16_t *gdtlimit) __attribute__((always_inline));

static __inline void
breakpoint(void)
{
	__asm __volatile("int3");
  800441:	cc                   	int3   
  800442:	c9                   	leaveq 
  800443:	c3                   	retq   

0000000000800444 <wrong>:
  800444:	55                   	push   %rbp
  800445:	48 89 e5             	mov    %rsp,%rbp
  800448:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  80044c:	89 7d 8c             	mov    %edi,-0x74(%rbp)
  80044f:	89 75 88             	mov    %esi,-0x78(%rbp)
  800452:	89 55 84             	mov    %edx,-0x7c(%rbp)
  800455:	8b 55 84             	mov    -0x7c(%rbp),%edx
  800458:	8b 45 8c             	mov    -0x74(%rbp),%eax
  80045b:	89 d6                	mov    %edx,%esi
  80045d:	89 c7                	mov    %eax,%edi
  80045f:	48 b8 22 32 80 00 00 	movabs $0x803222,%rax
  800466:	00 00 00 
  800469:	ff d0                	callq  *%rax
  80046b:	8b 55 84             	mov    -0x7c(%rbp),%edx
  80046e:	8b 45 88             	mov    -0x78(%rbp),%eax
  800471:	89 d6                	mov    %edx,%esi
  800473:	89 c7                	mov    %eax,%edi
  800475:	48 b8 22 32 80 00 00 	movabs $0x803222,%rax
  80047c:	00 00 00 
  80047f:	ff d0                	callq  *%rax
  800481:	48 bf 88 59 80 00 00 	movabs $0x805988,%rdi
  800488:	00 00 00 
  80048b:	b8 00 00 00 00       	mov    $0x0,%eax
  800490:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  800497:	00 00 00 
  80049a:	ff d2                	callq  *%rdx
  80049c:	48 bf aa 59 80 00 00 	movabs $0x8059aa,%rdi
  8004a3:	00 00 00 
  8004a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8004ab:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  8004b2:	00 00 00 
  8004b5:	ff d2                	callq  *%rdx
  8004b7:	eb 1c                	jmp    8004d5 <wrong+0x91>
  8004b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004bc:	48 63 d0             	movslq %eax,%rdx
  8004bf:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8004c3:	48 89 d6             	mov    %rdx,%rsi
  8004c6:	48 89 c7             	mov    %rax,%rdi
  8004c9:	48 b8 b1 1e 80 00 00 	movabs $0x801eb1,%rax
  8004d0:	00 00 00 
  8004d3:	ff d0                	callq  *%rax
  8004d5:	48 8d 4d 90          	lea    -0x70(%rbp),%rcx
  8004d9:	8b 45 88             	mov    -0x78(%rbp),%eax
  8004dc:	ba 63 00 00 00       	mov    $0x63,%edx
  8004e1:	48 89 ce             	mov    %rcx,%rsi
  8004e4:	89 c7                	mov    %eax,%edi
  8004e6:	48 b8 04 30 80 00 00 	movabs $0x803004,%rax
  8004ed:	00 00 00 
  8004f0:	ff d0                	callq  *%rax
  8004f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8004f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8004f9:	7f be                	jg     8004b9 <wrong+0x75>
  8004fb:	48 bf b9 59 80 00 00 	movabs $0x8059b9,%rdi
  800502:	00 00 00 
  800505:	b8 00 00 00 00       	mov    $0x0,%eax
  80050a:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  800511:	00 00 00 
  800514:	ff d2                	callq  *%rdx
  800516:	eb 1c                	jmp    800534 <wrong+0xf0>
  800518:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80051b:	48 63 d0             	movslq %eax,%rdx
  80051e:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  800522:	48 89 d6             	mov    %rdx,%rsi
  800525:	48 89 c7             	mov    %rax,%rdi
  800528:	48 b8 b1 1e 80 00 00 	movabs $0x801eb1,%rax
  80052f:	00 00 00 
  800532:	ff d0                	callq  *%rax
  800534:	48 8d 4d 90          	lea    -0x70(%rbp),%rcx
  800538:	8b 45 8c             	mov    -0x74(%rbp),%eax
  80053b:	ba 63 00 00 00       	mov    $0x63,%edx
  800540:	48 89 ce             	mov    %rcx,%rsi
  800543:	89 c7                	mov    %eax,%edi
  800545:	48 b8 04 30 80 00 00 	movabs $0x803004,%rax
  80054c:	00 00 00 
  80054f:	ff d0                	callq  *%rax
  800551:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800554:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800558:	7f be                	jg     800518 <wrong+0xd4>
  80055a:	48 bf c7 59 80 00 00 	movabs $0x8059c7,%rdi
  800561:	00 00 00 
  800564:	b8 00 00 00 00       	mov    $0x0,%eax
  800569:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  800570:	00 00 00 
  800573:	ff d2                	callq  *%rdx
  800575:	48 b8 b9 08 80 00 00 	movabs $0x8008b9,%rax
  80057c:	00 00 00 
  80057f:	ff d0                	callq  *%rax
  800581:	c9                   	leaveq 
  800582:	c3                   	retq   

0000000000800583 <cputchar>:
  800583:	55                   	push   %rbp
  800584:	48 89 e5             	mov    %rsp,%rbp
  800587:	48 83 ec 20          	sub    $0x20,%rsp
  80058b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80058e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800591:	88 45 ff             	mov    %al,-0x1(%rbp)
  800594:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  800598:	be 01 00 00 00       	mov    $0x1,%esi
  80059d:	48 89 c7             	mov    %rax,%rdi
  8005a0:	48 b8 b1 1e 80 00 00 	movabs $0x801eb1,%rax
  8005a7:	00 00 00 
  8005aa:	ff d0                	callq  *%rax
  8005ac:	c9                   	leaveq 
  8005ad:	c3                   	retq   

00000000008005ae <getchar>:
  8005ae:	55                   	push   %rbp
  8005af:	48 89 e5             	mov    %rsp,%rbp
  8005b2:	48 83 ec 10          	sub    $0x10,%rsp
  8005b6:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8005ba:	ba 01 00 00 00       	mov    $0x1,%edx
  8005bf:	48 89 c6             	mov    %rax,%rsi
  8005c2:	bf 00 00 00 00       	mov    $0x0,%edi
  8005c7:	48 b8 04 30 80 00 00 	movabs $0x803004,%rax
  8005ce:	00 00 00 
  8005d1:	ff d0                	callq  *%rax
  8005d3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8005d6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8005da:	79 05                	jns    8005e1 <getchar+0x33>
  8005dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005df:	eb 14                	jmp    8005f5 <getchar+0x47>
  8005e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8005e5:	7f 07                	jg     8005ee <getchar+0x40>
  8005e7:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8005ec:	eb 07                	jmp    8005f5 <getchar+0x47>
  8005ee:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8005f2:	0f b6 c0             	movzbl %al,%eax
  8005f5:	c9                   	leaveq 
  8005f6:	c3                   	retq   

00000000008005f7 <iscons>:
  8005f7:	55                   	push   %rbp
  8005f8:	48 89 e5             	mov    %rsp,%rbp
  8005fb:	48 83 ec 20          	sub    $0x20,%rsp
  8005ff:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800602:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800606:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800609:	48 89 d6             	mov    %rdx,%rsi
  80060c:	89 c7                	mov    %eax,%edi
  80060e:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  800615:	00 00 00 
  800618:	ff d0                	callq  *%rax
  80061a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80061d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800621:	79 05                	jns    800628 <iscons+0x31>
  800623:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800626:	eb 1a                	jmp    800642 <iscons+0x4b>
  800628:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80062c:	8b 10                	mov    (%rax),%edx
  80062e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800635:	00 00 00 
  800638:	8b 00                	mov    (%rax),%eax
  80063a:	39 c2                	cmp    %eax,%edx
  80063c:	0f 94 c0             	sete   %al
  80063f:	0f b6 c0             	movzbl %al,%eax
  800642:	c9                   	leaveq 
  800643:	c3                   	retq   

0000000000800644 <opencons>:
  800644:	55                   	push   %rbp
  800645:	48 89 e5             	mov    %rsp,%rbp
  800648:	48 83 ec 10          	sub    $0x10,%rsp
  80064c:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  800650:	48 89 c7             	mov    %rax,%rdi
  800653:	48 b8 3a 2b 80 00 00 	movabs $0x802b3a,%rax
  80065a:	00 00 00 
  80065d:	ff d0                	callq  *%rax
  80065f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800662:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800666:	79 05                	jns    80066d <opencons+0x29>
  800668:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80066b:	eb 5b                	jmp    8006c8 <opencons+0x84>
  80066d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800671:	ba 07 04 00 00       	mov    $0x407,%edx
  800676:	48 89 c6             	mov    %rax,%rsi
  800679:	bf 00 00 00 00       	mov    $0x0,%edi
  80067e:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  800685:	00 00 00 
  800688:	ff d0                	callq  *%rax
  80068a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80068d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800691:	79 05                	jns    800698 <opencons+0x54>
  800693:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800696:	eb 30                	jmp    8006c8 <opencons+0x84>
  800698:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80069c:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8006a3:	00 00 00 
  8006a6:	8b 12                	mov    (%rdx),%edx
  8006a8:	89 10                	mov    %edx,(%rax)
  8006aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006ae:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8006b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006b9:	48 89 c7             	mov    %rax,%rdi
  8006bc:	48 b8 ec 2a 80 00 00 	movabs $0x802aec,%rax
  8006c3:	00 00 00 
  8006c6:	ff d0                	callq  *%rax
  8006c8:	c9                   	leaveq 
  8006c9:	c3                   	retq   

00000000008006ca <devcons_read>:
  8006ca:	55                   	push   %rbp
  8006cb:	48 89 e5             	mov    %rsp,%rbp
  8006ce:	48 83 ec 30          	sub    $0x30,%rsp
  8006d2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006d6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8006da:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8006de:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8006e3:	75 07                	jne    8006ec <devcons_read+0x22>
  8006e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ea:	eb 4b                	jmp    800737 <devcons_read+0x6d>
  8006ec:	eb 0c                	jmp    8006fa <devcons_read+0x30>
  8006ee:	48 b8 bb 1f 80 00 00 	movabs $0x801fbb,%rax
  8006f5:	00 00 00 
  8006f8:	ff d0                	callq  *%rax
  8006fa:	48 b8 fb 1e 80 00 00 	movabs $0x801efb,%rax
  800701:	00 00 00 
  800704:	ff d0                	callq  *%rax
  800706:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800709:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80070d:	74 df                	je     8006ee <devcons_read+0x24>
  80070f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800713:	79 05                	jns    80071a <devcons_read+0x50>
  800715:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800718:	eb 1d                	jmp    800737 <devcons_read+0x6d>
  80071a:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80071e:	75 07                	jne    800727 <devcons_read+0x5d>
  800720:	b8 00 00 00 00       	mov    $0x0,%eax
  800725:	eb 10                	jmp    800737 <devcons_read+0x6d>
  800727:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80072a:	89 c2                	mov    %eax,%edx
  80072c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800730:	88 10                	mov    %dl,(%rax)
  800732:	b8 01 00 00 00       	mov    $0x1,%eax
  800737:	c9                   	leaveq 
  800738:	c3                   	retq   

0000000000800739 <devcons_write>:
  800739:	55                   	push   %rbp
  80073a:	48 89 e5             	mov    %rsp,%rbp
  80073d:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  800744:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80074b:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  800752:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  800759:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800760:	eb 76                	jmp    8007d8 <devcons_write+0x9f>
  800762:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800769:	89 c2                	mov    %eax,%edx
  80076b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80076e:	29 c2                	sub    %eax,%edx
  800770:	89 d0                	mov    %edx,%eax
  800772:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800775:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800778:	83 f8 7f             	cmp    $0x7f,%eax
  80077b:	76 07                	jbe    800784 <devcons_write+0x4b>
  80077d:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  800784:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800787:	48 63 d0             	movslq %eax,%rdx
  80078a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80078d:	48 63 c8             	movslq %eax,%rcx
  800790:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  800797:	48 01 c1             	add    %rax,%rcx
  80079a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8007a1:	48 89 ce             	mov    %rcx,%rsi
  8007a4:	48 89 c7             	mov    %rax,%rdi
  8007a7:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  8007ae:	00 00 00 
  8007b1:	ff d0                	callq  *%rax
  8007b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8007b6:	48 63 d0             	movslq %eax,%rdx
  8007b9:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8007c0:	48 89 d6             	mov    %rdx,%rsi
  8007c3:	48 89 c7             	mov    %rax,%rdi
  8007c6:	48 b8 b1 1e 80 00 00 	movabs $0x801eb1,%rax
  8007cd:	00 00 00 
  8007d0:	ff d0                	callq  *%rax
  8007d2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8007d5:	01 45 fc             	add    %eax,-0x4(%rbp)
  8007d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8007db:	48 98                	cltq   
  8007dd:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8007e4:	0f 82 78 ff ff ff    	jb     800762 <devcons_write+0x29>
  8007ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8007ed:	c9                   	leaveq 
  8007ee:	c3                   	retq   

00000000008007ef <devcons_close>:
  8007ef:	55                   	push   %rbp
  8007f0:	48 89 e5             	mov    %rsp,%rbp
  8007f3:	48 83 ec 08          	sub    $0x8,%rsp
  8007f7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8007fb:	b8 00 00 00 00       	mov    $0x0,%eax
  800800:	c9                   	leaveq 
  800801:	c3                   	retq   

0000000000800802 <devcons_stat>:
  800802:	55                   	push   %rbp
  800803:	48 89 e5             	mov    %rsp,%rbp
  800806:	48 83 ec 10          	sub    $0x10,%rsp
  80080a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80080e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800812:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800816:	48 be d1 59 80 00 00 	movabs $0x8059d1,%rsi
  80081d:	00 00 00 
  800820:	48 89 c7             	mov    %rax,%rdi
  800823:	48 b8 ca 16 80 00 00 	movabs $0x8016ca,%rax
  80082a:	00 00 00 
  80082d:	ff d0                	callq  *%rax
  80082f:	b8 00 00 00 00       	mov    $0x0,%eax
  800834:	c9                   	leaveq 
  800835:	c3                   	retq   

0000000000800836 <libmain>:
  800836:	55                   	push   %rbp
  800837:	48 89 e5             	mov    %rsp,%rbp
  80083a:	48 83 ec 10          	sub    $0x10,%rsp
  80083e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800841:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800845:	48 b8 7d 1f 80 00 00 	movabs $0x801f7d,%rax
  80084c:	00 00 00 
  80084f:	ff d0                	callq  *%rax
  800851:	25 ff 03 00 00       	and    $0x3ff,%eax
  800856:	48 98                	cltq   
  800858:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80085f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800866:	00 00 00 
  800869:	48 01 c2             	add    %rax,%rdx
  80086c:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  800873:	00 00 00 
  800876:	48 89 10             	mov    %rdx,(%rax)
  800879:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80087d:	7e 14                	jle    800893 <libmain+0x5d>
  80087f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800883:	48 8b 10             	mov    (%rax),%rdx
  800886:	48 b8 38 80 80 00 00 	movabs $0x808038,%rax
  80088d:	00 00 00 
  800890:	48 89 10             	mov    %rdx,(%rax)
  800893:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800897:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80089a:	48 89 d6             	mov    %rdx,%rsi
  80089d:	89 c7                	mov    %eax,%edi
  80089f:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8008a6:	00 00 00 
  8008a9:	ff d0                	callq  *%rax
  8008ab:	48 b8 b9 08 80 00 00 	movabs $0x8008b9,%rax
  8008b2:	00 00 00 
  8008b5:	ff d0                	callq  *%rax
  8008b7:	c9                   	leaveq 
  8008b8:	c3                   	retq   

00000000008008b9 <exit>:
  8008b9:	55                   	push   %rbp
  8008ba:	48 89 e5             	mov    %rsp,%rbp
  8008bd:	48 b8 2d 2e 80 00 00 	movabs $0x802e2d,%rax
  8008c4:	00 00 00 
  8008c7:	ff d0                	callq  *%rax
  8008c9:	bf 00 00 00 00       	mov    $0x0,%edi
  8008ce:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  8008d5:	00 00 00 
  8008d8:	ff d0                	callq  *%rax
  8008da:	5d                   	pop    %rbp
  8008db:	c3                   	retq   

00000000008008dc <_panic>:
  8008dc:	55                   	push   %rbp
  8008dd:	48 89 e5             	mov    %rsp,%rbp
  8008e0:	53                   	push   %rbx
  8008e1:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8008e8:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8008ef:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8008f5:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8008fc:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800903:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80090a:	84 c0                	test   %al,%al
  80090c:	74 23                	je     800931 <_panic+0x55>
  80090e:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800915:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800919:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80091d:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800921:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800925:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800929:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80092d:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800931:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800938:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80093f:	00 00 00 
  800942:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800949:	00 00 00 
  80094c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800950:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800957:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80095e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800965:	48 b8 38 80 80 00 00 	movabs $0x808038,%rax
  80096c:	00 00 00 
  80096f:	48 8b 18             	mov    (%rax),%rbx
  800972:	48 b8 7d 1f 80 00 00 	movabs $0x801f7d,%rax
  800979:	00 00 00 
  80097c:	ff d0                	callq  *%rax
  80097e:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800984:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80098b:	41 89 c8             	mov    %ecx,%r8d
  80098e:	48 89 d1             	mov    %rdx,%rcx
  800991:	48 89 da             	mov    %rbx,%rdx
  800994:	89 c6                	mov    %eax,%esi
  800996:	48 bf e8 59 80 00 00 	movabs $0x8059e8,%rdi
  80099d:	00 00 00 
  8009a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8009a5:	49 b9 15 0b 80 00 00 	movabs $0x800b15,%r9
  8009ac:	00 00 00 
  8009af:	41 ff d1             	callq  *%r9
  8009b2:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8009b9:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8009c0:	48 89 d6             	mov    %rdx,%rsi
  8009c3:	48 89 c7             	mov    %rax,%rdi
  8009c6:	48 b8 69 0a 80 00 00 	movabs $0x800a69,%rax
  8009cd:	00 00 00 
  8009d0:	ff d0                	callq  *%rax
  8009d2:	48 bf 0b 5a 80 00 00 	movabs $0x805a0b,%rdi
  8009d9:	00 00 00 
  8009dc:	b8 00 00 00 00       	mov    $0x0,%eax
  8009e1:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  8009e8:	00 00 00 
  8009eb:	ff d2                	callq  *%rdx
  8009ed:	cc                   	int3   
  8009ee:	eb fd                	jmp    8009ed <_panic+0x111>

00000000008009f0 <putch>:
  8009f0:	55                   	push   %rbp
  8009f1:	48 89 e5             	mov    %rsp,%rbp
  8009f4:	48 83 ec 10          	sub    $0x10,%rsp
  8009f8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8009fb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8009ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a03:	8b 00                	mov    (%rax),%eax
  800a05:	8d 48 01             	lea    0x1(%rax),%ecx
  800a08:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800a0c:	89 0a                	mov    %ecx,(%rdx)
  800a0e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800a11:	89 d1                	mov    %edx,%ecx
  800a13:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800a17:	48 98                	cltq   
  800a19:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800a1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a21:	8b 00                	mov    (%rax),%eax
  800a23:	3d ff 00 00 00       	cmp    $0xff,%eax
  800a28:	75 2c                	jne    800a56 <putch+0x66>
  800a2a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a2e:	8b 00                	mov    (%rax),%eax
  800a30:	48 98                	cltq   
  800a32:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800a36:	48 83 c2 08          	add    $0x8,%rdx
  800a3a:	48 89 c6             	mov    %rax,%rsi
  800a3d:	48 89 d7             	mov    %rdx,%rdi
  800a40:	48 b8 b1 1e 80 00 00 	movabs $0x801eb1,%rax
  800a47:	00 00 00 
  800a4a:	ff d0                	callq  *%rax
  800a4c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a50:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800a56:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a5a:	8b 40 04             	mov    0x4(%rax),%eax
  800a5d:	8d 50 01             	lea    0x1(%rax),%edx
  800a60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a64:	89 50 04             	mov    %edx,0x4(%rax)
  800a67:	c9                   	leaveq 
  800a68:	c3                   	retq   

0000000000800a69 <vcprintf>:
  800a69:	55                   	push   %rbp
  800a6a:	48 89 e5             	mov    %rsp,%rbp
  800a6d:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800a74:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800a7b:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800a82:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800a89:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800a90:	48 8b 0a             	mov    (%rdx),%rcx
  800a93:	48 89 08             	mov    %rcx,(%rax)
  800a96:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a9a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800a9e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800aa2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800aa6:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800aad:	00 00 00 
  800ab0:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800ab7:	00 00 00 
  800aba:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800ac1:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800ac8:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800acf:	48 89 c6             	mov    %rax,%rsi
  800ad2:	48 bf f0 09 80 00 00 	movabs $0x8009f0,%rdi
  800ad9:	00 00 00 
  800adc:	48 b8 c8 0e 80 00 00 	movabs $0x800ec8,%rax
  800ae3:	00 00 00 
  800ae6:	ff d0                	callq  *%rax
  800ae8:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800aee:	48 98                	cltq   
  800af0:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800af7:	48 83 c2 08          	add    $0x8,%rdx
  800afb:	48 89 c6             	mov    %rax,%rsi
  800afe:	48 89 d7             	mov    %rdx,%rdi
  800b01:	48 b8 b1 1e 80 00 00 	movabs $0x801eb1,%rax
  800b08:	00 00 00 
  800b0b:	ff d0                	callq  *%rax
  800b0d:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800b13:	c9                   	leaveq 
  800b14:	c3                   	retq   

0000000000800b15 <cprintf>:
  800b15:	55                   	push   %rbp
  800b16:	48 89 e5             	mov    %rsp,%rbp
  800b19:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800b20:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800b27:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800b2e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800b35:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800b3c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800b43:	84 c0                	test   %al,%al
  800b45:	74 20                	je     800b67 <cprintf+0x52>
  800b47:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800b4b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800b4f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800b53:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800b57:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800b5b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800b5f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800b63:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800b67:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800b6e:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800b75:	00 00 00 
  800b78:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800b7f:	00 00 00 
  800b82:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800b86:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800b8d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800b94:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800b9b:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800ba2:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800ba9:	48 8b 0a             	mov    (%rdx),%rcx
  800bac:	48 89 08             	mov    %rcx,(%rax)
  800baf:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800bb3:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800bb7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800bbb:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800bbf:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800bc6:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800bcd:	48 89 d6             	mov    %rdx,%rsi
  800bd0:	48 89 c7             	mov    %rax,%rdi
  800bd3:	48 b8 69 0a 80 00 00 	movabs $0x800a69,%rax
  800bda:	00 00 00 
  800bdd:	ff d0                	callq  *%rax
  800bdf:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800be5:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800beb:	c9                   	leaveq 
  800bec:	c3                   	retq   

0000000000800bed <printnum>:
  800bed:	55                   	push   %rbp
  800bee:	48 89 e5             	mov    %rsp,%rbp
  800bf1:	53                   	push   %rbx
  800bf2:	48 83 ec 38          	sub    $0x38,%rsp
  800bf6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800bfa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800bfe:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800c02:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800c05:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800c09:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800c0d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800c10:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800c14:	77 3b                	ja     800c51 <printnum+0x64>
  800c16:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800c19:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800c1d:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800c20:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800c24:	ba 00 00 00 00       	mov    $0x0,%edx
  800c29:	48 f7 f3             	div    %rbx
  800c2c:	48 89 c2             	mov    %rax,%rdx
  800c2f:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800c32:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800c35:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800c39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c3d:	41 89 f9             	mov    %edi,%r9d
  800c40:	48 89 c7             	mov    %rax,%rdi
  800c43:	48 b8 ed 0b 80 00 00 	movabs $0x800bed,%rax
  800c4a:	00 00 00 
  800c4d:	ff d0                	callq  *%rax
  800c4f:	eb 1e                	jmp    800c6f <printnum+0x82>
  800c51:	eb 12                	jmp    800c65 <printnum+0x78>
  800c53:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800c57:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800c5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c5e:	48 89 ce             	mov    %rcx,%rsi
  800c61:	89 d7                	mov    %edx,%edi
  800c63:	ff d0                	callq  *%rax
  800c65:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800c69:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800c6d:	7f e4                	jg     800c53 <printnum+0x66>
  800c6f:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800c72:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800c76:	ba 00 00 00 00       	mov    $0x0,%edx
  800c7b:	48 f7 f1             	div    %rcx
  800c7e:	48 89 d0             	mov    %rdx,%rax
  800c81:	48 ba 10 5c 80 00 00 	movabs $0x805c10,%rdx
  800c88:	00 00 00 
  800c8b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800c8f:	0f be d0             	movsbl %al,%edx
  800c92:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800c96:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c9a:	48 89 ce             	mov    %rcx,%rsi
  800c9d:	89 d7                	mov    %edx,%edi
  800c9f:	ff d0                	callq  *%rax
  800ca1:	48 83 c4 38          	add    $0x38,%rsp
  800ca5:	5b                   	pop    %rbx
  800ca6:	5d                   	pop    %rbp
  800ca7:	c3                   	retq   

0000000000800ca8 <getuint>:
  800ca8:	55                   	push   %rbp
  800ca9:	48 89 e5             	mov    %rsp,%rbp
  800cac:	48 83 ec 1c          	sub    $0x1c,%rsp
  800cb0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800cb4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800cb7:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800cbb:	7e 52                	jle    800d0f <getuint+0x67>
  800cbd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cc1:	8b 00                	mov    (%rax),%eax
  800cc3:	83 f8 30             	cmp    $0x30,%eax
  800cc6:	73 24                	jae    800cec <getuint+0x44>
  800cc8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ccc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800cd0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cd4:	8b 00                	mov    (%rax),%eax
  800cd6:	89 c0                	mov    %eax,%eax
  800cd8:	48 01 d0             	add    %rdx,%rax
  800cdb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cdf:	8b 12                	mov    (%rdx),%edx
  800ce1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ce4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ce8:	89 0a                	mov    %ecx,(%rdx)
  800cea:	eb 17                	jmp    800d03 <getuint+0x5b>
  800cec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cf0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800cf4:	48 89 d0             	mov    %rdx,%rax
  800cf7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800cfb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cff:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800d03:	48 8b 00             	mov    (%rax),%rax
  800d06:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800d0a:	e9 a3 00 00 00       	jmpq   800db2 <getuint+0x10a>
  800d0f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800d13:	74 4f                	je     800d64 <getuint+0xbc>
  800d15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d19:	8b 00                	mov    (%rax),%eax
  800d1b:	83 f8 30             	cmp    $0x30,%eax
  800d1e:	73 24                	jae    800d44 <getuint+0x9c>
  800d20:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d24:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800d28:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d2c:	8b 00                	mov    (%rax),%eax
  800d2e:	89 c0                	mov    %eax,%eax
  800d30:	48 01 d0             	add    %rdx,%rax
  800d33:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d37:	8b 12                	mov    (%rdx),%edx
  800d39:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800d3c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d40:	89 0a                	mov    %ecx,(%rdx)
  800d42:	eb 17                	jmp    800d5b <getuint+0xb3>
  800d44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d48:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800d4c:	48 89 d0             	mov    %rdx,%rax
  800d4f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800d53:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d57:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800d5b:	48 8b 00             	mov    (%rax),%rax
  800d5e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800d62:	eb 4e                	jmp    800db2 <getuint+0x10a>
  800d64:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d68:	8b 00                	mov    (%rax),%eax
  800d6a:	83 f8 30             	cmp    $0x30,%eax
  800d6d:	73 24                	jae    800d93 <getuint+0xeb>
  800d6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d73:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800d77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d7b:	8b 00                	mov    (%rax),%eax
  800d7d:	89 c0                	mov    %eax,%eax
  800d7f:	48 01 d0             	add    %rdx,%rax
  800d82:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d86:	8b 12                	mov    (%rdx),%edx
  800d88:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800d8b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d8f:	89 0a                	mov    %ecx,(%rdx)
  800d91:	eb 17                	jmp    800daa <getuint+0x102>
  800d93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d97:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800d9b:	48 89 d0             	mov    %rdx,%rax
  800d9e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800da2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800da6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800daa:	8b 00                	mov    (%rax),%eax
  800dac:	89 c0                	mov    %eax,%eax
  800dae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800db2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800db6:	c9                   	leaveq 
  800db7:	c3                   	retq   

0000000000800db8 <getint>:
  800db8:	55                   	push   %rbp
  800db9:	48 89 e5             	mov    %rsp,%rbp
  800dbc:	48 83 ec 1c          	sub    $0x1c,%rsp
  800dc0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800dc4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800dc7:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800dcb:	7e 52                	jle    800e1f <getint+0x67>
  800dcd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800dd1:	8b 00                	mov    (%rax),%eax
  800dd3:	83 f8 30             	cmp    $0x30,%eax
  800dd6:	73 24                	jae    800dfc <getint+0x44>
  800dd8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ddc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800de0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800de4:	8b 00                	mov    (%rax),%eax
  800de6:	89 c0                	mov    %eax,%eax
  800de8:	48 01 d0             	add    %rdx,%rax
  800deb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800def:	8b 12                	mov    (%rdx),%edx
  800df1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800df4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800df8:	89 0a                	mov    %ecx,(%rdx)
  800dfa:	eb 17                	jmp    800e13 <getint+0x5b>
  800dfc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e00:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800e04:	48 89 d0             	mov    %rdx,%rax
  800e07:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800e0b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e0f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800e13:	48 8b 00             	mov    (%rax),%rax
  800e16:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800e1a:	e9 a3 00 00 00       	jmpq   800ec2 <getint+0x10a>
  800e1f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800e23:	74 4f                	je     800e74 <getint+0xbc>
  800e25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e29:	8b 00                	mov    (%rax),%eax
  800e2b:	83 f8 30             	cmp    $0x30,%eax
  800e2e:	73 24                	jae    800e54 <getint+0x9c>
  800e30:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e34:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800e38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e3c:	8b 00                	mov    (%rax),%eax
  800e3e:	89 c0                	mov    %eax,%eax
  800e40:	48 01 d0             	add    %rdx,%rax
  800e43:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e47:	8b 12                	mov    (%rdx),%edx
  800e49:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800e4c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e50:	89 0a                	mov    %ecx,(%rdx)
  800e52:	eb 17                	jmp    800e6b <getint+0xb3>
  800e54:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e58:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800e5c:	48 89 d0             	mov    %rdx,%rax
  800e5f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800e63:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e67:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800e6b:	48 8b 00             	mov    (%rax),%rax
  800e6e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800e72:	eb 4e                	jmp    800ec2 <getint+0x10a>
  800e74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e78:	8b 00                	mov    (%rax),%eax
  800e7a:	83 f8 30             	cmp    $0x30,%eax
  800e7d:	73 24                	jae    800ea3 <getint+0xeb>
  800e7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e83:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800e87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e8b:	8b 00                	mov    (%rax),%eax
  800e8d:	89 c0                	mov    %eax,%eax
  800e8f:	48 01 d0             	add    %rdx,%rax
  800e92:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e96:	8b 12                	mov    (%rdx),%edx
  800e98:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800e9b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e9f:	89 0a                	mov    %ecx,(%rdx)
  800ea1:	eb 17                	jmp    800eba <getint+0x102>
  800ea3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ea7:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800eab:	48 89 d0             	mov    %rdx,%rax
  800eae:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800eb2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800eb6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800eba:	8b 00                	mov    (%rax),%eax
  800ebc:	48 98                	cltq   
  800ebe:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ec2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800ec6:	c9                   	leaveq 
  800ec7:	c3                   	retq   

0000000000800ec8 <vprintfmt>:
  800ec8:	55                   	push   %rbp
  800ec9:	48 89 e5             	mov    %rsp,%rbp
  800ecc:	41 54                	push   %r12
  800ece:	53                   	push   %rbx
  800ecf:	48 83 ec 60          	sub    $0x60,%rsp
  800ed3:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800ed7:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800edb:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800edf:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800ee3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ee7:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800eeb:	48 8b 0a             	mov    (%rdx),%rcx
  800eee:	48 89 08             	mov    %rcx,(%rax)
  800ef1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ef5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ef9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800efd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f01:	eb 17                	jmp    800f1a <vprintfmt+0x52>
  800f03:	85 db                	test   %ebx,%ebx
  800f05:	0f 84 cc 04 00 00    	je     8013d7 <vprintfmt+0x50f>
  800f0b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f0f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f13:	48 89 d6             	mov    %rdx,%rsi
  800f16:	89 df                	mov    %ebx,%edi
  800f18:	ff d0                	callq  *%rax
  800f1a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800f1e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f22:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800f26:	0f b6 00             	movzbl (%rax),%eax
  800f29:	0f b6 d8             	movzbl %al,%ebx
  800f2c:	83 fb 25             	cmp    $0x25,%ebx
  800f2f:	75 d2                	jne    800f03 <vprintfmt+0x3b>
  800f31:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800f35:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800f3c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800f43:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f4a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800f51:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800f55:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f59:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800f5d:	0f b6 00             	movzbl (%rax),%eax
  800f60:	0f b6 d8             	movzbl %al,%ebx
  800f63:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800f66:	83 f8 55             	cmp    $0x55,%eax
  800f69:	0f 87 34 04 00 00    	ja     8013a3 <vprintfmt+0x4db>
  800f6f:	89 c0                	mov    %eax,%eax
  800f71:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800f78:	00 
  800f79:	48 b8 38 5c 80 00 00 	movabs $0x805c38,%rax
  800f80:	00 00 00 
  800f83:	48 01 d0             	add    %rdx,%rax
  800f86:	48 8b 00             	mov    (%rax),%rax
  800f89:	ff e0                	jmpq   *%rax
  800f8b:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800f8f:	eb c0                	jmp    800f51 <vprintfmt+0x89>
  800f91:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800f95:	eb ba                	jmp    800f51 <vprintfmt+0x89>
  800f97:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800f9e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800fa1:	89 d0                	mov    %edx,%eax
  800fa3:	c1 e0 02             	shl    $0x2,%eax
  800fa6:	01 d0                	add    %edx,%eax
  800fa8:	01 c0                	add    %eax,%eax
  800faa:	01 d8                	add    %ebx,%eax
  800fac:	83 e8 30             	sub    $0x30,%eax
  800faf:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800fb2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800fb6:	0f b6 00             	movzbl (%rax),%eax
  800fb9:	0f be d8             	movsbl %al,%ebx
  800fbc:	83 fb 2f             	cmp    $0x2f,%ebx
  800fbf:	7e 0c                	jle    800fcd <vprintfmt+0x105>
  800fc1:	83 fb 39             	cmp    $0x39,%ebx
  800fc4:	7f 07                	jg     800fcd <vprintfmt+0x105>
  800fc6:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800fcb:	eb d1                	jmp    800f9e <vprintfmt+0xd6>
  800fcd:	eb 58                	jmp    801027 <vprintfmt+0x15f>
  800fcf:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800fd2:	83 f8 30             	cmp    $0x30,%eax
  800fd5:	73 17                	jae    800fee <vprintfmt+0x126>
  800fd7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800fdb:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800fde:	89 c0                	mov    %eax,%eax
  800fe0:	48 01 d0             	add    %rdx,%rax
  800fe3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fe6:	83 c2 08             	add    $0x8,%edx
  800fe9:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800fec:	eb 0f                	jmp    800ffd <vprintfmt+0x135>
  800fee:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ff2:	48 89 d0             	mov    %rdx,%rax
  800ff5:	48 83 c2 08          	add    $0x8,%rdx
  800ff9:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ffd:	8b 00                	mov    (%rax),%eax
  800fff:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801002:	eb 23                	jmp    801027 <vprintfmt+0x15f>
  801004:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801008:	79 0c                	jns    801016 <vprintfmt+0x14e>
  80100a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801011:	e9 3b ff ff ff       	jmpq   800f51 <vprintfmt+0x89>
  801016:	e9 36 ff ff ff       	jmpq   800f51 <vprintfmt+0x89>
  80101b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801022:	e9 2a ff ff ff       	jmpq   800f51 <vprintfmt+0x89>
  801027:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80102b:	79 12                	jns    80103f <vprintfmt+0x177>
  80102d:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801030:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801033:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80103a:	e9 12 ff ff ff       	jmpq   800f51 <vprintfmt+0x89>
  80103f:	e9 0d ff ff ff       	jmpq   800f51 <vprintfmt+0x89>
  801044:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  801048:	e9 04 ff ff ff       	jmpq   800f51 <vprintfmt+0x89>
  80104d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801050:	83 f8 30             	cmp    $0x30,%eax
  801053:	73 17                	jae    80106c <vprintfmt+0x1a4>
  801055:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801059:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80105c:	89 c0                	mov    %eax,%eax
  80105e:	48 01 d0             	add    %rdx,%rax
  801061:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801064:	83 c2 08             	add    $0x8,%edx
  801067:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80106a:	eb 0f                	jmp    80107b <vprintfmt+0x1b3>
  80106c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801070:	48 89 d0             	mov    %rdx,%rax
  801073:	48 83 c2 08          	add    $0x8,%rdx
  801077:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80107b:	8b 10                	mov    (%rax),%edx
  80107d:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801081:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801085:	48 89 ce             	mov    %rcx,%rsi
  801088:	89 d7                	mov    %edx,%edi
  80108a:	ff d0                	callq  *%rax
  80108c:	e9 40 03 00 00       	jmpq   8013d1 <vprintfmt+0x509>
  801091:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801094:	83 f8 30             	cmp    $0x30,%eax
  801097:	73 17                	jae    8010b0 <vprintfmt+0x1e8>
  801099:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80109d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8010a0:	89 c0                	mov    %eax,%eax
  8010a2:	48 01 d0             	add    %rdx,%rax
  8010a5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8010a8:	83 c2 08             	add    $0x8,%edx
  8010ab:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8010ae:	eb 0f                	jmp    8010bf <vprintfmt+0x1f7>
  8010b0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8010b4:	48 89 d0             	mov    %rdx,%rax
  8010b7:	48 83 c2 08          	add    $0x8,%rdx
  8010bb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8010bf:	8b 18                	mov    (%rax),%ebx
  8010c1:	85 db                	test   %ebx,%ebx
  8010c3:	79 02                	jns    8010c7 <vprintfmt+0x1ff>
  8010c5:	f7 db                	neg    %ebx
  8010c7:	83 fb 15             	cmp    $0x15,%ebx
  8010ca:	7f 16                	jg     8010e2 <vprintfmt+0x21a>
  8010cc:	48 b8 60 5b 80 00 00 	movabs $0x805b60,%rax
  8010d3:	00 00 00 
  8010d6:	48 63 d3             	movslq %ebx,%rdx
  8010d9:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8010dd:	4d 85 e4             	test   %r12,%r12
  8010e0:	75 2e                	jne    801110 <vprintfmt+0x248>
  8010e2:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8010e6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010ea:	89 d9                	mov    %ebx,%ecx
  8010ec:	48 ba 21 5c 80 00 00 	movabs $0x805c21,%rdx
  8010f3:	00 00 00 
  8010f6:	48 89 c7             	mov    %rax,%rdi
  8010f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8010fe:	49 b8 e0 13 80 00 00 	movabs $0x8013e0,%r8
  801105:	00 00 00 
  801108:	41 ff d0             	callq  *%r8
  80110b:	e9 c1 02 00 00       	jmpq   8013d1 <vprintfmt+0x509>
  801110:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801114:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801118:	4c 89 e1             	mov    %r12,%rcx
  80111b:	48 ba 2a 5c 80 00 00 	movabs $0x805c2a,%rdx
  801122:	00 00 00 
  801125:	48 89 c7             	mov    %rax,%rdi
  801128:	b8 00 00 00 00       	mov    $0x0,%eax
  80112d:	49 b8 e0 13 80 00 00 	movabs $0x8013e0,%r8
  801134:	00 00 00 
  801137:	41 ff d0             	callq  *%r8
  80113a:	e9 92 02 00 00       	jmpq   8013d1 <vprintfmt+0x509>
  80113f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801142:	83 f8 30             	cmp    $0x30,%eax
  801145:	73 17                	jae    80115e <vprintfmt+0x296>
  801147:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80114b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80114e:	89 c0                	mov    %eax,%eax
  801150:	48 01 d0             	add    %rdx,%rax
  801153:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801156:	83 c2 08             	add    $0x8,%edx
  801159:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80115c:	eb 0f                	jmp    80116d <vprintfmt+0x2a5>
  80115e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801162:	48 89 d0             	mov    %rdx,%rax
  801165:	48 83 c2 08          	add    $0x8,%rdx
  801169:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80116d:	4c 8b 20             	mov    (%rax),%r12
  801170:	4d 85 e4             	test   %r12,%r12
  801173:	75 0a                	jne    80117f <vprintfmt+0x2b7>
  801175:	49 bc 2d 5c 80 00 00 	movabs $0x805c2d,%r12
  80117c:	00 00 00 
  80117f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801183:	7e 3f                	jle    8011c4 <vprintfmt+0x2fc>
  801185:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  801189:	74 39                	je     8011c4 <vprintfmt+0x2fc>
  80118b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80118e:	48 98                	cltq   
  801190:	48 89 c6             	mov    %rax,%rsi
  801193:	4c 89 e7             	mov    %r12,%rdi
  801196:	48 b8 8c 16 80 00 00 	movabs $0x80168c,%rax
  80119d:	00 00 00 
  8011a0:	ff d0                	callq  *%rax
  8011a2:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8011a5:	eb 17                	jmp    8011be <vprintfmt+0x2f6>
  8011a7:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8011ab:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8011af:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011b3:	48 89 ce             	mov    %rcx,%rsi
  8011b6:	89 d7                	mov    %edx,%edi
  8011b8:	ff d0                	callq  *%rax
  8011ba:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8011be:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8011c2:	7f e3                	jg     8011a7 <vprintfmt+0x2df>
  8011c4:	eb 37                	jmp    8011fd <vprintfmt+0x335>
  8011c6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8011ca:	74 1e                	je     8011ea <vprintfmt+0x322>
  8011cc:	83 fb 1f             	cmp    $0x1f,%ebx
  8011cf:	7e 05                	jle    8011d6 <vprintfmt+0x30e>
  8011d1:	83 fb 7e             	cmp    $0x7e,%ebx
  8011d4:	7e 14                	jle    8011ea <vprintfmt+0x322>
  8011d6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8011da:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011de:	48 89 d6             	mov    %rdx,%rsi
  8011e1:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8011e6:	ff d0                	callq  *%rax
  8011e8:	eb 0f                	jmp    8011f9 <vprintfmt+0x331>
  8011ea:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8011ee:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011f2:	48 89 d6             	mov    %rdx,%rsi
  8011f5:	89 df                	mov    %ebx,%edi
  8011f7:	ff d0                	callq  *%rax
  8011f9:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8011fd:	4c 89 e0             	mov    %r12,%rax
  801200:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801204:	0f b6 00             	movzbl (%rax),%eax
  801207:	0f be d8             	movsbl %al,%ebx
  80120a:	85 db                	test   %ebx,%ebx
  80120c:	74 10                	je     80121e <vprintfmt+0x356>
  80120e:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801212:	78 b2                	js     8011c6 <vprintfmt+0x2fe>
  801214:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  801218:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80121c:	79 a8                	jns    8011c6 <vprintfmt+0x2fe>
  80121e:	eb 16                	jmp    801236 <vprintfmt+0x36e>
  801220:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801224:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801228:	48 89 d6             	mov    %rdx,%rsi
  80122b:	bf 20 00 00 00       	mov    $0x20,%edi
  801230:	ff d0                	callq  *%rax
  801232:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801236:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80123a:	7f e4                	jg     801220 <vprintfmt+0x358>
  80123c:	e9 90 01 00 00       	jmpq   8013d1 <vprintfmt+0x509>
  801241:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801245:	be 03 00 00 00       	mov    $0x3,%esi
  80124a:	48 89 c7             	mov    %rax,%rdi
  80124d:	48 b8 b8 0d 80 00 00 	movabs $0x800db8,%rax
  801254:	00 00 00 
  801257:	ff d0                	callq  *%rax
  801259:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80125d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801261:	48 85 c0             	test   %rax,%rax
  801264:	79 1d                	jns    801283 <vprintfmt+0x3bb>
  801266:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80126a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80126e:	48 89 d6             	mov    %rdx,%rsi
  801271:	bf 2d 00 00 00       	mov    $0x2d,%edi
  801276:	ff d0                	callq  *%rax
  801278:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80127c:	48 f7 d8             	neg    %rax
  80127f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801283:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80128a:	e9 d5 00 00 00       	jmpq   801364 <vprintfmt+0x49c>
  80128f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801293:	be 03 00 00 00       	mov    $0x3,%esi
  801298:	48 89 c7             	mov    %rax,%rdi
  80129b:	48 b8 a8 0c 80 00 00 	movabs $0x800ca8,%rax
  8012a2:	00 00 00 
  8012a5:	ff d0                	callq  *%rax
  8012a7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8012ab:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8012b2:	e9 ad 00 00 00       	jmpq   801364 <vprintfmt+0x49c>
  8012b7:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8012bb:	be 03 00 00 00       	mov    $0x3,%esi
  8012c0:	48 89 c7             	mov    %rax,%rdi
  8012c3:	48 b8 a8 0c 80 00 00 	movabs $0x800ca8,%rax
  8012ca:	00 00 00 
  8012cd:	ff d0                	callq  *%rax
  8012cf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8012d3:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  8012da:	e9 85 00 00 00       	jmpq   801364 <vprintfmt+0x49c>
  8012df:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8012e3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8012e7:	48 89 d6             	mov    %rdx,%rsi
  8012ea:	bf 30 00 00 00       	mov    $0x30,%edi
  8012ef:	ff d0                	callq  *%rax
  8012f1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8012f5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8012f9:	48 89 d6             	mov    %rdx,%rsi
  8012fc:	bf 78 00 00 00       	mov    $0x78,%edi
  801301:	ff d0                	callq  *%rax
  801303:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801306:	83 f8 30             	cmp    $0x30,%eax
  801309:	73 17                	jae    801322 <vprintfmt+0x45a>
  80130b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80130f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801312:	89 c0                	mov    %eax,%eax
  801314:	48 01 d0             	add    %rdx,%rax
  801317:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80131a:	83 c2 08             	add    $0x8,%edx
  80131d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801320:	eb 0f                	jmp    801331 <vprintfmt+0x469>
  801322:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801326:	48 89 d0             	mov    %rdx,%rax
  801329:	48 83 c2 08          	add    $0x8,%rdx
  80132d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801331:	48 8b 00             	mov    (%rax),%rax
  801334:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801338:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  80133f:	eb 23                	jmp    801364 <vprintfmt+0x49c>
  801341:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801345:	be 03 00 00 00       	mov    $0x3,%esi
  80134a:	48 89 c7             	mov    %rax,%rdi
  80134d:	48 b8 a8 0c 80 00 00 	movabs $0x800ca8,%rax
  801354:	00 00 00 
  801357:	ff d0                	callq  *%rax
  801359:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80135d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801364:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  801369:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80136c:	8b 7d dc             	mov    -0x24(%rbp),%edi
  80136f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801373:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801377:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80137b:	45 89 c1             	mov    %r8d,%r9d
  80137e:	41 89 f8             	mov    %edi,%r8d
  801381:	48 89 c7             	mov    %rax,%rdi
  801384:	48 b8 ed 0b 80 00 00 	movabs $0x800bed,%rax
  80138b:	00 00 00 
  80138e:	ff d0                	callq  *%rax
  801390:	eb 3f                	jmp    8013d1 <vprintfmt+0x509>
  801392:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801396:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80139a:	48 89 d6             	mov    %rdx,%rsi
  80139d:	89 df                	mov    %ebx,%edi
  80139f:	ff d0                	callq  *%rax
  8013a1:	eb 2e                	jmp    8013d1 <vprintfmt+0x509>
  8013a3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8013a7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013ab:	48 89 d6             	mov    %rdx,%rsi
  8013ae:	bf 25 00 00 00       	mov    $0x25,%edi
  8013b3:	ff d0                	callq  *%rax
  8013b5:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8013ba:	eb 05                	jmp    8013c1 <vprintfmt+0x4f9>
  8013bc:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8013c1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8013c5:	48 83 e8 01          	sub    $0x1,%rax
  8013c9:	0f b6 00             	movzbl (%rax),%eax
  8013cc:	3c 25                	cmp    $0x25,%al
  8013ce:	75 ec                	jne    8013bc <vprintfmt+0x4f4>
  8013d0:	90                   	nop
  8013d1:	90                   	nop
  8013d2:	e9 43 fb ff ff       	jmpq   800f1a <vprintfmt+0x52>
  8013d7:	48 83 c4 60          	add    $0x60,%rsp
  8013db:	5b                   	pop    %rbx
  8013dc:	41 5c                	pop    %r12
  8013de:	5d                   	pop    %rbp
  8013df:	c3                   	retq   

00000000008013e0 <printfmt>:
  8013e0:	55                   	push   %rbp
  8013e1:	48 89 e5             	mov    %rsp,%rbp
  8013e4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8013eb:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8013f2:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8013f9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801400:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801407:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80140e:	84 c0                	test   %al,%al
  801410:	74 20                	je     801432 <printfmt+0x52>
  801412:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801416:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80141a:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80141e:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801422:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801426:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80142a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80142e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801432:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801439:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801440:	00 00 00 
  801443:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80144a:	00 00 00 
  80144d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801451:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801458:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80145f:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801466:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80146d:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801474:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  80147b:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801482:	48 89 c7             	mov    %rax,%rdi
  801485:	48 b8 c8 0e 80 00 00 	movabs $0x800ec8,%rax
  80148c:	00 00 00 
  80148f:	ff d0                	callq  *%rax
  801491:	c9                   	leaveq 
  801492:	c3                   	retq   

0000000000801493 <sprintputch>:
  801493:	55                   	push   %rbp
  801494:	48 89 e5             	mov    %rsp,%rbp
  801497:	48 83 ec 10          	sub    $0x10,%rsp
  80149b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80149e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8014a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014a6:	8b 40 10             	mov    0x10(%rax),%eax
  8014a9:	8d 50 01             	lea    0x1(%rax),%edx
  8014ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014b0:	89 50 10             	mov    %edx,0x10(%rax)
  8014b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014b7:	48 8b 10             	mov    (%rax),%rdx
  8014ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014be:	48 8b 40 08          	mov    0x8(%rax),%rax
  8014c2:	48 39 c2             	cmp    %rax,%rdx
  8014c5:	73 17                	jae    8014de <sprintputch+0x4b>
  8014c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014cb:	48 8b 00             	mov    (%rax),%rax
  8014ce:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8014d2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8014d6:	48 89 0a             	mov    %rcx,(%rdx)
  8014d9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8014dc:	88 10                	mov    %dl,(%rax)
  8014de:	c9                   	leaveq 
  8014df:	c3                   	retq   

00000000008014e0 <vsnprintf>:
  8014e0:	55                   	push   %rbp
  8014e1:	48 89 e5             	mov    %rsp,%rbp
  8014e4:	48 83 ec 50          	sub    $0x50,%rsp
  8014e8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8014ec:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8014ef:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8014f3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8014f7:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8014fb:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8014ff:	48 8b 0a             	mov    (%rdx),%rcx
  801502:	48 89 08             	mov    %rcx,(%rax)
  801505:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801509:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80150d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801511:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801515:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801519:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80151d:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801520:	48 98                	cltq   
  801522:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801526:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80152a:	48 01 d0             	add    %rdx,%rax
  80152d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801531:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801538:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80153d:	74 06                	je     801545 <vsnprintf+0x65>
  80153f:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801543:	7f 07                	jg     80154c <vsnprintf+0x6c>
  801545:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80154a:	eb 2f                	jmp    80157b <vsnprintf+0x9b>
  80154c:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801550:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801554:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801558:	48 89 c6             	mov    %rax,%rsi
  80155b:	48 bf 93 14 80 00 00 	movabs $0x801493,%rdi
  801562:	00 00 00 
  801565:	48 b8 c8 0e 80 00 00 	movabs $0x800ec8,%rax
  80156c:	00 00 00 
  80156f:	ff d0                	callq  *%rax
  801571:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801575:	c6 00 00             	movb   $0x0,(%rax)
  801578:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80157b:	c9                   	leaveq 
  80157c:	c3                   	retq   

000000000080157d <snprintf>:
  80157d:	55                   	push   %rbp
  80157e:	48 89 e5             	mov    %rsp,%rbp
  801581:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801588:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80158f:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801595:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80159c:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8015a3:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8015aa:	84 c0                	test   %al,%al
  8015ac:	74 20                	je     8015ce <snprintf+0x51>
  8015ae:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8015b2:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8015b6:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8015ba:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8015be:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8015c2:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8015c6:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8015ca:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8015ce:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8015d5:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8015dc:	00 00 00 
  8015df:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8015e6:	00 00 00 
  8015e9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8015ed:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8015f4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8015fb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801602:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801609:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801610:	48 8b 0a             	mov    (%rdx),%rcx
  801613:	48 89 08             	mov    %rcx,(%rax)
  801616:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80161a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80161e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801622:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801626:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80162d:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801634:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80163a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801641:	48 89 c7             	mov    %rax,%rdi
  801644:	48 b8 e0 14 80 00 00 	movabs $0x8014e0,%rax
  80164b:	00 00 00 
  80164e:	ff d0                	callq  *%rax
  801650:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801656:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80165c:	c9                   	leaveq 
  80165d:	c3                   	retq   

000000000080165e <strlen>:
  80165e:	55                   	push   %rbp
  80165f:	48 89 e5             	mov    %rsp,%rbp
  801662:	48 83 ec 18          	sub    $0x18,%rsp
  801666:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80166a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801671:	eb 09                	jmp    80167c <strlen+0x1e>
  801673:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801677:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80167c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801680:	0f b6 00             	movzbl (%rax),%eax
  801683:	84 c0                	test   %al,%al
  801685:	75 ec                	jne    801673 <strlen+0x15>
  801687:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80168a:	c9                   	leaveq 
  80168b:	c3                   	retq   

000000000080168c <strnlen>:
  80168c:	55                   	push   %rbp
  80168d:	48 89 e5             	mov    %rsp,%rbp
  801690:	48 83 ec 20          	sub    $0x20,%rsp
  801694:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801698:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80169c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8016a3:	eb 0e                	jmp    8016b3 <strnlen+0x27>
  8016a5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8016a9:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8016ae:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8016b3:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8016b8:	74 0b                	je     8016c5 <strnlen+0x39>
  8016ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016be:	0f b6 00             	movzbl (%rax),%eax
  8016c1:	84 c0                	test   %al,%al
  8016c3:	75 e0                	jne    8016a5 <strnlen+0x19>
  8016c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8016c8:	c9                   	leaveq 
  8016c9:	c3                   	retq   

00000000008016ca <strcpy>:
  8016ca:	55                   	push   %rbp
  8016cb:	48 89 e5             	mov    %rsp,%rbp
  8016ce:	48 83 ec 20          	sub    $0x20,%rsp
  8016d2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016d6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8016da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016de:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016e2:	90                   	nop
  8016e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016e7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8016eb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016ef:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8016f3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8016f7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8016fb:	0f b6 12             	movzbl (%rdx),%edx
  8016fe:	88 10                	mov    %dl,(%rax)
  801700:	0f b6 00             	movzbl (%rax),%eax
  801703:	84 c0                	test   %al,%al
  801705:	75 dc                	jne    8016e3 <strcpy+0x19>
  801707:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80170b:	c9                   	leaveq 
  80170c:	c3                   	retq   

000000000080170d <strcat>:
  80170d:	55                   	push   %rbp
  80170e:	48 89 e5             	mov    %rsp,%rbp
  801711:	48 83 ec 20          	sub    $0x20,%rsp
  801715:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801719:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80171d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801721:	48 89 c7             	mov    %rax,%rdi
  801724:	48 b8 5e 16 80 00 00 	movabs $0x80165e,%rax
  80172b:	00 00 00 
  80172e:	ff d0                	callq  *%rax
  801730:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801733:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801736:	48 63 d0             	movslq %eax,%rdx
  801739:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80173d:	48 01 c2             	add    %rax,%rdx
  801740:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801744:	48 89 c6             	mov    %rax,%rsi
  801747:	48 89 d7             	mov    %rdx,%rdi
  80174a:	48 b8 ca 16 80 00 00 	movabs $0x8016ca,%rax
  801751:	00 00 00 
  801754:	ff d0                	callq  *%rax
  801756:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80175a:	c9                   	leaveq 
  80175b:	c3                   	retq   

000000000080175c <strncpy>:
  80175c:	55                   	push   %rbp
  80175d:	48 89 e5             	mov    %rsp,%rbp
  801760:	48 83 ec 28          	sub    $0x28,%rsp
  801764:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801768:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80176c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801770:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801774:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801778:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80177f:	00 
  801780:	eb 2a                	jmp    8017ac <strncpy+0x50>
  801782:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801786:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80178a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80178e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801792:	0f b6 12             	movzbl (%rdx),%edx
  801795:	88 10                	mov    %dl,(%rax)
  801797:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80179b:	0f b6 00             	movzbl (%rax),%eax
  80179e:	84 c0                	test   %al,%al
  8017a0:	74 05                	je     8017a7 <strncpy+0x4b>
  8017a2:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8017a7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8017ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017b0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8017b4:	72 cc                	jb     801782 <strncpy+0x26>
  8017b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017ba:	c9                   	leaveq 
  8017bb:	c3                   	retq   

00000000008017bc <strlcpy>:
  8017bc:	55                   	push   %rbp
  8017bd:	48 89 e5             	mov    %rsp,%rbp
  8017c0:	48 83 ec 28          	sub    $0x28,%rsp
  8017c4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8017c8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8017cc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017d4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8017d8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8017dd:	74 3d                	je     80181c <strlcpy+0x60>
  8017df:	eb 1d                	jmp    8017fe <strlcpy+0x42>
  8017e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017e5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017e9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8017ed:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8017f1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8017f5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8017f9:	0f b6 12             	movzbl (%rdx),%edx
  8017fc:	88 10                	mov    %dl,(%rax)
  8017fe:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801803:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801808:	74 0b                	je     801815 <strlcpy+0x59>
  80180a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80180e:	0f b6 00             	movzbl (%rax),%eax
  801811:	84 c0                	test   %al,%al
  801813:	75 cc                	jne    8017e1 <strlcpy+0x25>
  801815:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801819:	c6 00 00             	movb   $0x0,(%rax)
  80181c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801820:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801824:	48 29 c2             	sub    %rax,%rdx
  801827:	48 89 d0             	mov    %rdx,%rax
  80182a:	c9                   	leaveq 
  80182b:	c3                   	retq   

000000000080182c <strcmp>:
  80182c:	55                   	push   %rbp
  80182d:	48 89 e5             	mov    %rsp,%rbp
  801830:	48 83 ec 10          	sub    $0x10,%rsp
  801834:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801838:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80183c:	eb 0a                	jmp    801848 <strcmp+0x1c>
  80183e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801843:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801848:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80184c:	0f b6 00             	movzbl (%rax),%eax
  80184f:	84 c0                	test   %al,%al
  801851:	74 12                	je     801865 <strcmp+0x39>
  801853:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801857:	0f b6 10             	movzbl (%rax),%edx
  80185a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80185e:	0f b6 00             	movzbl (%rax),%eax
  801861:	38 c2                	cmp    %al,%dl
  801863:	74 d9                	je     80183e <strcmp+0x12>
  801865:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801869:	0f b6 00             	movzbl (%rax),%eax
  80186c:	0f b6 d0             	movzbl %al,%edx
  80186f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801873:	0f b6 00             	movzbl (%rax),%eax
  801876:	0f b6 c0             	movzbl %al,%eax
  801879:	29 c2                	sub    %eax,%edx
  80187b:	89 d0                	mov    %edx,%eax
  80187d:	c9                   	leaveq 
  80187e:	c3                   	retq   

000000000080187f <strncmp>:
  80187f:	55                   	push   %rbp
  801880:	48 89 e5             	mov    %rsp,%rbp
  801883:	48 83 ec 18          	sub    $0x18,%rsp
  801887:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80188b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80188f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801893:	eb 0f                	jmp    8018a4 <strncmp+0x25>
  801895:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80189a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80189f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8018a4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8018a9:	74 1d                	je     8018c8 <strncmp+0x49>
  8018ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018af:	0f b6 00             	movzbl (%rax),%eax
  8018b2:	84 c0                	test   %al,%al
  8018b4:	74 12                	je     8018c8 <strncmp+0x49>
  8018b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018ba:	0f b6 10             	movzbl (%rax),%edx
  8018bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018c1:	0f b6 00             	movzbl (%rax),%eax
  8018c4:	38 c2                	cmp    %al,%dl
  8018c6:	74 cd                	je     801895 <strncmp+0x16>
  8018c8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8018cd:	75 07                	jne    8018d6 <strncmp+0x57>
  8018cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8018d4:	eb 18                	jmp    8018ee <strncmp+0x6f>
  8018d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018da:	0f b6 00             	movzbl (%rax),%eax
  8018dd:	0f b6 d0             	movzbl %al,%edx
  8018e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018e4:	0f b6 00             	movzbl (%rax),%eax
  8018e7:	0f b6 c0             	movzbl %al,%eax
  8018ea:	29 c2                	sub    %eax,%edx
  8018ec:	89 d0                	mov    %edx,%eax
  8018ee:	c9                   	leaveq 
  8018ef:	c3                   	retq   

00000000008018f0 <strchr>:
  8018f0:	55                   	push   %rbp
  8018f1:	48 89 e5             	mov    %rsp,%rbp
  8018f4:	48 83 ec 0c          	sub    $0xc,%rsp
  8018f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018fc:	89 f0                	mov    %esi,%eax
  8018fe:	88 45 f4             	mov    %al,-0xc(%rbp)
  801901:	eb 17                	jmp    80191a <strchr+0x2a>
  801903:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801907:	0f b6 00             	movzbl (%rax),%eax
  80190a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80190d:	75 06                	jne    801915 <strchr+0x25>
  80190f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801913:	eb 15                	jmp    80192a <strchr+0x3a>
  801915:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80191a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80191e:	0f b6 00             	movzbl (%rax),%eax
  801921:	84 c0                	test   %al,%al
  801923:	75 de                	jne    801903 <strchr+0x13>
  801925:	b8 00 00 00 00       	mov    $0x0,%eax
  80192a:	c9                   	leaveq 
  80192b:	c3                   	retq   

000000000080192c <strfind>:
  80192c:	55                   	push   %rbp
  80192d:	48 89 e5             	mov    %rsp,%rbp
  801930:	48 83 ec 0c          	sub    $0xc,%rsp
  801934:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801938:	89 f0                	mov    %esi,%eax
  80193a:	88 45 f4             	mov    %al,-0xc(%rbp)
  80193d:	eb 13                	jmp    801952 <strfind+0x26>
  80193f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801943:	0f b6 00             	movzbl (%rax),%eax
  801946:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801949:	75 02                	jne    80194d <strfind+0x21>
  80194b:	eb 10                	jmp    80195d <strfind+0x31>
  80194d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801952:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801956:	0f b6 00             	movzbl (%rax),%eax
  801959:	84 c0                	test   %al,%al
  80195b:	75 e2                	jne    80193f <strfind+0x13>
  80195d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801961:	c9                   	leaveq 
  801962:	c3                   	retq   

0000000000801963 <memset>:
  801963:	55                   	push   %rbp
  801964:	48 89 e5             	mov    %rsp,%rbp
  801967:	48 83 ec 18          	sub    $0x18,%rsp
  80196b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80196f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801972:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801976:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80197b:	75 06                	jne    801983 <memset+0x20>
  80197d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801981:	eb 69                	jmp    8019ec <memset+0x89>
  801983:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801987:	83 e0 03             	and    $0x3,%eax
  80198a:	48 85 c0             	test   %rax,%rax
  80198d:	75 48                	jne    8019d7 <memset+0x74>
  80198f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801993:	83 e0 03             	and    $0x3,%eax
  801996:	48 85 c0             	test   %rax,%rax
  801999:	75 3c                	jne    8019d7 <memset+0x74>
  80199b:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8019a2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8019a5:	c1 e0 18             	shl    $0x18,%eax
  8019a8:	89 c2                	mov    %eax,%edx
  8019aa:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8019ad:	c1 e0 10             	shl    $0x10,%eax
  8019b0:	09 c2                	or     %eax,%edx
  8019b2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8019b5:	c1 e0 08             	shl    $0x8,%eax
  8019b8:	09 d0                	or     %edx,%eax
  8019ba:	09 45 f4             	or     %eax,-0xc(%rbp)
  8019bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019c1:	48 c1 e8 02          	shr    $0x2,%rax
  8019c5:	48 89 c1             	mov    %rax,%rcx
  8019c8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8019cc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8019cf:	48 89 d7             	mov    %rdx,%rdi
  8019d2:	fc                   	cld    
  8019d3:	f3 ab                	rep stos %eax,%es:(%rdi)
  8019d5:	eb 11                	jmp    8019e8 <memset+0x85>
  8019d7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8019db:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8019de:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8019e2:	48 89 d7             	mov    %rdx,%rdi
  8019e5:	fc                   	cld    
  8019e6:	f3 aa                	rep stos %al,%es:(%rdi)
  8019e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019ec:	c9                   	leaveq 
  8019ed:	c3                   	retq   

00000000008019ee <memmove>:
  8019ee:	55                   	push   %rbp
  8019ef:	48 89 e5             	mov    %rsp,%rbp
  8019f2:	48 83 ec 28          	sub    $0x28,%rsp
  8019f6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8019fa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8019fe:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801a02:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801a06:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801a0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a0e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a12:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a16:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801a1a:	0f 83 88 00 00 00    	jae    801aa8 <memmove+0xba>
  801a20:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a24:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801a28:	48 01 d0             	add    %rdx,%rax
  801a2b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801a2f:	76 77                	jbe    801aa8 <memmove+0xba>
  801a31:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a35:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801a39:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a3d:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801a41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a45:	83 e0 03             	and    $0x3,%eax
  801a48:	48 85 c0             	test   %rax,%rax
  801a4b:	75 3b                	jne    801a88 <memmove+0x9a>
  801a4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a51:	83 e0 03             	and    $0x3,%eax
  801a54:	48 85 c0             	test   %rax,%rax
  801a57:	75 2f                	jne    801a88 <memmove+0x9a>
  801a59:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a5d:	83 e0 03             	and    $0x3,%eax
  801a60:	48 85 c0             	test   %rax,%rax
  801a63:	75 23                	jne    801a88 <memmove+0x9a>
  801a65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a69:	48 83 e8 04          	sub    $0x4,%rax
  801a6d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801a71:	48 83 ea 04          	sub    $0x4,%rdx
  801a75:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801a79:	48 c1 e9 02          	shr    $0x2,%rcx
  801a7d:	48 89 c7             	mov    %rax,%rdi
  801a80:	48 89 d6             	mov    %rdx,%rsi
  801a83:	fd                   	std    
  801a84:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801a86:	eb 1d                	jmp    801aa5 <memmove+0xb7>
  801a88:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a8c:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801a90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a94:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801a98:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a9c:	48 89 d7             	mov    %rdx,%rdi
  801a9f:	48 89 c1             	mov    %rax,%rcx
  801aa2:	fd                   	std    
  801aa3:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801aa5:	fc                   	cld    
  801aa6:	eb 57                	jmp    801aff <memmove+0x111>
  801aa8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801aac:	83 e0 03             	and    $0x3,%eax
  801aaf:	48 85 c0             	test   %rax,%rax
  801ab2:	75 36                	jne    801aea <memmove+0xfc>
  801ab4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ab8:	83 e0 03             	and    $0x3,%eax
  801abb:	48 85 c0             	test   %rax,%rax
  801abe:	75 2a                	jne    801aea <memmove+0xfc>
  801ac0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ac4:	83 e0 03             	and    $0x3,%eax
  801ac7:	48 85 c0             	test   %rax,%rax
  801aca:	75 1e                	jne    801aea <memmove+0xfc>
  801acc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ad0:	48 c1 e8 02          	shr    $0x2,%rax
  801ad4:	48 89 c1             	mov    %rax,%rcx
  801ad7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801adb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801adf:	48 89 c7             	mov    %rax,%rdi
  801ae2:	48 89 d6             	mov    %rdx,%rsi
  801ae5:	fc                   	cld    
  801ae6:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801ae8:	eb 15                	jmp    801aff <memmove+0x111>
  801aea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801aee:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801af2:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801af6:	48 89 c7             	mov    %rax,%rdi
  801af9:	48 89 d6             	mov    %rdx,%rsi
  801afc:	fc                   	cld    
  801afd:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801aff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b03:	c9                   	leaveq 
  801b04:	c3                   	retq   

0000000000801b05 <memcpy>:
  801b05:	55                   	push   %rbp
  801b06:	48 89 e5             	mov    %rsp,%rbp
  801b09:	48 83 ec 18          	sub    $0x18,%rsp
  801b0d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b11:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b15:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b19:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801b1d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801b21:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b25:	48 89 ce             	mov    %rcx,%rsi
  801b28:	48 89 c7             	mov    %rax,%rdi
  801b2b:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  801b32:	00 00 00 
  801b35:	ff d0                	callq  *%rax
  801b37:	c9                   	leaveq 
  801b38:	c3                   	retq   

0000000000801b39 <memcmp>:
  801b39:	55                   	push   %rbp
  801b3a:	48 89 e5             	mov    %rsp,%rbp
  801b3d:	48 83 ec 28          	sub    $0x28,%rsp
  801b41:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b45:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b49:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b51:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801b55:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b59:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801b5d:	eb 36                	jmp    801b95 <memcmp+0x5c>
  801b5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b63:	0f b6 10             	movzbl (%rax),%edx
  801b66:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b6a:	0f b6 00             	movzbl (%rax),%eax
  801b6d:	38 c2                	cmp    %al,%dl
  801b6f:	74 1a                	je     801b8b <memcmp+0x52>
  801b71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b75:	0f b6 00             	movzbl (%rax),%eax
  801b78:	0f b6 d0             	movzbl %al,%edx
  801b7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b7f:	0f b6 00             	movzbl (%rax),%eax
  801b82:	0f b6 c0             	movzbl %al,%eax
  801b85:	29 c2                	sub    %eax,%edx
  801b87:	89 d0                	mov    %edx,%eax
  801b89:	eb 20                	jmp    801bab <memcmp+0x72>
  801b8b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b90:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801b95:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b99:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801b9d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ba1:	48 85 c0             	test   %rax,%rax
  801ba4:	75 b9                	jne    801b5f <memcmp+0x26>
  801ba6:	b8 00 00 00 00       	mov    $0x0,%eax
  801bab:	c9                   	leaveq 
  801bac:	c3                   	retq   

0000000000801bad <memfind>:
  801bad:	55                   	push   %rbp
  801bae:	48 89 e5             	mov    %rsp,%rbp
  801bb1:	48 83 ec 28          	sub    $0x28,%rsp
  801bb5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801bb9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801bbc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801bc0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801bc4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801bc8:	48 01 d0             	add    %rdx,%rax
  801bcb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801bcf:	eb 15                	jmp    801be6 <memfind+0x39>
  801bd1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bd5:	0f b6 10             	movzbl (%rax),%edx
  801bd8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801bdb:	38 c2                	cmp    %al,%dl
  801bdd:	75 02                	jne    801be1 <memfind+0x34>
  801bdf:	eb 0f                	jmp    801bf0 <memfind+0x43>
  801be1:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801be6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bea:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801bee:	72 e1                	jb     801bd1 <memfind+0x24>
  801bf0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bf4:	c9                   	leaveq 
  801bf5:	c3                   	retq   

0000000000801bf6 <strtol>:
  801bf6:	55                   	push   %rbp
  801bf7:	48 89 e5             	mov    %rsp,%rbp
  801bfa:	48 83 ec 34          	sub    $0x34,%rsp
  801bfe:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801c02:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801c06:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801c09:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801c10:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801c17:	00 
  801c18:	eb 05                	jmp    801c1f <strtol+0x29>
  801c1a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801c1f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c23:	0f b6 00             	movzbl (%rax),%eax
  801c26:	3c 20                	cmp    $0x20,%al
  801c28:	74 f0                	je     801c1a <strtol+0x24>
  801c2a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c2e:	0f b6 00             	movzbl (%rax),%eax
  801c31:	3c 09                	cmp    $0x9,%al
  801c33:	74 e5                	je     801c1a <strtol+0x24>
  801c35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c39:	0f b6 00             	movzbl (%rax),%eax
  801c3c:	3c 2b                	cmp    $0x2b,%al
  801c3e:	75 07                	jne    801c47 <strtol+0x51>
  801c40:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801c45:	eb 17                	jmp    801c5e <strtol+0x68>
  801c47:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c4b:	0f b6 00             	movzbl (%rax),%eax
  801c4e:	3c 2d                	cmp    $0x2d,%al
  801c50:	75 0c                	jne    801c5e <strtol+0x68>
  801c52:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801c57:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801c5e:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801c62:	74 06                	je     801c6a <strtol+0x74>
  801c64:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801c68:	75 28                	jne    801c92 <strtol+0x9c>
  801c6a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c6e:	0f b6 00             	movzbl (%rax),%eax
  801c71:	3c 30                	cmp    $0x30,%al
  801c73:	75 1d                	jne    801c92 <strtol+0x9c>
  801c75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c79:	48 83 c0 01          	add    $0x1,%rax
  801c7d:	0f b6 00             	movzbl (%rax),%eax
  801c80:	3c 78                	cmp    $0x78,%al
  801c82:	75 0e                	jne    801c92 <strtol+0x9c>
  801c84:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801c89:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801c90:	eb 2c                	jmp    801cbe <strtol+0xc8>
  801c92:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801c96:	75 19                	jne    801cb1 <strtol+0xbb>
  801c98:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c9c:	0f b6 00             	movzbl (%rax),%eax
  801c9f:	3c 30                	cmp    $0x30,%al
  801ca1:	75 0e                	jne    801cb1 <strtol+0xbb>
  801ca3:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801ca8:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801caf:	eb 0d                	jmp    801cbe <strtol+0xc8>
  801cb1:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801cb5:	75 07                	jne    801cbe <strtol+0xc8>
  801cb7:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801cbe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cc2:	0f b6 00             	movzbl (%rax),%eax
  801cc5:	3c 2f                	cmp    $0x2f,%al
  801cc7:	7e 1d                	jle    801ce6 <strtol+0xf0>
  801cc9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ccd:	0f b6 00             	movzbl (%rax),%eax
  801cd0:	3c 39                	cmp    $0x39,%al
  801cd2:	7f 12                	jg     801ce6 <strtol+0xf0>
  801cd4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cd8:	0f b6 00             	movzbl (%rax),%eax
  801cdb:	0f be c0             	movsbl %al,%eax
  801cde:	83 e8 30             	sub    $0x30,%eax
  801ce1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801ce4:	eb 4e                	jmp    801d34 <strtol+0x13e>
  801ce6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cea:	0f b6 00             	movzbl (%rax),%eax
  801ced:	3c 60                	cmp    $0x60,%al
  801cef:	7e 1d                	jle    801d0e <strtol+0x118>
  801cf1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cf5:	0f b6 00             	movzbl (%rax),%eax
  801cf8:	3c 7a                	cmp    $0x7a,%al
  801cfa:	7f 12                	jg     801d0e <strtol+0x118>
  801cfc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d00:	0f b6 00             	movzbl (%rax),%eax
  801d03:	0f be c0             	movsbl %al,%eax
  801d06:	83 e8 57             	sub    $0x57,%eax
  801d09:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801d0c:	eb 26                	jmp    801d34 <strtol+0x13e>
  801d0e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d12:	0f b6 00             	movzbl (%rax),%eax
  801d15:	3c 40                	cmp    $0x40,%al
  801d17:	7e 48                	jle    801d61 <strtol+0x16b>
  801d19:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d1d:	0f b6 00             	movzbl (%rax),%eax
  801d20:	3c 5a                	cmp    $0x5a,%al
  801d22:	7f 3d                	jg     801d61 <strtol+0x16b>
  801d24:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d28:	0f b6 00             	movzbl (%rax),%eax
  801d2b:	0f be c0             	movsbl %al,%eax
  801d2e:	83 e8 37             	sub    $0x37,%eax
  801d31:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801d34:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d37:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801d3a:	7c 02                	jl     801d3e <strtol+0x148>
  801d3c:	eb 23                	jmp    801d61 <strtol+0x16b>
  801d3e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801d43:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801d46:	48 98                	cltq   
  801d48:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801d4d:	48 89 c2             	mov    %rax,%rdx
  801d50:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d53:	48 98                	cltq   
  801d55:	48 01 d0             	add    %rdx,%rax
  801d58:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d5c:	e9 5d ff ff ff       	jmpq   801cbe <strtol+0xc8>
  801d61:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801d66:	74 0b                	je     801d73 <strtol+0x17d>
  801d68:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801d6c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801d70:	48 89 10             	mov    %rdx,(%rax)
  801d73:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801d77:	74 09                	je     801d82 <strtol+0x18c>
  801d79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d7d:	48 f7 d8             	neg    %rax
  801d80:	eb 04                	jmp    801d86 <strtol+0x190>
  801d82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d86:	c9                   	leaveq 
  801d87:	c3                   	retq   

0000000000801d88 <strstr>:
  801d88:	55                   	push   %rbp
  801d89:	48 89 e5             	mov    %rsp,%rbp
  801d8c:	48 83 ec 30          	sub    $0x30,%rsp
  801d90:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801d94:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801d98:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801d9c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801da0:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801da4:	0f b6 00             	movzbl (%rax),%eax
  801da7:	88 45 ff             	mov    %al,-0x1(%rbp)
  801daa:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801dae:	75 06                	jne    801db6 <strstr+0x2e>
  801db0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801db4:	eb 6b                	jmp    801e21 <strstr+0x99>
  801db6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801dba:	48 89 c7             	mov    %rax,%rdi
  801dbd:	48 b8 5e 16 80 00 00 	movabs $0x80165e,%rax
  801dc4:	00 00 00 
  801dc7:	ff d0                	callq  *%rax
  801dc9:	48 98                	cltq   
  801dcb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801dcf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dd3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801dd7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ddb:	0f b6 00             	movzbl (%rax),%eax
  801dde:	88 45 ef             	mov    %al,-0x11(%rbp)
  801de1:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801de5:	75 07                	jne    801dee <strstr+0x66>
  801de7:	b8 00 00 00 00       	mov    $0x0,%eax
  801dec:	eb 33                	jmp    801e21 <strstr+0x99>
  801dee:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801df2:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801df5:	75 d8                	jne    801dcf <strstr+0x47>
  801df7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dfb:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801dff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e03:	48 89 ce             	mov    %rcx,%rsi
  801e06:	48 89 c7             	mov    %rax,%rdi
  801e09:	48 b8 7f 18 80 00 00 	movabs $0x80187f,%rax
  801e10:	00 00 00 
  801e13:	ff d0                	callq  *%rax
  801e15:	85 c0                	test   %eax,%eax
  801e17:	75 b6                	jne    801dcf <strstr+0x47>
  801e19:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e1d:	48 83 e8 01          	sub    $0x1,%rax
  801e21:	c9                   	leaveq 
  801e22:	c3                   	retq   

0000000000801e23 <syscall>:
  801e23:	55                   	push   %rbp
  801e24:	48 89 e5             	mov    %rsp,%rbp
  801e27:	53                   	push   %rbx
  801e28:	48 83 ec 48          	sub    $0x48,%rsp
  801e2c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801e2f:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801e32:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801e36:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801e3a:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801e3e:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801e42:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801e45:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801e49:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801e4d:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801e51:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801e55:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801e59:	4c 89 c3             	mov    %r8,%rbx
  801e5c:	cd 30                	int    $0x30
  801e5e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801e62:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801e66:	74 3e                	je     801ea6 <syscall+0x83>
  801e68:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801e6d:	7e 37                	jle    801ea6 <syscall+0x83>
  801e6f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801e73:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801e76:	49 89 d0             	mov    %rdx,%r8
  801e79:	89 c1                	mov    %eax,%ecx
  801e7b:	48 ba e8 5e 80 00 00 	movabs $0x805ee8,%rdx
  801e82:	00 00 00 
  801e85:	be 24 00 00 00       	mov    $0x24,%esi
  801e8a:	48 bf 05 5f 80 00 00 	movabs $0x805f05,%rdi
  801e91:	00 00 00 
  801e94:	b8 00 00 00 00       	mov    $0x0,%eax
  801e99:	49 b9 dc 08 80 00 00 	movabs $0x8008dc,%r9
  801ea0:	00 00 00 
  801ea3:	41 ff d1             	callq  *%r9
  801ea6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801eaa:	48 83 c4 48          	add    $0x48,%rsp
  801eae:	5b                   	pop    %rbx
  801eaf:	5d                   	pop    %rbp
  801eb0:	c3                   	retq   

0000000000801eb1 <sys_cputs>:
  801eb1:	55                   	push   %rbp
  801eb2:	48 89 e5             	mov    %rsp,%rbp
  801eb5:	48 83 ec 20          	sub    $0x20,%rsp
  801eb9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ebd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ec1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ec5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ec9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ed0:	00 
  801ed1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ed7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801edd:	48 89 d1             	mov    %rdx,%rcx
  801ee0:	48 89 c2             	mov    %rax,%rdx
  801ee3:	be 00 00 00 00       	mov    $0x0,%esi
  801ee8:	bf 00 00 00 00       	mov    $0x0,%edi
  801eed:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  801ef4:	00 00 00 
  801ef7:	ff d0                	callq  *%rax
  801ef9:	c9                   	leaveq 
  801efa:	c3                   	retq   

0000000000801efb <sys_cgetc>:
  801efb:	55                   	push   %rbp
  801efc:	48 89 e5             	mov    %rsp,%rbp
  801eff:	48 83 ec 10          	sub    $0x10,%rsp
  801f03:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f0a:	00 
  801f0b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f11:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f17:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f1c:	ba 00 00 00 00       	mov    $0x0,%edx
  801f21:	be 00 00 00 00       	mov    $0x0,%esi
  801f26:	bf 01 00 00 00       	mov    $0x1,%edi
  801f2b:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  801f32:	00 00 00 
  801f35:	ff d0                	callq  *%rax
  801f37:	c9                   	leaveq 
  801f38:	c3                   	retq   

0000000000801f39 <sys_env_destroy>:
  801f39:	55                   	push   %rbp
  801f3a:	48 89 e5             	mov    %rsp,%rbp
  801f3d:	48 83 ec 10          	sub    $0x10,%rsp
  801f41:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f47:	48 98                	cltq   
  801f49:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f50:	00 
  801f51:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f57:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f5d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f62:	48 89 c2             	mov    %rax,%rdx
  801f65:	be 01 00 00 00       	mov    $0x1,%esi
  801f6a:	bf 03 00 00 00       	mov    $0x3,%edi
  801f6f:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  801f76:	00 00 00 
  801f79:	ff d0                	callq  *%rax
  801f7b:	c9                   	leaveq 
  801f7c:	c3                   	retq   

0000000000801f7d <sys_getenvid>:
  801f7d:	55                   	push   %rbp
  801f7e:	48 89 e5             	mov    %rsp,%rbp
  801f81:	48 83 ec 10          	sub    $0x10,%rsp
  801f85:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f8c:	00 
  801f8d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f93:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f99:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f9e:	ba 00 00 00 00       	mov    $0x0,%edx
  801fa3:	be 00 00 00 00       	mov    $0x0,%esi
  801fa8:	bf 02 00 00 00       	mov    $0x2,%edi
  801fad:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  801fb4:	00 00 00 
  801fb7:	ff d0                	callq  *%rax
  801fb9:	c9                   	leaveq 
  801fba:	c3                   	retq   

0000000000801fbb <sys_yield>:
  801fbb:	55                   	push   %rbp
  801fbc:	48 89 e5             	mov    %rsp,%rbp
  801fbf:	48 83 ec 10          	sub    $0x10,%rsp
  801fc3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fca:	00 
  801fcb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fd1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fd7:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fdc:	ba 00 00 00 00       	mov    $0x0,%edx
  801fe1:	be 00 00 00 00       	mov    $0x0,%esi
  801fe6:	bf 0b 00 00 00       	mov    $0xb,%edi
  801feb:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  801ff2:	00 00 00 
  801ff5:	ff d0                	callq  *%rax
  801ff7:	c9                   	leaveq 
  801ff8:	c3                   	retq   

0000000000801ff9 <sys_page_alloc>:
  801ff9:	55                   	push   %rbp
  801ffa:	48 89 e5             	mov    %rsp,%rbp
  801ffd:	48 83 ec 20          	sub    $0x20,%rsp
  802001:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802004:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802008:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80200b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80200e:	48 63 c8             	movslq %eax,%rcx
  802011:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802015:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802018:	48 98                	cltq   
  80201a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802021:	00 
  802022:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802028:	49 89 c8             	mov    %rcx,%r8
  80202b:	48 89 d1             	mov    %rdx,%rcx
  80202e:	48 89 c2             	mov    %rax,%rdx
  802031:	be 01 00 00 00       	mov    $0x1,%esi
  802036:	bf 04 00 00 00       	mov    $0x4,%edi
  80203b:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  802042:	00 00 00 
  802045:	ff d0                	callq  *%rax
  802047:	c9                   	leaveq 
  802048:	c3                   	retq   

0000000000802049 <sys_page_map>:
  802049:	55                   	push   %rbp
  80204a:	48 89 e5             	mov    %rsp,%rbp
  80204d:	48 83 ec 30          	sub    $0x30,%rsp
  802051:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802054:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802058:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80205b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80205f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802063:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802066:	48 63 c8             	movslq %eax,%rcx
  802069:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80206d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802070:	48 63 f0             	movslq %eax,%rsi
  802073:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802077:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80207a:	48 98                	cltq   
  80207c:	48 89 0c 24          	mov    %rcx,(%rsp)
  802080:	49 89 f9             	mov    %rdi,%r9
  802083:	49 89 f0             	mov    %rsi,%r8
  802086:	48 89 d1             	mov    %rdx,%rcx
  802089:	48 89 c2             	mov    %rax,%rdx
  80208c:	be 01 00 00 00       	mov    $0x1,%esi
  802091:	bf 05 00 00 00       	mov    $0x5,%edi
  802096:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  80209d:	00 00 00 
  8020a0:	ff d0                	callq  *%rax
  8020a2:	c9                   	leaveq 
  8020a3:	c3                   	retq   

00000000008020a4 <sys_page_unmap>:
  8020a4:	55                   	push   %rbp
  8020a5:	48 89 e5             	mov    %rsp,%rbp
  8020a8:	48 83 ec 20          	sub    $0x20,%rsp
  8020ac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8020af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020b3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020ba:	48 98                	cltq   
  8020bc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8020c3:	00 
  8020c4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020ca:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020d0:	48 89 d1             	mov    %rdx,%rcx
  8020d3:	48 89 c2             	mov    %rax,%rdx
  8020d6:	be 01 00 00 00       	mov    $0x1,%esi
  8020db:	bf 06 00 00 00       	mov    $0x6,%edi
  8020e0:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  8020e7:	00 00 00 
  8020ea:	ff d0                	callq  *%rax
  8020ec:	c9                   	leaveq 
  8020ed:	c3                   	retq   

00000000008020ee <sys_env_set_status>:
  8020ee:	55                   	push   %rbp
  8020ef:	48 89 e5             	mov    %rsp,%rbp
  8020f2:	48 83 ec 10          	sub    $0x10,%rsp
  8020f6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8020f9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8020fc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020ff:	48 63 d0             	movslq %eax,%rdx
  802102:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802105:	48 98                	cltq   
  802107:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80210e:	00 
  80210f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802115:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80211b:	48 89 d1             	mov    %rdx,%rcx
  80211e:	48 89 c2             	mov    %rax,%rdx
  802121:	be 01 00 00 00       	mov    $0x1,%esi
  802126:	bf 08 00 00 00       	mov    $0x8,%edi
  80212b:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  802132:	00 00 00 
  802135:	ff d0                	callq  *%rax
  802137:	c9                   	leaveq 
  802138:	c3                   	retq   

0000000000802139 <sys_env_set_trapframe>:
  802139:	55                   	push   %rbp
  80213a:	48 89 e5             	mov    %rsp,%rbp
  80213d:	48 83 ec 20          	sub    $0x20,%rsp
  802141:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802144:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802148:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80214c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80214f:	48 98                	cltq   
  802151:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802158:	00 
  802159:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80215f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802165:	48 89 d1             	mov    %rdx,%rcx
  802168:	48 89 c2             	mov    %rax,%rdx
  80216b:	be 01 00 00 00       	mov    $0x1,%esi
  802170:	bf 09 00 00 00       	mov    $0x9,%edi
  802175:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  80217c:	00 00 00 
  80217f:	ff d0                	callq  *%rax
  802181:	c9                   	leaveq 
  802182:	c3                   	retq   

0000000000802183 <sys_env_set_pgfault_upcall>:
  802183:	55                   	push   %rbp
  802184:	48 89 e5             	mov    %rsp,%rbp
  802187:	48 83 ec 20          	sub    $0x20,%rsp
  80218b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80218e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802192:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802196:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802199:	48 98                	cltq   
  80219b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021a2:	00 
  8021a3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021a9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021af:	48 89 d1             	mov    %rdx,%rcx
  8021b2:	48 89 c2             	mov    %rax,%rdx
  8021b5:	be 01 00 00 00       	mov    $0x1,%esi
  8021ba:	bf 0a 00 00 00       	mov    $0xa,%edi
  8021bf:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  8021c6:	00 00 00 
  8021c9:	ff d0                	callq  *%rax
  8021cb:	c9                   	leaveq 
  8021cc:	c3                   	retq   

00000000008021cd <sys_ipc_try_send>:
  8021cd:	55                   	push   %rbp
  8021ce:	48 89 e5             	mov    %rsp,%rbp
  8021d1:	48 83 ec 20          	sub    $0x20,%rsp
  8021d5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8021d8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8021dc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8021e0:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8021e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021e6:	48 63 f0             	movslq %eax,%rsi
  8021e9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8021ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021f0:	48 98                	cltq   
  8021f2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8021f6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021fd:	00 
  8021fe:	49 89 f1             	mov    %rsi,%r9
  802201:	49 89 c8             	mov    %rcx,%r8
  802204:	48 89 d1             	mov    %rdx,%rcx
  802207:	48 89 c2             	mov    %rax,%rdx
  80220a:	be 00 00 00 00       	mov    $0x0,%esi
  80220f:	bf 0c 00 00 00       	mov    $0xc,%edi
  802214:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  80221b:	00 00 00 
  80221e:	ff d0                	callq  *%rax
  802220:	c9                   	leaveq 
  802221:	c3                   	retq   

0000000000802222 <sys_ipc_recv>:
  802222:	55                   	push   %rbp
  802223:	48 89 e5             	mov    %rsp,%rbp
  802226:	48 83 ec 10          	sub    $0x10,%rsp
  80222a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80222e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802232:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802239:	00 
  80223a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802240:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802246:	b9 00 00 00 00       	mov    $0x0,%ecx
  80224b:	48 89 c2             	mov    %rax,%rdx
  80224e:	be 01 00 00 00       	mov    $0x1,%esi
  802253:	bf 0d 00 00 00       	mov    $0xd,%edi
  802258:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  80225f:	00 00 00 
  802262:	ff d0                	callq  *%rax
  802264:	c9                   	leaveq 
  802265:	c3                   	retq   

0000000000802266 <sys_time_msec>:
  802266:	55                   	push   %rbp
  802267:	48 89 e5             	mov    %rsp,%rbp
  80226a:	48 83 ec 10          	sub    $0x10,%rsp
  80226e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802275:	00 
  802276:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80227c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802282:	b9 00 00 00 00       	mov    $0x0,%ecx
  802287:	ba 00 00 00 00       	mov    $0x0,%edx
  80228c:	be 00 00 00 00       	mov    $0x0,%esi
  802291:	bf 0e 00 00 00       	mov    $0xe,%edi
  802296:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  80229d:	00 00 00 
  8022a0:	ff d0                	callq  *%rax
  8022a2:	c9                   	leaveq 
  8022a3:	c3                   	retq   

00000000008022a4 <sys_net_transmit>:
  8022a4:	55                   	push   %rbp
  8022a5:	48 89 e5             	mov    %rsp,%rbp
  8022a8:	48 83 ec 20          	sub    $0x20,%rsp
  8022ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8022b0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8022b3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8022b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022ba:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8022c1:	00 
  8022c2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022c8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022ce:	48 89 d1             	mov    %rdx,%rcx
  8022d1:	48 89 c2             	mov    %rax,%rdx
  8022d4:	be 00 00 00 00       	mov    $0x0,%esi
  8022d9:	bf 0f 00 00 00       	mov    $0xf,%edi
  8022de:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  8022e5:	00 00 00 
  8022e8:	ff d0                	callq  *%rax
  8022ea:	c9                   	leaveq 
  8022eb:	c3                   	retq   

00000000008022ec <sys_net_receive>:
  8022ec:	55                   	push   %rbp
  8022ed:	48 89 e5             	mov    %rsp,%rbp
  8022f0:	48 83 ec 20          	sub    $0x20,%rsp
  8022f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8022f8:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8022fb:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8022fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802302:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802309:	00 
  80230a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802310:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802316:	48 89 d1             	mov    %rdx,%rcx
  802319:	48 89 c2             	mov    %rax,%rdx
  80231c:	be 00 00 00 00       	mov    $0x0,%esi
  802321:	bf 10 00 00 00       	mov    $0x10,%edi
  802326:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  80232d:	00 00 00 
  802330:	ff d0                	callq  *%rax
  802332:	c9                   	leaveq 
  802333:	c3                   	retq   

0000000000802334 <sys_ept_map>:
  802334:	55                   	push   %rbp
  802335:	48 89 e5             	mov    %rsp,%rbp
  802338:	48 83 ec 30          	sub    $0x30,%rsp
  80233c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80233f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802343:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802346:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80234a:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  80234e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802351:	48 63 c8             	movslq %eax,%rcx
  802354:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802358:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80235b:	48 63 f0             	movslq %eax,%rsi
  80235e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802362:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802365:	48 98                	cltq   
  802367:	48 89 0c 24          	mov    %rcx,(%rsp)
  80236b:	49 89 f9             	mov    %rdi,%r9
  80236e:	49 89 f0             	mov    %rsi,%r8
  802371:	48 89 d1             	mov    %rdx,%rcx
  802374:	48 89 c2             	mov    %rax,%rdx
  802377:	be 00 00 00 00       	mov    $0x0,%esi
  80237c:	bf 11 00 00 00       	mov    $0x11,%edi
  802381:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  802388:	00 00 00 
  80238b:	ff d0                	callq  *%rax
  80238d:	c9                   	leaveq 
  80238e:	c3                   	retq   

000000000080238f <sys_env_mkguest>:
  80238f:	55                   	push   %rbp
  802390:	48 89 e5             	mov    %rsp,%rbp
  802393:	48 83 ec 20          	sub    $0x20,%rsp
  802397:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80239b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80239f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023a7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8023ae:	00 
  8023af:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023b5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023bb:	48 89 d1             	mov    %rdx,%rcx
  8023be:	48 89 c2             	mov    %rax,%rdx
  8023c1:	be 00 00 00 00       	mov    $0x0,%esi
  8023c6:	bf 12 00 00 00       	mov    $0x12,%edi
  8023cb:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  8023d2:	00 00 00 
  8023d5:	ff d0                	callq  *%rax
  8023d7:	c9                   	leaveq 
  8023d8:	c3                   	retq   

00000000008023d9 <sys_vmx_list_vms>:
  8023d9:	55                   	push   %rbp
  8023da:	48 89 e5             	mov    %rsp,%rbp
  8023dd:	48 83 ec 10          	sub    $0x10,%rsp
  8023e1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8023e8:	00 
  8023e9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023ef:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023f5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8023fa:	ba 00 00 00 00       	mov    $0x0,%edx
  8023ff:	be 00 00 00 00       	mov    $0x0,%esi
  802404:	bf 13 00 00 00       	mov    $0x13,%edi
  802409:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  802410:	00 00 00 
  802413:	ff d0                	callq  *%rax
  802415:	c9                   	leaveq 
  802416:	c3                   	retq   

0000000000802417 <sys_vmx_sel_resume>:
  802417:	55                   	push   %rbp
  802418:	48 89 e5             	mov    %rsp,%rbp
  80241b:	48 83 ec 10          	sub    $0x10,%rsp
  80241f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802422:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802425:	48 98                	cltq   
  802427:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80242e:	00 
  80242f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802435:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80243b:	b9 00 00 00 00       	mov    $0x0,%ecx
  802440:	48 89 c2             	mov    %rax,%rdx
  802443:	be 00 00 00 00       	mov    $0x0,%esi
  802448:	bf 14 00 00 00       	mov    $0x14,%edi
  80244d:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  802454:	00 00 00 
  802457:	ff d0                	callq  *%rax
  802459:	c9                   	leaveq 
  80245a:	c3                   	retq   

000000000080245b <sys_vmx_get_vmdisk_number>:
  80245b:	55                   	push   %rbp
  80245c:	48 89 e5             	mov    %rsp,%rbp
  80245f:	48 83 ec 10          	sub    $0x10,%rsp
  802463:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80246a:	00 
  80246b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802471:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802477:	b9 00 00 00 00       	mov    $0x0,%ecx
  80247c:	ba 00 00 00 00       	mov    $0x0,%edx
  802481:	be 00 00 00 00       	mov    $0x0,%esi
  802486:	bf 15 00 00 00       	mov    $0x15,%edi
  80248b:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  802492:	00 00 00 
  802495:	ff d0                	callq  *%rax
  802497:	c9                   	leaveq 
  802498:	c3                   	retq   

0000000000802499 <sys_vmx_incr_vmdisk_number>:
  802499:	55                   	push   %rbp
  80249a:	48 89 e5             	mov    %rsp,%rbp
  80249d:	48 83 ec 10          	sub    $0x10,%rsp
  8024a1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8024a8:	00 
  8024a9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8024af:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8024b5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8024ba:	ba 00 00 00 00       	mov    $0x0,%edx
  8024bf:	be 00 00 00 00       	mov    $0x0,%esi
  8024c4:	bf 16 00 00 00       	mov    $0x16,%edi
  8024c9:	48 b8 23 1e 80 00 00 	movabs $0x801e23,%rax
  8024d0:	00 00 00 
  8024d3:	ff d0                	callq  *%rax
  8024d5:	c9                   	leaveq 
  8024d6:	c3                   	retq   

00000000008024d7 <pgfault>:
  8024d7:	55                   	push   %rbp
  8024d8:	48 89 e5             	mov    %rsp,%rbp
  8024db:	48 83 ec 30          	sub    $0x30,%rsp
  8024df:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8024e3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024e7:	48 8b 00             	mov    (%rax),%rax
  8024ea:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8024ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024f2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8024f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024fc:	83 e0 02             	and    $0x2,%eax
  8024ff:	85 c0                	test   %eax,%eax
  802501:	75 40                	jne    802543 <pgfault+0x6c>
  802503:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802507:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  80250e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802512:	49 89 d0             	mov    %rdx,%r8
  802515:	48 89 c1             	mov    %rax,%rcx
  802518:	48 ba 18 5f 80 00 00 	movabs $0x805f18,%rdx
  80251f:	00 00 00 
  802522:	be 1f 00 00 00       	mov    $0x1f,%esi
  802527:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  80252e:	00 00 00 
  802531:	b8 00 00 00 00       	mov    $0x0,%eax
  802536:	49 b9 dc 08 80 00 00 	movabs $0x8008dc,%r9
  80253d:	00 00 00 
  802540:	41 ff d1             	callq  *%r9
  802543:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802547:	48 c1 e8 0c          	shr    $0xc,%rax
  80254b:	48 89 c2             	mov    %rax,%rdx
  80254e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802555:	01 00 00 
  802558:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80255c:	25 07 08 00 00       	and    $0x807,%eax
  802561:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  802567:	74 4e                	je     8025b7 <pgfault+0xe0>
  802569:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80256d:	48 c1 e8 0c          	shr    $0xc,%rax
  802571:	48 89 c2             	mov    %rax,%rdx
  802574:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80257b:	01 00 00 
  80257e:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802582:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802586:	49 89 d0             	mov    %rdx,%r8
  802589:	48 89 c1             	mov    %rax,%rcx
  80258c:	48 ba 40 5f 80 00 00 	movabs $0x805f40,%rdx
  802593:	00 00 00 
  802596:	be 22 00 00 00       	mov    $0x22,%esi
  80259b:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  8025a2:	00 00 00 
  8025a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8025aa:	49 b9 dc 08 80 00 00 	movabs $0x8008dc,%r9
  8025b1:	00 00 00 
  8025b4:	41 ff d1             	callq  *%r9
  8025b7:	ba 07 00 00 00       	mov    $0x7,%edx
  8025bc:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8025c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8025c6:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  8025cd:	00 00 00 
  8025d0:	ff d0                	callq  *%rax
  8025d2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8025d5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8025d9:	79 30                	jns    80260b <pgfault+0x134>
  8025db:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025de:	89 c1                	mov    %eax,%ecx
  8025e0:	48 ba 6b 5f 80 00 00 	movabs $0x805f6b,%rdx
  8025e7:	00 00 00 
  8025ea:	be 30 00 00 00       	mov    $0x30,%esi
  8025ef:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  8025f6:	00 00 00 
  8025f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8025fe:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  802605:	00 00 00 
  802608:	41 ff d0             	callq  *%r8
  80260b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80260f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802613:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802617:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80261d:	ba 00 10 00 00       	mov    $0x1000,%edx
  802622:	48 89 c6             	mov    %rax,%rsi
  802625:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  80262a:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  802631:	00 00 00 
  802634:	ff d0                	callq  *%rax
  802636:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80263a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80263e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802642:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802648:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80264e:	48 89 c1             	mov    %rax,%rcx
  802651:	ba 00 00 00 00       	mov    $0x0,%edx
  802656:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80265b:	bf 00 00 00 00       	mov    $0x0,%edi
  802660:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  802667:	00 00 00 
  80266a:	ff d0                	callq  *%rax
  80266c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80266f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802673:	79 30                	jns    8026a5 <pgfault+0x1ce>
  802675:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802678:	89 c1                	mov    %eax,%ecx
  80267a:	48 ba 7e 5f 80 00 00 	movabs $0x805f7e,%rdx
  802681:	00 00 00 
  802684:	be 35 00 00 00       	mov    $0x35,%esi
  802689:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  802690:	00 00 00 
  802693:	b8 00 00 00 00       	mov    $0x0,%eax
  802698:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  80269f:	00 00 00 
  8026a2:	41 ff d0             	callq  *%r8
  8026a5:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8026aa:	bf 00 00 00 00       	mov    $0x0,%edi
  8026af:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  8026b6:	00 00 00 
  8026b9:	ff d0                	callq  *%rax
  8026bb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8026be:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8026c2:	79 30                	jns    8026f4 <pgfault+0x21d>
  8026c4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026c7:	89 c1                	mov    %eax,%ecx
  8026c9:	48 ba 8f 5f 80 00 00 	movabs $0x805f8f,%rdx
  8026d0:	00 00 00 
  8026d3:	be 39 00 00 00       	mov    $0x39,%esi
  8026d8:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  8026df:	00 00 00 
  8026e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8026e7:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  8026ee:	00 00 00 
  8026f1:	41 ff d0             	callq  *%r8
  8026f4:	c9                   	leaveq 
  8026f5:	c3                   	retq   

00000000008026f6 <duppage>:
  8026f6:	55                   	push   %rbp
  8026f7:	48 89 e5             	mov    %rsp,%rbp
  8026fa:	48 83 ec 30          	sub    $0x30,%rsp
  8026fe:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802701:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802704:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802707:	c1 e0 0c             	shl    $0xc,%eax
  80270a:	89 c0                	mov    %eax,%eax
  80270c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802710:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802717:	01 00 00 
  80271a:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80271d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802721:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802725:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802729:	25 02 08 00 00       	and    $0x802,%eax
  80272e:	48 85 c0             	test   %rax,%rax
  802731:	74 0e                	je     802741 <duppage+0x4b>
  802733:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802737:	25 00 04 00 00       	and    $0x400,%eax
  80273c:	48 85 c0             	test   %rax,%rax
  80273f:	74 70                	je     8027b1 <duppage+0xbb>
  802741:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802745:	25 07 0e 00 00       	and    $0xe07,%eax
  80274a:	89 c6                	mov    %eax,%esi
  80274c:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802750:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802753:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802757:	41 89 f0             	mov    %esi,%r8d
  80275a:	48 89 c6             	mov    %rax,%rsi
  80275d:	bf 00 00 00 00       	mov    $0x0,%edi
  802762:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  802769:	00 00 00 
  80276c:	ff d0                	callq  *%rax
  80276e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802771:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802775:	79 30                	jns    8027a7 <duppage+0xb1>
  802777:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80277a:	89 c1                	mov    %eax,%ecx
  80277c:	48 ba 7e 5f 80 00 00 	movabs $0x805f7e,%rdx
  802783:	00 00 00 
  802786:	be 63 00 00 00       	mov    $0x63,%esi
  80278b:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  802792:	00 00 00 
  802795:	b8 00 00 00 00       	mov    $0x0,%eax
  80279a:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  8027a1:	00 00 00 
  8027a4:	41 ff d0             	callq  *%r8
  8027a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8027ac:	e9 c4 00 00 00       	jmpq   802875 <duppage+0x17f>
  8027b1:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8027b5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8027b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8027bc:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8027c2:	48 89 c6             	mov    %rax,%rsi
  8027c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8027ca:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  8027d1:	00 00 00 
  8027d4:	ff d0                	callq  *%rax
  8027d6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8027d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8027dd:	79 30                	jns    80280f <duppage+0x119>
  8027df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027e2:	89 c1                	mov    %eax,%ecx
  8027e4:	48 ba 7e 5f 80 00 00 	movabs $0x805f7e,%rdx
  8027eb:	00 00 00 
  8027ee:	be 7e 00 00 00       	mov    $0x7e,%esi
  8027f3:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  8027fa:	00 00 00 
  8027fd:	b8 00 00 00 00       	mov    $0x0,%eax
  802802:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  802809:	00 00 00 
  80280c:	41 ff d0             	callq  *%r8
  80280f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802813:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802817:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80281d:	48 89 d1             	mov    %rdx,%rcx
  802820:	ba 00 00 00 00       	mov    $0x0,%edx
  802825:	48 89 c6             	mov    %rax,%rsi
  802828:	bf 00 00 00 00       	mov    $0x0,%edi
  80282d:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  802834:	00 00 00 
  802837:	ff d0                	callq  *%rax
  802839:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80283c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802840:	79 30                	jns    802872 <duppage+0x17c>
  802842:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802845:	89 c1                	mov    %eax,%ecx
  802847:	48 ba 7e 5f 80 00 00 	movabs $0x805f7e,%rdx
  80284e:	00 00 00 
  802851:	be 80 00 00 00       	mov    $0x80,%esi
  802856:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  80285d:	00 00 00 
  802860:	b8 00 00 00 00       	mov    $0x0,%eax
  802865:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  80286c:	00 00 00 
  80286f:	41 ff d0             	callq  *%r8
  802872:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802875:	c9                   	leaveq 
  802876:	c3                   	retq   

0000000000802877 <fork>:
  802877:	55                   	push   %rbp
  802878:	48 89 e5             	mov    %rsp,%rbp
  80287b:	48 83 ec 20          	sub    $0x20,%rsp
  80287f:	48 bf d7 24 80 00 00 	movabs $0x8024d7,%rdi
  802886:	00 00 00 
  802889:	48 b8 eb 54 80 00 00 	movabs $0x8054eb,%rax
  802890:	00 00 00 
  802893:	ff d0                	callq  *%rax
  802895:	b8 07 00 00 00       	mov    $0x7,%eax
  80289a:	cd 30                	int    $0x30
  80289c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80289f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028a2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8028a5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8028a9:	79 08                	jns    8028b3 <fork+0x3c>
  8028ab:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8028ae:	e9 09 02 00 00       	jmpq   802abc <fork+0x245>
  8028b3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8028b7:	75 3e                	jne    8028f7 <fork+0x80>
  8028b9:	48 b8 7d 1f 80 00 00 	movabs $0x801f7d,%rax
  8028c0:	00 00 00 
  8028c3:	ff d0                	callq  *%rax
  8028c5:	25 ff 03 00 00       	and    $0x3ff,%eax
  8028ca:	48 98                	cltq   
  8028cc:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8028d3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8028da:	00 00 00 
  8028dd:	48 01 c2             	add    %rax,%rdx
  8028e0:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8028e7:	00 00 00 
  8028ea:	48 89 10             	mov    %rdx,(%rax)
  8028ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8028f2:	e9 c5 01 00 00       	jmpq   802abc <fork+0x245>
  8028f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8028fe:	e9 a4 00 00 00       	jmpq   8029a7 <fork+0x130>
  802903:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802906:	c1 f8 12             	sar    $0x12,%eax
  802909:	89 c2                	mov    %eax,%edx
  80290b:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802912:	01 00 00 
  802915:	48 63 d2             	movslq %edx,%rdx
  802918:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80291c:	83 e0 01             	and    $0x1,%eax
  80291f:	48 85 c0             	test   %rax,%rax
  802922:	74 21                	je     802945 <fork+0xce>
  802924:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802927:	c1 f8 09             	sar    $0x9,%eax
  80292a:	89 c2                	mov    %eax,%edx
  80292c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802933:	01 00 00 
  802936:	48 63 d2             	movslq %edx,%rdx
  802939:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80293d:	83 e0 01             	and    $0x1,%eax
  802940:	48 85 c0             	test   %rax,%rax
  802943:	75 09                	jne    80294e <fork+0xd7>
  802945:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  80294c:	eb 59                	jmp    8029a7 <fork+0x130>
  80294e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802951:	05 00 02 00 00       	add    $0x200,%eax
  802956:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802959:	eb 44                	jmp    80299f <fork+0x128>
  80295b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802962:	01 00 00 
  802965:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802968:	48 63 d2             	movslq %edx,%rdx
  80296b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80296f:	83 e0 05             	and    $0x5,%eax
  802972:	48 83 f8 05          	cmp    $0x5,%rax
  802976:	74 02                	je     80297a <fork+0x103>
  802978:	eb 21                	jmp    80299b <fork+0x124>
  80297a:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  802981:	75 02                	jne    802985 <fork+0x10e>
  802983:	eb 16                	jmp    80299b <fork+0x124>
  802985:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802988:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80298b:	89 d6                	mov    %edx,%esi
  80298d:	89 c7                	mov    %eax,%edi
  80298f:	48 b8 f6 26 80 00 00 	movabs $0x8026f6,%rax
  802996:	00 00 00 
  802999:	ff d0                	callq  *%rax
  80299b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80299f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029a2:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8029a5:	7c b4                	jl     80295b <fork+0xe4>
  8029a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029aa:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8029af:	0f 86 4e ff ff ff    	jbe    802903 <fork+0x8c>
  8029b5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8029b8:	ba 07 00 00 00       	mov    $0x7,%edx
  8029bd:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8029c2:	89 c7                	mov    %eax,%edi
  8029c4:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  8029cb:	00 00 00 
  8029ce:	ff d0                	callq  *%rax
  8029d0:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8029d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8029d7:	79 30                	jns    802a09 <fork+0x192>
  8029d9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8029dc:	89 c1                	mov    %eax,%ecx
  8029de:	48 ba a8 5f 80 00 00 	movabs $0x805fa8,%rdx
  8029e5:	00 00 00 
  8029e8:	be bc 00 00 00       	mov    $0xbc,%esi
  8029ed:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  8029f4:	00 00 00 
  8029f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8029fc:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  802a03:	00 00 00 
  802a06:	41 ff d0             	callq  *%r8
  802a09:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802a10:	00 00 00 
  802a13:	48 8b 00             	mov    (%rax),%rax
  802a16:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802a1d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802a20:	48 89 d6             	mov    %rdx,%rsi
  802a23:	89 c7                	mov    %eax,%edi
  802a25:	48 b8 83 21 80 00 00 	movabs $0x802183,%rax
  802a2c:	00 00 00 
  802a2f:	ff d0                	callq  *%rax
  802a31:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802a34:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802a38:	79 30                	jns    802a6a <fork+0x1f3>
  802a3a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802a3d:	89 c1                	mov    %eax,%ecx
  802a3f:	48 ba c8 5f 80 00 00 	movabs $0x805fc8,%rdx
  802a46:	00 00 00 
  802a49:	be c0 00 00 00       	mov    $0xc0,%esi
  802a4e:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  802a55:	00 00 00 
  802a58:	b8 00 00 00 00       	mov    $0x0,%eax
  802a5d:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  802a64:	00 00 00 
  802a67:	41 ff d0             	callq  *%r8
  802a6a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802a6d:	be 02 00 00 00       	mov    $0x2,%esi
  802a72:	89 c7                	mov    %eax,%edi
  802a74:	48 b8 ee 20 80 00 00 	movabs $0x8020ee,%rax
  802a7b:	00 00 00 
  802a7e:	ff d0                	callq  *%rax
  802a80:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802a83:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802a87:	79 30                	jns    802ab9 <fork+0x242>
  802a89:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802a8c:	89 c1                	mov    %eax,%ecx
  802a8e:	48 ba e7 5f 80 00 00 	movabs $0x805fe7,%rdx
  802a95:	00 00 00 
  802a98:	be c5 00 00 00       	mov    $0xc5,%esi
  802a9d:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  802aa4:	00 00 00 
  802aa7:	b8 00 00 00 00       	mov    $0x0,%eax
  802aac:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  802ab3:	00 00 00 
  802ab6:	41 ff d0             	callq  *%r8
  802ab9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802abc:	c9                   	leaveq 
  802abd:	c3                   	retq   

0000000000802abe <sfork>:
  802abe:	55                   	push   %rbp
  802abf:	48 89 e5             	mov    %rsp,%rbp
  802ac2:	48 ba fe 5f 80 00 00 	movabs $0x805ffe,%rdx
  802ac9:	00 00 00 
  802acc:	be d2 00 00 00       	mov    $0xd2,%esi
  802ad1:	48 bf 31 5f 80 00 00 	movabs $0x805f31,%rdi
  802ad8:	00 00 00 
  802adb:	b8 00 00 00 00       	mov    $0x0,%eax
  802ae0:	48 b9 dc 08 80 00 00 	movabs $0x8008dc,%rcx
  802ae7:	00 00 00 
  802aea:	ff d1                	callq  *%rcx

0000000000802aec <fd2num>:
  802aec:	55                   	push   %rbp
  802aed:	48 89 e5             	mov    %rsp,%rbp
  802af0:	48 83 ec 08          	sub    $0x8,%rsp
  802af4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802af8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802afc:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802b03:	ff ff ff 
  802b06:	48 01 d0             	add    %rdx,%rax
  802b09:	48 c1 e8 0c          	shr    $0xc,%rax
  802b0d:	c9                   	leaveq 
  802b0e:	c3                   	retq   

0000000000802b0f <fd2data>:
  802b0f:	55                   	push   %rbp
  802b10:	48 89 e5             	mov    %rsp,%rbp
  802b13:	48 83 ec 08          	sub    $0x8,%rsp
  802b17:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b1b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b1f:	48 89 c7             	mov    %rax,%rdi
  802b22:	48 b8 ec 2a 80 00 00 	movabs $0x802aec,%rax
  802b29:	00 00 00 
  802b2c:	ff d0                	callq  *%rax
  802b2e:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802b34:	48 c1 e0 0c          	shl    $0xc,%rax
  802b38:	c9                   	leaveq 
  802b39:	c3                   	retq   

0000000000802b3a <fd_alloc>:
  802b3a:	55                   	push   %rbp
  802b3b:	48 89 e5             	mov    %rsp,%rbp
  802b3e:	48 83 ec 18          	sub    $0x18,%rsp
  802b42:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b46:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b4d:	eb 6b                	jmp    802bba <fd_alloc+0x80>
  802b4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b52:	48 98                	cltq   
  802b54:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802b5a:	48 c1 e0 0c          	shl    $0xc,%rax
  802b5e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802b62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b66:	48 c1 e8 15          	shr    $0x15,%rax
  802b6a:	48 89 c2             	mov    %rax,%rdx
  802b6d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802b74:	01 00 00 
  802b77:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b7b:	83 e0 01             	and    $0x1,%eax
  802b7e:	48 85 c0             	test   %rax,%rax
  802b81:	74 21                	je     802ba4 <fd_alloc+0x6a>
  802b83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b87:	48 c1 e8 0c          	shr    $0xc,%rax
  802b8b:	48 89 c2             	mov    %rax,%rdx
  802b8e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b95:	01 00 00 
  802b98:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b9c:	83 e0 01             	and    $0x1,%eax
  802b9f:	48 85 c0             	test   %rax,%rax
  802ba2:	75 12                	jne    802bb6 <fd_alloc+0x7c>
  802ba4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ba8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802bac:	48 89 10             	mov    %rdx,(%rax)
  802baf:	b8 00 00 00 00       	mov    $0x0,%eax
  802bb4:	eb 1a                	jmp    802bd0 <fd_alloc+0x96>
  802bb6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802bba:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802bbe:	7e 8f                	jle    802b4f <fd_alloc+0x15>
  802bc0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bc4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802bcb:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802bd0:	c9                   	leaveq 
  802bd1:	c3                   	retq   

0000000000802bd2 <fd_lookup>:
  802bd2:	55                   	push   %rbp
  802bd3:	48 89 e5             	mov    %rsp,%rbp
  802bd6:	48 83 ec 20          	sub    $0x20,%rsp
  802bda:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802bdd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802be1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802be5:	78 06                	js     802bed <fd_lookup+0x1b>
  802be7:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802beb:	7e 07                	jle    802bf4 <fd_lookup+0x22>
  802bed:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802bf2:	eb 6c                	jmp    802c60 <fd_lookup+0x8e>
  802bf4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bf7:	48 98                	cltq   
  802bf9:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802bff:	48 c1 e0 0c          	shl    $0xc,%rax
  802c03:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802c07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c0b:	48 c1 e8 15          	shr    $0x15,%rax
  802c0f:	48 89 c2             	mov    %rax,%rdx
  802c12:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802c19:	01 00 00 
  802c1c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c20:	83 e0 01             	and    $0x1,%eax
  802c23:	48 85 c0             	test   %rax,%rax
  802c26:	74 21                	je     802c49 <fd_lookup+0x77>
  802c28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c2c:	48 c1 e8 0c          	shr    $0xc,%rax
  802c30:	48 89 c2             	mov    %rax,%rdx
  802c33:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c3a:	01 00 00 
  802c3d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c41:	83 e0 01             	and    $0x1,%eax
  802c44:	48 85 c0             	test   %rax,%rax
  802c47:	75 07                	jne    802c50 <fd_lookup+0x7e>
  802c49:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c4e:	eb 10                	jmp    802c60 <fd_lookup+0x8e>
  802c50:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c54:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802c58:	48 89 10             	mov    %rdx,(%rax)
  802c5b:	b8 00 00 00 00       	mov    $0x0,%eax
  802c60:	c9                   	leaveq 
  802c61:	c3                   	retq   

0000000000802c62 <fd_close>:
  802c62:	55                   	push   %rbp
  802c63:	48 89 e5             	mov    %rsp,%rbp
  802c66:	48 83 ec 30          	sub    $0x30,%rsp
  802c6a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802c6e:	89 f0                	mov    %esi,%eax
  802c70:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802c73:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c77:	48 89 c7             	mov    %rax,%rdi
  802c7a:	48 b8 ec 2a 80 00 00 	movabs $0x802aec,%rax
  802c81:	00 00 00 
  802c84:	ff d0                	callq  *%rax
  802c86:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c8a:	48 89 d6             	mov    %rdx,%rsi
  802c8d:	89 c7                	mov    %eax,%edi
  802c8f:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  802c96:	00 00 00 
  802c99:	ff d0                	callq  *%rax
  802c9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c9e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ca2:	78 0a                	js     802cae <fd_close+0x4c>
  802ca4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ca8:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802cac:	74 12                	je     802cc0 <fd_close+0x5e>
  802cae:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802cb2:	74 05                	je     802cb9 <fd_close+0x57>
  802cb4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cb7:	eb 05                	jmp    802cbe <fd_close+0x5c>
  802cb9:	b8 00 00 00 00       	mov    $0x0,%eax
  802cbe:	eb 69                	jmp    802d29 <fd_close+0xc7>
  802cc0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802cc4:	8b 00                	mov    (%rax),%eax
  802cc6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802cca:	48 89 d6             	mov    %rdx,%rsi
  802ccd:	89 c7                	mov    %eax,%edi
  802ccf:	48 b8 2b 2d 80 00 00 	movabs $0x802d2b,%rax
  802cd6:	00 00 00 
  802cd9:	ff d0                	callq  *%rax
  802cdb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cde:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ce2:	78 2a                	js     802d0e <fd_close+0xac>
  802ce4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ce8:	48 8b 40 20          	mov    0x20(%rax),%rax
  802cec:	48 85 c0             	test   %rax,%rax
  802cef:	74 16                	je     802d07 <fd_close+0xa5>
  802cf1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cf5:	48 8b 40 20          	mov    0x20(%rax),%rax
  802cf9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802cfd:	48 89 d7             	mov    %rdx,%rdi
  802d00:	ff d0                	callq  *%rax
  802d02:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d05:	eb 07                	jmp    802d0e <fd_close+0xac>
  802d07:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d0e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d12:	48 89 c6             	mov    %rax,%rsi
  802d15:	bf 00 00 00 00       	mov    $0x0,%edi
  802d1a:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  802d21:	00 00 00 
  802d24:	ff d0                	callq  *%rax
  802d26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d29:	c9                   	leaveq 
  802d2a:	c3                   	retq   

0000000000802d2b <dev_lookup>:
  802d2b:	55                   	push   %rbp
  802d2c:	48 89 e5             	mov    %rsp,%rbp
  802d2f:	48 83 ec 20          	sub    $0x20,%rsp
  802d33:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d36:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d3a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d41:	eb 41                	jmp    802d84 <dev_lookup+0x59>
  802d43:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  802d4a:	00 00 00 
  802d4d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d50:	48 63 d2             	movslq %edx,%rdx
  802d53:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802d57:	8b 00                	mov    (%rax),%eax
  802d59:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802d5c:	75 22                	jne    802d80 <dev_lookup+0x55>
  802d5e:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  802d65:	00 00 00 
  802d68:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d6b:	48 63 d2             	movslq %edx,%rdx
  802d6e:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802d72:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d76:	48 89 10             	mov    %rdx,(%rax)
  802d79:	b8 00 00 00 00       	mov    $0x0,%eax
  802d7e:	eb 60                	jmp    802de0 <dev_lookup+0xb5>
  802d80:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802d84:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  802d8b:	00 00 00 
  802d8e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d91:	48 63 d2             	movslq %edx,%rdx
  802d94:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802d98:	48 85 c0             	test   %rax,%rax
  802d9b:	75 a6                	jne    802d43 <dev_lookup+0x18>
  802d9d:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802da4:	00 00 00 
  802da7:	48 8b 00             	mov    (%rax),%rax
  802daa:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802db0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802db3:	89 c6                	mov    %eax,%esi
  802db5:	48 bf 18 60 80 00 00 	movabs $0x806018,%rdi
  802dbc:	00 00 00 
  802dbf:	b8 00 00 00 00       	mov    $0x0,%eax
  802dc4:	48 b9 15 0b 80 00 00 	movabs $0x800b15,%rcx
  802dcb:	00 00 00 
  802dce:	ff d1                	callq  *%rcx
  802dd0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802dd4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802ddb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802de0:	c9                   	leaveq 
  802de1:	c3                   	retq   

0000000000802de2 <close>:
  802de2:	55                   	push   %rbp
  802de3:	48 89 e5             	mov    %rsp,%rbp
  802de6:	48 83 ec 20          	sub    $0x20,%rsp
  802dea:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ded:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802df1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802df4:	48 89 d6             	mov    %rdx,%rsi
  802df7:	89 c7                	mov    %eax,%edi
  802df9:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  802e00:	00 00 00 
  802e03:	ff d0                	callq  *%rax
  802e05:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e08:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e0c:	79 05                	jns    802e13 <close+0x31>
  802e0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e11:	eb 18                	jmp    802e2b <close+0x49>
  802e13:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e17:	be 01 00 00 00       	mov    $0x1,%esi
  802e1c:	48 89 c7             	mov    %rax,%rdi
  802e1f:	48 b8 62 2c 80 00 00 	movabs $0x802c62,%rax
  802e26:	00 00 00 
  802e29:	ff d0                	callq  *%rax
  802e2b:	c9                   	leaveq 
  802e2c:	c3                   	retq   

0000000000802e2d <close_all>:
  802e2d:	55                   	push   %rbp
  802e2e:	48 89 e5             	mov    %rsp,%rbp
  802e31:	48 83 ec 10          	sub    $0x10,%rsp
  802e35:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802e3c:	eb 15                	jmp    802e53 <close_all+0x26>
  802e3e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e41:	89 c7                	mov    %eax,%edi
  802e43:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  802e4a:	00 00 00 
  802e4d:	ff d0                	callq  *%rax
  802e4f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802e53:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802e57:	7e e5                	jle    802e3e <close_all+0x11>
  802e59:	c9                   	leaveq 
  802e5a:	c3                   	retq   

0000000000802e5b <dup>:
  802e5b:	55                   	push   %rbp
  802e5c:	48 89 e5             	mov    %rsp,%rbp
  802e5f:	48 83 ec 40          	sub    $0x40,%rsp
  802e63:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802e66:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802e69:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802e6d:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802e70:	48 89 d6             	mov    %rdx,%rsi
  802e73:	89 c7                	mov    %eax,%edi
  802e75:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  802e7c:	00 00 00 
  802e7f:	ff d0                	callq  *%rax
  802e81:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e84:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e88:	79 08                	jns    802e92 <dup+0x37>
  802e8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e8d:	e9 70 01 00 00       	jmpq   803002 <dup+0x1a7>
  802e92:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802e95:	89 c7                	mov    %eax,%edi
  802e97:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  802e9e:	00 00 00 
  802ea1:	ff d0                	callq  *%rax
  802ea3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802ea6:	48 98                	cltq   
  802ea8:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802eae:	48 c1 e0 0c          	shl    $0xc,%rax
  802eb2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802eb6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802eba:	48 89 c7             	mov    %rax,%rdi
  802ebd:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  802ec4:	00 00 00 
  802ec7:	ff d0                	callq  *%rax
  802ec9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802ecd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ed1:	48 89 c7             	mov    %rax,%rdi
  802ed4:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  802edb:	00 00 00 
  802ede:	ff d0                	callq  *%rax
  802ee0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802ee4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ee8:	48 c1 e8 15          	shr    $0x15,%rax
  802eec:	48 89 c2             	mov    %rax,%rdx
  802eef:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802ef6:	01 00 00 
  802ef9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802efd:	83 e0 01             	and    $0x1,%eax
  802f00:	48 85 c0             	test   %rax,%rax
  802f03:	74 73                	je     802f78 <dup+0x11d>
  802f05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f09:	48 c1 e8 0c          	shr    $0xc,%rax
  802f0d:	48 89 c2             	mov    %rax,%rdx
  802f10:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f17:	01 00 00 
  802f1a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f1e:	83 e0 01             	and    $0x1,%eax
  802f21:	48 85 c0             	test   %rax,%rax
  802f24:	74 52                	je     802f78 <dup+0x11d>
  802f26:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f2a:	48 c1 e8 0c          	shr    $0xc,%rax
  802f2e:	48 89 c2             	mov    %rax,%rdx
  802f31:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f38:	01 00 00 
  802f3b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f3f:	25 07 0e 00 00       	and    $0xe07,%eax
  802f44:	89 c1                	mov    %eax,%ecx
  802f46:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802f4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f4e:	41 89 c8             	mov    %ecx,%r8d
  802f51:	48 89 d1             	mov    %rdx,%rcx
  802f54:	ba 00 00 00 00       	mov    $0x0,%edx
  802f59:	48 89 c6             	mov    %rax,%rsi
  802f5c:	bf 00 00 00 00       	mov    $0x0,%edi
  802f61:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  802f68:	00 00 00 
  802f6b:	ff d0                	callq  *%rax
  802f6d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f70:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f74:	79 02                	jns    802f78 <dup+0x11d>
  802f76:	eb 57                	jmp    802fcf <dup+0x174>
  802f78:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f7c:	48 c1 e8 0c          	shr    $0xc,%rax
  802f80:	48 89 c2             	mov    %rax,%rdx
  802f83:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f8a:	01 00 00 
  802f8d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f91:	25 07 0e 00 00       	and    $0xe07,%eax
  802f96:	89 c1                	mov    %eax,%ecx
  802f98:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f9c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802fa0:	41 89 c8             	mov    %ecx,%r8d
  802fa3:	48 89 d1             	mov    %rdx,%rcx
  802fa6:	ba 00 00 00 00       	mov    $0x0,%edx
  802fab:	48 89 c6             	mov    %rax,%rsi
  802fae:	bf 00 00 00 00       	mov    $0x0,%edi
  802fb3:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  802fba:	00 00 00 
  802fbd:	ff d0                	callq  *%rax
  802fbf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fc2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fc6:	79 02                	jns    802fca <dup+0x16f>
  802fc8:	eb 05                	jmp    802fcf <dup+0x174>
  802fca:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802fcd:	eb 33                	jmp    803002 <dup+0x1a7>
  802fcf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fd3:	48 89 c6             	mov    %rax,%rsi
  802fd6:	bf 00 00 00 00       	mov    $0x0,%edi
  802fdb:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  802fe2:	00 00 00 
  802fe5:	ff d0                	callq  *%rax
  802fe7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802feb:	48 89 c6             	mov    %rax,%rsi
  802fee:	bf 00 00 00 00       	mov    $0x0,%edi
  802ff3:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  802ffa:	00 00 00 
  802ffd:	ff d0                	callq  *%rax
  802fff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803002:	c9                   	leaveq 
  803003:	c3                   	retq   

0000000000803004 <read>:
  803004:	55                   	push   %rbp
  803005:	48 89 e5             	mov    %rsp,%rbp
  803008:	48 83 ec 40          	sub    $0x40,%rsp
  80300c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80300f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803013:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803017:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80301b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80301e:	48 89 d6             	mov    %rdx,%rsi
  803021:	89 c7                	mov    %eax,%edi
  803023:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  80302a:	00 00 00 
  80302d:	ff d0                	callq  *%rax
  80302f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803032:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803036:	78 24                	js     80305c <read+0x58>
  803038:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80303c:	8b 00                	mov    (%rax),%eax
  80303e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803042:	48 89 d6             	mov    %rdx,%rsi
  803045:	89 c7                	mov    %eax,%edi
  803047:	48 b8 2b 2d 80 00 00 	movabs $0x802d2b,%rax
  80304e:	00 00 00 
  803051:	ff d0                	callq  *%rax
  803053:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803056:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80305a:	79 05                	jns    803061 <read+0x5d>
  80305c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80305f:	eb 76                	jmp    8030d7 <read+0xd3>
  803061:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803065:	8b 40 08             	mov    0x8(%rax),%eax
  803068:	83 e0 03             	and    $0x3,%eax
  80306b:	83 f8 01             	cmp    $0x1,%eax
  80306e:	75 3a                	jne    8030aa <read+0xa6>
  803070:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  803077:	00 00 00 
  80307a:	48 8b 00             	mov    (%rax),%rax
  80307d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803083:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803086:	89 c6                	mov    %eax,%esi
  803088:	48 bf 37 60 80 00 00 	movabs $0x806037,%rdi
  80308f:	00 00 00 
  803092:	b8 00 00 00 00       	mov    $0x0,%eax
  803097:	48 b9 15 0b 80 00 00 	movabs $0x800b15,%rcx
  80309e:	00 00 00 
  8030a1:	ff d1                	callq  *%rcx
  8030a3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8030a8:	eb 2d                	jmp    8030d7 <read+0xd3>
  8030aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030ae:	48 8b 40 10          	mov    0x10(%rax),%rax
  8030b2:	48 85 c0             	test   %rax,%rax
  8030b5:	75 07                	jne    8030be <read+0xba>
  8030b7:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8030bc:	eb 19                	jmp    8030d7 <read+0xd3>
  8030be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030c2:	48 8b 40 10          	mov    0x10(%rax),%rax
  8030c6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8030ca:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8030ce:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8030d2:	48 89 cf             	mov    %rcx,%rdi
  8030d5:	ff d0                	callq  *%rax
  8030d7:	c9                   	leaveq 
  8030d8:	c3                   	retq   

00000000008030d9 <readn>:
  8030d9:	55                   	push   %rbp
  8030da:	48 89 e5             	mov    %rsp,%rbp
  8030dd:	48 83 ec 30          	sub    $0x30,%rsp
  8030e1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030e4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030e8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8030ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8030f3:	eb 49                	jmp    80313e <readn+0x65>
  8030f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030f8:	48 98                	cltq   
  8030fa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8030fe:	48 29 c2             	sub    %rax,%rdx
  803101:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803104:	48 63 c8             	movslq %eax,%rcx
  803107:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80310b:	48 01 c1             	add    %rax,%rcx
  80310e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803111:	48 89 ce             	mov    %rcx,%rsi
  803114:	89 c7                	mov    %eax,%edi
  803116:	48 b8 04 30 80 00 00 	movabs $0x803004,%rax
  80311d:	00 00 00 
  803120:	ff d0                	callq  *%rax
  803122:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803125:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803129:	79 05                	jns    803130 <readn+0x57>
  80312b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80312e:	eb 1c                	jmp    80314c <readn+0x73>
  803130:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803134:	75 02                	jne    803138 <readn+0x5f>
  803136:	eb 11                	jmp    803149 <readn+0x70>
  803138:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80313b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80313e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803141:	48 98                	cltq   
  803143:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803147:	72 ac                	jb     8030f5 <readn+0x1c>
  803149:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80314c:	c9                   	leaveq 
  80314d:	c3                   	retq   

000000000080314e <write>:
  80314e:	55                   	push   %rbp
  80314f:	48 89 e5             	mov    %rsp,%rbp
  803152:	48 83 ec 40          	sub    $0x40,%rsp
  803156:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803159:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80315d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803161:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803165:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803168:	48 89 d6             	mov    %rdx,%rsi
  80316b:	89 c7                	mov    %eax,%edi
  80316d:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  803174:	00 00 00 
  803177:	ff d0                	callq  *%rax
  803179:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80317c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803180:	78 24                	js     8031a6 <write+0x58>
  803182:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803186:	8b 00                	mov    (%rax),%eax
  803188:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80318c:	48 89 d6             	mov    %rdx,%rsi
  80318f:	89 c7                	mov    %eax,%edi
  803191:	48 b8 2b 2d 80 00 00 	movabs $0x802d2b,%rax
  803198:	00 00 00 
  80319b:	ff d0                	callq  *%rax
  80319d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031a4:	79 05                	jns    8031ab <write+0x5d>
  8031a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a9:	eb 75                	jmp    803220 <write+0xd2>
  8031ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031af:	8b 40 08             	mov    0x8(%rax),%eax
  8031b2:	83 e0 03             	and    $0x3,%eax
  8031b5:	85 c0                	test   %eax,%eax
  8031b7:	75 3a                	jne    8031f3 <write+0xa5>
  8031b9:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8031c0:	00 00 00 
  8031c3:	48 8b 00             	mov    (%rax),%rax
  8031c6:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8031cc:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8031cf:	89 c6                	mov    %eax,%esi
  8031d1:	48 bf 53 60 80 00 00 	movabs $0x806053,%rdi
  8031d8:	00 00 00 
  8031db:	b8 00 00 00 00       	mov    $0x0,%eax
  8031e0:	48 b9 15 0b 80 00 00 	movabs $0x800b15,%rcx
  8031e7:	00 00 00 
  8031ea:	ff d1                	callq  *%rcx
  8031ec:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8031f1:	eb 2d                	jmp    803220 <write+0xd2>
  8031f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031f7:	48 8b 40 18          	mov    0x18(%rax),%rax
  8031fb:	48 85 c0             	test   %rax,%rax
  8031fe:	75 07                	jne    803207 <write+0xb9>
  803200:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803205:	eb 19                	jmp    803220 <write+0xd2>
  803207:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80320b:	48 8b 40 18          	mov    0x18(%rax),%rax
  80320f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803213:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803217:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80321b:	48 89 cf             	mov    %rcx,%rdi
  80321e:	ff d0                	callq  *%rax
  803220:	c9                   	leaveq 
  803221:	c3                   	retq   

0000000000803222 <seek>:
  803222:	55                   	push   %rbp
  803223:	48 89 e5             	mov    %rsp,%rbp
  803226:	48 83 ec 18          	sub    $0x18,%rsp
  80322a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80322d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803230:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803234:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803237:	48 89 d6             	mov    %rdx,%rsi
  80323a:	89 c7                	mov    %eax,%edi
  80323c:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  803243:	00 00 00 
  803246:	ff d0                	callq  *%rax
  803248:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80324b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80324f:	79 05                	jns    803256 <seek+0x34>
  803251:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803254:	eb 0f                	jmp    803265 <seek+0x43>
  803256:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80325a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80325d:	89 50 04             	mov    %edx,0x4(%rax)
  803260:	b8 00 00 00 00       	mov    $0x0,%eax
  803265:	c9                   	leaveq 
  803266:	c3                   	retq   

0000000000803267 <ftruncate>:
  803267:	55                   	push   %rbp
  803268:	48 89 e5             	mov    %rsp,%rbp
  80326b:	48 83 ec 30          	sub    $0x30,%rsp
  80326f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803272:	89 75 d8             	mov    %esi,-0x28(%rbp)
  803275:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803279:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80327c:	48 89 d6             	mov    %rdx,%rsi
  80327f:	89 c7                	mov    %eax,%edi
  803281:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  803288:	00 00 00 
  80328b:	ff d0                	callq  *%rax
  80328d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803290:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803294:	78 24                	js     8032ba <ftruncate+0x53>
  803296:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80329a:	8b 00                	mov    (%rax),%eax
  80329c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8032a0:	48 89 d6             	mov    %rdx,%rsi
  8032a3:	89 c7                	mov    %eax,%edi
  8032a5:	48 b8 2b 2d 80 00 00 	movabs $0x802d2b,%rax
  8032ac:	00 00 00 
  8032af:	ff d0                	callq  *%rax
  8032b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032b4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032b8:	79 05                	jns    8032bf <ftruncate+0x58>
  8032ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032bd:	eb 72                	jmp    803331 <ftruncate+0xca>
  8032bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032c3:	8b 40 08             	mov    0x8(%rax),%eax
  8032c6:	83 e0 03             	and    $0x3,%eax
  8032c9:	85 c0                	test   %eax,%eax
  8032cb:	75 3a                	jne    803307 <ftruncate+0xa0>
  8032cd:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8032d4:	00 00 00 
  8032d7:	48 8b 00             	mov    (%rax),%rax
  8032da:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8032e0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8032e3:	89 c6                	mov    %eax,%esi
  8032e5:	48 bf 70 60 80 00 00 	movabs $0x806070,%rdi
  8032ec:	00 00 00 
  8032ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8032f4:	48 b9 15 0b 80 00 00 	movabs $0x800b15,%rcx
  8032fb:	00 00 00 
  8032fe:	ff d1                	callq  *%rcx
  803300:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803305:	eb 2a                	jmp    803331 <ftruncate+0xca>
  803307:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80330b:	48 8b 40 30          	mov    0x30(%rax),%rax
  80330f:	48 85 c0             	test   %rax,%rax
  803312:	75 07                	jne    80331b <ftruncate+0xb4>
  803314:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803319:	eb 16                	jmp    803331 <ftruncate+0xca>
  80331b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80331f:	48 8b 40 30          	mov    0x30(%rax),%rax
  803323:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803327:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80332a:	89 ce                	mov    %ecx,%esi
  80332c:	48 89 d7             	mov    %rdx,%rdi
  80332f:	ff d0                	callq  *%rax
  803331:	c9                   	leaveq 
  803332:	c3                   	retq   

0000000000803333 <fstat>:
  803333:	55                   	push   %rbp
  803334:	48 89 e5             	mov    %rsp,%rbp
  803337:	48 83 ec 30          	sub    $0x30,%rsp
  80333b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80333e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803342:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803346:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803349:	48 89 d6             	mov    %rdx,%rsi
  80334c:	89 c7                	mov    %eax,%edi
  80334e:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  803355:	00 00 00 
  803358:	ff d0                	callq  *%rax
  80335a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80335d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803361:	78 24                	js     803387 <fstat+0x54>
  803363:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803367:	8b 00                	mov    (%rax),%eax
  803369:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80336d:	48 89 d6             	mov    %rdx,%rsi
  803370:	89 c7                	mov    %eax,%edi
  803372:	48 b8 2b 2d 80 00 00 	movabs $0x802d2b,%rax
  803379:	00 00 00 
  80337c:	ff d0                	callq  *%rax
  80337e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803381:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803385:	79 05                	jns    80338c <fstat+0x59>
  803387:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80338a:	eb 5e                	jmp    8033ea <fstat+0xb7>
  80338c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803390:	48 8b 40 28          	mov    0x28(%rax),%rax
  803394:	48 85 c0             	test   %rax,%rax
  803397:	75 07                	jne    8033a0 <fstat+0x6d>
  803399:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80339e:	eb 4a                	jmp    8033ea <fstat+0xb7>
  8033a0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033a4:	c6 00 00             	movb   $0x0,(%rax)
  8033a7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033ab:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8033b2:	00 00 00 
  8033b5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033b9:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8033c0:	00 00 00 
  8033c3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8033c7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033cb:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8033d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033d6:	48 8b 40 28          	mov    0x28(%rax),%rax
  8033da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8033de:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8033e2:	48 89 ce             	mov    %rcx,%rsi
  8033e5:	48 89 d7             	mov    %rdx,%rdi
  8033e8:	ff d0                	callq  *%rax
  8033ea:	c9                   	leaveq 
  8033eb:	c3                   	retq   

00000000008033ec <stat>:
  8033ec:	55                   	push   %rbp
  8033ed:	48 89 e5             	mov    %rsp,%rbp
  8033f0:	48 83 ec 20          	sub    $0x20,%rsp
  8033f4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033f8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803400:	be 00 00 00 00       	mov    $0x0,%esi
  803405:	48 89 c7             	mov    %rax,%rdi
  803408:	48 b8 da 34 80 00 00 	movabs $0x8034da,%rax
  80340f:	00 00 00 
  803412:	ff d0                	callq  *%rax
  803414:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803417:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80341b:	79 05                	jns    803422 <stat+0x36>
  80341d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803420:	eb 2f                	jmp    803451 <stat+0x65>
  803422:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803426:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803429:	48 89 d6             	mov    %rdx,%rsi
  80342c:	89 c7                	mov    %eax,%edi
  80342e:	48 b8 33 33 80 00 00 	movabs $0x803333,%rax
  803435:	00 00 00 
  803438:	ff d0                	callq  *%rax
  80343a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80343d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803440:	89 c7                	mov    %eax,%edi
  803442:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803449:	00 00 00 
  80344c:	ff d0                	callq  *%rax
  80344e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803451:	c9                   	leaveq 
  803452:	c3                   	retq   

0000000000803453 <fsipc>:
  803453:	55                   	push   %rbp
  803454:	48 89 e5             	mov    %rsp,%rbp
  803457:	48 83 ec 10          	sub    $0x10,%rsp
  80345b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80345e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803462:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803469:	00 00 00 
  80346c:	8b 00                	mov    (%rax),%eax
  80346e:	85 c0                	test   %eax,%eax
  803470:	75 1d                	jne    80348f <fsipc+0x3c>
  803472:	bf 01 00 00 00       	mov    $0x1,%edi
  803477:	48 b8 6a 57 80 00 00 	movabs $0x80576a,%rax
  80347e:	00 00 00 
  803481:	ff d0                	callq  *%rax
  803483:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  80348a:	00 00 00 
  80348d:	89 02                	mov    %eax,(%rdx)
  80348f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803496:	00 00 00 
  803499:	8b 00                	mov    (%rax),%eax
  80349b:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80349e:	b9 07 00 00 00       	mov    $0x7,%ecx
  8034a3:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8034aa:	00 00 00 
  8034ad:	89 c7                	mov    %eax,%edi
  8034af:	48 b8 d4 56 80 00 00 	movabs $0x8056d4,%rax
  8034b6:	00 00 00 
  8034b9:	ff d0                	callq  *%rax
  8034bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034bf:	ba 00 00 00 00       	mov    $0x0,%edx
  8034c4:	48 89 c6             	mov    %rax,%rsi
  8034c7:	bf 00 00 00 00       	mov    $0x0,%edi
  8034cc:	48 b8 13 56 80 00 00 	movabs $0x805613,%rax
  8034d3:	00 00 00 
  8034d6:	ff d0                	callq  *%rax
  8034d8:	c9                   	leaveq 
  8034d9:	c3                   	retq   

00000000008034da <open>:
  8034da:	55                   	push   %rbp
  8034db:	48 89 e5             	mov    %rsp,%rbp
  8034de:	48 83 ec 20          	sub    $0x20,%rsp
  8034e2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034e6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8034e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034ed:	48 89 c7             	mov    %rax,%rdi
  8034f0:	48 b8 5e 16 80 00 00 	movabs $0x80165e,%rax
  8034f7:	00 00 00 
  8034fa:	ff d0                	callq  *%rax
  8034fc:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803501:	7e 0a                	jle    80350d <open+0x33>
  803503:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803508:	e9 a5 00 00 00       	jmpq   8035b2 <open+0xd8>
  80350d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803511:	48 89 c7             	mov    %rax,%rdi
  803514:	48 b8 3a 2b 80 00 00 	movabs $0x802b3a,%rax
  80351b:	00 00 00 
  80351e:	ff d0                	callq  *%rax
  803520:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803523:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803527:	79 08                	jns    803531 <open+0x57>
  803529:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80352c:	e9 81 00 00 00       	jmpq   8035b2 <open+0xd8>
  803531:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803535:	48 89 c6             	mov    %rax,%rsi
  803538:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  80353f:	00 00 00 
  803542:	48 b8 ca 16 80 00 00 	movabs $0x8016ca,%rax
  803549:	00 00 00 
  80354c:	ff d0                	callq  *%rax
  80354e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803555:	00 00 00 
  803558:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80355b:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803561:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803565:	48 89 c6             	mov    %rax,%rsi
  803568:	bf 01 00 00 00       	mov    $0x1,%edi
  80356d:	48 b8 53 34 80 00 00 	movabs $0x803453,%rax
  803574:	00 00 00 
  803577:	ff d0                	callq  *%rax
  803579:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80357c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803580:	79 1d                	jns    80359f <open+0xc5>
  803582:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803586:	be 00 00 00 00       	mov    $0x0,%esi
  80358b:	48 89 c7             	mov    %rax,%rdi
  80358e:	48 b8 62 2c 80 00 00 	movabs $0x802c62,%rax
  803595:	00 00 00 
  803598:	ff d0                	callq  *%rax
  80359a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80359d:	eb 13                	jmp    8035b2 <open+0xd8>
  80359f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035a3:	48 89 c7             	mov    %rax,%rdi
  8035a6:	48 b8 ec 2a 80 00 00 	movabs $0x802aec,%rax
  8035ad:	00 00 00 
  8035b0:	ff d0                	callq  *%rax
  8035b2:	c9                   	leaveq 
  8035b3:	c3                   	retq   

00000000008035b4 <devfile_flush>:
  8035b4:	55                   	push   %rbp
  8035b5:	48 89 e5             	mov    %rsp,%rbp
  8035b8:	48 83 ec 10          	sub    $0x10,%rsp
  8035bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8035c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035c4:	8b 50 0c             	mov    0xc(%rax),%edx
  8035c7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035ce:	00 00 00 
  8035d1:	89 10                	mov    %edx,(%rax)
  8035d3:	be 00 00 00 00       	mov    $0x0,%esi
  8035d8:	bf 06 00 00 00       	mov    $0x6,%edi
  8035dd:	48 b8 53 34 80 00 00 	movabs $0x803453,%rax
  8035e4:	00 00 00 
  8035e7:	ff d0                	callq  *%rax
  8035e9:	c9                   	leaveq 
  8035ea:	c3                   	retq   

00000000008035eb <devfile_read>:
  8035eb:	55                   	push   %rbp
  8035ec:	48 89 e5             	mov    %rsp,%rbp
  8035ef:	48 83 ec 30          	sub    $0x30,%rsp
  8035f3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8035f7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8035fb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8035ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803603:	8b 50 0c             	mov    0xc(%rax),%edx
  803606:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80360d:	00 00 00 
  803610:	89 10                	mov    %edx,(%rax)
  803612:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803619:	00 00 00 
  80361c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803620:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803624:	be 00 00 00 00       	mov    $0x0,%esi
  803629:	bf 03 00 00 00       	mov    $0x3,%edi
  80362e:	48 b8 53 34 80 00 00 	movabs $0x803453,%rax
  803635:	00 00 00 
  803638:	ff d0                	callq  *%rax
  80363a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80363d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803641:	79 08                	jns    80364b <devfile_read+0x60>
  803643:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803646:	e9 a4 00 00 00       	jmpq   8036ef <devfile_read+0x104>
  80364b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80364e:	48 98                	cltq   
  803650:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803654:	76 35                	jbe    80368b <devfile_read+0xa0>
  803656:	48 b9 96 60 80 00 00 	movabs $0x806096,%rcx
  80365d:	00 00 00 
  803660:	48 ba 9d 60 80 00 00 	movabs $0x80609d,%rdx
  803667:	00 00 00 
  80366a:	be 89 00 00 00       	mov    $0x89,%esi
  80366f:	48 bf b2 60 80 00 00 	movabs $0x8060b2,%rdi
  803676:	00 00 00 
  803679:	b8 00 00 00 00       	mov    $0x0,%eax
  80367e:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  803685:	00 00 00 
  803688:	41 ff d0             	callq  *%r8
  80368b:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803692:	7e 35                	jle    8036c9 <devfile_read+0xde>
  803694:	48 b9 c0 60 80 00 00 	movabs $0x8060c0,%rcx
  80369b:	00 00 00 
  80369e:	48 ba 9d 60 80 00 00 	movabs $0x80609d,%rdx
  8036a5:	00 00 00 
  8036a8:	be 8a 00 00 00       	mov    $0x8a,%esi
  8036ad:	48 bf b2 60 80 00 00 	movabs $0x8060b2,%rdi
  8036b4:	00 00 00 
  8036b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8036bc:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  8036c3:	00 00 00 
  8036c6:	41 ff d0             	callq  *%r8
  8036c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036cc:	48 63 d0             	movslq %eax,%rdx
  8036cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036d3:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8036da:	00 00 00 
  8036dd:	48 89 c7             	mov    %rax,%rdi
  8036e0:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  8036e7:	00 00 00 
  8036ea:	ff d0                	callq  *%rax
  8036ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036ef:	c9                   	leaveq 
  8036f0:	c3                   	retq   

00000000008036f1 <devfile_write>:
  8036f1:	55                   	push   %rbp
  8036f2:	48 89 e5             	mov    %rsp,%rbp
  8036f5:	48 83 ec 40          	sub    $0x40,%rsp
  8036f9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8036fd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803701:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803705:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803709:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80370d:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803714:	00 
  803715:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803719:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80371d:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803722:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803726:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80372a:	8b 50 0c             	mov    0xc(%rax),%edx
  80372d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803734:	00 00 00 
  803737:	89 10                	mov    %edx,(%rax)
  803739:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803740:	00 00 00 
  803743:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803747:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80374b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80374f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803753:	48 89 c6             	mov    %rax,%rsi
  803756:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  80375d:	00 00 00 
  803760:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  803767:	00 00 00 
  80376a:	ff d0                	callq  *%rax
  80376c:	be 00 00 00 00       	mov    $0x0,%esi
  803771:	bf 04 00 00 00       	mov    $0x4,%edi
  803776:	48 b8 53 34 80 00 00 	movabs $0x803453,%rax
  80377d:	00 00 00 
  803780:	ff d0                	callq  *%rax
  803782:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803785:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803789:	79 05                	jns    803790 <devfile_write+0x9f>
  80378b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80378e:	eb 43                	jmp    8037d3 <devfile_write+0xe2>
  803790:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803793:	48 98                	cltq   
  803795:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803799:	76 35                	jbe    8037d0 <devfile_write+0xdf>
  80379b:	48 b9 96 60 80 00 00 	movabs $0x806096,%rcx
  8037a2:	00 00 00 
  8037a5:	48 ba 9d 60 80 00 00 	movabs $0x80609d,%rdx
  8037ac:	00 00 00 
  8037af:	be a8 00 00 00       	mov    $0xa8,%esi
  8037b4:	48 bf b2 60 80 00 00 	movabs $0x8060b2,%rdi
  8037bb:	00 00 00 
  8037be:	b8 00 00 00 00       	mov    $0x0,%eax
  8037c3:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  8037ca:	00 00 00 
  8037cd:	41 ff d0             	callq  *%r8
  8037d0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037d3:	c9                   	leaveq 
  8037d4:	c3                   	retq   

00000000008037d5 <devfile_stat>:
  8037d5:	55                   	push   %rbp
  8037d6:	48 89 e5             	mov    %rsp,%rbp
  8037d9:	48 83 ec 20          	sub    $0x20,%rsp
  8037dd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8037e1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037e9:	8b 50 0c             	mov    0xc(%rax),%edx
  8037ec:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037f3:	00 00 00 
  8037f6:	89 10                	mov    %edx,(%rax)
  8037f8:	be 00 00 00 00       	mov    $0x0,%esi
  8037fd:	bf 05 00 00 00       	mov    $0x5,%edi
  803802:	48 b8 53 34 80 00 00 	movabs $0x803453,%rax
  803809:	00 00 00 
  80380c:	ff d0                	callq  *%rax
  80380e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803811:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803815:	79 05                	jns    80381c <devfile_stat+0x47>
  803817:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80381a:	eb 56                	jmp    803872 <devfile_stat+0x9d>
  80381c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803820:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803827:	00 00 00 
  80382a:	48 89 c7             	mov    %rax,%rdi
  80382d:	48 b8 ca 16 80 00 00 	movabs $0x8016ca,%rax
  803834:	00 00 00 
  803837:	ff d0                	callq  *%rax
  803839:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803840:	00 00 00 
  803843:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803849:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80384d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803853:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80385a:	00 00 00 
  80385d:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803863:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803867:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  80386d:	b8 00 00 00 00       	mov    $0x0,%eax
  803872:	c9                   	leaveq 
  803873:	c3                   	retq   

0000000000803874 <devfile_trunc>:
  803874:	55                   	push   %rbp
  803875:	48 89 e5             	mov    %rsp,%rbp
  803878:	48 83 ec 10          	sub    $0x10,%rsp
  80387c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803880:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803883:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803887:	8b 50 0c             	mov    0xc(%rax),%edx
  80388a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803891:	00 00 00 
  803894:	89 10                	mov    %edx,(%rax)
  803896:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80389d:	00 00 00 
  8038a0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8038a3:	89 50 04             	mov    %edx,0x4(%rax)
  8038a6:	be 00 00 00 00       	mov    $0x0,%esi
  8038ab:	bf 02 00 00 00       	mov    $0x2,%edi
  8038b0:	48 b8 53 34 80 00 00 	movabs $0x803453,%rax
  8038b7:	00 00 00 
  8038ba:	ff d0                	callq  *%rax
  8038bc:	c9                   	leaveq 
  8038bd:	c3                   	retq   

00000000008038be <remove>:
  8038be:	55                   	push   %rbp
  8038bf:	48 89 e5             	mov    %rsp,%rbp
  8038c2:	48 83 ec 10          	sub    $0x10,%rsp
  8038c6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038ce:	48 89 c7             	mov    %rax,%rdi
  8038d1:	48 b8 5e 16 80 00 00 	movabs $0x80165e,%rax
  8038d8:	00 00 00 
  8038db:	ff d0                	callq  *%rax
  8038dd:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8038e2:	7e 07                	jle    8038eb <remove+0x2d>
  8038e4:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8038e9:	eb 33                	jmp    80391e <remove+0x60>
  8038eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038ef:	48 89 c6             	mov    %rax,%rsi
  8038f2:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  8038f9:	00 00 00 
  8038fc:	48 b8 ca 16 80 00 00 	movabs $0x8016ca,%rax
  803903:	00 00 00 
  803906:	ff d0                	callq  *%rax
  803908:	be 00 00 00 00       	mov    $0x0,%esi
  80390d:	bf 07 00 00 00       	mov    $0x7,%edi
  803912:	48 b8 53 34 80 00 00 	movabs $0x803453,%rax
  803919:	00 00 00 
  80391c:	ff d0                	callq  *%rax
  80391e:	c9                   	leaveq 
  80391f:	c3                   	retq   

0000000000803920 <sync>:
  803920:	55                   	push   %rbp
  803921:	48 89 e5             	mov    %rsp,%rbp
  803924:	be 00 00 00 00       	mov    $0x0,%esi
  803929:	bf 08 00 00 00       	mov    $0x8,%edi
  80392e:	48 b8 53 34 80 00 00 	movabs $0x803453,%rax
  803935:	00 00 00 
  803938:	ff d0                	callq  *%rax
  80393a:	5d                   	pop    %rbp
  80393b:	c3                   	retq   

000000000080393c <copy>:
  80393c:	55                   	push   %rbp
  80393d:	48 89 e5             	mov    %rsp,%rbp
  803940:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803947:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  80394e:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803955:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  80395c:	be 00 00 00 00       	mov    $0x0,%esi
  803961:	48 89 c7             	mov    %rax,%rdi
  803964:	48 b8 da 34 80 00 00 	movabs $0x8034da,%rax
  80396b:	00 00 00 
  80396e:	ff d0                	callq  *%rax
  803970:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803973:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803977:	79 28                	jns    8039a1 <copy+0x65>
  803979:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80397c:	89 c6                	mov    %eax,%esi
  80397e:	48 bf cc 60 80 00 00 	movabs $0x8060cc,%rdi
  803985:	00 00 00 
  803988:	b8 00 00 00 00       	mov    $0x0,%eax
  80398d:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  803994:	00 00 00 
  803997:	ff d2                	callq  *%rdx
  803999:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80399c:	e9 74 01 00 00       	jmpq   803b15 <copy+0x1d9>
  8039a1:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8039a8:	be 01 01 00 00       	mov    $0x101,%esi
  8039ad:	48 89 c7             	mov    %rax,%rdi
  8039b0:	48 b8 da 34 80 00 00 	movabs $0x8034da,%rax
  8039b7:	00 00 00 
  8039ba:	ff d0                	callq  *%rax
  8039bc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8039bf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8039c3:	79 39                	jns    8039fe <copy+0xc2>
  8039c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039c8:	89 c6                	mov    %eax,%esi
  8039ca:	48 bf e2 60 80 00 00 	movabs $0x8060e2,%rdi
  8039d1:	00 00 00 
  8039d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8039d9:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  8039e0:	00 00 00 
  8039e3:	ff d2                	callq  *%rdx
  8039e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039e8:	89 c7                	mov    %eax,%edi
  8039ea:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  8039f1:	00 00 00 
  8039f4:	ff d0                	callq  *%rax
  8039f6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039f9:	e9 17 01 00 00       	jmpq   803b15 <copy+0x1d9>
  8039fe:	eb 74                	jmp    803a74 <copy+0x138>
  803a00:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803a03:	48 63 d0             	movslq %eax,%rdx
  803a06:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803a0d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a10:	48 89 ce             	mov    %rcx,%rsi
  803a13:	89 c7                	mov    %eax,%edi
  803a15:	48 b8 4e 31 80 00 00 	movabs $0x80314e,%rax
  803a1c:	00 00 00 
  803a1f:	ff d0                	callq  *%rax
  803a21:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803a24:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803a28:	79 4a                	jns    803a74 <copy+0x138>
  803a2a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803a2d:	89 c6                	mov    %eax,%esi
  803a2f:	48 bf fc 60 80 00 00 	movabs $0x8060fc,%rdi
  803a36:	00 00 00 
  803a39:	b8 00 00 00 00       	mov    $0x0,%eax
  803a3e:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  803a45:	00 00 00 
  803a48:	ff d2                	callq  *%rdx
  803a4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a4d:	89 c7                	mov    %eax,%edi
  803a4f:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803a56:	00 00 00 
  803a59:	ff d0                	callq  *%rax
  803a5b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a5e:	89 c7                	mov    %eax,%edi
  803a60:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803a67:	00 00 00 
  803a6a:	ff d0                	callq  *%rax
  803a6c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803a6f:	e9 a1 00 00 00       	jmpq   803b15 <copy+0x1d9>
  803a74:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803a7b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a7e:	ba 00 02 00 00       	mov    $0x200,%edx
  803a83:	48 89 ce             	mov    %rcx,%rsi
  803a86:	89 c7                	mov    %eax,%edi
  803a88:	48 b8 04 30 80 00 00 	movabs $0x803004,%rax
  803a8f:	00 00 00 
  803a92:	ff d0                	callq  *%rax
  803a94:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803a97:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803a9b:	0f 8f 5f ff ff ff    	jg     803a00 <copy+0xc4>
  803aa1:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803aa5:	79 47                	jns    803aee <copy+0x1b2>
  803aa7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803aaa:	89 c6                	mov    %eax,%esi
  803aac:	48 bf 0f 61 80 00 00 	movabs $0x80610f,%rdi
  803ab3:	00 00 00 
  803ab6:	b8 00 00 00 00       	mov    $0x0,%eax
  803abb:	48 ba 15 0b 80 00 00 	movabs $0x800b15,%rdx
  803ac2:	00 00 00 
  803ac5:	ff d2                	callq  *%rdx
  803ac7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aca:	89 c7                	mov    %eax,%edi
  803acc:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803ad3:	00 00 00 
  803ad6:	ff d0                	callq  *%rax
  803ad8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803adb:	89 c7                	mov    %eax,%edi
  803add:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803ae4:	00 00 00 
  803ae7:	ff d0                	callq  *%rax
  803ae9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803aec:	eb 27                	jmp    803b15 <copy+0x1d9>
  803aee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803af1:	89 c7                	mov    %eax,%edi
  803af3:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803afa:	00 00 00 
  803afd:	ff d0                	callq  *%rax
  803aff:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803b02:	89 c7                	mov    %eax,%edi
  803b04:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803b0b:	00 00 00 
  803b0e:	ff d0                	callq  *%rax
  803b10:	b8 00 00 00 00       	mov    $0x0,%eax
  803b15:	c9                   	leaveq 
  803b16:	c3                   	retq   

0000000000803b17 <spawn>:
  803b17:	55                   	push   %rbp
  803b18:	48 89 e5             	mov    %rsp,%rbp
  803b1b:	48 81 ec 10 03 00 00 	sub    $0x310,%rsp
  803b22:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  803b29:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  803b30:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  803b37:	be 00 00 00 00       	mov    $0x0,%esi
  803b3c:	48 89 c7             	mov    %rax,%rdi
  803b3f:	48 b8 da 34 80 00 00 	movabs $0x8034da,%rax
  803b46:	00 00 00 
  803b49:	ff d0                	callq  *%rax
  803b4b:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803b4e:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803b52:	79 08                	jns    803b5c <spawn+0x45>
  803b54:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803b57:	e9 0c 03 00 00       	jmpq   803e68 <spawn+0x351>
  803b5c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803b5f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803b62:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  803b69:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803b6d:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  803b74:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803b77:	ba 00 02 00 00       	mov    $0x200,%edx
  803b7c:	48 89 ce             	mov    %rcx,%rsi
  803b7f:	89 c7                	mov    %eax,%edi
  803b81:	48 b8 d9 30 80 00 00 	movabs $0x8030d9,%rax
  803b88:	00 00 00 
  803b8b:	ff d0                	callq  *%rax
  803b8d:	3d 00 02 00 00       	cmp    $0x200,%eax
  803b92:	75 0d                	jne    803ba1 <spawn+0x8a>
  803b94:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b98:	8b 00                	mov    (%rax),%eax
  803b9a:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  803b9f:	74 43                	je     803be4 <spawn+0xcd>
  803ba1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803ba4:	89 c7                	mov    %eax,%edi
  803ba6:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803bad:	00 00 00 
  803bb0:	ff d0                	callq  *%rax
  803bb2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bb6:	8b 00                	mov    (%rax),%eax
  803bb8:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  803bbd:	89 c6                	mov    %eax,%esi
  803bbf:	48 bf 28 61 80 00 00 	movabs $0x806128,%rdi
  803bc6:	00 00 00 
  803bc9:	b8 00 00 00 00       	mov    $0x0,%eax
  803bce:	48 b9 15 0b 80 00 00 	movabs $0x800b15,%rcx
  803bd5:	00 00 00 
  803bd8:	ff d1                	callq  *%rcx
  803bda:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  803bdf:	e9 84 02 00 00       	jmpq   803e68 <spawn+0x351>
  803be4:	b8 07 00 00 00       	mov    $0x7,%eax
  803be9:	cd 30                	int    $0x30
  803beb:	89 45 d0             	mov    %eax,-0x30(%rbp)
  803bee:	8b 45 d0             	mov    -0x30(%rbp),%eax
  803bf1:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803bf4:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803bf8:	79 08                	jns    803c02 <spawn+0xeb>
  803bfa:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803bfd:	e9 66 02 00 00       	jmpq   803e68 <spawn+0x351>
  803c02:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803c05:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  803c08:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803c0b:	25 ff 03 00 00       	and    $0x3ff,%eax
  803c10:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803c17:	00 00 00 
  803c1a:	48 98                	cltq   
  803c1c:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803c23:	48 01 d0             	add    %rdx,%rax
  803c26:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  803c2d:	48 89 c6             	mov    %rax,%rsi
  803c30:	b8 18 00 00 00       	mov    $0x18,%eax
  803c35:	48 89 d7             	mov    %rdx,%rdi
  803c38:	48 89 c1             	mov    %rax,%rcx
  803c3b:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  803c3e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c42:	48 8b 40 18          	mov    0x18(%rax),%rax
  803c46:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  803c4d:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  803c54:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  803c5b:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  803c62:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803c65:	48 89 ce             	mov    %rcx,%rsi
  803c68:	89 c7                	mov    %eax,%edi
  803c6a:	48 b8 d2 40 80 00 00 	movabs $0x8040d2,%rax
  803c71:	00 00 00 
  803c74:	ff d0                	callq  *%rax
  803c76:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803c79:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803c7d:	79 08                	jns    803c87 <spawn+0x170>
  803c7f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803c82:	e9 e1 01 00 00       	jmpq   803e68 <spawn+0x351>
  803c87:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c8b:	48 8b 40 20          	mov    0x20(%rax),%rax
  803c8f:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  803c96:	48 01 d0             	add    %rdx,%rax
  803c99:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c9d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ca4:	e9 a3 00 00 00       	jmpq   803d4c <spawn+0x235>
  803ca9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cad:	8b 00                	mov    (%rax),%eax
  803caf:	83 f8 01             	cmp    $0x1,%eax
  803cb2:	74 05                	je     803cb9 <spawn+0x1a2>
  803cb4:	e9 8a 00 00 00       	jmpq   803d43 <spawn+0x22c>
  803cb9:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  803cc0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cc4:	8b 40 04             	mov    0x4(%rax),%eax
  803cc7:	83 e0 02             	and    $0x2,%eax
  803cca:	85 c0                	test   %eax,%eax
  803ccc:	74 04                	je     803cd2 <spawn+0x1bb>
  803cce:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  803cd2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd6:	48 8b 40 08          	mov    0x8(%rax),%rax
  803cda:	41 89 c1             	mov    %eax,%r9d
  803cdd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ce1:	4c 8b 40 20          	mov    0x20(%rax),%r8
  803ce5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ce9:	48 8b 50 28          	mov    0x28(%rax),%rdx
  803ced:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cf1:	48 8b 70 10          	mov    0x10(%rax),%rsi
  803cf5:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803cf8:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803cfb:	8b 7d ec             	mov    -0x14(%rbp),%edi
  803cfe:	89 3c 24             	mov    %edi,(%rsp)
  803d01:	89 c7                	mov    %eax,%edi
  803d03:	48 b8 7b 43 80 00 00 	movabs $0x80437b,%rax
  803d0a:	00 00 00 
  803d0d:	ff d0                	callq  *%rax
  803d0f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803d12:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803d16:	79 2b                	jns    803d43 <spawn+0x22c>
  803d18:	90                   	nop
  803d19:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803d1c:	89 c7                	mov    %eax,%edi
  803d1e:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  803d25:	00 00 00 
  803d28:	ff d0                	callq  *%rax
  803d2a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803d2d:	89 c7                	mov    %eax,%edi
  803d2f:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803d36:	00 00 00 
  803d39:	ff d0                	callq  *%rax
  803d3b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803d3e:	e9 25 01 00 00       	jmpq   803e68 <spawn+0x351>
  803d43:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803d47:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  803d4c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d50:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  803d54:	0f b7 c0             	movzwl %ax,%eax
  803d57:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  803d5a:	0f 8f 49 ff ff ff    	jg     803ca9 <spawn+0x192>
  803d60:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803d63:	89 c7                	mov    %eax,%edi
  803d65:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  803d6c:	00 00 00 
  803d6f:	ff d0                	callq  *%rax
  803d71:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  803d78:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803d7b:	89 c7                	mov    %eax,%edi
  803d7d:	48 b8 67 45 80 00 00 	movabs $0x804567,%rax
  803d84:	00 00 00 
  803d87:	ff d0                	callq  *%rax
  803d89:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803d8c:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803d90:	79 30                	jns    803dc2 <spawn+0x2ab>
  803d92:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803d95:	89 c1                	mov    %eax,%ecx
  803d97:	48 ba 42 61 80 00 00 	movabs $0x806142,%rdx
  803d9e:	00 00 00 
  803da1:	be 86 00 00 00       	mov    $0x86,%esi
  803da6:	48 bf 58 61 80 00 00 	movabs $0x806158,%rdi
  803dad:	00 00 00 
  803db0:	b8 00 00 00 00       	mov    $0x0,%eax
  803db5:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  803dbc:	00 00 00 
  803dbf:	41 ff d0             	callq  *%r8
  803dc2:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  803dc9:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803dcc:	48 89 d6             	mov    %rdx,%rsi
  803dcf:	89 c7                	mov    %eax,%edi
  803dd1:	48 b8 39 21 80 00 00 	movabs $0x802139,%rax
  803dd8:	00 00 00 
  803ddb:	ff d0                	callq  *%rax
  803ddd:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803de0:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803de4:	79 30                	jns    803e16 <spawn+0x2ff>
  803de6:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803de9:	89 c1                	mov    %eax,%ecx
  803deb:	48 ba 67 61 80 00 00 	movabs $0x806167,%rdx
  803df2:	00 00 00 
  803df5:	be 8a 00 00 00       	mov    $0x8a,%esi
  803dfa:	48 bf 58 61 80 00 00 	movabs $0x806158,%rdi
  803e01:	00 00 00 
  803e04:	b8 00 00 00 00       	mov    $0x0,%eax
  803e09:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  803e10:	00 00 00 
  803e13:	41 ff d0             	callq  *%r8
  803e16:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803e19:	be 02 00 00 00       	mov    $0x2,%esi
  803e1e:	89 c7                	mov    %eax,%edi
  803e20:	48 b8 ee 20 80 00 00 	movabs $0x8020ee,%rax
  803e27:	00 00 00 
  803e2a:	ff d0                	callq  *%rax
  803e2c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803e2f:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803e33:	79 30                	jns    803e65 <spawn+0x34e>
  803e35:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803e38:	89 c1                	mov    %eax,%ecx
  803e3a:	48 ba 81 61 80 00 00 	movabs $0x806181,%rdx
  803e41:	00 00 00 
  803e44:	be 8d 00 00 00       	mov    $0x8d,%esi
  803e49:	48 bf 58 61 80 00 00 	movabs $0x806158,%rdi
  803e50:	00 00 00 
  803e53:	b8 00 00 00 00       	mov    $0x0,%eax
  803e58:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  803e5f:	00 00 00 
  803e62:	41 ff d0             	callq  *%r8
  803e65:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803e68:	c9                   	leaveq 
  803e69:	c3                   	retq   

0000000000803e6a <spawnl>:
  803e6a:	55                   	push   %rbp
  803e6b:	48 89 e5             	mov    %rsp,%rbp
  803e6e:	41 55                	push   %r13
  803e70:	41 54                	push   %r12
  803e72:	53                   	push   %rbx
  803e73:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803e7a:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  803e81:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  803e88:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  803e8f:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  803e96:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  803e9d:	84 c0                	test   %al,%al
  803e9f:	74 26                	je     803ec7 <spawnl+0x5d>
  803ea1:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  803ea8:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  803eaf:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  803eb3:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  803eb7:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  803ebb:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  803ebf:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  803ec3:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  803ec7:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  803ece:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  803ed5:	00 00 00 
  803ed8:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803edf:	00 00 00 
  803ee2:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803ee9:	00 00 00 
  803eec:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803ef0:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803ef7:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803efe:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  803f05:	eb 07                	jmp    803f0e <spawnl+0xa4>
  803f07:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  803f0e:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803f14:	83 f8 30             	cmp    $0x30,%eax
  803f17:	73 23                	jae    803f3c <spawnl+0xd2>
  803f19:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  803f20:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803f26:	89 c0                	mov    %eax,%eax
  803f28:	48 01 d0             	add    %rdx,%rax
  803f2b:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803f31:	83 c2 08             	add    $0x8,%edx
  803f34:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  803f3a:	eb 15                	jmp    803f51 <spawnl+0xe7>
  803f3c:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  803f43:	48 89 d0             	mov    %rdx,%rax
  803f46:	48 83 c2 08          	add    $0x8,%rdx
  803f4a:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803f51:	48 8b 00             	mov    (%rax),%rax
  803f54:	48 85 c0             	test   %rax,%rax
  803f57:	75 ae                	jne    803f07 <spawnl+0x9d>
  803f59:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803f5f:	83 c0 02             	add    $0x2,%eax
  803f62:	48 89 e2             	mov    %rsp,%rdx
  803f65:	48 89 d3             	mov    %rdx,%rbx
  803f68:	48 63 d0             	movslq %eax,%rdx
  803f6b:	48 83 ea 01          	sub    $0x1,%rdx
  803f6f:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  803f76:	48 63 d0             	movslq %eax,%rdx
  803f79:	49 89 d4             	mov    %rdx,%r12
  803f7c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  803f82:	48 63 d0             	movslq %eax,%rdx
  803f85:	49 89 d2             	mov    %rdx,%r10
  803f88:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  803f8e:	48 98                	cltq   
  803f90:	48 c1 e0 03          	shl    $0x3,%rax
  803f94:	48 8d 50 07          	lea    0x7(%rax),%rdx
  803f98:	b8 10 00 00 00       	mov    $0x10,%eax
  803f9d:	48 83 e8 01          	sub    $0x1,%rax
  803fa1:	48 01 d0             	add    %rdx,%rax
  803fa4:	bf 10 00 00 00       	mov    $0x10,%edi
  803fa9:	ba 00 00 00 00       	mov    $0x0,%edx
  803fae:	48 f7 f7             	div    %rdi
  803fb1:	48 6b c0 10          	imul   $0x10,%rax,%rax
  803fb5:	48 29 c4             	sub    %rax,%rsp
  803fb8:	48 89 e0             	mov    %rsp,%rax
  803fbb:	48 83 c0 07          	add    $0x7,%rax
  803fbf:	48 c1 e8 03          	shr    $0x3,%rax
  803fc3:	48 c1 e0 03          	shl    $0x3,%rax
  803fc7:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  803fce:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803fd5:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  803fdc:	48 89 10             	mov    %rdx,(%rax)
  803fdf:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803fe5:	8d 50 01             	lea    0x1(%rax),%edx
  803fe8:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803fef:	48 63 d2             	movslq %edx,%rdx
  803ff2:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  803ff9:	00 
  803ffa:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  804001:	00 00 00 
  804004:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  80400b:	00 00 00 
  80400e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804012:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  804019:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  804020:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  804027:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  80402e:	00 00 00 
  804031:	eb 63                	jmp    804096 <spawnl+0x22c>
  804033:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  804039:	8d 70 01             	lea    0x1(%rax),%esi
  80403c:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  804042:	83 f8 30             	cmp    $0x30,%eax
  804045:	73 23                	jae    80406a <spawnl+0x200>
  804047:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  80404e:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  804054:	89 c0                	mov    %eax,%eax
  804056:	48 01 d0             	add    %rdx,%rax
  804059:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  80405f:	83 c2 08             	add    $0x8,%edx
  804062:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  804068:	eb 15                	jmp    80407f <spawnl+0x215>
  80406a:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  804071:	48 89 d0             	mov    %rdx,%rax
  804074:	48 83 c2 08          	add    $0x8,%rdx
  804078:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80407f:	48 8b 08             	mov    (%rax),%rcx
  804082:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  804089:	89 f2                	mov    %esi,%edx
  80408b:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
  80408f:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  804096:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  80409c:	3b 85 28 ff ff ff    	cmp    -0xd8(%rbp),%eax
  8040a2:	77 8f                	ja     804033 <spawnl+0x1c9>
  8040a4:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8040ab:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  8040b2:	48 89 d6             	mov    %rdx,%rsi
  8040b5:	48 89 c7             	mov    %rax,%rdi
  8040b8:	48 b8 17 3b 80 00 00 	movabs $0x803b17,%rax
  8040bf:	00 00 00 
  8040c2:	ff d0                	callq  *%rax
  8040c4:	48 89 dc             	mov    %rbx,%rsp
  8040c7:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  8040cb:	5b                   	pop    %rbx
  8040cc:	41 5c                	pop    %r12
  8040ce:	41 5d                	pop    %r13
  8040d0:	5d                   	pop    %rbp
  8040d1:	c3                   	retq   

00000000008040d2 <init_stack>:
  8040d2:	55                   	push   %rbp
  8040d3:	48 89 e5             	mov    %rsp,%rbp
  8040d6:	48 83 ec 50          	sub    $0x50,%rsp
  8040da:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8040dd:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  8040e1:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8040e5:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8040ec:	00 
  8040ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  8040f4:	eb 33                	jmp    804129 <init_stack+0x57>
  8040f6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8040f9:	48 98                	cltq   
  8040fb:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  804102:	00 
  804103:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  804107:	48 01 d0             	add    %rdx,%rax
  80410a:	48 8b 00             	mov    (%rax),%rax
  80410d:	48 89 c7             	mov    %rax,%rdi
  804110:	48 b8 5e 16 80 00 00 	movabs $0x80165e,%rax
  804117:	00 00 00 
  80411a:	ff d0                	callq  *%rax
  80411c:	83 c0 01             	add    $0x1,%eax
  80411f:	48 98                	cltq   
  804121:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  804125:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  804129:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80412c:	48 98                	cltq   
  80412e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  804135:	00 
  804136:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80413a:	48 01 d0             	add    %rdx,%rax
  80413d:	48 8b 00             	mov    (%rax),%rax
  804140:	48 85 c0             	test   %rax,%rax
  804143:	75 b1                	jne    8040f6 <init_stack+0x24>
  804145:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804149:	48 f7 d8             	neg    %rax
  80414c:	48 05 00 10 40 00    	add    $0x401000,%rax
  804152:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804156:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80415a:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  80415e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804162:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  804166:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804169:	83 c2 01             	add    $0x1,%edx
  80416c:	c1 e2 03             	shl    $0x3,%edx
  80416f:	48 63 d2             	movslq %edx,%rdx
  804172:	48 f7 da             	neg    %rdx
  804175:	48 01 d0             	add    %rdx,%rax
  804178:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80417c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804180:	48 83 e8 10          	sub    $0x10,%rax
  804184:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  80418a:	77 0a                	ja     804196 <init_stack+0xc4>
  80418c:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  804191:	e9 e3 01 00 00       	jmpq   804379 <init_stack+0x2a7>
  804196:	ba 07 00 00 00       	mov    $0x7,%edx
  80419b:	be 00 00 40 00       	mov    $0x400000,%esi
  8041a0:	bf 00 00 00 00       	mov    $0x0,%edi
  8041a5:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  8041ac:	00 00 00 
  8041af:	ff d0                	callq  *%rax
  8041b1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041b8:	79 08                	jns    8041c2 <init_stack+0xf0>
  8041ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041bd:	e9 b7 01 00 00       	jmpq   804379 <init_stack+0x2a7>
  8041c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  8041c9:	e9 8a 00 00 00       	jmpq   804258 <init_stack+0x186>
  8041ce:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8041d1:	48 98                	cltq   
  8041d3:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8041da:	00 
  8041db:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041df:	48 01 c2             	add    %rax,%rdx
  8041e2:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8041e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041eb:	48 01 c8             	add    %rcx,%rax
  8041ee:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  8041f4:	48 89 02             	mov    %rax,(%rdx)
  8041f7:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8041fa:	48 98                	cltq   
  8041fc:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  804203:	00 
  804204:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  804208:	48 01 d0             	add    %rdx,%rax
  80420b:	48 8b 10             	mov    (%rax),%rdx
  80420e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804212:	48 89 d6             	mov    %rdx,%rsi
  804215:	48 89 c7             	mov    %rax,%rdi
  804218:	48 b8 ca 16 80 00 00 	movabs $0x8016ca,%rax
  80421f:	00 00 00 
  804222:	ff d0                	callq  *%rax
  804224:	8b 45 f0             	mov    -0x10(%rbp),%eax
  804227:	48 98                	cltq   
  804229:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  804230:	00 
  804231:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  804235:	48 01 d0             	add    %rdx,%rax
  804238:	48 8b 00             	mov    (%rax),%rax
  80423b:	48 89 c7             	mov    %rax,%rdi
  80423e:	48 b8 5e 16 80 00 00 	movabs $0x80165e,%rax
  804245:	00 00 00 
  804248:	ff d0                	callq  *%rax
  80424a:	48 98                	cltq   
  80424c:	48 83 c0 01          	add    $0x1,%rax
  804250:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  804254:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  804258:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80425b:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80425e:	0f 8c 6a ff ff ff    	jl     8041ce <init_stack+0xfc>
  804264:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804267:	48 98                	cltq   
  804269:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  804270:	00 
  804271:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804275:	48 01 d0             	add    %rdx,%rax
  804278:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80427f:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  804286:	00 
  804287:	74 35                	je     8042be <init_stack+0x1ec>
  804289:	48 b9 98 61 80 00 00 	movabs $0x806198,%rcx
  804290:	00 00 00 
  804293:	48 ba be 61 80 00 00 	movabs $0x8061be,%rdx
  80429a:	00 00 00 
  80429d:	be f6 00 00 00       	mov    $0xf6,%esi
  8042a2:	48 bf 58 61 80 00 00 	movabs $0x806158,%rdi
  8042a9:	00 00 00 
  8042ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8042b1:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  8042b8:	00 00 00 
  8042bb:	41 ff d0             	callq  *%r8
  8042be:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042c2:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  8042c6:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8042cb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042cf:	48 01 c8             	add    %rcx,%rax
  8042d2:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  8042d8:	48 89 02             	mov    %rax,(%rdx)
  8042db:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042df:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  8042e3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8042e6:	48 98                	cltq   
  8042e8:	48 89 02             	mov    %rax,(%rdx)
  8042eb:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  8042f0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042f4:	48 01 d0             	add    %rdx,%rax
  8042f7:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  8042fd:	48 89 c2             	mov    %rax,%rdx
  804300:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  804304:	48 89 10             	mov    %rdx,(%rax)
  804307:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80430a:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  804310:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  804315:	89 c2                	mov    %eax,%edx
  804317:	be 00 00 40 00       	mov    $0x400000,%esi
  80431c:	bf 00 00 00 00       	mov    $0x0,%edi
  804321:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  804328:	00 00 00 
  80432b:	ff d0                	callq  *%rax
  80432d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804330:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804334:	79 02                	jns    804338 <init_stack+0x266>
  804336:	eb 28                	jmp    804360 <init_stack+0x28e>
  804338:	be 00 00 40 00       	mov    $0x400000,%esi
  80433d:	bf 00 00 00 00       	mov    $0x0,%edi
  804342:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  804349:	00 00 00 
  80434c:	ff d0                	callq  *%rax
  80434e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804351:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804355:	79 02                	jns    804359 <init_stack+0x287>
  804357:	eb 07                	jmp    804360 <init_stack+0x28e>
  804359:	b8 00 00 00 00       	mov    $0x0,%eax
  80435e:	eb 19                	jmp    804379 <init_stack+0x2a7>
  804360:	be 00 00 40 00       	mov    $0x400000,%esi
  804365:	bf 00 00 00 00       	mov    $0x0,%edi
  80436a:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  804371:	00 00 00 
  804374:	ff d0                	callq  *%rax
  804376:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804379:	c9                   	leaveq 
  80437a:	c3                   	retq   

000000000080437b <map_segment>:
  80437b:	55                   	push   %rbp
  80437c:	48 89 e5             	mov    %rsp,%rbp
  80437f:	48 83 ec 50          	sub    $0x50,%rsp
  804383:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804386:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80438a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80438e:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  804391:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  804395:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  804399:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80439d:	25 ff 0f 00 00       	and    $0xfff,%eax
  8043a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043a9:	74 21                	je     8043cc <map_segment+0x51>
  8043ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043ae:	48 98                	cltq   
  8043b0:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  8043b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043b7:	48 98                	cltq   
  8043b9:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  8043bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043c0:	48 98                	cltq   
  8043c2:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  8043c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043c9:	29 45 bc             	sub    %eax,-0x44(%rbp)
  8043cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8043d3:	e9 79 01 00 00       	jmpq   804551 <map_segment+0x1d6>
  8043d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043db:	48 98                	cltq   
  8043dd:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  8043e1:	72 3c                	jb     80441f <map_segment+0xa4>
  8043e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043e6:	48 63 d0             	movslq %eax,%rdx
  8043e9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043ed:	48 01 d0             	add    %rdx,%rax
  8043f0:	48 89 c1             	mov    %rax,%rcx
  8043f3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8043f6:	8b 55 10             	mov    0x10(%rbp),%edx
  8043f9:	48 89 ce             	mov    %rcx,%rsi
  8043fc:	89 c7                	mov    %eax,%edi
  8043fe:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  804405:	00 00 00 
  804408:	ff d0                	callq  *%rax
  80440a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80440d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  804411:	0f 89 33 01 00 00    	jns    80454a <map_segment+0x1cf>
  804417:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80441a:	e9 46 01 00 00       	jmpq   804565 <map_segment+0x1ea>
  80441f:	ba 07 00 00 00       	mov    $0x7,%edx
  804424:	be 00 00 40 00       	mov    $0x400000,%esi
  804429:	bf 00 00 00 00       	mov    $0x0,%edi
  80442e:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  804435:	00 00 00 
  804438:	ff d0                	callq  *%rax
  80443a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80443d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  804441:	79 08                	jns    80444b <map_segment+0xd0>
  804443:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804446:	e9 1a 01 00 00       	jmpq   804565 <map_segment+0x1ea>
  80444b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80444e:	8b 55 bc             	mov    -0x44(%rbp),%edx
  804451:	01 c2                	add    %eax,%edx
  804453:	8b 45 d8             	mov    -0x28(%rbp),%eax
  804456:	89 d6                	mov    %edx,%esi
  804458:	89 c7                	mov    %eax,%edi
  80445a:	48 b8 22 32 80 00 00 	movabs $0x803222,%rax
  804461:	00 00 00 
  804464:	ff d0                	callq  *%rax
  804466:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804469:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80446d:	79 08                	jns    804477 <map_segment+0xfc>
  80446f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804472:	e9 ee 00 00 00       	jmpq   804565 <map_segment+0x1ea>
  804477:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  80447e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804481:	48 98                	cltq   
  804483:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  804487:	48 29 c2             	sub    %rax,%rdx
  80448a:	48 89 d0             	mov    %rdx,%rax
  80448d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804491:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804494:	48 63 d0             	movslq %eax,%rdx
  804497:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80449b:	48 39 c2             	cmp    %rax,%rdx
  80449e:	48 0f 47 d0          	cmova  %rax,%rdx
  8044a2:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8044a5:	be 00 00 40 00       	mov    $0x400000,%esi
  8044aa:	89 c7                	mov    %eax,%edi
  8044ac:	48 b8 d9 30 80 00 00 	movabs $0x8030d9,%rax
  8044b3:	00 00 00 
  8044b6:	ff d0                	callq  *%rax
  8044b8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8044bb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8044bf:	79 08                	jns    8044c9 <map_segment+0x14e>
  8044c1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8044c4:	e9 9c 00 00 00       	jmpq   804565 <map_segment+0x1ea>
  8044c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044cc:	48 63 d0             	movslq %eax,%rdx
  8044cf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044d3:	48 01 d0             	add    %rdx,%rax
  8044d6:	48 89 c2             	mov    %rax,%rdx
  8044d9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8044dc:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  8044e0:	48 89 d1             	mov    %rdx,%rcx
  8044e3:	89 c2                	mov    %eax,%edx
  8044e5:	be 00 00 40 00       	mov    $0x400000,%esi
  8044ea:	bf 00 00 00 00       	mov    $0x0,%edi
  8044ef:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  8044f6:	00 00 00 
  8044f9:	ff d0                	callq  *%rax
  8044fb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8044fe:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  804502:	79 30                	jns    804534 <map_segment+0x1b9>
  804504:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804507:	89 c1                	mov    %eax,%ecx
  804509:	48 ba d3 61 80 00 00 	movabs $0x8061d3,%rdx
  804510:	00 00 00 
  804513:	be 29 01 00 00       	mov    $0x129,%esi
  804518:	48 bf 58 61 80 00 00 	movabs $0x806158,%rdi
  80451f:	00 00 00 
  804522:	b8 00 00 00 00       	mov    $0x0,%eax
  804527:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  80452e:	00 00 00 
  804531:	41 ff d0             	callq  *%r8
  804534:	be 00 00 40 00       	mov    $0x400000,%esi
  804539:	bf 00 00 00 00       	mov    $0x0,%edi
  80453e:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  804545:	00 00 00 
  804548:	ff d0                	callq  *%rax
  80454a:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  804551:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804554:	48 98                	cltq   
  804556:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80455a:	0f 82 78 fe ff ff    	jb     8043d8 <map_segment+0x5d>
  804560:	b8 00 00 00 00       	mov    $0x0,%eax
  804565:	c9                   	leaveq 
  804566:	c3                   	retq   

0000000000804567 <copy_shared_pages>:
  804567:	55                   	push   %rbp
  804568:	48 89 e5             	mov    %rsp,%rbp
  80456b:	48 83 ec 30          	sub    $0x30,%rsp
  80456f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804572:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804579:	00 
  80457a:	e9 eb 00 00 00       	jmpq   80466a <copy_shared_pages+0x103>
  80457f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804583:	48 c1 f8 12          	sar    $0x12,%rax
  804587:	48 89 c2             	mov    %rax,%rdx
  80458a:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  804591:	01 00 00 
  804594:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804598:	83 e0 01             	and    $0x1,%eax
  80459b:	48 85 c0             	test   %rax,%rax
  80459e:	74 21                	je     8045c1 <copy_shared_pages+0x5a>
  8045a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045a4:	48 c1 f8 09          	sar    $0x9,%rax
  8045a8:	48 89 c2             	mov    %rax,%rdx
  8045ab:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8045b2:	01 00 00 
  8045b5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8045b9:	83 e0 01             	and    $0x1,%eax
  8045bc:	48 85 c0             	test   %rax,%rax
  8045bf:	75 0d                	jne    8045ce <copy_shared_pages+0x67>
  8045c1:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  8045c8:	00 
  8045c9:	e9 9c 00 00 00       	jmpq   80466a <copy_shared_pages+0x103>
  8045ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045d2:	48 05 00 02 00 00    	add    $0x200,%rax
  8045d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045dc:	eb 7e                	jmp    80465c <copy_shared_pages+0xf5>
  8045de:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8045e5:	01 00 00 
  8045e8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8045ec:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8045f0:	25 01 04 00 00       	and    $0x401,%eax
  8045f5:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  8045fb:	75 5a                	jne    804657 <copy_shared_pages+0xf0>
  8045fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804601:	48 c1 e0 0c          	shl    $0xc,%rax
  804605:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804609:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804610:	01 00 00 
  804613:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804617:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80461b:	25 07 0e 00 00       	and    $0xe07,%eax
  804620:	89 c6                	mov    %eax,%esi
  804622:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804626:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804629:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80462d:	41 89 f0             	mov    %esi,%r8d
  804630:	48 89 c6             	mov    %rax,%rsi
  804633:	bf 00 00 00 00       	mov    $0x0,%edi
  804638:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  80463f:	00 00 00 
  804642:	ff d0                	callq  *%rax
  804644:	48 98                	cltq   
  804646:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80464a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80464f:	79 06                	jns    804657 <copy_shared_pages+0xf0>
  804651:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804655:	eb 28                	jmp    80467f <copy_shared_pages+0x118>
  804657:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80465c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804660:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  804664:	0f 8c 74 ff ff ff    	jl     8045de <copy_shared_pages+0x77>
  80466a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80466e:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  804674:	0f 86 05 ff ff ff    	jbe    80457f <copy_shared_pages+0x18>
  80467a:	b8 00 00 00 00       	mov    $0x0,%eax
  80467f:	c9                   	leaveq 
  804680:	c3                   	retq   

0000000000804681 <fd2sockid>:
  804681:	55                   	push   %rbp
  804682:	48 89 e5             	mov    %rsp,%rbp
  804685:	48 83 ec 20          	sub    $0x20,%rsp
  804689:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80468c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804690:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804693:	48 89 d6             	mov    %rdx,%rsi
  804696:	89 c7                	mov    %eax,%edi
  804698:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  80469f:	00 00 00 
  8046a2:	ff d0                	callq  *%rax
  8046a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046ab:	79 05                	jns    8046b2 <fd2sockid+0x31>
  8046ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b0:	eb 24                	jmp    8046d6 <fd2sockid+0x55>
  8046b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046b6:	8b 10                	mov    (%rax),%edx
  8046b8:	48 b8 c0 80 80 00 00 	movabs $0x8080c0,%rax
  8046bf:	00 00 00 
  8046c2:	8b 00                	mov    (%rax),%eax
  8046c4:	39 c2                	cmp    %eax,%edx
  8046c6:	74 07                	je     8046cf <fd2sockid+0x4e>
  8046c8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8046cd:	eb 07                	jmp    8046d6 <fd2sockid+0x55>
  8046cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046d3:	8b 40 0c             	mov    0xc(%rax),%eax
  8046d6:	c9                   	leaveq 
  8046d7:	c3                   	retq   

00000000008046d8 <alloc_sockfd>:
  8046d8:	55                   	push   %rbp
  8046d9:	48 89 e5             	mov    %rsp,%rbp
  8046dc:	48 83 ec 20          	sub    $0x20,%rsp
  8046e0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8046e3:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8046e7:	48 89 c7             	mov    %rax,%rdi
  8046ea:	48 b8 3a 2b 80 00 00 	movabs $0x802b3a,%rax
  8046f1:	00 00 00 
  8046f4:	ff d0                	callq  *%rax
  8046f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046fd:	78 26                	js     804725 <alloc_sockfd+0x4d>
  8046ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804703:	ba 07 04 00 00       	mov    $0x407,%edx
  804708:	48 89 c6             	mov    %rax,%rsi
  80470b:	bf 00 00 00 00       	mov    $0x0,%edi
  804710:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  804717:	00 00 00 
  80471a:	ff d0                	callq  *%rax
  80471c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80471f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804723:	79 16                	jns    80473b <alloc_sockfd+0x63>
  804725:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804728:	89 c7                	mov    %eax,%edi
  80472a:	48 b8 e5 4b 80 00 00 	movabs $0x804be5,%rax
  804731:	00 00 00 
  804734:	ff d0                	callq  *%rax
  804736:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804739:	eb 3a                	jmp    804775 <alloc_sockfd+0x9d>
  80473b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80473f:	48 ba c0 80 80 00 00 	movabs $0x8080c0,%rdx
  804746:	00 00 00 
  804749:	8b 12                	mov    (%rdx),%edx
  80474b:	89 10                	mov    %edx,(%rax)
  80474d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804751:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804758:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80475c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80475f:	89 50 0c             	mov    %edx,0xc(%rax)
  804762:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804766:	48 89 c7             	mov    %rax,%rdi
  804769:	48 b8 ec 2a 80 00 00 	movabs $0x802aec,%rax
  804770:	00 00 00 
  804773:	ff d0                	callq  *%rax
  804775:	c9                   	leaveq 
  804776:	c3                   	retq   

0000000000804777 <accept>:
  804777:	55                   	push   %rbp
  804778:	48 89 e5             	mov    %rsp,%rbp
  80477b:	48 83 ec 30          	sub    $0x30,%rsp
  80477f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804782:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804786:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80478a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80478d:	89 c7                	mov    %eax,%edi
  80478f:	48 b8 81 46 80 00 00 	movabs $0x804681,%rax
  804796:	00 00 00 
  804799:	ff d0                	callq  *%rax
  80479b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80479e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047a2:	79 05                	jns    8047a9 <accept+0x32>
  8047a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047a7:	eb 3b                	jmp    8047e4 <accept+0x6d>
  8047a9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8047ad:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8047b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047b4:	48 89 ce             	mov    %rcx,%rsi
  8047b7:	89 c7                	mov    %eax,%edi
  8047b9:	48 b8 c2 4a 80 00 00 	movabs $0x804ac2,%rax
  8047c0:	00 00 00 
  8047c3:	ff d0                	callq  *%rax
  8047c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047cc:	79 05                	jns    8047d3 <accept+0x5c>
  8047ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047d1:	eb 11                	jmp    8047e4 <accept+0x6d>
  8047d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047d6:	89 c7                	mov    %eax,%edi
  8047d8:	48 b8 d8 46 80 00 00 	movabs $0x8046d8,%rax
  8047df:	00 00 00 
  8047e2:	ff d0                	callq  *%rax
  8047e4:	c9                   	leaveq 
  8047e5:	c3                   	retq   

00000000008047e6 <bind>:
  8047e6:	55                   	push   %rbp
  8047e7:	48 89 e5             	mov    %rsp,%rbp
  8047ea:	48 83 ec 20          	sub    $0x20,%rsp
  8047ee:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8047f1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8047f5:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8047f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8047fb:	89 c7                	mov    %eax,%edi
  8047fd:	48 b8 81 46 80 00 00 	movabs $0x804681,%rax
  804804:	00 00 00 
  804807:	ff d0                	callq  *%rax
  804809:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80480c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804810:	79 05                	jns    804817 <bind+0x31>
  804812:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804815:	eb 1b                	jmp    804832 <bind+0x4c>
  804817:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80481a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80481e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804821:	48 89 ce             	mov    %rcx,%rsi
  804824:	89 c7                	mov    %eax,%edi
  804826:	48 b8 41 4b 80 00 00 	movabs $0x804b41,%rax
  80482d:	00 00 00 
  804830:	ff d0                	callq  *%rax
  804832:	c9                   	leaveq 
  804833:	c3                   	retq   

0000000000804834 <shutdown>:
  804834:	55                   	push   %rbp
  804835:	48 89 e5             	mov    %rsp,%rbp
  804838:	48 83 ec 20          	sub    $0x20,%rsp
  80483c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80483f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804842:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804845:	89 c7                	mov    %eax,%edi
  804847:	48 b8 81 46 80 00 00 	movabs $0x804681,%rax
  80484e:	00 00 00 
  804851:	ff d0                	callq  *%rax
  804853:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804856:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80485a:	79 05                	jns    804861 <shutdown+0x2d>
  80485c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80485f:	eb 16                	jmp    804877 <shutdown+0x43>
  804861:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804864:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804867:	89 d6                	mov    %edx,%esi
  804869:	89 c7                	mov    %eax,%edi
  80486b:	48 b8 a5 4b 80 00 00 	movabs $0x804ba5,%rax
  804872:	00 00 00 
  804875:	ff d0                	callq  *%rax
  804877:	c9                   	leaveq 
  804878:	c3                   	retq   

0000000000804879 <devsock_close>:
  804879:	55                   	push   %rbp
  80487a:	48 89 e5             	mov    %rsp,%rbp
  80487d:	48 83 ec 10          	sub    $0x10,%rsp
  804881:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804885:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804889:	48 89 c7             	mov    %rax,%rdi
  80488c:	48 b8 dc 57 80 00 00 	movabs $0x8057dc,%rax
  804893:	00 00 00 
  804896:	ff d0                	callq  *%rax
  804898:	83 f8 01             	cmp    $0x1,%eax
  80489b:	75 17                	jne    8048b4 <devsock_close+0x3b>
  80489d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048a1:	8b 40 0c             	mov    0xc(%rax),%eax
  8048a4:	89 c7                	mov    %eax,%edi
  8048a6:	48 b8 e5 4b 80 00 00 	movabs $0x804be5,%rax
  8048ad:	00 00 00 
  8048b0:	ff d0                	callq  *%rax
  8048b2:	eb 05                	jmp    8048b9 <devsock_close+0x40>
  8048b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8048b9:	c9                   	leaveq 
  8048ba:	c3                   	retq   

00000000008048bb <connect>:
  8048bb:	55                   	push   %rbp
  8048bc:	48 89 e5             	mov    %rsp,%rbp
  8048bf:	48 83 ec 20          	sub    $0x20,%rsp
  8048c3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8048c6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8048ca:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8048cd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048d0:	89 c7                	mov    %eax,%edi
  8048d2:	48 b8 81 46 80 00 00 	movabs $0x804681,%rax
  8048d9:	00 00 00 
  8048dc:	ff d0                	callq  *%rax
  8048de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048e5:	79 05                	jns    8048ec <connect+0x31>
  8048e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048ea:	eb 1b                	jmp    804907 <connect+0x4c>
  8048ec:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8048ef:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8048f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048f6:	48 89 ce             	mov    %rcx,%rsi
  8048f9:	89 c7                	mov    %eax,%edi
  8048fb:	48 b8 12 4c 80 00 00 	movabs $0x804c12,%rax
  804902:	00 00 00 
  804905:	ff d0                	callq  *%rax
  804907:	c9                   	leaveq 
  804908:	c3                   	retq   

0000000000804909 <listen>:
  804909:	55                   	push   %rbp
  80490a:	48 89 e5             	mov    %rsp,%rbp
  80490d:	48 83 ec 20          	sub    $0x20,%rsp
  804911:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804914:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804917:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80491a:	89 c7                	mov    %eax,%edi
  80491c:	48 b8 81 46 80 00 00 	movabs $0x804681,%rax
  804923:	00 00 00 
  804926:	ff d0                	callq  *%rax
  804928:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80492b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80492f:	79 05                	jns    804936 <listen+0x2d>
  804931:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804934:	eb 16                	jmp    80494c <listen+0x43>
  804936:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804939:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80493c:	89 d6                	mov    %edx,%esi
  80493e:	89 c7                	mov    %eax,%edi
  804940:	48 b8 76 4c 80 00 00 	movabs $0x804c76,%rax
  804947:	00 00 00 
  80494a:	ff d0                	callq  *%rax
  80494c:	c9                   	leaveq 
  80494d:	c3                   	retq   

000000000080494e <devsock_read>:
  80494e:	55                   	push   %rbp
  80494f:	48 89 e5             	mov    %rsp,%rbp
  804952:	48 83 ec 20          	sub    $0x20,%rsp
  804956:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80495a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80495e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804962:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804966:	89 c2                	mov    %eax,%edx
  804968:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80496c:	8b 40 0c             	mov    0xc(%rax),%eax
  80496f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  804973:	b9 00 00 00 00       	mov    $0x0,%ecx
  804978:	89 c7                	mov    %eax,%edi
  80497a:	48 b8 b6 4c 80 00 00 	movabs $0x804cb6,%rax
  804981:	00 00 00 
  804984:	ff d0                	callq  *%rax
  804986:	c9                   	leaveq 
  804987:	c3                   	retq   

0000000000804988 <devsock_write>:
  804988:	55                   	push   %rbp
  804989:	48 89 e5             	mov    %rsp,%rbp
  80498c:	48 83 ec 20          	sub    $0x20,%rsp
  804990:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804994:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804998:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80499c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049a0:	89 c2                	mov    %eax,%edx
  8049a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049a6:	8b 40 0c             	mov    0xc(%rax),%eax
  8049a9:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8049ad:	b9 00 00 00 00       	mov    $0x0,%ecx
  8049b2:	89 c7                	mov    %eax,%edi
  8049b4:	48 b8 82 4d 80 00 00 	movabs $0x804d82,%rax
  8049bb:	00 00 00 
  8049be:	ff d0                	callq  *%rax
  8049c0:	c9                   	leaveq 
  8049c1:	c3                   	retq   

00000000008049c2 <devsock_stat>:
  8049c2:	55                   	push   %rbp
  8049c3:	48 89 e5             	mov    %rsp,%rbp
  8049c6:	48 83 ec 10          	sub    $0x10,%rsp
  8049ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8049ce:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8049d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049d6:	48 be f5 61 80 00 00 	movabs $0x8061f5,%rsi
  8049dd:	00 00 00 
  8049e0:	48 89 c7             	mov    %rax,%rdi
  8049e3:	48 b8 ca 16 80 00 00 	movabs $0x8016ca,%rax
  8049ea:	00 00 00 
  8049ed:	ff d0                	callq  *%rax
  8049ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8049f4:	c9                   	leaveq 
  8049f5:	c3                   	retq   

00000000008049f6 <socket>:
  8049f6:	55                   	push   %rbp
  8049f7:	48 89 e5             	mov    %rsp,%rbp
  8049fa:	48 83 ec 20          	sub    $0x20,%rsp
  8049fe:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804a01:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804a04:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  804a07:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  804a0a:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804a0d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a10:	89 ce                	mov    %ecx,%esi
  804a12:	89 c7                	mov    %eax,%edi
  804a14:	48 b8 3a 4e 80 00 00 	movabs $0x804e3a,%rax
  804a1b:	00 00 00 
  804a1e:	ff d0                	callq  *%rax
  804a20:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a23:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a27:	79 05                	jns    804a2e <socket+0x38>
  804a29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a2c:	eb 11                	jmp    804a3f <socket+0x49>
  804a2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a31:	89 c7                	mov    %eax,%edi
  804a33:	48 b8 d8 46 80 00 00 	movabs $0x8046d8,%rax
  804a3a:	00 00 00 
  804a3d:	ff d0                	callq  *%rax
  804a3f:	c9                   	leaveq 
  804a40:	c3                   	retq   

0000000000804a41 <nsipc>:
  804a41:	55                   	push   %rbp
  804a42:	48 89 e5             	mov    %rsp,%rbp
  804a45:	48 83 ec 10          	sub    $0x10,%rsp
  804a49:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804a4c:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  804a53:	00 00 00 
  804a56:	8b 00                	mov    (%rax),%eax
  804a58:	85 c0                	test   %eax,%eax
  804a5a:	75 1d                	jne    804a79 <nsipc+0x38>
  804a5c:	bf 02 00 00 00       	mov    $0x2,%edi
  804a61:	48 b8 6a 57 80 00 00 	movabs $0x80576a,%rax
  804a68:	00 00 00 
  804a6b:	ff d0                	callq  *%rax
  804a6d:	48 ba 04 90 80 00 00 	movabs $0x809004,%rdx
  804a74:	00 00 00 
  804a77:	89 02                	mov    %eax,(%rdx)
  804a79:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  804a80:	00 00 00 
  804a83:	8b 00                	mov    (%rax),%eax
  804a85:	8b 75 fc             	mov    -0x4(%rbp),%esi
  804a88:	b9 07 00 00 00       	mov    $0x7,%ecx
  804a8d:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  804a94:	00 00 00 
  804a97:	89 c7                	mov    %eax,%edi
  804a99:	48 b8 d4 56 80 00 00 	movabs $0x8056d4,%rax
  804aa0:	00 00 00 
  804aa3:	ff d0                	callq  *%rax
  804aa5:	ba 00 00 00 00       	mov    $0x0,%edx
  804aaa:	be 00 00 00 00       	mov    $0x0,%esi
  804aaf:	bf 00 00 00 00       	mov    $0x0,%edi
  804ab4:	48 b8 13 56 80 00 00 	movabs $0x805613,%rax
  804abb:	00 00 00 
  804abe:	ff d0                	callq  *%rax
  804ac0:	c9                   	leaveq 
  804ac1:	c3                   	retq   

0000000000804ac2 <nsipc_accept>:
  804ac2:	55                   	push   %rbp
  804ac3:	48 89 e5             	mov    %rsp,%rbp
  804ac6:	48 83 ec 30          	sub    $0x30,%rsp
  804aca:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804acd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804ad1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804ad5:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804adc:	00 00 00 
  804adf:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804ae2:	89 10                	mov    %edx,(%rax)
  804ae4:	bf 01 00 00 00       	mov    $0x1,%edi
  804ae9:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804af0:	00 00 00 
  804af3:	ff d0                	callq  *%rax
  804af5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804af8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804afc:	78 3e                	js     804b3c <nsipc_accept+0x7a>
  804afe:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b05:	00 00 00 
  804b08:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804b0c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b10:	8b 40 10             	mov    0x10(%rax),%eax
  804b13:	89 c2                	mov    %eax,%edx
  804b15:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  804b19:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804b1d:	48 89 ce             	mov    %rcx,%rsi
  804b20:	48 89 c7             	mov    %rax,%rdi
  804b23:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  804b2a:	00 00 00 
  804b2d:	ff d0                	callq  *%rax
  804b2f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b33:	8b 50 10             	mov    0x10(%rax),%edx
  804b36:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b3a:	89 10                	mov    %edx,(%rax)
  804b3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b3f:	c9                   	leaveq 
  804b40:	c3                   	retq   

0000000000804b41 <nsipc_bind>:
  804b41:	55                   	push   %rbp
  804b42:	48 89 e5             	mov    %rsp,%rbp
  804b45:	48 83 ec 10          	sub    $0x10,%rsp
  804b49:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804b4c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804b50:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804b53:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b5a:	00 00 00 
  804b5d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804b60:	89 10                	mov    %edx,(%rax)
  804b62:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804b65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b69:	48 89 c6             	mov    %rax,%rsi
  804b6c:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  804b73:	00 00 00 
  804b76:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  804b7d:	00 00 00 
  804b80:	ff d0                	callq  *%rax
  804b82:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b89:	00 00 00 
  804b8c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804b8f:	89 50 14             	mov    %edx,0x14(%rax)
  804b92:	bf 02 00 00 00       	mov    $0x2,%edi
  804b97:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804b9e:	00 00 00 
  804ba1:	ff d0                	callq  *%rax
  804ba3:	c9                   	leaveq 
  804ba4:	c3                   	retq   

0000000000804ba5 <nsipc_shutdown>:
  804ba5:	55                   	push   %rbp
  804ba6:	48 89 e5             	mov    %rsp,%rbp
  804ba9:	48 83 ec 10          	sub    $0x10,%rsp
  804bad:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804bb0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804bb3:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804bba:	00 00 00 
  804bbd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804bc0:	89 10                	mov    %edx,(%rax)
  804bc2:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804bc9:	00 00 00 
  804bcc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804bcf:	89 50 04             	mov    %edx,0x4(%rax)
  804bd2:	bf 03 00 00 00       	mov    $0x3,%edi
  804bd7:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804bde:	00 00 00 
  804be1:	ff d0                	callq  *%rax
  804be3:	c9                   	leaveq 
  804be4:	c3                   	retq   

0000000000804be5 <nsipc_close>:
  804be5:	55                   	push   %rbp
  804be6:	48 89 e5             	mov    %rsp,%rbp
  804be9:	48 83 ec 10          	sub    $0x10,%rsp
  804bed:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804bf0:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804bf7:	00 00 00 
  804bfa:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804bfd:	89 10                	mov    %edx,(%rax)
  804bff:	bf 04 00 00 00       	mov    $0x4,%edi
  804c04:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804c0b:	00 00 00 
  804c0e:	ff d0                	callq  *%rax
  804c10:	c9                   	leaveq 
  804c11:	c3                   	retq   

0000000000804c12 <nsipc_connect>:
  804c12:	55                   	push   %rbp
  804c13:	48 89 e5             	mov    %rsp,%rbp
  804c16:	48 83 ec 10          	sub    $0x10,%rsp
  804c1a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804c1d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804c21:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804c24:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804c2b:	00 00 00 
  804c2e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804c31:	89 10                	mov    %edx,(%rax)
  804c33:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804c36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c3a:	48 89 c6             	mov    %rax,%rsi
  804c3d:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  804c44:	00 00 00 
  804c47:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  804c4e:	00 00 00 
  804c51:	ff d0                	callq  *%rax
  804c53:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804c5a:	00 00 00 
  804c5d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804c60:	89 50 14             	mov    %edx,0x14(%rax)
  804c63:	bf 05 00 00 00       	mov    $0x5,%edi
  804c68:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804c6f:	00 00 00 
  804c72:	ff d0                	callq  *%rax
  804c74:	c9                   	leaveq 
  804c75:	c3                   	retq   

0000000000804c76 <nsipc_listen>:
  804c76:	55                   	push   %rbp
  804c77:	48 89 e5             	mov    %rsp,%rbp
  804c7a:	48 83 ec 10          	sub    $0x10,%rsp
  804c7e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804c81:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804c84:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804c8b:	00 00 00 
  804c8e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804c91:	89 10                	mov    %edx,(%rax)
  804c93:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804c9a:	00 00 00 
  804c9d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804ca0:	89 50 04             	mov    %edx,0x4(%rax)
  804ca3:	bf 06 00 00 00       	mov    $0x6,%edi
  804ca8:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804caf:	00 00 00 
  804cb2:	ff d0                	callq  *%rax
  804cb4:	c9                   	leaveq 
  804cb5:	c3                   	retq   

0000000000804cb6 <nsipc_recv>:
  804cb6:	55                   	push   %rbp
  804cb7:	48 89 e5             	mov    %rsp,%rbp
  804cba:	48 83 ec 30          	sub    $0x30,%rsp
  804cbe:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804cc1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804cc5:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804cc8:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804ccb:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804cd2:	00 00 00 
  804cd5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804cd8:	89 10                	mov    %edx,(%rax)
  804cda:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804ce1:	00 00 00 
  804ce4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804ce7:	89 50 04             	mov    %edx,0x4(%rax)
  804cea:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804cf1:	00 00 00 
  804cf4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804cf7:	89 50 08             	mov    %edx,0x8(%rax)
  804cfa:	bf 07 00 00 00       	mov    $0x7,%edi
  804cff:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804d06:	00 00 00 
  804d09:	ff d0                	callq  *%rax
  804d0b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d0e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d12:	78 69                	js     804d7d <nsipc_recv+0xc7>
  804d14:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  804d1b:	7f 08                	jg     804d25 <nsipc_recv+0x6f>
  804d1d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d20:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804d23:	7e 35                	jle    804d5a <nsipc_recv+0xa4>
  804d25:	48 b9 fc 61 80 00 00 	movabs $0x8061fc,%rcx
  804d2c:	00 00 00 
  804d2f:	48 ba 11 62 80 00 00 	movabs $0x806211,%rdx
  804d36:	00 00 00 
  804d39:	be 62 00 00 00       	mov    $0x62,%esi
  804d3e:	48 bf 26 62 80 00 00 	movabs $0x806226,%rdi
  804d45:	00 00 00 
  804d48:	b8 00 00 00 00       	mov    $0x0,%eax
  804d4d:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  804d54:	00 00 00 
  804d57:	41 ff d0             	callq  *%r8
  804d5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d5d:	48 63 d0             	movslq %eax,%rdx
  804d60:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d64:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  804d6b:	00 00 00 
  804d6e:	48 89 c7             	mov    %rax,%rdi
  804d71:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  804d78:	00 00 00 
  804d7b:	ff d0                	callq  *%rax
  804d7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d80:	c9                   	leaveq 
  804d81:	c3                   	retq   

0000000000804d82 <nsipc_send>:
  804d82:	55                   	push   %rbp
  804d83:	48 89 e5             	mov    %rsp,%rbp
  804d86:	48 83 ec 20          	sub    $0x20,%rsp
  804d8a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804d8d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804d91:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804d94:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804d97:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804d9e:	00 00 00 
  804da1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804da4:	89 10                	mov    %edx,(%rax)
  804da6:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  804dad:	7e 35                	jle    804de4 <nsipc_send+0x62>
  804daf:	48 b9 35 62 80 00 00 	movabs $0x806235,%rcx
  804db6:	00 00 00 
  804db9:	48 ba 11 62 80 00 00 	movabs $0x806211,%rdx
  804dc0:	00 00 00 
  804dc3:	be 6d 00 00 00       	mov    $0x6d,%esi
  804dc8:	48 bf 26 62 80 00 00 	movabs $0x806226,%rdi
  804dcf:	00 00 00 
  804dd2:	b8 00 00 00 00       	mov    $0x0,%eax
  804dd7:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  804dde:	00 00 00 
  804de1:	41 ff d0             	callq  *%r8
  804de4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804de7:	48 63 d0             	movslq %eax,%rdx
  804dea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804dee:	48 89 c6             	mov    %rax,%rsi
  804df1:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  804df8:	00 00 00 
  804dfb:	48 b8 ee 19 80 00 00 	movabs $0x8019ee,%rax
  804e02:	00 00 00 
  804e05:	ff d0                	callq  *%rax
  804e07:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804e0e:	00 00 00 
  804e11:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804e14:	89 50 04             	mov    %edx,0x4(%rax)
  804e17:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804e1e:	00 00 00 
  804e21:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804e24:	89 50 08             	mov    %edx,0x8(%rax)
  804e27:	bf 08 00 00 00       	mov    $0x8,%edi
  804e2c:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804e33:	00 00 00 
  804e36:	ff d0                	callq  *%rax
  804e38:	c9                   	leaveq 
  804e39:	c3                   	retq   

0000000000804e3a <nsipc_socket>:
  804e3a:	55                   	push   %rbp
  804e3b:	48 89 e5             	mov    %rsp,%rbp
  804e3e:	48 83 ec 10          	sub    $0x10,%rsp
  804e42:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804e45:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804e48:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804e4b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804e52:	00 00 00 
  804e55:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804e58:	89 10                	mov    %edx,(%rax)
  804e5a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804e61:	00 00 00 
  804e64:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804e67:	89 50 04             	mov    %edx,0x4(%rax)
  804e6a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804e71:	00 00 00 
  804e74:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804e77:	89 50 08             	mov    %edx,0x8(%rax)
  804e7a:	bf 09 00 00 00       	mov    $0x9,%edi
  804e7f:	48 b8 41 4a 80 00 00 	movabs $0x804a41,%rax
  804e86:	00 00 00 
  804e89:	ff d0                	callq  *%rax
  804e8b:	c9                   	leaveq 
  804e8c:	c3                   	retq   

0000000000804e8d <pipe>:
  804e8d:	55                   	push   %rbp
  804e8e:	48 89 e5             	mov    %rsp,%rbp
  804e91:	53                   	push   %rbx
  804e92:	48 83 ec 38          	sub    $0x38,%rsp
  804e96:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804e9a:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804e9e:	48 89 c7             	mov    %rax,%rdi
  804ea1:	48 b8 3a 2b 80 00 00 	movabs $0x802b3a,%rax
  804ea8:	00 00 00 
  804eab:	ff d0                	callq  *%rax
  804ead:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804eb0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804eb4:	0f 88 bf 01 00 00    	js     805079 <pipe+0x1ec>
  804eba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ebe:	ba 07 04 00 00       	mov    $0x407,%edx
  804ec3:	48 89 c6             	mov    %rax,%rsi
  804ec6:	bf 00 00 00 00       	mov    $0x0,%edi
  804ecb:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  804ed2:	00 00 00 
  804ed5:	ff d0                	callq  *%rax
  804ed7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804eda:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804ede:	0f 88 95 01 00 00    	js     805079 <pipe+0x1ec>
  804ee4:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804ee8:	48 89 c7             	mov    %rax,%rdi
  804eeb:	48 b8 3a 2b 80 00 00 	movabs $0x802b3a,%rax
  804ef2:	00 00 00 
  804ef5:	ff d0                	callq  *%rax
  804ef7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804efa:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804efe:	0f 88 5d 01 00 00    	js     805061 <pipe+0x1d4>
  804f04:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804f08:	ba 07 04 00 00       	mov    $0x407,%edx
  804f0d:	48 89 c6             	mov    %rax,%rsi
  804f10:	bf 00 00 00 00       	mov    $0x0,%edi
  804f15:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  804f1c:	00 00 00 
  804f1f:	ff d0                	callq  *%rax
  804f21:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804f24:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804f28:	0f 88 33 01 00 00    	js     805061 <pipe+0x1d4>
  804f2e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804f32:	48 89 c7             	mov    %rax,%rdi
  804f35:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  804f3c:	00 00 00 
  804f3f:	ff d0                	callq  *%rax
  804f41:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804f45:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804f49:	ba 07 04 00 00       	mov    $0x407,%edx
  804f4e:	48 89 c6             	mov    %rax,%rsi
  804f51:	bf 00 00 00 00       	mov    $0x0,%edi
  804f56:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  804f5d:	00 00 00 
  804f60:	ff d0                	callq  *%rax
  804f62:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804f65:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804f69:	79 05                	jns    804f70 <pipe+0xe3>
  804f6b:	e9 d9 00 00 00       	jmpq   805049 <pipe+0x1bc>
  804f70:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804f74:	48 89 c7             	mov    %rax,%rdi
  804f77:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  804f7e:	00 00 00 
  804f81:	ff d0                	callq  *%rax
  804f83:	48 89 c2             	mov    %rax,%rdx
  804f86:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804f8a:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804f90:	48 89 d1             	mov    %rdx,%rcx
  804f93:	ba 00 00 00 00       	mov    $0x0,%edx
  804f98:	48 89 c6             	mov    %rax,%rsi
  804f9b:	bf 00 00 00 00       	mov    $0x0,%edi
  804fa0:	48 b8 49 20 80 00 00 	movabs $0x802049,%rax
  804fa7:	00 00 00 
  804faa:	ff d0                	callq  *%rax
  804fac:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804faf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804fb3:	79 1b                	jns    804fd0 <pipe+0x143>
  804fb5:	90                   	nop
  804fb6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804fba:	48 89 c6             	mov    %rax,%rsi
  804fbd:	bf 00 00 00 00       	mov    $0x0,%edi
  804fc2:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  804fc9:	00 00 00 
  804fcc:	ff d0                	callq  *%rax
  804fce:	eb 79                	jmp    805049 <pipe+0x1bc>
  804fd0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804fd4:	48 ba 00 81 80 00 00 	movabs $0x808100,%rdx
  804fdb:	00 00 00 
  804fde:	8b 12                	mov    (%rdx),%edx
  804fe0:	89 10                	mov    %edx,(%rax)
  804fe2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804fe6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804fed:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804ff1:	48 ba 00 81 80 00 00 	movabs $0x808100,%rdx
  804ff8:	00 00 00 
  804ffb:	8b 12                	mov    (%rdx),%edx
  804ffd:	89 10                	mov    %edx,(%rax)
  804fff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805003:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80500a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80500e:	48 89 c7             	mov    %rax,%rdi
  805011:	48 b8 ec 2a 80 00 00 	movabs $0x802aec,%rax
  805018:	00 00 00 
  80501b:	ff d0                	callq  *%rax
  80501d:	89 c2                	mov    %eax,%edx
  80501f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805023:	89 10                	mov    %edx,(%rax)
  805025:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805029:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80502d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805031:	48 89 c7             	mov    %rax,%rdi
  805034:	48 b8 ec 2a 80 00 00 	movabs $0x802aec,%rax
  80503b:	00 00 00 
  80503e:	ff d0                	callq  *%rax
  805040:	89 03                	mov    %eax,(%rbx)
  805042:	b8 00 00 00 00       	mov    $0x0,%eax
  805047:	eb 33                	jmp    80507c <pipe+0x1ef>
  805049:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80504d:	48 89 c6             	mov    %rax,%rsi
  805050:	bf 00 00 00 00       	mov    $0x0,%edi
  805055:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  80505c:	00 00 00 
  80505f:	ff d0                	callq  *%rax
  805061:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805065:	48 89 c6             	mov    %rax,%rsi
  805068:	bf 00 00 00 00       	mov    $0x0,%edi
  80506d:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  805074:	00 00 00 
  805077:	ff d0                	callq  *%rax
  805079:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80507c:	48 83 c4 38          	add    $0x38,%rsp
  805080:	5b                   	pop    %rbx
  805081:	5d                   	pop    %rbp
  805082:	c3                   	retq   

0000000000805083 <_pipeisclosed>:
  805083:	55                   	push   %rbp
  805084:	48 89 e5             	mov    %rsp,%rbp
  805087:	53                   	push   %rbx
  805088:	48 83 ec 28          	sub    $0x28,%rsp
  80508c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  805090:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  805094:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80509b:	00 00 00 
  80509e:	48 8b 00             	mov    (%rax),%rax
  8050a1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8050a7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8050aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8050ae:	48 89 c7             	mov    %rax,%rdi
  8050b1:	48 b8 dc 57 80 00 00 	movabs $0x8057dc,%rax
  8050b8:	00 00 00 
  8050bb:	ff d0                	callq  *%rax
  8050bd:	89 c3                	mov    %eax,%ebx
  8050bf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8050c3:	48 89 c7             	mov    %rax,%rdi
  8050c6:	48 b8 dc 57 80 00 00 	movabs $0x8057dc,%rax
  8050cd:	00 00 00 
  8050d0:	ff d0                	callq  *%rax
  8050d2:	39 c3                	cmp    %eax,%ebx
  8050d4:	0f 94 c0             	sete   %al
  8050d7:	0f b6 c0             	movzbl %al,%eax
  8050da:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8050dd:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8050e4:	00 00 00 
  8050e7:	48 8b 00             	mov    (%rax),%rax
  8050ea:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8050f0:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8050f3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8050f6:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8050f9:	75 05                	jne    805100 <_pipeisclosed+0x7d>
  8050fb:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8050fe:	eb 4f                	jmp    80514f <_pipeisclosed+0xcc>
  805100:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805103:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  805106:	74 42                	je     80514a <_pipeisclosed+0xc7>
  805108:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80510c:	75 3c                	jne    80514a <_pipeisclosed+0xc7>
  80510e:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  805115:	00 00 00 
  805118:	48 8b 00             	mov    (%rax),%rax
  80511b:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  805121:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  805124:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805127:	89 c6                	mov    %eax,%esi
  805129:	48 bf 46 62 80 00 00 	movabs $0x806246,%rdi
  805130:	00 00 00 
  805133:	b8 00 00 00 00       	mov    $0x0,%eax
  805138:	49 b8 15 0b 80 00 00 	movabs $0x800b15,%r8
  80513f:	00 00 00 
  805142:	41 ff d0             	callq  *%r8
  805145:	e9 4a ff ff ff       	jmpq   805094 <_pipeisclosed+0x11>
  80514a:	e9 45 ff ff ff       	jmpq   805094 <_pipeisclosed+0x11>
  80514f:	48 83 c4 28          	add    $0x28,%rsp
  805153:	5b                   	pop    %rbx
  805154:	5d                   	pop    %rbp
  805155:	c3                   	retq   

0000000000805156 <pipeisclosed>:
  805156:	55                   	push   %rbp
  805157:	48 89 e5             	mov    %rsp,%rbp
  80515a:	48 83 ec 30          	sub    $0x30,%rsp
  80515e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805161:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  805165:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805168:	48 89 d6             	mov    %rdx,%rsi
  80516b:	89 c7                	mov    %eax,%edi
  80516d:	48 b8 d2 2b 80 00 00 	movabs $0x802bd2,%rax
  805174:	00 00 00 
  805177:	ff d0                	callq  *%rax
  805179:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80517c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805180:	79 05                	jns    805187 <pipeisclosed+0x31>
  805182:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805185:	eb 31                	jmp    8051b8 <pipeisclosed+0x62>
  805187:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80518b:	48 89 c7             	mov    %rax,%rdi
  80518e:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  805195:	00 00 00 
  805198:	ff d0                	callq  *%rax
  80519a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80519e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8051a2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8051a6:	48 89 d6             	mov    %rdx,%rsi
  8051a9:	48 89 c7             	mov    %rax,%rdi
  8051ac:	48 b8 83 50 80 00 00 	movabs $0x805083,%rax
  8051b3:	00 00 00 
  8051b6:	ff d0                	callq  *%rax
  8051b8:	c9                   	leaveq 
  8051b9:	c3                   	retq   

00000000008051ba <devpipe_read>:
  8051ba:	55                   	push   %rbp
  8051bb:	48 89 e5             	mov    %rsp,%rbp
  8051be:	48 83 ec 40          	sub    $0x40,%rsp
  8051c2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8051c6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8051ca:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8051ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8051d2:	48 89 c7             	mov    %rax,%rdi
  8051d5:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  8051dc:	00 00 00 
  8051df:	ff d0                	callq  *%rax
  8051e1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8051e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8051e9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8051ed:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8051f4:	00 
  8051f5:	e9 92 00 00 00       	jmpq   80528c <devpipe_read+0xd2>
  8051fa:	eb 41                	jmp    80523d <devpipe_read+0x83>
  8051fc:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  805201:	74 09                	je     80520c <devpipe_read+0x52>
  805203:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805207:	e9 92 00 00 00       	jmpq   80529e <devpipe_read+0xe4>
  80520c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  805210:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805214:	48 89 d6             	mov    %rdx,%rsi
  805217:	48 89 c7             	mov    %rax,%rdi
  80521a:	48 b8 83 50 80 00 00 	movabs $0x805083,%rax
  805221:	00 00 00 
  805224:	ff d0                	callq  *%rax
  805226:	85 c0                	test   %eax,%eax
  805228:	74 07                	je     805231 <devpipe_read+0x77>
  80522a:	b8 00 00 00 00       	mov    $0x0,%eax
  80522f:	eb 6d                	jmp    80529e <devpipe_read+0xe4>
  805231:	48 b8 bb 1f 80 00 00 	movabs $0x801fbb,%rax
  805238:	00 00 00 
  80523b:	ff d0                	callq  *%rax
  80523d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805241:	8b 10                	mov    (%rax),%edx
  805243:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805247:	8b 40 04             	mov    0x4(%rax),%eax
  80524a:	39 c2                	cmp    %eax,%edx
  80524c:	74 ae                	je     8051fc <devpipe_read+0x42>
  80524e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805252:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805256:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80525a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80525e:	8b 00                	mov    (%rax),%eax
  805260:	99                   	cltd   
  805261:	c1 ea 1b             	shr    $0x1b,%edx
  805264:	01 d0                	add    %edx,%eax
  805266:	83 e0 1f             	and    $0x1f,%eax
  805269:	29 d0                	sub    %edx,%eax
  80526b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80526f:	48 98                	cltq   
  805271:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  805276:	88 01                	mov    %al,(%rcx)
  805278:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80527c:	8b 00                	mov    (%rax),%eax
  80527e:	8d 50 01             	lea    0x1(%rax),%edx
  805281:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805285:	89 10                	mov    %edx,(%rax)
  805287:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80528c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805290:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  805294:	0f 82 60 ff ff ff    	jb     8051fa <devpipe_read+0x40>
  80529a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80529e:	c9                   	leaveq 
  80529f:	c3                   	retq   

00000000008052a0 <devpipe_write>:
  8052a0:	55                   	push   %rbp
  8052a1:	48 89 e5             	mov    %rsp,%rbp
  8052a4:	48 83 ec 40          	sub    $0x40,%rsp
  8052a8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8052ac:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8052b0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8052b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8052b8:	48 89 c7             	mov    %rax,%rdi
  8052bb:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  8052c2:	00 00 00 
  8052c5:	ff d0                	callq  *%rax
  8052c7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8052cb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8052cf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8052d3:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8052da:	00 
  8052db:	e9 8e 00 00 00       	jmpq   80536e <devpipe_write+0xce>
  8052e0:	eb 31                	jmp    805313 <devpipe_write+0x73>
  8052e2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8052e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8052ea:	48 89 d6             	mov    %rdx,%rsi
  8052ed:	48 89 c7             	mov    %rax,%rdi
  8052f0:	48 b8 83 50 80 00 00 	movabs $0x805083,%rax
  8052f7:	00 00 00 
  8052fa:	ff d0                	callq  *%rax
  8052fc:	85 c0                	test   %eax,%eax
  8052fe:	74 07                	je     805307 <devpipe_write+0x67>
  805300:	b8 00 00 00 00       	mov    $0x0,%eax
  805305:	eb 79                	jmp    805380 <devpipe_write+0xe0>
  805307:	48 b8 bb 1f 80 00 00 	movabs $0x801fbb,%rax
  80530e:	00 00 00 
  805311:	ff d0                	callq  *%rax
  805313:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805317:	8b 40 04             	mov    0x4(%rax),%eax
  80531a:	48 63 d0             	movslq %eax,%rdx
  80531d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805321:	8b 00                	mov    (%rax),%eax
  805323:	48 98                	cltq   
  805325:	48 83 c0 20          	add    $0x20,%rax
  805329:	48 39 c2             	cmp    %rax,%rdx
  80532c:	73 b4                	jae    8052e2 <devpipe_write+0x42>
  80532e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805332:	8b 40 04             	mov    0x4(%rax),%eax
  805335:	99                   	cltd   
  805336:	c1 ea 1b             	shr    $0x1b,%edx
  805339:	01 d0                	add    %edx,%eax
  80533b:	83 e0 1f             	and    $0x1f,%eax
  80533e:	29 d0                	sub    %edx,%eax
  805340:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  805344:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  805348:	48 01 ca             	add    %rcx,%rdx
  80534b:	0f b6 0a             	movzbl (%rdx),%ecx
  80534e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  805352:	48 98                	cltq   
  805354:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  805358:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80535c:	8b 40 04             	mov    0x4(%rax),%eax
  80535f:	8d 50 01             	lea    0x1(%rax),%edx
  805362:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805366:	89 50 04             	mov    %edx,0x4(%rax)
  805369:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80536e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805372:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  805376:	0f 82 64 ff ff ff    	jb     8052e0 <devpipe_write+0x40>
  80537c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805380:	c9                   	leaveq 
  805381:	c3                   	retq   

0000000000805382 <devpipe_stat>:
  805382:	55                   	push   %rbp
  805383:	48 89 e5             	mov    %rsp,%rbp
  805386:	48 83 ec 20          	sub    $0x20,%rsp
  80538a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80538e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805392:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805396:	48 89 c7             	mov    %rax,%rdi
  805399:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  8053a0:	00 00 00 
  8053a3:	ff d0                	callq  *%rax
  8053a5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8053a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8053ad:	48 be 59 62 80 00 00 	movabs $0x806259,%rsi
  8053b4:	00 00 00 
  8053b7:	48 89 c7             	mov    %rax,%rdi
  8053ba:	48 b8 ca 16 80 00 00 	movabs $0x8016ca,%rax
  8053c1:	00 00 00 
  8053c4:	ff d0                	callq  *%rax
  8053c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8053ca:	8b 50 04             	mov    0x4(%rax),%edx
  8053cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8053d1:	8b 00                	mov    (%rax),%eax
  8053d3:	29 c2                	sub    %eax,%edx
  8053d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8053d9:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8053df:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8053e3:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8053ea:	00 00 00 
  8053ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8053f1:	48 b9 00 81 80 00 00 	movabs $0x808100,%rcx
  8053f8:	00 00 00 
  8053fb:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  805402:	b8 00 00 00 00       	mov    $0x0,%eax
  805407:	c9                   	leaveq 
  805408:	c3                   	retq   

0000000000805409 <devpipe_close>:
  805409:	55                   	push   %rbp
  80540a:	48 89 e5             	mov    %rsp,%rbp
  80540d:	48 83 ec 10          	sub    $0x10,%rsp
  805411:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805415:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805419:	48 89 c6             	mov    %rax,%rsi
  80541c:	bf 00 00 00 00       	mov    $0x0,%edi
  805421:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  805428:	00 00 00 
  80542b:	ff d0                	callq  *%rax
  80542d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805431:	48 89 c7             	mov    %rax,%rdi
  805434:	48 b8 0f 2b 80 00 00 	movabs $0x802b0f,%rax
  80543b:	00 00 00 
  80543e:	ff d0                	callq  *%rax
  805440:	48 89 c6             	mov    %rax,%rsi
  805443:	bf 00 00 00 00       	mov    $0x0,%edi
  805448:	48 b8 a4 20 80 00 00 	movabs $0x8020a4,%rax
  80544f:	00 00 00 
  805452:	ff d0                	callq  *%rax
  805454:	c9                   	leaveq 
  805455:	c3                   	retq   

0000000000805456 <wait>:
  805456:	55                   	push   %rbp
  805457:	48 89 e5             	mov    %rsp,%rbp
  80545a:	48 83 ec 20          	sub    $0x20,%rsp
  80545e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805461:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805465:	75 35                	jne    80549c <wait+0x46>
  805467:	48 b9 60 62 80 00 00 	movabs $0x806260,%rcx
  80546e:	00 00 00 
  805471:	48 ba 6b 62 80 00 00 	movabs $0x80626b,%rdx
  805478:	00 00 00 
  80547b:	be 0a 00 00 00       	mov    $0xa,%esi
  805480:	48 bf 80 62 80 00 00 	movabs $0x806280,%rdi
  805487:	00 00 00 
  80548a:	b8 00 00 00 00       	mov    $0x0,%eax
  80548f:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  805496:	00 00 00 
  805499:	41 ff d0             	callq  *%r8
  80549c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80549f:	25 ff 03 00 00       	and    $0x3ff,%eax
  8054a4:	48 98                	cltq   
  8054a6:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8054ad:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8054b4:	00 00 00 
  8054b7:	48 01 d0             	add    %rdx,%rax
  8054ba:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8054be:	eb 0c                	jmp    8054cc <wait+0x76>
  8054c0:	48 b8 bb 1f 80 00 00 	movabs $0x801fbb,%rax
  8054c7:	00 00 00 
  8054ca:	ff d0                	callq  *%rax
  8054cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8054d0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8054d6:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8054d9:	75 0e                	jne    8054e9 <wait+0x93>
  8054db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8054df:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  8054e5:	85 c0                	test   %eax,%eax
  8054e7:	75 d7                	jne    8054c0 <wait+0x6a>
  8054e9:	c9                   	leaveq 
  8054ea:	c3                   	retq   

00000000008054eb <set_pgfault_handler>:
  8054eb:	55                   	push   %rbp
  8054ec:	48 89 e5             	mov    %rsp,%rbp
  8054ef:	48 83 ec 20          	sub    $0x20,%rsp
  8054f3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8054f7:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8054fe:	00 00 00 
  805501:	48 8b 00             	mov    (%rax),%rax
  805504:	48 85 c0             	test   %rax,%rax
  805507:	75 6f                	jne    805578 <set_pgfault_handler+0x8d>
  805509:	ba 07 00 00 00       	mov    $0x7,%edx
  80550e:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  805513:	bf 00 00 00 00       	mov    $0x0,%edi
  805518:	48 b8 f9 1f 80 00 00 	movabs $0x801ff9,%rax
  80551f:	00 00 00 
  805522:	ff d0                	callq  *%rax
  805524:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805527:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80552b:	79 30                	jns    80555d <set_pgfault_handler+0x72>
  80552d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805530:	89 c1                	mov    %eax,%ecx
  805532:	48 ba 90 62 80 00 00 	movabs $0x806290,%rdx
  805539:	00 00 00 
  80553c:	be 22 00 00 00       	mov    $0x22,%esi
  805541:	48 bf af 62 80 00 00 	movabs $0x8062af,%rdi
  805548:	00 00 00 
  80554b:	b8 00 00 00 00       	mov    $0x0,%eax
  805550:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  805557:	00 00 00 
  80555a:	41 ff d0             	callq  *%r8
  80555d:	48 be 8b 55 80 00 00 	movabs $0x80558b,%rsi
  805564:	00 00 00 
  805567:	bf 00 00 00 00       	mov    $0x0,%edi
  80556c:	48 b8 83 21 80 00 00 	movabs $0x802183,%rax
  805573:	00 00 00 
  805576:	ff d0                	callq  *%rax
  805578:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80557f:	00 00 00 
  805582:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805586:	48 89 10             	mov    %rdx,(%rax)
  805589:	c9                   	leaveq 
  80558a:	c3                   	retq   

000000000080558b <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80558b:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  80558e:	48 a1 00 d0 80 00 00 	movabs 0x80d000,%rax
  805595:	00 00 00 
call *%rax
  805598:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80559a:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8055a1:	00 08 
    movq 152(%rsp), %rax
  8055a3:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8055aa:	00 
    movq 136(%rsp), %rbx
  8055ab:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  8055b2:	00 
movq %rbx, (%rax)
  8055b3:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  8055b6:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8055ba:	4c 8b 3c 24          	mov    (%rsp),%r15
  8055be:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8055c3:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8055c8:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8055cd:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8055d2:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8055d7:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  8055dc:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  8055e1:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8055e6:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  8055eb:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  8055f0:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  8055f5:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  8055fa:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  8055ff:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  805604:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  805608:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80560c:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80560d:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  805612:	c3                   	retq   

0000000000805613 <ipc_recv>:
  805613:	55                   	push   %rbp
  805614:	48 89 e5             	mov    %rsp,%rbp
  805617:	48 83 ec 30          	sub    $0x30,%rsp
  80561b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80561f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805623:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  805627:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80562c:	75 0e                	jne    80563c <ipc_recv+0x29>
  80562e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  805635:	00 00 00 
  805638:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80563c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805640:	48 89 c7             	mov    %rax,%rdi
  805643:	48 b8 22 22 80 00 00 	movabs $0x802222,%rax
  80564a:	00 00 00 
  80564d:	ff d0                	callq  *%rax
  80564f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805652:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805656:	79 27                	jns    80567f <ipc_recv+0x6c>
  805658:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80565d:	74 0a                	je     805669 <ipc_recv+0x56>
  80565f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805663:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  805669:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80566e:	74 0a                	je     80567a <ipc_recv+0x67>
  805670:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805674:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80567a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80567d:	eb 53                	jmp    8056d2 <ipc_recv+0xbf>
  80567f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  805684:	74 19                	je     80569f <ipc_recv+0x8c>
  805686:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80568d:	00 00 00 
  805690:	48 8b 00             	mov    (%rax),%rax
  805693:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  805699:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80569d:	89 10                	mov    %edx,(%rax)
  80569f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8056a4:	74 19                	je     8056bf <ipc_recv+0xac>
  8056a6:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8056ad:	00 00 00 
  8056b0:	48 8b 00             	mov    (%rax),%rax
  8056b3:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8056b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8056bd:	89 10                	mov    %edx,(%rax)
  8056bf:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8056c6:	00 00 00 
  8056c9:	48 8b 00             	mov    (%rax),%rax
  8056cc:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8056d2:	c9                   	leaveq 
  8056d3:	c3                   	retq   

00000000008056d4 <ipc_send>:
  8056d4:	55                   	push   %rbp
  8056d5:	48 89 e5             	mov    %rsp,%rbp
  8056d8:	48 83 ec 30          	sub    $0x30,%rsp
  8056dc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8056df:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8056e2:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8056e6:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8056e9:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8056ee:	75 10                	jne    805700 <ipc_send+0x2c>
  8056f0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8056f7:	00 00 00 
  8056fa:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8056fe:	eb 0e                	jmp    80570e <ipc_send+0x3a>
  805700:	eb 0c                	jmp    80570e <ipc_send+0x3a>
  805702:	48 b8 bb 1f 80 00 00 	movabs $0x801fbb,%rax
  805709:	00 00 00 
  80570c:	ff d0                	callq  *%rax
  80570e:	8b 75 e8             	mov    -0x18(%rbp),%esi
  805711:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  805714:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  805718:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80571b:	89 c7                	mov    %eax,%edi
  80571d:	48 b8 cd 21 80 00 00 	movabs $0x8021cd,%rax
  805724:	00 00 00 
  805727:	ff d0                	callq  *%rax
  805729:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80572c:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  805730:	74 d0                	je     805702 <ipc_send+0x2e>
  805732:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805736:	79 30                	jns    805768 <ipc_send+0x94>
  805738:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80573b:	89 c1                	mov    %eax,%ecx
  80573d:	48 ba c0 62 80 00 00 	movabs $0x8062c0,%rdx
  805744:	00 00 00 
  805747:	be 44 00 00 00       	mov    $0x44,%esi
  80574c:	48 bf d6 62 80 00 00 	movabs $0x8062d6,%rdi
  805753:	00 00 00 
  805756:	b8 00 00 00 00       	mov    $0x0,%eax
  80575b:	49 b8 dc 08 80 00 00 	movabs $0x8008dc,%r8
  805762:	00 00 00 
  805765:	41 ff d0             	callq  *%r8
  805768:	c9                   	leaveq 
  805769:	c3                   	retq   

000000000080576a <ipc_find_env>:
  80576a:	55                   	push   %rbp
  80576b:	48 89 e5             	mov    %rsp,%rbp
  80576e:	48 83 ec 14          	sub    $0x14,%rsp
  805772:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805775:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80577c:	eb 4e                	jmp    8057cc <ipc_find_env+0x62>
  80577e:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  805785:	00 00 00 
  805788:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80578b:	48 98                	cltq   
  80578d:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  805794:	48 01 d0             	add    %rdx,%rax
  805797:	48 05 d0 00 00 00    	add    $0xd0,%rax
  80579d:	8b 00                	mov    (%rax),%eax
  80579f:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8057a2:	75 24                	jne    8057c8 <ipc_find_env+0x5e>
  8057a4:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8057ab:	00 00 00 
  8057ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8057b1:	48 98                	cltq   
  8057b3:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8057ba:	48 01 d0             	add    %rdx,%rax
  8057bd:	48 05 c0 00 00 00    	add    $0xc0,%rax
  8057c3:	8b 40 08             	mov    0x8(%rax),%eax
  8057c6:	eb 12                	jmp    8057da <ipc_find_env+0x70>
  8057c8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8057cc:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8057d3:	7e a9                	jle    80577e <ipc_find_env+0x14>
  8057d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8057da:	c9                   	leaveq 
  8057db:	c3                   	retq   

00000000008057dc <pageref>:
  8057dc:	55                   	push   %rbp
  8057dd:	48 89 e5             	mov    %rsp,%rbp
  8057e0:	48 83 ec 18          	sub    $0x18,%rsp
  8057e4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8057e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8057ec:	48 c1 e8 15          	shr    $0x15,%rax
  8057f0:	48 89 c2             	mov    %rax,%rdx
  8057f3:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8057fa:	01 00 00 
  8057fd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805801:	83 e0 01             	and    $0x1,%eax
  805804:	48 85 c0             	test   %rax,%rax
  805807:	75 07                	jne    805810 <pageref+0x34>
  805809:	b8 00 00 00 00       	mov    $0x0,%eax
  80580e:	eb 53                	jmp    805863 <pageref+0x87>
  805810:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805814:	48 c1 e8 0c          	shr    $0xc,%rax
  805818:	48 89 c2             	mov    %rax,%rdx
  80581b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805822:	01 00 00 
  805825:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805829:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80582d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805831:	83 e0 01             	and    $0x1,%eax
  805834:	48 85 c0             	test   %rax,%rax
  805837:	75 07                	jne    805840 <pageref+0x64>
  805839:	b8 00 00 00 00       	mov    $0x0,%eax
  80583e:	eb 23                	jmp    805863 <pageref+0x87>
  805840:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805844:	48 c1 e8 0c          	shr    $0xc,%rax
  805848:	48 89 c2             	mov    %rax,%rdx
  80584b:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  805852:	00 00 00 
  805855:	48 c1 e2 04          	shl    $0x4,%rdx
  805859:	48 01 d0             	add    %rdx,%rax
  80585c:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  805860:	0f b7 c0             	movzwl %ax,%eax
  805863:	c9                   	leaveq 
  805864:	c3                   	retq   
