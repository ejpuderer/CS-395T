
obj/user/testfdsharing:     file format elf64-x86-64


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
  80003c:	e8 fa 02 00 00       	callq  80033b <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	be 00 00 00 00       	mov    $0x0,%esi
  800057:	48 bf c0 4a 80 00 00 	movabs $0x804ac0,%rdi
  80005e:	00 00 00 
  800061:	48 b8 df 2f 80 00 00 	movabs $0x802fdf,%rax
  800068:	00 00 00 
  80006b:	ff d0                	callq  *%rax
  80006d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800070:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800074:	79 30                	jns    8000a6 <umain+0x63>
  800076:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800079:	89 c1                	mov    %eax,%ecx
  80007b:	48 ba c5 4a 80 00 00 	movabs $0x804ac5,%rdx
  800082:	00 00 00 
  800085:	be 0d 00 00 00       	mov    $0xd,%esi
  80008a:	48 bf d3 4a 80 00 00 	movabs $0x804ad3,%rdi
  800091:	00 00 00 
  800094:	b8 00 00 00 00       	mov    $0x0,%eax
  800099:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8000a0:	00 00 00 
  8000a3:	41 ff d0             	callq  *%r8
  8000a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000a9:	be 00 00 00 00       	mov    $0x0,%esi
  8000ae:	89 c7                	mov    %eax,%edi
  8000b0:	48 b8 27 2d 80 00 00 	movabs $0x802d27,%rax
  8000b7:	00 00 00 
  8000ba:	ff d0                	callq  *%rax
  8000bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000bf:	ba 00 02 00 00       	mov    $0x200,%edx
  8000c4:	48 be 20 82 80 00 00 	movabs $0x808220,%rsi
  8000cb:	00 00 00 
  8000ce:	89 c7                	mov    %eax,%edi
  8000d0:	48 b8 de 2b 80 00 00 	movabs $0x802bde,%rax
  8000d7:	00 00 00 
  8000da:	ff d0                	callq  *%rax
  8000dc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000df:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000e3:	7f 30                	jg     800115 <umain+0xd2>
  8000e5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000e8:	89 c1                	mov    %eax,%ecx
  8000ea:	48 ba eb 4a 80 00 00 	movabs $0x804aeb,%rdx
  8000f1:	00 00 00 
  8000f4:	be 10 00 00 00       	mov    $0x10,%esi
  8000f9:	48 bf d3 4a 80 00 00 	movabs $0x804ad3,%rdi
  800100:	00 00 00 
  800103:	b8 00 00 00 00       	mov    $0x0,%eax
  800108:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  80010f:	00 00 00 
  800112:	41 ff d0             	callq  *%r8
  800115:	48 b8 7c 23 80 00 00 	movabs $0x80237c,%rax
  80011c:	00 00 00 
  80011f:	ff d0                	callq  *%rax
  800121:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800124:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  800128:	79 30                	jns    80015a <umain+0x117>
  80012a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80012d:	89 c1                	mov    %eax,%ecx
  80012f:	48 ba f5 4a 80 00 00 	movabs $0x804af5,%rdx
  800136:	00 00 00 
  800139:	be 13 00 00 00       	mov    $0x13,%esi
  80013e:	48 bf d3 4a 80 00 00 	movabs $0x804ad3,%rdi
  800145:	00 00 00 
  800148:	b8 00 00 00 00       	mov    $0x0,%eax
  80014d:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  800154:	00 00 00 
  800157:	41 ff d0             	callq  *%r8
  80015a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80015e:	0f 85 36 01 00 00    	jne    80029a <umain+0x257>
  800164:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800167:	be 00 00 00 00       	mov    $0x0,%esi
  80016c:	89 c7                	mov    %eax,%edi
  80016e:	48 b8 27 2d 80 00 00 	movabs $0x802d27,%rax
  800175:	00 00 00 
  800178:	ff d0                	callq  *%rax
  80017a:	48 bf 00 4b 80 00 00 	movabs $0x804b00,%rdi
  800181:	00 00 00 
  800184:	b8 00 00 00 00       	mov    $0x0,%eax
  800189:	48 ba 1a 06 80 00 00 	movabs $0x80061a,%rdx
  800190:	00 00 00 
  800193:	ff d2                	callq  *%rdx
  800195:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800198:	ba 00 02 00 00       	mov    $0x200,%edx
  80019d:	48 be 20 80 80 00 00 	movabs $0x808020,%rsi
  8001a4:	00 00 00 
  8001a7:	89 c7                	mov    %eax,%edi
  8001a9:	48 b8 de 2b 80 00 00 	movabs $0x802bde,%rax
  8001b0:	00 00 00 
  8001b3:	ff d0                	callq  *%rax
  8001b5:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8001b8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001bb:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  8001be:	74 36                	je     8001f6 <umain+0x1b3>
  8001c0:	8b 55 f0             	mov    -0x10(%rbp),%edx
  8001c3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001c6:	41 89 d0             	mov    %edx,%r8d
  8001c9:	89 c1                	mov    %eax,%ecx
  8001cb:	48 ba 48 4b 80 00 00 	movabs $0x804b48,%rdx
  8001d2:	00 00 00 
  8001d5:	be 18 00 00 00       	mov    $0x18,%esi
  8001da:	48 bf d3 4a 80 00 00 	movabs $0x804ad3,%rdi
  8001e1:	00 00 00 
  8001e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8001e9:	49 b9 e1 03 80 00 00 	movabs $0x8003e1,%r9
  8001f0:	00 00 00 
  8001f3:	41 ff d1             	callq  *%r9
  8001f6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001f9:	48 98                	cltq   
  8001fb:	48 89 c2             	mov    %rax,%rdx
  8001fe:	48 be 20 80 80 00 00 	movabs $0x808020,%rsi
  800205:	00 00 00 
  800208:	48 bf 20 82 80 00 00 	movabs $0x808220,%rdi
  80020f:	00 00 00 
  800212:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  800219:	00 00 00 
  80021c:	ff d0                	callq  *%rax
  80021e:	85 c0                	test   %eax,%eax
  800220:	74 2a                	je     80024c <umain+0x209>
  800222:	48 ba 78 4b 80 00 00 	movabs $0x804b78,%rdx
  800229:	00 00 00 
  80022c:	be 1a 00 00 00       	mov    $0x1a,%esi
  800231:	48 bf d3 4a 80 00 00 	movabs $0x804ad3,%rdi
  800238:	00 00 00 
  80023b:	b8 00 00 00 00       	mov    $0x0,%eax
  800240:	48 b9 e1 03 80 00 00 	movabs $0x8003e1,%rcx
  800247:	00 00 00 
  80024a:	ff d1                	callq  *%rcx
  80024c:	48 bf ae 4b 80 00 00 	movabs $0x804bae,%rdi
  800253:	00 00 00 
  800256:	b8 00 00 00 00       	mov    $0x0,%eax
  80025b:	48 ba 1a 06 80 00 00 	movabs $0x80061a,%rdx
  800262:	00 00 00 
  800265:	ff d2                	callq  *%rdx
  800267:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80026a:	be 00 00 00 00       	mov    $0x0,%esi
  80026f:	89 c7                	mov    %eax,%edi
  800271:	48 b8 27 2d 80 00 00 	movabs $0x802d27,%rax
  800278:	00 00 00 
  80027b:	ff d0                	callq  *%rax
  80027d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800280:	89 c7                	mov    %eax,%edi
  800282:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  800289:	00 00 00 
  80028c:	ff d0                	callq  *%rax
  80028e:	48 b8 be 03 80 00 00 	movabs $0x8003be,%rax
  800295:	00 00 00 
  800298:	ff d0                	callq  *%rax
  80029a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80029d:	89 c7                	mov    %eax,%edi
  80029f:	48 b8 f1 43 80 00 00 	movabs $0x8043f1,%rax
  8002a6:	00 00 00 
  8002a9:	ff d0                	callq  *%rax
  8002ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002ae:	ba 00 02 00 00       	mov    $0x200,%edx
  8002b3:	48 be 20 80 80 00 00 	movabs $0x808020,%rsi
  8002ba:	00 00 00 
  8002bd:	89 c7                	mov    %eax,%edi
  8002bf:	48 b8 de 2b 80 00 00 	movabs $0x802bde,%rax
  8002c6:	00 00 00 
  8002c9:	ff d0                	callq  *%rax
  8002cb:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8002ce:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002d1:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  8002d4:	74 36                	je     80030c <umain+0x2c9>
  8002d6:	8b 55 f0             	mov    -0x10(%rbp),%edx
  8002d9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002dc:	41 89 d0             	mov    %edx,%r8d
  8002df:	89 c1                	mov    %eax,%ecx
  8002e1:	48 ba c8 4b 80 00 00 	movabs $0x804bc8,%rdx
  8002e8:	00 00 00 
  8002eb:	be 22 00 00 00       	mov    $0x22,%esi
  8002f0:	48 bf d3 4a 80 00 00 	movabs $0x804ad3,%rdi
  8002f7:	00 00 00 
  8002fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8002ff:	49 b9 e1 03 80 00 00 	movabs $0x8003e1,%r9
  800306:	00 00 00 
  800309:	41 ff d1             	callq  *%r9
  80030c:	48 bf eb 4b 80 00 00 	movabs $0x804beb,%rdi
  800313:	00 00 00 
  800316:	b8 00 00 00 00       	mov    $0x0,%eax
  80031b:	48 ba 1a 06 80 00 00 	movabs $0x80061a,%rdx
  800322:	00 00 00 
  800325:	ff d2                	callq  *%rdx
  800327:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80032a:	89 c7                	mov    %eax,%edi
  80032c:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  800333:	00 00 00 
  800336:	ff d0                	callq  *%rax
static __inline void read_gdtr (uint64_t *gdtbase, uint16_t *gdtlimit) __attribute__((always_inline));

static __inline void
breakpoint(void)
{
	__asm __volatile("int3");
  800338:	cc                   	int3   
  800339:	c9                   	leaveq 
  80033a:	c3                   	retq   

000000000080033b <libmain>:
  80033b:	55                   	push   %rbp
  80033c:	48 89 e5             	mov    %rsp,%rbp
  80033f:	48 83 ec 10          	sub    $0x10,%rsp
  800343:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800346:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80034a:	48 b8 82 1a 80 00 00 	movabs $0x801a82,%rax
  800351:	00 00 00 
  800354:	ff d0                	callq  *%rax
  800356:	25 ff 03 00 00       	and    $0x3ff,%eax
  80035b:	48 98                	cltq   
  80035d:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800364:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80036b:	00 00 00 
  80036e:	48 01 c2             	add    %rax,%rdx
  800371:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  800378:	00 00 00 
  80037b:	48 89 10             	mov    %rdx,(%rax)
  80037e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800382:	7e 14                	jle    800398 <libmain+0x5d>
  800384:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800388:	48 8b 10             	mov    (%rax),%rdx
  80038b:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800392:	00 00 00 
  800395:	48 89 10             	mov    %rdx,(%rax)
  800398:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80039c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80039f:	48 89 d6             	mov    %rdx,%rsi
  8003a2:	89 c7                	mov    %eax,%edi
  8003a4:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8003ab:	00 00 00 
  8003ae:	ff d0                	callq  *%rax
  8003b0:	48 b8 be 03 80 00 00 	movabs $0x8003be,%rax
  8003b7:	00 00 00 
  8003ba:	ff d0                	callq  *%rax
  8003bc:	c9                   	leaveq 
  8003bd:	c3                   	retq   

00000000008003be <exit>:
  8003be:	55                   	push   %rbp
  8003bf:	48 89 e5             	mov    %rsp,%rbp
  8003c2:	48 b8 32 29 80 00 00 	movabs $0x802932,%rax
  8003c9:	00 00 00 
  8003cc:	ff d0                	callq  *%rax
  8003ce:	bf 00 00 00 00       	mov    $0x0,%edi
  8003d3:	48 b8 3e 1a 80 00 00 	movabs $0x801a3e,%rax
  8003da:	00 00 00 
  8003dd:	ff d0                	callq  *%rax
  8003df:	5d                   	pop    %rbp
  8003e0:	c3                   	retq   

00000000008003e1 <_panic>:
  8003e1:	55                   	push   %rbp
  8003e2:	48 89 e5             	mov    %rsp,%rbp
  8003e5:	53                   	push   %rbx
  8003e6:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8003ed:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8003f4:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8003fa:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800401:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800408:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80040f:	84 c0                	test   %al,%al
  800411:	74 23                	je     800436 <_panic+0x55>
  800413:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80041a:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80041e:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800422:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800426:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80042a:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80042e:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800432:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800436:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80043d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800444:	00 00 00 
  800447:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80044e:	00 00 00 
  800451:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800455:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80045c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800463:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80046a:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800471:	00 00 00 
  800474:	48 8b 18             	mov    (%rax),%rbx
  800477:	48 b8 82 1a 80 00 00 	movabs $0x801a82,%rax
  80047e:	00 00 00 
  800481:	ff d0                	callq  *%rax
  800483:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800489:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800490:	41 89 c8             	mov    %ecx,%r8d
  800493:	48 89 d1             	mov    %rdx,%rcx
  800496:	48 89 da             	mov    %rbx,%rdx
  800499:	89 c6                	mov    %eax,%esi
  80049b:	48 bf 10 4c 80 00 00 	movabs $0x804c10,%rdi
  8004a2:	00 00 00 
  8004a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8004aa:	49 b9 1a 06 80 00 00 	movabs $0x80061a,%r9
  8004b1:	00 00 00 
  8004b4:	41 ff d1             	callq  *%r9
  8004b7:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8004be:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8004c5:	48 89 d6             	mov    %rdx,%rsi
  8004c8:	48 89 c7             	mov    %rax,%rdi
  8004cb:	48 b8 6e 05 80 00 00 	movabs $0x80056e,%rax
  8004d2:	00 00 00 
  8004d5:	ff d0                	callq  *%rax
  8004d7:	48 bf 33 4c 80 00 00 	movabs $0x804c33,%rdi
  8004de:	00 00 00 
  8004e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8004e6:	48 ba 1a 06 80 00 00 	movabs $0x80061a,%rdx
  8004ed:	00 00 00 
  8004f0:	ff d2                	callq  *%rdx
  8004f2:	cc                   	int3   
  8004f3:	eb fd                	jmp    8004f2 <_panic+0x111>

00000000008004f5 <putch>:
  8004f5:	55                   	push   %rbp
  8004f6:	48 89 e5             	mov    %rsp,%rbp
  8004f9:	48 83 ec 10          	sub    $0x10,%rsp
  8004fd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800500:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800504:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800508:	8b 00                	mov    (%rax),%eax
  80050a:	8d 48 01             	lea    0x1(%rax),%ecx
  80050d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800511:	89 0a                	mov    %ecx,(%rdx)
  800513:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800516:	89 d1                	mov    %edx,%ecx
  800518:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80051c:	48 98                	cltq   
  80051e:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800522:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800526:	8b 00                	mov    (%rax),%eax
  800528:	3d ff 00 00 00       	cmp    $0xff,%eax
  80052d:	75 2c                	jne    80055b <putch+0x66>
  80052f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800533:	8b 00                	mov    (%rax),%eax
  800535:	48 98                	cltq   
  800537:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80053b:	48 83 c2 08          	add    $0x8,%rdx
  80053f:	48 89 c6             	mov    %rax,%rsi
  800542:	48 89 d7             	mov    %rdx,%rdi
  800545:	48 b8 b6 19 80 00 00 	movabs $0x8019b6,%rax
  80054c:	00 00 00 
  80054f:	ff d0                	callq  *%rax
  800551:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800555:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80055b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80055f:	8b 40 04             	mov    0x4(%rax),%eax
  800562:	8d 50 01             	lea    0x1(%rax),%edx
  800565:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800569:	89 50 04             	mov    %edx,0x4(%rax)
  80056c:	c9                   	leaveq 
  80056d:	c3                   	retq   

000000000080056e <vcprintf>:
  80056e:	55                   	push   %rbp
  80056f:	48 89 e5             	mov    %rsp,%rbp
  800572:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800579:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800580:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800587:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80058e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800595:	48 8b 0a             	mov    (%rdx),%rcx
  800598:	48 89 08             	mov    %rcx,(%rax)
  80059b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80059f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005a3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005a7:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005ab:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8005b2:	00 00 00 
  8005b5:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8005bc:	00 00 00 
  8005bf:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8005c6:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8005cd:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8005d4:	48 89 c6             	mov    %rax,%rsi
  8005d7:	48 bf f5 04 80 00 00 	movabs $0x8004f5,%rdi
  8005de:	00 00 00 
  8005e1:	48 b8 cd 09 80 00 00 	movabs $0x8009cd,%rax
  8005e8:	00 00 00 
  8005eb:	ff d0                	callq  *%rax
  8005ed:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8005f3:	48 98                	cltq   
  8005f5:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8005fc:	48 83 c2 08          	add    $0x8,%rdx
  800600:	48 89 c6             	mov    %rax,%rsi
  800603:	48 89 d7             	mov    %rdx,%rdi
  800606:	48 b8 b6 19 80 00 00 	movabs $0x8019b6,%rax
  80060d:	00 00 00 
  800610:	ff d0                	callq  *%rax
  800612:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800618:	c9                   	leaveq 
  800619:	c3                   	retq   

000000000080061a <cprintf>:
  80061a:	55                   	push   %rbp
  80061b:	48 89 e5             	mov    %rsp,%rbp
  80061e:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800625:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80062c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800633:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80063a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800641:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800648:	84 c0                	test   %al,%al
  80064a:	74 20                	je     80066c <cprintf+0x52>
  80064c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800650:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800654:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800658:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80065c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800660:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800664:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800668:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80066c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800673:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80067a:	00 00 00 
  80067d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800684:	00 00 00 
  800687:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80068b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800692:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800699:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8006a0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8006a7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8006ae:	48 8b 0a             	mov    (%rdx),%rcx
  8006b1:	48 89 08             	mov    %rcx,(%rax)
  8006b4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006b8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006bc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8006c0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8006c4:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8006cb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8006d2:	48 89 d6             	mov    %rdx,%rsi
  8006d5:	48 89 c7             	mov    %rax,%rdi
  8006d8:	48 b8 6e 05 80 00 00 	movabs $0x80056e,%rax
  8006df:	00 00 00 
  8006e2:	ff d0                	callq  *%rax
  8006e4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8006ea:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8006f0:	c9                   	leaveq 
  8006f1:	c3                   	retq   

00000000008006f2 <printnum>:
  8006f2:	55                   	push   %rbp
  8006f3:	48 89 e5             	mov    %rsp,%rbp
  8006f6:	53                   	push   %rbx
  8006f7:	48 83 ec 38          	sub    $0x38,%rsp
  8006fb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006ff:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800703:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800707:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80070a:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80070e:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800712:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800715:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800719:	77 3b                	ja     800756 <printnum+0x64>
  80071b:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80071e:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800722:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800725:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800729:	ba 00 00 00 00       	mov    $0x0,%edx
  80072e:	48 f7 f3             	div    %rbx
  800731:	48 89 c2             	mov    %rax,%rdx
  800734:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800737:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80073a:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80073e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800742:	41 89 f9             	mov    %edi,%r9d
  800745:	48 89 c7             	mov    %rax,%rdi
  800748:	48 b8 f2 06 80 00 00 	movabs $0x8006f2,%rax
  80074f:	00 00 00 
  800752:	ff d0                	callq  *%rax
  800754:	eb 1e                	jmp    800774 <printnum+0x82>
  800756:	eb 12                	jmp    80076a <printnum+0x78>
  800758:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80075c:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80075f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800763:	48 89 ce             	mov    %rcx,%rsi
  800766:	89 d7                	mov    %edx,%edi
  800768:	ff d0                	callq  *%rax
  80076a:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  80076e:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800772:	7f e4                	jg     800758 <printnum+0x66>
  800774:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800777:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80077b:	ba 00 00 00 00       	mov    $0x0,%edx
  800780:	48 f7 f1             	div    %rcx
  800783:	48 89 d0             	mov    %rdx,%rax
  800786:	48 ba 30 4e 80 00 00 	movabs $0x804e30,%rdx
  80078d:	00 00 00 
  800790:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800794:	0f be d0             	movsbl %al,%edx
  800797:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80079b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80079f:	48 89 ce             	mov    %rcx,%rsi
  8007a2:	89 d7                	mov    %edx,%edi
  8007a4:	ff d0                	callq  *%rax
  8007a6:	48 83 c4 38          	add    $0x38,%rsp
  8007aa:	5b                   	pop    %rbx
  8007ab:	5d                   	pop    %rbp
  8007ac:	c3                   	retq   

00000000008007ad <getuint>:
  8007ad:	55                   	push   %rbp
  8007ae:	48 89 e5             	mov    %rsp,%rbp
  8007b1:	48 83 ec 1c          	sub    $0x1c,%rsp
  8007b5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007b9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007bc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007c0:	7e 52                	jle    800814 <getuint+0x67>
  8007c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c6:	8b 00                	mov    (%rax),%eax
  8007c8:	83 f8 30             	cmp    $0x30,%eax
  8007cb:	73 24                	jae    8007f1 <getuint+0x44>
  8007cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d9:	8b 00                	mov    (%rax),%eax
  8007db:	89 c0                	mov    %eax,%eax
  8007dd:	48 01 d0             	add    %rdx,%rax
  8007e0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007e4:	8b 12                	mov    (%rdx),%edx
  8007e6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007e9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ed:	89 0a                	mov    %ecx,(%rdx)
  8007ef:	eb 17                	jmp    800808 <getuint+0x5b>
  8007f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007f5:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007f9:	48 89 d0             	mov    %rdx,%rax
  8007fc:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800800:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800804:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800808:	48 8b 00             	mov    (%rax),%rax
  80080b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80080f:	e9 a3 00 00 00       	jmpq   8008b7 <getuint+0x10a>
  800814:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800818:	74 4f                	je     800869 <getuint+0xbc>
  80081a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081e:	8b 00                	mov    (%rax),%eax
  800820:	83 f8 30             	cmp    $0x30,%eax
  800823:	73 24                	jae    800849 <getuint+0x9c>
  800825:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800829:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80082d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800831:	8b 00                	mov    (%rax),%eax
  800833:	89 c0                	mov    %eax,%eax
  800835:	48 01 d0             	add    %rdx,%rax
  800838:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083c:	8b 12                	mov    (%rdx),%edx
  80083e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800841:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800845:	89 0a                	mov    %ecx,(%rdx)
  800847:	eb 17                	jmp    800860 <getuint+0xb3>
  800849:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80084d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800851:	48 89 d0             	mov    %rdx,%rax
  800854:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800858:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80085c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800860:	48 8b 00             	mov    (%rax),%rax
  800863:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800867:	eb 4e                	jmp    8008b7 <getuint+0x10a>
  800869:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80086d:	8b 00                	mov    (%rax),%eax
  80086f:	83 f8 30             	cmp    $0x30,%eax
  800872:	73 24                	jae    800898 <getuint+0xeb>
  800874:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800878:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80087c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800880:	8b 00                	mov    (%rax),%eax
  800882:	89 c0                	mov    %eax,%eax
  800884:	48 01 d0             	add    %rdx,%rax
  800887:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80088b:	8b 12                	mov    (%rdx),%edx
  80088d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800890:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800894:	89 0a                	mov    %ecx,(%rdx)
  800896:	eb 17                	jmp    8008af <getuint+0x102>
  800898:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80089c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008a0:	48 89 d0             	mov    %rdx,%rax
  8008a3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008ab:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008af:	8b 00                	mov    (%rax),%eax
  8008b1:	89 c0                	mov    %eax,%eax
  8008b3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008bb:	c9                   	leaveq 
  8008bc:	c3                   	retq   

00000000008008bd <getint>:
  8008bd:	55                   	push   %rbp
  8008be:	48 89 e5             	mov    %rsp,%rbp
  8008c1:	48 83 ec 1c          	sub    $0x1c,%rsp
  8008c5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8008c9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8008cc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8008d0:	7e 52                	jle    800924 <getint+0x67>
  8008d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d6:	8b 00                	mov    (%rax),%eax
  8008d8:	83 f8 30             	cmp    $0x30,%eax
  8008db:	73 24                	jae    800901 <getint+0x44>
  8008dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e9:	8b 00                	mov    (%rax),%eax
  8008eb:	89 c0                	mov    %eax,%eax
  8008ed:	48 01 d0             	add    %rdx,%rax
  8008f0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008f4:	8b 12                	mov    (%rdx),%edx
  8008f6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008f9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008fd:	89 0a                	mov    %ecx,(%rdx)
  8008ff:	eb 17                	jmp    800918 <getint+0x5b>
  800901:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800905:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800909:	48 89 d0             	mov    %rdx,%rax
  80090c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800910:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800914:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800918:	48 8b 00             	mov    (%rax),%rax
  80091b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80091f:	e9 a3 00 00 00       	jmpq   8009c7 <getint+0x10a>
  800924:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800928:	74 4f                	je     800979 <getint+0xbc>
  80092a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80092e:	8b 00                	mov    (%rax),%eax
  800930:	83 f8 30             	cmp    $0x30,%eax
  800933:	73 24                	jae    800959 <getint+0x9c>
  800935:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800939:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80093d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800941:	8b 00                	mov    (%rax),%eax
  800943:	89 c0                	mov    %eax,%eax
  800945:	48 01 d0             	add    %rdx,%rax
  800948:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80094c:	8b 12                	mov    (%rdx),%edx
  80094e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800951:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800955:	89 0a                	mov    %ecx,(%rdx)
  800957:	eb 17                	jmp    800970 <getint+0xb3>
  800959:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80095d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800961:	48 89 d0             	mov    %rdx,%rax
  800964:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800968:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80096c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800970:	48 8b 00             	mov    (%rax),%rax
  800973:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800977:	eb 4e                	jmp    8009c7 <getint+0x10a>
  800979:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80097d:	8b 00                	mov    (%rax),%eax
  80097f:	83 f8 30             	cmp    $0x30,%eax
  800982:	73 24                	jae    8009a8 <getint+0xeb>
  800984:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800988:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80098c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800990:	8b 00                	mov    (%rax),%eax
  800992:	89 c0                	mov    %eax,%eax
  800994:	48 01 d0             	add    %rdx,%rax
  800997:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80099b:	8b 12                	mov    (%rdx),%edx
  80099d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009a0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009a4:	89 0a                	mov    %ecx,(%rdx)
  8009a6:	eb 17                	jmp    8009bf <getint+0x102>
  8009a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009ac:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009b0:	48 89 d0             	mov    %rdx,%rax
  8009b3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8009b7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009bb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009bf:	8b 00                	mov    (%rax),%eax
  8009c1:	48 98                	cltq   
  8009c3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009cb:	c9                   	leaveq 
  8009cc:	c3                   	retq   

00000000008009cd <vprintfmt>:
  8009cd:	55                   	push   %rbp
  8009ce:	48 89 e5             	mov    %rsp,%rbp
  8009d1:	41 54                	push   %r12
  8009d3:	53                   	push   %rbx
  8009d4:	48 83 ec 60          	sub    $0x60,%rsp
  8009d8:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8009dc:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8009e0:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009e4:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8009e8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8009ec:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8009f0:	48 8b 0a             	mov    (%rdx),%rcx
  8009f3:	48 89 08             	mov    %rcx,(%rax)
  8009f6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8009fa:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8009fe:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800a02:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800a06:	eb 17                	jmp    800a1f <vprintfmt+0x52>
  800a08:	85 db                	test   %ebx,%ebx
  800a0a:	0f 84 cc 04 00 00    	je     800edc <vprintfmt+0x50f>
  800a10:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a14:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a18:	48 89 d6             	mov    %rdx,%rsi
  800a1b:	89 df                	mov    %ebx,%edi
  800a1d:	ff d0                	callq  *%rax
  800a1f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a23:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a27:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a2b:	0f b6 00             	movzbl (%rax),%eax
  800a2e:	0f b6 d8             	movzbl %al,%ebx
  800a31:	83 fb 25             	cmp    $0x25,%ebx
  800a34:	75 d2                	jne    800a08 <vprintfmt+0x3b>
  800a36:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a3a:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a41:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a48:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a4f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800a56:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a5a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a5e:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a62:	0f b6 00             	movzbl (%rax),%eax
  800a65:	0f b6 d8             	movzbl %al,%ebx
  800a68:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800a6b:	83 f8 55             	cmp    $0x55,%eax
  800a6e:	0f 87 34 04 00 00    	ja     800ea8 <vprintfmt+0x4db>
  800a74:	89 c0                	mov    %eax,%eax
  800a76:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800a7d:	00 
  800a7e:	48 b8 58 4e 80 00 00 	movabs $0x804e58,%rax
  800a85:	00 00 00 
  800a88:	48 01 d0             	add    %rdx,%rax
  800a8b:	48 8b 00             	mov    (%rax),%rax
  800a8e:	ff e0                	jmpq   *%rax
  800a90:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800a94:	eb c0                	jmp    800a56 <vprintfmt+0x89>
  800a96:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800a9a:	eb ba                	jmp    800a56 <vprintfmt+0x89>
  800a9c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800aa3:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800aa6:	89 d0                	mov    %edx,%eax
  800aa8:	c1 e0 02             	shl    $0x2,%eax
  800aab:	01 d0                	add    %edx,%eax
  800aad:	01 c0                	add    %eax,%eax
  800aaf:	01 d8                	add    %ebx,%eax
  800ab1:	83 e8 30             	sub    $0x30,%eax
  800ab4:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800ab7:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800abb:	0f b6 00             	movzbl (%rax),%eax
  800abe:	0f be d8             	movsbl %al,%ebx
  800ac1:	83 fb 2f             	cmp    $0x2f,%ebx
  800ac4:	7e 0c                	jle    800ad2 <vprintfmt+0x105>
  800ac6:	83 fb 39             	cmp    $0x39,%ebx
  800ac9:	7f 07                	jg     800ad2 <vprintfmt+0x105>
  800acb:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800ad0:	eb d1                	jmp    800aa3 <vprintfmt+0xd6>
  800ad2:	eb 58                	jmp    800b2c <vprintfmt+0x15f>
  800ad4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ad7:	83 f8 30             	cmp    $0x30,%eax
  800ada:	73 17                	jae    800af3 <vprintfmt+0x126>
  800adc:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ae0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ae3:	89 c0                	mov    %eax,%eax
  800ae5:	48 01 d0             	add    %rdx,%rax
  800ae8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800aeb:	83 c2 08             	add    $0x8,%edx
  800aee:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800af1:	eb 0f                	jmp    800b02 <vprintfmt+0x135>
  800af3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800af7:	48 89 d0             	mov    %rdx,%rax
  800afa:	48 83 c2 08          	add    $0x8,%rdx
  800afe:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b02:	8b 00                	mov    (%rax),%eax
  800b04:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b07:	eb 23                	jmp    800b2c <vprintfmt+0x15f>
  800b09:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b0d:	79 0c                	jns    800b1b <vprintfmt+0x14e>
  800b0f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800b16:	e9 3b ff ff ff       	jmpq   800a56 <vprintfmt+0x89>
  800b1b:	e9 36 ff ff ff       	jmpq   800a56 <vprintfmt+0x89>
  800b20:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800b27:	e9 2a ff ff ff       	jmpq   800a56 <vprintfmt+0x89>
  800b2c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b30:	79 12                	jns    800b44 <vprintfmt+0x177>
  800b32:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b35:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b38:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b3f:	e9 12 ff ff ff       	jmpq   800a56 <vprintfmt+0x89>
  800b44:	e9 0d ff ff ff       	jmpq   800a56 <vprintfmt+0x89>
  800b49:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b4d:	e9 04 ff ff ff       	jmpq   800a56 <vprintfmt+0x89>
  800b52:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b55:	83 f8 30             	cmp    $0x30,%eax
  800b58:	73 17                	jae    800b71 <vprintfmt+0x1a4>
  800b5a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b5e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b61:	89 c0                	mov    %eax,%eax
  800b63:	48 01 d0             	add    %rdx,%rax
  800b66:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b69:	83 c2 08             	add    $0x8,%edx
  800b6c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b6f:	eb 0f                	jmp    800b80 <vprintfmt+0x1b3>
  800b71:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b75:	48 89 d0             	mov    %rdx,%rax
  800b78:	48 83 c2 08          	add    $0x8,%rdx
  800b7c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b80:	8b 10                	mov    (%rax),%edx
  800b82:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b86:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b8a:	48 89 ce             	mov    %rcx,%rsi
  800b8d:	89 d7                	mov    %edx,%edi
  800b8f:	ff d0                	callq  *%rax
  800b91:	e9 40 03 00 00       	jmpq   800ed6 <vprintfmt+0x509>
  800b96:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b99:	83 f8 30             	cmp    $0x30,%eax
  800b9c:	73 17                	jae    800bb5 <vprintfmt+0x1e8>
  800b9e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ba2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ba5:	89 c0                	mov    %eax,%eax
  800ba7:	48 01 d0             	add    %rdx,%rax
  800baa:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bad:	83 c2 08             	add    $0x8,%edx
  800bb0:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bb3:	eb 0f                	jmp    800bc4 <vprintfmt+0x1f7>
  800bb5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800bb9:	48 89 d0             	mov    %rdx,%rax
  800bbc:	48 83 c2 08          	add    $0x8,%rdx
  800bc0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bc4:	8b 18                	mov    (%rax),%ebx
  800bc6:	85 db                	test   %ebx,%ebx
  800bc8:	79 02                	jns    800bcc <vprintfmt+0x1ff>
  800bca:	f7 db                	neg    %ebx
  800bcc:	83 fb 15             	cmp    $0x15,%ebx
  800bcf:	7f 16                	jg     800be7 <vprintfmt+0x21a>
  800bd1:	48 b8 80 4d 80 00 00 	movabs $0x804d80,%rax
  800bd8:	00 00 00 
  800bdb:	48 63 d3             	movslq %ebx,%rdx
  800bde:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800be2:	4d 85 e4             	test   %r12,%r12
  800be5:	75 2e                	jne    800c15 <vprintfmt+0x248>
  800be7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800beb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bef:	89 d9                	mov    %ebx,%ecx
  800bf1:	48 ba 41 4e 80 00 00 	movabs $0x804e41,%rdx
  800bf8:	00 00 00 
  800bfb:	48 89 c7             	mov    %rax,%rdi
  800bfe:	b8 00 00 00 00       	mov    $0x0,%eax
  800c03:	49 b8 e5 0e 80 00 00 	movabs $0x800ee5,%r8
  800c0a:	00 00 00 
  800c0d:	41 ff d0             	callq  *%r8
  800c10:	e9 c1 02 00 00       	jmpq   800ed6 <vprintfmt+0x509>
  800c15:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c19:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c1d:	4c 89 e1             	mov    %r12,%rcx
  800c20:	48 ba 4a 4e 80 00 00 	movabs $0x804e4a,%rdx
  800c27:	00 00 00 
  800c2a:	48 89 c7             	mov    %rax,%rdi
  800c2d:	b8 00 00 00 00       	mov    $0x0,%eax
  800c32:	49 b8 e5 0e 80 00 00 	movabs $0x800ee5,%r8
  800c39:	00 00 00 
  800c3c:	41 ff d0             	callq  *%r8
  800c3f:	e9 92 02 00 00       	jmpq   800ed6 <vprintfmt+0x509>
  800c44:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c47:	83 f8 30             	cmp    $0x30,%eax
  800c4a:	73 17                	jae    800c63 <vprintfmt+0x296>
  800c4c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c50:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c53:	89 c0                	mov    %eax,%eax
  800c55:	48 01 d0             	add    %rdx,%rax
  800c58:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c5b:	83 c2 08             	add    $0x8,%edx
  800c5e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c61:	eb 0f                	jmp    800c72 <vprintfmt+0x2a5>
  800c63:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c67:	48 89 d0             	mov    %rdx,%rax
  800c6a:	48 83 c2 08          	add    $0x8,%rdx
  800c6e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c72:	4c 8b 20             	mov    (%rax),%r12
  800c75:	4d 85 e4             	test   %r12,%r12
  800c78:	75 0a                	jne    800c84 <vprintfmt+0x2b7>
  800c7a:	49 bc 4d 4e 80 00 00 	movabs $0x804e4d,%r12
  800c81:	00 00 00 
  800c84:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c88:	7e 3f                	jle    800cc9 <vprintfmt+0x2fc>
  800c8a:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800c8e:	74 39                	je     800cc9 <vprintfmt+0x2fc>
  800c90:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c93:	48 98                	cltq   
  800c95:	48 89 c6             	mov    %rax,%rsi
  800c98:	4c 89 e7             	mov    %r12,%rdi
  800c9b:	48 b8 91 11 80 00 00 	movabs $0x801191,%rax
  800ca2:	00 00 00 
  800ca5:	ff d0                	callq  *%rax
  800ca7:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800caa:	eb 17                	jmp    800cc3 <vprintfmt+0x2f6>
  800cac:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800cb0:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800cb4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cb8:	48 89 ce             	mov    %rcx,%rsi
  800cbb:	89 d7                	mov    %edx,%edi
  800cbd:	ff d0                	callq  *%rax
  800cbf:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800cc3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cc7:	7f e3                	jg     800cac <vprintfmt+0x2df>
  800cc9:	eb 37                	jmp    800d02 <vprintfmt+0x335>
  800ccb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800ccf:	74 1e                	je     800cef <vprintfmt+0x322>
  800cd1:	83 fb 1f             	cmp    $0x1f,%ebx
  800cd4:	7e 05                	jle    800cdb <vprintfmt+0x30e>
  800cd6:	83 fb 7e             	cmp    $0x7e,%ebx
  800cd9:	7e 14                	jle    800cef <vprintfmt+0x322>
  800cdb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cdf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ce3:	48 89 d6             	mov    %rdx,%rsi
  800ce6:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800ceb:	ff d0                	callq  *%rax
  800ced:	eb 0f                	jmp    800cfe <vprintfmt+0x331>
  800cef:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cf3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cf7:	48 89 d6             	mov    %rdx,%rsi
  800cfa:	89 df                	mov    %ebx,%edi
  800cfc:	ff d0                	callq  *%rax
  800cfe:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d02:	4c 89 e0             	mov    %r12,%rax
  800d05:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800d09:	0f b6 00             	movzbl (%rax),%eax
  800d0c:	0f be d8             	movsbl %al,%ebx
  800d0f:	85 db                	test   %ebx,%ebx
  800d11:	74 10                	je     800d23 <vprintfmt+0x356>
  800d13:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d17:	78 b2                	js     800ccb <vprintfmt+0x2fe>
  800d19:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800d1d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d21:	79 a8                	jns    800ccb <vprintfmt+0x2fe>
  800d23:	eb 16                	jmp    800d3b <vprintfmt+0x36e>
  800d25:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d29:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d2d:	48 89 d6             	mov    %rdx,%rsi
  800d30:	bf 20 00 00 00       	mov    $0x20,%edi
  800d35:	ff d0                	callq  *%rax
  800d37:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d3b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d3f:	7f e4                	jg     800d25 <vprintfmt+0x358>
  800d41:	e9 90 01 00 00       	jmpq   800ed6 <vprintfmt+0x509>
  800d46:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d4a:	be 03 00 00 00       	mov    $0x3,%esi
  800d4f:	48 89 c7             	mov    %rax,%rdi
  800d52:	48 b8 bd 08 80 00 00 	movabs $0x8008bd,%rax
  800d59:	00 00 00 
  800d5c:	ff d0                	callq  *%rax
  800d5e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d66:	48 85 c0             	test   %rax,%rax
  800d69:	79 1d                	jns    800d88 <vprintfmt+0x3bb>
  800d6b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d6f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d73:	48 89 d6             	mov    %rdx,%rsi
  800d76:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800d7b:	ff d0                	callq  *%rax
  800d7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d81:	48 f7 d8             	neg    %rax
  800d84:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d88:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d8f:	e9 d5 00 00 00       	jmpq   800e69 <vprintfmt+0x49c>
  800d94:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d98:	be 03 00 00 00       	mov    $0x3,%esi
  800d9d:	48 89 c7             	mov    %rax,%rdi
  800da0:	48 b8 ad 07 80 00 00 	movabs $0x8007ad,%rax
  800da7:	00 00 00 
  800daa:	ff d0                	callq  *%rax
  800dac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800db0:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800db7:	e9 ad 00 00 00       	jmpq   800e69 <vprintfmt+0x49c>
  800dbc:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800dc0:	be 03 00 00 00       	mov    $0x3,%esi
  800dc5:	48 89 c7             	mov    %rax,%rdi
  800dc8:	48 b8 ad 07 80 00 00 	movabs $0x8007ad,%rax
  800dcf:	00 00 00 
  800dd2:	ff d0                	callq  *%rax
  800dd4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dd8:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800ddf:	e9 85 00 00 00       	jmpq   800e69 <vprintfmt+0x49c>
  800de4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800de8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dec:	48 89 d6             	mov    %rdx,%rsi
  800def:	bf 30 00 00 00       	mov    $0x30,%edi
  800df4:	ff d0                	callq  *%rax
  800df6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dfa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dfe:	48 89 d6             	mov    %rdx,%rsi
  800e01:	bf 78 00 00 00       	mov    $0x78,%edi
  800e06:	ff d0                	callq  *%rax
  800e08:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e0b:	83 f8 30             	cmp    $0x30,%eax
  800e0e:	73 17                	jae    800e27 <vprintfmt+0x45a>
  800e10:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e14:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e17:	89 c0                	mov    %eax,%eax
  800e19:	48 01 d0             	add    %rdx,%rax
  800e1c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e1f:	83 c2 08             	add    $0x8,%edx
  800e22:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e25:	eb 0f                	jmp    800e36 <vprintfmt+0x469>
  800e27:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e2b:	48 89 d0             	mov    %rdx,%rax
  800e2e:	48 83 c2 08          	add    $0x8,%rdx
  800e32:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e36:	48 8b 00             	mov    (%rax),%rax
  800e39:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e3d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e44:	eb 23                	jmp    800e69 <vprintfmt+0x49c>
  800e46:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e4a:	be 03 00 00 00       	mov    $0x3,%esi
  800e4f:	48 89 c7             	mov    %rax,%rdi
  800e52:	48 b8 ad 07 80 00 00 	movabs $0x8007ad,%rax
  800e59:	00 00 00 
  800e5c:	ff d0                	callq  *%rax
  800e5e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e62:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e69:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800e6e:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800e71:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800e74:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e78:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e7c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e80:	45 89 c1             	mov    %r8d,%r9d
  800e83:	41 89 f8             	mov    %edi,%r8d
  800e86:	48 89 c7             	mov    %rax,%rdi
  800e89:	48 b8 f2 06 80 00 00 	movabs $0x8006f2,%rax
  800e90:	00 00 00 
  800e93:	ff d0                	callq  *%rax
  800e95:	eb 3f                	jmp    800ed6 <vprintfmt+0x509>
  800e97:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e9b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e9f:	48 89 d6             	mov    %rdx,%rsi
  800ea2:	89 df                	mov    %ebx,%edi
  800ea4:	ff d0                	callq  *%rax
  800ea6:	eb 2e                	jmp    800ed6 <vprintfmt+0x509>
  800ea8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800eac:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800eb0:	48 89 d6             	mov    %rdx,%rsi
  800eb3:	bf 25 00 00 00       	mov    $0x25,%edi
  800eb8:	ff d0                	callq  *%rax
  800eba:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800ebf:	eb 05                	jmp    800ec6 <vprintfmt+0x4f9>
  800ec1:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800ec6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800eca:	48 83 e8 01          	sub    $0x1,%rax
  800ece:	0f b6 00             	movzbl (%rax),%eax
  800ed1:	3c 25                	cmp    $0x25,%al
  800ed3:	75 ec                	jne    800ec1 <vprintfmt+0x4f4>
  800ed5:	90                   	nop
  800ed6:	90                   	nop
  800ed7:	e9 43 fb ff ff       	jmpq   800a1f <vprintfmt+0x52>
  800edc:	48 83 c4 60          	add    $0x60,%rsp
  800ee0:	5b                   	pop    %rbx
  800ee1:	41 5c                	pop    %r12
  800ee3:	5d                   	pop    %rbp
  800ee4:	c3                   	retq   

0000000000800ee5 <printfmt>:
  800ee5:	55                   	push   %rbp
  800ee6:	48 89 e5             	mov    %rsp,%rbp
  800ee9:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800ef0:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800ef7:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800efe:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f05:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f0c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f13:	84 c0                	test   %al,%al
  800f15:	74 20                	je     800f37 <printfmt+0x52>
  800f17:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f1b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f1f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f23:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f27:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f2b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f2f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f33:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f37:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800f3e:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f45:	00 00 00 
  800f48:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f4f:	00 00 00 
  800f52:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f56:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f5d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f64:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800f6b:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800f72:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800f79:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800f80:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800f87:	48 89 c7             	mov    %rax,%rdi
  800f8a:	48 b8 cd 09 80 00 00 	movabs $0x8009cd,%rax
  800f91:	00 00 00 
  800f94:	ff d0                	callq  *%rax
  800f96:	c9                   	leaveq 
  800f97:	c3                   	retq   

0000000000800f98 <sprintputch>:
  800f98:	55                   	push   %rbp
  800f99:	48 89 e5             	mov    %rsp,%rbp
  800f9c:	48 83 ec 10          	sub    $0x10,%rsp
  800fa0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800fa3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800fa7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fab:	8b 40 10             	mov    0x10(%rax),%eax
  800fae:	8d 50 01             	lea    0x1(%rax),%edx
  800fb1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fb5:	89 50 10             	mov    %edx,0x10(%rax)
  800fb8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fbc:	48 8b 10             	mov    (%rax),%rdx
  800fbf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fc3:	48 8b 40 08          	mov    0x8(%rax),%rax
  800fc7:	48 39 c2             	cmp    %rax,%rdx
  800fca:	73 17                	jae    800fe3 <sprintputch+0x4b>
  800fcc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fd0:	48 8b 00             	mov    (%rax),%rax
  800fd3:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800fd7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800fdb:	48 89 0a             	mov    %rcx,(%rdx)
  800fde:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800fe1:	88 10                	mov    %dl,(%rax)
  800fe3:	c9                   	leaveq 
  800fe4:	c3                   	retq   

0000000000800fe5 <vsnprintf>:
  800fe5:	55                   	push   %rbp
  800fe6:	48 89 e5             	mov    %rsp,%rbp
  800fe9:	48 83 ec 50          	sub    $0x50,%rsp
  800fed:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800ff1:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800ff4:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800ff8:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800ffc:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801000:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801004:	48 8b 0a             	mov    (%rdx),%rcx
  801007:	48 89 08             	mov    %rcx,(%rax)
  80100a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80100e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801012:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801016:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80101a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80101e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801022:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801025:	48 98                	cltq   
  801027:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80102b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80102f:	48 01 d0             	add    %rdx,%rax
  801032:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801036:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80103d:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801042:	74 06                	je     80104a <vsnprintf+0x65>
  801044:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801048:	7f 07                	jg     801051 <vsnprintf+0x6c>
  80104a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80104f:	eb 2f                	jmp    801080 <vsnprintf+0x9b>
  801051:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801055:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801059:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80105d:	48 89 c6             	mov    %rax,%rsi
  801060:	48 bf 98 0f 80 00 00 	movabs $0x800f98,%rdi
  801067:	00 00 00 
  80106a:	48 b8 cd 09 80 00 00 	movabs $0x8009cd,%rax
  801071:	00 00 00 
  801074:	ff d0                	callq  *%rax
  801076:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80107a:	c6 00 00             	movb   $0x0,(%rax)
  80107d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801080:	c9                   	leaveq 
  801081:	c3                   	retq   

0000000000801082 <snprintf>:
  801082:	55                   	push   %rbp
  801083:	48 89 e5             	mov    %rsp,%rbp
  801086:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80108d:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801094:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  80109a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010a1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010a8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010af:	84 c0                	test   %al,%al
  8010b1:	74 20                	je     8010d3 <snprintf+0x51>
  8010b3:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8010b7:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010bb:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8010bf:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8010c3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8010c7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8010cb:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8010cf:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8010d3:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8010da:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8010e1:	00 00 00 
  8010e4:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8010eb:	00 00 00 
  8010ee:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8010f2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8010f9:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801100:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801107:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80110e:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801115:	48 8b 0a             	mov    (%rdx),%rcx
  801118:	48 89 08             	mov    %rcx,(%rax)
  80111b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80111f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801123:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801127:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80112b:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801132:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801139:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80113f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801146:	48 89 c7             	mov    %rax,%rdi
  801149:	48 b8 e5 0f 80 00 00 	movabs $0x800fe5,%rax
  801150:	00 00 00 
  801153:	ff d0                	callq  *%rax
  801155:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80115b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801161:	c9                   	leaveq 
  801162:	c3                   	retq   

0000000000801163 <strlen>:
  801163:	55                   	push   %rbp
  801164:	48 89 e5             	mov    %rsp,%rbp
  801167:	48 83 ec 18          	sub    $0x18,%rsp
  80116b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80116f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801176:	eb 09                	jmp    801181 <strlen+0x1e>
  801178:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80117c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801181:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801185:	0f b6 00             	movzbl (%rax),%eax
  801188:	84 c0                	test   %al,%al
  80118a:	75 ec                	jne    801178 <strlen+0x15>
  80118c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80118f:	c9                   	leaveq 
  801190:	c3                   	retq   

0000000000801191 <strnlen>:
  801191:	55                   	push   %rbp
  801192:	48 89 e5             	mov    %rsp,%rbp
  801195:	48 83 ec 20          	sub    $0x20,%rsp
  801199:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80119d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011a1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011a8:	eb 0e                	jmp    8011b8 <strnlen+0x27>
  8011aa:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011ae:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011b3:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8011b8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8011bd:	74 0b                	je     8011ca <strnlen+0x39>
  8011bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c3:	0f b6 00             	movzbl (%rax),%eax
  8011c6:	84 c0                	test   %al,%al
  8011c8:	75 e0                	jne    8011aa <strnlen+0x19>
  8011ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011cd:	c9                   	leaveq 
  8011ce:	c3                   	retq   

00000000008011cf <strcpy>:
  8011cf:	55                   	push   %rbp
  8011d0:	48 89 e5             	mov    %rsp,%rbp
  8011d3:	48 83 ec 20          	sub    $0x20,%rsp
  8011d7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011db:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011e3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011e7:	90                   	nop
  8011e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ec:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011f0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011f4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011f8:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011fc:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801200:	0f b6 12             	movzbl (%rdx),%edx
  801203:	88 10                	mov    %dl,(%rax)
  801205:	0f b6 00             	movzbl (%rax),%eax
  801208:	84 c0                	test   %al,%al
  80120a:	75 dc                	jne    8011e8 <strcpy+0x19>
  80120c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801210:	c9                   	leaveq 
  801211:	c3                   	retq   

0000000000801212 <strcat>:
  801212:	55                   	push   %rbp
  801213:	48 89 e5             	mov    %rsp,%rbp
  801216:	48 83 ec 20          	sub    $0x20,%rsp
  80121a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80121e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801222:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801226:	48 89 c7             	mov    %rax,%rdi
  801229:	48 b8 63 11 80 00 00 	movabs $0x801163,%rax
  801230:	00 00 00 
  801233:	ff d0                	callq  *%rax
  801235:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801238:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80123b:	48 63 d0             	movslq %eax,%rdx
  80123e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801242:	48 01 c2             	add    %rax,%rdx
  801245:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801249:	48 89 c6             	mov    %rax,%rsi
  80124c:	48 89 d7             	mov    %rdx,%rdi
  80124f:	48 b8 cf 11 80 00 00 	movabs $0x8011cf,%rax
  801256:	00 00 00 
  801259:	ff d0                	callq  *%rax
  80125b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80125f:	c9                   	leaveq 
  801260:	c3                   	retq   

0000000000801261 <strncpy>:
  801261:	55                   	push   %rbp
  801262:	48 89 e5             	mov    %rsp,%rbp
  801265:	48 83 ec 28          	sub    $0x28,%rsp
  801269:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80126d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801271:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801275:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801279:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80127d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801284:	00 
  801285:	eb 2a                	jmp    8012b1 <strncpy+0x50>
  801287:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80128b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80128f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801293:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801297:	0f b6 12             	movzbl (%rdx),%edx
  80129a:	88 10                	mov    %dl,(%rax)
  80129c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012a0:	0f b6 00             	movzbl (%rax),%eax
  8012a3:	84 c0                	test   %al,%al
  8012a5:	74 05                	je     8012ac <strncpy+0x4b>
  8012a7:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8012ac:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8012b9:	72 cc                	jb     801287 <strncpy+0x26>
  8012bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012bf:	c9                   	leaveq 
  8012c0:	c3                   	retq   

00000000008012c1 <strlcpy>:
  8012c1:	55                   	push   %rbp
  8012c2:	48 89 e5             	mov    %rsp,%rbp
  8012c5:	48 83 ec 28          	sub    $0x28,%rsp
  8012c9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012cd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012d1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012d9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012dd:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012e2:	74 3d                	je     801321 <strlcpy+0x60>
  8012e4:	eb 1d                	jmp    801303 <strlcpy+0x42>
  8012e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012ea:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012ee:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012f2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012f6:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8012fa:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8012fe:	0f b6 12             	movzbl (%rdx),%edx
  801301:	88 10                	mov    %dl,(%rax)
  801303:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801308:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80130d:	74 0b                	je     80131a <strlcpy+0x59>
  80130f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801313:	0f b6 00             	movzbl (%rax),%eax
  801316:	84 c0                	test   %al,%al
  801318:	75 cc                	jne    8012e6 <strlcpy+0x25>
  80131a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80131e:	c6 00 00             	movb   $0x0,(%rax)
  801321:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801325:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801329:	48 29 c2             	sub    %rax,%rdx
  80132c:	48 89 d0             	mov    %rdx,%rax
  80132f:	c9                   	leaveq 
  801330:	c3                   	retq   

0000000000801331 <strcmp>:
  801331:	55                   	push   %rbp
  801332:	48 89 e5             	mov    %rsp,%rbp
  801335:	48 83 ec 10          	sub    $0x10,%rsp
  801339:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80133d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801341:	eb 0a                	jmp    80134d <strcmp+0x1c>
  801343:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801348:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80134d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801351:	0f b6 00             	movzbl (%rax),%eax
  801354:	84 c0                	test   %al,%al
  801356:	74 12                	je     80136a <strcmp+0x39>
  801358:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80135c:	0f b6 10             	movzbl (%rax),%edx
  80135f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801363:	0f b6 00             	movzbl (%rax),%eax
  801366:	38 c2                	cmp    %al,%dl
  801368:	74 d9                	je     801343 <strcmp+0x12>
  80136a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80136e:	0f b6 00             	movzbl (%rax),%eax
  801371:	0f b6 d0             	movzbl %al,%edx
  801374:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801378:	0f b6 00             	movzbl (%rax),%eax
  80137b:	0f b6 c0             	movzbl %al,%eax
  80137e:	29 c2                	sub    %eax,%edx
  801380:	89 d0                	mov    %edx,%eax
  801382:	c9                   	leaveq 
  801383:	c3                   	retq   

0000000000801384 <strncmp>:
  801384:	55                   	push   %rbp
  801385:	48 89 e5             	mov    %rsp,%rbp
  801388:	48 83 ec 18          	sub    $0x18,%rsp
  80138c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801390:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801394:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801398:	eb 0f                	jmp    8013a9 <strncmp+0x25>
  80139a:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80139f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013a4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8013a9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013ae:	74 1d                	je     8013cd <strncmp+0x49>
  8013b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b4:	0f b6 00             	movzbl (%rax),%eax
  8013b7:	84 c0                	test   %al,%al
  8013b9:	74 12                	je     8013cd <strncmp+0x49>
  8013bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013bf:	0f b6 10             	movzbl (%rax),%edx
  8013c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013c6:	0f b6 00             	movzbl (%rax),%eax
  8013c9:	38 c2                	cmp    %al,%dl
  8013cb:	74 cd                	je     80139a <strncmp+0x16>
  8013cd:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013d2:	75 07                	jne    8013db <strncmp+0x57>
  8013d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8013d9:	eb 18                	jmp    8013f3 <strncmp+0x6f>
  8013db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013df:	0f b6 00             	movzbl (%rax),%eax
  8013e2:	0f b6 d0             	movzbl %al,%edx
  8013e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013e9:	0f b6 00             	movzbl (%rax),%eax
  8013ec:	0f b6 c0             	movzbl %al,%eax
  8013ef:	29 c2                	sub    %eax,%edx
  8013f1:	89 d0                	mov    %edx,%eax
  8013f3:	c9                   	leaveq 
  8013f4:	c3                   	retq   

00000000008013f5 <strchr>:
  8013f5:	55                   	push   %rbp
  8013f6:	48 89 e5             	mov    %rsp,%rbp
  8013f9:	48 83 ec 0c          	sub    $0xc,%rsp
  8013fd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801401:	89 f0                	mov    %esi,%eax
  801403:	88 45 f4             	mov    %al,-0xc(%rbp)
  801406:	eb 17                	jmp    80141f <strchr+0x2a>
  801408:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80140c:	0f b6 00             	movzbl (%rax),%eax
  80140f:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801412:	75 06                	jne    80141a <strchr+0x25>
  801414:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801418:	eb 15                	jmp    80142f <strchr+0x3a>
  80141a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80141f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801423:	0f b6 00             	movzbl (%rax),%eax
  801426:	84 c0                	test   %al,%al
  801428:	75 de                	jne    801408 <strchr+0x13>
  80142a:	b8 00 00 00 00       	mov    $0x0,%eax
  80142f:	c9                   	leaveq 
  801430:	c3                   	retq   

0000000000801431 <strfind>:
  801431:	55                   	push   %rbp
  801432:	48 89 e5             	mov    %rsp,%rbp
  801435:	48 83 ec 0c          	sub    $0xc,%rsp
  801439:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80143d:	89 f0                	mov    %esi,%eax
  80143f:	88 45 f4             	mov    %al,-0xc(%rbp)
  801442:	eb 13                	jmp    801457 <strfind+0x26>
  801444:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801448:	0f b6 00             	movzbl (%rax),%eax
  80144b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80144e:	75 02                	jne    801452 <strfind+0x21>
  801450:	eb 10                	jmp    801462 <strfind+0x31>
  801452:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801457:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80145b:	0f b6 00             	movzbl (%rax),%eax
  80145e:	84 c0                	test   %al,%al
  801460:	75 e2                	jne    801444 <strfind+0x13>
  801462:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801466:	c9                   	leaveq 
  801467:	c3                   	retq   

0000000000801468 <memset>:
  801468:	55                   	push   %rbp
  801469:	48 89 e5             	mov    %rsp,%rbp
  80146c:	48 83 ec 18          	sub    $0x18,%rsp
  801470:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801474:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801477:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80147b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801480:	75 06                	jne    801488 <memset+0x20>
  801482:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801486:	eb 69                	jmp    8014f1 <memset+0x89>
  801488:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80148c:	83 e0 03             	and    $0x3,%eax
  80148f:	48 85 c0             	test   %rax,%rax
  801492:	75 48                	jne    8014dc <memset+0x74>
  801494:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801498:	83 e0 03             	and    $0x3,%eax
  80149b:	48 85 c0             	test   %rax,%rax
  80149e:	75 3c                	jne    8014dc <memset+0x74>
  8014a0:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8014a7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014aa:	c1 e0 18             	shl    $0x18,%eax
  8014ad:	89 c2                	mov    %eax,%edx
  8014af:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014b2:	c1 e0 10             	shl    $0x10,%eax
  8014b5:	09 c2                	or     %eax,%edx
  8014b7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014ba:	c1 e0 08             	shl    $0x8,%eax
  8014bd:	09 d0                	or     %edx,%eax
  8014bf:	09 45 f4             	or     %eax,-0xc(%rbp)
  8014c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014c6:	48 c1 e8 02          	shr    $0x2,%rax
  8014ca:	48 89 c1             	mov    %rax,%rcx
  8014cd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014d1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014d4:	48 89 d7             	mov    %rdx,%rdi
  8014d7:	fc                   	cld    
  8014d8:	f3 ab                	rep stos %eax,%es:(%rdi)
  8014da:	eb 11                	jmp    8014ed <memset+0x85>
  8014dc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014e0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014e3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8014e7:	48 89 d7             	mov    %rdx,%rdi
  8014ea:	fc                   	cld    
  8014eb:	f3 aa                	rep stos %al,%es:(%rdi)
  8014ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014f1:	c9                   	leaveq 
  8014f2:	c3                   	retq   

00000000008014f3 <memmove>:
  8014f3:	55                   	push   %rbp
  8014f4:	48 89 e5             	mov    %rsp,%rbp
  8014f7:	48 83 ec 28          	sub    $0x28,%rsp
  8014fb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014ff:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801503:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801507:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80150b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80150f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801513:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801517:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80151b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80151f:	0f 83 88 00 00 00    	jae    8015ad <memmove+0xba>
  801525:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801529:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80152d:	48 01 d0             	add    %rdx,%rax
  801530:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801534:	76 77                	jbe    8015ad <memmove+0xba>
  801536:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80153a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80153e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801542:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801546:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80154a:	83 e0 03             	and    $0x3,%eax
  80154d:	48 85 c0             	test   %rax,%rax
  801550:	75 3b                	jne    80158d <memmove+0x9a>
  801552:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801556:	83 e0 03             	and    $0x3,%eax
  801559:	48 85 c0             	test   %rax,%rax
  80155c:	75 2f                	jne    80158d <memmove+0x9a>
  80155e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801562:	83 e0 03             	and    $0x3,%eax
  801565:	48 85 c0             	test   %rax,%rax
  801568:	75 23                	jne    80158d <memmove+0x9a>
  80156a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80156e:	48 83 e8 04          	sub    $0x4,%rax
  801572:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801576:	48 83 ea 04          	sub    $0x4,%rdx
  80157a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80157e:	48 c1 e9 02          	shr    $0x2,%rcx
  801582:	48 89 c7             	mov    %rax,%rdi
  801585:	48 89 d6             	mov    %rdx,%rsi
  801588:	fd                   	std    
  801589:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80158b:	eb 1d                	jmp    8015aa <memmove+0xb7>
  80158d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801591:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801595:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801599:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80159d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a1:	48 89 d7             	mov    %rdx,%rdi
  8015a4:	48 89 c1             	mov    %rax,%rcx
  8015a7:	fd                   	std    
  8015a8:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015aa:	fc                   	cld    
  8015ab:	eb 57                	jmp    801604 <memmove+0x111>
  8015ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b1:	83 e0 03             	and    $0x3,%eax
  8015b4:	48 85 c0             	test   %rax,%rax
  8015b7:	75 36                	jne    8015ef <memmove+0xfc>
  8015b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015bd:	83 e0 03             	and    $0x3,%eax
  8015c0:	48 85 c0             	test   %rax,%rax
  8015c3:	75 2a                	jne    8015ef <memmove+0xfc>
  8015c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c9:	83 e0 03             	and    $0x3,%eax
  8015cc:	48 85 c0             	test   %rax,%rax
  8015cf:	75 1e                	jne    8015ef <memmove+0xfc>
  8015d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d5:	48 c1 e8 02          	shr    $0x2,%rax
  8015d9:	48 89 c1             	mov    %rax,%rcx
  8015dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015e0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015e4:	48 89 c7             	mov    %rax,%rdi
  8015e7:	48 89 d6             	mov    %rdx,%rsi
  8015ea:	fc                   	cld    
  8015eb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015ed:	eb 15                	jmp    801604 <memmove+0x111>
  8015ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015f3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015f7:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8015fb:	48 89 c7             	mov    %rax,%rdi
  8015fe:	48 89 d6             	mov    %rdx,%rsi
  801601:	fc                   	cld    
  801602:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801604:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801608:	c9                   	leaveq 
  801609:	c3                   	retq   

000000000080160a <memcpy>:
  80160a:	55                   	push   %rbp
  80160b:	48 89 e5             	mov    %rsp,%rbp
  80160e:	48 83 ec 18          	sub    $0x18,%rsp
  801612:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801616:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80161a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80161e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801622:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801626:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80162a:	48 89 ce             	mov    %rcx,%rsi
  80162d:	48 89 c7             	mov    %rax,%rdi
  801630:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  801637:	00 00 00 
  80163a:	ff d0                	callq  *%rax
  80163c:	c9                   	leaveq 
  80163d:	c3                   	retq   

000000000080163e <memcmp>:
  80163e:	55                   	push   %rbp
  80163f:	48 89 e5             	mov    %rsp,%rbp
  801642:	48 83 ec 28          	sub    $0x28,%rsp
  801646:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80164a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80164e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801652:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801656:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80165a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80165e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801662:	eb 36                	jmp    80169a <memcmp+0x5c>
  801664:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801668:	0f b6 10             	movzbl (%rax),%edx
  80166b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80166f:	0f b6 00             	movzbl (%rax),%eax
  801672:	38 c2                	cmp    %al,%dl
  801674:	74 1a                	je     801690 <memcmp+0x52>
  801676:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80167a:	0f b6 00             	movzbl (%rax),%eax
  80167d:	0f b6 d0             	movzbl %al,%edx
  801680:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801684:	0f b6 00             	movzbl (%rax),%eax
  801687:	0f b6 c0             	movzbl %al,%eax
  80168a:	29 c2                	sub    %eax,%edx
  80168c:	89 d0                	mov    %edx,%eax
  80168e:	eb 20                	jmp    8016b0 <memcmp+0x72>
  801690:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801695:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80169a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8016a2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016a6:	48 85 c0             	test   %rax,%rax
  8016a9:	75 b9                	jne    801664 <memcmp+0x26>
  8016ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8016b0:	c9                   	leaveq 
  8016b1:	c3                   	retq   

00000000008016b2 <memfind>:
  8016b2:	55                   	push   %rbp
  8016b3:	48 89 e5             	mov    %rsp,%rbp
  8016b6:	48 83 ec 28          	sub    $0x28,%rsp
  8016ba:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016be:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8016c1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016cd:	48 01 d0             	add    %rdx,%rax
  8016d0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016d4:	eb 15                	jmp    8016eb <memfind+0x39>
  8016d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016da:	0f b6 10             	movzbl (%rax),%edx
  8016dd:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8016e0:	38 c2                	cmp    %al,%dl
  8016e2:	75 02                	jne    8016e6 <memfind+0x34>
  8016e4:	eb 0f                	jmp    8016f5 <memfind+0x43>
  8016e6:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8016eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016ef:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8016f3:	72 e1                	jb     8016d6 <memfind+0x24>
  8016f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016f9:	c9                   	leaveq 
  8016fa:	c3                   	retq   

00000000008016fb <strtol>:
  8016fb:	55                   	push   %rbp
  8016fc:	48 89 e5             	mov    %rsp,%rbp
  8016ff:	48 83 ec 34          	sub    $0x34,%rsp
  801703:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801707:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80170b:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80170e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801715:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80171c:	00 
  80171d:	eb 05                	jmp    801724 <strtol+0x29>
  80171f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801724:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801728:	0f b6 00             	movzbl (%rax),%eax
  80172b:	3c 20                	cmp    $0x20,%al
  80172d:	74 f0                	je     80171f <strtol+0x24>
  80172f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801733:	0f b6 00             	movzbl (%rax),%eax
  801736:	3c 09                	cmp    $0x9,%al
  801738:	74 e5                	je     80171f <strtol+0x24>
  80173a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80173e:	0f b6 00             	movzbl (%rax),%eax
  801741:	3c 2b                	cmp    $0x2b,%al
  801743:	75 07                	jne    80174c <strtol+0x51>
  801745:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80174a:	eb 17                	jmp    801763 <strtol+0x68>
  80174c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801750:	0f b6 00             	movzbl (%rax),%eax
  801753:	3c 2d                	cmp    $0x2d,%al
  801755:	75 0c                	jne    801763 <strtol+0x68>
  801757:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80175c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801763:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801767:	74 06                	je     80176f <strtol+0x74>
  801769:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80176d:	75 28                	jne    801797 <strtol+0x9c>
  80176f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801773:	0f b6 00             	movzbl (%rax),%eax
  801776:	3c 30                	cmp    $0x30,%al
  801778:	75 1d                	jne    801797 <strtol+0x9c>
  80177a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177e:	48 83 c0 01          	add    $0x1,%rax
  801782:	0f b6 00             	movzbl (%rax),%eax
  801785:	3c 78                	cmp    $0x78,%al
  801787:	75 0e                	jne    801797 <strtol+0x9c>
  801789:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80178e:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801795:	eb 2c                	jmp    8017c3 <strtol+0xc8>
  801797:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80179b:	75 19                	jne    8017b6 <strtol+0xbb>
  80179d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a1:	0f b6 00             	movzbl (%rax),%eax
  8017a4:	3c 30                	cmp    $0x30,%al
  8017a6:	75 0e                	jne    8017b6 <strtol+0xbb>
  8017a8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017ad:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8017b4:	eb 0d                	jmp    8017c3 <strtol+0xc8>
  8017b6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017ba:	75 07                	jne    8017c3 <strtol+0xc8>
  8017bc:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8017c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c7:	0f b6 00             	movzbl (%rax),%eax
  8017ca:	3c 2f                	cmp    $0x2f,%al
  8017cc:	7e 1d                	jle    8017eb <strtol+0xf0>
  8017ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017d2:	0f b6 00             	movzbl (%rax),%eax
  8017d5:	3c 39                	cmp    $0x39,%al
  8017d7:	7f 12                	jg     8017eb <strtol+0xf0>
  8017d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017dd:	0f b6 00             	movzbl (%rax),%eax
  8017e0:	0f be c0             	movsbl %al,%eax
  8017e3:	83 e8 30             	sub    $0x30,%eax
  8017e6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017e9:	eb 4e                	jmp    801839 <strtol+0x13e>
  8017eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ef:	0f b6 00             	movzbl (%rax),%eax
  8017f2:	3c 60                	cmp    $0x60,%al
  8017f4:	7e 1d                	jle    801813 <strtol+0x118>
  8017f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017fa:	0f b6 00             	movzbl (%rax),%eax
  8017fd:	3c 7a                	cmp    $0x7a,%al
  8017ff:	7f 12                	jg     801813 <strtol+0x118>
  801801:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801805:	0f b6 00             	movzbl (%rax),%eax
  801808:	0f be c0             	movsbl %al,%eax
  80180b:	83 e8 57             	sub    $0x57,%eax
  80180e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801811:	eb 26                	jmp    801839 <strtol+0x13e>
  801813:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801817:	0f b6 00             	movzbl (%rax),%eax
  80181a:	3c 40                	cmp    $0x40,%al
  80181c:	7e 48                	jle    801866 <strtol+0x16b>
  80181e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801822:	0f b6 00             	movzbl (%rax),%eax
  801825:	3c 5a                	cmp    $0x5a,%al
  801827:	7f 3d                	jg     801866 <strtol+0x16b>
  801829:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80182d:	0f b6 00             	movzbl (%rax),%eax
  801830:	0f be c0             	movsbl %al,%eax
  801833:	83 e8 37             	sub    $0x37,%eax
  801836:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801839:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80183c:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80183f:	7c 02                	jl     801843 <strtol+0x148>
  801841:	eb 23                	jmp    801866 <strtol+0x16b>
  801843:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801848:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80184b:	48 98                	cltq   
  80184d:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801852:	48 89 c2             	mov    %rax,%rdx
  801855:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801858:	48 98                	cltq   
  80185a:	48 01 d0             	add    %rdx,%rax
  80185d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801861:	e9 5d ff ff ff       	jmpq   8017c3 <strtol+0xc8>
  801866:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80186b:	74 0b                	je     801878 <strtol+0x17d>
  80186d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801871:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801875:	48 89 10             	mov    %rdx,(%rax)
  801878:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80187c:	74 09                	je     801887 <strtol+0x18c>
  80187e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801882:	48 f7 d8             	neg    %rax
  801885:	eb 04                	jmp    80188b <strtol+0x190>
  801887:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80188b:	c9                   	leaveq 
  80188c:	c3                   	retq   

000000000080188d <strstr>:
  80188d:	55                   	push   %rbp
  80188e:	48 89 e5             	mov    %rsp,%rbp
  801891:	48 83 ec 30          	sub    $0x30,%rsp
  801895:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801899:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80189d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018a1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018a5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018a9:	0f b6 00             	movzbl (%rax),%eax
  8018ac:	88 45 ff             	mov    %al,-0x1(%rbp)
  8018af:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8018b3:	75 06                	jne    8018bb <strstr+0x2e>
  8018b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018b9:	eb 6b                	jmp    801926 <strstr+0x99>
  8018bb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018bf:	48 89 c7             	mov    %rax,%rdi
  8018c2:	48 b8 63 11 80 00 00 	movabs $0x801163,%rax
  8018c9:	00 00 00 
  8018cc:	ff d0                	callq  *%rax
  8018ce:	48 98                	cltq   
  8018d0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018d8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018dc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018e0:	0f b6 00             	movzbl (%rax),%eax
  8018e3:	88 45 ef             	mov    %al,-0x11(%rbp)
  8018e6:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8018ea:	75 07                	jne    8018f3 <strstr+0x66>
  8018ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8018f1:	eb 33                	jmp    801926 <strstr+0x99>
  8018f3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8018f7:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8018fa:	75 d8                	jne    8018d4 <strstr+0x47>
  8018fc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801900:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801904:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801908:	48 89 ce             	mov    %rcx,%rsi
  80190b:	48 89 c7             	mov    %rax,%rdi
  80190e:	48 b8 84 13 80 00 00 	movabs $0x801384,%rax
  801915:	00 00 00 
  801918:	ff d0                	callq  *%rax
  80191a:	85 c0                	test   %eax,%eax
  80191c:	75 b6                	jne    8018d4 <strstr+0x47>
  80191e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801922:	48 83 e8 01          	sub    $0x1,%rax
  801926:	c9                   	leaveq 
  801927:	c3                   	retq   

0000000000801928 <syscall>:
  801928:	55                   	push   %rbp
  801929:	48 89 e5             	mov    %rsp,%rbp
  80192c:	53                   	push   %rbx
  80192d:	48 83 ec 48          	sub    $0x48,%rsp
  801931:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801934:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801937:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80193b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80193f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801943:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801947:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80194a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80194e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801952:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801956:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  80195a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80195e:	4c 89 c3             	mov    %r8,%rbx
  801961:	cd 30                	int    $0x30
  801963:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801967:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80196b:	74 3e                	je     8019ab <syscall+0x83>
  80196d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801972:	7e 37                	jle    8019ab <syscall+0x83>
  801974:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801978:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80197b:	49 89 d0             	mov    %rdx,%r8
  80197e:	89 c1                	mov    %eax,%ecx
  801980:	48 ba 08 51 80 00 00 	movabs $0x805108,%rdx
  801987:	00 00 00 
  80198a:	be 24 00 00 00       	mov    $0x24,%esi
  80198f:	48 bf 25 51 80 00 00 	movabs $0x805125,%rdi
  801996:	00 00 00 
  801999:	b8 00 00 00 00       	mov    $0x0,%eax
  80199e:	49 b9 e1 03 80 00 00 	movabs $0x8003e1,%r9
  8019a5:	00 00 00 
  8019a8:	41 ff d1             	callq  *%r9
  8019ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019af:	48 83 c4 48          	add    $0x48,%rsp
  8019b3:	5b                   	pop    %rbx
  8019b4:	5d                   	pop    %rbp
  8019b5:	c3                   	retq   

00000000008019b6 <sys_cputs>:
  8019b6:	55                   	push   %rbp
  8019b7:	48 89 e5             	mov    %rsp,%rbp
  8019ba:	48 83 ec 20          	sub    $0x20,%rsp
  8019be:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8019c2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019ca:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ce:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019d5:	00 
  8019d6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019dc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019e2:	48 89 d1             	mov    %rdx,%rcx
  8019e5:	48 89 c2             	mov    %rax,%rdx
  8019e8:	be 00 00 00 00       	mov    $0x0,%esi
  8019ed:	bf 00 00 00 00       	mov    $0x0,%edi
  8019f2:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  8019f9:	00 00 00 
  8019fc:	ff d0                	callq  *%rax
  8019fe:	c9                   	leaveq 
  8019ff:	c3                   	retq   

0000000000801a00 <sys_cgetc>:
  801a00:	55                   	push   %rbp
  801a01:	48 89 e5             	mov    %rsp,%rbp
  801a04:	48 83 ec 10          	sub    $0x10,%rsp
  801a08:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a0f:	00 
  801a10:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a16:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a1c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a21:	ba 00 00 00 00       	mov    $0x0,%edx
  801a26:	be 00 00 00 00       	mov    $0x0,%esi
  801a2b:	bf 01 00 00 00       	mov    $0x1,%edi
  801a30:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801a37:	00 00 00 
  801a3a:	ff d0                	callq  *%rax
  801a3c:	c9                   	leaveq 
  801a3d:	c3                   	retq   

0000000000801a3e <sys_env_destroy>:
  801a3e:	55                   	push   %rbp
  801a3f:	48 89 e5             	mov    %rsp,%rbp
  801a42:	48 83 ec 10          	sub    $0x10,%rsp
  801a46:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a4c:	48 98                	cltq   
  801a4e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a55:	00 
  801a56:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a5c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a62:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a67:	48 89 c2             	mov    %rax,%rdx
  801a6a:	be 01 00 00 00       	mov    $0x1,%esi
  801a6f:	bf 03 00 00 00       	mov    $0x3,%edi
  801a74:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801a7b:	00 00 00 
  801a7e:	ff d0                	callq  *%rax
  801a80:	c9                   	leaveq 
  801a81:	c3                   	retq   

0000000000801a82 <sys_getenvid>:
  801a82:	55                   	push   %rbp
  801a83:	48 89 e5             	mov    %rsp,%rbp
  801a86:	48 83 ec 10          	sub    $0x10,%rsp
  801a8a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a91:	00 
  801a92:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a98:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a9e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aa3:	ba 00 00 00 00       	mov    $0x0,%edx
  801aa8:	be 00 00 00 00       	mov    $0x0,%esi
  801aad:	bf 02 00 00 00       	mov    $0x2,%edi
  801ab2:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801ab9:	00 00 00 
  801abc:	ff d0                	callq  *%rax
  801abe:	c9                   	leaveq 
  801abf:	c3                   	retq   

0000000000801ac0 <sys_yield>:
  801ac0:	55                   	push   %rbp
  801ac1:	48 89 e5             	mov    %rsp,%rbp
  801ac4:	48 83 ec 10          	sub    $0x10,%rsp
  801ac8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801acf:	00 
  801ad0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ad6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801adc:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ae1:	ba 00 00 00 00       	mov    $0x0,%edx
  801ae6:	be 00 00 00 00       	mov    $0x0,%esi
  801aeb:	bf 0b 00 00 00       	mov    $0xb,%edi
  801af0:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801af7:	00 00 00 
  801afa:	ff d0                	callq  *%rax
  801afc:	c9                   	leaveq 
  801afd:	c3                   	retq   

0000000000801afe <sys_page_alloc>:
  801afe:	55                   	push   %rbp
  801aff:	48 89 e5             	mov    %rsp,%rbp
  801b02:	48 83 ec 20          	sub    $0x20,%rsp
  801b06:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b09:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b0d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b10:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b13:	48 63 c8             	movslq %eax,%rcx
  801b16:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b1d:	48 98                	cltq   
  801b1f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b26:	00 
  801b27:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b2d:	49 89 c8             	mov    %rcx,%r8
  801b30:	48 89 d1             	mov    %rdx,%rcx
  801b33:	48 89 c2             	mov    %rax,%rdx
  801b36:	be 01 00 00 00       	mov    $0x1,%esi
  801b3b:	bf 04 00 00 00       	mov    $0x4,%edi
  801b40:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801b47:	00 00 00 
  801b4a:	ff d0                	callq  *%rax
  801b4c:	c9                   	leaveq 
  801b4d:	c3                   	retq   

0000000000801b4e <sys_page_map>:
  801b4e:	55                   	push   %rbp
  801b4f:	48 89 e5             	mov    %rsp,%rbp
  801b52:	48 83 ec 30          	sub    $0x30,%rsp
  801b56:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b59:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b5d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b60:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b64:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b68:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b6b:	48 63 c8             	movslq %eax,%rcx
  801b6e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b72:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b75:	48 63 f0             	movslq %eax,%rsi
  801b78:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b7f:	48 98                	cltq   
  801b81:	48 89 0c 24          	mov    %rcx,(%rsp)
  801b85:	49 89 f9             	mov    %rdi,%r9
  801b88:	49 89 f0             	mov    %rsi,%r8
  801b8b:	48 89 d1             	mov    %rdx,%rcx
  801b8e:	48 89 c2             	mov    %rax,%rdx
  801b91:	be 01 00 00 00       	mov    $0x1,%esi
  801b96:	bf 05 00 00 00       	mov    $0x5,%edi
  801b9b:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801ba2:	00 00 00 
  801ba5:	ff d0                	callq  *%rax
  801ba7:	c9                   	leaveq 
  801ba8:	c3                   	retq   

0000000000801ba9 <sys_page_unmap>:
  801ba9:	55                   	push   %rbp
  801baa:	48 89 e5             	mov    %rsp,%rbp
  801bad:	48 83 ec 20          	sub    $0x20,%rsp
  801bb1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bb4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bb8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bbf:	48 98                	cltq   
  801bc1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bc8:	00 
  801bc9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bcf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bd5:	48 89 d1             	mov    %rdx,%rcx
  801bd8:	48 89 c2             	mov    %rax,%rdx
  801bdb:	be 01 00 00 00       	mov    $0x1,%esi
  801be0:	bf 06 00 00 00       	mov    $0x6,%edi
  801be5:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801bec:	00 00 00 
  801bef:	ff d0                	callq  *%rax
  801bf1:	c9                   	leaveq 
  801bf2:	c3                   	retq   

0000000000801bf3 <sys_env_set_status>:
  801bf3:	55                   	push   %rbp
  801bf4:	48 89 e5             	mov    %rsp,%rbp
  801bf7:	48 83 ec 10          	sub    $0x10,%rsp
  801bfb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bfe:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801c01:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c04:	48 63 d0             	movslq %eax,%rdx
  801c07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c0a:	48 98                	cltq   
  801c0c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c13:	00 
  801c14:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c1a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c20:	48 89 d1             	mov    %rdx,%rcx
  801c23:	48 89 c2             	mov    %rax,%rdx
  801c26:	be 01 00 00 00       	mov    $0x1,%esi
  801c2b:	bf 08 00 00 00       	mov    $0x8,%edi
  801c30:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801c37:	00 00 00 
  801c3a:	ff d0                	callq  *%rax
  801c3c:	c9                   	leaveq 
  801c3d:	c3                   	retq   

0000000000801c3e <sys_env_set_trapframe>:
  801c3e:	55                   	push   %rbp
  801c3f:	48 89 e5             	mov    %rsp,%rbp
  801c42:	48 83 ec 20          	sub    $0x20,%rsp
  801c46:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c49:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c4d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c51:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c54:	48 98                	cltq   
  801c56:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c5d:	00 
  801c5e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c64:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c6a:	48 89 d1             	mov    %rdx,%rcx
  801c6d:	48 89 c2             	mov    %rax,%rdx
  801c70:	be 01 00 00 00       	mov    $0x1,%esi
  801c75:	bf 09 00 00 00       	mov    $0x9,%edi
  801c7a:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801c81:	00 00 00 
  801c84:	ff d0                	callq  *%rax
  801c86:	c9                   	leaveq 
  801c87:	c3                   	retq   

0000000000801c88 <sys_env_set_pgfault_upcall>:
  801c88:	55                   	push   %rbp
  801c89:	48 89 e5             	mov    %rsp,%rbp
  801c8c:	48 83 ec 20          	sub    $0x20,%rsp
  801c90:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c93:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c97:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c9e:	48 98                	cltq   
  801ca0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ca7:	00 
  801ca8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cae:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cb4:	48 89 d1             	mov    %rdx,%rcx
  801cb7:	48 89 c2             	mov    %rax,%rdx
  801cba:	be 01 00 00 00       	mov    $0x1,%esi
  801cbf:	bf 0a 00 00 00       	mov    $0xa,%edi
  801cc4:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801ccb:	00 00 00 
  801cce:	ff d0                	callq  *%rax
  801cd0:	c9                   	leaveq 
  801cd1:	c3                   	retq   

0000000000801cd2 <sys_ipc_try_send>:
  801cd2:	55                   	push   %rbp
  801cd3:	48 89 e5             	mov    %rsp,%rbp
  801cd6:	48 83 ec 20          	sub    $0x20,%rsp
  801cda:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cdd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ce1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801ce5:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801ce8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ceb:	48 63 f0             	movslq %eax,%rsi
  801cee:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801cf2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cf5:	48 98                	cltq   
  801cf7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cfb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d02:	00 
  801d03:	49 89 f1             	mov    %rsi,%r9
  801d06:	49 89 c8             	mov    %rcx,%r8
  801d09:	48 89 d1             	mov    %rdx,%rcx
  801d0c:	48 89 c2             	mov    %rax,%rdx
  801d0f:	be 00 00 00 00       	mov    $0x0,%esi
  801d14:	bf 0c 00 00 00       	mov    $0xc,%edi
  801d19:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801d20:	00 00 00 
  801d23:	ff d0                	callq  *%rax
  801d25:	c9                   	leaveq 
  801d26:	c3                   	retq   

0000000000801d27 <sys_ipc_recv>:
  801d27:	55                   	push   %rbp
  801d28:	48 89 e5             	mov    %rsp,%rbp
  801d2b:	48 83 ec 10          	sub    $0x10,%rsp
  801d2f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d37:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d3e:	00 
  801d3f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d45:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d4b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d50:	48 89 c2             	mov    %rax,%rdx
  801d53:	be 01 00 00 00       	mov    $0x1,%esi
  801d58:	bf 0d 00 00 00       	mov    $0xd,%edi
  801d5d:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801d64:	00 00 00 
  801d67:	ff d0                	callq  *%rax
  801d69:	c9                   	leaveq 
  801d6a:	c3                   	retq   

0000000000801d6b <sys_time_msec>:
  801d6b:	55                   	push   %rbp
  801d6c:	48 89 e5             	mov    %rsp,%rbp
  801d6f:	48 83 ec 10          	sub    $0x10,%rsp
  801d73:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d7a:	00 
  801d7b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d81:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d87:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d8c:	ba 00 00 00 00       	mov    $0x0,%edx
  801d91:	be 00 00 00 00       	mov    $0x0,%esi
  801d96:	bf 0e 00 00 00       	mov    $0xe,%edi
  801d9b:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801da2:	00 00 00 
  801da5:	ff d0                	callq  *%rax
  801da7:	c9                   	leaveq 
  801da8:	c3                   	retq   

0000000000801da9 <sys_net_transmit>:
  801da9:	55                   	push   %rbp
  801daa:	48 89 e5             	mov    %rsp,%rbp
  801dad:	48 83 ec 20          	sub    $0x20,%rsp
  801db1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801db5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801db8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801dbb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dbf:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dc6:	00 
  801dc7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dcd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dd3:	48 89 d1             	mov    %rdx,%rcx
  801dd6:	48 89 c2             	mov    %rax,%rdx
  801dd9:	be 00 00 00 00       	mov    $0x0,%esi
  801dde:	bf 0f 00 00 00       	mov    $0xf,%edi
  801de3:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801dea:	00 00 00 
  801ded:	ff d0                	callq  *%rax
  801def:	c9                   	leaveq 
  801df0:	c3                   	retq   

0000000000801df1 <sys_net_receive>:
  801df1:	55                   	push   %rbp
  801df2:	48 89 e5             	mov    %rsp,%rbp
  801df5:	48 83 ec 20          	sub    $0x20,%rsp
  801df9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801dfd:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e00:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e07:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e0e:	00 
  801e0f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e15:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e1b:	48 89 d1             	mov    %rdx,%rcx
  801e1e:	48 89 c2             	mov    %rax,%rdx
  801e21:	be 00 00 00 00       	mov    $0x0,%esi
  801e26:	bf 10 00 00 00       	mov    $0x10,%edi
  801e2b:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801e32:	00 00 00 
  801e35:	ff d0                	callq  *%rax
  801e37:	c9                   	leaveq 
  801e38:	c3                   	retq   

0000000000801e39 <sys_ept_map>:
  801e39:	55                   	push   %rbp
  801e3a:	48 89 e5             	mov    %rsp,%rbp
  801e3d:	48 83 ec 30          	sub    $0x30,%rsp
  801e41:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e44:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e48:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e4b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e4f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e53:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801e56:	48 63 c8             	movslq %eax,%rcx
  801e59:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801e5d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e60:	48 63 f0             	movslq %eax,%rsi
  801e63:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e6a:	48 98                	cltq   
  801e6c:	48 89 0c 24          	mov    %rcx,(%rsp)
  801e70:	49 89 f9             	mov    %rdi,%r9
  801e73:	49 89 f0             	mov    %rsi,%r8
  801e76:	48 89 d1             	mov    %rdx,%rcx
  801e79:	48 89 c2             	mov    %rax,%rdx
  801e7c:	be 00 00 00 00       	mov    $0x0,%esi
  801e81:	bf 11 00 00 00       	mov    $0x11,%edi
  801e86:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801e8d:	00 00 00 
  801e90:	ff d0                	callq  *%rax
  801e92:	c9                   	leaveq 
  801e93:	c3                   	retq   

0000000000801e94 <sys_env_mkguest>:
  801e94:	55                   	push   %rbp
  801e95:	48 89 e5             	mov    %rsp,%rbp
  801e98:	48 83 ec 20          	sub    $0x20,%rsp
  801e9c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ea0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ea4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ea8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801eac:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801eb3:	00 
  801eb4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eba:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ec0:	48 89 d1             	mov    %rdx,%rcx
  801ec3:	48 89 c2             	mov    %rax,%rdx
  801ec6:	be 00 00 00 00       	mov    $0x0,%esi
  801ecb:	bf 12 00 00 00       	mov    $0x12,%edi
  801ed0:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801ed7:	00 00 00 
  801eda:	ff d0                	callq  *%rax
  801edc:	c9                   	leaveq 
  801edd:	c3                   	retq   

0000000000801ede <sys_vmx_list_vms>:
  801ede:	55                   	push   %rbp
  801edf:	48 89 e5             	mov    %rsp,%rbp
  801ee2:	48 83 ec 10          	sub    $0x10,%rsp
  801ee6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801eed:	00 
  801eee:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ef4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801efa:	b9 00 00 00 00       	mov    $0x0,%ecx
  801eff:	ba 00 00 00 00       	mov    $0x0,%edx
  801f04:	be 00 00 00 00       	mov    $0x0,%esi
  801f09:	bf 13 00 00 00       	mov    $0x13,%edi
  801f0e:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801f15:	00 00 00 
  801f18:	ff d0                	callq  *%rax
  801f1a:	c9                   	leaveq 
  801f1b:	c3                   	retq   

0000000000801f1c <sys_vmx_sel_resume>:
  801f1c:	55                   	push   %rbp
  801f1d:	48 89 e5             	mov    %rsp,%rbp
  801f20:	48 83 ec 10          	sub    $0x10,%rsp
  801f24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f2a:	48 98                	cltq   
  801f2c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f33:	00 
  801f34:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f3a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f40:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f45:	48 89 c2             	mov    %rax,%rdx
  801f48:	be 00 00 00 00       	mov    $0x0,%esi
  801f4d:	bf 14 00 00 00       	mov    $0x14,%edi
  801f52:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801f59:	00 00 00 
  801f5c:	ff d0                	callq  *%rax
  801f5e:	c9                   	leaveq 
  801f5f:	c3                   	retq   

0000000000801f60 <sys_vmx_get_vmdisk_number>:
  801f60:	55                   	push   %rbp
  801f61:	48 89 e5             	mov    %rsp,%rbp
  801f64:	48 83 ec 10          	sub    $0x10,%rsp
  801f68:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f6f:	00 
  801f70:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f76:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f7c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f81:	ba 00 00 00 00       	mov    $0x0,%edx
  801f86:	be 00 00 00 00       	mov    $0x0,%esi
  801f8b:	bf 15 00 00 00       	mov    $0x15,%edi
  801f90:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801f97:	00 00 00 
  801f9a:	ff d0                	callq  *%rax
  801f9c:	c9                   	leaveq 
  801f9d:	c3                   	retq   

0000000000801f9e <sys_vmx_incr_vmdisk_number>:
  801f9e:	55                   	push   %rbp
  801f9f:	48 89 e5             	mov    %rsp,%rbp
  801fa2:	48 83 ec 10          	sub    $0x10,%rsp
  801fa6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fad:	00 
  801fae:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fb4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fba:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fbf:	ba 00 00 00 00       	mov    $0x0,%edx
  801fc4:	be 00 00 00 00       	mov    $0x0,%esi
  801fc9:	bf 16 00 00 00       	mov    $0x16,%edi
  801fce:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  801fd5:	00 00 00 
  801fd8:	ff d0                	callq  *%rax
  801fda:	c9                   	leaveq 
  801fdb:	c3                   	retq   

0000000000801fdc <pgfault>:
  801fdc:	55                   	push   %rbp
  801fdd:	48 89 e5             	mov    %rsp,%rbp
  801fe0:	48 83 ec 30          	sub    $0x30,%rsp
  801fe4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801fe8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fec:	48 8b 00             	mov    (%rax),%rax
  801fef:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801ff3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ff7:	48 8b 40 08          	mov    0x8(%rax),%rax
  801ffb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ffe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802001:	83 e0 02             	and    $0x2,%eax
  802004:	85 c0                	test   %eax,%eax
  802006:	75 40                	jne    802048 <pgfault+0x6c>
  802008:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80200c:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  802013:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802017:	49 89 d0             	mov    %rdx,%r8
  80201a:	48 89 c1             	mov    %rax,%rcx
  80201d:	48 ba 38 51 80 00 00 	movabs $0x805138,%rdx
  802024:	00 00 00 
  802027:	be 1f 00 00 00       	mov    $0x1f,%esi
  80202c:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  802033:	00 00 00 
  802036:	b8 00 00 00 00       	mov    $0x0,%eax
  80203b:	49 b9 e1 03 80 00 00 	movabs $0x8003e1,%r9
  802042:	00 00 00 
  802045:	41 ff d1             	callq  *%r9
  802048:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80204c:	48 c1 e8 0c          	shr    $0xc,%rax
  802050:	48 89 c2             	mov    %rax,%rdx
  802053:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80205a:	01 00 00 
  80205d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802061:	25 07 08 00 00       	and    $0x807,%eax
  802066:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  80206c:	74 4e                	je     8020bc <pgfault+0xe0>
  80206e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802072:	48 c1 e8 0c          	shr    $0xc,%rax
  802076:	48 89 c2             	mov    %rax,%rdx
  802079:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802080:	01 00 00 
  802083:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802087:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80208b:	49 89 d0             	mov    %rdx,%r8
  80208e:	48 89 c1             	mov    %rax,%rcx
  802091:	48 ba 60 51 80 00 00 	movabs $0x805160,%rdx
  802098:	00 00 00 
  80209b:	be 22 00 00 00       	mov    $0x22,%esi
  8020a0:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  8020a7:	00 00 00 
  8020aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8020af:	49 b9 e1 03 80 00 00 	movabs $0x8003e1,%r9
  8020b6:	00 00 00 
  8020b9:	41 ff d1             	callq  *%r9
  8020bc:	ba 07 00 00 00       	mov    $0x7,%edx
  8020c1:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020c6:	bf 00 00 00 00       	mov    $0x0,%edi
  8020cb:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  8020d2:	00 00 00 
  8020d5:	ff d0                	callq  *%rax
  8020d7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020da:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020de:	79 30                	jns    802110 <pgfault+0x134>
  8020e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020e3:	89 c1                	mov    %eax,%ecx
  8020e5:	48 ba 8b 51 80 00 00 	movabs $0x80518b,%rdx
  8020ec:	00 00 00 
  8020ef:	be 30 00 00 00       	mov    $0x30,%esi
  8020f4:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  8020fb:	00 00 00 
  8020fe:	b8 00 00 00 00       	mov    $0x0,%eax
  802103:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  80210a:	00 00 00 
  80210d:	41 ff d0             	callq  *%r8
  802110:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802114:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802118:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80211c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802122:	ba 00 10 00 00       	mov    $0x1000,%edx
  802127:	48 89 c6             	mov    %rax,%rsi
  80212a:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  80212f:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  802136:	00 00 00 
  802139:	ff d0                	callq  *%rax
  80213b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80213f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802143:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802147:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80214d:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  802153:	48 89 c1             	mov    %rax,%rcx
  802156:	ba 00 00 00 00       	mov    $0x0,%edx
  80215b:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802160:	bf 00 00 00 00       	mov    $0x0,%edi
  802165:	48 b8 4e 1b 80 00 00 	movabs $0x801b4e,%rax
  80216c:	00 00 00 
  80216f:	ff d0                	callq  *%rax
  802171:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802174:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802178:	79 30                	jns    8021aa <pgfault+0x1ce>
  80217a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80217d:	89 c1                	mov    %eax,%ecx
  80217f:	48 ba 9e 51 80 00 00 	movabs $0x80519e,%rdx
  802186:	00 00 00 
  802189:	be 35 00 00 00       	mov    $0x35,%esi
  80218e:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  802195:	00 00 00 
  802198:	b8 00 00 00 00       	mov    $0x0,%eax
  80219d:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8021a4:	00 00 00 
  8021a7:	41 ff d0             	callq  *%r8
  8021aa:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8021af:	bf 00 00 00 00       	mov    $0x0,%edi
  8021b4:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  8021bb:	00 00 00 
  8021be:	ff d0                	callq  *%rax
  8021c0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8021c3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8021c7:	79 30                	jns    8021f9 <pgfault+0x21d>
  8021c9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021cc:	89 c1                	mov    %eax,%ecx
  8021ce:	48 ba af 51 80 00 00 	movabs $0x8051af,%rdx
  8021d5:	00 00 00 
  8021d8:	be 39 00 00 00       	mov    $0x39,%esi
  8021dd:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  8021e4:	00 00 00 
  8021e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8021ec:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8021f3:	00 00 00 
  8021f6:	41 ff d0             	callq  *%r8
  8021f9:	c9                   	leaveq 
  8021fa:	c3                   	retq   

00000000008021fb <duppage>:
  8021fb:	55                   	push   %rbp
  8021fc:	48 89 e5             	mov    %rsp,%rbp
  8021ff:	48 83 ec 30          	sub    $0x30,%rsp
  802203:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802206:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802209:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80220c:	c1 e0 0c             	shl    $0xc,%eax
  80220f:	89 c0                	mov    %eax,%eax
  802211:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802215:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80221c:	01 00 00 
  80221f:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802222:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802226:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80222a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80222e:	25 02 08 00 00       	and    $0x802,%eax
  802233:	48 85 c0             	test   %rax,%rax
  802236:	74 0e                	je     802246 <duppage+0x4b>
  802238:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80223c:	25 00 04 00 00       	and    $0x400,%eax
  802241:	48 85 c0             	test   %rax,%rax
  802244:	74 70                	je     8022b6 <duppage+0xbb>
  802246:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80224a:	25 07 0e 00 00       	and    $0xe07,%eax
  80224f:	89 c6                	mov    %eax,%esi
  802251:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802255:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802258:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80225c:	41 89 f0             	mov    %esi,%r8d
  80225f:	48 89 c6             	mov    %rax,%rsi
  802262:	bf 00 00 00 00       	mov    $0x0,%edi
  802267:	48 b8 4e 1b 80 00 00 	movabs $0x801b4e,%rax
  80226e:	00 00 00 
  802271:	ff d0                	callq  *%rax
  802273:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802276:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80227a:	79 30                	jns    8022ac <duppage+0xb1>
  80227c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80227f:	89 c1                	mov    %eax,%ecx
  802281:	48 ba 9e 51 80 00 00 	movabs $0x80519e,%rdx
  802288:	00 00 00 
  80228b:	be 63 00 00 00       	mov    $0x63,%esi
  802290:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  802297:	00 00 00 
  80229a:	b8 00 00 00 00       	mov    $0x0,%eax
  80229f:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8022a6:	00 00 00 
  8022a9:	41 ff d0             	callq  *%r8
  8022ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8022b1:	e9 c4 00 00 00       	jmpq   80237a <duppage+0x17f>
  8022b6:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8022ba:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8022bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022c1:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8022c7:	48 89 c6             	mov    %rax,%rsi
  8022ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8022cf:	48 b8 4e 1b 80 00 00 	movabs $0x801b4e,%rax
  8022d6:	00 00 00 
  8022d9:	ff d0                	callq  *%rax
  8022db:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8022de:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8022e2:	79 30                	jns    802314 <duppage+0x119>
  8022e4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022e7:	89 c1                	mov    %eax,%ecx
  8022e9:	48 ba 9e 51 80 00 00 	movabs $0x80519e,%rdx
  8022f0:	00 00 00 
  8022f3:	be 7e 00 00 00       	mov    $0x7e,%esi
  8022f8:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  8022ff:	00 00 00 
  802302:	b8 00 00 00 00       	mov    $0x0,%eax
  802307:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  80230e:	00 00 00 
  802311:	41 ff d0             	callq  *%r8
  802314:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802318:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80231c:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802322:	48 89 d1             	mov    %rdx,%rcx
  802325:	ba 00 00 00 00       	mov    $0x0,%edx
  80232a:	48 89 c6             	mov    %rax,%rsi
  80232d:	bf 00 00 00 00       	mov    $0x0,%edi
  802332:	48 b8 4e 1b 80 00 00 	movabs $0x801b4e,%rax
  802339:	00 00 00 
  80233c:	ff d0                	callq  *%rax
  80233e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802341:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802345:	79 30                	jns    802377 <duppage+0x17c>
  802347:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80234a:	89 c1                	mov    %eax,%ecx
  80234c:	48 ba 9e 51 80 00 00 	movabs $0x80519e,%rdx
  802353:	00 00 00 
  802356:	be 80 00 00 00       	mov    $0x80,%esi
  80235b:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  802362:	00 00 00 
  802365:	b8 00 00 00 00       	mov    $0x0,%eax
  80236a:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  802371:	00 00 00 
  802374:	41 ff d0             	callq  *%r8
  802377:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80237a:	c9                   	leaveq 
  80237b:	c3                   	retq   

000000000080237c <fork>:
  80237c:	55                   	push   %rbp
  80237d:	48 89 e5             	mov    %rsp,%rbp
  802380:	48 83 ec 20          	sub    $0x20,%rsp
  802384:	48 bf dc 1f 80 00 00 	movabs $0x801fdc,%rdi
  80238b:	00 00 00 
  80238e:	48 b8 39 47 80 00 00 	movabs $0x804739,%rax
  802395:	00 00 00 
  802398:	ff d0                	callq  *%rax
  80239a:	b8 07 00 00 00       	mov    $0x7,%eax
  80239f:	cd 30                	int    $0x30
  8023a1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8023a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023a7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8023aa:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023ae:	79 08                	jns    8023b8 <fork+0x3c>
  8023b0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023b3:	e9 09 02 00 00       	jmpq   8025c1 <fork+0x245>
  8023b8:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023bc:	75 3e                	jne    8023fc <fork+0x80>
  8023be:	48 b8 82 1a 80 00 00 	movabs $0x801a82,%rax
  8023c5:	00 00 00 
  8023c8:	ff d0                	callq  *%rax
  8023ca:	25 ff 03 00 00       	and    $0x3ff,%eax
  8023cf:	48 98                	cltq   
  8023d1:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8023d8:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8023df:	00 00 00 
  8023e2:	48 01 c2             	add    %rax,%rdx
  8023e5:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8023ec:	00 00 00 
  8023ef:	48 89 10             	mov    %rdx,(%rax)
  8023f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8023f7:	e9 c5 01 00 00       	jmpq   8025c1 <fork+0x245>
  8023fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802403:	e9 a4 00 00 00       	jmpq   8024ac <fork+0x130>
  802408:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80240b:	c1 f8 12             	sar    $0x12,%eax
  80240e:	89 c2                	mov    %eax,%edx
  802410:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802417:	01 00 00 
  80241a:	48 63 d2             	movslq %edx,%rdx
  80241d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802421:	83 e0 01             	and    $0x1,%eax
  802424:	48 85 c0             	test   %rax,%rax
  802427:	74 21                	je     80244a <fork+0xce>
  802429:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80242c:	c1 f8 09             	sar    $0x9,%eax
  80242f:	89 c2                	mov    %eax,%edx
  802431:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802438:	01 00 00 
  80243b:	48 63 d2             	movslq %edx,%rdx
  80243e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802442:	83 e0 01             	and    $0x1,%eax
  802445:	48 85 c0             	test   %rax,%rax
  802448:	75 09                	jne    802453 <fork+0xd7>
  80244a:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802451:	eb 59                	jmp    8024ac <fork+0x130>
  802453:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802456:	05 00 02 00 00       	add    $0x200,%eax
  80245b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80245e:	eb 44                	jmp    8024a4 <fork+0x128>
  802460:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802467:	01 00 00 
  80246a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80246d:	48 63 d2             	movslq %edx,%rdx
  802470:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802474:	83 e0 05             	and    $0x5,%eax
  802477:	48 83 f8 05          	cmp    $0x5,%rax
  80247b:	74 02                	je     80247f <fork+0x103>
  80247d:	eb 21                	jmp    8024a0 <fork+0x124>
  80247f:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  802486:	75 02                	jne    80248a <fork+0x10e>
  802488:	eb 16                	jmp    8024a0 <fork+0x124>
  80248a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80248d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802490:	89 d6                	mov    %edx,%esi
  802492:	89 c7                	mov    %eax,%edi
  802494:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  80249b:	00 00 00 
  80249e:	ff d0                	callq  *%rax
  8024a0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8024a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024a7:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8024aa:	7c b4                	jl     802460 <fork+0xe4>
  8024ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024af:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8024b4:	0f 86 4e ff ff ff    	jbe    802408 <fork+0x8c>
  8024ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024bd:	ba 07 00 00 00       	mov    $0x7,%edx
  8024c2:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8024c7:	89 c7                	mov    %eax,%edi
  8024c9:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  8024d0:	00 00 00 
  8024d3:	ff d0                	callq  *%rax
  8024d5:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8024d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8024dc:	79 30                	jns    80250e <fork+0x192>
  8024de:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8024e1:	89 c1                	mov    %eax,%ecx
  8024e3:	48 ba c8 51 80 00 00 	movabs $0x8051c8,%rdx
  8024ea:	00 00 00 
  8024ed:	be bc 00 00 00       	mov    $0xbc,%esi
  8024f2:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  8024f9:	00 00 00 
  8024fc:	b8 00 00 00 00       	mov    $0x0,%eax
  802501:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  802508:	00 00 00 
  80250b:	41 ff d0             	callq  *%r8
  80250e:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802515:	00 00 00 
  802518:	48 8b 00             	mov    (%rax),%rax
  80251b:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802522:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802525:	48 89 d6             	mov    %rdx,%rsi
  802528:	89 c7                	mov    %eax,%edi
  80252a:	48 b8 88 1c 80 00 00 	movabs $0x801c88,%rax
  802531:	00 00 00 
  802534:	ff d0                	callq  *%rax
  802536:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802539:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80253d:	79 30                	jns    80256f <fork+0x1f3>
  80253f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802542:	89 c1                	mov    %eax,%ecx
  802544:	48 ba e8 51 80 00 00 	movabs $0x8051e8,%rdx
  80254b:	00 00 00 
  80254e:	be c0 00 00 00       	mov    $0xc0,%esi
  802553:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  80255a:	00 00 00 
  80255d:	b8 00 00 00 00       	mov    $0x0,%eax
  802562:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  802569:	00 00 00 
  80256c:	41 ff d0             	callq  *%r8
  80256f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802572:	be 02 00 00 00       	mov    $0x2,%esi
  802577:	89 c7                	mov    %eax,%edi
  802579:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802580:	00 00 00 
  802583:	ff d0                	callq  *%rax
  802585:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802588:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80258c:	79 30                	jns    8025be <fork+0x242>
  80258e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802591:	89 c1                	mov    %eax,%ecx
  802593:	48 ba 07 52 80 00 00 	movabs $0x805207,%rdx
  80259a:	00 00 00 
  80259d:	be c5 00 00 00       	mov    $0xc5,%esi
  8025a2:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  8025a9:	00 00 00 
  8025ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8025b1:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8025b8:	00 00 00 
  8025bb:	41 ff d0             	callq  *%r8
  8025be:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025c1:	c9                   	leaveq 
  8025c2:	c3                   	retq   

00000000008025c3 <sfork>:
  8025c3:	55                   	push   %rbp
  8025c4:	48 89 e5             	mov    %rsp,%rbp
  8025c7:	48 ba 1e 52 80 00 00 	movabs $0x80521e,%rdx
  8025ce:	00 00 00 
  8025d1:	be d2 00 00 00       	mov    $0xd2,%esi
  8025d6:	48 bf 51 51 80 00 00 	movabs $0x805151,%rdi
  8025dd:	00 00 00 
  8025e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8025e5:	48 b9 e1 03 80 00 00 	movabs $0x8003e1,%rcx
  8025ec:	00 00 00 
  8025ef:	ff d1                	callq  *%rcx

00000000008025f1 <fd2num>:
  8025f1:	55                   	push   %rbp
  8025f2:	48 89 e5             	mov    %rsp,%rbp
  8025f5:	48 83 ec 08          	sub    $0x8,%rsp
  8025f9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025fd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802601:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802608:	ff ff ff 
  80260b:	48 01 d0             	add    %rdx,%rax
  80260e:	48 c1 e8 0c          	shr    $0xc,%rax
  802612:	c9                   	leaveq 
  802613:	c3                   	retq   

0000000000802614 <fd2data>:
  802614:	55                   	push   %rbp
  802615:	48 89 e5             	mov    %rsp,%rbp
  802618:	48 83 ec 08          	sub    $0x8,%rsp
  80261c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802620:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802624:	48 89 c7             	mov    %rax,%rdi
  802627:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  80262e:	00 00 00 
  802631:	ff d0                	callq  *%rax
  802633:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802639:	48 c1 e0 0c          	shl    $0xc,%rax
  80263d:	c9                   	leaveq 
  80263e:	c3                   	retq   

000000000080263f <fd_alloc>:
  80263f:	55                   	push   %rbp
  802640:	48 89 e5             	mov    %rsp,%rbp
  802643:	48 83 ec 18          	sub    $0x18,%rsp
  802647:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80264b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802652:	eb 6b                	jmp    8026bf <fd_alloc+0x80>
  802654:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802657:	48 98                	cltq   
  802659:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80265f:	48 c1 e0 0c          	shl    $0xc,%rax
  802663:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802667:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80266b:	48 c1 e8 15          	shr    $0x15,%rax
  80266f:	48 89 c2             	mov    %rax,%rdx
  802672:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802679:	01 00 00 
  80267c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802680:	83 e0 01             	and    $0x1,%eax
  802683:	48 85 c0             	test   %rax,%rax
  802686:	74 21                	je     8026a9 <fd_alloc+0x6a>
  802688:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80268c:	48 c1 e8 0c          	shr    $0xc,%rax
  802690:	48 89 c2             	mov    %rax,%rdx
  802693:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80269a:	01 00 00 
  80269d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026a1:	83 e0 01             	and    $0x1,%eax
  8026a4:	48 85 c0             	test   %rax,%rax
  8026a7:	75 12                	jne    8026bb <fd_alloc+0x7c>
  8026a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026ad:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026b1:	48 89 10             	mov    %rdx,(%rax)
  8026b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8026b9:	eb 1a                	jmp    8026d5 <fd_alloc+0x96>
  8026bb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8026bf:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8026c3:	7e 8f                	jle    802654 <fd_alloc+0x15>
  8026c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026c9:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8026d0:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8026d5:	c9                   	leaveq 
  8026d6:	c3                   	retq   

00000000008026d7 <fd_lookup>:
  8026d7:	55                   	push   %rbp
  8026d8:	48 89 e5             	mov    %rsp,%rbp
  8026db:	48 83 ec 20          	sub    $0x20,%rsp
  8026df:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8026e2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8026ea:	78 06                	js     8026f2 <fd_lookup+0x1b>
  8026ec:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8026f0:	7e 07                	jle    8026f9 <fd_lookup+0x22>
  8026f2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8026f7:	eb 6c                	jmp    802765 <fd_lookup+0x8e>
  8026f9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8026fc:	48 98                	cltq   
  8026fe:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802704:	48 c1 e0 0c          	shl    $0xc,%rax
  802708:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80270c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802710:	48 c1 e8 15          	shr    $0x15,%rax
  802714:	48 89 c2             	mov    %rax,%rdx
  802717:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80271e:	01 00 00 
  802721:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802725:	83 e0 01             	and    $0x1,%eax
  802728:	48 85 c0             	test   %rax,%rax
  80272b:	74 21                	je     80274e <fd_lookup+0x77>
  80272d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802731:	48 c1 e8 0c          	shr    $0xc,%rax
  802735:	48 89 c2             	mov    %rax,%rdx
  802738:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80273f:	01 00 00 
  802742:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802746:	83 e0 01             	and    $0x1,%eax
  802749:	48 85 c0             	test   %rax,%rax
  80274c:	75 07                	jne    802755 <fd_lookup+0x7e>
  80274e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802753:	eb 10                	jmp    802765 <fd_lookup+0x8e>
  802755:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802759:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80275d:	48 89 10             	mov    %rdx,(%rax)
  802760:	b8 00 00 00 00       	mov    $0x0,%eax
  802765:	c9                   	leaveq 
  802766:	c3                   	retq   

0000000000802767 <fd_close>:
  802767:	55                   	push   %rbp
  802768:	48 89 e5             	mov    %rsp,%rbp
  80276b:	48 83 ec 30          	sub    $0x30,%rsp
  80276f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802773:	89 f0                	mov    %esi,%eax
  802775:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802778:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80277c:	48 89 c7             	mov    %rax,%rdi
  80277f:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  802786:	00 00 00 
  802789:	ff d0                	callq  *%rax
  80278b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80278f:	48 89 d6             	mov    %rdx,%rsi
  802792:	89 c7                	mov    %eax,%edi
  802794:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  80279b:	00 00 00 
  80279e:	ff d0                	callq  *%rax
  8027a0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027a3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027a7:	78 0a                	js     8027b3 <fd_close+0x4c>
  8027a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027ad:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8027b1:	74 12                	je     8027c5 <fd_close+0x5e>
  8027b3:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8027b7:	74 05                	je     8027be <fd_close+0x57>
  8027b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027bc:	eb 05                	jmp    8027c3 <fd_close+0x5c>
  8027be:	b8 00 00 00 00       	mov    $0x0,%eax
  8027c3:	eb 69                	jmp    80282e <fd_close+0xc7>
  8027c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027c9:	8b 00                	mov    (%rax),%eax
  8027cb:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8027cf:	48 89 d6             	mov    %rdx,%rsi
  8027d2:	89 c7                	mov    %eax,%edi
  8027d4:	48 b8 30 28 80 00 00 	movabs $0x802830,%rax
  8027db:	00 00 00 
  8027de:	ff d0                	callq  *%rax
  8027e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027e7:	78 2a                	js     802813 <fd_close+0xac>
  8027e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027ed:	48 8b 40 20          	mov    0x20(%rax),%rax
  8027f1:	48 85 c0             	test   %rax,%rax
  8027f4:	74 16                	je     80280c <fd_close+0xa5>
  8027f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027fa:	48 8b 40 20          	mov    0x20(%rax),%rax
  8027fe:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802802:	48 89 d7             	mov    %rdx,%rdi
  802805:	ff d0                	callq  *%rax
  802807:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80280a:	eb 07                	jmp    802813 <fd_close+0xac>
  80280c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802813:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802817:	48 89 c6             	mov    %rax,%rsi
  80281a:	bf 00 00 00 00       	mov    $0x0,%edi
  80281f:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  802826:	00 00 00 
  802829:	ff d0                	callq  *%rax
  80282b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80282e:	c9                   	leaveq 
  80282f:	c3                   	retq   

0000000000802830 <dev_lookup>:
  802830:	55                   	push   %rbp
  802831:	48 89 e5             	mov    %rsp,%rbp
  802834:	48 83 ec 20          	sub    $0x20,%rsp
  802838:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80283b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80283f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802846:	eb 41                	jmp    802889 <dev_lookup+0x59>
  802848:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80284f:	00 00 00 
  802852:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802855:	48 63 d2             	movslq %edx,%rdx
  802858:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80285c:	8b 00                	mov    (%rax),%eax
  80285e:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802861:	75 22                	jne    802885 <dev_lookup+0x55>
  802863:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80286a:	00 00 00 
  80286d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802870:	48 63 d2             	movslq %edx,%rdx
  802873:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802877:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80287b:	48 89 10             	mov    %rdx,(%rax)
  80287e:	b8 00 00 00 00       	mov    $0x0,%eax
  802883:	eb 60                	jmp    8028e5 <dev_lookup+0xb5>
  802885:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802889:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802890:	00 00 00 
  802893:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802896:	48 63 d2             	movslq %edx,%rdx
  802899:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80289d:	48 85 c0             	test   %rax,%rax
  8028a0:	75 a6                	jne    802848 <dev_lookup+0x18>
  8028a2:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8028a9:	00 00 00 
  8028ac:	48 8b 00             	mov    (%rax),%rax
  8028af:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8028b5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8028b8:	89 c6                	mov    %eax,%esi
  8028ba:	48 bf 38 52 80 00 00 	movabs $0x805238,%rdi
  8028c1:	00 00 00 
  8028c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8028c9:	48 b9 1a 06 80 00 00 	movabs $0x80061a,%rcx
  8028d0:	00 00 00 
  8028d3:	ff d1                	callq  *%rcx
  8028d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8028d9:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8028e0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8028e5:	c9                   	leaveq 
  8028e6:	c3                   	retq   

00000000008028e7 <close>:
  8028e7:	55                   	push   %rbp
  8028e8:	48 89 e5             	mov    %rsp,%rbp
  8028eb:	48 83 ec 20          	sub    $0x20,%rsp
  8028ef:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028f2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028f6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028f9:	48 89 d6             	mov    %rdx,%rsi
  8028fc:	89 c7                	mov    %eax,%edi
  8028fe:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  802905:	00 00 00 
  802908:	ff d0                	callq  *%rax
  80290a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80290d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802911:	79 05                	jns    802918 <close+0x31>
  802913:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802916:	eb 18                	jmp    802930 <close+0x49>
  802918:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80291c:	be 01 00 00 00       	mov    $0x1,%esi
  802921:	48 89 c7             	mov    %rax,%rdi
  802924:	48 b8 67 27 80 00 00 	movabs $0x802767,%rax
  80292b:	00 00 00 
  80292e:	ff d0                	callq  *%rax
  802930:	c9                   	leaveq 
  802931:	c3                   	retq   

0000000000802932 <close_all>:
  802932:	55                   	push   %rbp
  802933:	48 89 e5             	mov    %rsp,%rbp
  802936:	48 83 ec 10          	sub    $0x10,%rsp
  80293a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802941:	eb 15                	jmp    802958 <close_all+0x26>
  802943:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802946:	89 c7                	mov    %eax,%edi
  802948:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  80294f:	00 00 00 
  802952:	ff d0                	callq  *%rax
  802954:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802958:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80295c:	7e e5                	jle    802943 <close_all+0x11>
  80295e:	c9                   	leaveq 
  80295f:	c3                   	retq   

0000000000802960 <dup>:
  802960:	55                   	push   %rbp
  802961:	48 89 e5             	mov    %rsp,%rbp
  802964:	48 83 ec 40          	sub    $0x40,%rsp
  802968:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80296b:	89 75 c8             	mov    %esi,-0x38(%rbp)
  80296e:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802972:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802975:	48 89 d6             	mov    %rdx,%rsi
  802978:	89 c7                	mov    %eax,%edi
  80297a:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  802981:	00 00 00 
  802984:	ff d0                	callq  *%rax
  802986:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802989:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80298d:	79 08                	jns    802997 <dup+0x37>
  80298f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802992:	e9 70 01 00 00       	jmpq   802b07 <dup+0x1a7>
  802997:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80299a:	89 c7                	mov    %eax,%edi
  80299c:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  8029a3:	00 00 00 
  8029a6:	ff d0                	callq  *%rax
  8029a8:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8029ab:	48 98                	cltq   
  8029ad:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8029b3:	48 c1 e0 0c          	shl    $0xc,%rax
  8029b7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8029bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029bf:	48 89 c7             	mov    %rax,%rdi
  8029c2:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  8029c9:	00 00 00 
  8029cc:	ff d0                	callq  *%rax
  8029ce:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8029d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029d6:	48 89 c7             	mov    %rax,%rdi
  8029d9:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  8029e0:	00 00 00 
  8029e3:	ff d0                	callq  *%rax
  8029e5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8029e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029ed:	48 c1 e8 15          	shr    $0x15,%rax
  8029f1:	48 89 c2             	mov    %rax,%rdx
  8029f4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8029fb:	01 00 00 
  8029fe:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a02:	83 e0 01             	and    $0x1,%eax
  802a05:	48 85 c0             	test   %rax,%rax
  802a08:	74 73                	je     802a7d <dup+0x11d>
  802a0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a0e:	48 c1 e8 0c          	shr    $0xc,%rax
  802a12:	48 89 c2             	mov    %rax,%rdx
  802a15:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a1c:	01 00 00 
  802a1f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a23:	83 e0 01             	and    $0x1,%eax
  802a26:	48 85 c0             	test   %rax,%rax
  802a29:	74 52                	je     802a7d <dup+0x11d>
  802a2b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a2f:	48 c1 e8 0c          	shr    $0xc,%rax
  802a33:	48 89 c2             	mov    %rax,%rdx
  802a36:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a3d:	01 00 00 
  802a40:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a44:	25 07 0e 00 00       	and    $0xe07,%eax
  802a49:	89 c1                	mov    %eax,%ecx
  802a4b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802a4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a53:	41 89 c8             	mov    %ecx,%r8d
  802a56:	48 89 d1             	mov    %rdx,%rcx
  802a59:	ba 00 00 00 00       	mov    $0x0,%edx
  802a5e:	48 89 c6             	mov    %rax,%rsi
  802a61:	bf 00 00 00 00       	mov    $0x0,%edi
  802a66:	48 b8 4e 1b 80 00 00 	movabs $0x801b4e,%rax
  802a6d:	00 00 00 
  802a70:	ff d0                	callq  *%rax
  802a72:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a75:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a79:	79 02                	jns    802a7d <dup+0x11d>
  802a7b:	eb 57                	jmp    802ad4 <dup+0x174>
  802a7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a81:	48 c1 e8 0c          	shr    $0xc,%rax
  802a85:	48 89 c2             	mov    %rax,%rdx
  802a88:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a8f:	01 00 00 
  802a92:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a96:	25 07 0e 00 00       	and    $0xe07,%eax
  802a9b:	89 c1                	mov    %eax,%ecx
  802a9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802aa1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802aa5:	41 89 c8             	mov    %ecx,%r8d
  802aa8:	48 89 d1             	mov    %rdx,%rcx
  802aab:	ba 00 00 00 00       	mov    $0x0,%edx
  802ab0:	48 89 c6             	mov    %rax,%rsi
  802ab3:	bf 00 00 00 00       	mov    $0x0,%edi
  802ab8:	48 b8 4e 1b 80 00 00 	movabs $0x801b4e,%rax
  802abf:	00 00 00 
  802ac2:	ff d0                	callq  *%rax
  802ac4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ac7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802acb:	79 02                	jns    802acf <dup+0x16f>
  802acd:	eb 05                	jmp    802ad4 <dup+0x174>
  802acf:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802ad2:	eb 33                	jmp    802b07 <dup+0x1a7>
  802ad4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ad8:	48 89 c6             	mov    %rax,%rsi
  802adb:	bf 00 00 00 00       	mov    $0x0,%edi
  802ae0:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  802ae7:	00 00 00 
  802aea:	ff d0                	callq  *%rax
  802aec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802af0:	48 89 c6             	mov    %rax,%rsi
  802af3:	bf 00 00 00 00       	mov    $0x0,%edi
  802af8:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  802aff:	00 00 00 
  802b02:	ff d0                	callq  *%rax
  802b04:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b07:	c9                   	leaveq 
  802b08:	c3                   	retq   

0000000000802b09 <read>:
  802b09:	55                   	push   %rbp
  802b0a:	48 89 e5             	mov    %rsp,%rbp
  802b0d:	48 83 ec 40          	sub    $0x40,%rsp
  802b11:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802b14:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b18:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b1c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b20:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b23:	48 89 d6             	mov    %rdx,%rsi
  802b26:	89 c7                	mov    %eax,%edi
  802b28:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  802b2f:	00 00 00 
  802b32:	ff d0                	callq  *%rax
  802b34:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b37:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b3b:	78 24                	js     802b61 <read+0x58>
  802b3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b41:	8b 00                	mov    (%rax),%eax
  802b43:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b47:	48 89 d6             	mov    %rdx,%rsi
  802b4a:	89 c7                	mov    %eax,%edi
  802b4c:	48 b8 30 28 80 00 00 	movabs $0x802830,%rax
  802b53:	00 00 00 
  802b56:	ff d0                	callq  *%rax
  802b58:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b5b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b5f:	79 05                	jns    802b66 <read+0x5d>
  802b61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b64:	eb 76                	jmp    802bdc <read+0xd3>
  802b66:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b6a:	8b 40 08             	mov    0x8(%rax),%eax
  802b6d:	83 e0 03             	and    $0x3,%eax
  802b70:	83 f8 01             	cmp    $0x1,%eax
  802b73:	75 3a                	jne    802baf <read+0xa6>
  802b75:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802b7c:	00 00 00 
  802b7f:	48 8b 00             	mov    (%rax),%rax
  802b82:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b88:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b8b:	89 c6                	mov    %eax,%esi
  802b8d:	48 bf 57 52 80 00 00 	movabs $0x805257,%rdi
  802b94:	00 00 00 
  802b97:	b8 00 00 00 00       	mov    $0x0,%eax
  802b9c:	48 b9 1a 06 80 00 00 	movabs $0x80061a,%rcx
  802ba3:	00 00 00 
  802ba6:	ff d1                	callq  *%rcx
  802ba8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802bad:	eb 2d                	jmp    802bdc <read+0xd3>
  802baf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bb3:	48 8b 40 10          	mov    0x10(%rax),%rax
  802bb7:	48 85 c0             	test   %rax,%rax
  802bba:	75 07                	jne    802bc3 <read+0xba>
  802bbc:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802bc1:	eb 19                	jmp    802bdc <read+0xd3>
  802bc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bc7:	48 8b 40 10          	mov    0x10(%rax),%rax
  802bcb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802bcf:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802bd3:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802bd7:	48 89 cf             	mov    %rcx,%rdi
  802bda:	ff d0                	callq  *%rax
  802bdc:	c9                   	leaveq 
  802bdd:	c3                   	retq   

0000000000802bde <readn>:
  802bde:	55                   	push   %rbp
  802bdf:	48 89 e5             	mov    %rsp,%rbp
  802be2:	48 83 ec 30          	sub    $0x30,%rsp
  802be6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802be9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802bed:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802bf1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802bf8:	eb 49                	jmp    802c43 <readn+0x65>
  802bfa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bfd:	48 98                	cltq   
  802bff:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802c03:	48 29 c2             	sub    %rax,%rdx
  802c06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c09:	48 63 c8             	movslq %eax,%rcx
  802c0c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c10:	48 01 c1             	add    %rax,%rcx
  802c13:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c16:	48 89 ce             	mov    %rcx,%rsi
  802c19:	89 c7                	mov    %eax,%edi
  802c1b:	48 b8 09 2b 80 00 00 	movabs $0x802b09,%rax
  802c22:	00 00 00 
  802c25:	ff d0                	callq  *%rax
  802c27:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c2a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c2e:	79 05                	jns    802c35 <readn+0x57>
  802c30:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c33:	eb 1c                	jmp    802c51 <readn+0x73>
  802c35:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c39:	75 02                	jne    802c3d <readn+0x5f>
  802c3b:	eb 11                	jmp    802c4e <readn+0x70>
  802c3d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c40:	01 45 fc             	add    %eax,-0x4(%rbp)
  802c43:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c46:	48 98                	cltq   
  802c48:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802c4c:	72 ac                	jb     802bfa <readn+0x1c>
  802c4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c51:	c9                   	leaveq 
  802c52:	c3                   	retq   

0000000000802c53 <write>:
  802c53:	55                   	push   %rbp
  802c54:	48 89 e5             	mov    %rsp,%rbp
  802c57:	48 83 ec 40          	sub    $0x40,%rsp
  802c5b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c5e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802c62:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802c66:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c6a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c6d:	48 89 d6             	mov    %rdx,%rsi
  802c70:	89 c7                	mov    %eax,%edi
  802c72:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  802c79:	00 00 00 
  802c7c:	ff d0                	callq  *%rax
  802c7e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c81:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c85:	78 24                	js     802cab <write+0x58>
  802c87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c8b:	8b 00                	mov    (%rax),%eax
  802c8d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c91:	48 89 d6             	mov    %rdx,%rsi
  802c94:	89 c7                	mov    %eax,%edi
  802c96:	48 b8 30 28 80 00 00 	movabs $0x802830,%rax
  802c9d:	00 00 00 
  802ca0:	ff d0                	callq  *%rax
  802ca2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ca5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ca9:	79 05                	jns    802cb0 <write+0x5d>
  802cab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cae:	eb 75                	jmp    802d25 <write+0xd2>
  802cb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cb4:	8b 40 08             	mov    0x8(%rax),%eax
  802cb7:	83 e0 03             	and    $0x3,%eax
  802cba:	85 c0                	test   %eax,%eax
  802cbc:	75 3a                	jne    802cf8 <write+0xa5>
  802cbe:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802cc5:	00 00 00 
  802cc8:	48 8b 00             	mov    (%rax),%rax
  802ccb:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802cd1:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802cd4:	89 c6                	mov    %eax,%esi
  802cd6:	48 bf 73 52 80 00 00 	movabs $0x805273,%rdi
  802cdd:	00 00 00 
  802ce0:	b8 00 00 00 00       	mov    $0x0,%eax
  802ce5:	48 b9 1a 06 80 00 00 	movabs $0x80061a,%rcx
  802cec:	00 00 00 
  802cef:	ff d1                	callq  *%rcx
  802cf1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802cf6:	eb 2d                	jmp    802d25 <write+0xd2>
  802cf8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cfc:	48 8b 40 18          	mov    0x18(%rax),%rax
  802d00:	48 85 c0             	test   %rax,%rax
  802d03:	75 07                	jne    802d0c <write+0xb9>
  802d05:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d0a:	eb 19                	jmp    802d25 <write+0xd2>
  802d0c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d10:	48 8b 40 18          	mov    0x18(%rax),%rax
  802d14:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802d18:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802d1c:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802d20:	48 89 cf             	mov    %rcx,%rdi
  802d23:	ff d0                	callq  *%rax
  802d25:	c9                   	leaveq 
  802d26:	c3                   	retq   

0000000000802d27 <seek>:
  802d27:	55                   	push   %rbp
  802d28:	48 89 e5             	mov    %rsp,%rbp
  802d2b:	48 83 ec 18          	sub    $0x18,%rsp
  802d2f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d32:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802d35:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d39:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d3c:	48 89 d6             	mov    %rdx,%rsi
  802d3f:	89 c7                	mov    %eax,%edi
  802d41:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  802d48:	00 00 00 
  802d4b:	ff d0                	callq  *%rax
  802d4d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d50:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d54:	79 05                	jns    802d5b <seek+0x34>
  802d56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d59:	eb 0f                	jmp    802d6a <seek+0x43>
  802d5b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d5f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802d62:	89 50 04             	mov    %edx,0x4(%rax)
  802d65:	b8 00 00 00 00       	mov    $0x0,%eax
  802d6a:	c9                   	leaveq 
  802d6b:	c3                   	retq   

0000000000802d6c <ftruncate>:
  802d6c:	55                   	push   %rbp
  802d6d:	48 89 e5             	mov    %rsp,%rbp
  802d70:	48 83 ec 30          	sub    $0x30,%rsp
  802d74:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d77:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802d7a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d7e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d81:	48 89 d6             	mov    %rdx,%rsi
  802d84:	89 c7                	mov    %eax,%edi
  802d86:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  802d8d:	00 00 00 
  802d90:	ff d0                	callq  *%rax
  802d92:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d95:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d99:	78 24                	js     802dbf <ftruncate+0x53>
  802d9b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d9f:	8b 00                	mov    (%rax),%eax
  802da1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802da5:	48 89 d6             	mov    %rdx,%rsi
  802da8:	89 c7                	mov    %eax,%edi
  802daa:	48 b8 30 28 80 00 00 	movabs $0x802830,%rax
  802db1:	00 00 00 
  802db4:	ff d0                	callq  *%rax
  802db6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802db9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dbd:	79 05                	jns    802dc4 <ftruncate+0x58>
  802dbf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dc2:	eb 72                	jmp    802e36 <ftruncate+0xca>
  802dc4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802dc8:	8b 40 08             	mov    0x8(%rax),%eax
  802dcb:	83 e0 03             	and    $0x3,%eax
  802dce:	85 c0                	test   %eax,%eax
  802dd0:	75 3a                	jne    802e0c <ftruncate+0xa0>
  802dd2:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802dd9:	00 00 00 
  802ddc:	48 8b 00             	mov    (%rax),%rax
  802ddf:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802de5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802de8:	89 c6                	mov    %eax,%esi
  802dea:	48 bf 90 52 80 00 00 	movabs $0x805290,%rdi
  802df1:	00 00 00 
  802df4:	b8 00 00 00 00       	mov    $0x0,%eax
  802df9:	48 b9 1a 06 80 00 00 	movabs $0x80061a,%rcx
  802e00:	00 00 00 
  802e03:	ff d1                	callq  *%rcx
  802e05:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802e0a:	eb 2a                	jmp    802e36 <ftruncate+0xca>
  802e0c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e10:	48 8b 40 30          	mov    0x30(%rax),%rax
  802e14:	48 85 c0             	test   %rax,%rax
  802e17:	75 07                	jne    802e20 <ftruncate+0xb4>
  802e19:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e1e:	eb 16                	jmp    802e36 <ftruncate+0xca>
  802e20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e24:	48 8b 40 30          	mov    0x30(%rax),%rax
  802e28:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e2c:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802e2f:	89 ce                	mov    %ecx,%esi
  802e31:	48 89 d7             	mov    %rdx,%rdi
  802e34:	ff d0                	callq  *%rax
  802e36:	c9                   	leaveq 
  802e37:	c3                   	retq   

0000000000802e38 <fstat>:
  802e38:	55                   	push   %rbp
  802e39:	48 89 e5             	mov    %rsp,%rbp
  802e3c:	48 83 ec 30          	sub    $0x30,%rsp
  802e40:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e43:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e47:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e4b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e4e:	48 89 d6             	mov    %rdx,%rsi
  802e51:	89 c7                	mov    %eax,%edi
  802e53:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  802e5a:	00 00 00 
  802e5d:	ff d0                	callq  *%rax
  802e5f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e62:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e66:	78 24                	js     802e8c <fstat+0x54>
  802e68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e6c:	8b 00                	mov    (%rax),%eax
  802e6e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e72:	48 89 d6             	mov    %rdx,%rsi
  802e75:	89 c7                	mov    %eax,%edi
  802e77:	48 b8 30 28 80 00 00 	movabs $0x802830,%rax
  802e7e:	00 00 00 
  802e81:	ff d0                	callq  *%rax
  802e83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e8a:	79 05                	jns    802e91 <fstat+0x59>
  802e8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e8f:	eb 5e                	jmp    802eef <fstat+0xb7>
  802e91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e95:	48 8b 40 28          	mov    0x28(%rax),%rax
  802e99:	48 85 c0             	test   %rax,%rax
  802e9c:	75 07                	jne    802ea5 <fstat+0x6d>
  802e9e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ea3:	eb 4a                	jmp    802eef <fstat+0xb7>
  802ea5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ea9:	c6 00 00             	movb   $0x0,(%rax)
  802eac:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802eb0:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802eb7:	00 00 00 
  802eba:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ebe:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802ec5:	00 00 00 
  802ec8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ecc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ed0:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802ed7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802edb:	48 8b 40 28          	mov    0x28(%rax),%rax
  802edf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ee3:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802ee7:	48 89 ce             	mov    %rcx,%rsi
  802eea:	48 89 d7             	mov    %rdx,%rdi
  802eed:	ff d0                	callq  *%rax
  802eef:	c9                   	leaveq 
  802ef0:	c3                   	retq   

0000000000802ef1 <stat>:
  802ef1:	55                   	push   %rbp
  802ef2:	48 89 e5             	mov    %rsp,%rbp
  802ef5:	48 83 ec 20          	sub    $0x20,%rsp
  802ef9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802efd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f05:	be 00 00 00 00       	mov    $0x0,%esi
  802f0a:	48 89 c7             	mov    %rax,%rdi
  802f0d:	48 b8 df 2f 80 00 00 	movabs $0x802fdf,%rax
  802f14:	00 00 00 
  802f17:	ff d0                	callq  *%rax
  802f19:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f1c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f20:	79 05                	jns    802f27 <stat+0x36>
  802f22:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f25:	eb 2f                	jmp    802f56 <stat+0x65>
  802f27:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802f2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f2e:	48 89 d6             	mov    %rdx,%rsi
  802f31:	89 c7                	mov    %eax,%edi
  802f33:	48 b8 38 2e 80 00 00 	movabs $0x802e38,%rax
  802f3a:	00 00 00 
  802f3d:	ff d0                	callq  *%rax
  802f3f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802f42:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f45:	89 c7                	mov    %eax,%edi
  802f47:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  802f4e:	00 00 00 
  802f51:	ff d0                	callq  *%rax
  802f53:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f56:	c9                   	leaveq 
  802f57:	c3                   	retq   

0000000000802f58 <fsipc>:
  802f58:	55                   	push   %rbp
  802f59:	48 89 e5             	mov    %rsp,%rbp
  802f5c:	48 83 ec 10          	sub    $0x10,%rsp
  802f60:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802f63:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802f67:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f6e:	00 00 00 
  802f71:	8b 00                	mov    (%rax),%eax
  802f73:	85 c0                	test   %eax,%eax
  802f75:	75 1d                	jne    802f94 <fsipc+0x3c>
  802f77:	bf 01 00 00 00       	mov    $0x1,%edi
  802f7c:	48 b8 b8 49 80 00 00 	movabs $0x8049b8,%rax
  802f83:	00 00 00 
  802f86:	ff d0                	callq  *%rax
  802f88:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802f8f:	00 00 00 
  802f92:	89 02                	mov    %eax,(%rdx)
  802f94:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f9b:	00 00 00 
  802f9e:	8b 00                	mov    (%rax),%eax
  802fa0:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802fa3:	b9 07 00 00 00       	mov    $0x7,%ecx
  802fa8:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802faf:	00 00 00 
  802fb2:	89 c7                	mov    %eax,%edi
  802fb4:	48 b8 22 49 80 00 00 	movabs $0x804922,%rax
  802fbb:	00 00 00 
  802fbe:	ff d0                	callq  *%rax
  802fc0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fc4:	ba 00 00 00 00       	mov    $0x0,%edx
  802fc9:	48 89 c6             	mov    %rax,%rsi
  802fcc:	bf 00 00 00 00       	mov    $0x0,%edi
  802fd1:	48 b8 61 48 80 00 00 	movabs $0x804861,%rax
  802fd8:	00 00 00 
  802fdb:	ff d0                	callq  *%rax
  802fdd:	c9                   	leaveq 
  802fde:	c3                   	retq   

0000000000802fdf <open>:
  802fdf:	55                   	push   %rbp
  802fe0:	48 89 e5             	mov    %rsp,%rbp
  802fe3:	48 83 ec 20          	sub    $0x20,%rsp
  802fe7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802feb:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802fee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ff2:	48 89 c7             	mov    %rax,%rdi
  802ff5:	48 b8 63 11 80 00 00 	movabs $0x801163,%rax
  802ffc:	00 00 00 
  802fff:	ff d0                	callq  *%rax
  803001:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803006:	7e 0a                	jle    803012 <open+0x33>
  803008:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80300d:	e9 a5 00 00 00       	jmpq   8030b7 <open+0xd8>
  803012:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803016:	48 89 c7             	mov    %rax,%rdi
  803019:	48 b8 3f 26 80 00 00 	movabs $0x80263f,%rax
  803020:	00 00 00 
  803023:	ff d0                	callq  *%rax
  803025:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803028:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80302c:	79 08                	jns    803036 <open+0x57>
  80302e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803031:	e9 81 00 00 00       	jmpq   8030b7 <open+0xd8>
  803036:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80303a:	48 89 c6             	mov    %rax,%rsi
  80303d:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803044:	00 00 00 
  803047:	48 b8 cf 11 80 00 00 	movabs $0x8011cf,%rax
  80304e:	00 00 00 
  803051:	ff d0                	callq  *%rax
  803053:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80305a:	00 00 00 
  80305d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803060:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803066:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80306a:	48 89 c6             	mov    %rax,%rsi
  80306d:	bf 01 00 00 00       	mov    $0x1,%edi
  803072:	48 b8 58 2f 80 00 00 	movabs $0x802f58,%rax
  803079:	00 00 00 
  80307c:	ff d0                	callq  *%rax
  80307e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803081:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803085:	79 1d                	jns    8030a4 <open+0xc5>
  803087:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80308b:	be 00 00 00 00       	mov    $0x0,%esi
  803090:	48 89 c7             	mov    %rax,%rdi
  803093:	48 b8 67 27 80 00 00 	movabs $0x802767,%rax
  80309a:	00 00 00 
  80309d:	ff d0                	callq  *%rax
  80309f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030a2:	eb 13                	jmp    8030b7 <open+0xd8>
  8030a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030a8:	48 89 c7             	mov    %rax,%rdi
  8030ab:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  8030b2:	00 00 00 
  8030b5:	ff d0                	callq  *%rax
  8030b7:	c9                   	leaveq 
  8030b8:	c3                   	retq   

00000000008030b9 <devfile_flush>:
  8030b9:	55                   	push   %rbp
  8030ba:	48 89 e5             	mov    %rsp,%rbp
  8030bd:	48 83 ec 10          	sub    $0x10,%rsp
  8030c1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030c9:	8b 50 0c             	mov    0xc(%rax),%edx
  8030cc:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030d3:	00 00 00 
  8030d6:	89 10                	mov    %edx,(%rax)
  8030d8:	be 00 00 00 00       	mov    $0x0,%esi
  8030dd:	bf 06 00 00 00       	mov    $0x6,%edi
  8030e2:	48 b8 58 2f 80 00 00 	movabs $0x802f58,%rax
  8030e9:	00 00 00 
  8030ec:	ff d0                	callq  *%rax
  8030ee:	c9                   	leaveq 
  8030ef:	c3                   	retq   

00000000008030f0 <devfile_read>:
  8030f0:	55                   	push   %rbp
  8030f1:	48 89 e5             	mov    %rsp,%rbp
  8030f4:	48 83 ec 30          	sub    $0x30,%rsp
  8030f8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030fc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803100:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803104:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803108:	8b 50 0c             	mov    0xc(%rax),%edx
  80310b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803112:	00 00 00 
  803115:	89 10                	mov    %edx,(%rax)
  803117:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80311e:	00 00 00 
  803121:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803125:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803129:	be 00 00 00 00       	mov    $0x0,%esi
  80312e:	bf 03 00 00 00       	mov    $0x3,%edi
  803133:	48 b8 58 2f 80 00 00 	movabs $0x802f58,%rax
  80313a:	00 00 00 
  80313d:	ff d0                	callq  *%rax
  80313f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803142:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803146:	79 08                	jns    803150 <devfile_read+0x60>
  803148:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80314b:	e9 a4 00 00 00       	jmpq   8031f4 <devfile_read+0x104>
  803150:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803153:	48 98                	cltq   
  803155:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803159:	76 35                	jbe    803190 <devfile_read+0xa0>
  80315b:	48 b9 b6 52 80 00 00 	movabs $0x8052b6,%rcx
  803162:	00 00 00 
  803165:	48 ba bd 52 80 00 00 	movabs $0x8052bd,%rdx
  80316c:	00 00 00 
  80316f:	be 89 00 00 00       	mov    $0x89,%esi
  803174:	48 bf d2 52 80 00 00 	movabs $0x8052d2,%rdi
  80317b:	00 00 00 
  80317e:	b8 00 00 00 00       	mov    $0x0,%eax
  803183:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  80318a:	00 00 00 
  80318d:	41 ff d0             	callq  *%r8
  803190:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803197:	7e 35                	jle    8031ce <devfile_read+0xde>
  803199:	48 b9 e0 52 80 00 00 	movabs $0x8052e0,%rcx
  8031a0:	00 00 00 
  8031a3:	48 ba bd 52 80 00 00 	movabs $0x8052bd,%rdx
  8031aa:	00 00 00 
  8031ad:	be 8a 00 00 00       	mov    $0x8a,%esi
  8031b2:	48 bf d2 52 80 00 00 	movabs $0x8052d2,%rdi
  8031b9:	00 00 00 
  8031bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8031c1:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8031c8:	00 00 00 
  8031cb:	41 ff d0             	callq  *%r8
  8031ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031d1:	48 63 d0             	movslq %eax,%rdx
  8031d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031d8:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8031df:	00 00 00 
  8031e2:	48 89 c7             	mov    %rax,%rdi
  8031e5:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  8031ec:	00 00 00 
  8031ef:	ff d0                	callq  *%rax
  8031f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031f4:	c9                   	leaveq 
  8031f5:	c3                   	retq   

00000000008031f6 <devfile_write>:
  8031f6:	55                   	push   %rbp
  8031f7:	48 89 e5             	mov    %rsp,%rbp
  8031fa:	48 83 ec 40          	sub    $0x40,%rsp
  8031fe:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803202:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803206:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80320a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80320e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803212:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803219:	00 
  80321a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80321e:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803222:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803227:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80322b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80322f:	8b 50 0c             	mov    0xc(%rax),%edx
  803232:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803239:	00 00 00 
  80323c:	89 10                	mov    %edx,(%rax)
  80323e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803245:	00 00 00 
  803248:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80324c:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803250:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803254:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803258:	48 89 c6             	mov    %rax,%rsi
  80325b:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803262:	00 00 00 
  803265:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  80326c:	00 00 00 
  80326f:	ff d0                	callq  *%rax
  803271:	be 00 00 00 00       	mov    $0x0,%esi
  803276:	bf 04 00 00 00       	mov    $0x4,%edi
  80327b:	48 b8 58 2f 80 00 00 	movabs $0x802f58,%rax
  803282:	00 00 00 
  803285:	ff d0                	callq  *%rax
  803287:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80328a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80328e:	79 05                	jns    803295 <devfile_write+0x9f>
  803290:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803293:	eb 43                	jmp    8032d8 <devfile_write+0xe2>
  803295:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803298:	48 98                	cltq   
  80329a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80329e:	76 35                	jbe    8032d5 <devfile_write+0xdf>
  8032a0:	48 b9 b6 52 80 00 00 	movabs $0x8052b6,%rcx
  8032a7:	00 00 00 
  8032aa:	48 ba bd 52 80 00 00 	movabs $0x8052bd,%rdx
  8032b1:	00 00 00 
  8032b4:	be a8 00 00 00       	mov    $0xa8,%esi
  8032b9:	48 bf d2 52 80 00 00 	movabs $0x8052d2,%rdi
  8032c0:	00 00 00 
  8032c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8032c8:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8032cf:	00 00 00 
  8032d2:	41 ff d0             	callq  *%r8
  8032d5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032d8:	c9                   	leaveq 
  8032d9:	c3                   	retq   

00000000008032da <devfile_stat>:
  8032da:	55                   	push   %rbp
  8032db:	48 89 e5             	mov    %rsp,%rbp
  8032de:	48 83 ec 20          	sub    $0x20,%rsp
  8032e2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8032e6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032ee:	8b 50 0c             	mov    0xc(%rax),%edx
  8032f1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032f8:	00 00 00 
  8032fb:	89 10                	mov    %edx,(%rax)
  8032fd:	be 00 00 00 00       	mov    $0x0,%esi
  803302:	bf 05 00 00 00       	mov    $0x5,%edi
  803307:	48 b8 58 2f 80 00 00 	movabs $0x802f58,%rax
  80330e:	00 00 00 
  803311:	ff d0                	callq  *%rax
  803313:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803316:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80331a:	79 05                	jns    803321 <devfile_stat+0x47>
  80331c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80331f:	eb 56                	jmp    803377 <devfile_stat+0x9d>
  803321:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803325:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80332c:	00 00 00 
  80332f:	48 89 c7             	mov    %rax,%rdi
  803332:	48 b8 cf 11 80 00 00 	movabs $0x8011cf,%rax
  803339:	00 00 00 
  80333c:	ff d0                	callq  *%rax
  80333e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803345:	00 00 00 
  803348:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  80334e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803352:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803358:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80335f:	00 00 00 
  803362:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803368:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80336c:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803372:	b8 00 00 00 00       	mov    $0x0,%eax
  803377:	c9                   	leaveq 
  803378:	c3                   	retq   

0000000000803379 <devfile_trunc>:
  803379:	55                   	push   %rbp
  80337a:	48 89 e5             	mov    %rsp,%rbp
  80337d:	48 83 ec 10          	sub    $0x10,%rsp
  803381:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803385:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803388:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80338c:	8b 50 0c             	mov    0xc(%rax),%edx
  80338f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803396:	00 00 00 
  803399:	89 10                	mov    %edx,(%rax)
  80339b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033a2:	00 00 00 
  8033a5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8033a8:	89 50 04             	mov    %edx,0x4(%rax)
  8033ab:	be 00 00 00 00       	mov    $0x0,%esi
  8033b0:	bf 02 00 00 00       	mov    $0x2,%edi
  8033b5:	48 b8 58 2f 80 00 00 	movabs $0x802f58,%rax
  8033bc:	00 00 00 
  8033bf:	ff d0                	callq  *%rax
  8033c1:	c9                   	leaveq 
  8033c2:	c3                   	retq   

00000000008033c3 <remove>:
  8033c3:	55                   	push   %rbp
  8033c4:	48 89 e5             	mov    %rsp,%rbp
  8033c7:	48 83 ec 10          	sub    $0x10,%rsp
  8033cb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8033cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033d3:	48 89 c7             	mov    %rax,%rdi
  8033d6:	48 b8 63 11 80 00 00 	movabs $0x801163,%rax
  8033dd:	00 00 00 
  8033e0:	ff d0                	callq  *%rax
  8033e2:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8033e7:	7e 07                	jle    8033f0 <remove+0x2d>
  8033e9:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8033ee:	eb 33                	jmp    803423 <remove+0x60>
  8033f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033f4:	48 89 c6             	mov    %rax,%rsi
  8033f7:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8033fe:	00 00 00 
  803401:	48 b8 cf 11 80 00 00 	movabs $0x8011cf,%rax
  803408:	00 00 00 
  80340b:	ff d0                	callq  *%rax
  80340d:	be 00 00 00 00       	mov    $0x0,%esi
  803412:	bf 07 00 00 00       	mov    $0x7,%edi
  803417:	48 b8 58 2f 80 00 00 	movabs $0x802f58,%rax
  80341e:	00 00 00 
  803421:	ff d0                	callq  *%rax
  803423:	c9                   	leaveq 
  803424:	c3                   	retq   

0000000000803425 <sync>:
  803425:	55                   	push   %rbp
  803426:	48 89 e5             	mov    %rsp,%rbp
  803429:	be 00 00 00 00       	mov    $0x0,%esi
  80342e:	bf 08 00 00 00       	mov    $0x8,%edi
  803433:	48 b8 58 2f 80 00 00 	movabs $0x802f58,%rax
  80343a:	00 00 00 
  80343d:	ff d0                	callq  *%rax
  80343f:	5d                   	pop    %rbp
  803440:	c3                   	retq   

0000000000803441 <copy>:
  803441:	55                   	push   %rbp
  803442:	48 89 e5             	mov    %rsp,%rbp
  803445:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80344c:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803453:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80345a:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803461:	be 00 00 00 00       	mov    $0x0,%esi
  803466:	48 89 c7             	mov    %rax,%rdi
  803469:	48 b8 df 2f 80 00 00 	movabs $0x802fdf,%rax
  803470:	00 00 00 
  803473:	ff d0                	callq  *%rax
  803475:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803478:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80347c:	79 28                	jns    8034a6 <copy+0x65>
  80347e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803481:	89 c6                	mov    %eax,%esi
  803483:	48 bf ec 52 80 00 00 	movabs $0x8052ec,%rdi
  80348a:	00 00 00 
  80348d:	b8 00 00 00 00       	mov    $0x0,%eax
  803492:	48 ba 1a 06 80 00 00 	movabs $0x80061a,%rdx
  803499:	00 00 00 
  80349c:	ff d2                	callq  *%rdx
  80349e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034a1:	e9 74 01 00 00       	jmpq   80361a <copy+0x1d9>
  8034a6:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8034ad:	be 01 01 00 00       	mov    $0x101,%esi
  8034b2:	48 89 c7             	mov    %rax,%rdi
  8034b5:	48 b8 df 2f 80 00 00 	movabs $0x802fdf,%rax
  8034bc:	00 00 00 
  8034bf:	ff d0                	callq  *%rax
  8034c1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8034c4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8034c8:	79 39                	jns    803503 <copy+0xc2>
  8034ca:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034cd:	89 c6                	mov    %eax,%esi
  8034cf:	48 bf 02 53 80 00 00 	movabs $0x805302,%rdi
  8034d6:	00 00 00 
  8034d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8034de:	48 ba 1a 06 80 00 00 	movabs $0x80061a,%rdx
  8034e5:	00 00 00 
  8034e8:	ff d2                	callq  *%rdx
  8034ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ed:	89 c7                	mov    %eax,%edi
  8034ef:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  8034f6:	00 00 00 
  8034f9:	ff d0                	callq  *%rax
  8034fb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034fe:	e9 17 01 00 00       	jmpq   80361a <copy+0x1d9>
  803503:	eb 74                	jmp    803579 <copy+0x138>
  803505:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803508:	48 63 d0             	movslq %eax,%rdx
  80350b:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803512:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803515:	48 89 ce             	mov    %rcx,%rsi
  803518:	89 c7                	mov    %eax,%edi
  80351a:	48 b8 53 2c 80 00 00 	movabs $0x802c53,%rax
  803521:	00 00 00 
  803524:	ff d0                	callq  *%rax
  803526:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803529:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80352d:	79 4a                	jns    803579 <copy+0x138>
  80352f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803532:	89 c6                	mov    %eax,%esi
  803534:	48 bf 1c 53 80 00 00 	movabs $0x80531c,%rdi
  80353b:	00 00 00 
  80353e:	b8 00 00 00 00       	mov    $0x0,%eax
  803543:	48 ba 1a 06 80 00 00 	movabs $0x80061a,%rdx
  80354a:	00 00 00 
  80354d:	ff d2                	callq  *%rdx
  80354f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803552:	89 c7                	mov    %eax,%edi
  803554:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  80355b:	00 00 00 
  80355e:	ff d0                	callq  *%rax
  803560:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803563:	89 c7                	mov    %eax,%edi
  803565:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  80356c:	00 00 00 
  80356f:	ff d0                	callq  *%rax
  803571:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803574:	e9 a1 00 00 00       	jmpq   80361a <copy+0x1d9>
  803579:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803580:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803583:	ba 00 02 00 00       	mov    $0x200,%edx
  803588:	48 89 ce             	mov    %rcx,%rsi
  80358b:	89 c7                	mov    %eax,%edi
  80358d:	48 b8 09 2b 80 00 00 	movabs $0x802b09,%rax
  803594:	00 00 00 
  803597:	ff d0                	callq  *%rax
  803599:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80359c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8035a0:	0f 8f 5f ff ff ff    	jg     803505 <copy+0xc4>
  8035a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8035aa:	79 47                	jns    8035f3 <copy+0x1b2>
  8035ac:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8035af:	89 c6                	mov    %eax,%esi
  8035b1:	48 bf 2f 53 80 00 00 	movabs $0x80532f,%rdi
  8035b8:	00 00 00 
  8035bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8035c0:	48 ba 1a 06 80 00 00 	movabs $0x80061a,%rdx
  8035c7:	00 00 00 
  8035ca:	ff d2                	callq  *%rdx
  8035cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035cf:	89 c7                	mov    %eax,%edi
  8035d1:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  8035d8:	00 00 00 
  8035db:	ff d0                	callq  *%rax
  8035dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035e0:	89 c7                	mov    %eax,%edi
  8035e2:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  8035e9:	00 00 00 
  8035ec:	ff d0                	callq  *%rax
  8035ee:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8035f1:	eb 27                	jmp    80361a <copy+0x1d9>
  8035f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035f6:	89 c7                	mov    %eax,%edi
  8035f8:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  8035ff:	00 00 00 
  803602:	ff d0                	callq  *%rax
  803604:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803607:	89 c7                	mov    %eax,%edi
  803609:	48 b8 e7 28 80 00 00 	movabs $0x8028e7,%rax
  803610:	00 00 00 
  803613:	ff d0                	callq  *%rax
  803615:	b8 00 00 00 00       	mov    $0x0,%eax
  80361a:	c9                   	leaveq 
  80361b:	c3                   	retq   

000000000080361c <fd2sockid>:
  80361c:	55                   	push   %rbp
  80361d:	48 89 e5             	mov    %rsp,%rbp
  803620:	48 83 ec 20          	sub    $0x20,%rsp
  803624:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803627:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80362b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80362e:	48 89 d6             	mov    %rdx,%rsi
  803631:	89 c7                	mov    %eax,%edi
  803633:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  80363a:	00 00 00 
  80363d:	ff d0                	callq  *%rax
  80363f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803642:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803646:	79 05                	jns    80364d <fd2sockid+0x31>
  803648:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80364b:	eb 24                	jmp    803671 <fd2sockid+0x55>
  80364d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803651:	8b 10                	mov    (%rax),%edx
  803653:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  80365a:	00 00 00 
  80365d:	8b 00                	mov    (%rax),%eax
  80365f:	39 c2                	cmp    %eax,%edx
  803661:	74 07                	je     80366a <fd2sockid+0x4e>
  803663:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803668:	eb 07                	jmp    803671 <fd2sockid+0x55>
  80366a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80366e:	8b 40 0c             	mov    0xc(%rax),%eax
  803671:	c9                   	leaveq 
  803672:	c3                   	retq   

0000000000803673 <alloc_sockfd>:
  803673:	55                   	push   %rbp
  803674:	48 89 e5             	mov    %rsp,%rbp
  803677:	48 83 ec 20          	sub    $0x20,%rsp
  80367b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80367e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803682:	48 89 c7             	mov    %rax,%rdi
  803685:	48 b8 3f 26 80 00 00 	movabs $0x80263f,%rax
  80368c:	00 00 00 
  80368f:	ff d0                	callq  *%rax
  803691:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803694:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803698:	78 26                	js     8036c0 <alloc_sockfd+0x4d>
  80369a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80369e:	ba 07 04 00 00       	mov    $0x407,%edx
  8036a3:	48 89 c6             	mov    %rax,%rsi
  8036a6:	bf 00 00 00 00       	mov    $0x0,%edi
  8036ab:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  8036b2:	00 00 00 
  8036b5:	ff d0                	callq  *%rax
  8036b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036be:	79 16                	jns    8036d6 <alloc_sockfd+0x63>
  8036c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036c3:	89 c7                	mov    %eax,%edi
  8036c5:	48 b8 80 3b 80 00 00 	movabs $0x803b80,%rax
  8036cc:	00 00 00 
  8036cf:	ff d0                	callq  *%rax
  8036d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036d4:	eb 3a                	jmp    803710 <alloc_sockfd+0x9d>
  8036d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036da:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8036e1:	00 00 00 
  8036e4:	8b 12                	mov    (%rdx),%edx
  8036e6:	89 10                	mov    %edx,(%rax)
  8036e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036ec:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8036f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036f7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8036fa:	89 50 0c             	mov    %edx,0xc(%rax)
  8036fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803701:	48 89 c7             	mov    %rax,%rdi
  803704:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  80370b:	00 00 00 
  80370e:	ff d0                	callq  *%rax
  803710:	c9                   	leaveq 
  803711:	c3                   	retq   

0000000000803712 <accept>:
  803712:	55                   	push   %rbp
  803713:	48 89 e5             	mov    %rsp,%rbp
  803716:	48 83 ec 30          	sub    $0x30,%rsp
  80371a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80371d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803721:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803725:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803728:	89 c7                	mov    %eax,%edi
  80372a:	48 b8 1c 36 80 00 00 	movabs $0x80361c,%rax
  803731:	00 00 00 
  803734:	ff d0                	callq  *%rax
  803736:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803739:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80373d:	79 05                	jns    803744 <accept+0x32>
  80373f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803742:	eb 3b                	jmp    80377f <accept+0x6d>
  803744:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803748:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80374c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80374f:	48 89 ce             	mov    %rcx,%rsi
  803752:	89 c7                	mov    %eax,%edi
  803754:	48 b8 5d 3a 80 00 00 	movabs $0x803a5d,%rax
  80375b:	00 00 00 
  80375e:	ff d0                	callq  *%rax
  803760:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803763:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803767:	79 05                	jns    80376e <accept+0x5c>
  803769:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80376c:	eb 11                	jmp    80377f <accept+0x6d>
  80376e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803771:	89 c7                	mov    %eax,%edi
  803773:	48 b8 73 36 80 00 00 	movabs $0x803673,%rax
  80377a:	00 00 00 
  80377d:	ff d0                	callq  *%rax
  80377f:	c9                   	leaveq 
  803780:	c3                   	retq   

0000000000803781 <bind>:
  803781:	55                   	push   %rbp
  803782:	48 89 e5             	mov    %rsp,%rbp
  803785:	48 83 ec 20          	sub    $0x20,%rsp
  803789:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80378c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803790:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803793:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803796:	89 c7                	mov    %eax,%edi
  803798:	48 b8 1c 36 80 00 00 	movabs $0x80361c,%rax
  80379f:	00 00 00 
  8037a2:	ff d0                	callq  *%rax
  8037a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037ab:	79 05                	jns    8037b2 <bind+0x31>
  8037ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037b0:	eb 1b                	jmp    8037cd <bind+0x4c>
  8037b2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8037b5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8037b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037bc:	48 89 ce             	mov    %rcx,%rsi
  8037bf:	89 c7                	mov    %eax,%edi
  8037c1:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  8037c8:	00 00 00 
  8037cb:	ff d0                	callq  *%rax
  8037cd:	c9                   	leaveq 
  8037ce:	c3                   	retq   

00000000008037cf <shutdown>:
  8037cf:	55                   	push   %rbp
  8037d0:	48 89 e5             	mov    %rsp,%rbp
  8037d3:	48 83 ec 20          	sub    $0x20,%rsp
  8037d7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037da:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8037dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037e0:	89 c7                	mov    %eax,%edi
  8037e2:	48 b8 1c 36 80 00 00 	movabs $0x80361c,%rax
  8037e9:	00 00 00 
  8037ec:	ff d0                	callq  *%rax
  8037ee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037f1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037f5:	79 05                	jns    8037fc <shutdown+0x2d>
  8037f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037fa:	eb 16                	jmp    803812 <shutdown+0x43>
  8037fc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8037ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803802:	89 d6                	mov    %edx,%esi
  803804:	89 c7                	mov    %eax,%edi
  803806:	48 b8 40 3b 80 00 00 	movabs $0x803b40,%rax
  80380d:	00 00 00 
  803810:	ff d0                	callq  *%rax
  803812:	c9                   	leaveq 
  803813:	c3                   	retq   

0000000000803814 <devsock_close>:
  803814:	55                   	push   %rbp
  803815:	48 89 e5             	mov    %rsp,%rbp
  803818:	48 83 ec 10          	sub    $0x10,%rsp
  80381c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803820:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803824:	48 89 c7             	mov    %rax,%rdi
  803827:	48 b8 2a 4a 80 00 00 	movabs $0x804a2a,%rax
  80382e:	00 00 00 
  803831:	ff d0                	callq  *%rax
  803833:	83 f8 01             	cmp    $0x1,%eax
  803836:	75 17                	jne    80384f <devsock_close+0x3b>
  803838:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80383c:	8b 40 0c             	mov    0xc(%rax),%eax
  80383f:	89 c7                	mov    %eax,%edi
  803841:	48 b8 80 3b 80 00 00 	movabs $0x803b80,%rax
  803848:	00 00 00 
  80384b:	ff d0                	callq  *%rax
  80384d:	eb 05                	jmp    803854 <devsock_close+0x40>
  80384f:	b8 00 00 00 00       	mov    $0x0,%eax
  803854:	c9                   	leaveq 
  803855:	c3                   	retq   

0000000000803856 <connect>:
  803856:	55                   	push   %rbp
  803857:	48 89 e5             	mov    %rsp,%rbp
  80385a:	48 83 ec 20          	sub    $0x20,%rsp
  80385e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803861:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803865:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803868:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80386b:	89 c7                	mov    %eax,%edi
  80386d:	48 b8 1c 36 80 00 00 	movabs $0x80361c,%rax
  803874:	00 00 00 
  803877:	ff d0                	callq  *%rax
  803879:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80387c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803880:	79 05                	jns    803887 <connect+0x31>
  803882:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803885:	eb 1b                	jmp    8038a2 <connect+0x4c>
  803887:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80388a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80388e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803891:	48 89 ce             	mov    %rcx,%rsi
  803894:	89 c7                	mov    %eax,%edi
  803896:	48 b8 ad 3b 80 00 00 	movabs $0x803bad,%rax
  80389d:	00 00 00 
  8038a0:	ff d0                	callq  *%rax
  8038a2:	c9                   	leaveq 
  8038a3:	c3                   	retq   

00000000008038a4 <listen>:
  8038a4:	55                   	push   %rbp
  8038a5:	48 89 e5             	mov    %rsp,%rbp
  8038a8:	48 83 ec 20          	sub    $0x20,%rsp
  8038ac:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038af:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8038b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038b5:	89 c7                	mov    %eax,%edi
  8038b7:	48 b8 1c 36 80 00 00 	movabs $0x80361c,%rax
  8038be:	00 00 00 
  8038c1:	ff d0                	callq  *%rax
  8038c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038ca:	79 05                	jns    8038d1 <listen+0x2d>
  8038cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038cf:	eb 16                	jmp    8038e7 <listen+0x43>
  8038d1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038d7:	89 d6                	mov    %edx,%esi
  8038d9:	89 c7                	mov    %eax,%edi
  8038db:	48 b8 11 3c 80 00 00 	movabs $0x803c11,%rax
  8038e2:	00 00 00 
  8038e5:	ff d0                	callq  *%rax
  8038e7:	c9                   	leaveq 
  8038e8:	c3                   	retq   

00000000008038e9 <devsock_read>:
  8038e9:	55                   	push   %rbp
  8038ea:	48 89 e5             	mov    %rsp,%rbp
  8038ed:	48 83 ec 20          	sub    $0x20,%rsp
  8038f1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038f5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038f9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8038fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803901:	89 c2                	mov    %eax,%edx
  803903:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803907:	8b 40 0c             	mov    0xc(%rax),%eax
  80390a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80390e:	b9 00 00 00 00       	mov    $0x0,%ecx
  803913:	89 c7                	mov    %eax,%edi
  803915:	48 b8 51 3c 80 00 00 	movabs $0x803c51,%rax
  80391c:	00 00 00 
  80391f:	ff d0                	callq  *%rax
  803921:	c9                   	leaveq 
  803922:	c3                   	retq   

0000000000803923 <devsock_write>:
  803923:	55                   	push   %rbp
  803924:	48 89 e5             	mov    %rsp,%rbp
  803927:	48 83 ec 20          	sub    $0x20,%rsp
  80392b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80392f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803933:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803937:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80393b:	89 c2                	mov    %eax,%edx
  80393d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803941:	8b 40 0c             	mov    0xc(%rax),%eax
  803944:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803948:	b9 00 00 00 00       	mov    $0x0,%ecx
  80394d:	89 c7                	mov    %eax,%edi
  80394f:	48 b8 1d 3d 80 00 00 	movabs $0x803d1d,%rax
  803956:	00 00 00 
  803959:	ff d0                	callq  *%rax
  80395b:	c9                   	leaveq 
  80395c:	c3                   	retq   

000000000080395d <devsock_stat>:
  80395d:	55                   	push   %rbp
  80395e:	48 89 e5             	mov    %rsp,%rbp
  803961:	48 83 ec 10          	sub    $0x10,%rsp
  803965:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803969:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80396d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803971:	48 be 4a 53 80 00 00 	movabs $0x80534a,%rsi
  803978:	00 00 00 
  80397b:	48 89 c7             	mov    %rax,%rdi
  80397e:	48 b8 cf 11 80 00 00 	movabs $0x8011cf,%rax
  803985:	00 00 00 
  803988:	ff d0                	callq  *%rax
  80398a:	b8 00 00 00 00       	mov    $0x0,%eax
  80398f:	c9                   	leaveq 
  803990:	c3                   	retq   

0000000000803991 <socket>:
  803991:	55                   	push   %rbp
  803992:	48 89 e5             	mov    %rsp,%rbp
  803995:	48 83 ec 20          	sub    $0x20,%rsp
  803999:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80399c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80399f:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8039a2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8039a5:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8039a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039ab:	89 ce                	mov    %ecx,%esi
  8039ad:	89 c7                	mov    %eax,%edi
  8039af:	48 b8 d5 3d 80 00 00 	movabs $0x803dd5,%rax
  8039b6:	00 00 00 
  8039b9:	ff d0                	callq  *%rax
  8039bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039c2:	79 05                	jns    8039c9 <socket+0x38>
  8039c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039c7:	eb 11                	jmp    8039da <socket+0x49>
  8039c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039cc:	89 c7                	mov    %eax,%edi
  8039ce:	48 b8 73 36 80 00 00 	movabs $0x803673,%rax
  8039d5:	00 00 00 
  8039d8:	ff d0                	callq  *%rax
  8039da:	c9                   	leaveq 
  8039db:	c3                   	retq   

00000000008039dc <nsipc>:
  8039dc:	55                   	push   %rbp
  8039dd:	48 89 e5             	mov    %rsp,%rbp
  8039e0:	48 83 ec 10          	sub    $0x10,%rsp
  8039e4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039e7:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8039ee:	00 00 00 
  8039f1:	8b 00                	mov    (%rax),%eax
  8039f3:	85 c0                	test   %eax,%eax
  8039f5:	75 1d                	jne    803a14 <nsipc+0x38>
  8039f7:	bf 02 00 00 00       	mov    $0x2,%edi
  8039fc:	48 b8 b8 49 80 00 00 	movabs $0x8049b8,%rax
  803a03:	00 00 00 
  803a06:	ff d0                	callq  *%rax
  803a08:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803a0f:	00 00 00 
  803a12:	89 02                	mov    %eax,(%rdx)
  803a14:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803a1b:	00 00 00 
  803a1e:	8b 00                	mov    (%rax),%eax
  803a20:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803a23:	b9 07 00 00 00       	mov    $0x7,%ecx
  803a28:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803a2f:	00 00 00 
  803a32:	89 c7                	mov    %eax,%edi
  803a34:	48 b8 22 49 80 00 00 	movabs $0x804922,%rax
  803a3b:	00 00 00 
  803a3e:	ff d0                	callq  *%rax
  803a40:	ba 00 00 00 00       	mov    $0x0,%edx
  803a45:	be 00 00 00 00       	mov    $0x0,%esi
  803a4a:	bf 00 00 00 00       	mov    $0x0,%edi
  803a4f:	48 b8 61 48 80 00 00 	movabs $0x804861,%rax
  803a56:	00 00 00 
  803a59:	ff d0                	callq  *%rax
  803a5b:	c9                   	leaveq 
  803a5c:	c3                   	retq   

0000000000803a5d <nsipc_accept>:
  803a5d:	55                   	push   %rbp
  803a5e:	48 89 e5             	mov    %rsp,%rbp
  803a61:	48 83 ec 30          	sub    $0x30,%rsp
  803a65:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a68:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a6c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a70:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a77:	00 00 00 
  803a7a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803a7d:	89 10                	mov    %edx,(%rax)
  803a7f:	bf 01 00 00 00       	mov    $0x1,%edi
  803a84:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803a8b:	00 00 00 
  803a8e:	ff d0                	callq  *%rax
  803a90:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a93:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a97:	78 3e                	js     803ad7 <nsipc_accept+0x7a>
  803a99:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803aa0:	00 00 00 
  803aa3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803aa7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aab:	8b 40 10             	mov    0x10(%rax),%eax
  803aae:	89 c2                	mov    %eax,%edx
  803ab0:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803ab4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ab8:	48 89 ce             	mov    %rcx,%rsi
  803abb:	48 89 c7             	mov    %rax,%rdi
  803abe:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  803ac5:	00 00 00 
  803ac8:	ff d0                	callq  *%rax
  803aca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ace:	8b 50 10             	mov    0x10(%rax),%edx
  803ad1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ad5:	89 10                	mov    %edx,(%rax)
  803ad7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ada:	c9                   	leaveq 
  803adb:	c3                   	retq   

0000000000803adc <nsipc_bind>:
  803adc:	55                   	push   %rbp
  803add:	48 89 e5             	mov    %rsp,%rbp
  803ae0:	48 83 ec 10          	sub    $0x10,%rsp
  803ae4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ae7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803aeb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803aee:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803af5:	00 00 00 
  803af8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803afb:	89 10                	mov    %edx,(%rax)
  803afd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b00:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b04:	48 89 c6             	mov    %rax,%rsi
  803b07:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803b0e:	00 00 00 
  803b11:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  803b18:	00 00 00 
  803b1b:	ff d0                	callq  *%rax
  803b1d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b24:	00 00 00 
  803b27:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b2a:	89 50 14             	mov    %edx,0x14(%rax)
  803b2d:	bf 02 00 00 00       	mov    $0x2,%edi
  803b32:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803b39:	00 00 00 
  803b3c:	ff d0                	callq  *%rax
  803b3e:	c9                   	leaveq 
  803b3f:	c3                   	retq   

0000000000803b40 <nsipc_shutdown>:
  803b40:	55                   	push   %rbp
  803b41:	48 89 e5             	mov    %rsp,%rbp
  803b44:	48 83 ec 10          	sub    $0x10,%rsp
  803b48:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b4b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803b4e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b55:	00 00 00 
  803b58:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b5b:	89 10                	mov    %edx,(%rax)
  803b5d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b64:	00 00 00 
  803b67:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b6a:	89 50 04             	mov    %edx,0x4(%rax)
  803b6d:	bf 03 00 00 00       	mov    $0x3,%edi
  803b72:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803b79:	00 00 00 
  803b7c:	ff d0                	callq  *%rax
  803b7e:	c9                   	leaveq 
  803b7f:	c3                   	retq   

0000000000803b80 <nsipc_close>:
  803b80:	55                   	push   %rbp
  803b81:	48 89 e5             	mov    %rsp,%rbp
  803b84:	48 83 ec 10          	sub    $0x10,%rsp
  803b88:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b8b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b92:	00 00 00 
  803b95:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b98:	89 10                	mov    %edx,(%rax)
  803b9a:	bf 04 00 00 00       	mov    $0x4,%edi
  803b9f:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803ba6:	00 00 00 
  803ba9:	ff d0                	callq  *%rax
  803bab:	c9                   	leaveq 
  803bac:	c3                   	retq   

0000000000803bad <nsipc_connect>:
  803bad:	55                   	push   %rbp
  803bae:	48 89 e5             	mov    %rsp,%rbp
  803bb1:	48 83 ec 10          	sub    $0x10,%rsp
  803bb5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803bb8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803bbc:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803bbf:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bc6:	00 00 00 
  803bc9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bcc:	89 10                	mov    %edx,(%rax)
  803bce:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bd1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bd5:	48 89 c6             	mov    %rax,%rsi
  803bd8:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803bdf:	00 00 00 
  803be2:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  803be9:	00 00 00 
  803bec:	ff d0                	callq  *%rax
  803bee:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bf5:	00 00 00 
  803bf8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bfb:	89 50 14             	mov    %edx,0x14(%rax)
  803bfe:	bf 05 00 00 00       	mov    $0x5,%edi
  803c03:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803c0a:	00 00 00 
  803c0d:	ff d0                	callq  *%rax
  803c0f:	c9                   	leaveq 
  803c10:	c3                   	retq   

0000000000803c11 <nsipc_listen>:
  803c11:	55                   	push   %rbp
  803c12:	48 89 e5             	mov    %rsp,%rbp
  803c15:	48 83 ec 10          	sub    $0x10,%rsp
  803c19:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c1c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c1f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c26:	00 00 00 
  803c29:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c2c:	89 10                	mov    %edx,(%rax)
  803c2e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c35:	00 00 00 
  803c38:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c3b:	89 50 04             	mov    %edx,0x4(%rax)
  803c3e:	bf 06 00 00 00       	mov    $0x6,%edi
  803c43:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803c4a:	00 00 00 
  803c4d:	ff d0                	callq  *%rax
  803c4f:	c9                   	leaveq 
  803c50:	c3                   	retq   

0000000000803c51 <nsipc_recv>:
  803c51:	55                   	push   %rbp
  803c52:	48 89 e5             	mov    %rsp,%rbp
  803c55:	48 83 ec 30          	sub    $0x30,%rsp
  803c59:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c5c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c60:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c63:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803c66:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c6d:	00 00 00 
  803c70:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c73:	89 10                	mov    %edx,(%rax)
  803c75:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c7c:	00 00 00 
  803c7f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c82:	89 50 04             	mov    %edx,0x4(%rax)
  803c85:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c8c:	00 00 00 
  803c8f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803c92:	89 50 08             	mov    %edx,0x8(%rax)
  803c95:	bf 07 00 00 00       	mov    $0x7,%edi
  803c9a:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803ca1:	00 00 00 
  803ca4:	ff d0                	callq  *%rax
  803ca6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ca9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cad:	78 69                	js     803d18 <nsipc_recv+0xc7>
  803caf:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803cb6:	7f 08                	jg     803cc0 <nsipc_recv+0x6f>
  803cb8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cbb:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803cbe:	7e 35                	jle    803cf5 <nsipc_recv+0xa4>
  803cc0:	48 b9 51 53 80 00 00 	movabs $0x805351,%rcx
  803cc7:	00 00 00 
  803cca:	48 ba 66 53 80 00 00 	movabs $0x805366,%rdx
  803cd1:	00 00 00 
  803cd4:	be 62 00 00 00       	mov    $0x62,%esi
  803cd9:	48 bf 7b 53 80 00 00 	movabs $0x80537b,%rdi
  803ce0:	00 00 00 
  803ce3:	b8 00 00 00 00       	mov    $0x0,%eax
  803ce8:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  803cef:	00 00 00 
  803cf2:	41 ff d0             	callq  *%r8
  803cf5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cf8:	48 63 d0             	movslq %eax,%rdx
  803cfb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cff:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803d06:	00 00 00 
  803d09:	48 89 c7             	mov    %rax,%rdi
  803d0c:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  803d13:	00 00 00 
  803d16:	ff d0                	callq  *%rax
  803d18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d1b:	c9                   	leaveq 
  803d1c:	c3                   	retq   

0000000000803d1d <nsipc_send>:
  803d1d:	55                   	push   %rbp
  803d1e:	48 89 e5             	mov    %rsp,%rbp
  803d21:	48 83 ec 20          	sub    $0x20,%rsp
  803d25:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d28:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d2c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803d2f:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803d32:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d39:	00 00 00 
  803d3c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d3f:	89 10                	mov    %edx,(%rax)
  803d41:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803d48:	7e 35                	jle    803d7f <nsipc_send+0x62>
  803d4a:	48 b9 8a 53 80 00 00 	movabs $0x80538a,%rcx
  803d51:	00 00 00 
  803d54:	48 ba 66 53 80 00 00 	movabs $0x805366,%rdx
  803d5b:	00 00 00 
  803d5e:	be 6d 00 00 00       	mov    $0x6d,%esi
  803d63:	48 bf 7b 53 80 00 00 	movabs $0x80537b,%rdi
  803d6a:	00 00 00 
  803d6d:	b8 00 00 00 00       	mov    $0x0,%eax
  803d72:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  803d79:	00 00 00 
  803d7c:	41 ff d0             	callq  *%r8
  803d7f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d82:	48 63 d0             	movslq %eax,%rdx
  803d85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d89:	48 89 c6             	mov    %rax,%rsi
  803d8c:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803d93:	00 00 00 
  803d96:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  803d9d:	00 00 00 
  803da0:	ff d0                	callq  *%rax
  803da2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803da9:	00 00 00 
  803dac:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803daf:	89 50 04             	mov    %edx,0x4(%rax)
  803db2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803db9:	00 00 00 
  803dbc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803dbf:	89 50 08             	mov    %edx,0x8(%rax)
  803dc2:	bf 08 00 00 00       	mov    $0x8,%edi
  803dc7:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803dce:	00 00 00 
  803dd1:	ff d0                	callq  *%rax
  803dd3:	c9                   	leaveq 
  803dd4:	c3                   	retq   

0000000000803dd5 <nsipc_socket>:
  803dd5:	55                   	push   %rbp
  803dd6:	48 89 e5             	mov    %rsp,%rbp
  803dd9:	48 83 ec 10          	sub    $0x10,%rsp
  803ddd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803de0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803de3:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803de6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ded:	00 00 00 
  803df0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803df3:	89 10                	mov    %edx,(%rax)
  803df5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dfc:	00 00 00 
  803dff:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e02:	89 50 04             	mov    %edx,0x4(%rax)
  803e05:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e0c:	00 00 00 
  803e0f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803e12:	89 50 08             	mov    %edx,0x8(%rax)
  803e15:	bf 09 00 00 00       	mov    $0x9,%edi
  803e1a:	48 b8 dc 39 80 00 00 	movabs $0x8039dc,%rax
  803e21:	00 00 00 
  803e24:	ff d0                	callq  *%rax
  803e26:	c9                   	leaveq 
  803e27:	c3                   	retq   

0000000000803e28 <pipe>:
  803e28:	55                   	push   %rbp
  803e29:	48 89 e5             	mov    %rsp,%rbp
  803e2c:	53                   	push   %rbx
  803e2d:	48 83 ec 38          	sub    $0x38,%rsp
  803e31:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803e35:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803e39:	48 89 c7             	mov    %rax,%rdi
  803e3c:	48 b8 3f 26 80 00 00 	movabs $0x80263f,%rax
  803e43:	00 00 00 
  803e46:	ff d0                	callq  *%rax
  803e48:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e4b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e4f:	0f 88 bf 01 00 00    	js     804014 <pipe+0x1ec>
  803e55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e59:	ba 07 04 00 00       	mov    $0x407,%edx
  803e5e:	48 89 c6             	mov    %rax,%rsi
  803e61:	bf 00 00 00 00       	mov    $0x0,%edi
  803e66:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  803e6d:	00 00 00 
  803e70:	ff d0                	callq  *%rax
  803e72:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e75:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e79:	0f 88 95 01 00 00    	js     804014 <pipe+0x1ec>
  803e7f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803e83:	48 89 c7             	mov    %rax,%rdi
  803e86:	48 b8 3f 26 80 00 00 	movabs $0x80263f,%rax
  803e8d:	00 00 00 
  803e90:	ff d0                	callq  *%rax
  803e92:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e95:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e99:	0f 88 5d 01 00 00    	js     803ffc <pipe+0x1d4>
  803e9f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ea3:	ba 07 04 00 00       	mov    $0x407,%edx
  803ea8:	48 89 c6             	mov    %rax,%rsi
  803eab:	bf 00 00 00 00       	mov    $0x0,%edi
  803eb0:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  803eb7:	00 00 00 
  803eba:	ff d0                	callq  *%rax
  803ebc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ebf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ec3:	0f 88 33 01 00 00    	js     803ffc <pipe+0x1d4>
  803ec9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ecd:	48 89 c7             	mov    %rax,%rdi
  803ed0:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  803ed7:	00 00 00 
  803eda:	ff d0                	callq  *%rax
  803edc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803ee0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ee4:	ba 07 04 00 00       	mov    $0x407,%edx
  803ee9:	48 89 c6             	mov    %rax,%rsi
  803eec:	bf 00 00 00 00       	mov    $0x0,%edi
  803ef1:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  803ef8:	00 00 00 
  803efb:	ff d0                	callq  *%rax
  803efd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f00:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f04:	79 05                	jns    803f0b <pipe+0xe3>
  803f06:	e9 d9 00 00 00       	jmpq   803fe4 <pipe+0x1bc>
  803f0b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f0f:	48 89 c7             	mov    %rax,%rdi
  803f12:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  803f19:	00 00 00 
  803f1c:	ff d0                	callq  *%rax
  803f1e:	48 89 c2             	mov    %rax,%rdx
  803f21:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f25:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803f2b:	48 89 d1             	mov    %rdx,%rcx
  803f2e:	ba 00 00 00 00       	mov    $0x0,%edx
  803f33:	48 89 c6             	mov    %rax,%rsi
  803f36:	bf 00 00 00 00       	mov    $0x0,%edi
  803f3b:	48 b8 4e 1b 80 00 00 	movabs $0x801b4e,%rax
  803f42:	00 00 00 
  803f45:	ff d0                	callq  *%rax
  803f47:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f4a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f4e:	79 1b                	jns    803f6b <pipe+0x143>
  803f50:	90                   	nop
  803f51:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f55:	48 89 c6             	mov    %rax,%rsi
  803f58:	bf 00 00 00 00       	mov    $0x0,%edi
  803f5d:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  803f64:	00 00 00 
  803f67:	ff d0                	callq  *%rax
  803f69:	eb 79                	jmp    803fe4 <pipe+0x1bc>
  803f6b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f6f:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803f76:	00 00 00 
  803f79:	8b 12                	mov    (%rdx),%edx
  803f7b:	89 10                	mov    %edx,(%rax)
  803f7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f81:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803f88:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f8c:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803f93:	00 00 00 
  803f96:	8b 12                	mov    (%rdx),%edx
  803f98:	89 10                	mov    %edx,(%rax)
  803f9a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f9e:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803fa5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fa9:	48 89 c7             	mov    %rax,%rdi
  803fac:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  803fb3:	00 00 00 
  803fb6:	ff d0                	callq  *%rax
  803fb8:	89 c2                	mov    %eax,%edx
  803fba:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803fbe:	89 10                	mov    %edx,(%rax)
  803fc0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803fc4:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803fc8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fcc:	48 89 c7             	mov    %rax,%rdi
  803fcf:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  803fd6:	00 00 00 
  803fd9:	ff d0                	callq  *%rax
  803fdb:	89 03                	mov    %eax,(%rbx)
  803fdd:	b8 00 00 00 00       	mov    $0x0,%eax
  803fe2:	eb 33                	jmp    804017 <pipe+0x1ef>
  803fe4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fe8:	48 89 c6             	mov    %rax,%rsi
  803feb:	bf 00 00 00 00       	mov    $0x0,%edi
  803ff0:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  803ff7:	00 00 00 
  803ffa:	ff d0                	callq  *%rax
  803ffc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804000:	48 89 c6             	mov    %rax,%rsi
  804003:	bf 00 00 00 00       	mov    $0x0,%edi
  804008:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  80400f:	00 00 00 
  804012:	ff d0                	callq  *%rax
  804014:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804017:	48 83 c4 38          	add    $0x38,%rsp
  80401b:	5b                   	pop    %rbx
  80401c:	5d                   	pop    %rbp
  80401d:	c3                   	retq   

000000000080401e <_pipeisclosed>:
  80401e:	55                   	push   %rbp
  80401f:	48 89 e5             	mov    %rsp,%rbp
  804022:	53                   	push   %rbx
  804023:	48 83 ec 28          	sub    $0x28,%rsp
  804027:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80402b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80402f:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  804036:	00 00 00 
  804039:	48 8b 00             	mov    (%rax),%rax
  80403c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804042:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804045:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804049:	48 89 c7             	mov    %rax,%rdi
  80404c:	48 b8 2a 4a 80 00 00 	movabs $0x804a2a,%rax
  804053:	00 00 00 
  804056:	ff d0                	callq  *%rax
  804058:	89 c3                	mov    %eax,%ebx
  80405a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80405e:	48 89 c7             	mov    %rax,%rdi
  804061:	48 b8 2a 4a 80 00 00 	movabs $0x804a2a,%rax
  804068:	00 00 00 
  80406b:	ff d0                	callq  *%rax
  80406d:	39 c3                	cmp    %eax,%ebx
  80406f:	0f 94 c0             	sete   %al
  804072:	0f b6 c0             	movzbl %al,%eax
  804075:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804078:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  80407f:	00 00 00 
  804082:	48 8b 00             	mov    (%rax),%rax
  804085:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80408b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80408e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804091:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804094:	75 05                	jne    80409b <_pipeisclosed+0x7d>
  804096:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804099:	eb 4f                	jmp    8040ea <_pipeisclosed+0xcc>
  80409b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80409e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8040a1:	74 42                	je     8040e5 <_pipeisclosed+0xc7>
  8040a3:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8040a7:	75 3c                	jne    8040e5 <_pipeisclosed+0xc7>
  8040a9:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8040b0:	00 00 00 
  8040b3:	48 8b 00             	mov    (%rax),%rax
  8040b6:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8040bc:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8040bf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040c2:	89 c6                	mov    %eax,%esi
  8040c4:	48 bf 9b 53 80 00 00 	movabs $0x80539b,%rdi
  8040cb:	00 00 00 
  8040ce:	b8 00 00 00 00       	mov    $0x0,%eax
  8040d3:	49 b8 1a 06 80 00 00 	movabs $0x80061a,%r8
  8040da:	00 00 00 
  8040dd:	41 ff d0             	callq  *%r8
  8040e0:	e9 4a ff ff ff       	jmpq   80402f <_pipeisclosed+0x11>
  8040e5:	e9 45 ff ff ff       	jmpq   80402f <_pipeisclosed+0x11>
  8040ea:	48 83 c4 28          	add    $0x28,%rsp
  8040ee:	5b                   	pop    %rbx
  8040ef:	5d                   	pop    %rbp
  8040f0:	c3                   	retq   

00000000008040f1 <pipeisclosed>:
  8040f1:	55                   	push   %rbp
  8040f2:	48 89 e5             	mov    %rsp,%rbp
  8040f5:	48 83 ec 30          	sub    $0x30,%rsp
  8040f9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8040fc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804100:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804103:	48 89 d6             	mov    %rdx,%rsi
  804106:	89 c7                	mov    %eax,%edi
  804108:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  80410f:	00 00 00 
  804112:	ff d0                	callq  *%rax
  804114:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804117:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80411b:	79 05                	jns    804122 <pipeisclosed+0x31>
  80411d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804120:	eb 31                	jmp    804153 <pipeisclosed+0x62>
  804122:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804126:	48 89 c7             	mov    %rax,%rdi
  804129:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  804130:	00 00 00 
  804133:	ff d0                	callq  *%rax
  804135:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804139:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80413d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804141:	48 89 d6             	mov    %rdx,%rsi
  804144:	48 89 c7             	mov    %rax,%rdi
  804147:	48 b8 1e 40 80 00 00 	movabs $0x80401e,%rax
  80414e:	00 00 00 
  804151:	ff d0                	callq  *%rax
  804153:	c9                   	leaveq 
  804154:	c3                   	retq   

0000000000804155 <devpipe_read>:
  804155:	55                   	push   %rbp
  804156:	48 89 e5             	mov    %rsp,%rbp
  804159:	48 83 ec 40          	sub    $0x40,%rsp
  80415d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804161:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804165:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804169:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80416d:	48 89 c7             	mov    %rax,%rdi
  804170:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  804177:	00 00 00 
  80417a:	ff d0                	callq  *%rax
  80417c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804180:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804184:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804188:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80418f:	00 
  804190:	e9 92 00 00 00       	jmpq   804227 <devpipe_read+0xd2>
  804195:	eb 41                	jmp    8041d8 <devpipe_read+0x83>
  804197:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80419c:	74 09                	je     8041a7 <devpipe_read+0x52>
  80419e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041a2:	e9 92 00 00 00       	jmpq   804239 <devpipe_read+0xe4>
  8041a7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8041ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041af:	48 89 d6             	mov    %rdx,%rsi
  8041b2:	48 89 c7             	mov    %rax,%rdi
  8041b5:	48 b8 1e 40 80 00 00 	movabs $0x80401e,%rax
  8041bc:	00 00 00 
  8041bf:	ff d0                	callq  *%rax
  8041c1:	85 c0                	test   %eax,%eax
  8041c3:	74 07                	je     8041cc <devpipe_read+0x77>
  8041c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8041ca:	eb 6d                	jmp    804239 <devpipe_read+0xe4>
  8041cc:	48 b8 c0 1a 80 00 00 	movabs $0x801ac0,%rax
  8041d3:	00 00 00 
  8041d6:	ff d0                	callq  *%rax
  8041d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041dc:	8b 10                	mov    (%rax),%edx
  8041de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041e2:	8b 40 04             	mov    0x4(%rax),%eax
  8041e5:	39 c2                	cmp    %eax,%edx
  8041e7:	74 ae                	je     804197 <devpipe_read+0x42>
  8041e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8041f1:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8041f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041f9:	8b 00                	mov    (%rax),%eax
  8041fb:	99                   	cltd   
  8041fc:	c1 ea 1b             	shr    $0x1b,%edx
  8041ff:	01 d0                	add    %edx,%eax
  804201:	83 e0 1f             	and    $0x1f,%eax
  804204:	29 d0                	sub    %edx,%eax
  804206:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80420a:	48 98                	cltq   
  80420c:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804211:	88 01                	mov    %al,(%rcx)
  804213:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804217:	8b 00                	mov    (%rax),%eax
  804219:	8d 50 01             	lea    0x1(%rax),%edx
  80421c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804220:	89 10                	mov    %edx,(%rax)
  804222:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804227:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80422b:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80422f:	0f 82 60 ff ff ff    	jb     804195 <devpipe_read+0x40>
  804235:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804239:	c9                   	leaveq 
  80423a:	c3                   	retq   

000000000080423b <devpipe_write>:
  80423b:	55                   	push   %rbp
  80423c:	48 89 e5             	mov    %rsp,%rbp
  80423f:	48 83 ec 40          	sub    $0x40,%rsp
  804243:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804247:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80424b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80424f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804253:	48 89 c7             	mov    %rax,%rdi
  804256:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  80425d:	00 00 00 
  804260:	ff d0                	callq  *%rax
  804262:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804266:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80426a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80426e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804275:	00 
  804276:	e9 8e 00 00 00       	jmpq   804309 <devpipe_write+0xce>
  80427b:	eb 31                	jmp    8042ae <devpipe_write+0x73>
  80427d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804281:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804285:	48 89 d6             	mov    %rdx,%rsi
  804288:	48 89 c7             	mov    %rax,%rdi
  80428b:	48 b8 1e 40 80 00 00 	movabs $0x80401e,%rax
  804292:	00 00 00 
  804295:	ff d0                	callq  *%rax
  804297:	85 c0                	test   %eax,%eax
  804299:	74 07                	je     8042a2 <devpipe_write+0x67>
  80429b:	b8 00 00 00 00       	mov    $0x0,%eax
  8042a0:	eb 79                	jmp    80431b <devpipe_write+0xe0>
  8042a2:	48 b8 c0 1a 80 00 00 	movabs $0x801ac0,%rax
  8042a9:	00 00 00 
  8042ac:	ff d0                	callq  *%rax
  8042ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042b2:	8b 40 04             	mov    0x4(%rax),%eax
  8042b5:	48 63 d0             	movslq %eax,%rdx
  8042b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042bc:	8b 00                	mov    (%rax),%eax
  8042be:	48 98                	cltq   
  8042c0:	48 83 c0 20          	add    $0x20,%rax
  8042c4:	48 39 c2             	cmp    %rax,%rdx
  8042c7:	73 b4                	jae    80427d <devpipe_write+0x42>
  8042c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042cd:	8b 40 04             	mov    0x4(%rax),%eax
  8042d0:	99                   	cltd   
  8042d1:	c1 ea 1b             	shr    $0x1b,%edx
  8042d4:	01 d0                	add    %edx,%eax
  8042d6:	83 e0 1f             	and    $0x1f,%eax
  8042d9:	29 d0                	sub    %edx,%eax
  8042db:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8042df:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8042e3:	48 01 ca             	add    %rcx,%rdx
  8042e6:	0f b6 0a             	movzbl (%rdx),%ecx
  8042e9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042ed:	48 98                	cltq   
  8042ef:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8042f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042f7:	8b 40 04             	mov    0x4(%rax),%eax
  8042fa:	8d 50 01             	lea    0x1(%rax),%edx
  8042fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804301:	89 50 04             	mov    %edx,0x4(%rax)
  804304:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804309:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80430d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804311:	0f 82 64 ff ff ff    	jb     80427b <devpipe_write+0x40>
  804317:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80431b:	c9                   	leaveq 
  80431c:	c3                   	retq   

000000000080431d <devpipe_stat>:
  80431d:	55                   	push   %rbp
  80431e:	48 89 e5             	mov    %rsp,%rbp
  804321:	48 83 ec 20          	sub    $0x20,%rsp
  804325:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804329:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80432d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804331:	48 89 c7             	mov    %rax,%rdi
  804334:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  80433b:	00 00 00 
  80433e:	ff d0                	callq  *%rax
  804340:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804344:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804348:	48 be ae 53 80 00 00 	movabs $0x8053ae,%rsi
  80434f:	00 00 00 
  804352:	48 89 c7             	mov    %rax,%rdi
  804355:	48 b8 cf 11 80 00 00 	movabs $0x8011cf,%rax
  80435c:	00 00 00 
  80435f:	ff d0                	callq  *%rax
  804361:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804365:	8b 50 04             	mov    0x4(%rax),%edx
  804368:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80436c:	8b 00                	mov    (%rax),%eax
  80436e:	29 c2                	sub    %eax,%edx
  804370:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804374:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80437a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80437e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804385:	00 00 00 
  804388:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80438c:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804393:	00 00 00 
  804396:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80439d:	b8 00 00 00 00       	mov    $0x0,%eax
  8043a2:	c9                   	leaveq 
  8043a3:	c3                   	retq   

00000000008043a4 <devpipe_close>:
  8043a4:	55                   	push   %rbp
  8043a5:	48 89 e5             	mov    %rsp,%rbp
  8043a8:	48 83 ec 10          	sub    $0x10,%rsp
  8043ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8043b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043b4:	48 89 c6             	mov    %rax,%rsi
  8043b7:	bf 00 00 00 00       	mov    $0x0,%edi
  8043bc:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  8043c3:	00 00 00 
  8043c6:	ff d0                	callq  *%rax
  8043c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043cc:	48 89 c7             	mov    %rax,%rdi
  8043cf:	48 b8 14 26 80 00 00 	movabs $0x802614,%rax
  8043d6:	00 00 00 
  8043d9:	ff d0                	callq  *%rax
  8043db:	48 89 c6             	mov    %rax,%rsi
  8043de:	bf 00 00 00 00       	mov    $0x0,%edi
  8043e3:	48 b8 a9 1b 80 00 00 	movabs $0x801ba9,%rax
  8043ea:	00 00 00 
  8043ed:	ff d0                	callq  *%rax
  8043ef:	c9                   	leaveq 
  8043f0:	c3                   	retq   

00000000008043f1 <wait>:
  8043f1:	55                   	push   %rbp
  8043f2:	48 89 e5             	mov    %rsp,%rbp
  8043f5:	48 83 ec 20          	sub    $0x20,%rsp
  8043f9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8043fc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804400:	75 35                	jne    804437 <wait+0x46>
  804402:	48 b9 b5 53 80 00 00 	movabs $0x8053b5,%rcx
  804409:	00 00 00 
  80440c:	48 ba c0 53 80 00 00 	movabs $0x8053c0,%rdx
  804413:	00 00 00 
  804416:	be 0a 00 00 00       	mov    $0xa,%esi
  80441b:	48 bf d5 53 80 00 00 	movabs $0x8053d5,%rdi
  804422:	00 00 00 
  804425:	b8 00 00 00 00       	mov    $0x0,%eax
  80442a:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  804431:	00 00 00 
  804434:	41 ff d0             	callq  *%r8
  804437:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80443a:	25 ff 03 00 00       	and    $0x3ff,%eax
  80443f:	48 98                	cltq   
  804441:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  804448:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80444f:	00 00 00 
  804452:	48 01 d0             	add    %rdx,%rax
  804455:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804459:	eb 0c                	jmp    804467 <wait+0x76>
  80445b:	48 b8 c0 1a 80 00 00 	movabs $0x801ac0,%rax
  804462:	00 00 00 
  804465:	ff d0                	callq  *%rax
  804467:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80446b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804471:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804474:	75 0e                	jne    804484 <wait+0x93>
  804476:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80447a:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  804480:	85 c0                	test   %eax,%eax
  804482:	75 d7                	jne    80445b <wait+0x6a>
  804484:	c9                   	leaveq 
  804485:	c3                   	retq   

0000000000804486 <cputchar>:
  804486:	55                   	push   %rbp
  804487:	48 89 e5             	mov    %rsp,%rbp
  80448a:	48 83 ec 20          	sub    $0x20,%rsp
  80448e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804491:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804494:	88 45 ff             	mov    %al,-0x1(%rbp)
  804497:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  80449b:	be 01 00 00 00       	mov    $0x1,%esi
  8044a0:	48 89 c7             	mov    %rax,%rdi
  8044a3:	48 b8 b6 19 80 00 00 	movabs $0x8019b6,%rax
  8044aa:	00 00 00 
  8044ad:	ff d0                	callq  *%rax
  8044af:	c9                   	leaveq 
  8044b0:	c3                   	retq   

00000000008044b1 <getchar>:
  8044b1:	55                   	push   %rbp
  8044b2:	48 89 e5             	mov    %rsp,%rbp
  8044b5:	48 83 ec 10          	sub    $0x10,%rsp
  8044b9:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8044bd:	ba 01 00 00 00       	mov    $0x1,%edx
  8044c2:	48 89 c6             	mov    %rax,%rsi
  8044c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8044ca:	48 b8 09 2b 80 00 00 	movabs $0x802b09,%rax
  8044d1:	00 00 00 
  8044d4:	ff d0                	callq  *%rax
  8044d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044dd:	79 05                	jns    8044e4 <getchar+0x33>
  8044df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044e2:	eb 14                	jmp    8044f8 <getchar+0x47>
  8044e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044e8:	7f 07                	jg     8044f1 <getchar+0x40>
  8044ea:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8044ef:	eb 07                	jmp    8044f8 <getchar+0x47>
  8044f1:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8044f5:	0f b6 c0             	movzbl %al,%eax
  8044f8:	c9                   	leaveq 
  8044f9:	c3                   	retq   

00000000008044fa <iscons>:
  8044fa:	55                   	push   %rbp
  8044fb:	48 89 e5             	mov    %rsp,%rbp
  8044fe:	48 83 ec 20          	sub    $0x20,%rsp
  804502:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804505:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804509:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80450c:	48 89 d6             	mov    %rdx,%rsi
  80450f:	89 c7                	mov    %eax,%edi
  804511:	48 b8 d7 26 80 00 00 	movabs $0x8026d7,%rax
  804518:	00 00 00 
  80451b:	ff d0                	callq  *%rax
  80451d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804520:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804524:	79 05                	jns    80452b <iscons+0x31>
  804526:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804529:	eb 1a                	jmp    804545 <iscons+0x4b>
  80452b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80452f:	8b 10                	mov    (%rax),%edx
  804531:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804538:	00 00 00 
  80453b:	8b 00                	mov    (%rax),%eax
  80453d:	39 c2                	cmp    %eax,%edx
  80453f:	0f 94 c0             	sete   %al
  804542:	0f b6 c0             	movzbl %al,%eax
  804545:	c9                   	leaveq 
  804546:	c3                   	retq   

0000000000804547 <opencons>:
  804547:	55                   	push   %rbp
  804548:	48 89 e5             	mov    %rsp,%rbp
  80454b:	48 83 ec 10          	sub    $0x10,%rsp
  80454f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804553:	48 89 c7             	mov    %rax,%rdi
  804556:	48 b8 3f 26 80 00 00 	movabs $0x80263f,%rax
  80455d:	00 00 00 
  804560:	ff d0                	callq  *%rax
  804562:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804565:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804569:	79 05                	jns    804570 <opencons+0x29>
  80456b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80456e:	eb 5b                	jmp    8045cb <opencons+0x84>
  804570:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804574:	ba 07 04 00 00       	mov    $0x407,%edx
  804579:	48 89 c6             	mov    %rax,%rsi
  80457c:	bf 00 00 00 00       	mov    $0x0,%edi
  804581:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  804588:	00 00 00 
  80458b:	ff d0                	callq  *%rax
  80458d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804590:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804594:	79 05                	jns    80459b <opencons+0x54>
  804596:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804599:	eb 30                	jmp    8045cb <opencons+0x84>
  80459b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80459f:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8045a6:	00 00 00 
  8045a9:	8b 12                	mov    (%rdx),%edx
  8045ab:	89 10                	mov    %edx,(%rax)
  8045ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045b1:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8045b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045bc:	48 89 c7             	mov    %rax,%rdi
  8045bf:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  8045c6:	00 00 00 
  8045c9:	ff d0                	callq  *%rax
  8045cb:	c9                   	leaveq 
  8045cc:	c3                   	retq   

00000000008045cd <devcons_read>:
  8045cd:	55                   	push   %rbp
  8045ce:	48 89 e5             	mov    %rsp,%rbp
  8045d1:	48 83 ec 30          	sub    $0x30,%rsp
  8045d5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8045d9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8045dd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8045e1:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8045e6:	75 07                	jne    8045ef <devcons_read+0x22>
  8045e8:	b8 00 00 00 00       	mov    $0x0,%eax
  8045ed:	eb 4b                	jmp    80463a <devcons_read+0x6d>
  8045ef:	eb 0c                	jmp    8045fd <devcons_read+0x30>
  8045f1:	48 b8 c0 1a 80 00 00 	movabs $0x801ac0,%rax
  8045f8:	00 00 00 
  8045fb:	ff d0                	callq  *%rax
  8045fd:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  804604:	00 00 00 
  804607:	ff d0                	callq  *%rax
  804609:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80460c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804610:	74 df                	je     8045f1 <devcons_read+0x24>
  804612:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804616:	79 05                	jns    80461d <devcons_read+0x50>
  804618:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80461b:	eb 1d                	jmp    80463a <devcons_read+0x6d>
  80461d:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804621:	75 07                	jne    80462a <devcons_read+0x5d>
  804623:	b8 00 00 00 00       	mov    $0x0,%eax
  804628:	eb 10                	jmp    80463a <devcons_read+0x6d>
  80462a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80462d:	89 c2                	mov    %eax,%edx
  80462f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804633:	88 10                	mov    %dl,(%rax)
  804635:	b8 01 00 00 00       	mov    $0x1,%eax
  80463a:	c9                   	leaveq 
  80463b:	c3                   	retq   

000000000080463c <devcons_write>:
  80463c:	55                   	push   %rbp
  80463d:	48 89 e5             	mov    %rsp,%rbp
  804640:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804647:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80464e:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804655:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  80465c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804663:	eb 76                	jmp    8046db <devcons_write+0x9f>
  804665:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80466c:	89 c2                	mov    %eax,%edx
  80466e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804671:	29 c2                	sub    %eax,%edx
  804673:	89 d0                	mov    %edx,%eax
  804675:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804678:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80467b:	83 f8 7f             	cmp    $0x7f,%eax
  80467e:	76 07                	jbe    804687 <devcons_write+0x4b>
  804680:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804687:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80468a:	48 63 d0             	movslq %eax,%rdx
  80468d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804690:	48 63 c8             	movslq %eax,%rcx
  804693:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80469a:	48 01 c1             	add    %rax,%rcx
  80469d:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8046a4:	48 89 ce             	mov    %rcx,%rsi
  8046a7:	48 89 c7             	mov    %rax,%rdi
  8046aa:	48 b8 f3 14 80 00 00 	movabs $0x8014f3,%rax
  8046b1:	00 00 00 
  8046b4:	ff d0                	callq  *%rax
  8046b6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046b9:	48 63 d0             	movslq %eax,%rdx
  8046bc:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8046c3:	48 89 d6             	mov    %rdx,%rsi
  8046c6:	48 89 c7             	mov    %rax,%rdi
  8046c9:	48 b8 b6 19 80 00 00 	movabs $0x8019b6,%rax
  8046d0:	00 00 00 
  8046d3:	ff d0                	callq  *%rax
  8046d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046d8:	01 45 fc             	add    %eax,-0x4(%rbp)
  8046db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046de:	48 98                	cltq   
  8046e0:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8046e7:	0f 82 78 ff ff ff    	jb     804665 <devcons_write+0x29>
  8046ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046f0:	c9                   	leaveq 
  8046f1:	c3                   	retq   

00000000008046f2 <devcons_close>:
  8046f2:	55                   	push   %rbp
  8046f3:	48 89 e5             	mov    %rsp,%rbp
  8046f6:	48 83 ec 08          	sub    $0x8,%rsp
  8046fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8046fe:	b8 00 00 00 00       	mov    $0x0,%eax
  804703:	c9                   	leaveq 
  804704:	c3                   	retq   

0000000000804705 <devcons_stat>:
  804705:	55                   	push   %rbp
  804706:	48 89 e5             	mov    %rsp,%rbp
  804709:	48 83 ec 10          	sub    $0x10,%rsp
  80470d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804711:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804715:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804719:	48 be e8 53 80 00 00 	movabs $0x8053e8,%rsi
  804720:	00 00 00 
  804723:	48 89 c7             	mov    %rax,%rdi
  804726:	48 b8 cf 11 80 00 00 	movabs $0x8011cf,%rax
  80472d:	00 00 00 
  804730:	ff d0                	callq  *%rax
  804732:	b8 00 00 00 00       	mov    $0x0,%eax
  804737:	c9                   	leaveq 
  804738:	c3                   	retq   

0000000000804739 <set_pgfault_handler>:
  804739:	55                   	push   %rbp
  80473a:	48 89 e5             	mov    %rsp,%rbp
  80473d:	48 83 ec 20          	sub    $0x20,%rsp
  804741:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804745:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80474c:	00 00 00 
  80474f:	48 8b 00             	mov    (%rax),%rax
  804752:	48 85 c0             	test   %rax,%rax
  804755:	75 6f                	jne    8047c6 <set_pgfault_handler+0x8d>
  804757:	ba 07 00 00 00       	mov    $0x7,%edx
  80475c:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804761:	bf 00 00 00 00       	mov    $0x0,%edi
  804766:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  80476d:	00 00 00 
  804770:	ff d0                	callq  *%rax
  804772:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804775:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804779:	79 30                	jns    8047ab <set_pgfault_handler+0x72>
  80477b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80477e:	89 c1                	mov    %eax,%ecx
  804780:	48 ba f0 53 80 00 00 	movabs $0x8053f0,%rdx
  804787:	00 00 00 
  80478a:	be 22 00 00 00       	mov    $0x22,%esi
  80478f:	48 bf 0f 54 80 00 00 	movabs $0x80540f,%rdi
  804796:	00 00 00 
  804799:	b8 00 00 00 00       	mov    $0x0,%eax
  80479e:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8047a5:	00 00 00 
  8047a8:	41 ff d0             	callq  *%r8
  8047ab:	48 be d9 47 80 00 00 	movabs $0x8047d9,%rsi
  8047b2:	00 00 00 
  8047b5:	bf 00 00 00 00       	mov    $0x0,%edi
  8047ba:	48 b8 88 1c 80 00 00 	movabs $0x801c88,%rax
  8047c1:	00 00 00 
  8047c4:	ff d0                	callq  *%rax
  8047c6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8047cd:	00 00 00 
  8047d0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8047d4:	48 89 10             	mov    %rdx,(%rax)
  8047d7:	c9                   	leaveq 
  8047d8:	c3                   	retq   

00000000008047d9 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  8047d9:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8047dc:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  8047e3:	00 00 00 
call *%rax
  8047e6:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8047e8:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8047ef:	00 08 
    movq 152(%rsp), %rax
  8047f1:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8047f8:	00 
    movq 136(%rsp), %rbx
  8047f9:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804800:	00 
movq %rbx, (%rax)
  804801:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804804:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804808:	4c 8b 3c 24          	mov    (%rsp),%r15
  80480c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804811:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804816:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  80481b:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804820:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804825:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80482a:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  80482f:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804834:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804839:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  80483e:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804843:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804848:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  80484d:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804852:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804856:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80485a:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80485b:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804860:	c3                   	retq   

0000000000804861 <ipc_recv>:
  804861:	55                   	push   %rbp
  804862:	48 89 e5             	mov    %rsp,%rbp
  804865:	48 83 ec 30          	sub    $0x30,%rsp
  804869:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80486d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804871:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804875:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80487a:	75 0e                	jne    80488a <ipc_recv+0x29>
  80487c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804883:	00 00 00 
  804886:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80488a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80488e:	48 89 c7             	mov    %rax,%rdi
  804891:	48 b8 27 1d 80 00 00 	movabs $0x801d27,%rax
  804898:	00 00 00 
  80489b:	ff d0                	callq  *%rax
  80489d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048a4:	79 27                	jns    8048cd <ipc_recv+0x6c>
  8048a6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8048ab:	74 0a                	je     8048b7 <ipc_recv+0x56>
  8048ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048b1:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8048b7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8048bc:	74 0a                	je     8048c8 <ipc_recv+0x67>
  8048be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048c2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8048c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048cb:	eb 53                	jmp    804920 <ipc_recv+0xbf>
  8048cd:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8048d2:	74 19                	je     8048ed <ipc_recv+0x8c>
  8048d4:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8048db:	00 00 00 
  8048de:	48 8b 00             	mov    (%rax),%rax
  8048e1:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8048e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048eb:	89 10                	mov    %edx,(%rax)
  8048ed:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8048f2:	74 19                	je     80490d <ipc_recv+0xac>
  8048f4:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8048fb:	00 00 00 
  8048fe:	48 8b 00             	mov    (%rax),%rax
  804901:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804907:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80490b:	89 10                	mov    %edx,(%rax)
  80490d:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  804914:	00 00 00 
  804917:	48 8b 00             	mov    (%rax),%rax
  80491a:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804920:	c9                   	leaveq 
  804921:	c3                   	retq   

0000000000804922 <ipc_send>:
  804922:	55                   	push   %rbp
  804923:	48 89 e5             	mov    %rsp,%rbp
  804926:	48 83 ec 30          	sub    $0x30,%rsp
  80492a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80492d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804930:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804934:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804937:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80493c:	75 10                	jne    80494e <ipc_send+0x2c>
  80493e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804945:	00 00 00 
  804948:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80494c:	eb 0e                	jmp    80495c <ipc_send+0x3a>
  80494e:	eb 0c                	jmp    80495c <ipc_send+0x3a>
  804950:	48 b8 c0 1a 80 00 00 	movabs $0x801ac0,%rax
  804957:	00 00 00 
  80495a:	ff d0                	callq  *%rax
  80495c:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80495f:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804962:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804966:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804969:	89 c7                	mov    %eax,%edi
  80496b:	48 b8 d2 1c 80 00 00 	movabs $0x801cd2,%rax
  804972:	00 00 00 
  804975:	ff d0                	callq  *%rax
  804977:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80497a:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80497e:	74 d0                	je     804950 <ipc_send+0x2e>
  804980:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804984:	79 30                	jns    8049b6 <ipc_send+0x94>
  804986:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804989:	89 c1                	mov    %eax,%ecx
  80498b:	48 ba 20 54 80 00 00 	movabs $0x805420,%rdx
  804992:	00 00 00 
  804995:	be 44 00 00 00       	mov    $0x44,%esi
  80499a:	48 bf 36 54 80 00 00 	movabs $0x805436,%rdi
  8049a1:	00 00 00 
  8049a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8049a9:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  8049b0:	00 00 00 
  8049b3:	41 ff d0             	callq  *%r8
  8049b6:	c9                   	leaveq 
  8049b7:	c3                   	retq   

00000000008049b8 <ipc_find_env>:
  8049b8:	55                   	push   %rbp
  8049b9:	48 89 e5             	mov    %rsp,%rbp
  8049bc:	48 83 ec 14          	sub    $0x14,%rsp
  8049c0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8049c3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8049ca:	eb 4e                	jmp    804a1a <ipc_find_env+0x62>
  8049cc:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8049d3:	00 00 00 
  8049d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049d9:	48 98                	cltq   
  8049db:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8049e2:	48 01 d0             	add    %rdx,%rax
  8049e5:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8049eb:	8b 00                	mov    (%rax),%eax
  8049ed:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8049f0:	75 24                	jne    804a16 <ipc_find_env+0x5e>
  8049f2:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8049f9:	00 00 00 
  8049fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049ff:	48 98                	cltq   
  804a01:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804a08:	48 01 d0             	add    %rdx,%rax
  804a0b:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804a11:	8b 40 08             	mov    0x8(%rax),%eax
  804a14:	eb 12                	jmp    804a28 <ipc_find_env+0x70>
  804a16:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804a1a:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804a21:	7e a9                	jle    8049cc <ipc_find_env+0x14>
  804a23:	b8 00 00 00 00       	mov    $0x0,%eax
  804a28:	c9                   	leaveq 
  804a29:	c3                   	retq   

0000000000804a2a <pageref>:
  804a2a:	55                   	push   %rbp
  804a2b:	48 89 e5             	mov    %rsp,%rbp
  804a2e:	48 83 ec 18          	sub    $0x18,%rsp
  804a32:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a3a:	48 c1 e8 15          	shr    $0x15,%rax
  804a3e:	48 89 c2             	mov    %rax,%rdx
  804a41:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804a48:	01 00 00 
  804a4b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804a4f:	83 e0 01             	and    $0x1,%eax
  804a52:	48 85 c0             	test   %rax,%rax
  804a55:	75 07                	jne    804a5e <pageref+0x34>
  804a57:	b8 00 00 00 00       	mov    $0x0,%eax
  804a5c:	eb 53                	jmp    804ab1 <pageref+0x87>
  804a5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a62:	48 c1 e8 0c          	shr    $0xc,%rax
  804a66:	48 89 c2             	mov    %rax,%rdx
  804a69:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804a70:	01 00 00 
  804a73:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804a77:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804a7b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a7f:	83 e0 01             	and    $0x1,%eax
  804a82:	48 85 c0             	test   %rax,%rax
  804a85:	75 07                	jne    804a8e <pageref+0x64>
  804a87:	b8 00 00 00 00       	mov    $0x0,%eax
  804a8c:	eb 23                	jmp    804ab1 <pageref+0x87>
  804a8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a92:	48 c1 e8 0c          	shr    $0xc,%rax
  804a96:	48 89 c2             	mov    %rax,%rdx
  804a99:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804aa0:	00 00 00 
  804aa3:	48 c1 e2 04          	shl    $0x4,%rdx
  804aa7:	48 01 d0             	add    %rdx,%rax
  804aaa:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804aae:	0f b7 c0             	movzwl %ax,%eax
  804ab1:	c9                   	leaveq 
  804ab2:	c3                   	retq   
