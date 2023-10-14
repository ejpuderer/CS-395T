
obj/fs/fs:     file format elf64-x86-64


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
  80003c:	e8 16 30 00 00       	callq  803057 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <ide_wait_ready>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 14          	sub    $0x14,%rsp
  80004b:	89 f8                	mov    %edi,%eax
  80004d:	88 45 ec             	mov    %al,-0x14(%rbp)
  800050:	90                   	nop
  800051:	c7 45 f8 f7 01 00 00 	movl   $0x1f7,-0x8(%rbp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  800058:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80005b:	89 c2                	mov    %eax,%edx
  80005d:	ec                   	in     (%dx),%al
  80005e:	88 45 f7             	mov    %al,-0x9(%rbp)
	return data;
  800061:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
  800065:	0f b6 c0             	movzbl %al,%eax
  800068:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80006b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80006e:	25 c0 00 00 00       	and    $0xc0,%eax
  800073:	83 f8 40             	cmp    $0x40,%eax
  800076:	75 d9                	jne    800051 <ide_wait_ready+0xe>
  800078:	80 7d ec 00          	cmpb   $0x0,-0x14(%rbp)
  80007c:	74 11                	je     80008f <ide_wait_ready+0x4c>
  80007e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800081:	83 e0 21             	and    $0x21,%eax
  800084:	85 c0                	test   %eax,%eax
  800086:	74 07                	je     80008f <ide_wait_ready+0x4c>
  800088:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  80008d:	eb 05                	jmp    800094 <ide_wait_ready+0x51>
  80008f:	b8 00 00 00 00       	mov    $0x0,%eax
  800094:	c9                   	leaveq 
  800095:	c3                   	retq   

0000000000800096 <ide_probe_disk1>:
  800096:	55                   	push   %rbp
  800097:	48 89 e5             	mov    %rsp,%rbp
  80009a:	48 83 ec 20          	sub    $0x20,%rsp
  80009e:	bf 00 00 00 00       	mov    $0x0,%edi
  8000a3:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000aa:	00 00 00 
  8000ad:	ff d0                	callq  *%rax
  8000af:	c7 45 f4 f6 01 00 00 	movl   $0x1f6,-0xc(%rbp)
  8000b6:	c6 45 f3 f0          	movb   $0xf0,-0xd(%rbp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  8000ba:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
  8000be:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8000c1:	ee                   	out    %al,(%dx)
  8000c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8000c9:	eb 04                	jmp    8000cf <ide_probe_disk1+0x39>
  8000cb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8000cf:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
  8000d6:	7f 26                	jg     8000fe <ide_probe_disk1+0x68>
  8000d8:	c7 45 ec f7 01 00 00 	movl   $0x1f7,-0x14(%rbp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  8000df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8000e2:	89 c2                	mov    %eax,%edx
  8000e4:	ec                   	in     (%dx),%al
  8000e5:	88 45 eb             	mov    %al,-0x15(%rbp)
	return data;
  8000e8:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
  8000ec:	0f b6 c0             	movzbl %al,%eax
  8000ef:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000f2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000f5:	25 a1 00 00 00       	and    $0xa1,%eax
  8000fa:	85 c0                	test   %eax,%eax
  8000fc:	75 cd                	jne    8000cb <ide_probe_disk1+0x35>
  8000fe:	c7 45 e4 f6 01 00 00 	movl   $0x1f6,-0x1c(%rbp)
  800105:	c6 45 e3 e0          	movb   $0xe0,-0x1d(%rbp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  800109:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
  80010d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800110:	ee                   	out    %al,(%dx)
  800111:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
  800118:	0f 9e c0             	setle  %al
  80011b:	0f b6 c0             	movzbl %al,%eax
  80011e:	89 c6                	mov    %eax,%esi
  800120:	48 bf 40 71 80 00 00 	movabs $0x807140,%rdi
  800127:	00 00 00 
  80012a:	b8 00 00 00 00       	mov    $0x0,%eax
  80012f:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  800136:	00 00 00 
  800139:	ff d2                	callq  *%rdx
  80013b:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
  800142:	0f 9e c0             	setle  %al
  800145:	c9                   	leaveq 
  800146:	c3                   	retq   

0000000000800147 <ide_set_disk>:
  800147:	55                   	push   %rbp
  800148:	48 89 e5             	mov    %rsp,%rbp
  80014b:	48 83 ec 10          	sub    $0x10,%rsp
  80014f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800152:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800156:	74 30                	je     800188 <ide_set_disk+0x41>
  800158:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  80015c:	74 2a                	je     800188 <ide_set_disk+0x41>
  80015e:	48 ba 57 71 80 00 00 	movabs $0x807157,%rdx
  800165:	00 00 00 
  800168:	be 3f 00 00 00       	mov    $0x3f,%esi
  80016d:	48 bf 67 71 80 00 00 	movabs $0x807167,%rdi
  800174:	00 00 00 
  800177:	b8 00 00 00 00       	mov    $0x0,%eax
  80017c:	48 b9 fd 30 80 00 00 	movabs $0x8030fd,%rcx
  800183:	00 00 00 
  800186:	ff d1                	callq  *%rcx
  800188:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80018f:	00 00 00 
  800192:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800195:	89 10                	mov    %edx,(%rax)
  800197:	c9                   	leaveq 
  800198:	c3                   	retq   

0000000000800199 <ide_read>:
  800199:	55                   	push   %rbp
  80019a:	48 89 e5             	mov    %rsp,%rbp
  80019d:	48 83 ec 70          	sub    $0x70,%rsp
  8001a1:	89 7d ac             	mov    %edi,-0x54(%rbp)
  8001a4:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8001a8:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8001ac:	48 81 7d 98 00 01 00 	cmpq   $0x100,-0x68(%rbp)
  8001b3:	00 
  8001b4:	76 35                	jbe    8001eb <ide_read+0x52>
  8001b6:	48 b9 73 71 80 00 00 	movabs $0x807173,%rcx
  8001bd:	00 00 00 
  8001c0:	48 ba 80 71 80 00 00 	movabs $0x807180,%rdx
  8001c7:	00 00 00 
  8001ca:	be 51 00 00 00       	mov    $0x51,%esi
  8001cf:	48 bf 67 71 80 00 00 	movabs $0x807167,%rdi
  8001d6:	00 00 00 
  8001d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8001de:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  8001e5:	00 00 00 
  8001e8:	41 ff d0             	callq  *%r8
  8001eb:	bf 00 00 00 00       	mov    $0x0,%edi
  8001f0:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001f7:	00 00 00 
  8001fa:	ff d0                	callq  *%rax
  8001fc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800200:	0f b6 c0             	movzbl %al,%eax
  800203:	c7 45 f8 f2 01 00 00 	movl   $0x1f2,-0x8(%rbp)
  80020a:	88 45 f7             	mov    %al,-0x9(%rbp)
  80020d:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
  800211:	8b 55 f8             	mov    -0x8(%rbp),%edx
  800214:	ee                   	out    %al,(%dx)
  800215:	8b 45 ac             	mov    -0x54(%rbp),%eax
  800218:	0f b6 c0             	movzbl %al,%eax
  80021b:	c7 45 f0 f3 01 00 00 	movl   $0x1f3,-0x10(%rbp)
  800222:	88 45 ef             	mov    %al,-0x11(%rbp)
  800225:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  800229:	8b 55 f0             	mov    -0x10(%rbp),%edx
  80022c:	ee                   	out    %al,(%dx)
  80022d:	8b 45 ac             	mov    -0x54(%rbp),%eax
  800230:	c1 e8 08             	shr    $0x8,%eax
  800233:	0f b6 c0             	movzbl %al,%eax
  800236:	c7 45 e8 f4 01 00 00 	movl   $0x1f4,-0x18(%rbp)
  80023d:	88 45 e7             	mov    %al,-0x19(%rbp)
  800240:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
  800244:	8b 55 e8             	mov    -0x18(%rbp),%edx
  800247:	ee                   	out    %al,(%dx)
  800248:	8b 45 ac             	mov    -0x54(%rbp),%eax
  80024b:	c1 e8 10             	shr    $0x10,%eax
  80024e:	0f b6 c0             	movzbl %al,%eax
  800251:	c7 45 e0 f5 01 00 00 	movl   $0x1f5,-0x20(%rbp)
  800258:	88 45 df             	mov    %al,-0x21(%rbp)
  80025b:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
  80025f:	8b 55 e0             	mov    -0x20(%rbp),%edx
  800262:	ee                   	out    %al,(%dx)
  800263:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80026a:	00 00 00 
  80026d:	8b 00                	mov    (%rax),%eax
  80026f:	83 e0 01             	and    $0x1,%eax
  800272:	c1 e0 04             	shl    $0x4,%eax
  800275:	89 c2                	mov    %eax,%edx
  800277:	8b 45 ac             	mov    -0x54(%rbp),%eax
  80027a:	c1 e8 18             	shr    $0x18,%eax
  80027d:	83 e0 0f             	and    $0xf,%eax
  800280:	09 d0                	or     %edx,%eax
  800282:	83 c8 e0             	or     $0xffffffe0,%eax
  800285:	0f b6 c0             	movzbl %al,%eax
  800288:	c7 45 d8 f6 01 00 00 	movl   $0x1f6,-0x28(%rbp)
  80028f:	88 45 d7             	mov    %al,-0x29(%rbp)
  800292:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
  800296:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800299:	ee                   	out    %al,(%dx)
  80029a:	c7 45 d0 f7 01 00 00 	movl   $0x1f7,-0x30(%rbp)
  8002a1:	c6 45 cf 20          	movb   $0x20,-0x31(%rbp)
  8002a5:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
  8002a9:	8b 55 d0             	mov    -0x30(%rbp),%edx
  8002ac:	ee                   	out    %al,(%dx)
  8002ad:	eb 64                	jmp    800313 <ide_read+0x17a>
  8002af:	bf 01 00 00 00       	mov    $0x1,%edi
  8002b4:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8002bb:	00 00 00 
  8002be:	ff d0                	callq  *%rax
  8002c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8002c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8002c7:	79 05                	jns    8002ce <ide_read+0x135>
  8002c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002cc:	eb 51                	jmp    80031f <ide_read+0x186>
  8002ce:	c7 45 c8 f0 01 00 00 	movl   $0x1f0,-0x38(%rbp)
  8002d5:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  8002d9:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  8002dd:	c7 45 bc 00 01 00 00 	movl   $0x100,-0x44(%rbp)
}

static __inline void
insw(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsw"			:
  8002e4:	8b 55 c8             	mov    -0x38(%rbp),%edx
  8002e7:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
  8002eb:	8b 45 bc             	mov    -0x44(%rbp),%eax
  8002ee:	48 89 ce             	mov    %rcx,%rsi
  8002f1:	48 89 f7             	mov    %rsi,%rdi
  8002f4:	89 c1                	mov    %eax,%ecx
  8002f6:	fc                   	cld    
  8002f7:	f2 66 6d             	repnz insw (%dx),%es:(%rdi)
  8002fa:	89 c8                	mov    %ecx,%eax
  8002fc:	48 89 fe             	mov    %rdi,%rsi
  8002ff:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800303:	89 45 bc             	mov    %eax,-0x44(%rbp)
  800306:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80030b:	48 81 45 a0 00 02 00 	addq   $0x200,-0x60(%rbp)
  800312:	00 
  800313:	48 83 7d 98 00       	cmpq   $0x0,-0x68(%rbp)
  800318:	75 95                	jne    8002af <ide_read+0x116>
  80031a:	b8 00 00 00 00       	mov    $0x0,%eax
  80031f:	c9                   	leaveq 
  800320:	c3                   	retq   

0000000000800321 <ide_write>:
  800321:	55                   	push   %rbp
  800322:	48 89 e5             	mov    %rsp,%rbp
  800325:	48 83 ec 70          	sub    $0x70,%rsp
  800329:	89 7d ac             	mov    %edi,-0x54(%rbp)
  80032c:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800330:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800334:	48 81 7d 98 00 01 00 	cmpq   $0x100,-0x68(%rbp)
  80033b:	00 
  80033c:	76 35                	jbe    800373 <ide_write+0x52>
  80033e:	48 b9 73 71 80 00 00 	movabs $0x807173,%rcx
  800345:	00 00 00 
  800348:	48 ba 80 71 80 00 00 	movabs $0x807180,%rdx
  80034f:	00 00 00 
  800352:	be 71 00 00 00       	mov    $0x71,%esi
  800357:	48 bf 67 71 80 00 00 	movabs $0x807167,%rdi
  80035e:	00 00 00 
  800361:	b8 00 00 00 00       	mov    $0x0,%eax
  800366:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  80036d:	00 00 00 
  800370:	41 ff d0             	callq  *%r8
  800373:	bf 00 00 00 00       	mov    $0x0,%edi
  800378:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80037f:	00 00 00 
  800382:	ff d0                	callq  *%rax
  800384:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800388:	0f b6 c0             	movzbl %al,%eax
  80038b:	c7 45 f8 f2 01 00 00 	movl   $0x1f2,-0x8(%rbp)
  800392:	88 45 f7             	mov    %al,-0x9(%rbp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  800395:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
  800399:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80039c:	ee                   	out    %al,(%dx)
  80039d:	8b 45 ac             	mov    -0x54(%rbp),%eax
  8003a0:	0f b6 c0             	movzbl %al,%eax
  8003a3:	c7 45 f0 f3 01 00 00 	movl   $0x1f3,-0x10(%rbp)
  8003aa:	88 45 ef             	mov    %al,-0x11(%rbp)
  8003ad:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8003b1:	8b 55 f0             	mov    -0x10(%rbp),%edx
  8003b4:	ee                   	out    %al,(%dx)
  8003b5:	8b 45 ac             	mov    -0x54(%rbp),%eax
  8003b8:	c1 e8 08             	shr    $0x8,%eax
  8003bb:	0f b6 c0             	movzbl %al,%eax
  8003be:	c7 45 e8 f4 01 00 00 	movl   $0x1f4,-0x18(%rbp)
  8003c5:	88 45 e7             	mov    %al,-0x19(%rbp)
  8003c8:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
  8003cc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8003cf:	ee                   	out    %al,(%dx)
  8003d0:	8b 45 ac             	mov    -0x54(%rbp),%eax
  8003d3:	c1 e8 10             	shr    $0x10,%eax
  8003d6:	0f b6 c0             	movzbl %al,%eax
  8003d9:	c7 45 e0 f5 01 00 00 	movl   $0x1f5,-0x20(%rbp)
  8003e0:	88 45 df             	mov    %al,-0x21(%rbp)
  8003e3:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
  8003e7:	8b 55 e0             	mov    -0x20(%rbp),%edx
  8003ea:	ee                   	out    %al,(%dx)
  8003eb:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8003f2:	00 00 00 
  8003f5:	8b 00                	mov    (%rax),%eax
  8003f7:	83 e0 01             	and    $0x1,%eax
  8003fa:	c1 e0 04             	shl    $0x4,%eax
  8003fd:	89 c2                	mov    %eax,%edx
  8003ff:	8b 45 ac             	mov    -0x54(%rbp),%eax
  800402:	c1 e8 18             	shr    $0x18,%eax
  800405:	83 e0 0f             	and    $0xf,%eax
  800408:	09 d0                	or     %edx,%eax
  80040a:	83 c8 e0             	or     $0xffffffe0,%eax
  80040d:	0f b6 c0             	movzbl %al,%eax
  800410:	c7 45 d8 f6 01 00 00 	movl   $0x1f6,-0x28(%rbp)
  800417:	88 45 d7             	mov    %al,-0x29(%rbp)
  80041a:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
  80041e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800421:	ee                   	out    %al,(%dx)
  800422:	c7 45 d0 f7 01 00 00 	movl   $0x1f7,-0x30(%rbp)
  800429:	c6 45 cf 30          	movb   $0x30,-0x31(%rbp)
  80042d:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
  800431:	8b 55 d0             	mov    -0x30(%rbp),%edx
  800434:	ee                   	out    %al,(%dx)
  800435:	eb 5e                	jmp    800495 <ide_write+0x174>
  800437:	bf 01 00 00 00       	mov    $0x1,%edi
  80043c:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800443:	00 00 00 
  800446:	ff d0                	callq  *%rax
  800448:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80044b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80044f:	79 05                	jns    800456 <ide_write+0x135>
  800451:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800454:	eb 4b                	jmp    8004a1 <ide_write+0x180>
  800456:	c7 45 c8 f0 01 00 00 	movl   $0x1f0,-0x38(%rbp)
  80045d:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  800461:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  800465:	c7 45 bc 00 01 00 00 	movl   $0x100,-0x44(%rbp)
}

static __inline void
outsw(int port, const void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\toutsw"		:
  80046c:	8b 55 c8             	mov    -0x38(%rbp),%edx
  80046f:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
  800473:	8b 45 bc             	mov    -0x44(%rbp),%eax
  800476:	48 89 ce             	mov    %rcx,%rsi
  800479:	89 c1                	mov    %eax,%ecx
  80047b:	fc                   	cld    
  80047c:	f2 66 6f             	repnz outsw %ds:(%rsi),(%dx)
  80047f:	89 c8                	mov    %ecx,%eax
  800481:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800485:	89 45 bc             	mov    %eax,-0x44(%rbp)
  800488:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80048d:	48 81 45 a0 00 02 00 	addq   $0x200,-0x60(%rbp)
  800494:	00 
  800495:	48 83 7d 98 00       	cmpq   $0x0,-0x68(%rbp)
  80049a:	75 9b                	jne    800437 <ide_write+0x116>
  80049c:	b8 00 00 00 00       	mov    $0x0,%eax
  8004a1:	c9                   	leaveq 
  8004a2:	c3                   	retq   

00000000008004a3 <diskaddr>:
#include "fs.h"

// Return the virtual address of this disk block.
void*
diskaddr(uint64_t blockno)
{
  8004a3:	55                   	push   %rbp
  8004a4:	48 89 e5             	mov    %rsp,%rbp
  8004a7:	48 83 ec 10          	sub    $0x10,%rsp
  8004ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
	if (blockno == 0 || (super && blockno >= super->s_nblocks))
  8004af:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8004b4:	74 2a                	je     8004e0 <diskaddr+0x3d>
  8004b6:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  8004bd:	00 00 00 
  8004c0:	48 8b 00             	mov    (%rax),%rax
  8004c3:	48 85 c0             	test   %rax,%rax
  8004c6:	74 4a                	je     800512 <diskaddr+0x6f>
  8004c8:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  8004cf:	00 00 00 
  8004d2:	48 8b 00             	mov    (%rax),%rax
  8004d5:	8b 40 04             	mov    0x4(%rax),%eax
  8004d8:	89 c0                	mov    %eax,%eax
  8004da:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8004de:	77 32                	ja     800512 <diskaddr+0x6f>
		panic("bad block number %08x in diskaddr", blockno);
  8004e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004e4:	48 89 c1             	mov    %rax,%rcx
  8004e7:	48 ba 98 71 80 00 00 	movabs $0x807198,%rdx
  8004ee:	00 00 00 
  8004f1:	be 09 00 00 00       	mov    $0x9,%esi
  8004f6:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  8004fd:	00 00 00 
  800500:	b8 00 00 00 00       	mov    $0x0,%eax
  800505:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  80050c:	00 00 00 
  80050f:	41 ff d0             	callq  *%r8
	return (char*) (DISKMAP + blockno * BLKSIZE);
  800512:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800516:	48 05 00 00 01 00    	add    $0x10000,%rax
  80051c:	48 c1 e0 0c          	shl    $0xc,%rax
}
  800520:	c9                   	leaveq 
  800521:	c3                   	retq   

0000000000800522 <va_is_mapped>:

// Is this virtual address mapped?
bool
va_is_mapped(void *va)
{
  800522:	55                   	push   %rbp
  800523:	48 89 e5             	mov    %rsp,%rbp
  800526:	48 83 ec 08          	sub    $0x8,%rsp
  80052a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
	return (uvpml4e[VPML4E(va)] & PTE_P) && (uvpde[VPDPE(va)] & PTE_P) && (uvpd[VPD(va)] & PTE_P) && (uvpt[PGNUM(va)] & PTE_P);
  80052e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800532:	48 c1 e8 27          	shr    $0x27,%rax
  800536:	48 89 c2             	mov    %rax,%rdx
  800539:	48 b8 00 20 40 80 00 	movabs $0x10080402000,%rax
  800540:	01 00 00 
  800543:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800547:	83 e0 01             	and    $0x1,%eax
  80054a:	48 85 c0             	test   %rax,%rax
  80054d:	74 6a                	je     8005b9 <va_is_mapped+0x97>
  80054f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800553:	48 c1 e8 1e          	shr    $0x1e,%rax
  800557:	48 89 c2             	mov    %rax,%rdx
  80055a:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  800561:	01 00 00 
  800564:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800568:	83 e0 01             	and    $0x1,%eax
  80056b:	48 85 c0             	test   %rax,%rax
  80056e:	74 49                	je     8005b9 <va_is_mapped+0x97>
  800570:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800574:	48 c1 e8 15          	shr    $0x15,%rax
  800578:	48 89 c2             	mov    %rax,%rdx
  80057b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  800582:	01 00 00 
  800585:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800589:	83 e0 01             	and    $0x1,%eax
  80058c:	48 85 c0             	test   %rax,%rax
  80058f:	74 28                	je     8005b9 <va_is_mapped+0x97>
  800591:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800595:	48 c1 e8 0c          	shr    $0xc,%rax
  800599:	48 89 c2             	mov    %rax,%rdx
  80059c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8005a3:	01 00 00 
  8005a6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8005aa:	83 e0 01             	and    $0x1,%eax
  8005ad:	48 85 c0             	test   %rax,%rax
  8005b0:	74 07                	je     8005b9 <va_is_mapped+0x97>
  8005b2:	b8 01 00 00 00       	mov    $0x1,%eax
  8005b7:	eb 05                	jmp    8005be <va_is_mapped+0x9c>
  8005b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8005be:	83 e0 01             	and    $0x1,%eax
}
  8005c1:	c9                   	leaveq 
  8005c2:	c3                   	retq   

00000000008005c3 <va_is_dirty>:

// Is this virtual address dirty?
bool
va_is_dirty(void *va)
{
  8005c3:	55                   	push   %rbp
  8005c4:	48 89 e5             	mov    %rsp,%rbp
  8005c7:	48 83 ec 08          	sub    $0x8,%rsp
  8005cb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
	return (uvpt[PGNUM(va)] & PTE_D) != 0;
  8005cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005d3:	48 c1 e8 0c          	shr    $0xc,%rax
  8005d7:	48 89 c2             	mov    %rax,%rdx
  8005da:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8005e1:	01 00 00 
  8005e4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8005e8:	83 e0 40             	and    $0x40,%eax
  8005eb:	48 85 c0             	test   %rax,%rax
  8005ee:	0f 95 c0             	setne  %al
}
  8005f1:	c9                   	leaveq 
  8005f2:	c3                   	retq   

00000000008005f3 <bc_pgfault>:
// Fault any disk block that is read in to memory by
// loading it from disk.
// Hint: Use ide_read and BLKSECTS.
static void
bc_pgfault(struct UTrapframe *utf)
{
  8005f3:	55                   	push   %rbp
  8005f4:	48 89 e5             	mov    %rsp,%rbp
  8005f7:	48 83 ec 30          	sub    $0x30,%rsp
  8005fb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
	void *addr = (void *) utf->utf_fault_va;
  8005ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800603:	48 8b 00             	mov    (%rax),%rax
  800606:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
	uint64_t blockno = ((uint64_t)addr - DISKMAP) / BLKSIZE;
  80060a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80060e:	48 2d 00 00 00 10    	sub    $0x10000000,%rax
  800614:	48 c1 e8 0c          	shr    $0xc,%rax
  800618:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
	int r;

	// Check that the fault was within the block cache region
	if (addr < (void*)DISKMAP || addr >= (void*)(DISKMAP + DISKSIZE))
  80061c:	48 81 7d f8 ff ff ff 	cmpq   $0xfffffff,-0x8(%rbp)
  800623:	0f 
  800624:	76 0b                	jbe    800631 <bc_pgfault+0x3e>
  800626:	b8 ff ff ff cf       	mov    $0xcfffffff,%eax
  80062b:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80062f:	76 4b                	jbe    80067c <bc_pgfault+0x89>
		panic("page fault in FS: eip %08x, va %08x, err %04x",
  800631:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800635:	48 8b 48 08          	mov    0x8(%rax),%rcx
  800639:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80063d:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
  800644:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800648:	49 89 c9             	mov    %rcx,%r9
  80064b:	49 89 d0             	mov    %rdx,%r8
  80064e:	48 89 c1             	mov    %rax,%rcx
  800651:	48 ba c8 71 80 00 00 	movabs $0x8071c8,%rdx
  800658:	00 00 00 
  80065b:	be 28 00 00 00       	mov    $0x28,%esi
  800660:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  800667:	00 00 00 
  80066a:	b8 00 00 00 00       	mov    $0x0,%eax
  80066f:	49 ba fd 30 80 00 00 	movabs $0x8030fd,%r10
  800676:	00 00 00 
  800679:	41 ff d2             	callq  *%r10
		      utf->utf_rip, addr, utf->utf_err);

	// Sanity check the block number.
	if (super && blockno >= super->s_nblocks)
  80067c:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  800683:	00 00 00 
  800686:	48 8b 00             	mov    (%rax),%rax
  800689:	48 85 c0             	test   %rax,%rax
  80068c:	74 4a                	je     8006d8 <bc_pgfault+0xe5>
  80068e:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  800695:	00 00 00 
  800698:	48 8b 00             	mov    (%rax),%rax
  80069b:	8b 40 04             	mov    0x4(%rax),%eax
  80069e:	89 c0                	mov    %eax,%eax
  8006a0:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8006a4:	77 32                	ja     8006d8 <bc_pgfault+0xe5>
		panic("reading non-existent block %08x\n", blockno);
  8006a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006aa:	48 89 c1             	mov    %rax,%rcx
  8006ad:	48 ba f8 71 80 00 00 	movabs $0x8071f8,%rdx
  8006b4:	00 00 00 
  8006b7:	be 2c 00 00 00       	mov    $0x2c,%esi
  8006bc:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  8006c3:	00 00 00 
  8006c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8006cb:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  8006d2:	00 00 00 
  8006d5:	41 ff d0             	callq  *%r8

	// Allocate a page in the disk map region, read the contents
	// of the block from the disk into that page.
	// Hint: first round addr to page boundary.
	//
	addr = ROUNDDOWN(addr, PGSIZE);
  8006d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006dc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8006e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e4:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8006ea:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
	if ((r = sys_page_alloc(0, addr, PTE_U|PTE_P|PTE_W)) < 0)
  8006ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006f2:	ba 07 00 00 00       	mov    $0x7,%edx
  8006f7:	48 89 c6             	mov    %rax,%rsi
  8006fa:	bf 00 00 00 00       	mov    $0x0,%edi
  8006ff:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  800706:	00 00 00 
  800709:	ff d0                	callq  *%rax
  80070b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80070e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800712:	79 30                	jns    800744 <bc_pgfault+0x151>
		panic("in bc_pgfault, sys_page_alloc: %e", r);
  800714:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800717:	89 c1                	mov    %eax,%ecx
  800719:	48 ba 20 72 80 00 00 	movabs $0x807220,%rdx
  800720:	00 00 00 
  800723:	be 34 00 00 00       	mov    $0x34,%esi
  800728:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  80072f:	00 00 00 
  800732:	b8 00 00 00 00       	mov    $0x0,%eax
  800737:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  80073e:	00 00 00 
  800741:	41 ff d0             	callq  *%r8

#ifndef VMM_GUEST

	if ((r = ide_read(blockno * BLKSECTS, addr, BLKSECTS)) < 0)
  800744:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800748:	8d 0c c5 00 00 00 00 	lea    0x0(,%rax,8),%ecx
  80074f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800753:	ba 08 00 00 00       	mov    $0x8,%edx
  800758:	48 89 c6             	mov    %rax,%rsi
  80075b:	89 cf                	mov    %ecx,%edi
  80075d:	48 b8 99 01 80 00 00 	movabs $0x800199,%rax
  800764:	00 00 00 
  800767:	ff d0                	callq  *%rax
  800769:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80076c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800770:	79 30                	jns    8007a2 <bc_pgfault+0x1af>
		panic("in bc_pgfault, ide_read: %e", r);
  800772:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800775:	89 c1                	mov    %eax,%ecx
  800777:	48 ba 42 72 80 00 00 	movabs $0x807242,%rdx
  80077e:	00 00 00 
  800781:	be 39 00 00 00       	mov    $0x39,%esi
  800786:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  80078d:	00 00 00 
  800790:	b8 00 00 00 00       	mov    $0x0,%eax
  800795:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  80079c:	00 00 00 
  80079f:	41 ff d0             	callq  *%r8
	/* FIXME DP: Should be lab 8 */
    /* Your code here */

#endif // VMM_GUEST

	if ((r = sys_page_map(0, addr, 0, addr, uvpt[PGNUM(addr)] & PTE_SYSCALL)) < 0)
  8007a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007a6:	48 c1 e8 0c          	shr    $0xc,%rax
  8007aa:	48 89 c2             	mov    %rax,%rdx
  8007ad:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8007b4:	01 00 00 
  8007b7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8007bb:	25 07 0e 00 00       	and    $0xe07,%eax
  8007c0:	89 c1                	mov    %eax,%ecx
  8007c2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8007c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007ca:	41 89 c8             	mov    %ecx,%r8d
  8007cd:	48 89 d1             	mov    %rdx,%rcx
  8007d0:	ba 00 00 00 00       	mov    $0x0,%edx
  8007d5:	48 89 c6             	mov    %rax,%rsi
  8007d8:	bf 00 00 00 00       	mov    $0x0,%edi
  8007dd:	48 b8 6a 48 80 00 00 	movabs $0x80486a,%rax
  8007e4:	00 00 00 
  8007e7:	ff d0                	callq  *%rax
  8007e9:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8007ec:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007f0:	79 30                	jns    800822 <bc_pgfault+0x22f>
		panic("in bc_pgfault, sys_page_map: %e", r);
  8007f2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8007f5:	89 c1                	mov    %eax,%ecx
  8007f7:	48 ba 60 72 80 00 00 	movabs $0x807260,%rdx
  8007fe:	00 00 00 
  800801:	be 43 00 00 00       	mov    $0x43,%esi
  800806:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  80080d:	00 00 00 
  800810:	b8 00 00 00 00       	mov    $0x0,%eax
  800815:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  80081c:	00 00 00 
  80081f:	41 ff d0             	callq  *%r8

	// Check that the block we read was allocated. (exercise for
	// the reader: why do we do this *after* reading the block
	// in?)
	if (bitmap && block_is_free(blockno))
  800822:	48 b8 10 30 81 00 00 	movabs $0x813010,%rax
  800829:	00 00 00 
  80082c:	48 8b 00             	mov    (%rax),%rax
  80082f:	48 85 c0             	test   %rax,%rax
  800832:	74 48                	je     80087c <bc_pgfault+0x289>
  800834:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800838:	89 c7                	mov    %eax,%edi
  80083a:	48 b8 2c 0d 80 00 00 	movabs $0x800d2c,%rax
  800841:	00 00 00 
  800844:	ff d0                	callq  *%rax
  800846:	84 c0                	test   %al,%al
  800848:	74 32                	je     80087c <bc_pgfault+0x289>
		panic("reading free block %08x\n", blockno);
  80084a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80084e:	48 89 c1             	mov    %rax,%rcx
  800851:	48 ba 80 72 80 00 00 	movabs $0x807280,%rdx
  800858:	00 00 00 
  80085b:	be 49 00 00 00       	mov    $0x49,%esi
  800860:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  800867:	00 00 00 
  80086a:	b8 00 00 00 00       	mov    $0x0,%eax
  80086f:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  800876:	00 00 00 
  800879:	41 ff d0             	callq  *%r8
}
  80087c:	c9                   	leaveq 
  80087d:	c3                   	retq   

000000000080087e <flush_block>:
// Hint: Use va_is_mapped, va_is_dirty, and ide_write.
// Hint: Use the PTE_SYSCALL constant when calling sys_page_map.
// Hint: Don't forget to round addr down.
void
flush_block(void *addr)
{
  80087e:	55                   	push   %rbp
  80087f:	48 89 e5             	mov    %rsp,%rbp
  800882:	48 83 ec 20          	sub    $0x20,%rsp
  800886:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
	uint64_t blockno = ((uint64_t)addr - DISKMAP) / BLKSIZE;
  80088a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80088e:	48 2d 00 00 00 10    	sub    $0x10000000,%rax
  800894:	48 c1 e8 0c          	shr    $0xc,%rax
  800898:	48 89 45 f8          	mov    %rax,-0x8(%rbp)

	if (addr < (void*)DISKMAP || addr >= (void*)(DISKMAP + DISKSIZE))
  80089c:	48 81 7d e8 ff ff ff 	cmpq   $0xfffffff,-0x18(%rbp)
  8008a3:	0f 
  8008a4:	76 0b                	jbe    8008b1 <flush_block+0x33>
  8008a6:	b8 ff ff ff cf       	mov    $0xcfffffff,%eax
  8008ab:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
  8008af:	76 32                	jbe    8008e3 <flush_block+0x65>
		panic("flush_block of bad va %08x", addr);
  8008b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b5:	48 89 c1             	mov    %rax,%rcx
  8008b8:	48 ba 99 72 80 00 00 	movabs $0x807299,%rdx
  8008bf:	00 00 00 
  8008c2:	be 59 00 00 00       	mov    $0x59,%esi
  8008c7:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  8008ce:	00 00 00 
  8008d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8008d6:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  8008dd:	00 00 00 
  8008e0:	41 ff d0             	callq  *%r8

	if (!va_is_mapped(addr) || !va_is_dirty(addr))
  8008e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e7:	48 89 c7             	mov    %rax,%rdi
  8008ea:	48 b8 22 05 80 00 00 	movabs $0x800522,%rax
  8008f1:	00 00 00 
  8008f4:	ff d0                	callq  *%rax
  8008f6:	83 f0 01             	xor    $0x1,%eax
  8008f9:	84 c0                	test   %al,%al
  8008fb:	75 1a                	jne    800917 <flush_block+0x99>
  8008fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800901:	48 89 c7             	mov    %rax,%rdi
  800904:	48 b8 c3 05 80 00 00 	movabs $0x8005c3,%rax
  80090b:	00 00 00 
  80090e:	ff d0                	callq  *%rax
  800910:	83 f0 01             	xor    $0x1,%eax
  800913:	84 c0                	test   %al,%al
  800915:	74 05                	je     80091c <flush_block+0x9e>
		return;
  800917:	e9 82 00 00 00       	jmpq   80099e <flush_block+0x120>

	// Write the disk block and clear PTE_D.
	addr = ROUNDDOWN(addr, BLKSIZE);
  80091c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800920:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800924:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800928:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80092e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

#ifndef VMM_GUEST

	ide_write(blockno * BLKSECTS, (void*) addr, BLKSECTS);
  800932:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800936:	8d 0c c5 00 00 00 00 	lea    0x0(,%rax,8),%ecx
  80093d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800941:	ba 08 00 00 00       	mov    $0x8,%edx
  800946:	48 89 c6             	mov    %rax,%rsi
  800949:	89 cf                	mov    %ecx,%edi
  80094b:	48 b8 21 03 80 00 00 	movabs $0x800321,%rax
  800952:	00 00 00 
  800955:	ff d0                	callq  *%rax
	/* FIXME DP: Should be lab 8 */
    /* Your code here */

#endif

	sys_page_map(0, addr, 0, addr, uvpt[PGNUM(addr)] & PTE_SYSCALL);
  800957:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80095b:	48 c1 e8 0c          	shr    $0xc,%rax
  80095f:	48 89 c2             	mov    %rax,%rdx
  800962:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  800969:	01 00 00 
  80096c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800970:	25 07 0e 00 00       	and    $0xe07,%eax
  800975:	89 c1                	mov    %eax,%ecx
  800977:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80097b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80097f:	41 89 c8             	mov    %ecx,%r8d
  800982:	48 89 d1             	mov    %rdx,%rcx
  800985:	ba 00 00 00 00       	mov    $0x0,%edx
  80098a:	48 89 c6             	mov    %rax,%rsi
  80098d:	bf 00 00 00 00       	mov    $0x0,%edi
  800992:	48 b8 6a 48 80 00 00 	movabs $0x80486a,%rax
  800999:	00 00 00 
  80099c:	ff d0                	callq  *%rax
}
  80099e:	c9                   	leaveq 
  80099f:	c3                   	retq   

00000000008009a0 <check_bc>:

// Test that the block cache works, by smashing the superblock and
// reading it back.
static void
check_bc(void)
{
  8009a0:	55                   	push   %rbp
  8009a1:	48 89 e5             	mov    %rsp,%rbp
  8009a4:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
	struct Super backup;

	// back up super block
	memmove(&backup, diskaddr(1), sizeof backup);
  8009ab:	bf 01 00 00 00       	mov    $0x1,%edi
  8009b0:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  8009b7:	00 00 00 
  8009ba:	ff d0                	callq  *%rax
  8009bc:	48 89 c1             	mov    %rax,%rcx
  8009bf:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8009c6:	ba 08 01 00 00       	mov    $0x108,%edx
  8009cb:	48 89 ce             	mov    %rcx,%rsi
  8009ce:	48 89 c7             	mov    %rax,%rdi
  8009d1:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  8009d8:	00 00 00 
  8009db:	ff d0                	callq  *%rax

	// smash it
	strcpy(diskaddr(1), "OOPS!\n");
  8009dd:	bf 01 00 00 00       	mov    $0x1,%edi
  8009e2:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  8009e9:	00 00 00 
  8009ec:	ff d0                	callq  *%rax
  8009ee:	48 be b4 72 80 00 00 	movabs $0x8072b4,%rsi
  8009f5:	00 00 00 
  8009f8:	48 89 c7             	mov    %rax,%rdi
  8009fb:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  800a02:	00 00 00 
  800a05:	ff d0                	callq  *%rax
	flush_block(diskaddr(1));
  800a07:	bf 01 00 00 00       	mov    $0x1,%edi
  800a0c:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800a13:	00 00 00 
  800a16:	ff d0                	callq  *%rax
  800a18:	48 89 c7             	mov    %rax,%rdi
  800a1b:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  800a22:	00 00 00 
  800a25:	ff d0                	callq  *%rax
	assert(va_is_mapped(diskaddr(1)));
  800a27:	bf 01 00 00 00       	mov    $0x1,%edi
  800a2c:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800a33:	00 00 00 
  800a36:	ff d0                	callq  *%rax
  800a38:	48 89 c7             	mov    %rax,%rdi
  800a3b:	48 b8 22 05 80 00 00 	movabs $0x800522,%rax
  800a42:	00 00 00 
  800a45:	ff d0                	callq  *%rax
  800a47:	83 f0 01             	xor    $0x1,%eax
  800a4a:	84 c0                	test   %al,%al
  800a4c:	74 35                	je     800a83 <check_bc+0xe3>
  800a4e:	48 b9 bb 72 80 00 00 	movabs $0x8072bb,%rcx
  800a55:	00 00 00 
  800a58:	48 ba d5 72 80 00 00 	movabs $0x8072d5,%rdx
  800a5f:	00 00 00 
  800a62:	be 7c 00 00 00       	mov    $0x7c,%esi
  800a67:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  800a6e:	00 00 00 
  800a71:	b8 00 00 00 00       	mov    $0x0,%eax
  800a76:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  800a7d:	00 00 00 
  800a80:	41 ff d0             	callq  *%r8
	assert(!va_is_dirty(diskaddr(1)));
  800a83:	bf 01 00 00 00       	mov    $0x1,%edi
  800a88:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800a8f:	00 00 00 
  800a92:	ff d0                	callq  *%rax
  800a94:	48 89 c7             	mov    %rax,%rdi
  800a97:	48 b8 c3 05 80 00 00 	movabs $0x8005c3,%rax
  800a9e:	00 00 00 
  800aa1:	ff d0                	callq  *%rax
  800aa3:	84 c0                	test   %al,%al
  800aa5:	74 35                	je     800adc <check_bc+0x13c>
  800aa7:	48 b9 ea 72 80 00 00 	movabs $0x8072ea,%rcx
  800aae:	00 00 00 
  800ab1:	48 ba d5 72 80 00 00 	movabs $0x8072d5,%rdx
  800ab8:	00 00 00 
  800abb:	be 7d 00 00 00       	mov    $0x7d,%esi
  800ac0:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  800ac7:	00 00 00 
  800aca:	b8 00 00 00 00       	mov    $0x0,%eax
  800acf:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  800ad6:	00 00 00 
  800ad9:	41 ff d0             	callq  *%r8

	// clear it out
	sys_page_unmap(0, diskaddr(1));
  800adc:	bf 01 00 00 00       	mov    $0x1,%edi
  800ae1:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800ae8:	00 00 00 
  800aeb:	ff d0                	callq  *%rax
  800aed:	48 89 c6             	mov    %rax,%rsi
  800af0:	bf 00 00 00 00       	mov    $0x0,%edi
  800af5:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  800afc:	00 00 00 
  800aff:	ff d0                	callq  *%rax
	assert(!va_is_mapped(diskaddr(1)));
  800b01:	bf 01 00 00 00       	mov    $0x1,%edi
  800b06:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800b0d:	00 00 00 
  800b10:	ff d0                	callq  *%rax
  800b12:	48 89 c7             	mov    %rax,%rdi
  800b15:	48 b8 22 05 80 00 00 	movabs $0x800522,%rax
  800b1c:	00 00 00 
  800b1f:	ff d0                	callq  *%rax
  800b21:	84 c0                	test   %al,%al
  800b23:	74 35                	je     800b5a <check_bc+0x1ba>
  800b25:	48 b9 04 73 80 00 00 	movabs $0x807304,%rcx
  800b2c:	00 00 00 
  800b2f:	48 ba d5 72 80 00 00 	movabs $0x8072d5,%rdx
  800b36:	00 00 00 
  800b39:	be 81 00 00 00       	mov    $0x81,%esi
  800b3e:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  800b45:	00 00 00 
  800b48:	b8 00 00 00 00       	mov    $0x0,%eax
  800b4d:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  800b54:	00 00 00 
  800b57:	41 ff d0             	callq  *%r8

	// read it back in
	assert(strcmp(diskaddr(1), "OOPS!\n") == 0);
  800b5a:	bf 01 00 00 00       	mov    $0x1,%edi
  800b5f:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800b66:	00 00 00 
  800b69:	ff d0                	callq  *%rax
  800b6b:	48 be b4 72 80 00 00 	movabs $0x8072b4,%rsi
  800b72:	00 00 00 
  800b75:	48 89 c7             	mov    %rax,%rdi
  800b78:	48 b8 4d 40 80 00 00 	movabs $0x80404d,%rax
  800b7f:	00 00 00 
  800b82:	ff d0                	callq  *%rax
  800b84:	85 c0                	test   %eax,%eax
  800b86:	74 35                	je     800bbd <check_bc+0x21d>
  800b88:	48 b9 20 73 80 00 00 	movabs $0x807320,%rcx
  800b8f:	00 00 00 
  800b92:	48 ba d5 72 80 00 00 	movabs $0x8072d5,%rdx
  800b99:	00 00 00 
  800b9c:	be 84 00 00 00       	mov    $0x84,%esi
  800ba1:	48 bf ba 71 80 00 00 	movabs $0x8071ba,%rdi
  800ba8:	00 00 00 
  800bab:	b8 00 00 00 00       	mov    $0x0,%eax
  800bb0:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  800bb7:	00 00 00 
  800bba:	41 ff d0             	callq  *%r8

	// fix it
	memmove(diskaddr(1), &backup, sizeof backup);
  800bbd:	bf 01 00 00 00       	mov    $0x1,%edi
  800bc2:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800bc9:	00 00 00 
  800bcc:	ff d0                	callq  *%rax
  800bce:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  800bd5:	ba 08 01 00 00       	mov    $0x108,%edx
  800bda:	48 89 ce             	mov    %rcx,%rsi
  800bdd:	48 89 c7             	mov    %rax,%rdi
  800be0:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  800be7:	00 00 00 
  800bea:	ff d0                	callq  *%rax
	flush_block(diskaddr(1));
  800bec:	bf 01 00 00 00       	mov    $0x1,%edi
  800bf1:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800bf8:	00 00 00 
  800bfb:	ff d0                	callq  *%rax
  800bfd:	48 89 c7             	mov    %rax,%rdi
  800c00:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  800c07:	00 00 00 
  800c0a:	ff d0                	callq  *%rax

	cprintf("block cache is good\n");
  800c0c:	48 bf 44 73 80 00 00 	movabs $0x807344,%rdi
  800c13:	00 00 00 
  800c16:	b8 00 00 00 00       	mov    $0x0,%eax
  800c1b:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  800c22:	00 00 00 
  800c25:	ff d2                	callq  *%rdx
}
  800c27:	c9                   	leaveq 
  800c28:	c3                   	retq   

0000000000800c29 <bc_init>:

void
bc_init(void)
{
  800c29:	55                   	push   %rbp
  800c2a:	48 89 e5             	mov    %rsp,%rbp
  800c2d:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
	struct Super super;
	set_pgfault_handler(bc_pgfault);
  800c34:	48 bf f3 05 80 00 00 	movabs $0x8005f3,%rdi
  800c3b:	00 00 00 
  800c3e:	48 b8 f8 4c 80 00 00 	movabs $0x804cf8,%rax
  800c45:	00 00 00 
  800c48:	ff d0                	callq  *%rax
	check_bc();
  800c4a:	48 b8 a0 09 80 00 00 	movabs $0x8009a0,%rax
  800c51:	00 00 00 
  800c54:	ff d0                	callq  *%rax

	// cache the super block by reading it once
	memmove(&super, diskaddr(1), sizeof super);
  800c56:	bf 01 00 00 00       	mov    $0x1,%edi
  800c5b:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  800c62:	00 00 00 
  800c65:	ff d0                	callq  *%rax
  800c67:	48 89 c1             	mov    %rax,%rcx
  800c6a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800c71:	ba 08 01 00 00       	mov    $0x108,%edx
  800c76:	48 89 ce             	mov    %rcx,%rsi
  800c79:	48 89 c7             	mov    %rax,%rdi
  800c7c:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  800c83:	00 00 00 
  800c86:	ff d0                	callq  *%rax
}
  800c88:	c9                   	leaveq 
  800c89:	c3                   	retq   

0000000000800c8a <check_super>:
  800c8a:	55                   	push   %rbp
  800c8b:	48 89 e5             	mov    %rsp,%rbp
  800c8e:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  800c95:	00 00 00 
  800c98:	48 8b 00             	mov    (%rax),%rax
  800c9b:	8b 00                	mov    (%rax),%eax
  800c9d:	3d ae 30 05 4a       	cmp    $0x4a0530ae,%eax
  800ca2:	74 2a                	je     800cce <check_super+0x44>
  800ca4:	48 ba 59 73 80 00 00 	movabs $0x807359,%rdx
  800cab:	00 00 00 
  800cae:	be 12 00 00 00       	mov    $0x12,%esi
  800cb3:	48 bf 76 73 80 00 00 	movabs $0x807376,%rdi
  800cba:	00 00 00 
  800cbd:	b8 00 00 00 00       	mov    $0x0,%eax
  800cc2:	48 b9 fd 30 80 00 00 	movabs $0x8030fd,%rcx
  800cc9:	00 00 00 
  800ccc:	ff d1                	callq  *%rcx
  800cce:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  800cd5:	00 00 00 
  800cd8:	48 8b 00             	mov    (%rax),%rax
  800cdb:	8b 40 04             	mov    0x4(%rax),%eax
  800cde:	3d 00 00 0c 00       	cmp    $0xc0000,%eax
  800ce3:	76 2a                	jbe    800d0f <check_super+0x85>
  800ce5:	48 ba 81 73 80 00 00 	movabs $0x807381,%rdx
  800cec:	00 00 00 
  800cef:	be 15 00 00 00       	mov    $0x15,%esi
  800cf4:	48 bf 76 73 80 00 00 	movabs $0x807376,%rdi
  800cfb:	00 00 00 
  800cfe:	b8 00 00 00 00       	mov    $0x0,%eax
  800d03:	48 b9 fd 30 80 00 00 	movabs $0x8030fd,%rcx
  800d0a:	00 00 00 
  800d0d:	ff d1                	callq  *%rcx
  800d0f:	48 bf 9a 73 80 00 00 	movabs $0x80739a,%rdi
  800d16:	00 00 00 
  800d19:	b8 00 00 00 00       	mov    $0x0,%eax
  800d1e:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  800d25:	00 00 00 
  800d28:	ff d2                	callq  *%rdx
  800d2a:	5d                   	pop    %rbp
  800d2b:	c3                   	retq   

0000000000800d2c <block_is_free>:
  800d2c:	55                   	push   %rbp
  800d2d:	48 89 e5             	mov    %rsp,%rbp
  800d30:	48 83 ec 04          	sub    $0x4,%rsp
  800d34:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d37:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  800d3e:	00 00 00 
  800d41:	48 8b 00             	mov    (%rax),%rax
  800d44:	48 85 c0             	test   %rax,%rax
  800d47:	74 15                	je     800d5e <block_is_free+0x32>
  800d49:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  800d50:	00 00 00 
  800d53:	48 8b 00             	mov    (%rax),%rax
  800d56:	8b 40 04             	mov    0x4(%rax),%eax
  800d59:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  800d5c:	77 07                	ja     800d65 <block_is_free+0x39>
  800d5e:	b8 00 00 00 00       	mov    $0x0,%eax
  800d63:	eb 41                	jmp    800da6 <block_is_free+0x7a>
  800d65:	48 b8 10 30 81 00 00 	movabs $0x813010,%rax
  800d6c:	00 00 00 
  800d6f:	48 8b 00             	mov    (%rax),%rax
  800d72:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d75:	c1 ea 05             	shr    $0x5,%edx
  800d78:	89 d2                	mov    %edx,%edx
  800d7a:	48 c1 e2 02          	shl    $0x2,%rdx
  800d7e:	48 01 d0             	add    %rdx,%rax
  800d81:	8b 10                	mov    (%rax),%edx
  800d83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d86:	83 e0 1f             	and    $0x1f,%eax
  800d89:	be 01 00 00 00       	mov    $0x1,%esi
  800d8e:	89 c1                	mov    %eax,%ecx
  800d90:	d3 e6                	shl    %cl,%esi
  800d92:	89 f0                	mov    %esi,%eax
  800d94:	21 d0                	and    %edx,%eax
  800d96:	85 c0                	test   %eax,%eax
  800d98:	74 07                	je     800da1 <block_is_free+0x75>
  800d9a:	b8 01 00 00 00       	mov    $0x1,%eax
  800d9f:	eb 05                	jmp    800da6 <block_is_free+0x7a>
  800da1:	b8 00 00 00 00       	mov    $0x0,%eax
  800da6:	c9                   	leaveq 
  800da7:	c3                   	retq   

0000000000800da8 <free_block>:
  800da8:	55                   	push   %rbp
  800da9:	48 89 e5             	mov    %rsp,%rbp
  800dac:	48 83 ec 10          	sub    $0x10,%rsp
  800db0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800db3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800db7:	75 2a                	jne    800de3 <free_block+0x3b>
  800db9:	48 ba ae 73 80 00 00 	movabs $0x8073ae,%rdx
  800dc0:	00 00 00 
  800dc3:	be 30 00 00 00       	mov    $0x30,%esi
  800dc8:	48 bf 76 73 80 00 00 	movabs $0x807376,%rdi
  800dcf:	00 00 00 
  800dd2:	b8 00 00 00 00       	mov    $0x0,%eax
  800dd7:	48 b9 fd 30 80 00 00 	movabs $0x8030fd,%rcx
  800dde:	00 00 00 
  800de1:	ff d1                	callq  *%rcx
  800de3:	48 b8 10 30 81 00 00 	movabs $0x813010,%rax
  800dea:	00 00 00 
  800ded:	48 8b 10             	mov    (%rax),%rdx
  800df0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800df3:	c1 e8 05             	shr    $0x5,%eax
  800df6:	89 c1                	mov    %eax,%ecx
  800df8:	48 c1 e1 02          	shl    $0x2,%rcx
  800dfc:	48 8d 34 0a          	lea    (%rdx,%rcx,1),%rsi
  800e00:	48 ba 10 30 81 00 00 	movabs $0x813010,%rdx
  800e07:	00 00 00 
  800e0a:	48 8b 12             	mov    (%rdx),%rdx
  800e0d:	89 c0                	mov    %eax,%eax
  800e0f:	48 c1 e0 02          	shl    $0x2,%rax
  800e13:	48 01 d0             	add    %rdx,%rax
  800e16:	8b 10                	mov    (%rax),%edx
  800e18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e1b:	83 e0 1f             	and    $0x1f,%eax
  800e1e:	bf 01 00 00 00       	mov    $0x1,%edi
  800e23:	89 c1                	mov    %eax,%ecx
  800e25:	d3 e7                	shl    %cl,%edi
  800e27:	89 f8                	mov    %edi,%eax
  800e29:	09 d0                	or     %edx,%eax
  800e2b:	89 06                	mov    %eax,(%rsi)
  800e2d:	c9                   	leaveq 
  800e2e:	c3                   	retq   

0000000000800e2f <alloc_block>:
  800e2f:	55                   	push   %rbp
  800e30:	48 89 e5             	mov    %rsp,%rbp
  800e33:	48 83 ec 10          	sub    $0x10,%rsp
  800e37:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800e3e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800e45:	e9 ee 00 00 00       	jmpq   800f38 <alloc_block+0x109>
  800e4a:	48 b8 00 30 81 00 00 	movabs $0x813000,%rax
  800e51:	00 00 00 
  800e54:	8b 10                	mov    (%rax),%edx
  800e56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e59:	01 d0                	add    %edx,%eax
  800e5b:	48 ba 18 30 81 00 00 	movabs $0x813018,%rdx
  800e62:	00 00 00 
  800e65:	48 8b 12             	mov    (%rdx),%rdx
  800e68:	8b 4a 04             	mov    0x4(%rdx),%ecx
  800e6b:	ba 00 00 00 00       	mov    $0x0,%edx
  800e70:	f7 f1                	div    %ecx
  800e72:	89 d0                	mov    %edx,%eax
  800e74:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800e77:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800e7a:	89 c7                	mov    %eax,%edi
  800e7c:	48 b8 2c 0d 80 00 00 	movabs $0x800d2c,%rax
  800e83:	00 00 00 
  800e86:	ff d0                	callq  *%rax
  800e88:	84 c0                	test   %al,%al
  800e8a:	0f 84 a4 00 00 00    	je     800f34 <alloc_block+0x105>
  800e90:	48 b8 10 30 81 00 00 	movabs $0x813010,%rax
  800e97:	00 00 00 
  800e9a:	48 8b 10             	mov    (%rax),%rdx
  800e9d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800ea0:	8d 48 1f             	lea    0x1f(%rax),%ecx
  800ea3:	85 c0                	test   %eax,%eax
  800ea5:	0f 48 c1             	cmovs  %ecx,%eax
  800ea8:	c1 f8 05             	sar    $0x5,%eax
  800eab:	48 63 c8             	movslq %eax,%rcx
  800eae:	48 c1 e1 02          	shl    $0x2,%rcx
  800eb2:	48 8d 34 0a          	lea    (%rdx,%rcx,1),%rsi
  800eb6:	48 ba 10 30 81 00 00 	movabs $0x813010,%rdx
  800ebd:	00 00 00 
  800ec0:	48 8b 12             	mov    (%rdx),%rdx
  800ec3:	48 98                	cltq   
  800ec5:	48 c1 e0 02          	shl    $0x2,%rax
  800ec9:	48 01 d0             	add    %rdx,%rax
  800ecc:	8b 38                	mov    (%rax),%edi
  800ece:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800ed1:	99                   	cltd   
  800ed2:	c1 ea 1b             	shr    $0x1b,%edx
  800ed5:	01 d0                	add    %edx,%eax
  800ed7:	83 e0 1f             	and    $0x1f,%eax
  800eda:	29 d0                	sub    %edx,%eax
  800edc:	ba 01 00 00 00       	mov    $0x1,%edx
  800ee1:	89 c1                	mov    %eax,%ecx
  800ee3:	d3 e2                	shl    %cl,%edx
  800ee5:	89 d0                	mov    %edx,%eax
  800ee7:	f7 d0                	not    %eax
  800ee9:	21 f8                	and    %edi,%eax
  800eeb:	89 06                	mov    %eax,(%rsi)
  800eed:	48 b8 10 30 81 00 00 	movabs $0x813010,%rax
  800ef4:	00 00 00 
  800ef7:	48 8b 10             	mov    (%rax),%rdx
  800efa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800efd:	8d 48 1f             	lea    0x1f(%rax),%ecx
  800f00:	85 c0                	test   %eax,%eax
  800f02:	0f 48 c1             	cmovs  %ecx,%eax
  800f05:	c1 f8 05             	sar    $0x5,%eax
  800f08:	48 98                	cltq   
  800f0a:	48 c1 e0 02          	shl    $0x2,%rax
  800f0e:	48 01 d0             	add    %rdx,%rax
  800f11:	48 89 c7             	mov    %rax,%rdi
  800f14:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  800f1b:	00 00 00 
  800f1e:	ff d0                	callq  *%rax
  800f20:	48 b8 00 30 81 00 00 	movabs $0x813000,%rax
  800f27:	00 00 00 
  800f2a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  800f2d:	89 10                	mov    %edx,(%rax)
  800f2f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800f32:	eb 24                	jmp    800f58 <alloc_block+0x129>
  800f34:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f38:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800f3b:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  800f42:	00 00 00 
  800f45:	48 8b 00             	mov    (%rax),%rax
  800f48:	8b 40 04             	mov    0x4(%rax),%eax
  800f4b:	39 c2                	cmp    %eax,%edx
  800f4d:	0f 82 f7 fe ff ff    	jb     800e4a <alloc_block+0x1b>
  800f53:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
  800f58:	c9                   	leaveq 
  800f59:	c3                   	retq   

0000000000800f5a <check_bitmap>:
  800f5a:	55                   	push   %rbp
  800f5b:	48 89 e5             	mov    %rsp,%rbp
  800f5e:	48 83 ec 10          	sub    $0x10,%rsp
  800f62:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800f69:	eb 51                	jmp    800fbc <check_bitmap+0x62>
  800f6b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f6e:	83 c0 02             	add    $0x2,%eax
  800f71:	89 c7                	mov    %eax,%edi
  800f73:	48 b8 2c 0d 80 00 00 	movabs $0x800d2c,%rax
  800f7a:	00 00 00 
  800f7d:	ff d0                	callq  *%rax
  800f7f:	84 c0                	test   %al,%al
  800f81:	74 35                	je     800fb8 <check_bitmap+0x5e>
  800f83:	48 b9 c9 73 80 00 00 	movabs $0x8073c9,%rcx
  800f8a:	00 00 00 
  800f8d:	48 ba dd 73 80 00 00 	movabs $0x8073dd,%rdx
  800f94:	00 00 00 
  800f97:	be 62 00 00 00       	mov    $0x62,%esi
  800f9c:	48 bf 76 73 80 00 00 	movabs $0x807376,%rdi
  800fa3:	00 00 00 
  800fa6:	b8 00 00 00 00       	mov    $0x0,%eax
  800fab:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  800fb2:	00 00 00 
  800fb5:	41 ff d0             	callq  *%r8
  800fb8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800fbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fbf:	c1 e0 0f             	shl    $0xf,%eax
  800fc2:	89 c2                	mov    %eax,%edx
  800fc4:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  800fcb:	00 00 00 
  800fce:	48 8b 00             	mov    (%rax),%rax
  800fd1:	8b 40 04             	mov    0x4(%rax),%eax
  800fd4:	39 c2                	cmp    %eax,%edx
  800fd6:	72 93                	jb     800f6b <check_bitmap+0x11>
  800fd8:	bf 00 00 00 00       	mov    $0x0,%edi
  800fdd:	48 b8 2c 0d 80 00 00 	movabs $0x800d2c,%rax
  800fe4:	00 00 00 
  800fe7:	ff d0                	callq  *%rax
  800fe9:	84 c0                	test   %al,%al
  800feb:	74 35                	je     801022 <check_bitmap+0xc8>
  800fed:	48 b9 f2 73 80 00 00 	movabs $0x8073f2,%rcx
  800ff4:	00 00 00 
  800ff7:	48 ba dd 73 80 00 00 	movabs $0x8073dd,%rdx
  800ffe:	00 00 00 
  801001:	be 65 00 00 00       	mov    $0x65,%esi
  801006:	48 bf 76 73 80 00 00 	movabs $0x807376,%rdi
  80100d:	00 00 00 
  801010:	b8 00 00 00 00       	mov    $0x0,%eax
  801015:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  80101c:	00 00 00 
  80101f:	41 ff d0             	callq  *%r8
  801022:	bf 01 00 00 00       	mov    $0x1,%edi
  801027:	48 b8 2c 0d 80 00 00 	movabs $0x800d2c,%rax
  80102e:	00 00 00 
  801031:	ff d0                	callq  *%rax
  801033:	84 c0                	test   %al,%al
  801035:	74 35                	je     80106c <check_bitmap+0x112>
  801037:	48 b9 04 74 80 00 00 	movabs $0x807404,%rcx
  80103e:	00 00 00 
  801041:	48 ba dd 73 80 00 00 	movabs $0x8073dd,%rdx
  801048:	00 00 00 
  80104b:	be 66 00 00 00       	mov    $0x66,%esi
  801050:	48 bf 76 73 80 00 00 	movabs $0x807376,%rdi
  801057:	00 00 00 
  80105a:	b8 00 00 00 00       	mov    $0x0,%eax
  80105f:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  801066:	00 00 00 
  801069:	41 ff d0             	callq  *%r8
  80106c:	48 bf 16 74 80 00 00 	movabs $0x807416,%rdi
  801073:	00 00 00 
  801076:	b8 00 00 00 00       	mov    $0x0,%eax
  80107b:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  801082:	00 00 00 
  801085:	ff d2                	callq  *%rdx
  801087:	c9                   	leaveq 
  801088:	c3                   	retq   

0000000000801089 <fs_init>:
  801089:	55                   	push   %rbp
  80108a:	48 89 e5             	mov    %rsp,%rbp
  80108d:	48 b8 96 00 80 00 00 	movabs $0x800096,%rax
  801094:	00 00 00 
  801097:	ff d0                	callq  *%rax
  801099:	84 c0                	test   %al,%al
  80109b:	74 13                	je     8010b0 <fs_init+0x27>
  80109d:	bf 01 00 00 00       	mov    $0x1,%edi
  8010a2:	48 b8 47 01 80 00 00 	movabs $0x800147,%rax
  8010a9:	00 00 00 
  8010ac:	ff d0                	callq  *%rax
  8010ae:	eb 11                	jmp    8010c1 <fs_init+0x38>
  8010b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8010b5:	48 b8 47 01 80 00 00 	movabs $0x800147,%rax
  8010bc:	00 00 00 
  8010bf:	ff d0                	callq  *%rax
  8010c1:	48 b8 29 0c 80 00 00 	movabs $0x800c29,%rax
  8010c8:	00 00 00 
  8010cb:	ff d0                	callq  *%rax
  8010cd:	bf 01 00 00 00       	mov    $0x1,%edi
  8010d2:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  8010d9:	00 00 00 
  8010dc:	ff d0                	callq  *%rax
  8010de:	48 ba 18 30 81 00 00 	movabs $0x813018,%rdx
  8010e5:	00 00 00 
  8010e8:	48 89 02             	mov    %rax,(%rdx)
  8010eb:	48 b8 8a 0c 80 00 00 	movabs $0x800c8a,%rax
  8010f2:	00 00 00 
  8010f5:	ff d0                	callq  *%rax
  8010f7:	bf 02 00 00 00       	mov    $0x2,%edi
  8010fc:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  801103:	00 00 00 
  801106:	ff d0                	callq  *%rax
  801108:	48 ba 10 30 81 00 00 	movabs $0x813010,%rdx
  80110f:	00 00 00 
  801112:	48 89 02             	mov    %rax,(%rdx)
  801115:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  80111c:	00 00 00 
  80111f:	ff d0                	callq  *%rax
  801121:	5d                   	pop    %rbp
  801122:	c3                   	retq   

0000000000801123 <file_block_walk>:
  801123:	55                   	push   %rbp
  801124:	48 89 e5             	mov    %rsp,%rbp
  801127:	48 83 ec 30          	sub    $0x30,%rsp
  80112b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80112f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801132:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801136:	89 c8                	mov    %ecx,%eax
  801138:	88 45 e0             	mov    %al,-0x20(%rbp)
  80113b:	83 7d e4 09          	cmpl   $0x9,-0x1c(%rbp)
  80113f:	77 23                	ja     801164 <file_block_walk+0x41>
  801141:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801144:	48 83 c0 20          	add    $0x20,%rax
  801148:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  80114f:	00 
  801150:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801154:	48 01 d0             	add    %rdx,%rax
  801157:	48 83 c0 08          	add    $0x8,%rax
  80115b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80115f:	e9 bd 00 00 00       	jmpq   801221 <file_block_walk+0xfe>
  801164:	81 7d e4 09 04 00 00 	cmpl   $0x409,-0x1c(%rbp)
  80116b:	0f 87 a9 00 00 00    	ja     80121a <file_block_walk+0xf7>
  801171:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801175:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  80117b:	85 c0                	test   %eax,%eax
  80117d:	75 6c                	jne    8011eb <file_block_walk+0xc8>
  80117f:	0f b6 45 e0          	movzbl -0x20(%rbp),%eax
  801183:	83 f0 01             	xor    $0x1,%eax
  801186:	84 c0                	test   %al,%al
  801188:	74 0a                	je     801194 <file_block_walk+0x71>
  80118a:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  80118f:	e9 9d 00 00 00       	jmpq   801231 <file_block_walk+0x10e>
  801194:	48 b8 2f 0e 80 00 00 	movabs $0x800e2f,%rax
  80119b:	00 00 00 
  80119e:	ff d0                	callq  *%rax
  8011a0:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8011a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8011a7:	79 08                	jns    8011b1 <file_block_walk+0x8e>
  8011a9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011ac:	e9 80 00 00 00       	jmpq   801231 <file_block_walk+0x10e>
  8011b1:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8011b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b8:	89 90 b0 00 00 00    	mov    %edx,0xb0(%rax)
  8011be:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011c1:	48 98                	cltq   
  8011c3:	48 89 c7             	mov    %rax,%rdi
  8011c6:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  8011cd:	00 00 00 
  8011d0:	ff d0                	callq  *%rax
  8011d2:	ba 00 10 00 00       	mov    $0x1000,%edx
  8011d7:	be 00 00 00 00       	mov    $0x0,%esi
  8011dc:	48 89 c7             	mov    %rax,%rdi
  8011df:	48 b8 84 41 80 00 00 	movabs $0x804184,%rax
  8011e6:	00 00 00 
  8011e9:	ff d0                	callq  *%rax
  8011eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ef:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  8011f5:	89 c0                	mov    %eax,%eax
  8011f7:	48 89 c7             	mov    %rax,%rdi
  8011fa:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  801201:	00 00 00 
  801204:	ff d0                	callq  *%rax
  801206:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801209:	48 c1 e2 02          	shl    $0x2,%rdx
  80120d:	48 83 ea 28          	sub    $0x28,%rdx
  801211:	48 01 d0             	add    %rdx,%rax
  801214:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801218:	eb 07                	jmp    801221 <file_block_walk+0xfe>
  80121a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80121f:	eb 10                	jmp    801231 <file_block_walk+0x10e>
  801221:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801225:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801229:	48 89 10             	mov    %rdx,(%rax)
  80122c:	b8 00 00 00 00       	mov    $0x0,%eax
  801231:	c9                   	leaveq 
  801232:	c3                   	retq   

0000000000801233 <file_get_block>:
  801233:	55                   	push   %rbp
  801234:	48 89 e5             	mov    %rsp,%rbp
  801237:	48 83 ec 30          	sub    $0x30,%rsp
  80123b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80123f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801242:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801246:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80124a:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  80124d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801251:	b9 01 00 00 00       	mov    $0x1,%ecx
  801256:	48 89 c7             	mov    %rax,%rdi
  801259:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  801260:	00 00 00 
  801263:	ff d0                	callq  *%rax
  801265:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801268:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80126c:	79 05                	jns    801273 <file_get_block+0x40>
  80126e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801271:	eb 50                	jmp    8012c3 <file_get_block+0x90>
  801273:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801277:	8b 00                	mov    (%rax),%eax
  801279:	85 c0                	test   %eax,%eax
  80127b:	75 23                	jne    8012a0 <file_get_block+0x6d>
  80127d:	48 b8 2f 0e 80 00 00 	movabs $0x800e2f,%rax
  801284:	00 00 00 
  801287:	ff d0                	callq  *%rax
  801289:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80128c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801290:	79 05                	jns    801297 <file_get_block+0x64>
  801292:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801295:	eb 2c                	jmp    8012c3 <file_get_block+0x90>
  801297:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80129b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80129e:	89 10                	mov    %edx,(%rax)
  8012a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012a4:	8b 00                	mov    (%rax),%eax
  8012a6:	89 c0                	mov    %eax,%eax
  8012a8:	48 89 c7             	mov    %rax,%rdi
  8012ab:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  8012b2:	00 00 00 
  8012b5:	ff d0                	callq  *%rax
  8012b7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8012bb:	48 89 02             	mov    %rax,(%rdx)
  8012be:	b8 00 00 00 00       	mov    $0x0,%eax
  8012c3:	c9                   	leaveq 
  8012c4:	c3                   	retq   

00000000008012c5 <dir_lookup>:
  8012c5:	55                   	push   %rbp
  8012c6:	48 89 e5             	mov    %rsp,%rbp
  8012c9:	48 83 ec 40          	sub    $0x40,%rsp
  8012cd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8012d1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8012d5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8012d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012dd:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  8012e3:	25 ff 0f 00 00       	and    $0xfff,%eax
  8012e8:	85 c0                	test   %eax,%eax
  8012ea:	74 35                	je     801321 <dir_lookup+0x5c>
  8012ec:	48 b9 26 74 80 00 00 	movabs $0x807426,%rcx
  8012f3:	00 00 00 
  8012f6:	48 ba dd 73 80 00 00 	movabs $0x8073dd,%rdx
  8012fd:	00 00 00 
  801300:	be 32 01 00 00       	mov    $0x132,%esi
  801305:	48 bf 76 73 80 00 00 	movabs $0x807376,%rdi
  80130c:	00 00 00 
  80130f:	b8 00 00 00 00       	mov    $0x0,%eax
  801314:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  80131b:	00 00 00 
  80131e:	41 ff d0             	callq  *%r8
  801321:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801325:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  80132b:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801331:	85 c0                	test   %eax,%eax
  801333:	0f 48 c2             	cmovs  %edx,%eax
  801336:	c1 f8 0c             	sar    $0xc,%eax
  801339:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80133c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801343:	e9 93 00 00 00       	jmpq   8013db <dir_lookup+0x116>
  801348:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  80134c:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  80134f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801353:	89 ce                	mov    %ecx,%esi
  801355:	48 89 c7             	mov    %rax,%rdi
  801358:	48 b8 33 12 80 00 00 	movabs $0x801233,%rax
  80135f:	00 00 00 
  801362:	ff d0                	callq  *%rax
  801364:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801367:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80136b:	79 05                	jns    801372 <dir_lookup+0xad>
  80136d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801370:	eb 7a                	jmp    8013ec <dir_lookup+0x127>
  801372:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801376:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80137a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  801381:	eb 4e                	jmp    8013d1 <dir_lookup+0x10c>
  801383:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801386:	48 c1 e0 08          	shl    $0x8,%rax
  80138a:	48 89 c2             	mov    %rax,%rdx
  80138d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801391:	48 01 d0             	add    %rdx,%rax
  801394:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801398:	48 89 d6             	mov    %rdx,%rsi
  80139b:	48 89 c7             	mov    %rax,%rdi
  80139e:	48 b8 4d 40 80 00 00 	movabs $0x80404d,%rax
  8013a5:	00 00 00 
  8013a8:	ff d0                	callq  *%rax
  8013aa:	85 c0                	test   %eax,%eax
  8013ac:	75 1f                	jne    8013cd <dir_lookup+0x108>
  8013ae:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8013b1:	48 c1 e0 08          	shl    $0x8,%rax
  8013b5:	48 89 c2             	mov    %rax,%rdx
  8013b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013bc:	48 01 c2             	add    %rax,%rdx
  8013bf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8013c3:	48 89 10             	mov    %rdx,(%rax)
  8013c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8013cb:	eb 1f                	jmp    8013ec <dir_lookup+0x127>
  8013cd:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  8013d1:	83 7d f8 0f          	cmpl   $0xf,-0x8(%rbp)
  8013d5:	76 ac                	jbe    801383 <dir_lookup+0xbe>
  8013d7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8013db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013de:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8013e1:	0f 82 61 ff ff ff    	jb     801348 <dir_lookup+0x83>
  8013e7:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  8013ec:	c9                   	leaveq 
  8013ed:	c3                   	retq   

00000000008013ee <dir_alloc_file>:
  8013ee:	55                   	push   %rbp
  8013ef:	48 89 e5             	mov    %rsp,%rbp
  8013f2:	48 83 ec 30          	sub    $0x30,%rsp
  8013f6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8013fa:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8013fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801402:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801408:	25 ff 0f 00 00       	and    $0xfff,%eax
  80140d:	85 c0                	test   %eax,%eax
  80140f:	74 35                	je     801446 <dir_alloc_file+0x58>
  801411:	48 b9 26 74 80 00 00 	movabs $0x807426,%rcx
  801418:	00 00 00 
  80141b:	48 ba dd 73 80 00 00 	movabs $0x8073dd,%rdx
  801422:	00 00 00 
  801425:	be 4b 01 00 00       	mov    $0x14b,%esi
  80142a:	48 bf 76 73 80 00 00 	movabs $0x807376,%rdi
  801431:	00 00 00 
  801434:	b8 00 00 00 00       	mov    $0x0,%eax
  801439:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  801440:	00 00 00 
  801443:	41 ff d0             	callq  *%r8
  801446:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80144a:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801450:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801456:	85 c0                	test   %eax,%eax
  801458:	0f 48 c2             	cmovs  %edx,%eax
  80145b:	c1 f8 0c             	sar    $0xc,%eax
  80145e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  801461:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801468:	e9 83 00 00 00       	jmpq   8014f0 <dir_alloc_file+0x102>
  80146d:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  801471:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  801474:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801478:	89 ce                	mov    %ecx,%esi
  80147a:	48 89 c7             	mov    %rax,%rdi
  80147d:	48 b8 33 12 80 00 00 	movabs $0x801233,%rax
  801484:	00 00 00 
  801487:	ff d0                	callq  *%rax
  801489:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80148c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  801490:	79 08                	jns    80149a <dir_alloc_file+0xac>
  801492:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801495:	e9 be 00 00 00       	jmpq   801558 <dir_alloc_file+0x16a>
  80149a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80149e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8014a2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  8014a9:	eb 3b                	jmp    8014e6 <dir_alloc_file+0xf8>
  8014ab:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8014ae:	48 c1 e0 08          	shl    $0x8,%rax
  8014b2:	48 89 c2             	mov    %rax,%rdx
  8014b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014b9:	48 01 d0             	add    %rdx,%rax
  8014bc:	0f b6 00             	movzbl (%rax),%eax
  8014bf:	84 c0                	test   %al,%al
  8014c1:	75 1f                	jne    8014e2 <dir_alloc_file+0xf4>
  8014c3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8014c6:	48 c1 e0 08          	shl    $0x8,%rax
  8014ca:	48 89 c2             	mov    %rax,%rdx
  8014cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014d1:	48 01 c2             	add    %rax,%rdx
  8014d4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8014d8:	48 89 10             	mov    %rdx,(%rax)
  8014db:	b8 00 00 00 00       	mov    $0x0,%eax
  8014e0:	eb 76                	jmp    801558 <dir_alloc_file+0x16a>
  8014e2:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  8014e6:	83 7d f8 0f          	cmpl   $0xf,-0x8(%rbp)
  8014ea:	76 bf                	jbe    8014ab <dir_alloc_file+0xbd>
  8014ec:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8014f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8014f3:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8014f6:	0f 82 71 ff ff ff    	jb     80146d <dir_alloc_file+0x7f>
  8014fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801500:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801506:	8d 90 00 10 00 00    	lea    0x1000(%rax),%edx
  80150c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801510:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  801516:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  80151a:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  80151d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801521:	89 ce                	mov    %ecx,%esi
  801523:	48 89 c7             	mov    %rax,%rdi
  801526:	48 b8 33 12 80 00 00 	movabs $0x801233,%rax
  80152d:	00 00 00 
  801530:	ff d0                	callq  *%rax
  801532:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801535:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  801539:	79 05                	jns    801540 <dir_alloc_file+0x152>
  80153b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80153e:	eb 18                	jmp    801558 <dir_alloc_file+0x16a>
  801540:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801544:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801548:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80154c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801550:	48 89 10             	mov    %rdx,(%rax)
  801553:	b8 00 00 00 00       	mov    $0x0,%eax
  801558:	c9                   	leaveq 
  801559:	c3                   	retq   

000000000080155a <skip_slash>:
  80155a:	55                   	push   %rbp
  80155b:	48 89 e5             	mov    %rsp,%rbp
  80155e:	48 83 ec 08          	sub    $0x8,%rsp
  801562:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801566:	eb 05                	jmp    80156d <skip_slash+0x13>
  801568:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80156d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801571:	0f b6 00             	movzbl (%rax),%eax
  801574:	3c 2f                	cmp    $0x2f,%al
  801576:	74 f0                	je     801568 <skip_slash+0xe>
  801578:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80157c:	c9                   	leaveq 
  80157d:	c3                   	retq   

000000000080157e <walk_path>:
  80157e:	55                   	push   %rbp
  80157f:	48 89 e5             	mov    %rsp,%rbp
  801582:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
  801589:	48 89 bd 48 ff ff ff 	mov    %rdi,-0xb8(%rbp)
  801590:	48 89 b5 40 ff ff ff 	mov    %rsi,-0xc0(%rbp)
  801597:	48 89 95 38 ff ff ff 	mov    %rdx,-0xc8(%rbp)
  80159e:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
  8015a5:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  8015ac:	48 89 c7             	mov    %rax,%rdi
  8015af:	48 b8 5a 15 80 00 00 	movabs $0x80155a,%rax
  8015b6:	00 00 00 
  8015b9:	ff d0                	callq  *%rax
  8015bb:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8015c2:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  8015c9:	00 00 00 
  8015cc:	48 8b 00             	mov    (%rax),%rax
  8015cf:	48 83 c0 08          	add    $0x8,%rax
  8015d3:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
  8015da:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8015e1:	00 
  8015e2:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%rbp)
  8015e9:	48 83 bd 40 ff ff ff 	cmpq   $0x0,-0xc0(%rbp)
  8015f0:	00 
  8015f1:	74 0e                	je     801601 <walk_path+0x83>
  8015f3:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
  8015fa:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801601:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
  801608:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80160f:	e9 73 01 00 00       	jmpq   801787 <walk_path+0x209>
  801614:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80161b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80161f:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  801626:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80162a:	eb 08                	jmp    801634 <walk_path+0xb6>
  80162c:	48 83 85 48 ff ff ff 	addq   $0x1,-0xb8(%rbp)
  801633:	01 
  801634:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  80163b:	0f b6 00             	movzbl (%rax),%eax
  80163e:	3c 2f                	cmp    $0x2f,%al
  801640:	74 0e                	je     801650 <walk_path+0xd2>
  801642:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  801649:	0f b6 00             	movzbl (%rax),%eax
  80164c:	84 c0                	test   %al,%al
  80164e:	75 dc                	jne    80162c <walk_path+0xae>
  801650:	48 8b 95 48 ff ff ff 	mov    -0xb8(%rbp),%rdx
  801657:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80165b:	48 29 c2             	sub    %rax,%rdx
  80165e:	48 89 d0             	mov    %rdx,%rax
  801661:	48 83 f8 7f          	cmp    $0x7f,%rax
  801665:	7e 0a                	jle    801671 <walk_path+0xf3>
  801667:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80166c:	e9 56 01 00 00       	jmpq   8017c7 <walk_path+0x249>
  801671:	48 8b 95 48 ff ff ff 	mov    -0xb8(%rbp),%rdx
  801678:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80167c:	48 29 c2             	sub    %rax,%rdx
  80167f:	48 89 d0             	mov    %rdx,%rax
  801682:	48 89 c2             	mov    %rax,%rdx
  801685:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801689:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
  801690:	48 89 ce             	mov    %rcx,%rsi
  801693:	48 89 c7             	mov    %rax,%rdi
  801696:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  80169d:	00 00 00 
  8016a0:	ff d0                	callq  *%rax
  8016a2:	48 8b 95 48 ff ff ff 	mov    -0xb8(%rbp),%rdx
  8016a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016ad:	48 29 c2             	sub    %rax,%rdx
  8016b0:	48 89 d0             	mov    %rdx,%rax
  8016b3:	c6 84 05 60 ff ff ff 	movb   $0x0,-0xa0(%rbp,%rax,1)
  8016ba:	00 
  8016bb:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  8016c2:	48 89 c7             	mov    %rax,%rdi
  8016c5:	48 b8 5a 15 80 00 00 	movabs $0x80155a,%rax
  8016cc:	00 00 00 
  8016cf:	ff d0                	callq  *%rax
  8016d1:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8016d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016dc:	8b 80 84 00 00 00    	mov    0x84(%rax),%eax
  8016e2:	83 f8 01             	cmp    $0x1,%eax
  8016e5:	74 0a                	je     8016f1 <walk_path+0x173>
  8016e7:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  8016ec:	e9 d6 00 00 00       	jmpq   8017c7 <walk_path+0x249>
  8016f1:	48 8d 95 58 ff ff ff 	lea    -0xa8(%rbp),%rdx
  8016f8:	48 8d 8d 60 ff ff ff 	lea    -0xa0(%rbp),%rcx
  8016ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801703:	48 89 ce             	mov    %rcx,%rsi
  801706:	48 89 c7             	mov    %rax,%rdi
  801709:	48 b8 c5 12 80 00 00 	movabs $0x8012c5,%rax
  801710:	00 00 00 
  801713:	ff d0                	callq  *%rax
  801715:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801718:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80171c:	79 69                	jns    801787 <walk_path+0x209>
  80171e:	83 7d ec f4          	cmpl   $0xfffffff4,-0x14(%rbp)
  801722:	75 5e                	jne    801782 <walk_path+0x204>
  801724:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  80172b:	0f b6 00             	movzbl (%rax),%eax
  80172e:	84 c0                	test   %al,%al
  801730:	75 50                	jne    801782 <walk_path+0x204>
  801732:	48 83 bd 40 ff ff ff 	cmpq   $0x0,-0xc0(%rbp)
  801739:	00 
  80173a:	74 0e                	je     80174a <walk_path+0x1cc>
  80173c:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
  801743:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801747:	48 89 10             	mov    %rdx,(%rax)
  80174a:	48 83 bd 30 ff ff ff 	cmpq   $0x0,-0xd0(%rbp)
  801751:	00 
  801752:	74 20                	je     801774 <walk_path+0x1f6>
  801754:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  80175b:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
  801762:	48 89 d6             	mov    %rdx,%rsi
  801765:	48 89 c7             	mov    %rax,%rdi
  801768:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  80176f:	00 00 00 
  801772:	ff d0                	callq  *%rax
  801774:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
  80177b:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801782:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801785:	eb 40                	jmp    8017c7 <walk_path+0x249>
  801787:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  80178e:	0f b6 00             	movzbl (%rax),%eax
  801791:	84 c0                	test   %al,%al
  801793:	0f 85 7b fe ff ff    	jne    801614 <walk_path+0x96>
  801799:	48 83 bd 40 ff ff ff 	cmpq   $0x0,-0xc0(%rbp)
  8017a0:	00 
  8017a1:	74 0e                	je     8017b1 <walk_path+0x233>
  8017a3:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
  8017aa:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017ae:	48 89 10             	mov    %rdx,(%rax)
  8017b1:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
  8017b8:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
  8017bf:	48 89 10             	mov    %rdx,(%rax)
  8017c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8017c7:	c9                   	leaveq 
  8017c8:	c3                   	retq   

00000000008017c9 <file_create>:
  8017c9:	55                   	push   %rbp
  8017ca:	48 89 e5             	mov    %rsp,%rbp
  8017cd:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8017d4:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
  8017db:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
  8017e2:	48 8d 8d 70 ff ff ff 	lea    -0x90(%rbp),%rcx
  8017e9:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  8017f0:	48 8d b5 68 ff ff ff 	lea    -0x98(%rbp),%rsi
  8017f7:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8017fe:	48 89 c7             	mov    %rax,%rdi
  801801:	48 b8 7e 15 80 00 00 	movabs $0x80157e,%rax
  801808:	00 00 00 
  80180b:	ff d0                	callq  *%rax
  80180d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801810:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801814:	75 0a                	jne    801820 <file_create+0x57>
  801816:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
  80181b:	e9 91 00 00 00       	jmpq   8018b1 <file_create+0xe8>
  801820:	83 7d fc f4          	cmpl   $0xfffffff4,-0x4(%rbp)
  801824:	75 0c                	jne    801832 <file_create+0x69>
  801826:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  80182d:	48 85 c0             	test   %rax,%rax
  801830:	75 05                	jne    801837 <file_create+0x6e>
  801832:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801835:	eb 7a                	jmp    8018b1 <file_create+0xe8>
  801837:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  80183e:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  801845:	48 89 d6             	mov    %rdx,%rsi
  801848:	48 89 c7             	mov    %rax,%rdi
  80184b:	48 b8 ee 13 80 00 00 	movabs $0x8013ee,%rax
  801852:	00 00 00 
  801855:	ff d0                	callq  *%rax
  801857:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80185a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80185e:	79 05                	jns    801865 <file_create+0x9c>
  801860:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801863:	eb 4c                	jmp    8018b1 <file_create+0xe8>
  801865:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80186c:	48 8d 95 70 ff ff ff 	lea    -0x90(%rbp),%rdx
  801873:	48 89 d6             	mov    %rdx,%rsi
  801876:	48 89 c7             	mov    %rax,%rdi
  801879:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  801880:	00 00 00 
  801883:	ff d0                	callq  *%rax
  801885:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  80188c:	48 8b 85 50 ff ff ff 	mov    -0xb0(%rbp),%rax
  801893:	48 89 10             	mov    %rdx,(%rax)
  801896:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  80189d:	48 89 c7             	mov    %rax,%rdi
  8018a0:	48 b8 3f 1d 80 00 00 	movabs $0x801d3f,%rax
  8018a7:	00 00 00 
  8018aa:	ff d0                	callq  *%rax
  8018ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8018b1:	c9                   	leaveq 
  8018b2:	c3                   	retq   

00000000008018b3 <file_open>:
  8018b3:	55                   	push   %rbp
  8018b4:	48 89 e5             	mov    %rsp,%rbp
  8018b7:	48 83 ec 10          	sub    $0x10,%rsp
  8018bb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018bf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018c3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018cb:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018d0:	be 00 00 00 00       	mov    $0x0,%esi
  8018d5:	48 89 c7             	mov    %rax,%rdi
  8018d8:	48 b8 7e 15 80 00 00 	movabs $0x80157e,%rax
  8018df:	00 00 00 
  8018e2:	ff d0                	callq  *%rax
  8018e4:	c9                   	leaveq 
  8018e5:	c3                   	retq   

00000000008018e6 <file_read>:
  8018e6:	55                   	push   %rbp
  8018e7:	48 89 e5             	mov    %rsp,%rbp
  8018ea:	48 83 ec 60          	sub    $0x60,%rsp
  8018ee:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  8018f2:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  8018f6:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  8018fa:	89 4d a4             	mov    %ecx,-0x5c(%rbp)
  8018fd:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801901:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801907:	3b 45 a4             	cmp    -0x5c(%rbp),%eax
  80190a:	7f 0a                	jg     801916 <file_read+0x30>
  80190c:	b8 00 00 00 00       	mov    $0x0,%eax
  801911:	e9 24 01 00 00       	jmpq   801a3a <file_read+0x154>
  801916:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80191a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80191e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801922:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801928:	2b 45 a4             	sub    -0x5c(%rbp),%eax
  80192b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80192e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801931:	48 63 d0             	movslq %eax,%rdx
  801934:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801938:	48 39 c2             	cmp    %rax,%rdx
  80193b:	48 0f 46 c2          	cmovbe %rdx,%rax
  80193f:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  801943:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  801946:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801949:	e9 cd 00 00 00       	jmpq   801a1b <file_read+0x135>
  80194e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801951:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801957:	85 c0                	test   %eax,%eax
  801959:	0f 48 c2             	cmovs  %edx,%eax
  80195c:	c1 f8 0c             	sar    $0xc,%eax
  80195f:	89 c1                	mov    %eax,%ecx
  801961:	48 8d 55 c8          	lea    -0x38(%rbp),%rdx
  801965:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801969:	89 ce                	mov    %ecx,%esi
  80196b:	48 89 c7             	mov    %rax,%rdi
  80196e:	48 b8 33 12 80 00 00 	movabs $0x801233,%rax
  801975:	00 00 00 
  801978:	ff d0                	callq  *%rax
  80197a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80197d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  801981:	79 08                	jns    80198b <file_read+0xa5>
  801983:	8b 45 e8             	mov    -0x18(%rbp),%eax
  801986:	e9 af 00 00 00       	jmpq   801a3a <file_read+0x154>
  80198b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80198e:	99                   	cltd   
  80198f:	c1 ea 14             	shr    $0x14,%edx
  801992:	01 d0                	add    %edx,%eax
  801994:	25 ff 0f 00 00       	and    $0xfff,%eax
  801999:	29 d0                	sub    %edx,%eax
  80199b:	ba 00 10 00 00       	mov    $0x1000,%edx
  8019a0:	29 c2                	sub    %eax,%edx
  8019a2:	89 d0                	mov    %edx,%eax
  8019a4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8019a7:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  8019aa:	48 63 d0             	movslq %eax,%rdx
  8019ad:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8019b1:	48 01 c2             	add    %rax,%rdx
  8019b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019b7:	48 98                	cltq   
  8019b9:	48 29 c2             	sub    %rax,%rdx
  8019bc:	48 89 d0             	mov    %rdx,%rax
  8019bf:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8019c3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8019c6:	48 63 d0             	movslq %eax,%rdx
  8019c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019cd:	48 39 c2             	cmp    %rax,%rdx
  8019d0:	48 0f 46 c2          	cmovbe %rdx,%rax
  8019d4:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  8019d7:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8019da:	48 63 c8             	movslq %eax,%rcx
  8019dd:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
  8019e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019e4:	99                   	cltd   
  8019e5:	c1 ea 14             	shr    $0x14,%edx
  8019e8:	01 d0                	add    %edx,%eax
  8019ea:	25 ff 0f 00 00       	and    $0xfff,%eax
  8019ef:	29 d0                	sub    %edx,%eax
  8019f1:	48 98                	cltq   
  8019f3:	48 01 c6             	add    %rax,%rsi
  8019f6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  8019fa:	48 89 ca             	mov    %rcx,%rdx
  8019fd:	48 89 c7             	mov    %rax,%rdi
  801a00:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  801a07:	00 00 00 
  801a0a:	ff d0                	callq  *%rax
  801a0c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  801a0f:	01 45 fc             	add    %eax,-0x4(%rbp)
  801a12:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  801a15:	48 98                	cltq   
  801a17:	48 01 45 b0          	add    %rax,-0x50(%rbp)
  801a1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a1e:	48 98                	cltq   
  801a20:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  801a23:	48 63 ca             	movslq %edx,%rcx
  801a26:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  801a2a:	48 01 ca             	add    %rcx,%rdx
  801a2d:	48 39 d0             	cmp    %rdx,%rax
  801a30:	0f 82 18 ff ff ff    	jb     80194e <file_read+0x68>
  801a36:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801a3a:	c9                   	leaveq 
  801a3b:	c3                   	retq   

0000000000801a3c <file_write>:
  801a3c:	55                   	push   %rbp
  801a3d:	48 89 e5             	mov    %rsp,%rbp
  801a40:	48 83 ec 50          	sub    $0x50,%rsp
  801a44:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801a48:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  801a4c:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801a50:	89 4d b4             	mov    %ecx,-0x4c(%rbp)
  801a53:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  801a56:	48 63 d0             	movslq %eax,%rdx
  801a59:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801a5d:	48 01 c2             	add    %rax,%rdx
  801a60:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801a64:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801a6a:	48 98                	cltq   
  801a6c:	48 39 c2             	cmp    %rax,%rdx
  801a6f:	76 33                	jbe    801aa4 <file_write+0x68>
  801a71:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801a75:	89 c2                	mov    %eax,%edx
  801a77:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  801a7a:	01 d0                	add    %edx,%eax
  801a7c:	89 c2                	mov    %eax,%edx
  801a7e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801a82:	89 d6                	mov    %edx,%esi
  801a84:	48 89 c7             	mov    %rax,%rdi
  801a87:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  801a8e:	00 00 00 
  801a91:	ff d0                	callq  *%rax
  801a93:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801a96:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801a9a:	79 08                	jns    801aa4 <file_write+0x68>
  801a9c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a9f:	e9 f8 00 00 00       	jmpq   801b9c <file_write+0x160>
  801aa4:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  801aa7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801aaa:	e9 ce 00 00 00       	jmpq   801b7d <file_write+0x141>
  801aaf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ab2:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801ab8:	85 c0                	test   %eax,%eax
  801aba:	0f 48 c2             	cmovs  %edx,%eax
  801abd:	c1 f8 0c             	sar    $0xc,%eax
  801ac0:	89 c1                	mov    %eax,%ecx
  801ac2:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  801ac6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801aca:	89 ce                	mov    %ecx,%esi
  801acc:	48 89 c7             	mov    %rax,%rdi
  801acf:	48 b8 33 12 80 00 00 	movabs $0x801233,%rax
  801ad6:	00 00 00 
  801ad9:	ff d0                	callq  *%rax
  801adb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801ade:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801ae2:	79 08                	jns    801aec <file_write+0xb0>
  801ae4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ae7:	e9 b0 00 00 00       	jmpq   801b9c <file_write+0x160>
  801aec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aef:	99                   	cltd   
  801af0:	c1 ea 14             	shr    $0x14,%edx
  801af3:	01 d0                	add    %edx,%eax
  801af5:	25 ff 0f 00 00       	and    $0xfff,%eax
  801afa:	29 d0                	sub    %edx,%eax
  801afc:	ba 00 10 00 00       	mov    $0x1000,%edx
  801b01:	29 c2                	sub    %eax,%edx
  801b03:	89 d0                	mov    %edx,%eax
  801b05:	89 45 f4             	mov    %eax,-0xc(%rbp)
  801b08:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  801b0b:	48 63 d0             	movslq %eax,%rdx
  801b0e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801b12:	48 01 c2             	add    %rax,%rdx
  801b15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b18:	48 98                	cltq   
  801b1a:	48 29 c2             	sub    %rax,%rdx
  801b1d:	48 89 d0             	mov    %rdx,%rax
  801b20:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801b24:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801b27:	48 63 d0             	movslq %eax,%rdx
  801b2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b2e:	48 39 c2             	cmp    %rax,%rdx
  801b31:	48 0f 46 c2          	cmovbe %rdx,%rax
  801b35:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  801b38:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b3b:	48 63 c8             	movslq %eax,%rcx
  801b3e:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
  801b42:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b45:	99                   	cltd   
  801b46:	c1 ea 14             	shr    $0x14,%edx
  801b49:	01 d0                	add    %edx,%eax
  801b4b:	25 ff 0f 00 00       	and    $0xfff,%eax
  801b50:	29 d0                	sub    %edx,%eax
  801b52:	48 98                	cltq   
  801b54:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
  801b58:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801b5c:	48 89 ca             	mov    %rcx,%rdx
  801b5f:	48 89 c6             	mov    %rax,%rsi
  801b62:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  801b69:	00 00 00 
  801b6c:	ff d0                	callq  *%rax
  801b6e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b71:	01 45 fc             	add    %eax,-0x4(%rbp)
  801b74:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b77:	48 98                	cltq   
  801b79:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  801b7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b80:	48 98                	cltq   
  801b82:	8b 55 b4             	mov    -0x4c(%rbp),%edx
  801b85:	48 63 ca             	movslq %edx,%rcx
  801b88:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801b8c:	48 01 ca             	add    %rcx,%rdx
  801b8f:	48 39 d0             	cmp    %rdx,%rax
  801b92:	0f 82 17 ff ff ff    	jb     801aaf <file_write+0x73>
  801b98:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801b9c:	c9                   	leaveq 
  801b9d:	c3                   	retq   

0000000000801b9e <file_free_block>:
  801b9e:	55                   	push   %rbp
  801b9f:	48 89 e5             	mov    %rsp,%rbp
  801ba2:	48 83 ec 20          	sub    $0x20,%rsp
  801ba6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801baa:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801bad:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801bb1:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  801bb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bb8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bbd:	48 89 c7             	mov    %rax,%rdi
  801bc0:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  801bc7:	00 00 00 
  801bca:	ff d0                	callq  *%rax
  801bcc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801bcf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801bd3:	79 05                	jns    801bda <file_free_block+0x3c>
  801bd5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bd8:	eb 2d                	jmp    801c07 <file_free_block+0x69>
  801bda:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bde:	8b 00                	mov    (%rax),%eax
  801be0:	85 c0                	test   %eax,%eax
  801be2:	74 1e                	je     801c02 <file_free_block+0x64>
  801be4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801be8:	8b 00                	mov    (%rax),%eax
  801bea:	89 c7                	mov    %eax,%edi
  801bec:	48 b8 a8 0d 80 00 00 	movabs $0x800da8,%rax
  801bf3:	00 00 00 
  801bf6:	ff d0                	callq  *%rax
  801bf8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bfc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  801c02:	b8 00 00 00 00       	mov    $0x0,%eax
  801c07:	c9                   	leaveq 
  801c08:	c3                   	retq   

0000000000801c09 <file_truncate_blocks>:
  801c09:	55                   	push   %rbp
  801c0a:	48 89 e5             	mov    %rsp,%rbp
  801c0d:	48 83 ec 20          	sub    $0x20,%rsp
  801c11:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801c15:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801c18:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c1c:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801c22:	05 ff 0f 00 00       	add    $0xfff,%eax
  801c27:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801c2d:	85 c0                	test   %eax,%eax
  801c2f:	0f 48 c2             	cmovs  %edx,%eax
  801c32:	c1 f8 0c             	sar    $0xc,%eax
  801c35:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801c38:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801c3b:	05 ff 0f 00 00       	add    $0xfff,%eax
  801c40:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801c46:	85 c0                	test   %eax,%eax
  801c48:	0f 48 c2             	cmovs  %edx,%eax
  801c4b:	c1 f8 0c             	sar    $0xc,%eax
  801c4e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  801c51:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801c54:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801c57:	eb 45                	jmp    801c9e <file_truncate_blocks+0x95>
  801c59:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801c5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c60:	89 d6                	mov    %edx,%esi
  801c62:	48 89 c7             	mov    %rax,%rdi
  801c65:	48 b8 9e 1b 80 00 00 	movabs $0x801b9e,%rax
  801c6c:	00 00 00 
  801c6f:	ff d0                	callq  *%rax
  801c71:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801c74:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  801c78:	79 20                	jns    801c9a <file_truncate_blocks+0x91>
  801c7a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801c7d:	89 c6                	mov    %eax,%esi
  801c7f:	48 bf 43 74 80 00 00 	movabs $0x807443,%rdi
  801c86:	00 00 00 
  801c89:	b8 00 00 00 00       	mov    $0x0,%eax
  801c8e:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  801c95:	00 00 00 
  801c98:	ff d2                	callq  *%rdx
  801c9a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801c9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ca1:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  801ca4:	72 b3                	jb     801c59 <file_truncate_blocks+0x50>
  801ca6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  801caa:	77 34                	ja     801ce0 <file_truncate_blocks+0xd7>
  801cac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cb0:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801cb6:	85 c0                	test   %eax,%eax
  801cb8:	74 26                	je     801ce0 <file_truncate_blocks+0xd7>
  801cba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cbe:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801cc4:	89 c7                	mov    %eax,%edi
  801cc6:	48 b8 a8 0d 80 00 00 	movabs $0x800da8,%rax
  801ccd:	00 00 00 
  801cd0:	ff d0                	callq  *%rax
  801cd2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cd6:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%rax)
  801cdd:	00 00 00 
  801ce0:	c9                   	leaveq 
  801ce1:	c3                   	retq   

0000000000801ce2 <file_set_size>:
  801ce2:	55                   	push   %rbp
  801ce3:	48 89 e5             	mov    %rsp,%rbp
  801ce6:	48 83 ec 10          	sub    $0x10,%rsp
  801cea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cee:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801cf1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cf5:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801cfb:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  801cfe:	7e 18                	jle    801d18 <file_set_size+0x36>
  801d00:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d07:	89 d6                	mov    %edx,%esi
  801d09:	48 89 c7             	mov    %rax,%rdi
  801d0c:	48 b8 09 1c 80 00 00 	movabs $0x801c09,%rax
  801d13:	00 00 00 
  801d16:	ff d0                	callq  *%rax
  801d18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d1c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d1f:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  801d25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d29:	48 89 c7             	mov    %rax,%rdi
  801d2c:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  801d33:	00 00 00 
  801d36:	ff d0                	callq  *%rax
  801d38:	b8 00 00 00 00       	mov    $0x0,%eax
  801d3d:	c9                   	leaveq 
  801d3e:	c3                   	retq   

0000000000801d3f <file_flush>:
  801d3f:	55                   	push   %rbp
  801d40:	48 89 e5             	mov    %rsp,%rbp
  801d43:	48 83 ec 20          	sub    $0x20,%rsp
  801d47:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801d4b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801d52:	eb 62                	jmp    801db6 <file_flush+0x77>
  801d54:	8b 75 fc             	mov    -0x4(%rbp),%esi
  801d57:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801d5b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d5f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d64:	48 89 c7             	mov    %rax,%rdi
  801d67:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  801d6e:	00 00 00 
  801d71:	ff d0                	callq  *%rax
  801d73:	85 c0                	test   %eax,%eax
  801d75:	78 13                	js     801d8a <file_flush+0x4b>
  801d77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d7b:	48 85 c0             	test   %rax,%rax
  801d7e:	74 0a                	je     801d8a <file_flush+0x4b>
  801d80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d84:	8b 00                	mov    (%rax),%eax
  801d86:	85 c0                	test   %eax,%eax
  801d88:	75 02                	jne    801d8c <file_flush+0x4d>
  801d8a:	eb 26                	jmp    801db2 <file_flush+0x73>
  801d8c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d90:	8b 00                	mov    (%rax),%eax
  801d92:	89 c0                	mov    %eax,%eax
  801d94:	48 89 c7             	mov    %rax,%rdi
  801d97:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  801d9e:	00 00 00 
  801da1:	ff d0                	callq  *%rax
  801da3:	48 89 c7             	mov    %rax,%rdi
  801da6:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  801dad:	00 00 00 
  801db0:	ff d0                	callq  *%rax
  801db2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801db6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dba:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801dc0:	05 ff 0f 00 00       	add    $0xfff,%eax
  801dc5:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801dcb:	85 c0                	test   %eax,%eax
  801dcd:	0f 48 c2             	cmovs  %edx,%eax
  801dd0:	c1 f8 0c             	sar    $0xc,%eax
  801dd3:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  801dd6:	0f 8f 78 ff ff ff    	jg     801d54 <file_flush+0x15>
  801ddc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801de0:	48 89 c7             	mov    %rax,%rdi
  801de3:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  801dea:	00 00 00 
  801ded:	ff d0                	callq  *%rax
  801def:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801df3:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801df9:	85 c0                	test   %eax,%eax
  801dfb:	74 2a                	je     801e27 <file_flush+0xe8>
  801dfd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e01:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801e07:	89 c0                	mov    %eax,%eax
  801e09:	48 89 c7             	mov    %rax,%rdi
  801e0c:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  801e13:	00 00 00 
  801e16:	ff d0                	callq  *%rax
  801e18:	48 89 c7             	mov    %rax,%rdi
  801e1b:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  801e22:	00 00 00 
  801e25:	ff d0                	callq  *%rax
  801e27:	c9                   	leaveq 
  801e28:	c3                   	retq   

0000000000801e29 <file_remove>:
  801e29:	55                   	push   %rbp
  801e2a:	48 89 e5             	mov    %rsp,%rbp
  801e2d:	48 83 ec 20          	sub    $0x20,%rsp
  801e31:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e35:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801e39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e3d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e42:	be 00 00 00 00       	mov    $0x0,%esi
  801e47:	48 89 c7             	mov    %rax,%rdi
  801e4a:	48 b8 7e 15 80 00 00 	movabs $0x80157e,%rax
  801e51:	00 00 00 
  801e54:	ff d0                	callq  *%rax
  801e56:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e59:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e5d:	79 05                	jns    801e64 <file_remove+0x3b>
  801e5f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e62:	eb 45                	jmp    801ea9 <file_remove+0x80>
  801e64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e68:	be 00 00 00 00       	mov    $0x0,%esi
  801e6d:	48 89 c7             	mov    %rax,%rdi
  801e70:	48 b8 09 1c 80 00 00 	movabs $0x801c09,%rax
  801e77:	00 00 00 
  801e7a:	ff d0                	callq  *%rax
  801e7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e80:	c6 00 00             	movb   $0x0,(%rax)
  801e83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e87:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  801e8e:	00 00 00 
  801e91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e95:	48 89 c7             	mov    %rax,%rdi
  801e98:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  801e9f:	00 00 00 
  801ea2:	ff d0                	callq  *%rax
  801ea4:	b8 00 00 00 00       	mov    $0x0,%eax
  801ea9:	c9                   	leaveq 
  801eaa:	c3                   	retq   

0000000000801eab <fs_sync>:
  801eab:	55                   	push   %rbp
  801eac:	48 89 e5             	mov    %rsp,%rbp
  801eaf:	48 83 ec 10          	sub    $0x10,%rsp
  801eb3:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801eba:	eb 27                	jmp    801ee3 <fs_sync+0x38>
  801ebc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ebf:	48 98                	cltq   
  801ec1:	48 89 c7             	mov    %rax,%rdi
  801ec4:	48 b8 a3 04 80 00 00 	movabs $0x8004a3,%rax
  801ecb:	00 00 00 
  801ece:	ff d0                	callq  *%rax
  801ed0:	48 89 c7             	mov    %rax,%rdi
  801ed3:	48 b8 7e 08 80 00 00 	movabs $0x80087e,%rax
  801eda:	00 00 00 
  801edd:	ff d0                	callq  *%rax
  801edf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801ee3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801ee6:	48 b8 18 30 81 00 00 	movabs $0x813018,%rax
  801eed:	00 00 00 
  801ef0:	48 8b 00             	mov    (%rax),%rax
  801ef3:	8b 40 04             	mov    0x4(%rax),%eax
  801ef6:	39 c2                	cmp    %eax,%edx
  801ef8:	72 c2                	jb     801ebc <fs_sync+0x11>
  801efa:	c9                   	leaveq 
  801efb:	c3                   	retq   

0000000000801efc <serve_init>:
  801efc:	55                   	push   %rbp
  801efd:	48 89 e5             	mov    %rsp,%rbp
  801f00:	48 83 ec 10          	sub    $0x10,%rsp
  801f04:	b8 00 00 00 d0       	mov    $0xd0000000,%eax
  801f09:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f0d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f14:	eb 4b                	jmp    801f61 <serve_init+0x65>
  801f16:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f19:	48 ba 20 a0 80 00 00 	movabs $0x80a020,%rdx
  801f20:	00 00 00 
  801f23:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  801f26:	48 63 c9             	movslq %ecx,%rcx
  801f29:	48 c1 e1 05          	shl    $0x5,%rcx
  801f2d:	48 01 ca             	add    %rcx,%rdx
  801f30:	89 02                	mov    %eax,(%rdx)
  801f32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f36:	48 ba 20 a0 80 00 00 	movabs $0x80a020,%rdx
  801f3d:	00 00 00 
  801f40:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  801f43:	48 63 c9             	movslq %ecx,%rcx
  801f46:	48 c1 e1 05          	shl    $0x5,%rcx
  801f4a:	48 01 ca             	add    %rcx,%rdx
  801f4d:	48 83 c2 10          	add    $0x10,%rdx
  801f51:	48 89 42 08          	mov    %rax,0x8(%rdx)
  801f55:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
  801f5c:	00 
  801f5d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f61:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  801f68:	7e ac                	jle    801f16 <serve_init+0x1a>
  801f6a:	c9                   	leaveq 
  801f6b:	c3                   	retq   

0000000000801f6c <openfile_alloc>:
  801f6c:	55                   	push   %rbp
  801f6d:	48 89 e5             	mov    %rsp,%rbp
  801f70:	48 83 ec 20          	sub    $0x20,%rsp
  801f74:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f78:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f7f:	e9 24 01 00 00       	jmpq   8020a8 <openfile_alloc+0x13c>
  801f84:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  801f8b:	00 00 00 
  801f8e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801f91:	48 63 d2             	movslq %edx,%rdx
  801f94:	48 c1 e2 05          	shl    $0x5,%rdx
  801f98:	48 01 d0             	add    %rdx,%rax
  801f9b:	48 83 c0 10          	add    $0x10,%rax
  801f9f:	48 8b 40 08          	mov    0x8(%rax),%rax
  801fa3:	48 89 c7             	mov    %rax,%rdi
  801fa6:	48 b8 14 60 80 00 00 	movabs $0x806014,%rax
  801fad:	00 00 00 
  801fb0:	ff d0                	callq  *%rax
  801fb2:	85 c0                	test   %eax,%eax
  801fb4:	74 0a                	je     801fc0 <openfile_alloc+0x54>
  801fb6:	83 f8 01             	cmp    $0x1,%eax
  801fb9:	74 4e                	je     802009 <openfile_alloc+0x9d>
  801fbb:	e9 e4 00 00 00       	jmpq   8020a4 <openfile_alloc+0x138>
  801fc0:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  801fc7:	00 00 00 
  801fca:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801fcd:	48 63 d2             	movslq %edx,%rdx
  801fd0:	48 c1 e2 05          	shl    $0x5,%rdx
  801fd4:	48 01 d0             	add    %rdx,%rax
  801fd7:	48 83 c0 10          	add    $0x10,%rax
  801fdb:	48 8b 40 08          	mov    0x8(%rax),%rax
  801fdf:	ba 07 00 00 00       	mov    $0x7,%edx
  801fe4:	48 89 c6             	mov    %rax,%rsi
  801fe7:	bf 00 00 00 00       	mov    $0x0,%edi
  801fec:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  801ff3:	00 00 00 
  801ff6:	ff d0                	callq  *%rax
  801ff8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801ffb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801fff:	79 08                	jns    802009 <openfile_alloc+0x9d>
  802001:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802004:	e9 b1 00 00 00       	jmpq   8020ba <openfile_alloc+0x14e>
  802009:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  802010:	00 00 00 
  802013:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802016:	48 63 d2             	movslq %edx,%rdx
  802019:	48 c1 e2 05          	shl    $0x5,%rdx
  80201d:	48 01 d0             	add    %rdx,%rax
  802020:	8b 00                	mov    (%rax),%eax
  802022:	8d 90 00 04 00 00    	lea    0x400(%rax),%edx
  802028:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  80202f:	00 00 00 
  802032:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  802035:	48 63 c9             	movslq %ecx,%rcx
  802038:	48 c1 e1 05          	shl    $0x5,%rcx
  80203c:	48 01 c8             	add    %rcx,%rax
  80203f:	89 10                	mov    %edx,(%rax)
  802041:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802044:	48 98                	cltq   
  802046:	48 c1 e0 05          	shl    $0x5,%rax
  80204a:	48 89 c2             	mov    %rax,%rdx
  80204d:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  802054:	00 00 00 
  802057:	48 01 c2             	add    %rax,%rdx
  80205a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80205e:	48 89 10             	mov    %rdx,(%rax)
  802061:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  802068:	00 00 00 
  80206b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80206e:	48 63 d2             	movslq %edx,%rdx
  802071:	48 c1 e2 05          	shl    $0x5,%rdx
  802075:	48 01 d0             	add    %rdx,%rax
  802078:	48 83 c0 10          	add    $0x10,%rax
  80207c:	48 8b 40 08          	mov    0x8(%rax),%rax
  802080:	ba 00 10 00 00       	mov    $0x1000,%edx
  802085:	be 00 00 00 00       	mov    $0x0,%esi
  80208a:	48 89 c7             	mov    %rax,%rdi
  80208d:	48 b8 84 41 80 00 00 	movabs $0x804184,%rax
  802094:	00 00 00 
  802097:	ff d0                	callq  *%rax
  802099:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80209d:	48 8b 00             	mov    (%rax),%rax
  8020a0:	8b 00                	mov    (%rax),%eax
  8020a2:	eb 16                	jmp    8020ba <openfile_alloc+0x14e>
  8020a4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8020a8:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8020af:	0f 8e cf fe ff ff    	jle    801f84 <openfile_alloc+0x18>
  8020b5:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8020ba:	c9                   	leaveq 
  8020bb:	c3                   	retq   

00000000008020bc <openfile_lookup>:
  8020bc:	55                   	push   %rbp
  8020bd:	48 89 e5             	mov    %rsp,%rbp
  8020c0:	48 83 ec 20          	sub    $0x20,%rsp
  8020c4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020c7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8020ca:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8020ce:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8020d1:	25 ff 03 00 00       	and    $0x3ff,%eax
  8020d6:	89 c0                	mov    %eax,%eax
  8020d8:	48 c1 e0 05          	shl    $0x5,%rax
  8020dc:	48 89 c2             	mov    %rax,%rdx
  8020df:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  8020e6:	00 00 00 
  8020e9:	48 01 d0             	add    %rdx,%rax
  8020ec:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8020f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020f4:	48 8b 40 18          	mov    0x18(%rax),%rax
  8020f8:	48 89 c7             	mov    %rax,%rdi
  8020fb:	48 b8 14 60 80 00 00 	movabs $0x806014,%rax
  802102:	00 00 00 
  802105:	ff d0                	callq  *%rax
  802107:	83 f8 01             	cmp    $0x1,%eax
  80210a:	74 0b                	je     802117 <openfile_lookup+0x5b>
  80210c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802110:	8b 00                	mov    (%rax),%eax
  802112:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  802115:	74 07                	je     80211e <openfile_lookup+0x62>
  802117:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80211c:	eb 10                	jmp    80212e <openfile_lookup+0x72>
  80211e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802122:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802126:	48 89 10             	mov    %rdx,(%rax)
  802129:	b8 00 00 00 00       	mov    $0x0,%eax
  80212e:	c9                   	leaveq 
  80212f:	c3                   	retq   

0000000000802130 <serve_open>:
  802130:	55                   	push   %rbp
  802131:	48 89 e5             	mov    %rsp,%rbp
  802134:	48 81 ec 40 04 00 00 	sub    $0x440,%rsp
  80213b:	89 bd dc fb ff ff    	mov    %edi,-0x424(%rbp)
  802141:	48 89 b5 d0 fb ff ff 	mov    %rsi,-0x430(%rbp)
  802148:	48 89 95 c8 fb ff ff 	mov    %rdx,-0x438(%rbp)
  80214f:	48 89 8d c0 fb ff ff 	mov    %rcx,-0x440(%rbp)
  802156:	48 8b 8d d0 fb ff ff 	mov    -0x430(%rbp),%rcx
  80215d:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  802164:	ba 00 04 00 00       	mov    $0x400,%edx
  802169:	48 89 ce             	mov    %rcx,%rsi
  80216c:	48 89 c7             	mov    %rax,%rdi
  80216f:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  802176:	00 00 00 
  802179:	ff d0                	callq  *%rax
  80217b:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  80217f:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
  802186:	48 89 c7             	mov    %rax,%rdi
  802189:	48 b8 6c 1f 80 00 00 	movabs $0x801f6c,%rax
  802190:	00 00 00 
  802193:	ff d0                	callq  *%rax
  802195:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802198:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80219c:	79 08                	jns    8021a6 <serve_open+0x76>
  80219e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021a1:	e9 7c 01 00 00       	jmpq   802322 <serve_open+0x1f2>
  8021a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021a9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8021ac:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  8021b3:	8b 80 00 04 00 00    	mov    0x400(%rax),%eax
  8021b9:	25 00 01 00 00       	and    $0x100,%eax
  8021be:	85 c0                	test   %eax,%eax
  8021c0:	74 4f                	je     802211 <serve_open+0xe1>
  8021c2:	48 8d 95 e8 fb ff ff 	lea    -0x418(%rbp),%rdx
  8021c9:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  8021d0:	48 89 d6             	mov    %rdx,%rsi
  8021d3:	48 89 c7             	mov    %rax,%rdi
  8021d6:	48 b8 c9 17 80 00 00 	movabs $0x8017c9,%rax
  8021dd:	00 00 00 
  8021e0:	ff d0                	callq  *%rax
  8021e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021e9:	79 57                	jns    802242 <serve_open+0x112>
  8021eb:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  8021f2:	8b 80 00 04 00 00    	mov    0x400(%rax),%eax
  8021f8:	25 00 04 00 00       	and    $0x400,%eax
  8021fd:	85 c0                	test   %eax,%eax
  8021ff:	75 08                	jne    802209 <serve_open+0xd9>
  802201:	83 7d fc f2          	cmpl   $0xfffffff2,-0x4(%rbp)
  802205:	75 02                	jne    802209 <serve_open+0xd9>
  802207:	eb 08                	jmp    802211 <serve_open+0xe1>
  802209:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80220c:	e9 11 01 00 00       	jmpq   802322 <serve_open+0x1f2>
  802211:	48 8d 95 e8 fb ff ff 	lea    -0x418(%rbp),%rdx
  802218:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  80221f:	48 89 d6             	mov    %rdx,%rsi
  802222:	48 89 c7             	mov    %rax,%rdi
  802225:	48 b8 b3 18 80 00 00 	movabs $0x8018b3,%rax
  80222c:	00 00 00 
  80222f:	ff d0                	callq  *%rax
  802231:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802234:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802238:	79 08                	jns    802242 <serve_open+0x112>
  80223a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80223d:	e9 e0 00 00 00       	jmpq   802322 <serve_open+0x1f2>
  802242:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  802249:	8b 80 00 04 00 00    	mov    0x400(%rax),%eax
  80224f:	25 00 02 00 00       	and    $0x200,%eax
  802254:	85 c0                	test   %eax,%eax
  802256:	74 2c                	je     802284 <serve_open+0x154>
  802258:	48 8b 85 e8 fb ff ff 	mov    -0x418(%rbp),%rax
  80225f:	be 00 00 00 00       	mov    $0x0,%esi
  802264:	48 89 c7             	mov    %rax,%rdi
  802267:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  80226e:	00 00 00 
  802271:	ff d0                	callq  *%rax
  802273:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802276:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80227a:	79 08                	jns    802284 <serve_open+0x154>
  80227c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80227f:	e9 9e 00 00 00       	jmpq   802322 <serve_open+0x1f2>
  802284:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  80228b:	48 8b 95 e8 fb ff ff 	mov    -0x418(%rbp),%rdx
  802292:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802296:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  80229d:	48 8b 40 18          	mov    0x18(%rax),%rax
  8022a1:	48 8b 95 e0 fb ff ff 	mov    -0x420(%rbp),%rdx
  8022a8:	8b 12                	mov    (%rdx),%edx
  8022aa:	89 50 0c             	mov    %edx,0xc(%rax)
  8022ad:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  8022b4:	48 8b 40 18          	mov    0x18(%rax),%rax
  8022b8:	48 8b 95 d0 fb ff ff 	mov    -0x430(%rbp),%rdx
  8022bf:	8b 92 00 04 00 00    	mov    0x400(%rdx),%edx
  8022c5:	83 e2 03             	and    $0x3,%edx
  8022c8:	89 50 08             	mov    %edx,0x8(%rax)
  8022cb:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  8022d2:	48 8b 40 18          	mov    0x18(%rax),%rax
  8022d6:	48 ba e0 20 81 00 00 	movabs $0x8120e0,%rdx
  8022dd:	00 00 00 
  8022e0:	8b 12                	mov    (%rdx),%edx
  8022e2:	89 10                	mov    %edx,(%rax)
  8022e4:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  8022eb:	48 8b 95 d0 fb ff ff 	mov    -0x430(%rbp),%rdx
  8022f2:	8b 92 00 04 00 00    	mov    0x400(%rdx),%edx
  8022f8:	89 50 10             	mov    %edx,0x10(%rax)
  8022fb:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  802302:	48 8b 50 18          	mov    0x18(%rax),%rdx
  802306:	48 8b 85 c8 fb ff ff 	mov    -0x438(%rbp),%rax
  80230d:	48 89 10             	mov    %rdx,(%rax)
  802310:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
  802317:	c7 00 07 04 00 00    	movl   $0x407,(%rax)
  80231d:	b8 00 00 00 00       	mov    $0x0,%eax
  802322:	c9                   	leaveq 
  802323:	c3                   	retq   

0000000000802324 <serve_set_size>:
  802324:	55                   	push   %rbp
  802325:	48 89 e5             	mov    %rsp,%rbp
  802328:	48 83 ec 20          	sub    $0x20,%rsp
  80232c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80232f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802333:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802337:	8b 00                	mov    (%rax),%eax
  802339:	89 c1                	mov    %eax,%ecx
  80233b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80233f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802342:	89 ce                	mov    %ecx,%esi
  802344:	89 c7                	mov    %eax,%edi
  802346:	48 b8 bc 20 80 00 00 	movabs $0x8020bc,%rax
  80234d:	00 00 00 
  802350:	ff d0                	callq  *%rax
  802352:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802355:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802359:	79 05                	jns    802360 <serve_set_size+0x3c>
  80235b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80235e:	eb 20                	jmp    802380 <serve_set_size+0x5c>
  802360:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802364:	8b 50 04             	mov    0x4(%rax),%edx
  802367:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80236b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80236f:	89 d6                	mov    %edx,%esi
  802371:	48 89 c7             	mov    %rax,%rdi
  802374:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  80237b:	00 00 00 
  80237e:	ff d0                	callq  *%rax
  802380:	c9                   	leaveq 
  802381:	c3                   	retq   

0000000000802382 <serve_read>:
  802382:	55                   	push   %rbp
  802383:	48 89 e5             	mov    %rsp,%rbp
  802386:	48 83 ec 40          	sub    $0x40,%rsp
  80238a:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80238d:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  802391:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  802395:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802399:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80239d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8023a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023a5:	8b 00                	mov    (%rax),%eax
  8023a7:	89 c1                	mov    %eax,%ecx
  8023a9:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
  8023ad:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8023b0:	89 ce                	mov    %ecx,%esi
  8023b2:	89 c7                	mov    %eax,%edi
  8023b4:	48 b8 bc 20 80 00 00 	movabs $0x8020bc,%rax
  8023bb:	00 00 00 
  8023be:	ff d0                	callq  *%rax
  8023c0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8023c3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8023c7:	79 05                	jns    8023ce <serve_read+0x4c>
  8023c9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023cc:	eb 76                	jmp    802444 <serve_read+0xc2>
  8023ce:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8023d2:	48 8b 40 18          	mov    0x18(%rax),%rax
  8023d6:	8b 48 04             	mov    0x4(%rax),%ecx
  8023d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023dd:	48 8b 40 08          	mov    0x8(%rax),%rax
  8023e1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8023e5:	48 c7 45 d8 00 10 00 	movq   $0x1000,-0x28(%rbp)
  8023ec:	00 
  8023ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023f1:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
  8023f5:	48 0f 46 45 e0       	cmovbe -0x20(%rbp),%rax
  8023fa:	48 89 c2             	mov    %rax,%rdx
  8023fd:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  802401:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802405:	48 8b 40 08          	mov    0x8(%rax),%rax
  802409:	48 89 c7             	mov    %rax,%rdi
  80240c:	48 b8 e6 18 80 00 00 	movabs $0x8018e6,%rax
  802413:	00 00 00 
  802416:	ff d0                	callq  *%rax
  802418:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80241b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80241f:	79 05                	jns    802426 <serve_read+0xa4>
  802421:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802424:	eb 1e                	jmp    802444 <serve_read+0xc2>
  802426:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80242a:	48 8b 40 18          	mov    0x18(%rax),%rax
  80242e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  802432:	48 8b 52 18          	mov    0x18(%rdx),%rdx
  802436:	8b 4a 04             	mov    0x4(%rdx),%ecx
  802439:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80243c:	01 ca                	add    %ecx,%edx
  80243e:	89 50 04             	mov    %edx,0x4(%rax)
  802441:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802444:	c9                   	leaveq 
  802445:	c3                   	retq   

0000000000802446 <serve_write>:
  802446:	55                   	push   %rbp
  802447:	48 89 e5             	mov    %rsp,%rbp
  80244a:	48 83 ec 20          	sub    $0x20,%rsp
  80244e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802451:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802455:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802459:	8b 00                	mov    (%rax),%eax
  80245b:	89 c1                	mov    %eax,%ecx
  80245d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802461:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802464:	89 ce                	mov    %ecx,%esi
  802466:	89 c7                	mov    %eax,%edi
  802468:	48 b8 bc 20 80 00 00 	movabs $0x8020bc,%rax
  80246f:	00 00 00 
  802472:	ff d0                	callq  *%rax
  802474:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802477:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80247b:	79 05                	jns    802482 <serve_write+0x3c>
  80247d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802480:	eb 75                	jmp    8024f7 <serve_write+0xb1>
  802482:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802486:	48 8b 40 08          	mov    0x8(%rax),%rax
  80248a:	48 3d f4 0f 00 00    	cmp    $0xff4,%rax
  802490:	76 07                	jbe    802499 <serve_write+0x53>
  802492:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802497:	eb 5e                	jmp    8024f7 <serve_write+0xb1>
  802499:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80249d:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024a1:	8b 48 04             	mov    0x4(%rax),%ecx
  8024a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024a8:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8024ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024b0:	48 8d 70 10          	lea    0x10(%rax),%rsi
  8024b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024b8:	48 8b 40 08          	mov    0x8(%rax),%rax
  8024bc:	48 89 c7             	mov    %rax,%rdi
  8024bf:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  8024c6:	00 00 00 
  8024c9:	ff d0                	callq  *%rax
  8024cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024d2:	79 05                	jns    8024d9 <serve_write+0x93>
  8024d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024d7:	eb 1e                	jmp    8024f7 <serve_write+0xb1>
  8024d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024dd:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024e1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024e5:	48 8b 52 18          	mov    0x18(%rdx),%rdx
  8024e9:	8b 4a 04             	mov    0x4(%rdx),%ecx
  8024ec:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024ef:	01 ca                	add    %ecx,%edx
  8024f1:	89 50 04             	mov    %edx,0x4(%rax)
  8024f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024f7:	c9                   	leaveq 
  8024f8:	c3                   	retq   

00000000008024f9 <serve_stat>:
  8024f9:	55                   	push   %rbp
  8024fa:	48 89 e5             	mov    %rsp,%rbp
  8024fd:	48 83 ec 30          	sub    $0x30,%rsp
  802501:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802504:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802508:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80250c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802510:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802514:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802518:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80251c:	8b 00                	mov    (%rax),%eax
  80251e:	89 c1                	mov    %eax,%ecx
  802520:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  802524:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802527:	89 ce                	mov    %ecx,%esi
  802529:	89 c7                	mov    %eax,%edi
  80252b:	48 b8 bc 20 80 00 00 	movabs $0x8020bc,%rax
  802532:	00 00 00 
  802535:	ff d0                	callq  *%rax
  802537:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80253a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80253e:	79 05                	jns    802545 <serve_stat+0x4c>
  802540:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802543:	eb 5f                	jmp    8025a4 <serve_stat+0xab>
  802545:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802549:	48 8b 40 08          	mov    0x8(%rax),%rax
  80254d:	48 89 c2             	mov    %rax,%rdx
  802550:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802554:	48 89 d6             	mov    %rdx,%rsi
  802557:	48 89 c7             	mov    %rax,%rdi
  80255a:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  802561:	00 00 00 
  802564:	ff d0                	callq  *%rax
  802566:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80256a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80256e:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802574:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802578:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80257e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802582:	48 8b 40 08          	mov    0x8(%rax),%rax
  802586:	8b 80 84 00 00 00    	mov    0x84(%rax),%eax
  80258c:	83 f8 01             	cmp    $0x1,%eax
  80258f:	0f 94 c0             	sete   %al
  802592:	0f b6 d0             	movzbl %al,%edx
  802595:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802599:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  80259f:	b8 00 00 00 00       	mov    $0x0,%eax
  8025a4:	c9                   	leaveq 
  8025a5:	c3                   	retq   

00000000008025a6 <serve_flush>:
  8025a6:	55                   	push   %rbp
  8025a7:	48 89 e5             	mov    %rsp,%rbp
  8025aa:	48 83 ec 20          	sub    $0x20,%rsp
  8025ae:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025b1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8025b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8025b9:	8b 00                	mov    (%rax),%eax
  8025bb:	89 c1                	mov    %eax,%ecx
  8025bd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025c4:	89 ce                	mov    %ecx,%esi
  8025c6:	89 c7                	mov    %eax,%edi
  8025c8:	48 b8 bc 20 80 00 00 	movabs $0x8020bc,%rax
  8025cf:	00 00 00 
  8025d2:	ff d0                	callq  *%rax
  8025d4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025d7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025db:	79 05                	jns    8025e2 <serve_flush+0x3c>
  8025dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025e0:	eb 1c                	jmp    8025fe <serve_flush+0x58>
  8025e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025e6:	48 8b 40 08          	mov    0x8(%rax),%rax
  8025ea:	48 89 c7             	mov    %rax,%rdi
  8025ed:	48 b8 3f 1d 80 00 00 	movabs $0x801d3f,%rax
  8025f4:	00 00 00 
  8025f7:	ff d0                	callq  *%rax
  8025f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8025fe:	c9                   	leaveq 
  8025ff:	c3                   	retq   

0000000000802600 <serve_remove>:
  802600:	55                   	push   %rbp
  802601:	48 89 e5             	mov    %rsp,%rbp
  802604:	48 81 ec 10 04 00 00 	sub    $0x410,%rsp
  80260b:	89 bd fc fb ff ff    	mov    %edi,-0x404(%rbp)
  802611:	48 89 b5 f0 fb ff ff 	mov    %rsi,-0x410(%rbp)
  802618:	48 8b 8d f0 fb ff ff 	mov    -0x410(%rbp),%rcx
  80261f:	48 8d 85 00 fc ff ff 	lea    -0x400(%rbp),%rax
  802626:	ba 00 04 00 00       	mov    $0x400,%edx
  80262b:	48 89 ce             	mov    %rcx,%rsi
  80262e:	48 89 c7             	mov    %rax,%rdi
  802631:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  802638:	00 00 00 
  80263b:	ff d0                	callq  *%rax
  80263d:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
  802641:	48 8d 85 00 fc ff ff 	lea    -0x400(%rbp),%rax
  802648:	48 89 c7             	mov    %rax,%rdi
  80264b:	48 b8 29 1e 80 00 00 	movabs $0x801e29,%rax
  802652:	00 00 00 
  802655:	ff d0                	callq  *%rax
  802657:	c9                   	leaveq 
  802658:	c3                   	retq   

0000000000802659 <serve_sync>:
  802659:	55                   	push   %rbp
  80265a:	48 89 e5             	mov    %rsp,%rbp
  80265d:	48 83 ec 10          	sub    $0x10,%rsp
  802661:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802664:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802668:	48 b8 ab 1e 80 00 00 	movabs $0x801eab,%rax
  80266f:	00 00 00 
  802672:	ff d0                	callq  *%rax
  802674:	b8 00 00 00 00       	mov    $0x0,%eax
  802679:	c9                   	leaveq 
  80267a:	c3                   	retq   

000000000080267b <serve>:
  80267b:	55                   	push   %rbp
  80267c:	48 89 e5             	mov    %rsp,%rbp
  80267f:	48 83 ec 20          	sub    $0x20,%rsp
  802683:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  80268a:	48 b8 20 20 81 00 00 	movabs $0x812020,%rax
  802691:	00 00 00 
  802694:	48 8b 08             	mov    (%rax),%rcx
  802697:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80269b:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
  80269f:	48 89 ce             	mov    %rcx,%rsi
  8026a2:	48 89 c7             	mov    %rax,%rdi
  8026a5:	48 b8 20 4e 80 00 00 	movabs $0x804e20,%rax
  8026ac:	00 00 00 
  8026af:	ff d0                	callq  *%rax
  8026b1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8026b4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8026b7:	83 e0 01             	and    $0x1,%eax
  8026ba:	85 c0                	test   %eax,%eax
  8026bc:	75 23                	jne    8026e1 <serve+0x66>
  8026be:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8026c1:	89 c6                	mov    %eax,%esi
  8026c3:	48 bf 60 74 80 00 00 	movabs $0x807460,%rdi
  8026ca:	00 00 00 
  8026cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8026d2:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  8026d9:	00 00 00 
  8026dc:	ff d2                	callq  *%rdx
  8026de:	90                   	nop
  8026df:	eb a2                	jmp    802683 <serve+0x8>
  8026e1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  8026e8:	00 
  8026e9:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
  8026ed:	75 2b                	jne    80271a <serve+0x9f>
  8026ef:	48 b8 20 20 81 00 00 	movabs $0x812020,%rax
  8026f6:	00 00 00 
  8026f9:	48 8b 30             	mov    (%rax),%rsi
  8026fc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8026ff:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
  802703:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802707:	89 c7                	mov    %eax,%edi
  802709:	48 b8 30 21 80 00 00 	movabs $0x802130,%rax
  802710:	00 00 00 
  802713:	ff d0                	callq  *%rax
  802715:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802718:	eb 73                	jmp    80278d <serve+0x112>
  80271a:	83 7d f8 08          	cmpl   $0x8,-0x8(%rbp)
  80271e:	77 43                	ja     802763 <serve+0xe8>
  802720:	48 b8 40 20 81 00 00 	movabs $0x812040,%rax
  802727:	00 00 00 
  80272a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80272d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802731:	48 85 c0             	test   %rax,%rax
  802734:	74 2d                	je     802763 <serve+0xe8>
  802736:	48 b8 40 20 81 00 00 	movabs $0x812040,%rax
  80273d:	00 00 00 
  802740:	8b 55 f8             	mov    -0x8(%rbp),%edx
  802743:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802747:	48 ba 20 20 81 00 00 	movabs $0x812020,%rdx
  80274e:	00 00 00 
  802751:	48 8b 0a             	mov    (%rdx),%rcx
  802754:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802757:	48 89 ce             	mov    %rcx,%rsi
  80275a:	89 d7                	mov    %edx,%edi
  80275c:	ff d0                	callq  *%rax
  80275e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802761:	eb 2a                	jmp    80278d <serve+0x112>
  802763:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802766:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802769:	89 c6                	mov    %eax,%esi
  80276b:	48 bf 90 74 80 00 00 	movabs $0x807490,%rdi
  802772:	00 00 00 
  802775:	b8 00 00 00 00       	mov    $0x0,%eax
  80277a:	48 b9 36 33 80 00 00 	movabs $0x803336,%rcx
  802781:	00 00 00 
  802784:	ff d1                	callq  *%rcx
  802786:	c7 45 fc fd ff ff ff 	movl   $0xfffffffd,-0x4(%rbp)
  80278d:	8b 4d f0             	mov    -0x10(%rbp),%ecx
  802790:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802794:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802797:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80279a:	89 c7                	mov    %eax,%edi
  80279c:	48 b8 e1 4e 80 00 00 	movabs $0x804ee1,%rax
  8027a3:	00 00 00 
  8027a6:	ff d0                	callq  *%rax
  8027a8:	48 b8 20 20 81 00 00 	movabs $0x812020,%rax
  8027af:	00 00 00 
  8027b2:	48 8b 00             	mov    (%rax),%rax
  8027b5:	48 89 c6             	mov    %rax,%rsi
  8027b8:	bf 00 00 00 00       	mov    $0x0,%edi
  8027bd:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  8027c4:	00 00 00 
  8027c7:	ff d0                	callq  *%rax
  8027c9:	e9 b5 fe ff ff       	jmpq   802683 <serve+0x8>

00000000008027ce <umain>:
  8027ce:	55                   	push   %rbp
  8027cf:	48 89 e5             	mov    %rsp,%rbp
  8027d2:	48 83 ec 20          	sub    $0x20,%rsp
  8027d6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027d9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027dd:	48 b8 90 20 81 00 00 	movabs $0x812090,%rax
  8027e4:	00 00 00 
  8027e7:	48 b9 b3 74 80 00 00 	movabs $0x8074b3,%rcx
  8027ee:	00 00 00 
  8027f1:	48 89 08             	mov    %rcx,(%rax)
  8027f4:	48 bf b6 74 80 00 00 	movabs $0x8074b6,%rdi
  8027fb:	00 00 00 
  8027fe:	b8 00 00 00 00       	mov    $0x0,%eax
  802803:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  80280a:	00 00 00 
  80280d:	ff d2                	callq  *%rdx
  80280f:	c7 45 fc 00 8a 00 00 	movl   $0x8a00,-0x4(%rbp)
  802816:	66 c7 45 fa 00 8a    	movw   $0x8a00,-0x6(%rbp)
}

static __inline void
outw(int port, uint16_t data)
{
	__asm __volatile("outw %0,%w1" : : "a" (data), "d" (port));
  80281c:	0f b7 45 fa          	movzwl -0x6(%rbp),%eax
  802820:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802823:	66 ef                	out    %ax,(%dx)
  802825:	48 bf c5 74 80 00 00 	movabs $0x8074c5,%rdi
  80282c:	00 00 00 
  80282f:	b8 00 00 00 00       	mov    $0x0,%eax
  802834:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  80283b:	00 00 00 
  80283e:	ff d2                	callq  *%rdx
  802840:	48 b8 fc 1e 80 00 00 	movabs $0x801efc,%rax
  802847:	00 00 00 
  80284a:	ff d0                	callq  *%rax
  80284c:	48 b8 89 10 80 00 00 	movabs $0x801089,%rax
  802853:	00 00 00 
  802856:	ff d0                	callq  *%rax
  802858:	48 b8 7b 26 80 00 00 	movabs $0x80267b,%rax
  80285f:	00 00 00 
  802862:	ff d0                	callq  *%rax
  802864:	c9                   	leaveq 
  802865:	c3                   	retq   

0000000000802866 <fs_test>:
  802866:	55                   	push   %rbp
  802867:	48 89 e5             	mov    %rsp,%rbp
  80286a:	48 83 ec 20          	sub    $0x20,%rsp
  80286e:	ba 07 00 00 00       	mov    $0x7,%edx
  802873:	be 00 10 00 00       	mov    $0x1000,%esi
  802878:	bf 00 00 00 00       	mov    $0x0,%edi
  80287d:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  802884:	00 00 00 
  802887:	ff d0                	callq  *%rax
  802889:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80288c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802890:	79 30                	jns    8028c2 <fs_test+0x5c>
  802892:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802895:	89 c1                	mov    %eax,%ecx
  802897:	48 ba fe 74 80 00 00 	movabs $0x8074fe,%rdx
  80289e:	00 00 00 
  8028a1:	be 14 00 00 00       	mov    $0x14,%esi
  8028a6:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  8028ad:	00 00 00 
  8028b0:	b8 00 00 00 00       	mov    $0x0,%eax
  8028b5:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  8028bc:	00 00 00 
  8028bf:	41 ff d0             	callq  *%r8
  8028c2:	48 c7 45 f0 00 10 00 	movq   $0x1000,-0x10(%rbp)
  8028c9:	00 
  8028ca:	48 b8 10 30 81 00 00 	movabs $0x813010,%rax
  8028d1:	00 00 00 
  8028d4:	48 8b 08             	mov    (%rax),%rcx
  8028d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028db:	ba 00 10 00 00       	mov    $0x1000,%edx
  8028e0:	48 89 ce             	mov    %rcx,%rsi
  8028e3:	48 89 c7             	mov    %rax,%rdi
  8028e6:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  8028ed:	00 00 00 
  8028f0:	ff d0                	callq  *%rax
  8028f2:	48 b8 2f 0e 80 00 00 	movabs $0x800e2f,%rax
  8028f9:	00 00 00 
  8028fc:	ff d0                	callq  *%rax
  8028fe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802901:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802905:	79 30                	jns    802937 <fs_test+0xd1>
  802907:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80290a:	89 c1                	mov    %eax,%ecx
  80290c:	48 ba 1e 75 80 00 00 	movabs $0x80751e,%rdx
  802913:	00 00 00 
  802916:	be 19 00 00 00       	mov    $0x19,%esi
  80291b:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802922:	00 00 00 
  802925:	b8 00 00 00 00       	mov    $0x0,%eax
  80292a:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802931:	00 00 00 
  802934:	41 ff d0             	callq  *%r8
  802937:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80293a:	8d 50 1f             	lea    0x1f(%rax),%edx
  80293d:	85 c0                	test   %eax,%eax
  80293f:	0f 48 c2             	cmovs  %edx,%eax
  802942:	c1 f8 05             	sar    $0x5,%eax
  802945:	48 98                	cltq   
  802947:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  80294e:	00 
  80294f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802953:	48 01 d0             	add    %rdx,%rax
  802956:	8b 30                	mov    (%rax),%esi
  802958:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80295b:	99                   	cltd   
  80295c:	c1 ea 1b             	shr    $0x1b,%edx
  80295f:	01 d0                	add    %edx,%eax
  802961:	83 e0 1f             	and    $0x1f,%eax
  802964:	29 d0                	sub    %edx,%eax
  802966:	ba 01 00 00 00       	mov    $0x1,%edx
  80296b:	89 c1                	mov    %eax,%ecx
  80296d:	d3 e2                	shl    %cl,%edx
  80296f:	89 d0                	mov    %edx,%eax
  802971:	21 f0                	and    %esi,%eax
  802973:	85 c0                	test   %eax,%eax
  802975:	75 35                	jne    8029ac <fs_test+0x146>
  802977:	48 b9 2e 75 80 00 00 	movabs $0x80752e,%rcx
  80297e:	00 00 00 
  802981:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802988:	00 00 00 
  80298b:	be 1b 00 00 00       	mov    $0x1b,%esi
  802990:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802997:	00 00 00 
  80299a:	b8 00 00 00 00       	mov    $0x0,%eax
  80299f:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  8029a6:	00 00 00 
  8029a9:	41 ff d0             	callq  *%r8
  8029ac:	48 b8 10 30 81 00 00 	movabs $0x813010,%rax
  8029b3:	00 00 00 
  8029b6:	48 8b 10             	mov    (%rax),%rdx
  8029b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029bc:	8d 48 1f             	lea    0x1f(%rax),%ecx
  8029bf:	85 c0                	test   %eax,%eax
  8029c1:	0f 48 c1             	cmovs  %ecx,%eax
  8029c4:	c1 f8 05             	sar    $0x5,%eax
  8029c7:	48 98                	cltq   
  8029c9:	48 c1 e0 02          	shl    $0x2,%rax
  8029cd:	48 01 d0             	add    %rdx,%rax
  8029d0:	8b 30                	mov    (%rax),%esi
  8029d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029d5:	99                   	cltd   
  8029d6:	c1 ea 1b             	shr    $0x1b,%edx
  8029d9:	01 d0                	add    %edx,%eax
  8029db:	83 e0 1f             	and    $0x1f,%eax
  8029de:	29 d0                	sub    %edx,%eax
  8029e0:	ba 01 00 00 00       	mov    $0x1,%edx
  8029e5:	89 c1                	mov    %eax,%ecx
  8029e7:	d3 e2                	shl    %cl,%edx
  8029e9:	89 d0                	mov    %edx,%eax
  8029eb:	21 f0                	and    %esi,%eax
  8029ed:	85 c0                	test   %eax,%eax
  8029ef:	74 35                	je     802a26 <fs_test+0x1c0>
  8029f1:	48 b9 60 75 80 00 00 	movabs $0x807560,%rcx
  8029f8:	00 00 00 
  8029fb:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802a02:	00 00 00 
  802a05:	be 1d 00 00 00       	mov    $0x1d,%esi
  802a0a:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802a11:	00 00 00 
  802a14:	b8 00 00 00 00       	mov    $0x0,%eax
  802a19:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802a20:	00 00 00 
  802a23:	41 ff d0             	callq  *%r8
  802a26:	48 bf 80 75 80 00 00 	movabs $0x807580,%rdi
  802a2d:	00 00 00 
  802a30:	b8 00 00 00 00       	mov    $0x0,%eax
  802a35:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  802a3c:	00 00 00 
  802a3f:	ff d2                	callq  *%rdx
  802a41:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  802a45:	48 89 c6             	mov    %rax,%rsi
  802a48:	48 bf 95 75 80 00 00 	movabs $0x807595,%rdi
  802a4f:	00 00 00 
  802a52:	48 b8 b3 18 80 00 00 	movabs $0x8018b3,%rax
  802a59:	00 00 00 
  802a5c:	ff d0                	callq  *%rax
  802a5e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a61:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a65:	79 36                	jns    802a9d <fs_test+0x237>
  802a67:	83 7d fc f4          	cmpl   $0xfffffff4,-0x4(%rbp)
  802a6b:	74 30                	je     802a9d <fs_test+0x237>
  802a6d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a70:	89 c1                	mov    %eax,%ecx
  802a72:	48 ba a0 75 80 00 00 	movabs $0x8075a0,%rdx
  802a79:	00 00 00 
  802a7c:	be 21 00 00 00       	mov    $0x21,%esi
  802a81:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802a88:	00 00 00 
  802a8b:	b8 00 00 00 00       	mov    $0x0,%eax
  802a90:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802a97:	00 00 00 
  802a9a:	41 ff d0             	callq  *%r8
  802a9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802aa1:	75 2a                	jne    802acd <fs_test+0x267>
  802aa3:	48 ba c0 75 80 00 00 	movabs $0x8075c0,%rdx
  802aaa:	00 00 00 
  802aad:	be 23 00 00 00       	mov    $0x23,%esi
  802ab2:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802ab9:	00 00 00 
  802abc:	b8 00 00 00 00       	mov    $0x0,%eax
  802ac1:	48 b9 fd 30 80 00 00 	movabs $0x8030fd,%rcx
  802ac8:	00 00 00 
  802acb:	ff d1                	callq  *%rcx
  802acd:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  802ad1:	48 89 c6             	mov    %rax,%rsi
  802ad4:	48 bf e0 75 80 00 00 	movabs $0x8075e0,%rdi
  802adb:	00 00 00 
  802ade:	48 b8 b3 18 80 00 00 	movabs $0x8018b3,%rax
  802ae5:	00 00 00 
  802ae8:	ff d0                	callq  *%rax
  802aea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802af1:	79 30                	jns    802b23 <fs_test+0x2bd>
  802af3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802af6:	89 c1                	mov    %eax,%ecx
  802af8:	48 ba e9 75 80 00 00 	movabs $0x8075e9,%rdx
  802aff:	00 00 00 
  802b02:	be 25 00 00 00       	mov    $0x25,%esi
  802b07:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802b0e:	00 00 00 
  802b11:	b8 00 00 00 00       	mov    $0x0,%eax
  802b16:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802b1d:	00 00 00 
  802b20:	41 ff d0             	callq  *%r8
  802b23:	48 bf 00 76 80 00 00 	movabs $0x807600,%rdi
  802b2a:	00 00 00 
  802b2d:	b8 00 00 00 00       	mov    $0x0,%eax
  802b32:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  802b39:	00 00 00 
  802b3c:	ff d2                	callq  *%rdx
  802b3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b42:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  802b46:	be 00 00 00 00       	mov    $0x0,%esi
  802b4b:	48 89 c7             	mov    %rax,%rdi
  802b4e:	48 b8 33 12 80 00 00 	movabs $0x801233,%rax
  802b55:	00 00 00 
  802b58:	ff d0                	callq  *%rax
  802b5a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b5d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b61:	79 30                	jns    802b93 <fs_test+0x32d>
  802b63:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b66:	89 c1                	mov    %eax,%ecx
  802b68:	48 ba 13 76 80 00 00 	movabs $0x807613,%rdx
  802b6f:	00 00 00 
  802b72:	be 29 00 00 00       	mov    $0x29,%esi
  802b77:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802b7e:	00 00 00 
  802b81:	b8 00 00 00 00       	mov    $0x0,%eax
  802b86:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802b8d:	00 00 00 
  802b90:	41 ff d0             	callq  *%r8
  802b93:	48 b8 88 20 81 00 00 	movabs $0x812088,%rax
  802b9a:	00 00 00 
  802b9d:	48 8b 10             	mov    (%rax),%rdx
  802ba0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ba4:	48 89 d6             	mov    %rdx,%rsi
  802ba7:	48 89 c7             	mov    %rax,%rdi
  802baa:	48 b8 4d 40 80 00 00 	movabs $0x80404d,%rax
  802bb1:	00 00 00 
  802bb4:	ff d0                	callq  *%rax
  802bb6:	85 c0                	test   %eax,%eax
  802bb8:	74 2a                	je     802be4 <fs_test+0x37e>
  802bba:	48 ba 28 76 80 00 00 	movabs $0x807628,%rdx
  802bc1:	00 00 00 
  802bc4:	be 2b 00 00 00       	mov    $0x2b,%esi
  802bc9:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802bd0:	00 00 00 
  802bd3:	b8 00 00 00 00       	mov    $0x0,%eax
  802bd8:	48 b9 fd 30 80 00 00 	movabs $0x8030fd,%rcx
  802bdf:	00 00 00 
  802be2:	ff d1                	callq  *%rcx
  802be4:	48 bf 4b 76 80 00 00 	movabs $0x80764b,%rdi
  802beb:	00 00 00 
  802bee:	b8 00 00 00 00       	mov    $0x0,%eax
  802bf3:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  802bfa:	00 00 00 
  802bfd:	ff d2                	callq  *%rdx
  802bff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c03:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802c07:	0f b6 12             	movzbl (%rdx),%edx
  802c0a:	88 10                	mov    %dl,(%rax)
  802c0c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c10:	48 c1 e8 0c          	shr    $0xc,%rax
  802c14:	48 89 c2             	mov    %rax,%rdx
  802c17:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c1e:	01 00 00 
  802c21:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c25:	83 e0 40             	and    $0x40,%eax
  802c28:	48 85 c0             	test   %rax,%rax
  802c2b:	75 35                	jne    802c62 <fs_test+0x3fc>
  802c2d:	48 b9 63 76 80 00 00 	movabs $0x807663,%rcx
  802c34:	00 00 00 
  802c37:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802c3e:	00 00 00 
  802c41:	be 2f 00 00 00       	mov    $0x2f,%esi
  802c46:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802c4d:	00 00 00 
  802c50:	b8 00 00 00 00       	mov    $0x0,%eax
  802c55:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802c5c:	00 00 00 
  802c5f:	41 ff d0             	callq  *%r8
  802c62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c66:	48 89 c7             	mov    %rax,%rdi
  802c69:	48 b8 3f 1d 80 00 00 	movabs $0x801d3f,%rax
  802c70:	00 00 00 
  802c73:	ff d0                	callq  *%rax
  802c75:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c79:	48 c1 e8 0c          	shr    $0xc,%rax
  802c7d:	48 89 c2             	mov    %rax,%rdx
  802c80:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c87:	01 00 00 
  802c8a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c8e:	83 e0 40             	and    $0x40,%eax
  802c91:	48 85 c0             	test   %rax,%rax
  802c94:	74 35                	je     802ccb <fs_test+0x465>
  802c96:	48 b9 7e 76 80 00 00 	movabs $0x80767e,%rcx
  802c9d:	00 00 00 
  802ca0:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802ca7:	00 00 00 
  802caa:	be 31 00 00 00       	mov    $0x31,%esi
  802caf:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802cb6:	00 00 00 
  802cb9:	b8 00 00 00 00       	mov    $0x0,%eax
  802cbe:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802cc5:	00 00 00 
  802cc8:	41 ff d0             	callq  *%r8
  802ccb:	48 bf 9a 76 80 00 00 	movabs $0x80769a,%rdi
  802cd2:	00 00 00 
  802cd5:	b8 00 00 00 00       	mov    $0x0,%eax
  802cda:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  802ce1:	00 00 00 
  802ce4:	ff d2                	callq  *%rdx
  802ce6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cea:	be 00 00 00 00       	mov    $0x0,%esi
  802cef:	48 89 c7             	mov    %rax,%rdi
  802cf2:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  802cf9:	00 00 00 
  802cfc:	ff d0                	callq  *%rax
  802cfe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d01:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d05:	79 30                	jns    802d37 <fs_test+0x4d1>
  802d07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d0a:	89 c1                	mov    %eax,%ecx
  802d0c:	48 ba ae 76 80 00 00 	movabs $0x8076ae,%rdx
  802d13:	00 00 00 
  802d16:	be 35 00 00 00       	mov    $0x35,%esi
  802d1b:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802d22:	00 00 00 
  802d25:	b8 00 00 00 00       	mov    $0x0,%eax
  802d2a:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802d31:	00 00 00 
  802d34:	41 ff d0             	callq  *%r8
  802d37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d3b:	8b 80 88 00 00 00    	mov    0x88(%rax),%eax
  802d41:	85 c0                	test   %eax,%eax
  802d43:	74 35                	je     802d7a <fs_test+0x514>
  802d45:	48 b9 c0 76 80 00 00 	movabs $0x8076c0,%rcx
  802d4c:	00 00 00 
  802d4f:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802d56:	00 00 00 
  802d59:	be 36 00 00 00       	mov    $0x36,%esi
  802d5e:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802d65:	00 00 00 
  802d68:	b8 00 00 00 00       	mov    $0x0,%eax
  802d6d:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802d74:	00 00 00 
  802d77:	41 ff d0             	callq  *%r8
  802d7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d7e:	48 c1 e8 0c          	shr    $0xc,%rax
  802d82:	48 89 c2             	mov    %rax,%rdx
  802d85:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802d8c:	01 00 00 
  802d8f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802d93:	83 e0 40             	and    $0x40,%eax
  802d96:	48 85 c0             	test   %rax,%rax
  802d99:	74 35                	je     802dd0 <fs_test+0x56a>
  802d9b:	48 b9 d4 76 80 00 00 	movabs $0x8076d4,%rcx
  802da2:	00 00 00 
  802da5:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802dac:	00 00 00 
  802daf:	be 37 00 00 00       	mov    $0x37,%esi
  802db4:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802dbb:	00 00 00 
  802dbe:	b8 00 00 00 00       	mov    $0x0,%eax
  802dc3:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802dca:	00 00 00 
  802dcd:	41 ff d0             	callq  *%r8
  802dd0:	48 bf ee 76 80 00 00 	movabs $0x8076ee,%rdi
  802dd7:	00 00 00 
  802dda:	b8 00 00 00 00       	mov    $0x0,%eax
  802ddf:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  802de6:	00 00 00 
  802de9:	ff d2                	callq  *%rdx
  802deb:	48 b8 88 20 81 00 00 	movabs $0x812088,%rax
  802df2:	00 00 00 
  802df5:	48 8b 00             	mov    (%rax),%rax
  802df8:	48 89 c7             	mov    %rax,%rdi
  802dfb:	48 b8 7f 3e 80 00 00 	movabs $0x803e7f,%rax
  802e02:	00 00 00 
  802e05:	ff d0                	callq  *%rax
  802e07:	89 c2                	mov    %eax,%edx
  802e09:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e0d:	89 d6                	mov    %edx,%esi
  802e0f:	48 89 c7             	mov    %rax,%rdi
  802e12:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  802e19:	00 00 00 
  802e1c:	ff d0                	callq  *%rax
  802e1e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e21:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e25:	79 30                	jns    802e57 <fs_test+0x5f1>
  802e27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e2a:	89 c1                	mov    %eax,%ecx
  802e2c:	48 ba 05 77 80 00 00 	movabs $0x807705,%rdx
  802e33:	00 00 00 
  802e36:	be 3b 00 00 00       	mov    $0x3b,%esi
  802e3b:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802e42:	00 00 00 
  802e45:	b8 00 00 00 00       	mov    $0x0,%eax
  802e4a:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802e51:	00 00 00 
  802e54:	41 ff d0             	callq  *%r8
  802e57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e5b:	48 c1 e8 0c          	shr    $0xc,%rax
  802e5f:	48 89 c2             	mov    %rax,%rdx
  802e62:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e69:	01 00 00 
  802e6c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e70:	83 e0 40             	and    $0x40,%eax
  802e73:	48 85 c0             	test   %rax,%rax
  802e76:	74 35                	je     802ead <fs_test+0x647>
  802e78:	48 b9 d4 76 80 00 00 	movabs $0x8076d4,%rcx
  802e7f:	00 00 00 
  802e82:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802e89:	00 00 00 
  802e8c:	be 3c 00 00 00       	mov    $0x3c,%esi
  802e91:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802e98:	00 00 00 
  802e9b:	b8 00 00 00 00       	mov    $0x0,%eax
  802ea0:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802ea7:	00 00 00 
  802eaa:	41 ff d0             	callq  *%r8
  802ead:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eb1:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  802eb5:	be 00 00 00 00       	mov    $0x0,%esi
  802eba:	48 89 c7             	mov    %rax,%rdi
  802ebd:	48 b8 33 12 80 00 00 	movabs $0x801233,%rax
  802ec4:	00 00 00 
  802ec7:	ff d0                	callq  *%rax
  802ec9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ecc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ed0:	79 30                	jns    802f02 <fs_test+0x69c>
  802ed2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ed5:	89 c1                	mov    %eax,%ecx
  802ed7:	48 ba 19 77 80 00 00 	movabs $0x807719,%rdx
  802ede:	00 00 00 
  802ee1:	be 3e 00 00 00       	mov    $0x3e,%esi
  802ee6:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802eed:	00 00 00 
  802ef0:	b8 00 00 00 00       	mov    $0x0,%eax
  802ef5:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802efc:	00 00 00 
  802eff:	41 ff d0             	callq  *%r8
  802f02:	48 b8 88 20 81 00 00 	movabs $0x812088,%rax
  802f09:	00 00 00 
  802f0c:	48 8b 10             	mov    (%rax),%rdx
  802f0f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f13:	48 89 d6             	mov    %rdx,%rsi
  802f16:	48 89 c7             	mov    %rax,%rdi
  802f19:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  802f20:	00 00 00 
  802f23:	ff d0                	callq  *%rax
  802f25:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f29:	48 c1 e8 0c          	shr    $0xc,%rax
  802f2d:	48 89 c2             	mov    %rax,%rdx
  802f30:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f37:	01 00 00 
  802f3a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f3e:	83 e0 40             	and    $0x40,%eax
  802f41:	48 85 c0             	test   %rax,%rax
  802f44:	75 35                	jne    802f7b <fs_test+0x715>
  802f46:	48 b9 63 76 80 00 00 	movabs $0x807663,%rcx
  802f4d:	00 00 00 
  802f50:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802f57:	00 00 00 
  802f5a:	be 40 00 00 00       	mov    $0x40,%esi
  802f5f:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802f66:	00 00 00 
  802f69:	b8 00 00 00 00       	mov    $0x0,%eax
  802f6e:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802f75:	00 00 00 
  802f78:	41 ff d0             	callq  *%r8
  802f7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f7f:	48 89 c7             	mov    %rax,%rdi
  802f82:	48 b8 3f 1d 80 00 00 	movabs $0x801d3f,%rax
  802f89:	00 00 00 
  802f8c:	ff d0                	callq  *%rax
  802f8e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f92:	48 c1 e8 0c          	shr    $0xc,%rax
  802f96:	48 89 c2             	mov    %rax,%rdx
  802f99:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802fa0:	01 00 00 
  802fa3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802fa7:	83 e0 40             	and    $0x40,%eax
  802faa:	48 85 c0             	test   %rax,%rax
  802fad:	74 35                	je     802fe4 <fs_test+0x77e>
  802faf:	48 b9 7e 76 80 00 00 	movabs $0x80767e,%rcx
  802fb6:	00 00 00 
  802fb9:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  802fc0:	00 00 00 
  802fc3:	be 42 00 00 00       	mov    $0x42,%esi
  802fc8:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  802fcf:	00 00 00 
  802fd2:	b8 00 00 00 00       	mov    $0x0,%eax
  802fd7:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  802fde:	00 00 00 
  802fe1:	41 ff d0             	callq  *%r8
  802fe4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fe8:	48 c1 e8 0c          	shr    $0xc,%rax
  802fec:	48 89 c2             	mov    %rax,%rdx
  802fef:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ff6:	01 00 00 
  802ff9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ffd:	83 e0 40             	and    $0x40,%eax
  803000:	48 85 c0             	test   %rax,%rax
  803003:	74 35                	je     80303a <fs_test+0x7d4>
  803005:	48 b9 d4 76 80 00 00 	movabs $0x8076d4,%rcx
  80300c:	00 00 00 
  80300f:	48 ba 49 75 80 00 00 	movabs $0x807549,%rdx
  803016:	00 00 00 
  803019:	be 43 00 00 00       	mov    $0x43,%esi
  80301e:	48 bf 11 75 80 00 00 	movabs $0x807511,%rdi
  803025:	00 00 00 
  803028:	b8 00 00 00 00       	mov    $0x0,%eax
  80302d:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  803034:	00 00 00 
  803037:	41 ff d0             	callq  *%r8
  80303a:	48 bf 2e 77 80 00 00 	movabs $0x80772e,%rdi
  803041:	00 00 00 
  803044:	b8 00 00 00 00       	mov    $0x0,%eax
  803049:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  803050:	00 00 00 
  803053:	ff d2                	callq  *%rdx
  803055:	c9                   	leaveq 
  803056:	c3                   	retq   

0000000000803057 <libmain>:
  803057:	55                   	push   %rbp
  803058:	48 89 e5             	mov    %rsp,%rbp
  80305b:	48 83 ec 10          	sub    $0x10,%rsp
  80305f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803062:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803066:	48 b8 9e 47 80 00 00 	movabs $0x80479e,%rax
  80306d:	00 00 00 
  803070:	ff d0                	callq  *%rax
  803072:	25 ff 03 00 00       	and    $0x3ff,%eax
  803077:	48 98                	cltq   
  803079:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  803080:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803087:	00 00 00 
  80308a:	48 01 c2             	add    %rax,%rdx
  80308d:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  803094:	00 00 00 
  803097:	48 89 10             	mov    %rdx,(%rax)
  80309a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80309e:	7e 14                	jle    8030b4 <libmain+0x5d>
  8030a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030a4:	48 8b 10             	mov    (%rax),%rdx
  8030a7:	48 b8 90 20 81 00 00 	movabs $0x812090,%rax
  8030ae:	00 00 00 
  8030b1:	48 89 10             	mov    %rdx,(%rax)
  8030b4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8030b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030bb:	48 89 d6             	mov    %rdx,%rsi
  8030be:	89 c7                	mov    %eax,%edi
  8030c0:	48 b8 ce 27 80 00 00 	movabs $0x8027ce,%rax
  8030c7:	00 00 00 
  8030ca:	ff d0                	callq  *%rax
  8030cc:	48 b8 da 30 80 00 00 	movabs $0x8030da,%rax
  8030d3:	00 00 00 
  8030d6:	ff d0                	callq  *%rax
  8030d8:	c9                   	leaveq 
  8030d9:	c3                   	retq   

00000000008030da <exit>:
  8030da:	55                   	push   %rbp
  8030db:	48 89 e5             	mov    %rsp,%rbp
  8030de:	48 b8 2a 53 80 00 00 	movabs $0x80532a,%rax
  8030e5:	00 00 00 
  8030e8:	ff d0                	callq  *%rax
  8030ea:	bf 00 00 00 00       	mov    $0x0,%edi
  8030ef:	48 b8 5a 47 80 00 00 	movabs $0x80475a,%rax
  8030f6:	00 00 00 
  8030f9:	ff d0                	callq  *%rax
  8030fb:	5d                   	pop    %rbp
  8030fc:	c3                   	retq   

00000000008030fd <_panic>:
  8030fd:	55                   	push   %rbp
  8030fe:	48 89 e5             	mov    %rsp,%rbp
  803101:	53                   	push   %rbx
  803102:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803109:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803110:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803116:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80311d:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803124:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80312b:	84 c0                	test   %al,%al
  80312d:	74 23                	je     803152 <_panic+0x55>
  80312f:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803136:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80313a:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80313e:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803142:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803146:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80314a:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80314e:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803152:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803159:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803160:	00 00 00 
  803163:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80316a:	00 00 00 
  80316d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803171:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  803178:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80317f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803186:	48 b8 90 20 81 00 00 	movabs $0x812090,%rax
  80318d:	00 00 00 
  803190:	48 8b 18             	mov    (%rax),%rbx
  803193:	48 b8 9e 47 80 00 00 	movabs $0x80479e,%rax
  80319a:	00 00 00 
  80319d:	ff d0                	callq  *%rax
  80319f:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8031a5:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8031ac:	41 89 c8             	mov    %ecx,%r8d
  8031af:	48 89 d1             	mov    %rdx,%rcx
  8031b2:	48 89 da             	mov    %rbx,%rdx
  8031b5:	89 c6                	mov    %eax,%esi
  8031b7:	48 bf 50 77 80 00 00 	movabs $0x807750,%rdi
  8031be:	00 00 00 
  8031c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8031c6:	49 b9 36 33 80 00 00 	movabs $0x803336,%r9
  8031cd:	00 00 00 
  8031d0:	41 ff d1             	callq  *%r9
  8031d3:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8031da:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8031e1:	48 89 d6             	mov    %rdx,%rsi
  8031e4:	48 89 c7             	mov    %rax,%rdi
  8031e7:	48 b8 8a 32 80 00 00 	movabs $0x80328a,%rax
  8031ee:	00 00 00 
  8031f1:	ff d0                	callq  *%rax
  8031f3:	48 bf 73 77 80 00 00 	movabs $0x807773,%rdi
  8031fa:	00 00 00 
  8031fd:	b8 00 00 00 00       	mov    $0x0,%eax
  803202:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  803209:	00 00 00 
  80320c:	ff d2                	callq  *%rdx
  80320e:	cc                   	int3   
  80320f:	eb fd                	jmp    80320e <_panic+0x111>

0000000000803211 <putch>:
  803211:	55                   	push   %rbp
  803212:	48 89 e5             	mov    %rsp,%rbp
  803215:	48 83 ec 10          	sub    $0x10,%rsp
  803219:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80321c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803220:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803224:	8b 00                	mov    (%rax),%eax
  803226:	8d 48 01             	lea    0x1(%rax),%ecx
  803229:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80322d:	89 0a                	mov    %ecx,(%rdx)
  80322f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803232:	89 d1                	mov    %edx,%ecx
  803234:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803238:	48 98                	cltq   
  80323a:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80323e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803242:	8b 00                	mov    (%rax),%eax
  803244:	3d ff 00 00 00       	cmp    $0xff,%eax
  803249:	75 2c                	jne    803277 <putch+0x66>
  80324b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80324f:	8b 00                	mov    (%rax),%eax
  803251:	48 98                	cltq   
  803253:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803257:	48 83 c2 08          	add    $0x8,%rdx
  80325b:	48 89 c6             	mov    %rax,%rsi
  80325e:	48 89 d7             	mov    %rdx,%rdi
  803261:	48 b8 d2 46 80 00 00 	movabs $0x8046d2,%rax
  803268:	00 00 00 
  80326b:	ff d0                	callq  *%rax
  80326d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803271:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803277:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80327b:	8b 40 04             	mov    0x4(%rax),%eax
  80327e:	8d 50 01             	lea    0x1(%rax),%edx
  803281:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803285:	89 50 04             	mov    %edx,0x4(%rax)
  803288:	c9                   	leaveq 
  803289:	c3                   	retq   

000000000080328a <vcprintf>:
  80328a:	55                   	push   %rbp
  80328b:	48 89 e5             	mov    %rsp,%rbp
  80328e:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  803295:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80329c:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8032a3:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8032aa:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8032b1:	48 8b 0a             	mov    (%rdx),%rcx
  8032b4:	48 89 08             	mov    %rcx,(%rax)
  8032b7:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8032bb:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8032bf:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8032c3:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8032c7:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8032ce:	00 00 00 
  8032d1:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8032d8:	00 00 00 
  8032db:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8032e2:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8032e9:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8032f0:	48 89 c6             	mov    %rax,%rsi
  8032f3:	48 bf 11 32 80 00 00 	movabs $0x803211,%rdi
  8032fa:	00 00 00 
  8032fd:	48 b8 e9 36 80 00 00 	movabs $0x8036e9,%rax
  803304:	00 00 00 
  803307:	ff d0                	callq  *%rax
  803309:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80330f:	48 98                	cltq   
  803311:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  803318:	48 83 c2 08          	add    $0x8,%rdx
  80331c:	48 89 c6             	mov    %rax,%rsi
  80331f:	48 89 d7             	mov    %rdx,%rdi
  803322:	48 b8 d2 46 80 00 00 	movabs $0x8046d2,%rax
  803329:	00 00 00 
  80332c:	ff d0                	callq  *%rax
  80332e:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  803334:	c9                   	leaveq 
  803335:	c3                   	retq   

0000000000803336 <cprintf>:
  803336:	55                   	push   %rbp
  803337:	48 89 e5             	mov    %rsp,%rbp
  80333a:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  803341:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  803348:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80334f:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803356:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80335d:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803364:	84 c0                	test   %al,%al
  803366:	74 20                	je     803388 <cprintf+0x52>
  803368:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80336c:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803370:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803374:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803378:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80337c:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803380:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803384:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803388:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80338f:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  803396:	00 00 00 
  803399:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8033a0:	00 00 00 
  8033a3:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8033a7:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8033ae:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8033b5:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8033bc:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8033c3:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8033ca:	48 8b 0a             	mov    (%rdx),%rcx
  8033cd:	48 89 08             	mov    %rcx,(%rax)
  8033d0:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8033d4:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8033d8:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8033dc:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8033e0:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8033e7:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8033ee:	48 89 d6             	mov    %rdx,%rsi
  8033f1:	48 89 c7             	mov    %rax,%rdi
  8033f4:	48 b8 8a 32 80 00 00 	movabs $0x80328a,%rax
  8033fb:	00 00 00 
  8033fe:	ff d0                	callq  *%rax
  803400:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803406:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80340c:	c9                   	leaveq 
  80340d:	c3                   	retq   

000000000080340e <printnum>:
  80340e:	55                   	push   %rbp
  80340f:	48 89 e5             	mov    %rsp,%rbp
  803412:	53                   	push   %rbx
  803413:	48 83 ec 38          	sub    $0x38,%rsp
  803417:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80341b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80341f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803423:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  803426:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80342a:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  80342e:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803431:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803435:	77 3b                	ja     803472 <printnum+0x64>
  803437:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80343a:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  80343e:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  803441:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803445:	ba 00 00 00 00       	mov    $0x0,%edx
  80344a:	48 f7 f3             	div    %rbx
  80344d:	48 89 c2             	mov    %rax,%rdx
  803450:	8b 7d cc             	mov    -0x34(%rbp),%edi
  803453:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  803456:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80345a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80345e:	41 89 f9             	mov    %edi,%r9d
  803461:	48 89 c7             	mov    %rax,%rdi
  803464:	48 b8 0e 34 80 00 00 	movabs $0x80340e,%rax
  80346b:	00 00 00 
  80346e:	ff d0                	callq  *%rax
  803470:	eb 1e                	jmp    803490 <printnum+0x82>
  803472:	eb 12                	jmp    803486 <printnum+0x78>
  803474:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803478:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80347b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80347f:	48 89 ce             	mov    %rcx,%rsi
  803482:	89 d7                	mov    %edx,%edi
  803484:	ff d0                	callq  *%rax
  803486:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  80348a:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  80348e:	7f e4                	jg     803474 <printnum+0x66>
  803490:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  803493:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803497:	ba 00 00 00 00       	mov    $0x0,%edx
  80349c:	48 f7 f1             	div    %rcx
  80349f:	48 89 d0             	mov    %rdx,%rax
  8034a2:	48 ba 70 79 80 00 00 	movabs $0x807970,%rdx
  8034a9:	00 00 00 
  8034ac:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8034b0:	0f be d0             	movsbl %al,%edx
  8034b3:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8034b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034bb:	48 89 ce             	mov    %rcx,%rsi
  8034be:	89 d7                	mov    %edx,%edi
  8034c0:	ff d0                	callq  *%rax
  8034c2:	48 83 c4 38          	add    $0x38,%rsp
  8034c6:	5b                   	pop    %rbx
  8034c7:	5d                   	pop    %rbp
  8034c8:	c3                   	retq   

00000000008034c9 <getuint>:
  8034c9:	55                   	push   %rbp
  8034ca:	48 89 e5             	mov    %rsp,%rbp
  8034cd:	48 83 ec 1c          	sub    $0x1c,%rsp
  8034d1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034d5:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8034d8:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8034dc:	7e 52                	jle    803530 <getuint+0x67>
  8034de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034e2:	8b 00                	mov    (%rax),%eax
  8034e4:	83 f8 30             	cmp    $0x30,%eax
  8034e7:	73 24                	jae    80350d <getuint+0x44>
  8034e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034ed:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8034f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034f5:	8b 00                	mov    (%rax),%eax
  8034f7:	89 c0                	mov    %eax,%eax
  8034f9:	48 01 d0             	add    %rdx,%rax
  8034fc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803500:	8b 12                	mov    (%rdx),%edx
  803502:	8d 4a 08             	lea    0x8(%rdx),%ecx
  803505:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803509:	89 0a                	mov    %ecx,(%rdx)
  80350b:	eb 17                	jmp    803524 <getuint+0x5b>
  80350d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803511:	48 8b 50 08          	mov    0x8(%rax),%rdx
  803515:	48 89 d0             	mov    %rdx,%rax
  803518:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80351c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803520:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803524:	48 8b 00             	mov    (%rax),%rax
  803527:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80352b:	e9 a3 00 00 00       	jmpq   8035d3 <getuint+0x10a>
  803530:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  803534:	74 4f                	je     803585 <getuint+0xbc>
  803536:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80353a:	8b 00                	mov    (%rax),%eax
  80353c:	83 f8 30             	cmp    $0x30,%eax
  80353f:	73 24                	jae    803565 <getuint+0x9c>
  803541:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803545:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803549:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80354d:	8b 00                	mov    (%rax),%eax
  80354f:	89 c0                	mov    %eax,%eax
  803551:	48 01 d0             	add    %rdx,%rax
  803554:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803558:	8b 12                	mov    (%rdx),%edx
  80355a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80355d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803561:	89 0a                	mov    %ecx,(%rdx)
  803563:	eb 17                	jmp    80357c <getuint+0xb3>
  803565:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803569:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80356d:	48 89 d0             	mov    %rdx,%rax
  803570:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  803574:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803578:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80357c:	48 8b 00             	mov    (%rax),%rax
  80357f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803583:	eb 4e                	jmp    8035d3 <getuint+0x10a>
  803585:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803589:	8b 00                	mov    (%rax),%eax
  80358b:	83 f8 30             	cmp    $0x30,%eax
  80358e:	73 24                	jae    8035b4 <getuint+0xeb>
  803590:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803594:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803598:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80359c:	8b 00                	mov    (%rax),%eax
  80359e:	89 c0                	mov    %eax,%eax
  8035a0:	48 01 d0             	add    %rdx,%rax
  8035a3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035a7:	8b 12                	mov    (%rdx),%edx
  8035a9:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8035ac:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035b0:	89 0a                	mov    %ecx,(%rdx)
  8035b2:	eb 17                	jmp    8035cb <getuint+0x102>
  8035b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035b8:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8035bc:	48 89 d0             	mov    %rdx,%rax
  8035bf:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8035c3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035c7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8035cb:	8b 00                	mov    (%rax),%eax
  8035cd:	89 c0                	mov    %eax,%eax
  8035cf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8035d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035d7:	c9                   	leaveq 
  8035d8:	c3                   	retq   

00000000008035d9 <getint>:
  8035d9:	55                   	push   %rbp
  8035da:	48 89 e5             	mov    %rsp,%rbp
  8035dd:	48 83 ec 1c          	sub    $0x1c,%rsp
  8035e1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8035e5:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8035e8:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8035ec:	7e 52                	jle    803640 <getint+0x67>
  8035ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035f2:	8b 00                	mov    (%rax),%eax
  8035f4:	83 f8 30             	cmp    $0x30,%eax
  8035f7:	73 24                	jae    80361d <getint+0x44>
  8035f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035fd:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803601:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803605:	8b 00                	mov    (%rax),%eax
  803607:	89 c0                	mov    %eax,%eax
  803609:	48 01 d0             	add    %rdx,%rax
  80360c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803610:	8b 12                	mov    (%rdx),%edx
  803612:	8d 4a 08             	lea    0x8(%rdx),%ecx
  803615:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803619:	89 0a                	mov    %ecx,(%rdx)
  80361b:	eb 17                	jmp    803634 <getint+0x5b>
  80361d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803621:	48 8b 50 08          	mov    0x8(%rax),%rdx
  803625:	48 89 d0             	mov    %rdx,%rax
  803628:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80362c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803630:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803634:	48 8b 00             	mov    (%rax),%rax
  803637:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80363b:	e9 a3 00 00 00       	jmpq   8036e3 <getint+0x10a>
  803640:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  803644:	74 4f                	je     803695 <getint+0xbc>
  803646:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80364a:	8b 00                	mov    (%rax),%eax
  80364c:	83 f8 30             	cmp    $0x30,%eax
  80364f:	73 24                	jae    803675 <getint+0x9c>
  803651:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803655:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803659:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80365d:	8b 00                	mov    (%rax),%eax
  80365f:	89 c0                	mov    %eax,%eax
  803661:	48 01 d0             	add    %rdx,%rax
  803664:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803668:	8b 12                	mov    (%rdx),%edx
  80366a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80366d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803671:	89 0a                	mov    %ecx,(%rdx)
  803673:	eb 17                	jmp    80368c <getint+0xb3>
  803675:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803679:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80367d:	48 89 d0             	mov    %rdx,%rax
  803680:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  803684:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803688:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80368c:	48 8b 00             	mov    (%rax),%rax
  80368f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803693:	eb 4e                	jmp    8036e3 <getint+0x10a>
  803695:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803699:	8b 00                	mov    (%rax),%eax
  80369b:	83 f8 30             	cmp    $0x30,%eax
  80369e:	73 24                	jae    8036c4 <getint+0xeb>
  8036a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036a4:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8036a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036ac:	8b 00                	mov    (%rax),%eax
  8036ae:	89 c0                	mov    %eax,%eax
  8036b0:	48 01 d0             	add    %rdx,%rax
  8036b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036b7:	8b 12                	mov    (%rdx),%edx
  8036b9:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8036bc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036c0:	89 0a                	mov    %ecx,(%rdx)
  8036c2:	eb 17                	jmp    8036db <getint+0x102>
  8036c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036c8:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8036cc:	48 89 d0             	mov    %rdx,%rax
  8036cf:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8036d3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036d7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8036db:	8b 00                	mov    (%rax),%eax
  8036dd:	48 98                	cltq   
  8036df:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8036e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036e7:	c9                   	leaveq 
  8036e8:	c3                   	retq   

00000000008036e9 <vprintfmt>:
  8036e9:	55                   	push   %rbp
  8036ea:	48 89 e5             	mov    %rsp,%rbp
  8036ed:	41 54                	push   %r12
  8036ef:	53                   	push   %rbx
  8036f0:	48 83 ec 60          	sub    $0x60,%rsp
  8036f4:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8036f8:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8036fc:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  803700:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  803704:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803708:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80370c:	48 8b 0a             	mov    (%rdx),%rcx
  80370f:	48 89 08             	mov    %rcx,(%rax)
  803712:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803716:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80371a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80371e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803722:	eb 17                	jmp    80373b <vprintfmt+0x52>
  803724:	85 db                	test   %ebx,%ebx
  803726:	0f 84 cc 04 00 00    	je     803bf8 <vprintfmt+0x50f>
  80372c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803730:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803734:	48 89 d6             	mov    %rdx,%rsi
  803737:	89 df                	mov    %ebx,%edi
  803739:	ff d0                	callq  *%rax
  80373b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80373f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803743:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  803747:	0f b6 00             	movzbl (%rax),%eax
  80374a:	0f b6 d8             	movzbl %al,%ebx
  80374d:	83 fb 25             	cmp    $0x25,%ebx
  803750:	75 d2                	jne    803724 <vprintfmt+0x3b>
  803752:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  803756:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80375d:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  803764:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80376b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  803772:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803776:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80377a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80377e:	0f b6 00             	movzbl (%rax),%eax
  803781:	0f b6 d8             	movzbl %al,%ebx
  803784:	8d 43 dd             	lea    -0x23(%rbx),%eax
  803787:	83 f8 55             	cmp    $0x55,%eax
  80378a:	0f 87 34 04 00 00    	ja     803bc4 <vprintfmt+0x4db>
  803790:	89 c0                	mov    %eax,%eax
  803792:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803799:	00 
  80379a:	48 b8 98 79 80 00 00 	movabs $0x807998,%rax
  8037a1:	00 00 00 
  8037a4:	48 01 d0             	add    %rdx,%rax
  8037a7:	48 8b 00             	mov    (%rax),%rax
  8037aa:	ff e0                	jmpq   *%rax
  8037ac:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8037b0:	eb c0                	jmp    803772 <vprintfmt+0x89>
  8037b2:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8037b6:	eb ba                	jmp    803772 <vprintfmt+0x89>
  8037b8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8037bf:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8037c2:	89 d0                	mov    %edx,%eax
  8037c4:	c1 e0 02             	shl    $0x2,%eax
  8037c7:	01 d0                	add    %edx,%eax
  8037c9:	01 c0                	add    %eax,%eax
  8037cb:	01 d8                	add    %ebx,%eax
  8037cd:	83 e8 30             	sub    $0x30,%eax
  8037d0:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8037d3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8037d7:	0f b6 00             	movzbl (%rax),%eax
  8037da:	0f be d8             	movsbl %al,%ebx
  8037dd:	83 fb 2f             	cmp    $0x2f,%ebx
  8037e0:	7e 0c                	jle    8037ee <vprintfmt+0x105>
  8037e2:	83 fb 39             	cmp    $0x39,%ebx
  8037e5:	7f 07                	jg     8037ee <vprintfmt+0x105>
  8037e7:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8037ec:	eb d1                	jmp    8037bf <vprintfmt+0xd6>
  8037ee:	eb 58                	jmp    803848 <vprintfmt+0x15f>
  8037f0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8037f3:	83 f8 30             	cmp    $0x30,%eax
  8037f6:	73 17                	jae    80380f <vprintfmt+0x126>
  8037f8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8037fc:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8037ff:	89 c0                	mov    %eax,%eax
  803801:	48 01 d0             	add    %rdx,%rax
  803804:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803807:	83 c2 08             	add    $0x8,%edx
  80380a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80380d:	eb 0f                	jmp    80381e <vprintfmt+0x135>
  80380f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803813:	48 89 d0             	mov    %rdx,%rax
  803816:	48 83 c2 08          	add    $0x8,%rdx
  80381a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80381e:	8b 00                	mov    (%rax),%eax
  803820:	89 45 d8             	mov    %eax,-0x28(%rbp)
  803823:	eb 23                	jmp    803848 <vprintfmt+0x15f>
  803825:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803829:	79 0c                	jns    803837 <vprintfmt+0x14e>
  80382b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  803832:	e9 3b ff ff ff       	jmpq   803772 <vprintfmt+0x89>
  803837:	e9 36 ff ff ff       	jmpq   803772 <vprintfmt+0x89>
  80383c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  803843:	e9 2a ff ff ff       	jmpq   803772 <vprintfmt+0x89>
  803848:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80384c:	79 12                	jns    803860 <vprintfmt+0x177>
  80384e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803851:	89 45 dc             	mov    %eax,-0x24(%rbp)
  803854:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80385b:	e9 12 ff ff ff       	jmpq   803772 <vprintfmt+0x89>
  803860:	e9 0d ff ff ff       	jmpq   803772 <vprintfmt+0x89>
  803865:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  803869:	e9 04 ff ff ff       	jmpq   803772 <vprintfmt+0x89>
  80386e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803871:	83 f8 30             	cmp    $0x30,%eax
  803874:	73 17                	jae    80388d <vprintfmt+0x1a4>
  803876:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80387a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80387d:	89 c0                	mov    %eax,%eax
  80387f:	48 01 d0             	add    %rdx,%rax
  803882:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803885:	83 c2 08             	add    $0x8,%edx
  803888:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80388b:	eb 0f                	jmp    80389c <vprintfmt+0x1b3>
  80388d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803891:	48 89 d0             	mov    %rdx,%rax
  803894:	48 83 c2 08          	add    $0x8,%rdx
  803898:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80389c:	8b 10                	mov    (%rax),%edx
  80389e:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8038a2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8038a6:	48 89 ce             	mov    %rcx,%rsi
  8038a9:	89 d7                	mov    %edx,%edi
  8038ab:	ff d0                	callq  *%rax
  8038ad:	e9 40 03 00 00       	jmpq   803bf2 <vprintfmt+0x509>
  8038b2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8038b5:	83 f8 30             	cmp    $0x30,%eax
  8038b8:	73 17                	jae    8038d1 <vprintfmt+0x1e8>
  8038ba:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8038be:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8038c1:	89 c0                	mov    %eax,%eax
  8038c3:	48 01 d0             	add    %rdx,%rax
  8038c6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8038c9:	83 c2 08             	add    $0x8,%edx
  8038cc:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8038cf:	eb 0f                	jmp    8038e0 <vprintfmt+0x1f7>
  8038d1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8038d5:	48 89 d0             	mov    %rdx,%rax
  8038d8:	48 83 c2 08          	add    $0x8,%rdx
  8038dc:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8038e0:	8b 18                	mov    (%rax),%ebx
  8038e2:	85 db                	test   %ebx,%ebx
  8038e4:	79 02                	jns    8038e8 <vprintfmt+0x1ff>
  8038e6:	f7 db                	neg    %ebx
  8038e8:	83 fb 15             	cmp    $0x15,%ebx
  8038eb:	7f 16                	jg     803903 <vprintfmt+0x21a>
  8038ed:	48 b8 c0 78 80 00 00 	movabs $0x8078c0,%rax
  8038f4:	00 00 00 
  8038f7:	48 63 d3             	movslq %ebx,%rdx
  8038fa:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8038fe:	4d 85 e4             	test   %r12,%r12
  803901:	75 2e                	jne    803931 <vprintfmt+0x248>
  803903:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803907:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80390b:	89 d9                	mov    %ebx,%ecx
  80390d:	48 ba 81 79 80 00 00 	movabs $0x807981,%rdx
  803914:	00 00 00 
  803917:	48 89 c7             	mov    %rax,%rdi
  80391a:	b8 00 00 00 00       	mov    $0x0,%eax
  80391f:	49 b8 01 3c 80 00 00 	movabs $0x803c01,%r8
  803926:	00 00 00 
  803929:	41 ff d0             	callq  *%r8
  80392c:	e9 c1 02 00 00       	jmpq   803bf2 <vprintfmt+0x509>
  803931:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803935:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803939:	4c 89 e1             	mov    %r12,%rcx
  80393c:	48 ba 8a 79 80 00 00 	movabs $0x80798a,%rdx
  803943:	00 00 00 
  803946:	48 89 c7             	mov    %rax,%rdi
  803949:	b8 00 00 00 00       	mov    $0x0,%eax
  80394e:	49 b8 01 3c 80 00 00 	movabs $0x803c01,%r8
  803955:	00 00 00 
  803958:	41 ff d0             	callq  *%r8
  80395b:	e9 92 02 00 00       	jmpq   803bf2 <vprintfmt+0x509>
  803960:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803963:	83 f8 30             	cmp    $0x30,%eax
  803966:	73 17                	jae    80397f <vprintfmt+0x296>
  803968:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80396c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80396f:	89 c0                	mov    %eax,%eax
  803971:	48 01 d0             	add    %rdx,%rax
  803974:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803977:	83 c2 08             	add    $0x8,%edx
  80397a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80397d:	eb 0f                	jmp    80398e <vprintfmt+0x2a5>
  80397f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803983:	48 89 d0             	mov    %rdx,%rax
  803986:	48 83 c2 08          	add    $0x8,%rdx
  80398a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80398e:	4c 8b 20             	mov    (%rax),%r12
  803991:	4d 85 e4             	test   %r12,%r12
  803994:	75 0a                	jne    8039a0 <vprintfmt+0x2b7>
  803996:	49 bc 8d 79 80 00 00 	movabs $0x80798d,%r12
  80399d:	00 00 00 
  8039a0:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8039a4:	7e 3f                	jle    8039e5 <vprintfmt+0x2fc>
  8039a6:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8039aa:	74 39                	je     8039e5 <vprintfmt+0x2fc>
  8039ac:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8039af:	48 98                	cltq   
  8039b1:	48 89 c6             	mov    %rax,%rsi
  8039b4:	4c 89 e7             	mov    %r12,%rdi
  8039b7:	48 b8 ad 3e 80 00 00 	movabs $0x803ead,%rax
  8039be:	00 00 00 
  8039c1:	ff d0                	callq  *%rax
  8039c3:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8039c6:	eb 17                	jmp    8039df <vprintfmt+0x2f6>
  8039c8:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8039cc:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8039d0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8039d4:	48 89 ce             	mov    %rcx,%rsi
  8039d7:	89 d7                	mov    %edx,%edi
  8039d9:	ff d0                	callq  *%rax
  8039db:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8039df:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8039e3:	7f e3                	jg     8039c8 <vprintfmt+0x2df>
  8039e5:	eb 37                	jmp    803a1e <vprintfmt+0x335>
  8039e7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8039eb:	74 1e                	je     803a0b <vprintfmt+0x322>
  8039ed:	83 fb 1f             	cmp    $0x1f,%ebx
  8039f0:	7e 05                	jle    8039f7 <vprintfmt+0x30e>
  8039f2:	83 fb 7e             	cmp    $0x7e,%ebx
  8039f5:	7e 14                	jle    803a0b <vprintfmt+0x322>
  8039f7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8039fb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8039ff:	48 89 d6             	mov    %rdx,%rsi
  803a02:	bf 3f 00 00 00       	mov    $0x3f,%edi
  803a07:	ff d0                	callq  *%rax
  803a09:	eb 0f                	jmp    803a1a <vprintfmt+0x331>
  803a0b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803a0f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803a13:	48 89 d6             	mov    %rdx,%rsi
  803a16:	89 df                	mov    %ebx,%edi
  803a18:	ff d0                	callq  *%rax
  803a1a:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803a1e:	4c 89 e0             	mov    %r12,%rax
  803a21:	4c 8d 60 01          	lea    0x1(%rax),%r12
  803a25:	0f b6 00             	movzbl (%rax),%eax
  803a28:	0f be d8             	movsbl %al,%ebx
  803a2b:	85 db                	test   %ebx,%ebx
  803a2d:	74 10                	je     803a3f <vprintfmt+0x356>
  803a2f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  803a33:	78 b2                	js     8039e7 <vprintfmt+0x2fe>
  803a35:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  803a39:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  803a3d:	79 a8                	jns    8039e7 <vprintfmt+0x2fe>
  803a3f:	eb 16                	jmp    803a57 <vprintfmt+0x36e>
  803a41:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803a45:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803a49:	48 89 d6             	mov    %rdx,%rsi
  803a4c:	bf 20 00 00 00       	mov    $0x20,%edi
  803a51:	ff d0                	callq  *%rax
  803a53:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803a57:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803a5b:	7f e4                	jg     803a41 <vprintfmt+0x358>
  803a5d:	e9 90 01 00 00       	jmpq   803bf2 <vprintfmt+0x509>
  803a62:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803a66:	be 03 00 00 00       	mov    $0x3,%esi
  803a6b:	48 89 c7             	mov    %rax,%rdi
  803a6e:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  803a75:	00 00 00 
  803a78:	ff d0                	callq  *%rax
  803a7a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a7e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a82:	48 85 c0             	test   %rax,%rax
  803a85:	79 1d                	jns    803aa4 <vprintfmt+0x3bb>
  803a87:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803a8b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803a8f:	48 89 d6             	mov    %rdx,%rsi
  803a92:	bf 2d 00 00 00       	mov    $0x2d,%edi
  803a97:	ff d0                	callq  *%rax
  803a99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a9d:	48 f7 d8             	neg    %rax
  803aa0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803aa4:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  803aab:	e9 d5 00 00 00       	jmpq   803b85 <vprintfmt+0x49c>
  803ab0:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803ab4:	be 03 00 00 00       	mov    $0x3,%esi
  803ab9:	48 89 c7             	mov    %rax,%rdi
  803abc:	48 b8 c9 34 80 00 00 	movabs $0x8034c9,%rax
  803ac3:	00 00 00 
  803ac6:	ff d0                	callq  *%rax
  803ac8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803acc:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  803ad3:	e9 ad 00 00 00       	jmpq   803b85 <vprintfmt+0x49c>
  803ad8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803adc:	be 03 00 00 00       	mov    $0x3,%esi
  803ae1:	48 89 c7             	mov    %rax,%rdi
  803ae4:	48 b8 c9 34 80 00 00 	movabs $0x8034c9,%rax
  803aeb:	00 00 00 
  803aee:	ff d0                	callq  *%rax
  803af0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803af4:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  803afb:	e9 85 00 00 00       	jmpq   803b85 <vprintfmt+0x49c>
  803b00:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803b04:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803b08:	48 89 d6             	mov    %rdx,%rsi
  803b0b:	bf 30 00 00 00       	mov    $0x30,%edi
  803b10:	ff d0                	callq  *%rax
  803b12:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803b16:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803b1a:	48 89 d6             	mov    %rdx,%rsi
  803b1d:	bf 78 00 00 00       	mov    $0x78,%edi
  803b22:	ff d0                	callq  *%rax
  803b24:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803b27:	83 f8 30             	cmp    $0x30,%eax
  803b2a:	73 17                	jae    803b43 <vprintfmt+0x45a>
  803b2c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803b30:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803b33:	89 c0                	mov    %eax,%eax
  803b35:	48 01 d0             	add    %rdx,%rax
  803b38:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803b3b:	83 c2 08             	add    $0x8,%edx
  803b3e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803b41:	eb 0f                	jmp    803b52 <vprintfmt+0x469>
  803b43:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803b47:	48 89 d0             	mov    %rdx,%rax
  803b4a:	48 83 c2 08          	add    $0x8,%rdx
  803b4e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803b52:	48 8b 00             	mov    (%rax),%rax
  803b55:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803b59:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803b60:	eb 23                	jmp    803b85 <vprintfmt+0x49c>
  803b62:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803b66:	be 03 00 00 00       	mov    $0x3,%esi
  803b6b:	48 89 c7             	mov    %rax,%rdi
  803b6e:	48 b8 c9 34 80 00 00 	movabs $0x8034c9,%rax
  803b75:	00 00 00 
  803b78:	ff d0                	callq  *%rax
  803b7a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803b7e:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803b85:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  803b8a:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803b8d:	8b 7d dc             	mov    -0x24(%rbp),%edi
  803b90:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803b94:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803b98:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803b9c:	45 89 c1             	mov    %r8d,%r9d
  803b9f:	41 89 f8             	mov    %edi,%r8d
  803ba2:	48 89 c7             	mov    %rax,%rdi
  803ba5:	48 b8 0e 34 80 00 00 	movabs $0x80340e,%rax
  803bac:	00 00 00 
  803baf:	ff d0                	callq  *%rax
  803bb1:	eb 3f                	jmp    803bf2 <vprintfmt+0x509>
  803bb3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803bb7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803bbb:	48 89 d6             	mov    %rdx,%rsi
  803bbe:	89 df                	mov    %ebx,%edi
  803bc0:	ff d0                	callq  *%rax
  803bc2:	eb 2e                	jmp    803bf2 <vprintfmt+0x509>
  803bc4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803bc8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803bcc:	48 89 d6             	mov    %rdx,%rsi
  803bcf:	bf 25 00 00 00       	mov    $0x25,%edi
  803bd4:	ff d0                	callq  *%rax
  803bd6:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803bdb:	eb 05                	jmp    803be2 <vprintfmt+0x4f9>
  803bdd:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803be2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803be6:	48 83 e8 01          	sub    $0x1,%rax
  803bea:	0f b6 00             	movzbl (%rax),%eax
  803bed:	3c 25                	cmp    $0x25,%al
  803bef:	75 ec                	jne    803bdd <vprintfmt+0x4f4>
  803bf1:	90                   	nop
  803bf2:	90                   	nop
  803bf3:	e9 43 fb ff ff       	jmpq   80373b <vprintfmt+0x52>
  803bf8:	48 83 c4 60          	add    $0x60,%rsp
  803bfc:	5b                   	pop    %rbx
  803bfd:	41 5c                	pop    %r12
  803bff:	5d                   	pop    %rbp
  803c00:	c3                   	retq   

0000000000803c01 <printfmt>:
  803c01:	55                   	push   %rbp
  803c02:	48 89 e5             	mov    %rsp,%rbp
  803c05:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  803c0c:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803c13:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803c1a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803c21:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803c28:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803c2f:	84 c0                	test   %al,%al
  803c31:	74 20                	je     803c53 <printfmt+0x52>
  803c33:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803c37:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803c3b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803c3f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803c43:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803c47:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803c4b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803c4f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803c53:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  803c5a:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  803c61:	00 00 00 
  803c64:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  803c6b:	00 00 00 
  803c6e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803c72:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803c79:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803c80:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  803c87:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  803c8e:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803c95:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  803c9c:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  803ca3:	48 89 c7             	mov    %rax,%rdi
  803ca6:	48 b8 e9 36 80 00 00 	movabs $0x8036e9,%rax
  803cad:	00 00 00 
  803cb0:	ff d0                	callq  *%rax
  803cb2:	c9                   	leaveq 
  803cb3:	c3                   	retq   

0000000000803cb4 <sprintputch>:
  803cb4:	55                   	push   %rbp
  803cb5:	48 89 e5             	mov    %rsp,%rbp
  803cb8:	48 83 ec 10          	sub    $0x10,%rsp
  803cbc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cbf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cc7:	8b 40 10             	mov    0x10(%rax),%eax
  803cca:	8d 50 01             	lea    0x1(%rax),%edx
  803ccd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd1:	89 50 10             	mov    %edx,0x10(%rax)
  803cd4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd8:	48 8b 10             	mov    (%rax),%rdx
  803cdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cdf:	48 8b 40 08          	mov    0x8(%rax),%rax
  803ce3:	48 39 c2             	cmp    %rax,%rdx
  803ce6:	73 17                	jae    803cff <sprintputch+0x4b>
  803ce8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cec:	48 8b 00             	mov    (%rax),%rax
  803cef:	48 8d 48 01          	lea    0x1(%rax),%rcx
  803cf3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803cf7:	48 89 0a             	mov    %rcx,(%rdx)
  803cfa:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803cfd:	88 10                	mov    %dl,(%rax)
  803cff:	c9                   	leaveq 
  803d00:	c3                   	retq   

0000000000803d01 <vsnprintf>:
  803d01:	55                   	push   %rbp
  803d02:	48 89 e5             	mov    %rsp,%rbp
  803d05:	48 83 ec 50          	sub    $0x50,%rsp
  803d09:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803d0d:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  803d10:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803d14:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  803d18:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  803d1c:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  803d20:	48 8b 0a             	mov    (%rdx),%rcx
  803d23:	48 89 08             	mov    %rcx,(%rax)
  803d26:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803d2a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803d2e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803d32:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803d36:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803d3a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  803d3e:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  803d41:	48 98                	cltq   
  803d43:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  803d47:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803d4b:	48 01 d0             	add    %rdx,%rax
  803d4e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803d52:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  803d59:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  803d5e:	74 06                	je     803d66 <vsnprintf+0x65>
  803d60:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  803d64:	7f 07                	jg     803d6d <vsnprintf+0x6c>
  803d66:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803d6b:	eb 2f                	jmp    803d9c <vsnprintf+0x9b>
  803d6d:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  803d71:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  803d75:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803d79:	48 89 c6             	mov    %rax,%rsi
  803d7c:	48 bf b4 3c 80 00 00 	movabs $0x803cb4,%rdi
  803d83:	00 00 00 
  803d86:	48 b8 e9 36 80 00 00 	movabs $0x8036e9,%rax
  803d8d:	00 00 00 
  803d90:	ff d0                	callq  *%rax
  803d92:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d96:	c6 00 00             	movb   $0x0,(%rax)
  803d99:	8b 45 e0             	mov    -0x20(%rbp),%eax
  803d9c:	c9                   	leaveq 
  803d9d:	c3                   	retq   

0000000000803d9e <snprintf>:
  803d9e:	55                   	push   %rbp
  803d9f:	48 89 e5             	mov    %rsp,%rbp
  803da2:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  803da9:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  803db0:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  803db6:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803dbd:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803dc4:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803dcb:	84 c0                	test   %al,%al
  803dcd:	74 20                	je     803def <snprintf+0x51>
  803dcf:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803dd3:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803dd7:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803ddb:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803ddf:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803de3:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803de7:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803deb:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803def:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  803df6:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  803dfd:	00 00 00 
  803e00:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803e07:	00 00 00 
  803e0a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803e0e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803e15:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803e1c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803e23:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  803e2a:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803e31:	48 8b 0a             	mov    (%rdx),%rcx
  803e34:	48 89 08             	mov    %rcx,(%rax)
  803e37:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803e3b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803e3f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803e43:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803e47:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  803e4e:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  803e55:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  803e5b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803e62:	48 89 c7             	mov    %rax,%rdi
  803e65:	48 b8 01 3d 80 00 00 	movabs $0x803d01,%rax
  803e6c:	00 00 00 
  803e6f:	ff d0                	callq  *%rax
  803e71:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803e77:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803e7d:	c9                   	leaveq 
  803e7e:	c3                   	retq   

0000000000803e7f <strlen>:
  803e7f:	55                   	push   %rbp
  803e80:	48 89 e5             	mov    %rsp,%rbp
  803e83:	48 83 ec 18          	sub    $0x18,%rsp
  803e87:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803e8b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803e92:	eb 09                	jmp    803e9d <strlen+0x1e>
  803e94:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803e98:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  803e9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ea1:	0f b6 00             	movzbl (%rax),%eax
  803ea4:	84 c0                	test   %al,%al
  803ea6:	75 ec                	jne    803e94 <strlen+0x15>
  803ea8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eab:	c9                   	leaveq 
  803eac:	c3                   	retq   

0000000000803ead <strnlen>:
  803ead:	55                   	push   %rbp
  803eae:	48 89 e5             	mov    %rsp,%rbp
  803eb1:	48 83 ec 20          	sub    $0x20,%rsp
  803eb5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803eb9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ebd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ec4:	eb 0e                	jmp    803ed4 <strnlen+0x27>
  803ec6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803eca:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  803ecf:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  803ed4:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803ed9:	74 0b                	je     803ee6 <strnlen+0x39>
  803edb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803edf:	0f b6 00             	movzbl (%rax),%eax
  803ee2:	84 c0                	test   %al,%al
  803ee4:	75 e0                	jne    803ec6 <strnlen+0x19>
  803ee6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ee9:	c9                   	leaveq 
  803eea:	c3                   	retq   

0000000000803eeb <strcpy>:
  803eeb:	55                   	push   %rbp
  803eec:	48 89 e5             	mov    %rsp,%rbp
  803eef:	48 83 ec 20          	sub    $0x20,%rsp
  803ef3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803ef7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803efb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803eff:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803f03:	90                   	nop
  803f04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f08:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803f0c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803f10:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803f14:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  803f18:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  803f1c:	0f b6 12             	movzbl (%rdx),%edx
  803f1f:	88 10                	mov    %dl,(%rax)
  803f21:	0f b6 00             	movzbl (%rax),%eax
  803f24:	84 c0                	test   %al,%al
  803f26:	75 dc                	jne    803f04 <strcpy+0x19>
  803f28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f2c:	c9                   	leaveq 
  803f2d:	c3                   	retq   

0000000000803f2e <strcat>:
  803f2e:	55                   	push   %rbp
  803f2f:	48 89 e5             	mov    %rsp,%rbp
  803f32:	48 83 ec 20          	sub    $0x20,%rsp
  803f36:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f3a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f42:	48 89 c7             	mov    %rax,%rdi
  803f45:	48 b8 7f 3e 80 00 00 	movabs $0x803e7f,%rax
  803f4c:	00 00 00 
  803f4f:	ff d0                	callq  *%rax
  803f51:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f57:	48 63 d0             	movslq %eax,%rdx
  803f5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f5e:	48 01 c2             	add    %rax,%rdx
  803f61:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f65:	48 89 c6             	mov    %rax,%rsi
  803f68:	48 89 d7             	mov    %rdx,%rdi
  803f6b:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  803f72:	00 00 00 
  803f75:	ff d0                	callq  *%rax
  803f77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f7b:	c9                   	leaveq 
  803f7c:	c3                   	retq   

0000000000803f7d <strncpy>:
  803f7d:	55                   	push   %rbp
  803f7e:	48 89 e5             	mov    %rsp,%rbp
  803f81:	48 83 ec 28          	sub    $0x28,%rsp
  803f85:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f89:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f8d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f95:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803f99:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803fa0:	00 
  803fa1:	eb 2a                	jmp    803fcd <strncpy+0x50>
  803fa3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fa7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803fab:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803faf:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803fb3:	0f b6 12             	movzbl (%rdx),%edx
  803fb6:	88 10                	mov    %dl,(%rax)
  803fb8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fbc:	0f b6 00             	movzbl (%rax),%eax
  803fbf:	84 c0                	test   %al,%al
  803fc1:	74 05                	je     803fc8 <strncpy+0x4b>
  803fc3:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  803fc8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803fcd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fd1:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803fd5:	72 cc                	jb     803fa3 <strncpy+0x26>
  803fd7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fdb:	c9                   	leaveq 
  803fdc:	c3                   	retq   

0000000000803fdd <strlcpy>:
  803fdd:	55                   	push   %rbp
  803fde:	48 89 e5             	mov    %rsp,%rbp
  803fe1:	48 83 ec 28          	sub    $0x28,%rsp
  803fe5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803fe9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803fed:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ff1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ff5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803ff9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803ffe:	74 3d                	je     80403d <strlcpy+0x60>
  804000:	eb 1d                	jmp    80401f <strlcpy+0x42>
  804002:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804006:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80400a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80400e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804012:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  804016:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80401a:	0f b6 12             	movzbl (%rdx),%edx
  80401d:	88 10                	mov    %dl,(%rax)
  80401f:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  804024:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804029:	74 0b                	je     804036 <strlcpy+0x59>
  80402b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80402f:	0f b6 00             	movzbl (%rax),%eax
  804032:	84 c0                	test   %al,%al
  804034:	75 cc                	jne    804002 <strlcpy+0x25>
  804036:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80403a:	c6 00 00             	movb   $0x0,(%rax)
  80403d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804041:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804045:	48 29 c2             	sub    %rax,%rdx
  804048:	48 89 d0             	mov    %rdx,%rax
  80404b:	c9                   	leaveq 
  80404c:	c3                   	retq   

000000000080404d <strcmp>:
  80404d:	55                   	push   %rbp
  80404e:	48 89 e5             	mov    %rsp,%rbp
  804051:	48 83 ec 10          	sub    $0x10,%rsp
  804055:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804059:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80405d:	eb 0a                	jmp    804069 <strcmp+0x1c>
  80405f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804064:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  804069:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80406d:	0f b6 00             	movzbl (%rax),%eax
  804070:	84 c0                	test   %al,%al
  804072:	74 12                	je     804086 <strcmp+0x39>
  804074:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804078:	0f b6 10             	movzbl (%rax),%edx
  80407b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80407f:	0f b6 00             	movzbl (%rax),%eax
  804082:	38 c2                	cmp    %al,%dl
  804084:	74 d9                	je     80405f <strcmp+0x12>
  804086:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80408a:	0f b6 00             	movzbl (%rax),%eax
  80408d:	0f b6 d0             	movzbl %al,%edx
  804090:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804094:	0f b6 00             	movzbl (%rax),%eax
  804097:	0f b6 c0             	movzbl %al,%eax
  80409a:	29 c2                	sub    %eax,%edx
  80409c:	89 d0                	mov    %edx,%eax
  80409e:	c9                   	leaveq 
  80409f:	c3                   	retq   

00000000008040a0 <strncmp>:
  8040a0:	55                   	push   %rbp
  8040a1:	48 89 e5             	mov    %rsp,%rbp
  8040a4:	48 83 ec 18          	sub    $0x18,%rsp
  8040a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040ac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8040b0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8040b4:	eb 0f                	jmp    8040c5 <strncmp+0x25>
  8040b6:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8040bb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8040c0:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8040c5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8040ca:	74 1d                	je     8040e9 <strncmp+0x49>
  8040cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040d0:	0f b6 00             	movzbl (%rax),%eax
  8040d3:	84 c0                	test   %al,%al
  8040d5:	74 12                	je     8040e9 <strncmp+0x49>
  8040d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040db:	0f b6 10             	movzbl (%rax),%edx
  8040de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040e2:	0f b6 00             	movzbl (%rax),%eax
  8040e5:	38 c2                	cmp    %al,%dl
  8040e7:	74 cd                	je     8040b6 <strncmp+0x16>
  8040e9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8040ee:	75 07                	jne    8040f7 <strncmp+0x57>
  8040f0:	b8 00 00 00 00       	mov    $0x0,%eax
  8040f5:	eb 18                	jmp    80410f <strncmp+0x6f>
  8040f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040fb:	0f b6 00             	movzbl (%rax),%eax
  8040fe:	0f b6 d0             	movzbl %al,%edx
  804101:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804105:	0f b6 00             	movzbl (%rax),%eax
  804108:	0f b6 c0             	movzbl %al,%eax
  80410b:	29 c2                	sub    %eax,%edx
  80410d:	89 d0                	mov    %edx,%eax
  80410f:	c9                   	leaveq 
  804110:	c3                   	retq   

0000000000804111 <strchr>:
  804111:	55                   	push   %rbp
  804112:	48 89 e5             	mov    %rsp,%rbp
  804115:	48 83 ec 0c          	sub    $0xc,%rsp
  804119:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80411d:	89 f0                	mov    %esi,%eax
  80411f:	88 45 f4             	mov    %al,-0xc(%rbp)
  804122:	eb 17                	jmp    80413b <strchr+0x2a>
  804124:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804128:	0f b6 00             	movzbl (%rax),%eax
  80412b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80412e:	75 06                	jne    804136 <strchr+0x25>
  804130:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804134:	eb 15                	jmp    80414b <strchr+0x3a>
  804136:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80413b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80413f:	0f b6 00             	movzbl (%rax),%eax
  804142:	84 c0                	test   %al,%al
  804144:	75 de                	jne    804124 <strchr+0x13>
  804146:	b8 00 00 00 00       	mov    $0x0,%eax
  80414b:	c9                   	leaveq 
  80414c:	c3                   	retq   

000000000080414d <strfind>:
  80414d:	55                   	push   %rbp
  80414e:	48 89 e5             	mov    %rsp,%rbp
  804151:	48 83 ec 0c          	sub    $0xc,%rsp
  804155:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804159:	89 f0                	mov    %esi,%eax
  80415b:	88 45 f4             	mov    %al,-0xc(%rbp)
  80415e:	eb 13                	jmp    804173 <strfind+0x26>
  804160:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804164:	0f b6 00             	movzbl (%rax),%eax
  804167:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80416a:	75 02                	jne    80416e <strfind+0x21>
  80416c:	eb 10                	jmp    80417e <strfind+0x31>
  80416e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804173:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804177:	0f b6 00             	movzbl (%rax),%eax
  80417a:	84 c0                	test   %al,%al
  80417c:	75 e2                	jne    804160 <strfind+0x13>
  80417e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804182:	c9                   	leaveq 
  804183:	c3                   	retq   

0000000000804184 <memset>:
  804184:	55                   	push   %rbp
  804185:	48 89 e5             	mov    %rsp,%rbp
  804188:	48 83 ec 18          	sub    $0x18,%rsp
  80418c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804190:	89 75 f4             	mov    %esi,-0xc(%rbp)
  804193:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804197:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80419c:	75 06                	jne    8041a4 <memset+0x20>
  80419e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041a2:	eb 69                	jmp    80420d <memset+0x89>
  8041a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041a8:	83 e0 03             	and    $0x3,%eax
  8041ab:	48 85 c0             	test   %rax,%rax
  8041ae:	75 48                	jne    8041f8 <memset+0x74>
  8041b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041b4:	83 e0 03             	and    $0x3,%eax
  8041b7:	48 85 c0             	test   %rax,%rax
  8041ba:	75 3c                	jne    8041f8 <memset+0x74>
  8041bc:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8041c3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8041c6:	c1 e0 18             	shl    $0x18,%eax
  8041c9:	89 c2                	mov    %eax,%edx
  8041cb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8041ce:	c1 e0 10             	shl    $0x10,%eax
  8041d1:	09 c2                	or     %eax,%edx
  8041d3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8041d6:	c1 e0 08             	shl    $0x8,%eax
  8041d9:	09 d0                	or     %edx,%eax
  8041db:	09 45 f4             	or     %eax,-0xc(%rbp)
  8041de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041e2:	48 c1 e8 02          	shr    $0x2,%rax
  8041e6:	48 89 c1             	mov    %rax,%rcx
  8041e9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8041ed:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8041f0:	48 89 d7             	mov    %rdx,%rdi
  8041f3:	fc                   	cld    
  8041f4:	f3 ab                	rep stos %eax,%es:(%rdi)
  8041f6:	eb 11                	jmp    804209 <memset+0x85>
  8041f8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8041fc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8041ff:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804203:	48 89 d7             	mov    %rdx,%rdi
  804206:	fc                   	cld    
  804207:	f3 aa                	rep stos %al,%es:(%rdi)
  804209:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80420d:	c9                   	leaveq 
  80420e:	c3                   	retq   

000000000080420f <memmove>:
  80420f:	55                   	push   %rbp
  804210:	48 89 e5             	mov    %rsp,%rbp
  804213:	48 83 ec 28          	sub    $0x28,%rsp
  804217:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80421b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80421f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804223:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804227:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80422b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80422f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804233:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804237:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80423b:	0f 83 88 00 00 00    	jae    8042c9 <memmove+0xba>
  804241:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804245:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804249:	48 01 d0             	add    %rdx,%rax
  80424c:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  804250:	76 77                	jbe    8042c9 <memmove+0xba>
  804252:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804256:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80425a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80425e:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  804262:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804266:	83 e0 03             	and    $0x3,%eax
  804269:	48 85 c0             	test   %rax,%rax
  80426c:	75 3b                	jne    8042a9 <memmove+0x9a>
  80426e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804272:	83 e0 03             	and    $0x3,%eax
  804275:	48 85 c0             	test   %rax,%rax
  804278:	75 2f                	jne    8042a9 <memmove+0x9a>
  80427a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80427e:	83 e0 03             	and    $0x3,%eax
  804281:	48 85 c0             	test   %rax,%rax
  804284:	75 23                	jne    8042a9 <memmove+0x9a>
  804286:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80428a:	48 83 e8 04          	sub    $0x4,%rax
  80428e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804292:	48 83 ea 04          	sub    $0x4,%rdx
  804296:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80429a:	48 c1 e9 02          	shr    $0x2,%rcx
  80429e:	48 89 c7             	mov    %rax,%rdi
  8042a1:	48 89 d6             	mov    %rdx,%rsi
  8042a4:	fd                   	std    
  8042a5:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8042a7:	eb 1d                	jmp    8042c6 <memmove+0xb7>
  8042a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042ad:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8042b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042b5:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8042b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042bd:	48 89 d7             	mov    %rdx,%rdi
  8042c0:	48 89 c1             	mov    %rax,%rcx
  8042c3:	fd                   	std    
  8042c4:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8042c6:	fc                   	cld    
  8042c7:	eb 57                	jmp    804320 <memmove+0x111>
  8042c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042cd:	83 e0 03             	and    $0x3,%eax
  8042d0:	48 85 c0             	test   %rax,%rax
  8042d3:	75 36                	jne    80430b <memmove+0xfc>
  8042d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042d9:	83 e0 03             	and    $0x3,%eax
  8042dc:	48 85 c0             	test   %rax,%rax
  8042df:	75 2a                	jne    80430b <memmove+0xfc>
  8042e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042e5:	83 e0 03             	and    $0x3,%eax
  8042e8:	48 85 c0             	test   %rax,%rax
  8042eb:	75 1e                	jne    80430b <memmove+0xfc>
  8042ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042f1:	48 c1 e8 02          	shr    $0x2,%rax
  8042f5:	48 89 c1             	mov    %rax,%rcx
  8042f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042fc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804300:	48 89 c7             	mov    %rax,%rdi
  804303:	48 89 d6             	mov    %rdx,%rsi
  804306:	fc                   	cld    
  804307:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  804309:	eb 15                	jmp    804320 <memmove+0x111>
  80430b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80430f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804313:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  804317:	48 89 c7             	mov    %rax,%rdi
  80431a:	48 89 d6             	mov    %rdx,%rsi
  80431d:	fc                   	cld    
  80431e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  804320:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804324:	c9                   	leaveq 
  804325:	c3                   	retq   

0000000000804326 <memcpy>:
  804326:	55                   	push   %rbp
  804327:	48 89 e5             	mov    %rsp,%rbp
  80432a:	48 83 ec 18          	sub    $0x18,%rsp
  80432e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804332:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804336:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80433a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80433e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  804342:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804346:	48 89 ce             	mov    %rcx,%rsi
  804349:	48 89 c7             	mov    %rax,%rdi
  80434c:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  804353:	00 00 00 
  804356:	ff d0                	callq  *%rax
  804358:	c9                   	leaveq 
  804359:	c3                   	retq   

000000000080435a <memcmp>:
  80435a:	55                   	push   %rbp
  80435b:	48 89 e5             	mov    %rsp,%rbp
  80435e:	48 83 ec 28          	sub    $0x28,%rsp
  804362:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804366:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80436a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80436e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804372:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804376:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80437a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80437e:	eb 36                	jmp    8043b6 <memcmp+0x5c>
  804380:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804384:	0f b6 10             	movzbl (%rax),%edx
  804387:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80438b:	0f b6 00             	movzbl (%rax),%eax
  80438e:	38 c2                	cmp    %al,%dl
  804390:	74 1a                	je     8043ac <memcmp+0x52>
  804392:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804396:	0f b6 00             	movzbl (%rax),%eax
  804399:	0f b6 d0             	movzbl %al,%edx
  80439c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043a0:	0f b6 00             	movzbl (%rax),%eax
  8043a3:	0f b6 c0             	movzbl %al,%eax
  8043a6:	29 c2                	sub    %eax,%edx
  8043a8:	89 d0                	mov    %edx,%eax
  8043aa:	eb 20                	jmp    8043cc <memcmp+0x72>
  8043ac:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8043b1:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8043b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043ba:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8043be:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8043c2:	48 85 c0             	test   %rax,%rax
  8043c5:	75 b9                	jne    804380 <memcmp+0x26>
  8043c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8043cc:	c9                   	leaveq 
  8043cd:	c3                   	retq   

00000000008043ce <memfind>:
  8043ce:	55                   	push   %rbp
  8043cf:	48 89 e5             	mov    %rsp,%rbp
  8043d2:	48 83 ec 28          	sub    $0x28,%rsp
  8043d6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8043da:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8043dd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8043e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043e5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8043e9:	48 01 d0             	add    %rdx,%rax
  8043ec:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8043f0:	eb 15                	jmp    804407 <memfind+0x39>
  8043f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043f6:	0f b6 10             	movzbl (%rax),%edx
  8043f9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8043fc:	38 c2                	cmp    %al,%dl
  8043fe:	75 02                	jne    804402 <memfind+0x34>
  804400:	eb 0f                	jmp    804411 <memfind+0x43>
  804402:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  804407:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80440b:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80440f:	72 e1                	jb     8043f2 <memfind+0x24>
  804411:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804415:	c9                   	leaveq 
  804416:	c3                   	retq   

0000000000804417 <strtol>:
  804417:	55                   	push   %rbp
  804418:	48 89 e5             	mov    %rsp,%rbp
  80441b:	48 83 ec 34          	sub    $0x34,%rsp
  80441f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804423:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804427:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80442a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804431:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  804438:	00 
  804439:	eb 05                	jmp    804440 <strtol+0x29>
  80443b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  804440:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804444:	0f b6 00             	movzbl (%rax),%eax
  804447:	3c 20                	cmp    $0x20,%al
  804449:	74 f0                	je     80443b <strtol+0x24>
  80444b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80444f:	0f b6 00             	movzbl (%rax),%eax
  804452:	3c 09                	cmp    $0x9,%al
  804454:	74 e5                	je     80443b <strtol+0x24>
  804456:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80445a:	0f b6 00             	movzbl (%rax),%eax
  80445d:	3c 2b                	cmp    $0x2b,%al
  80445f:	75 07                	jne    804468 <strtol+0x51>
  804461:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  804466:	eb 17                	jmp    80447f <strtol+0x68>
  804468:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80446c:	0f b6 00             	movzbl (%rax),%eax
  80446f:	3c 2d                	cmp    $0x2d,%al
  804471:	75 0c                	jne    80447f <strtol+0x68>
  804473:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  804478:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80447f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  804483:	74 06                	je     80448b <strtol+0x74>
  804485:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  804489:	75 28                	jne    8044b3 <strtol+0x9c>
  80448b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80448f:	0f b6 00             	movzbl (%rax),%eax
  804492:	3c 30                	cmp    $0x30,%al
  804494:	75 1d                	jne    8044b3 <strtol+0x9c>
  804496:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80449a:	48 83 c0 01          	add    $0x1,%rax
  80449e:	0f b6 00             	movzbl (%rax),%eax
  8044a1:	3c 78                	cmp    $0x78,%al
  8044a3:	75 0e                	jne    8044b3 <strtol+0x9c>
  8044a5:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8044aa:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8044b1:	eb 2c                	jmp    8044df <strtol+0xc8>
  8044b3:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8044b7:	75 19                	jne    8044d2 <strtol+0xbb>
  8044b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044bd:	0f b6 00             	movzbl (%rax),%eax
  8044c0:	3c 30                	cmp    $0x30,%al
  8044c2:	75 0e                	jne    8044d2 <strtol+0xbb>
  8044c4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8044c9:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8044d0:	eb 0d                	jmp    8044df <strtol+0xc8>
  8044d2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8044d6:	75 07                	jne    8044df <strtol+0xc8>
  8044d8:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8044df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044e3:	0f b6 00             	movzbl (%rax),%eax
  8044e6:	3c 2f                	cmp    $0x2f,%al
  8044e8:	7e 1d                	jle    804507 <strtol+0xf0>
  8044ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044ee:	0f b6 00             	movzbl (%rax),%eax
  8044f1:	3c 39                	cmp    $0x39,%al
  8044f3:	7f 12                	jg     804507 <strtol+0xf0>
  8044f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044f9:	0f b6 00             	movzbl (%rax),%eax
  8044fc:	0f be c0             	movsbl %al,%eax
  8044ff:	83 e8 30             	sub    $0x30,%eax
  804502:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804505:	eb 4e                	jmp    804555 <strtol+0x13e>
  804507:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80450b:	0f b6 00             	movzbl (%rax),%eax
  80450e:	3c 60                	cmp    $0x60,%al
  804510:	7e 1d                	jle    80452f <strtol+0x118>
  804512:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804516:	0f b6 00             	movzbl (%rax),%eax
  804519:	3c 7a                	cmp    $0x7a,%al
  80451b:	7f 12                	jg     80452f <strtol+0x118>
  80451d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804521:	0f b6 00             	movzbl (%rax),%eax
  804524:	0f be c0             	movsbl %al,%eax
  804527:	83 e8 57             	sub    $0x57,%eax
  80452a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80452d:	eb 26                	jmp    804555 <strtol+0x13e>
  80452f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804533:	0f b6 00             	movzbl (%rax),%eax
  804536:	3c 40                	cmp    $0x40,%al
  804538:	7e 48                	jle    804582 <strtol+0x16b>
  80453a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80453e:	0f b6 00             	movzbl (%rax),%eax
  804541:	3c 5a                	cmp    $0x5a,%al
  804543:	7f 3d                	jg     804582 <strtol+0x16b>
  804545:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804549:	0f b6 00             	movzbl (%rax),%eax
  80454c:	0f be c0             	movsbl %al,%eax
  80454f:	83 e8 37             	sub    $0x37,%eax
  804552:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804555:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804558:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80455b:	7c 02                	jl     80455f <strtol+0x148>
  80455d:	eb 23                	jmp    804582 <strtol+0x16b>
  80455f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  804564:	8b 45 cc             	mov    -0x34(%rbp),%eax
  804567:	48 98                	cltq   
  804569:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80456e:	48 89 c2             	mov    %rax,%rdx
  804571:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804574:	48 98                	cltq   
  804576:	48 01 d0             	add    %rdx,%rax
  804579:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80457d:	e9 5d ff ff ff       	jmpq   8044df <strtol+0xc8>
  804582:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  804587:	74 0b                	je     804594 <strtol+0x17d>
  804589:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80458d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  804591:	48 89 10             	mov    %rdx,(%rax)
  804594:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804598:	74 09                	je     8045a3 <strtol+0x18c>
  80459a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80459e:	48 f7 d8             	neg    %rax
  8045a1:	eb 04                	jmp    8045a7 <strtol+0x190>
  8045a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045a7:	c9                   	leaveq 
  8045a8:	c3                   	retq   

00000000008045a9 <strstr>:
  8045a9:	55                   	push   %rbp
  8045aa:	48 89 e5             	mov    %rsp,%rbp
  8045ad:	48 83 ec 30          	sub    $0x30,%rsp
  8045b1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8045b5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8045b9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045bd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8045c1:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8045c5:	0f b6 00             	movzbl (%rax),%eax
  8045c8:	88 45 ff             	mov    %al,-0x1(%rbp)
  8045cb:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8045cf:	75 06                	jne    8045d7 <strstr+0x2e>
  8045d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045d5:	eb 6b                	jmp    804642 <strstr+0x99>
  8045d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045db:	48 89 c7             	mov    %rax,%rdi
  8045de:	48 b8 7f 3e 80 00 00 	movabs $0x803e7f,%rax
  8045e5:	00 00 00 
  8045e8:	ff d0                	callq  *%rax
  8045ea:	48 98                	cltq   
  8045ec:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045f4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8045f8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8045fc:	0f b6 00             	movzbl (%rax),%eax
  8045ff:	88 45 ef             	mov    %al,-0x11(%rbp)
  804602:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  804606:	75 07                	jne    80460f <strstr+0x66>
  804608:	b8 00 00 00 00       	mov    $0x0,%eax
  80460d:	eb 33                	jmp    804642 <strstr+0x99>
  80460f:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  804613:	3a 45 ff             	cmp    -0x1(%rbp),%al
  804616:	75 d8                	jne    8045f0 <strstr+0x47>
  804618:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80461c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  804620:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804624:	48 89 ce             	mov    %rcx,%rsi
  804627:	48 89 c7             	mov    %rax,%rdi
  80462a:	48 b8 a0 40 80 00 00 	movabs $0x8040a0,%rax
  804631:	00 00 00 
  804634:	ff d0                	callq  *%rax
  804636:	85 c0                	test   %eax,%eax
  804638:	75 b6                	jne    8045f0 <strstr+0x47>
  80463a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80463e:	48 83 e8 01          	sub    $0x1,%rax
  804642:	c9                   	leaveq 
  804643:	c3                   	retq   

0000000000804644 <syscall>:
  804644:	55                   	push   %rbp
  804645:	48 89 e5             	mov    %rsp,%rbp
  804648:	53                   	push   %rbx
  804649:	48 83 ec 48          	sub    $0x48,%rsp
  80464d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804650:	89 75 d8             	mov    %esi,-0x28(%rbp)
  804653:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  804657:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80465b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80465f:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  804663:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804666:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80466a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80466e:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  804672:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  804676:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80467a:	4c 89 c3             	mov    %r8,%rbx
  80467d:	cd 30                	int    $0x30
  80467f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804683:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  804687:	74 3e                	je     8046c7 <syscall+0x83>
  804689:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80468e:	7e 37                	jle    8046c7 <syscall+0x83>
  804690:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804694:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804697:	49 89 d0             	mov    %rdx,%r8
  80469a:	89 c1                	mov    %eax,%ecx
  80469c:	48 ba 48 7c 80 00 00 	movabs $0x807c48,%rdx
  8046a3:	00 00 00 
  8046a6:	be 24 00 00 00       	mov    $0x24,%esi
  8046ab:	48 bf 65 7c 80 00 00 	movabs $0x807c65,%rdi
  8046b2:	00 00 00 
  8046b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8046ba:	49 b9 fd 30 80 00 00 	movabs $0x8030fd,%r9
  8046c1:	00 00 00 
  8046c4:	41 ff d1             	callq  *%r9
  8046c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8046cb:	48 83 c4 48          	add    $0x48,%rsp
  8046cf:	5b                   	pop    %rbx
  8046d0:	5d                   	pop    %rbp
  8046d1:	c3                   	retq   

00000000008046d2 <sys_cputs>:
  8046d2:	55                   	push   %rbp
  8046d3:	48 89 e5             	mov    %rsp,%rbp
  8046d6:	48 83 ec 20          	sub    $0x20,%rsp
  8046da:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8046de:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8046e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046e6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8046ea:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8046f1:	00 
  8046f2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8046f8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8046fe:	48 89 d1             	mov    %rdx,%rcx
  804701:	48 89 c2             	mov    %rax,%rdx
  804704:	be 00 00 00 00       	mov    $0x0,%esi
  804709:	bf 00 00 00 00       	mov    $0x0,%edi
  80470e:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804715:	00 00 00 
  804718:	ff d0                	callq  *%rax
  80471a:	c9                   	leaveq 
  80471b:	c3                   	retq   

000000000080471c <sys_cgetc>:
  80471c:	55                   	push   %rbp
  80471d:	48 89 e5             	mov    %rsp,%rbp
  804720:	48 83 ec 10          	sub    $0x10,%rsp
  804724:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80472b:	00 
  80472c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804732:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804738:	b9 00 00 00 00       	mov    $0x0,%ecx
  80473d:	ba 00 00 00 00       	mov    $0x0,%edx
  804742:	be 00 00 00 00       	mov    $0x0,%esi
  804747:	bf 01 00 00 00       	mov    $0x1,%edi
  80474c:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804753:	00 00 00 
  804756:	ff d0                	callq  *%rax
  804758:	c9                   	leaveq 
  804759:	c3                   	retq   

000000000080475a <sys_env_destroy>:
  80475a:	55                   	push   %rbp
  80475b:	48 89 e5             	mov    %rsp,%rbp
  80475e:	48 83 ec 10          	sub    $0x10,%rsp
  804762:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804765:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804768:	48 98                	cltq   
  80476a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804771:	00 
  804772:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804778:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80477e:	b9 00 00 00 00       	mov    $0x0,%ecx
  804783:	48 89 c2             	mov    %rax,%rdx
  804786:	be 01 00 00 00       	mov    $0x1,%esi
  80478b:	bf 03 00 00 00       	mov    $0x3,%edi
  804790:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804797:	00 00 00 
  80479a:	ff d0                	callq  *%rax
  80479c:	c9                   	leaveq 
  80479d:	c3                   	retq   

000000000080479e <sys_getenvid>:
  80479e:	55                   	push   %rbp
  80479f:	48 89 e5             	mov    %rsp,%rbp
  8047a2:	48 83 ec 10          	sub    $0x10,%rsp
  8047a6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8047ad:	00 
  8047ae:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8047b4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8047ba:	b9 00 00 00 00       	mov    $0x0,%ecx
  8047bf:	ba 00 00 00 00       	mov    $0x0,%edx
  8047c4:	be 00 00 00 00       	mov    $0x0,%esi
  8047c9:	bf 02 00 00 00       	mov    $0x2,%edi
  8047ce:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  8047d5:	00 00 00 
  8047d8:	ff d0                	callq  *%rax
  8047da:	c9                   	leaveq 
  8047db:	c3                   	retq   

00000000008047dc <sys_yield>:
  8047dc:	55                   	push   %rbp
  8047dd:	48 89 e5             	mov    %rsp,%rbp
  8047e0:	48 83 ec 10          	sub    $0x10,%rsp
  8047e4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8047eb:	00 
  8047ec:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8047f2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8047f8:	b9 00 00 00 00       	mov    $0x0,%ecx
  8047fd:	ba 00 00 00 00       	mov    $0x0,%edx
  804802:	be 00 00 00 00       	mov    $0x0,%esi
  804807:	bf 0b 00 00 00       	mov    $0xb,%edi
  80480c:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804813:	00 00 00 
  804816:	ff d0                	callq  *%rax
  804818:	c9                   	leaveq 
  804819:	c3                   	retq   

000000000080481a <sys_page_alloc>:
  80481a:	55                   	push   %rbp
  80481b:	48 89 e5             	mov    %rsp,%rbp
  80481e:	48 83 ec 20          	sub    $0x20,%rsp
  804822:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804825:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804829:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80482c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80482f:	48 63 c8             	movslq %eax,%rcx
  804832:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804836:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804839:	48 98                	cltq   
  80483b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804842:	00 
  804843:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804849:	49 89 c8             	mov    %rcx,%r8
  80484c:	48 89 d1             	mov    %rdx,%rcx
  80484f:	48 89 c2             	mov    %rax,%rdx
  804852:	be 01 00 00 00       	mov    $0x1,%esi
  804857:	bf 04 00 00 00       	mov    $0x4,%edi
  80485c:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804863:	00 00 00 
  804866:	ff d0                	callq  *%rax
  804868:	c9                   	leaveq 
  804869:	c3                   	retq   

000000000080486a <sys_page_map>:
  80486a:	55                   	push   %rbp
  80486b:	48 89 e5             	mov    %rsp,%rbp
  80486e:	48 83 ec 30          	sub    $0x30,%rsp
  804872:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804875:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804879:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80487c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  804880:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  804884:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804887:	48 63 c8             	movslq %eax,%rcx
  80488a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80488e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804891:	48 63 f0             	movslq %eax,%rsi
  804894:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804898:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80489b:	48 98                	cltq   
  80489d:	48 89 0c 24          	mov    %rcx,(%rsp)
  8048a1:	49 89 f9             	mov    %rdi,%r9
  8048a4:	49 89 f0             	mov    %rsi,%r8
  8048a7:	48 89 d1             	mov    %rdx,%rcx
  8048aa:	48 89 c2             	mov    %rax,%rdx
  8048ad:	be 01 00 00 00       	mov    $0x1,%esi
  8048b2:	bf 05 00 00 00       	mov    $0x5,%edi
  8048b7:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  8048be:	00 00 00 
  8048c1:	ff d0                	callq  *%rax
  8048c3:	c9                   	leaveq 
  8048c4:	c3                   	retq   

00000000008048c5 <sys_page_unmap>:
  8048c5:	55                   	push   %rbp
  8048c6:	48 89 e5             	mov    %rsp,%rbp
  8048c9:	48 83 ec 20          	sub    $0x20,%rsp
  8048cd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8048d0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8048d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8048d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048db:	48 98                	cltq   
  8048dd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8048e4:	00 
  8048e5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8048eb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8048f1:	48 89 d1             	mov    %rdx,%rcx
  8048f4:	48 89 c2             	mov    %rax,%rdx
  8048f7:	be 01 00 00 00       	mov    $0x1,%esi
  8048fc:	bf 06 00 00 00       	mov    $0x6,%edi
  804901:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804908:	00 00 00 
  80490b:	ff d0                	callq  *%rax
  80490d:	c9                   	leaveq 
  80490e:	c3                   	retq   

000000000080490f <sys_env_set_status>:
  80490f:	55                   	push   %rbp
  804910:	48 89 e5             	mov    %rsp,%rbp
  804913:	48 83 ec 10          	sub    $0x10,%rsp
  804917:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80491a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80491d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804920:	48 63 d0             	movslq %eax,%rdx
  804923:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804926:	48 98                	cltq   
  804928:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80492f:	00 
  804930:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804936:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80493c:	48 89 d1             	mov    %rdx,%rcx
  80493f:	48 89 c2             	mov    %rax,%rdx
  804942:	be 01 00 00 00       	mov    $0x1,%esi
  804947:	bf 08 00 00 00       	mov    $0x8,%edi
  80494c:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804953:	00 00 00 
  804956:	ff d0                	callq  *%rax
  804958:	c9                   	leaveq 
  804959:	c3                   	retq   

000000000080495a <sys_env_set_trapframe>:
  80495a:	55                   	push   %rbp
  80495b:	48 89 e5             	mov    %rsp,%rbp
  80495e:	48 83 ec 20          	sub    $0x20,%rsp
  804962:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804965:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804969:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80496d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804970:	48 98                	cltq   
  804972:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804979:	00 
  80497a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804980:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804986:	48 89 d1             	mov    %rdx,%rcx
  804989:	48 89 c2             	mov    %rax,%rdx
  80498c:	be 01 00 00 00       	mov    $0x1,%esi
  804991:	bf 09 00 00 00       	mov    $0x9,%edi
  804996:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  80499d:	00 00 00 
  8049a0:	ff d0                	callq  *%rax
  8049a2:	c9                   	leaveq 
  8049a3:	c3                   	retq   

00000000008049a4 <sys_env_set_pgfault_upcall>:
  8049a4:	55                   	push   %rbp
  8049a5:	48 89 e5             	mov    %rsp,%rbp
  8049a8:	48 83 ec 20          	sub    $0x20,%rsp
  8049ac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8049af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8049b3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8049b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049ba:	48 98                	cltq   
  8049bc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8049c3:	00 
  8049c4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8049ca:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8049d0:	48 89 d1             	mov    %rdx,%rcx
  8049d3:	48 89 c2             	mov    %rax,%rdx
  8049d6:	be 01 00 00 00       	mov    $0x1,%esi
  8049db:	bf 0a 00 00 00       	mov    $0xa,%edi
  8049e0:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  8049e7:	00 00 00 
  8049ea:	ff d0                	callq  *%rax
  8049ec:	c9                   	leaveq 
  8049ed:	c3                   	retq   

00000000008049ee <sys_ipc_try_send>:
  8049ee:	55                   	push   %rbp
  8049ef:	48 89 e5             	mov    %rsp,%rbp
  8049f2:	48 83 ec 20          	sub    $0x20,%rsp
  8049f6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8049f9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8049fd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804a01:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  804a04:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a07:	48 63 f0             	movslq %eax,%rsi
  804a0a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804a0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a11:	48 98                	cltq   
  804a13:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a17:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804a1e:	00 
  804a1f:	49 89 f1             	mov    %rsi,%r9
  804a22:	49 89 c8             	mov    %rcx,%r8
  804a25:	48 89 d1             	mov    %rdx,%rcx
  804a28:	48 89 c2             	mov    %rax,%rdx
  804a2b:	be 00 00 00 00       	mov    $0x0,%esi
  804a30:	bf 0c 00 00 00       	mov    $0xc,%edi
  804a35:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804a3c:	00 00 00 
  804a3f:	ff d0                	callq  *%rax
  804a41:	c9                   	leaveq 
  804a42:	c3                   	retq   

0000000000804a43 <sys_ipc_recv>:
  804a43:	55                   	push   %rbp
  804a44:	48 89 e5             	mov    %rsp,%rbp
  804a47:	48 83 ec 10          	sub    $0x10,%rsp
  804a4b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804a4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a53:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804a5a:	00 
  804a5b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804a61:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804a67:	b9 00 00 00 00       	mov    $0x0,%ecx
  804a6c:	48 89 c2             	mov    %rax,%rdx
  804a6f:	be 01 00 00 00       	mov    $0x1,%esi
  804a74:	bf 0d 00 00 00       	mov    $0xd,%edi
  804a79:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804a80:	00 00 00 
  804a83:	ff d0                	callq  *%rax
  804a85:	c9                   	leaveq 
  804a86:	c3                   	retq   

0000000000804a87 <sys_time_msec>:
  804a87:	55                   	push   %rbp
  804a88:	48 89 e5             	mov    %rsp,%rbp
  804a8b:	48 83 ec 10          	sub    $0x10,%rsp
  804a8f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804a96:	00 
  804a97:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804a9d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804aa3:	b9 00 00 00 00       	mov    $0x0,%ecx
  804aa8:	ba 00 00 00 00       	mov    $0x0,%edx
  804aad:	be 00 00 00 00       	mov    $0x0,%esi
  804ab2:	bf 0e 00 00 00       	mov    $0xe,%edi
  804ab7:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804abe:	00 00 00 
  804ac1:	ff d0                	callq  *%rax
  804ac3:	c9                   	leaveq 
  804ac4:	c3                   	retq   

0000000000804ac5 <sys_net_transmit>:
  804ac5:	55                   	push   %rbp
  804ac6:	48 89 e5             	mov    %rsp,%rbp
  804ac9:	48 83 ec 20          	sub    $0x20,%rsp
  804acd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804ad1:	89 75 f4             	mov    %esi,-0xc(%rbp)
  804ad4:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804ad7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804adb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804ae2:	00 
  804ae3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804ae9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804aef:	48 89 d1             	mov    %rdx,%rcx
  804af2:	48 89 c2             	mov    %rax,%rdx
  804af5:	be 00 00 00 00       	mov    $0x0,%esi
  804afa:	bf 0f 00 00 00       	mov    $0xf,%edi
  804aff:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804b06:	00 00 00 
  804b09:	ff d0                	callq  *%rax
  804b0b:	c9                   	leaveq 
  804b0c:	c3                   	retq   

0000000000804b0d <sys_net_receive>:
  804b0d:	55                   	push   %rbp
  804b0e:	48 89 e5             	mov    %rsp,%rbp
  804b11:	48 83 ec 20          	sub    $0x20,%rsp
  804b15:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804b19:	89 75 f4             	mov    %esi,-0xc(%rbp)
  804b1c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804b1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b23:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804b2a:	00 
  804b2b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804b31:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804b37:	48 89 d1             	mov    %rdx,%rcx
  804b3a:	48 89 c2             	mov    %rax,%rdx
  804b3d:	be 00 00 00 00       	mov    $0x0,%esi
  804b42:	bf 10 00 00 00       	mov    $0x10,%edi
  804b47:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804b4e:	00 00 00 
  804b51:	ff d0                	callq  *%rax
  804b53:	c9                   	leaveq 
  804b54:	c3                   	retq   

0000000000804b55 <sys_ept_map>:
  804b55:	55                   	push   %rbp
  804b56:	48 89 e5             	mov    %rsp,%rbp
  804b59:	48 83 ec 30          	sub    $0x30,%rsp
  804b5d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804b60:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804b64:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804b67:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  804b6b:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  804b6f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804b72:	48 63 c8             	movslq %eax,%rcx
  804b75:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  804b79:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804b7c:	48 63 f0             	movslq %eax,%rsi
  804b7f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804b83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b86:	48 98                	cltq   
  804b88:	48 89 0c 24          	mov    %rcx,(%rsp)
  804b8c:	49 89 f9             	mov    %rdi,%r9
  804b8f:	49 89 f0             	mov    %rsi,%r8
  804b92:	48 89 d1             	mov    %rdx,%rcx
  804b95:	48 89 c2             	mov    %rax,%rdx
  804b98:	be 00 00 00 00       	mov    $0x0,%esi
  804b9d:	bf 11 00 00 00       	mov    $0x11,%edi
  804ba2:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804ba9:	00 00 00 
  804bac:	ff d0                	callq  *%rax
  804bae:	c9                   	leaveq 
  804baf:	c3                   	retq   

0000000000804bb0 <sys_env_mkguest>:
  804bb0:	55                   	push   %rbp
  804bb1:	48 89 e5             	mov    %rsp,%rbp
  804bb4:	48 83 ec 20          	sub    $0x20,%rsp
  804bb8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804bbc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804bc0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804bc4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bc8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804bcf:	00 
  804bd0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804bd6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804bdc:	48 89 d1             	mov    %rdx,%rcx
  804bdf:	48 89 c2             	mov    %rax,%rdx
  804be2:	be 00 00 00 00       	mov    $0x0,%esi
  804be7:	bf 12 00 00 00       	mov    $0x12,%edi
  804bec:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804bf3:	00 00 00 
  804bf6:	ff d0                	callq  *%rax
  804bf8:	c9                   	leaveq 
  804bf9:	c3                   	retq   

0000000000804bfa <sys_vmx_list_vms>:
  804bfa:	55                   	push   %rbp
  804bfb:	48 89 e5             	mov    %rsp,%rbp
  804bfe:	48 83 ec 10          	sub    $0x10,%rsp
  804c02:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804c09:	00 
  804c0a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804c10:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804c16:	b9 00 00 00 00       	mov    $0x0,%ecx
  804c1b:	ba 00 00 00 00       	mov    $0x0,%edx
  804c20:	be 00 00 00 00       	mov    $0x0,%esi
  804c25:	bf 13 00 00 00       	mov    $0x13,%edi
  804c2a:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804c31:	00 00 00 
  804c34:	ff d0                	callq  *%rax
  804c36:	c9                   	leaveq 
  804c37:	c3                   	retq   

0000000000804c38 <sys_vmx_sel_resume>:
  804c38:	55                   	push   %rbp
  804c39:	48 89 e5             	mov    %rsp,%rbp
  804c3c:	48 83 ec 10          	sub    $0x10,%rsp
  804c40:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804c43:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c46:	48 98                	cltq   
  804c48:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804c4f:	00 
  804c50:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804c56:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804c5c:	b9 00 00 00 00       	mov    $0x0,%ecx
  804c61:	48 89 c2             	mov    %rax,%rdx
  804c64:	be 00 00 00 00       	mov    $0x0,%esi
  804c69:	bf 14 00 00 00       	mov    $0x14,%edi
  804c6e:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804c75:	00 00 00 
  804c78:	ff d0                	callq  *%rax
  804c7a:	c9                   	leaveq 
  804c7b:	c3                   	retq   

0000000000804c7c <sys_vmx_get_vmdisk_number>:
  804c7c:	55                   	push   %rbp
  804c7d:	48 89 e5             	mov    %rsp,%rbp
  804c80:	48 83 ec 10          	sub    $0x10,%rsp
  804c84:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804c8b:	00 
  804c8c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804c92:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804c98:	b9 00 00 00 00       	mov    $0x0,%ecx
  804c9d:	ba 00 00 00 00       	mov    $0x0,%edx
  804ca2:	be 00 00 00 00       	mov    $0x0,%esi
  804ca7:	bf 15 00 00 00       	mov    $0x15,%edi
  804cac:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804cb3:	00 00 00 
  804cb6:	ff d0                	callq  *%rax
  804cb8:	c9                   	leaveq 
  804cb9:	c3                   	retq   

0000000000804cba <sys_vmx_incr_vmdisk_number>:
  804cba:	55                   	push   %rbp
  804cbb:	48 89 e5             	mov    %rsp,%rbp
  804cbe:	48 83 ec 10          	sub    $0x10,%rsp
  804cc2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  804cc9:	00 
  804cca:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804cd0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804cd6:	b9 00 00 00 00       	mov    $0x0,%ecx
  804cdb:	ba 00 00 00 00       	mov    $0x0,%edx
  804ce0:	be 00 00 00 00       	mov    $0x0,%esi
  804ce5:	bf 16 00 00 00       	mov    $0x16,%edi
  804cea:	48 b8 44 46 80 00 00 	movabs $0x804644,%rax
  804cf1:	00 00 00 
  804cf4:	ff d0                	callq  *%rax
  804cf6:	c9                   	leaveq 
  804cf7:	c3                   	retq   

0000000000804cf8 <set_pgfault_handler>:
  804cf8:	55                   	push   %rbp
  804cf9:	48 89 e5             	mov    %rsp,%rbp
  804cfc:	48 83 ec 20          	sub    $0x20,%rsp
  804d00:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804d04:	48 b8 28 30 81 00 00 	movabs $0x813028,%rax
  804d0b:	00 00 00 
  804d0e:	48 8b 00             	mov    (%rax),%rax
  804d11:	48 85 c0             	test   %rax,%rax
  804d14:	75 6f                	jne    804d85 <set_pgfault_handler+0x8d>
  804d16:	ba 07 00 00 00       	mov    $0x7,%edx
  804d1b:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804d20:	bf 00 00 00 00       	mov    $0x0,%edi
  804d25:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  804d2c:	00 00 00 
  804d2f:	ff d0                	callq  *%rax
  804d31:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d34:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d38:	79 30                	jns    804d6a <set_pgfault_handler+0x72>
  804d3a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d3d:	89 c1                	mov    %eax,%ecx
  804d3f:	48 ba 78 7c 80 00 00 	movabs $0x807c78,%rdx
  804d46:	00 00 00 
  804d49:	be 22 00 00 00       	mov    $0x22,%esi
  804d4e:	48 bf 97 7c 80 00 00 	movabs $0x807c97,%rdi
  804d55:	00 00 00 
  804d58:	b8 00 00 00 00       	mov    $0x0,%eax
  804d5d:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  804d64:	00 00 00 
  804d67:	41 ff d0             	callq  *%r8
  804d6a:	48 be 98 4d 80 00 00 	movabs $0x804d98,%rsi
  804d71:	00 00 00 
  804d74:	bf 00 00 00 00       	mov    $0x0,%edi
  804d79:	48 b8 a4 49 80 00 00 	movabs $0x8049a4,%rax
  804d80:	00 00 00 
  804d83:	ff d0                	callq  *%rax
  804d85:	48 b8 28 30 81 00 00 	movabs $0x813028,%rax
  804d8c:	00 00 00 
  804d8f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804d93:	48 89 10             	mov    %rdx,(%rax)
  804d96:	c9                   	leaveq 
  804d97:	c3                   	retq   

0000000000804d98 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804d98:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804d9b:	48 a1 28 30 81 00 00 	movabs 0x813028,%rax
  804da2:	00 00 00 
call *%rax
  804da5:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804da7:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804dae:	00 08 
    movq 152(%rsp), %rax
  804db0:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804db7:	00 
    movq 136(%rsp), %rbx
  804db8:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804dbf:	00 
movq %rbx, (%rax)
  804dc0:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804dc3:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804dc7:	4c 8b 3c 24          	mov    (%rsp),%r15
  804dcb:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804dd0:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804dd5:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804dda:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804ddf:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804de4:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804de9:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804dee:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804df3:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804df8:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804dfd:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804e02:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804e07:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804e0c:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804e11:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804e15:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804e19:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804e1a:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804e1f:	c3                   	retq   

0000000000804e20 <ipc_recv>:
  804e20:	55                   	push   %rbp
  804e21:	48 89 e5             	mov    %rsp,%rbp
  804e24:	48 83 ec 30          	sub    $0x30,%rsp
  804e28:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804e2c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804e30:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804e34:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804e39:	75 0e                	jne    804e49 <ipc_recv+0x29>
  804e3b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804e42:	00 00 00 
  804e45:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804e49:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e4d:	48 89 c7             	mov    %rax,%rdi
  804e50:	48 b8 43 4a 80 00 00 	movabs $0x804a43,%rax
  804e57:	00 00 00 
  804e5a:	ff d0                	callq  *%rax
  804e5c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804e5f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e63:	79 27                	jns    804e8c <ipc_recv+0x6c>
  804e65:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804e6a:	74 0a                	je     804e76 <ipc_recv+0x56>
  804e6c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804e70:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804e76:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804e7b:	74 0a                	je     804e87 <ipc_recv+0x67>
  804e7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804e81:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804e87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e8a:	eb 53                	jmp    804edf <ipc_recv+0xbf>
  804e8c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804e91:	74 19                	je     804eac <ipc_recv+0x8c>
  804e93:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  804e9a:	00 00 00 
  804e9d:	48 8b 00             	mov    (%rax),%rax
  804ea0:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804ea6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804eaa:	89 10                	mov    %edx,(%rax)
  804eac:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804eb1:	74 19                	je     804ecc <ipc_recv+0xac>
  804eb3:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  804eba:	00 00 00 
  804ebd:	48 8b 00             	mov    (%rax),%rax
  804ec0:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804ec6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804eca:	89 10                	mov    %edx,(%rax)
  804ecc:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  804ed3:	00 00 00 
  804ed6:	48 8b 00             	mov    (%rax),%rax
  804ed9:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804edf:	c9                   	leaveq 
  804ee0:	c3                   	retq   

0000000000804ee1 <ipc_send>:
  804ee1:	55                   	push   %rbp
  804ee2:	48 89 e5             	mov    %rsp,%rbp
  804ee5:	48 83 ec 30          	sub    $0x30,%rsp
  804ee9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804eec:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804eef:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804ef3:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804ef6:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804efb:	75 10                	jne    804f0d <ipc_send+0x2c>
  804efd:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804f04:	00 00 00 
  804f07:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804f0b:	eb 0e                	jmp    804f1b <ipc_send+0x3a>
  804f0d:	eb 0c                	jmp    804f1b <ipc_send+0x3a>
  804f0f:	48 b8 dc 47 80 00 00 	movabs $0x8047dc,%rax
  804f16:	00 00 00 
  804f19:	ff d0                	callq  *%rax
  804f1b:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804f1e:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804f21:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804f25:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804f28:	89 c7                	mov    %eax,%edi
  804f2a:	48 b8 ee 49 80 00 00 	movabs $0x8049ee,%rax
  804f31:	00 00 00 
  804f34:	ff d0                	callq  *%rax
  804f36:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804f39:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804f3d:	74 d0                	je     804f0f <ipc_send+0x2e>
  804f3f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804f43:	79 30                	jns    804f75 <ipc_send+0x94>
  804f45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f48:	89 c1                	mov    %eax,%ecx
  804f4a:	48 ba a8 7c 80 00 00 	movabs $0x807ca8,%rdx
  804f51:	00 00 00 
  804f54:	be 44 00 00 00       	mov    $0x44,%esi
  804f59:	48 bf be 7c 80 00 00 	movabs $0x807cbe,%rdi
  804f60:	00 00 00 
  804f63:	b8 00 00 00 00       	mov    $0x0,%eax
  804f68:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  804f6f:	00 00 00 
  804f72:	41 ff d0             	callq  *%r8
  804f75:	c9                   	leaveq 
  804f76:	c3                   	retq   

0000000000804f77 <ipc_find_env>:
  804f77:	55                   	push   %rbp
  804f78:	48 89 e5             	mov    %rsp,%rbp
  804f7b:	48 83 ec 14          	sub    $0x14,%rsp
  804f7f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804f82:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804f89:	eb 4e                	jmp    804fd9 <ipc_find_env+0x62>
  804f8b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804f92:	00 00 00 
  804f95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f98:	48 98                	cltq   
  804f9a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804fa1:	48 01 d0             	add    %rdx,%rax
  804fa4:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804faa:	8b 00                	mov    (%rax),%eax
  804fac:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804faf:	75 24                	jne    804fd5 <ipc_find_env+0x5e>
  804fb1:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804fb8:	00 00 00 
  804fbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804fbe:	48 98                	cltq   
  804fc0:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804fc7:	48 01 d0             	add    %rdx,%rax
  804fca:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804fd0:	8b 40 08             	mov    0x8(%rax),%eax
  804fd3:	eb 12                	jmp    804fe7 <ipc_find_env+0x70>
  804fd5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804fd9:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804fe0:	7e a9                	jle    804f8b <ipc_find_env+0x14>
  804fe2:	b8 00 00 00 00       	mov    $0x0,%eax
  804fe7:	c9                   	leaveq 
  804fe8:	c3                   	retq   

0000000000804fe9 <fd2num>:
  804fe9:	55                   	push   %rbp
  804fea:	48 89 e5             	mov    %rsp,%rbp
  804fed:	48 83 ec 08          	sub    $0x8,%rsp
  804ff1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804ff5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804ff9:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  805000:	ff ff ff 
  805003:	48 01 d0             	add    %rdx,%rax
  805006:	48 c1 e8 0c          	shr    $0xc,%rax
  80500a:	c9                   	leaveq 
  80500b:	c3                   	retq   

000000000080500c <fd2data>:
  80500c:	55                   	push   %rbp
  80500d:	48 89 e5             	mov    %rsp,%rbp
  805010:	48 83 ec 08          	sub    $0x8,%rsp
  805014:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805018:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80501c:	48 89 c7             	mov    %rax,%rdi
  80501f:	48 b8 e9 4f 80 00 00 	movabs $0x804fe9,%rax
  805026:	00 00 00 
  805029:	ff d0                	callq  *%rax
  80502b:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  805031:	48 c1 e0 0c          	shl    $0xc,%rax
  805035:	c9                   	leaveq 
  805036:	c3                   	retq   

0000000000805037 <fd_alloc>:
  805037:	55                   	push   %rbp
  805038:	48 89 e5             	mov    %rsp,%rbp
  80503b:	48 83 ec 18          	sub    $0x18,%rsp
  80503f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805043:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80504a:	eb 6b                	jmp    8050b7 <fd_alloc+0x80>
  80504c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80504f:	48 98                	cltq   
  805051:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  805057:	48 c1 e0 0c          	shl    $0xc,%rax
  80505b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80505f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805063:	48 c1 e8 15          	shr    $0x15,%rax
  805067:	48 89 c2             	mov    %rax,%rdx
  80506a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  805071:	01 00 00 
  805074:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805078:	83 e0 01             	and    $0x1,%eax
  80507b:	48 85 c0             	test   %rax,%rax
  80507e:	74 21                	je     8050a1 <fd_alloc+0x6a>
  805080:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805084:	48 c1 e8 0c          	shr    $0xc,%rax
  805088:	48 89 c2             	mov    %rax,%rdx
  80508b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805092:	01 00 00 
  805095:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805099:	83 e0 01             	and    $0x1,%eax
  80509c:	48 85 c0             	test   %rax,%rax
  80509f:	75 12                	jne    8050b3 <fd_alloc+0x7c>
  8050a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8050a5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8050a9:	48 89 10             	mov    %rdx,(%rax)
  8050ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8050b1:	eb 1a                	jmp    8050cd <fd_alloc+0x96>
  8050b3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8050b7:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8050bb:	7e 8f                	jle    80504c <fd_alloc+0x15>
  8050bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8050c1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8050c8:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8050cd:	c9                   	leaveq 
  8050ce:	c3                   	retq   

00000000008050cf <fd_lookup>:
  8050cf:	55                   	push   %rbp
  8050d0:	48 89 e5             	mov    %rsp,%rbp
  8050d3:	48 83 ec 20          	sub    $0x20,%rsp
  8050d7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8050da:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8050de:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8050e2:	78 06                	js     8050ea <fd_lookup+0x1b>
  8050e4:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8050e8:	7e 07                	jle    8050f1 <fd_lookup+0x22>
  8050ea:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8050ef:	eb 6c                	jmp    80515d <fd_lookup+0x8e>
  8050f1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8050f4:	48 98                	cltq   
  8050f6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8050fc:	48 c1 e0 0c          	shl    $0xc,%rax
  805100:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805104:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805108:	48 c1 e8 15          	shr    $0x15,%rax
  80510c:	48 89 c2             	mov    %rax,%rdx
  80510f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  805116:	01 00 00 
  805119:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80511d:	83 e0 01             	and    $0x1,%eax
  805120:	48 85 c0             	test   %rax,%rax
  805123:	74 21                	je     805146 <fd_lookup+0x77>
  805125:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805129:	48 c1 e8 0c          	shr    $0xc,%rax
  80512d:	48 89 c2             	mov    %rax,%rdx
  805130:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805137:	01 00 00 
  80513a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80513e:	83 e0 01             	and    $0x1,%eax
  805141:	48 85 c0             	test   %rax,%rax
  805144:	75 07                	jne    80514d <fd_lookup+0x7e>
  805146:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80514b:	eb 10                	jmp    80515d <fd_lookup+0x8e>
  80514d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805151:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  805155:	48 89 10             	mov    %rdx,(%rax)
  805158:	b8 00 00 00 00       	mov    $0x0,%eax
  80515d:	c9                   	leaveq 
  80515e:	c3                   	retq   

000000000080515f <fd_close>:
  80515f:	55                   	push   %rbp
  805160:	48 89 e5             	mov    %rsp,%rbp
  805163:	48 83 ec 30          	sub    $0x30,%rsp
  805167:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80516b:	89 f0                	mov    %esi,%eax
  80516d:	88 45 d4             	mov    %al,-0x2c(%rbp)
  805170:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805174:	48 89 c7             	mov    %rax,%rdi
  805177:	48 b8 e9 4f 80 00 00 	movabs $0x804fe9,%rax
  80517e:	00 00 00 
  805181:	ff d0                	callq  *%rax
  805183:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805187:	48 89 d6             	mov    %rdx,%rsi
  80518a:	89 c7                	mov    %eax,%edi
  80518c:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  805193:	00 00 00 
  805196:	ff d0                	callq  *%rax
  805198:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80519b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80519f:	78 0a                	js     8051ab <fd_close+0x4c>
  8051a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8051a5:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8051a9:	74 12                	je     8051bd <fd_close+0x5e>
  8051ab:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8051af:	74 05                	je     8051b6 <fd_close+0x57>
  8051b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8051b4:	eb 05                	jmp    8051bb <fd_close+0x5c>
  8051b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8051bb:	eb 69                	jmp    805226 <fd_close+0xc7>
  8051bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8051c1:	8b 00                	mov    (%rax),%eax
  8051c3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8051c7:	48 89 d6             	mov    %rdx,%rsi
  8051ca:	89 c7                	mov    %eax,%edi
  8051cc:	48 b8 28 52 80 00 00 	movabs $0x805228,%rax
  8051d3:	00 00 00 
  8051d6:	ff d0                	callq  *%rax
  8051d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8051db:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8051df:	78 2a                	js     80520b <fd_close+0xac>
  8051e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8051e5:	48 8b 40 20          	mov    0x20(%rax),%rax
  8051e9:	48 85 c0             	test   %rax,%rax
  8051ec:	74 16                	je     805204 <fd_close+0xa5>
  8051ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8051f2:	48 8b 40 20          	mov    0x20(%rax),%rax
  8051f6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8051fa:	48 89 d7             	mov    %rdx,%rdi
  8051fd:	ff d0                	callq  *%rax
  8051ff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805202:	eb 07                	jmp    80520b <fd_close+0xac>
  805204:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80520b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80520f:	48 89 c6             	mov    %rax,%rsi
  805212:	bf 00 00 00 00       	mov    $0x0,%edi
  805217:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  80521e:	00 00 00 
  805221:	ff d0                	callq  *%rax
  805223:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805226:	c9                   	leaveq 
  805227:	c3                   	retq   

0000000000805228 <dev_lookup>:
  805228:	55                   	push   %rbp
  805229:	48 89 e5             	mov    %rsp,%rbp
  80522c:	48 83 ec 20          	sub    $0x20,%rsp
  805230:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805233:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805237:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80523e:	eb 41                	jmp    805281 <dev_lookup+0x59>
  805240:	48 b8 a0 20 81 00 00 	movabs $0x8120a0,%rax
  805247:	00 00 00 
  80524a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80524d:	48 63 d2             	movslq %edx,%rdx
  805250:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805254:	8b 00                	mov    (%rax),%eax
  805256:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  805259:	75 22                	jne    80527d <dev_lookup+0x55>
  80525b:	48 b8 a0 20 81 00 00 	movabs $0x8120a0,%rax
  805262:	00 00 00 
  805265:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805268:	48 63 d2             	movslq %edx,%rdx
  80526b:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80526f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805273:	48 89 10             	mov    %rdx,(%rax)
  805276:	b8 00 00 00 00       	mov    $0x0,%eax
  80527b:	eb 60                	jmp    8052dd <dev_lookup+0xb5>
  80527d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  805281:	48 b8 a0 20 81 00 00 	movabs $0x8120a0,%rax
  805288:	00 00 00 
  80528b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80528e:	48 63 d2             	movslq %edx,%rdx
  805291:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805295:	48 85 c0             	test   %rax,%rax
  805298:	75 a6                	jne    805240 <dev_lookup+0x18>
  80529a:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  8052a1:	00 00 00 
  8052a4:	48 8b 00             	mov    (%rax),%rax
  8052a7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8052ad:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8052b0:	89 c6                	mov    %eax,%esi
  8052b2:	48 bf d0 7c 80 00 00 	movabs $0x807cd0,%rdi
  8052b9:	00 00 00 
  8052bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8052c1:	48 b9 36 33 80 00 00 	movabs $0x803336,%rcx
  8052c8:	00 00 00 
  8052cb:	ff d1                	callq  *%rcx
  8052cd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8052d1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8052d8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8052dd:	c9                   	leaveq 
  8052de:	c3                   	retq   

00000000008052df <close>:
  8052df:	55                   	push   %rbp
  8052e0:	48 89 e5             	mov    %rsp,%rbp
  8052e3:	48 83 ec 20          	sub    $0x20,%rsp
  8052e7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8052ea:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8052ee:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8052f1:	48 89 d6             	mov    %rdx,%rsi
  8052f4:	89 c7                	mov    %eax,%edi
  8052f6:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  8052fd:	00 00 00 
  805300:	ff d0                	callq  *%rax
  805302:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805305:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805309:	79 05                	jns    805310 <close+0x31>
  80530b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80530e:	eb 18                	jmp    805328 <close+0x49>
  805310:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805314:	be 01 00 00 00       	mov    $0x1,%esi
  805319:	48 89 c7             	mov    %rax,%rdi
  80531c:	48 b8 5f 51 80 00 00 	movabs $0x80515f,%rax
  805323:	00 00 00 
  805326:	ff d0                	callq  *%rax
  805328:	c9                   	leaveq 
  805329:	c3                   	retq   

000000000080532a <close_all>:
  80532a:	55                   	push   %rbp
  80532b:	48 89 e5             	mov    %rsp,%rbp
  80532e:	48 83 ec 10          	sub    $0x10,%rsp
  805332:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  805339:	eb 15                	jmp    805350 <close_all+0x26>
  80533b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80533e:	89 c7                	mov    %eax,%edi
  805340:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  805347:	00 00 00 
  80534a:	ff d0                	callq  *%rax
  80534c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  805350:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  805354:	7e e5                	jle    80533b <close_all+0x11>
  805356:	c9                   	leaveq 
  805357:	c3                   	retq   

0000000000805358 <dup>:
  805358:	55                   	push   %rbp
  805359:	48 89 e5             	mov    %rsp,%rbp
  80535c:	48 83 ec 40          	sub    $0x40,%rsp
  805360:	89 7d cc             	mov    %edi,-0x34(%rbp)
  805363:	89 75 c8             	mov    %esi,-0x38(%rbp)
  805366:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80536a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80536d:	48 89 d6             	mov    %rdx,%rsi
  805370:	89 c7                	mov    %eax,%edi
  805372:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  805379:	00 00 00 
  80537c:	ff d0                	callq  *%rax
  80537e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805381:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805385:	79 08                	jns    80538f <dup+0x37>
  805387:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80538a:	e9 70 01 00 00       	jmpq   8054ff <dup+0x1a7>
  80538f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  805392:	89 c7                	mov    %eax,%edi
  805394:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  80539b:	00 00 00 
  80539e:	ff d0                	callq  *%rax
  8053a0:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8053a3:	48 98                	cltq   
  8053a5:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8053ab:	48 c1 e0 0c          	shl    $0xc,%rax
  8053af:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8053b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8053b7:	48 89 c7             	mov    %rax,%rdi
  8053ba:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  8053c1:	00 00 00 
  8053c4:	ff d0                	callq  *%rax
  8053c6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8053ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8053ce:	48 89 c7             	mov    %rax,%rdi
  8053d1:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  8053d8:	00 00 00 
  8053db:	ff d0                	callq  *%rax
  8053dd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8053e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8053e5:	48 c1 e8 15          	shr    $0x15,%rax
  8053e9:	48 89 c2             	mov    %rax,%rdx
  8053ec:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8053f3:	01 00 00 
  8053f6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8053fa:	83 e0 01             	and    $0x1,%eax
  8053fd:	48 85 c0             	test   %rax,%rax
  805400:	74 73                	je     805475 <dup+0x11d>
  805402:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805406:	48 c1 e8 0c          	shr    $0xc,%rax
  80540a:	48 89 c2             	mov    %rax,%rdx
  80540d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805414:	01 00 00 
  805417:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80541b:	83 e0 01             	and    $0x1,%eax
  80541e:	48 85 c0             	test   %rax,%rax
  805421:	74 52                	je     805475 <dup+0x11d>
  805423:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805427:	48 c1 e8 0c          	shr    $0xc,%rax
  80542b:	48 89 c2             	mov    %rax,%rdx
  80542e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805435:	01 00 00 
  805438:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80543c:	25 07 0e 00 00       	and    $0xe07,%eax
  805441:	89 c1                	mov    %eax,%ecx
  805443:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  805447:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80544b:	41 89 c8             	mov    %ecx,%r8d
  80544e:	48 89 d1             	mov    %rdx,%rcx
  805451:	ba 00 00 00 00       	mov    $0x0,%edx
  805456:	48 89 c6             	mov    %rax,%rsi
  805459:	bf 00 00 00 00       	mov    $0x0,%edi
  80545e:	48 b8 6a 48 80 00 00 	movabs $0x80486a,%rax
  805465:	00 00 00 
  805468:	ff d0                	callq  *%rax
  80546a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80546d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805471:	79 02                	jns    805475 <dup+0x11d>
  805473:	eb 57                	jmp    8054cc <dup+0x174>
  805475:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805479:	48 c1 e8 0c          	shr    $0xc,%rax
  80547d:	48 89 c2             	mov    %rax,%rdx
  805480:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805487:	01 00 00 
  80548a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80548e:	25 07 0e 00 00       	and    $0xe07,%eax
  805493:	89 c1                	mov    %eax,%ecx
  805495:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805499:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80549d:	41 89 c8             	mov    %ecx,%r8d
  8054a0:	48 89 d1             	mov    %rdx,%rcx
  8054a3:	ba 00 00 00 00       	mov    $0x0,%edx
  8054a8:	48 89 c6             	mov    %rax,%rsi
  8054ab:	bf 00 00 00 00       	mov    $0x0,%edi
  8054b0:	48 b8 6a 48 80 00 00 	movabs $0x80486a,%rax
  8054b7:	00 00 00 
  8054ba:	ff d0                	callq  *%rax
  8054bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8054bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8054c3:	79 02                	jns    8054c7 <dup+0x16f>
  8054c5:	eb 05                	jmp    8054cc <dup+0x174>
  8054c7:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8054ca:	eb 33                	jmp    8054ff <dup+0x1a7>
  8054cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8054d0:	48 89 c6             	mov    %rax,%rsi
  8054d3:	bf 00 00 00 00       	mov    $0x0,%edi
  8054d8:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  8054df:	00 00 00 
  8054e2:	ff d0                	callq  *%rax
  8054e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8054e8:	48 89 c6             	mov    %rax,%rsi
  8054eb:	bf 00 00 00 00       	mov    $0x0,%edi
  8054f0:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  8054f7:	00 00 00 
  8054fa:	ff d0                	callq  *%rax
  8054fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8054ff:	c9                   	leaveq 
  805500:	c3                   	retq   

0000000000805501 <read>:
  805501:	55                   	push   %rbp
  805502:	48 89 e5             	mov    %rsp,%rbp
  805505:	48 83 ec 40          	sub    $0x40,%rsp
  805509:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80550c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  805510:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  805514:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  805518:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80551b:	48 89 d6             	mov    %rdx,%rsi
  80551e:	89 c7                	mov    %eax,%edi
  805520:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  805527:	00 00 00 
  80552a:	ff d0                	callq  *%rax
  80552c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80552f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805533:	78 24                	js     805559 <read+0x58>
  805535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805539:	8b 00                	mov    (%rax),%eax
  80553b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80553f:	48 89 d6             	mov    %rdx,%rsi
  805542:	89 c7                	mov    %eax,%edi
  805544:	48 b8 28 52 80 00 00 	movabs $0x805228,%rax
  80554b:	00 00 00 
  80554e:	ff d0                	callq  *%rax
  805550:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805553:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805557:	79 05                	jns    80555e <read+0x5d>
  805559:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80555c:	eb 76                	jmp    8055d4 <read+0xd3>
  80555e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805562:	8b 40 08             	mov    0x8(%rax),%eax
  805565:	83 e0 03             	and    $0x3,%eax
  805568:	83 f8 01             	cmp    $0x1,%eax
  80556b:	75 3a                	jne    8055a7 <read+0xa6>
  80556d:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  805574:	00 00 00 
  805577:	48 8b 00             	mov    (%rax),%rax
  80557a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  805580:	8b 55 dc             	mov    -0x24(%rbp),%edx
  805583:	89 c6                	mov    %eax,%esi
  805585:	48 bf ef 7c 80 00 00 	movabs $0x807cef,%rdi
  80558c:	00 00 00 
  80558f:	b8 00 00 00 00       	mov    $0x0,%eax
  805594:	48 b9 36 33 80 00 00 	movabs $0x803336,%rcx
  80559b:	00 00 00 
  80559e:	ff d1                	callq  *%rcx
  8055a0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8055a5:	eb 2d                	jmp    8055d4 <read+0xd3>
  8055a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8055ab:	48 8b 40 10          	mov    0x10(%rax),%rax
  8055af:	48 85 c0             	test   %rax,%rax
  8055b2:	75 07                	jne    8055bb <read+0xba>
  8055b4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8055b9:	eb 19                	jmp    8055d4 <read+0xd3>
  8055bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8055bf:	48 8b 40 10          	mov    0x10(%rax),%rax
  8055c3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8055c7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8055cb:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8055cf:	48 89 cf             	mov    %rcx,%rdi
  8055d2:	ff d0                	callq  *%rax
  8055d4:	c9                   	leaveq 
  8055d5:	c3                   	retq   

00000000008055d6 <readn>:
  8055d6:	55                   	push   %rbp
  8055d7:	48 89 e5             	mov    %rsp,%rbp
  8055da:	48 83 ec 30          	sub    $0x30,%rsp
  8055de:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8055e1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8055e5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8055e9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8055f0:	eb 49                	jmp    80563b <readn+0x65>
  8055f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8055f5:	48 98                	cltq   
  8055f7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8055fb:	48 29 c2             	sub    %rax,%rdx
  8055fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805601:	48 63 c8             	movslq %eax,%rcx
  805604:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805608:	48 01 c1             	add    %rax,%rcx
  80560b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80560e:	48 89 ce             	mov    %rcx,%rsi
  805611:	89 c7                	mov    %eax,%edi
  805613:	48 b8 01 55 80 00 00 	movabs $0x805501,%rax
  80561a:	00 00 00 
  80561d:	ff d0                	callq  *%rax
  80561f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  805622:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  805626:	79 05                	jns    80562d <readn+0x57>
  805628:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80562b:	eb 1c                	jmp    805649 <readn+0x73>
  80562d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  805631:	75 02                	jne    805635 <readn+0x5f>
  805633:	eb 11                	jmp    805646 <readn+0x70>
  805635:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805638:	01 45 fc             	add    %eax,-0x4(%rbp)
  80563b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80563e:	48 98                	cltq   
  805640:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  805644:	72 ac                	jb     8055f2 <readn+0x1c>
  805646:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805649:	c9                   	leaveq 
  80564a:	c3                   	retq   

000000000080564b <write>:
  80564b:	55                   	push   %rbp
  80564c:	48 89 e5             	mov    %rsp,%rbp
  80564f:	48 83 ec 40          	sub    $0x40,%rsp
  805653:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805656:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80565a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80565e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  805662:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805665:	48 89 d6             	mov    %rdx,%rsi
  805668:	89 c7                	mov    %eax,%edi
  80566a:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  805671:	00 00 00 
  805674:	ff d0                	callq  *%rax
  805676:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805679:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80567d:	78 24                	js     8056a3 <write+0x58>
  80567f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805683:	8b 00                	mov    (%rax),%eax
  805685:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805689:	48 89 d6             	mov    %rdx,%rsi
  80568c:	89 c7                	mov    %eax,%edi
  80568e:	48 b8 28 52 80 00 00 	movabs $0x805228,%rax
  805695:	00 00 00 
  805698:	ff d0                	callq  *%rax
  80569a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80569d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8056a1:	79 05                	jns    8056a8 <write+0x5d>
  8056a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8056a6:	eb 75                	jmp    80571d <write+0xd2>
  8056a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8056ac:	8b 40 08             	mov    0x8(%rax),%eax
  8056af:	83 e0 03             	and    $0x3,%eax
  8056b2:	85 c0                	test   %eax,%eax
  8056b4:	75 3a                	jne    8056f0 <write+0xa5>
  8056b6:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  8056bd:	00 00 00 
  8056c0:	48 8b 00             	mov    (%rax),%rax
  8056c3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8056c9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8056cc:	89 c6                	mov    %eax,%esi
  8056ce:	48 bf 0b 7d 80 00 00 	movabs $0x807d0b,%rdi
  8056d5:	00 00 00 
  8056d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8056dd:	48 b9 36 33 80 00 00 	movabs $0x803336,%rcx
  8056e4:	00 00 00 
  8056e7:	ff d1                	callq  *%rcx
  8056e9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8056ee:	eb 2d                	jmp    80571d <write+0xd2>
  8056f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8056f4:	48 8b 40 18          	mov    0x18(%rax),%rax
  8056f8:	48 85 c0             	test   %rax,%rax
  8056fb:	75 07                	jne    805704 <write+0xb9>
  8056fd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  805702:	eb 19                	jmp    80571d <write+0xd2>
  805704:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805708:	48 8b 40 18          	mov    0x18(%rax),%rax
  80570c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  805710:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  805714:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  805718:	48 89 cf             	mov    %rcx,%rdi
  80571b:	ff d0                	callq  *%rax
  80571d:	c9                   	leaveq 
  80571e:	c3                   	retq   

000000000080571f <seek>:
  80571f:	55                   	push   %rbp
  805720:	48 89 e5             	mov    %rsp,%rbp
  805723:	48 83 ec 18          	sub    $0x18,%rsp
  805727:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80572a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80572d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805731:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805734:	48 89 d6             	mov    %rdx,%rsi
  805737:	89 c7                	mov    %eax,%edi
  805739:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  805740:	00 00 00 
  805743:	ff d0                	callq  *%rax
  805745:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805748:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80574c:	79 05                	jns    805753 <seek+0x34>
  80574e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805751:	eb 0f                	jmp    805762 <seek+0x43>
  805753:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805757:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80575a:	89 50 04             	mov    %edx,0x4(%rax)
  80575d:	b8 00 00 00 00       	mov    $0x0,%eax
  805762:	c9                   	leaveq 
  805763:	c3                   	retq   

0000000000805764 <ftruncate>:
  805764:	55                   	push   %rbp
  805765:	48 89 e5             	mov    %rsp,%rbp
  805768:	48 83 ec 30          	sub    $0x30,%rsp
  80576c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80576f:	89 75 d8             	mov    %esi,-0x28(%rbp)
  805772:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  805776:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805779:	48 89 d6             	mov    %rdx,%rsi
  80577c:	89 c7                	mov    %eax,%edi
  80577e:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  805785:	00 00 00 
  805788:	ff d0                	callq  *%rax
  80578a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80578d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805791:	78 24                	js     8057b7 <ftruncate+0x53>
  805793:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805797:	8b 00                	mov    (%rax),%eax
  805799:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80579d:	48 89 d6             	mov    %rdx,%rsi
  8057a0:	89 c7                	mov    %eax,%edi
  8057a2:	48 b8 28 52 80 00 00 	movabs $0x805228,%rax
  8057a9:	00 00 00 
  8057ac:	ff d0                	callq  *%rax
  8057ae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8057b1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8057b5:	79 05                	jns    8057bc <ftruncate+0x58>
  8057b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8057ba:	eb 72                	jmp    80582e <ftruncate+0xca>
  8057bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8057c0:	8b 40 08             	mov    0x8(%rax),%eax
  8057c3:	83 e0 03             	and    $0x3,%eax
  8057c6:	85 c0                	test   %eax,%eax
  8057c8:	75 3a                	jne    805804 <ftruncate+0xa0>
  8057ca:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  8057d1:	00 00 00 
  8057d4:	48 8b 00             	mov    (%rax),%rax
  8057d7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8057dd:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8057e0:	89 c6                	mov    %eax,%esi
  8057e2:	48 bf 28 7d 80 00 00 	movabs $0x807d28,%rdi
  8057e9:	00 00 00 
  8057ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8057f1:	48 b9 36 33 80 00 00 	movabs $0x803336,%rcx
  8057f8:	00 00 00 
  8057fb:	ff d1                	callq  *%rcx
  8057fd:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  805802:	eb 2a                	jmp    80582e <ftruncate+0xca>
  805804:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805808:	48 8b 40 30          	mov    0x30(%rax),%rax
  80580c:	48 85 c0             	test   %rax,%rax
  80580f:	75 07                	jne    805818 <ftruncate+0xb4>
  805811:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  805816:	eb 16                	jmp    80582e <ftruncate+0xca>
  805818:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80581c:	48 8b 40 30          	mov    0x30(%rax),%rax
  805820:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805824:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  805827:	89 ce                	mov    %ecx,%esi
  805829:	48 89 d7             	mov    %rdx,%rdi
  80582c:	ff d0                	callq  *%rax
  80582e:	c9                   	leaveq 
  80582f:	c3                   	retq   

0000000000805830 <fstat>:
  805830:	55                   	push   %rbp
  805831:	48 89 e5             	mov    %rsp,%rbp
  805834:	48 83 ec 30          	sub    $0x30,%rsp
  805838:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80583b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80583f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  805843:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805846:	48 89 d6             	mov    %rdx,%rsi
  805849:	89 c7                	mov    %eax,%edi
  80584b:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  805852:	00 00 00 
  805855:	ff d0                	callq  *%rax
  805857:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80585a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80585e:	78 24                	js     805884 <fstat+0x54>
  805860:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805864:	8b 00                	mov    (%rax),%eax
  805866:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80586a:	48 89 d6             	mov    %rdx,%rsi
  80586d:	89 c7                	mov    %eax,%edi
  80586f:	48 b8 28 52 80 00 00 	movabs $0x805228,%rax
  805876:	00 00 00 
  805879:	ff d0                	callq  *%rax
  80587b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80587e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805882:	79 05                	jns    805889 <fstat+0x59>
  805884:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805887:	eb 5e                	jmp    8058e7 <fstat+0xb7>
  805889:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80588d:	48 8b 40 28          	mov    0x28(%rax),%rax
  805891:	48 85 c0             	test   %rax,%rax
  805894:	75 07                	jne    80589d <fstat+0x6d>
  805896:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80589b:	eb 4a                	jmp    8058e7 <fstat+0xb7>
  80589d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8058a1:	c6 00 00             	movb   $0x0,(%rax)
  8058a4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8058a8:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8058af:	00 00 00 
  8058b2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8058b6:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8058bd:	00 00 00 
  8058c0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8058c4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8058c8:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8058cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8058d3:	48 8b 40 28          	mov    0x28(%rax),%rax
  8058d7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8058db:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8058df:	48 89 ce             	mov    %rcx,%rsi
  8058e2:	48 89 d7             	mov    %rdx,%rdi
  8058e5:	ff d0                	callq  *%rax
  8058e7:	c9                   	leaveq 
  8058e8:	c3                   	retq   

00000000008058e9 <stat>:
  8058e9:	55                   	push   %rbp
  8058ea:	48 89 e5             	mov    %rsp,%rbp
  8058ed:	48 83 ec 20          	sub    $0x20,%rsp
  8058f1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8058f5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8058f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8058fd:	be 00 00 00 00       	mov    $0x0,%esi
  805902:	48 89 c7             	mov    %rax,%rdi
  805905:	48 b8 d7 59 80 00 00 	movabs $0x8059d7,%rax
  80590c:	00 00 00 
  80590f:	ff d0                	callq  *%rax
  805911:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805914:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805918:	79 05                	jns    80591f <stat+0x36>
  80591a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80591d:	eb 2f                	jmp    80594e <stat+0x65>
  80591f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  805923:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805926:	48 89 d6             	mov    %rdx,%rsi
  805929:	89 c7                	mov    %eax,%edi
  80592b:	48 b8 30 58 80 00 00 	movabs $0x805830,%rax
  805932:	00 00 00 
  805935:	ff d0                	callq  *%rax
  805937:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80593a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80593d:	89 c7                	mov    %eax,%edi
  80593f:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  805946:	00 00 00 
  805949:	ff d0                	callq  *%rax
  80594b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80594e:	c9                   	leaveq 
  80594f:	c3                   	retq   

0000000000805950 <fsipc>:
  805950:	55                   	push   %rbp
  805951:	48 89 e5             	mov    %rsp,%rbp
  805954:	48 83 ec 10          	sub    $0x10,%rsp
  805958:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80595b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80595f:	48 b8 04 30 81 00 00 	movabs $0x813004,%rax
  805966:	00 00 00 
  805969:	8b 00                	mov    (%rax),%eax
  80596b:	85 c0                	test   %eax,%eax
  80596d:	75 1d                	jne    80598c <fsipc+0x3c>
  80596f:	bf 01 00 00 00       	mov    $0x1,%edi
  805974:	48 b8 77 4f 80 00 00 	movabs $0x804f77,%rax
  80597b:	00 00 00 
  80597e:	ff d0                	callq  *%rax
  805980:	48 ba 04 30 81 00 00 	movabs $0x813004,%rdx
  805987:	00 00 00 
  80598a:	89 02                	mov    %eax,(%rdx)
  80598c:	48 b8 04 30 81 00 00 	movabs $0x813004,%rax
  805993:	00 00 00 
  805996:	8b 00                	mov    (%rax),%eax
  805998:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80599b:	b9 07 00 00 00       	mov    $0x7,%ecx
  8059a0:	48 ba 00 40 81 00 00 	movabs $0x814000,%rdx
  8059a7:	00 00 00 
  8059aa:	89 c7                	mov    %eax,%edi
  8059ac:	48 b8 e1 4e 80 00 00 	movabs $0x804ee1,%rax
  8059b3:	00 00 00 
  8059b6:	ff d0                	callq  *%rax
  8059b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8059bc:	ba 00 00 00 00       	mov    $0x0,%edx
  8059c1:	48 89 c6             	mov    %rax,%rsi
  8059c4:	bf 00 00 00 00       	mov    $0x0,%edi
  8059c9:	48 b8 20 4e 80 00 00 	movabs $0x804e20,%rax
  8059d0:	00 00 00 
  8059d3:	ff d0                	callq  *%rax
  8059d5:	c9                   	leaveq 
  8059d6:	c3                   	retq   

00000000008059d7 <open>:
  8059d7:	55                   	push   %rbp
  8059d8:	48 89 e5             	mov    %rsp,%rbp
  8059db:	48 83 ec 20          	sub    $0x20,%rsp
  8059df:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8059e3:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8059e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8059ea:	48 89 c7             	mov    %rax,%rdi
  8059ed:	48 b8 7f 3e 80 00 00 	movabs $0x803e7f,%rax
  8059f4:	00 00 00 
  8059f7:	ff d0                	callq  *%rax
  8059f9:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8059fe:	7e 0a                	jle    805a0a <open+0x33>
  805a00:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  805a05:	e9 a5 00 00 00       	jmpq   805aaf <open+0xd8>
  805a0a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  805a0e:	48 89 c7             	mov    %rax,%rdi
  805a11:	48 b8 37 50 80 00 00 	movabs $0x805037,%rax
  805a18:	00 00 00 
  805a1b:	ff d0                	callq  *%rax
  805a1d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805a20:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805a24:	79 08                	jns    805a2e <open+0x57>
  805a26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805a29:	e9 81 00 00 00       	jmpq   805aaf <open+0xd8>
  805a2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805a32:	48 89 c6             	mov    %rax,%rsi
  805a35:	48 bf 00 40 81 00 00 	movabs $0x814000,%rdi
  805a3c:	00 00 00 
  805a3f:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  805a46:	00 00 00 
  805a49:	ff d0                	callq  *%rax
  805a4b:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805a52:	00 00 00 
  805a55:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  805a58:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  805a5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805a62:	48 89 c6             	mov    %rax,%rsi
  805a65:	bf 01 00 00 00       	mov    $0x1,%edi
  805a6a:	48 b8 50 59 80 00 00 	movabs $0x805950,%rax
  805a71:	00 00 00 
  805a74:	ff d0                	callq  *%rax
  805a76:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805a79:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805a7d:	79 1d                	jns    805a9c <open+0xc5>
  805a7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805a83:	be 00 00 00 00       	mov    $0x0,%esi
  805a88:	48 89 c7             	mov    %rax,%rdi
  805a8b:	48 b8 5f 51 80 00 00 	movabs $0x80515f,%rax
  805a92:	00 00 00 
  805a95:	ff d0                	callq  *%rax
  805a97:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805a9a:	eb 13                	jmp    805aaf <open+0xd8>
  805a9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805aa0:	48 89 c7             	mov    %rax,%rdi
  805aa3:	48 b8 e9 4f 80 00 00 	movabs $0x804fe9,%rax
  805aaa:	00 00 00 
  805aad:	ff d0                	callq  *%rax
  805aaf:	c9                   	leaveq 
  805ab0:	c3                   	retq   

0000000000805ab1 <devfile_flush>:
  805ab1:	55                   	push   %rbp
  805ab2:	48 89 e5             	mov    %rsp,%rbp
  805ab5:	48 83 ec 10          	sub    $0x10,%rsp
  805ab9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805abd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805ac1:	8b 50 0c             	mov    0xc(%rax),%edx
  805ac4:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805acb:	00 00 00 
  805ace:	89 10                	mov    %edx,(%rax)
  805ad0:	be 00 00 00 00       	mov    $0x0,%esi
  805ad5:	bf 06 00 00 00       	mov    $0x6,%edi
  805ada:	48 b8 50 59 80 00 00 	movabs $0x805950,%rax
  805ae1:	00 00 00 
  805ae4:	ff d0                	callq  *%rax
  805ae6:	c9                   	leaveq 
  805ae7:	c3                   	retq   

0000000000805ae8 <devfile_read>:
  805ae8:	55                   	push   %rbp
  805ae9:	48 89 e5             	mov    %rsp,%rbp
  805aec:	48 83 ec 30          	sub    $0x30,%rsp
  805af0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805af4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805af8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  805afc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805b00:	8b 50 0c             	mov    0xc(%rax),%edx
  805b03:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805b0a:	00 00 00 
  805b0d:	89 10                	mov    %edx,(%rax)
  805b0f:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805b16:	00 00 00 
  805b19:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  805b1d:	48 89 50 08          	mov    %rdx,0x8(%rax)
  805b21:	be 00 00 00 00       	mov    $0x0,%esi
  805b26:	bf 03 00 00 00       	mov    $0x3,%edi
  805b2b:	48 b8 50 59 80 00 00 	movabs $0x805950,%rax
  805b32:	00 00 00 
  805b35:	ff d0                	callq  *%rax
  805b37:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805b3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805b3e:	79 08                	jns    805b48 <devfile_read+0x60>
  805b40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805b43:	e9 a4 00 00 00       	jmpq   805bec <devfile_read+0x104>
  805b48:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805b4b:	48 98                	cltq   
  805b4d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  805b51:	76 35                	jbe    805b88 <devfile_read+0xa0>
  805b53:	48 b9 4e 7d 80 00 00 	movabs $0x807d4e,%rcx
  805b5a:	00 00 00 
  805b5d:	48 ba 55 7d 80 00 00 	movabs $0x807d55,%rdx
  805b64:	00 00 00 
  805b67:	be 89 00 00 00       	mov    $0x89,%esi
  805b6c:	48 bf 6a 7d 80 00 00 	movabs $0x807d6a,%rdi
  805b73:	00 00 00 
  805b76:	b8 00 00 00 00       	mov    $0x0,%eax
  805b7b:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  805b82:	00 00 00 
  805b85:	41 ff d0             	callq  *%r8
  805b88:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  805b8f:	7e 35                	jle    805bc6 <devfile_read+0xde>
  805b91:	48 b9 78 7d 80 00 00 	movabs $0x807d78,%rcx
  805b98:	00 00 00 
  805b9b:	48 ba 55 7d 80 00 00 	movabs $0x807d55,%rdx
  805ba2:	00 00 00 
  805ba5:	be 8a 00 00 00       	mov    $0x8a,%esi
  805baa:	48 bf 6a 7d 80 00 00 	movabs $0x807d6a,%rdi
  805bb1:	00 00 00 
  805bb4:	b8 00 00 00 00       	mov    $0x0,%eax
  805bb9:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  805bc0:	00 00 00 
  805bc3:	41 ff d0             	callq  *%r8
  805bc6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805bc9:	48 63 d0             	movslq %eax,%rdx
  805bcc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805bd0:	48 be 00 40 81 00 00 	movabs $0x814000,%rsi
  805bd7:	00 00 00 
  805bda:	48 89 c7             	mov    %rax,%rdi
  805bdd:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  805be4:	00 00 00 
  805be7:	ff d0                	callq  *%rax
  805be9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805bec:	c9                   	leaveq 
  805bed:	c3                   	retq   

0000000000805bee <devfile_write>:
  805bee:	55                   	push   %rbp
  805bef:	48 89 e5             	mov    %rsp,%rbp
  805bf2:	48 83 ec 40          	sub    $0x40,%rsp
  805bf6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  805bfa:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  805bfe:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  805c02:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805c06:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805c0a:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  805c11:	00 
  805c12:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805c16:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  805c1a:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  805c1f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  805c23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805c27:	8b 50 0c             	mov    0xc(%rax),%edx
  805c2a:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805c31:	00 00 00 
  805c34:	89 10                	mov    %edx,(%rax)
  805c36:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805c3d:	00 00 00 
  805c40:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  805c44:	48 89 50 08          	mov    %rdx,0x8(%rax)
  805c48:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  805c4c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805c50:	48 89 c6             	mov    %rax,%rsi
  805c53:	48 bf 10 40 81 00 00 	movabs $0x814010,%rdi
  805c5a:	00 00 00 
  805c5d:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  805c64:	00 00 00 
  805c67:	ff d0                	callq  *%rax
  805c69:	be 00 00 00 00       	mov    $0x0,%esi
  805c6e:	bf 04 00 00 00       	mov    $0x4,%edi
  805c73:	48 b8 50 59 80 00 00 	movabs $0x805950,%rax
  805c7a:	00 00 00 
  805c7d:	ff d0                	callq  *%rax
  805c7f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  805c82:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805c86:	79 05                	jns    805c8d <devfile_write+0x9f>
  805c88:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805c8b:	eb 43                	jmp    805cd0 <devfile_write+0xe2>
  805c8d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805c90:	48 98                	cltq   
  805c92:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  805c96:	76 35                	jbe    805ccd <devfile_write+0xdf>
  805c98:	48 b9 4e 7d 80 00 00 	movabs $0x807d4e,%rcx
  805c9f:	00 00 00 
  805ca2:	48 ba 55 7d 80 00 00 	movabs $0x807d55,%rdx
  805ca9:	00 00 00 
  805cac:	be a8 00 00 00       	mov    $0xa8,%esi
  805cb1:	48 bf 6a 7d 80 00 00 	movabs $0x807d6a,%rdi
  805cb8:	00 00 00 
  805cbb:	b8 00 00 00 00       	mov    $0x0,%eax
  805cc0:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  805cc7:	00 00 00 
  805cca:	41 ff d0             	callq  *%r8
  805ccd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805cd0:	c9                   	leaveq 
  805cd1:	c3                   	retq   

0000000000805cd2 <devfile_stat>:
  805cd2:	55                   	push   %rbp
  805cd3:	48 89 e5             	mov    %rsp,%rbp
  805cd6:	48 83 ec 20          	sub    $0x20,%rsp
  805cda:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805cde:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805ce2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805ce6:	8b 50 0c             	mov    0xc(%rax),%edx
  805ce9:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805cf0:	00 00 00 
  805cf3:	89 10                	mov    %edx,(%rax)
  805cf5:	be 00 00 00 00       	mov    $0x0,%esi
  805cfa:	bf 05 00 00 00       	mov    $0x5,%edi
  805cff:	48 b8 50 59 80 00 00 	movabs $0x805950,%rax
  805d06:	00 00 00 
  805d09:	ff d0                	callq  *%rax
  805d0b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805d0e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805d12:	79 05                	jns    805d19 <devfile_stat+0x47>
  805d14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805d17:	eb 56                	jmp    805d6f <devfile_stat+0x9d>
  805d19:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805d1d:	48 be 00 40 81 00 00 	movabs $0x814000,%rsi
  805d24:	00 00 00 
  805d27:	48 89 c7             	mov    %rax,%rdi
  805d2a:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  805d31:	00 00 00 
  805d34:	ff d0                	callq  *%rax
  805d36:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805d3d:	00 00 00 
  805d40:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  805d46:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805d4a:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  805d50:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805d57:	00 00 00 
  805d5a:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  805d60:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805d64:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  805d6a:	b8 00 00 00 00       	mov    $0x0,%eax
  805d6f:	c9                   	leaveq 
  805d70:	c3                   	retq   

0000000000805d71 <devfile_trunc>:
  805d71:	55                   	push   %rbp
  805d72:	48 89 e5             	mov    %rsp,%rbp
  805d75:	48 83 ec 10          	sub    $0x10,%rsp
  805d79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805d7d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  805d80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805d84:	8b 50 0c             	mov    0xc(%rax),%edx
  805d87:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805d8e:	00 00 00 
  805d91:	89 10                	mov    %edx,(%rax)
  805d93:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  805d9a:	00 00 00 
  805d9d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  805da0:	89 50 04             	mov    %edx,0x4(%rax)
  805da3:	be 00 00 00 00       	mov    $0x0,%esi
  805da8:	bf 02 00 00 00       	mov    $0x2,%edi
  805dad:	48 b8 50 59 80 00 00 	movabs $0x805950,%rax
  805db4:	00 00 00 
  805db7:	ff d0                	callq  *%rax
  805db9:	c9                   	leaveq 
  805dba:	c3                   	retq   

0000000000805dbb <remove>:
  805dbb:	55                   	push   %rbp
  805dbc:	48 89 e5             	mov    %rsp,%rbp
  805dbf:	48 83 ec 10          	sub    $0x10,%rsp
  805dc3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805dc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805dcb:	48 89 c7             	mov    %rax,%rdi
  805dce:	48 b8 7f 3e 80 00 00 	movabs $0x803e7f,%rax
  805dd5:	00 00 00 
  805dd8:	ff d0                	callq  *%rax
  805dda:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  805ddf:	7e 07                	jle    805de8 <remove+0x2d>
  805de1:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  805de6:	eb 33                	jmp    805e1b <remove+0x60>
  805de8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805dec:	48 89 c6             	mov    %rax,%rsi
  805def:	48 bf 00 40 81 00 00 	movabs $0x814000,%rdi
  805df6:	00 00 00 
  805df9:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  805e00:	00 00 00 
  805e03:	ff d0                	callq  *%rax
  805e05:	be 00 00 00 00       	mov    $0x0,%esi
  805e0a:	bf 07 00 00 00       	mov    $0x7,%edi
  805e0f:	48 b8 50 59 80 00 00 	movabs $0x805950,%rax
  805e16:	00 00 00 
  805e19:	ff d0                	callq  *%rax
  805e1b:	c9                   	leaveq 
  805e1c:	c3                   	retq   

0000000000805e1d <sync>:
  805e1d:	55                   	push   %rbp
  805e1e:	48 89 e5             	mov    %rsp,%rbp
  805e21:	be 00 00 00 00       	mov    $0x0,%esi
  805e26:	bf 08 00 00 00       	mov    $0x8,%edi
  805e2b:	48 b8 50 59 80 00 00 	movabs $0x805950,%rax
  805e32:	00 00 00 
  805e35:	ff d0                	callq  *%rax
  805e37:	5d                   	pop    %rbp
  805e38:	c3                   	retq   

0000000000805e39 <copy>:
  805e39:	55                   	push   %rbp
  805e3a:	48 89 e5             	mov    %rsp,%rbp
  805e3d:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  805e44:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  805e4b:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  805e52:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  805e59:	be 00 00 00 00       	mov    $0x0,%esi
  805e5e:	48 89 c7             	mov    %rax,%rdi
  805e61:	48 b8 d7 59 80 00 00 	movabs $0x8059d7,%rax
  805e68:	00 00 00 
  805e6b:	ff d0                	callq  *%rax
  805e6d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805e70:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805e74:	79 28                	jns    805e9e <copy+0x65>
  805e76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805e79:	89 c6                	mov    %eax,%esi
  805e7b:	48 bf 84 7d 80 00 00 	movabs $0x807d84,%rdi
  805e82:	00 00 00 
  805e85:	b8 00 00 00 00       	mov    $0x0,%eax
  805e8a:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  805e91:	00 00 00 
  805e94:	ff d2                	callq  *%rdx
  805e96:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805e99:	e9 74 01 00 00       	jmpq   806012 <copy+0x1d9>
  805e9e:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  805ea5:	be 01 01 00 00       	mov    $0x101,%esi
  805eaa:	48 89 c7             	mov    %rax,%rdi
  805ead:	48 b8 d7 59 80 00 00 	movabs $0x8059d7,%rax
  805eb4:	00 00 00 
  805eb7:	ff d0                	callq  *%rax
  805eb9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  805ebc:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  805ec0:	79 39                	jns    805efb <copy+0xc2>
  805ec2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805ec5:	89 c6                	mov    %eax,%esi
  805ec7:	48 bf 9a 7d 80 00 00 	movabs $0x807d9a,%rdi
  805ece:	00 00 00 
  805ed1:	b8 00 00 00 00       	mov    $0x0,%eax
  805ed6:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  805edd:	00 00 00 
  805ee0:	ff d2                	callq  *%rdx
  805ee2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805ee5:	89 c7                	mov    %eax,%edi
  805ee7:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  805eee:	00 00 00 
  805ef1:	ff d0                	callq  *%rax
  805ef3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805ef6:	e9 17 01 00 00       	jmpq   806012 <copy+0x1d9>
  805efb:	eb 74                	jmp    805f71 <copy+0x138>
  805efd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805f00:	48 63 d0             	movslq %eax,%rdx
  805f03:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  805f0a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805f0d:	48 89 ce             	mov    %rcx,%rsi
  805f10:	89 c7                	mov    %eax,%edi
  805f12:	48 b8 4b 56 80 00 00 	movabs $0x80564b,%rax
  805f19:	00 00 00 
  805f1c:	ff d0                	callq  *%rax
  805f1e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  805f21:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  805f25:	79 4a                	jns    805f71 <copy+0x138>
  805f27:	8b 45 f0             	mov    -0x10(%rbp),%eax
  805f2a:	89 c6                	mov    %eax,%esi
  805f2c:	48 bf b4 7d 80 00 00 	movabs $0x807db4,%rdi
  805f33:	00 00 00 
  805f36:	b8 00 00 00 00       	mov    $0x0,%eax
  805f3b:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  805f42:	00 00 00 
  805f45:	ff d2                	callq  *%rdx
  805f47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805f4a:	89 c7                	mov    %eax,%edi
  805f4c:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  805f53:	00 00 00 
  805f56:	ff d0                	callq  *%rax
  805f58:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805f5b:	89 c7                	mov    %eax,%edi
  805f5d:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  805f64:	00 00 00 
  805f67:	ff d0                	callq  *%rax
  805f69:	8b 45 f0             	mov    -0x10(%rbp),%eax
  805f6c:	e9 a1 00 00 00       	jmpq   806012 <copy+0x1d9>
  805f71:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  805f78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805f7b:	ba 00 02 00 00       	mov    $0x200,%edx
  805f80:	48 89 ce             	mov    %rcx,%rsi
  805f83:	89 c7                	mov    %eax,%edi
  805f85:	48 b8 01 55 80 00 00 	movabs $0x805501,%rax
  805f8c:	00 00 00 
  805f8f:	ff d0                	callq  *%rax
  805f91:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805f94:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  805f98:	0f 8f 5f ff ff ff    	jg     805efd <copy+0xc4>
  805f9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  805fa2:	79 47                	jns    805feb <copy+0x1b2>
  805fa4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805fa7:	89 c6                	mov    %eax,%esi
  805fa9:	48 bf c7 7d 80 00 00 	movabs $0x807dc7,%rdi
  805fb0:	00 00 00 
  805fb3:	b8 00 00 00 00       	mov    $0x0,%eax
  805fb8:	48 ba 36 33 80 00 00 	movabs $0x803336,%rdx
  805fbf:	00 00 00 
  805fc2:	ff d2                	callq  *%rdx
  805fc4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805fc7:	89 c7                	mov    %eax,%edi
  805fc9:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  805fd0:	00 00 00 
  805fd3:	ff d0                	callq  *%rax
  805fd5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805fd8:	89 c7                	mov    %eax,%edi
  805fda:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  805fe1:	00 00 00 
  805fe4:	ff d0                	callq  *%rax
  805fe6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805fe9:	eb 27                	jmp    806012 <copy+0x1d9>
  805feb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805fee:	89 c7                	mov    %eax,%edi
  805ff0:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  805ff7:	00 00 00 
  805ffa:	ff d0                	callq  *%rax
  805ffc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805fff:	89 c7                	mov    %eax,%edi
  806001:	48 b8 df 52 80 00 00 	movabs $0x8052df,%rax
  806008:	00 00 00 
  80600b:	ff d0                	callq  *%rax
  80600d:	b8 00 00 00 00       	mov    $0x0,%eax
  806012:	c9                   	leaveq 
  806013:	c3                   	retq   

0000000000806014 <pageref>:
  806014:	55                   	push   %rbp
  806015:	48 89 e5             	mov    %rsp,%rbp
  806018:	48 83 ec 18          	sub    $0x18,%rsp
  80601c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  806020:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806024:	48 c1 e8 15          	shr    $0x15,%rax
  806028:	48 89 c2             	mov    %rax,%rdx
  80602b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  806032:	01 00 00 
  806035:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  806039:	83 e0 01             	and    $0x1,%eax
  80603c:	48 85 c0             	test   %rax,%rax
  80603f:	75 07                	jne    806048 <pageref+0x34>
  806041:	b8 00 00 00 00       	mov    $0x0,%eax
  806046:	eb 53                	jmp    80609b <pageref+0x87>
  806048:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80604c:	48 c1 e8 0c          	shr    $0xc,%rax
  806050:	48 89 c2             	mov    %rax,%rdx
  806053:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80605a:	01 00 00 
  80605d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  806061:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  806065:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806069:	83 e0 01             	and    $0x1,%eax
  80606c:	48 85 c0             	test   %rax,%rax
  80606f:	75 07                	jne    806078 <pageref+0x64>
  806071:	b8 00 00 00 00       	mov    $0x0,%eax
  806076:	eb 23                	jmp    80609b <pageref+0x87>
  806078:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80607c:	48 c1 e8 0c          	shr    $0xc,%rax
  806080:	48 89 c2             	mov    %rax,%rdx
  806083:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80608a:	00 00 00 
  80608d:	48 c1 e2 04          	shl    $0x4,%rdx
  806091:	48 01 d0             	add    %rdx,%rax
  806094:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  806098:	0f b7 c0             	movzwl %ax,%eax
  80609b:	c9                   	leaveq 
  80609c:	c3                   	retq   

000000000080609d <fd2sockid>:
  80609d:	55                   	push   %rbp
  80609e:	48 89 e5             	mov    %rsp,%rbp
  8060a1:	48 83 ec 20          	sub    $0x20,%rsp
  8060a5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8060a8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8060ac:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8060af:	48 89 d6             	mov    %rdx,%rsi
  8060b2:	89 c7                	mov    %eax,%edi
  8060b4:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  8060bb:	00 00 00 
  8060be:	ff d0                	callq  *%rax
  8060c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8060c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8060c7:	79 05                	jns    8060ce <fd2sockid+0x31>
  8060c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8060cc:	eb 24                	jmp    8060f2 <fd2sockid+0x55>
  8060ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8060d2:	8b 10                	mov    (%rax),%edx
  8060d4:	48 b8 20 21 81 00 00 	movabs $0x812120,%rax
  8060db:	00 00 00 
  8060de:	8b 00                	mov    (%rax),%eax
  8060e0:	39 c2                	cmp    %eax,%edx
  8060e2:	74 07                	je     8060eb <fd2sockid+0x4e>
  8060e4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8060e9:	eb 07                	jmp    8060f2 <fd2sockid+0x55>
  8060eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8060ef:	8b 40 0c             	mov    0xc(%rax),%eax
  8060f2:	c9                   	leaveq 
  8060f3:	c3                   	retq   

00000000008060f4 <alloc_sockfd>:
  8060f4:	55                   	push   %rbp
  8060f5:	48 89 e5             	mov    %rsp,%rbp
  8060f8:	48 83 ec 20          	sub    $0x20,%rsp
  8060fc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8060ff:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  806103:	48 89 c7             	mov    %rax,%rdi
  806106:	48 b8 37 50 80 00 00 	movabs $0x805037,%rax
  80610d:	00 00 00 
  806110:	ff d0                	callq  *%rax
  806112:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806115:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806119:	78 26                	js     806141 <alloc_sockfd+0x4d>
  80611b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80611f:	ba 07 04 00 00       	mov    $0x407,%edx
  806124:	48 89 c6             	mov    %rax,%rsi
  806127:	bf 00 00 00 00       	mov    $0x0,%edi
  80612c:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  806133:	00 00 00 
  806136:	ff d0                	callq  *%rax
  806138:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80613b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80613f:	79 16                	jns    806157 <alloc_sockfd+0x63>
  806141:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806144:	89 c7                	mov    %eax,%edi
  806146:	48 b8 01 66 80 00 00 	movabs $0x806601,%rax
  80614d:	00 00 00 
  806150:	ff d0                	callq  *%rax
  806152:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806155:	eb 3a                	jmp    806191 <alloc_sockfd+0x9d>
  806157:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80615b:	48 ba 20 21 81 00 00 	movabs $0x812120,%rdx
  806162:	00 00 00 
  806165:	8b 12                	mov    (%rdx),%edx
  806167:	89 10                	mov    %edx,(%rax)
  806169:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80616d:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  806174:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806178:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80617b:	89 50 0c             	mov    %edx,0xc(%rax)
  80617e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806182:	48 89 c7             	mov    %rax,%rdi
  806185:	48 b8 e9 4f 80 00 00 	movabs $0x804fe9,%rax
  80618c:	00 00 00 
  80618f:	ff d0                	callq  *%rax
  806191:	c9                   	leaveq 
  806192:	c3                   	retq   

0000000000806193 <accept>:
  806193:	55                   	push   %rbp
  806194:	48 89 e5             	mov    %rsp,%rbp
  806197:	48 83 ec 30          	sub    $0x30,%rsp
  80619b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80619e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8061a2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8061a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8061a9:	89 c7                	mov    %eax,%edi
  8061ab:	48 b8 9d 60 80 00 00 	movabs $0x80609d,%rax
  8061b2:	00 00 00 
  8061b5:	ff d0                	callq  *%rax
  8061b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8061ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8061be:	79 05                	jns    8061c5 <accept+0x32>
  8061c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8061c3:	eb 3b                	jmp    806200 <accept+0x6d>
  8061c5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8061c9:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8061cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8061d0:	48 89 ce             	mov    %rcx,%rsi
  8061d3:	89 c7                	mov    %eax,%edi
  8061d5:	48 b8 de 64 80 00 00 	movabs $0x8064de,%rax
  8061dc:	00 00 00 
  8061df:	ff d0                	callq  *%rax
  8061e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8061e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8061e8:	79 05                	jns    8061ef <accept+0x5c>
  8061ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8061ed:	eb 11                	jmp    806200 <accept+0x6d>
  8061ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8061f2:	89 c7                	mov    %eax,%edi
  8061f4:	48 b8 f4 60 80 00 00 	movabs $0x8060f4,%rax
  8061fb:	00 00 00 
  8061fe:	ff d0                	callq  *%rax
  806200:	c9                   	leaveq 
  806201:	c3                   	retq   

0000000000806202 <bind>:
  806202:	55                   	push   %rbp
  806203:	48 89 e5             	mov    %rsp,%rbp
  806206:	48 83 ec 20          	sub    $0x20,%rsp
  80620a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80620d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  806211:	89 55 e8             	mov    %edx,-0x18(%rbp)
  806214:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806217:	89 c7                	mov    %eax,%edi
  806219:	48 b8 9d 60 80 00 00 	movabs $0x80609d,%rax
  806220:	00 00 00 
  806223:	ff d0                	callq  *%rax
  806225:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806228:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80622c:	79 05                	jns    806233 <bind+0x31>
  80622e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806231:	eb 1b                	jmp    80624e <bind+0x4c>
  806233:	8b 55 e8             	mov    -0x18(%rbp),%edx
  806236:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80623a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80623d:	48 89 ce             	mov    %rcx,%rsi
  806240:	89 c7                	mov    %eax,%edi
  806242:	48 b8 5d 65 80 00 00 	movabs $0x80655d,%rax
  806249:	00 00 00 
  80624c:	ff d0                	callq  *%rax
  80624e:	c9                   	leaveq 
  80624f:	c3                   	retq   

0000000000806250 <shutdown>:
  806250:	55                   	push   %rbp
  806251:	48 89 e5             	mov    %rsp,%rbp
  806254:	48 83 ec 20          	sub    $0x20,%rsp
  806258:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80625b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80625e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806261:	89 c7                	mov    %eax,%edi
  806263:	48 b8 9d 60 80 00 00 	movabs $0x80609d,%rax
  80626a:	00 00 00 
  80626d:	ff d0                	callq  *%rax
  80626f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806272:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806276:	79 05                	jns    80627d <shutdown+0x2d>
  806278:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80627b:	eb 16                	jmp    806293 <shutdown+0x43>
  80627d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  806280:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806283:	89 d6                	mov    %edx,%esi
  806285:	89 c7                	mov    %eax,%edi
  806287:	48 b8 c1 65 80 00 00 	movabs $0x8065c1,%rax
  80628e:	00 00 00 
  806291:	ff d0                	callq  *%rax
  806293:	c9                   	leaveq 
  806294:	c3                   	retq   

0000000000806295 <devsock_close>:
  806295:	55                   	push   %rbp
  806296:	48 89 e5             	mov    %rsp,%rbp
  806299:	48 83 ec 10          	sub    $0x10,%rsp
  80629d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8062a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8062a5:	48 89 c7             	mov    %rax,%rdi
  8062a8:	48 b8 14 60 80 00 00 	movabs $0x806014,%rax
  8062af:	00 00 00 
  8062b2:	ff d0                	callq  *%rax
  8062b4:	83 f8 01             	cmp    $0x1,%eax
  8062b7:	75 17                	jne    8062d0 <devsock_close+0x3b>
  8062b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8062bd:	8b 40 0c             	mov    0xc(%rax),%eax
  8062c0:	89 c7                	mov    %eax,%edi
  8062c2:	48 b8 01 66 80 00 00 	movabs $0x806601,%rax
  8062c9:	00 00 00 
  8062cc:	ff d0                	callq  *%rax
  8062ce:	eb 05                	jmp    8062d5 <devsock_close+0x40>
  8062d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8062d5:	c9                   	leaveq 
  8062d6:	c3                   	retq   

00000000008062d7 <connect>:
  8062d7:	55                   	push   %rbp
  8062d8:	48 89 e5             	mov    %rsp,%rbp
  8062db:	48 83 ec 20          	sub    $0x20,%rsp
  8062df:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8062e2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8062e6:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8062e9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8062ec:	89 c7                	mov    %eax,%edi
  8062ee:	48 b8 9d 60 80 00 00 	movabs $0x80609d,%rax
  8062f5:	00 00 00 
  8062f8:	ff d0                	callq  *%rax
  8062fa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8062fd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806301:	79 05                	jns    806308 <connect+0x31>
  806303:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806306:	eb 1b                	jmp    806323 <connect+0x4c>
  806308:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80630b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80630f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806312:	48 89 ce             	mov    %rcx,%rsi
  806315:	89 c7                	mov    %eax,%edi
  806317:	48 b8 2e 66 80 00 00 	movabs $0x80662e,%rax
  80631e:	00 00 00 
  806321:	ff d0                	callq  *%rax
  806323:	c9                   	leaveq 
  806324:	c3                   	retq   

0000000000806325 <listen>:
  806325:	55                   	push   %rbp
  806326:	48 89 e5             	mov    %rsp,%rbp
  806329:	48 83 ec 20          	sub    $0x20,%rsp
  80632d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806330:	89 75 e8             	mov    %esi,-0x18(%rbp)
  806333:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806336:	89 c7                	mov    %eax,%edi
  806338:	48 b8 9d 60 80 00 00 	movabs $0x80609d,%rax
  80633f:	00 00 00 
  806342:	ff d0                	callq  *%rax
  806344:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806347:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80634b:	79 05                	jns    806352 <listen+0x2d>
  80634d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806350:	eb 16                	jmp    806368 <listen+0x43>
  806352:	8b 55 e8             	mov    -0x18(%rbp),%edx
  806355:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806358:	89 d6                	mov    %edx,%esi
  80635a:	89 c7                	mov    %eax,%edi
  80635c:	48 b8 92 66 80 00 00 	movabs $0x806692,%rax
  806363:	00 00 00 
  806366:	ff d0                	callq  *%rax
  806368:	c9                   	leaveq 
  806369:	c3                   	retq   

000000000080636a <devsock_read>:
  80636a:	55                   	push   %rbp
  80636b:	48 89 e5             	mov    %rsp,%rbp
  80636e:	48 83 ec 20          	sub    $0x20,%rsp
  806372:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  806376:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80637a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80637e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806382:	89 c2                	mov    %eax,%edx
  806384:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806388:	8b 40 0c             	mov    0xc(%rax),%eax
  80638b:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80638f:	b9 00 00 00 00       	mov    $0x0,%ecx
  806394:	89 c7                	mov    %eax,%edi
  806396:	48 b8 d2 66 80 00 00 	movabs $0x8066d2,%rax
  80639d:	00 00 00 
  8063a0:	ff d0                	callq  *%rax
  8063a2:	c9                   	leaveq 
  8063a3:	c3                   	retq   

00000000008063a4 <devsock_write>:
  8063a4:	55                   	push   %rbp
  8063a5:	48 89 e5             	mov    %rsp,%rbp
  8063a8:	48 83 ec 20          	sub    $0x20,%rsp
  8063ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8063b0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8063b4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8063b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8063bc:	89 c2                	mov    %eax,%edx
  8063be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8063c2:	8b 40 0c             	mov    0xc(%rax),%eax
  8063c5:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8063c9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8063ce:	89 c7                	mov    %eax,%edi
  8063d0:	48 b8 9e 67 80 00 00 	movabs $0x80679e,%rax
  8063d7:	00 00 00 
  8063da:	ff d0                	callq  *%rax
  8063dc:	c9                   	leaveq 
  8063dd:	c3                   	retq   

00000000008063de <devsock_stat>:
  8063de:	55                   	push   %rbp
  8063df:	48 89 e5             	mov    %rsp,%rbp
  8063e2:	48 83 ec 10          	sub    $0x10,%rsp
  8063e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8063ea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8063ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8063f2:	48 be e2 7d 80 00 00 	movabs $0x807de2,%rsi
  8063f9:	00 00 00 
  8063fc:	48 89 c7             	mov    %rax,%rdi
  8063ff:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  806406:	00 00 00 
  806409:	ff d0                	callq  *%rax
  80640b:	b8 00 00 00 00       	mov    $0x0,%eax
  806410:	c9                   	leaveq 
  806411:	c3                   	retq   

0000000000806412 <socket>:
  806412:	55                   	push   %rbp
  806413:	48 89 e5             	mov    %rsp,%rbp
  806416:	48 83 ec 20          	sub    $0x20,%rsp
  80641a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80641d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  806420:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  806423:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  806426:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  806429:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80642c:	89 ce                	mov    %ecx,%esi
  80642e:	89 c7                	mov    %eax,%edi
  806430:	48 b8 56 68 80 00 00 	movabs $0x806856,%rax
  806437:	00 00 00 
  80643a:	ff d0                	callq  *%rax
  80643c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80643f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806443:	79 05                	jns    80644a <socket+0x38>
  806445:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806448:	eb 11                	jmp    80645b <socket+0x49>
  80644a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80644d:	89 c7                	mov    %eax,%edi
  80644f:	48 b8 f4 60 80 00 00 	movabs $0x8060f4,%rax
  806456:	00 00 00 
  806459:	ff d0                	callq  *%rax
  80645b:	c9                   	leaveq 
  80645c:	c3                   	retq   

000000000080645d <nsipc>:
  80645d:	55                   	push   %rbp
  80645e:	48 89 e5             	mov    %rsp,%rbp
  806461:	48 83 ec 10          	sub    $0x10,%rsp
  806465:	89 7d fc             	mov    %edi,-0x4(%rbp)
  806468:	48 b8 08 30 81 00 00 	movabs $0x813008,%rax
  80646f:	00 00 00 
  806472:	8b 00                	mov    (%rax),%eax
  806474:	85 c0                	test   %eax,%eax
  806476:	75 1d                	jne    806495 <nsipc+0x38>
  806478:	bf 02 00 00 00       	mov    $0x2,%edi
  80647d:	48 b8 77 4f 80 00 00 	movabs $0x804f77,%rax
  806484:	00 00 00 
  806487:	ff d0                	callq  *%rax
  806489:	48 ba 08 30 81 00 00 	movabs $0x813008,%rdx
  806490:	00 00 00 
  806493:	89 02                	mov    %eax,(%rdx)
  806495:	48 b8 08 30 81 00 00 	movabs $0x813008,%rax
  80649c:	00 00 00 
  80649f:	8b 00                	mov    (%rax),%eax
  8064a1:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8064a4:	b9 07 00 00 00       	mov    $0x7,%ecx
  8064a9:	48 ba 00 60 81 00 00 	movabs $0x816000,%rdx
  8064b0:	00 00 00 
  8064b3:	89 c7                	mov    %eax,%edi
  8064b5:	48 b8 e1 4e 80 00 00 	movabs $0x804ee1,%rax
  8064bc:	00 00 00 
  8064bf:	ff d0                	callq  *%rax
  8064c1:	ba 00 00 00 00       	mov    $0x0,%edx
  8064c6:	be 00 00 00 00       	mov    $0x0,%esi
  8064cb:	bf 00 00 00 00       	mov    $0x0,%edi
  8064d0:	48 b8 20 4e 80 00 00 	movabs $0x804e20,%rax
  8064d7:	00 00 00 
  8064da:	ff d0                	callq  *%rax
  8064dc:	c9                   	leaveq 
  8064dd:	c3                   	retq   

00000000008064de <nsipc_accept>:
  8064de:	55                   	push   %rbp
  8064df:	48 89 e5             	mov    %rsp,%rbp
  8064e2:	48 83 ec 30          	sub    $0x30,%rsp
  8064e6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8064e9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8064ed:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8064f1:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8064f8:	00 00 00 
  8064fb:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8064fe:	89 10                	mov    %edx,(%rax)
  806500:	bf 01 00 00 00       	mov    $0x1,%edi
  806505:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  80650c:	00 00 00 
  80650f:	ff d0                	callq  *%rax
  806511:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806514:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806518:	78 3e                	js     806558 <nsipc_accept+0x7a>
  80651a:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  806521:	00 00 00 
  806524:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806528:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80652c:	8b 40 10             	mov    0x10(%rax),%eax
  80652f:	89 c2                	mov    %eax,%edx
  806531:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  806535:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806539:	48 89 ce             	mov    %rcx,%rsi
  80653c:	48 89 c7             	mov    %rax,%rdi
  80653f:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  806546:	00 00 00 
  806549:	ff d0                	callq  *%rax
  80654b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80654f:	8b 50 10             	mov    0x10(%rax),%edx
  806552:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806556:	89 10                	mov    %edx,(%rax)
  806558:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80655b:	c9                   	leaveq 
  80655c:	c3                   	retq   

000000000080655d <nsipc_bind>:
  80655d:	55                   	push   %rbp
  80655e:	48 89 e5             	mov    %rsp,%rbp
  806561:	48 83 ec 10          	sub    $0x10,%rsp
  806565:	89 7d fc             	mov    %edi,-0x4(%rbp)
  806568:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80656c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80656f:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  806576:	00 00 00 
  806579:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80657c:	89 10                	mov    %edx,(%rax)
  80657e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  806581:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806585:	48 89 c6             	mov    %rax,%rsi
  806588:	48 bf 04 60 81 00 00 	movabs $0x816004,%rdi
  80658f:	00 00 00 
  806592:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  806599:	00 00 00 
  80659c:	ff d0                	callq  *%rax
  80659e:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8065a5:	00 00 00 
  8065a8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8065ab:	89 50 14             	mov    %edx,0x14(%rax)
  8065ae:	bf 02 00 00 00       	mov    $0x2,%edi
  8065b3:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  8065ba:	00 00 00 
  8065bd:	ff d0                	callq  *%rax
  8065bf:	c9                   	leaveq 
  8065c0:	c3                   	retq   

00000000008065c1 <nsipc_shutdown>:
  8065c1:	55                   	push   %rbp
  8065c2:	48 89 e5             	mov    %rsp,%rbp
  8065c5:	48 83 ec 10          	sub    $0x10,%rsp
  8065c9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8065cc:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8065cf:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8065d6:	00 00 00 
  8065d9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8065dc:	89 10                	mov    %edx,(%rax)
  8065de:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8065e5:	00 00 00 
  8065e8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8065eb:	89 50 04             	mov    %edx,0x4(%rax)
  8065ee:	bf 03 00 00 00       	mov    $0x3,%edi
  8065f3:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  8065fa:	00 00 00 
  8065fd:	ff d0                	callq  *%rax
  8065ff:	c9                   	leaveq 
  806600:	c3                   	retq   

0000000000806601 <nsipc_close>:
  806601:	55                   	push   %rbp
  806602:	48 89 e5             	mov    %rsp,%rbp
  806605:	48 83 ec 10          	sub    $0x10,%rsp
  806609:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80660c:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  806613:	00 00 00 
  806616:	8b 55 fc             	mov    -0x4(%rbp),%edx
  806619:	89 10                	mov    %edx,(%rax)
  80661b:	bf 04 00 00 00       	mov    $0x4,%edi
  806620:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  806627:	00 00 00 
  80662a:	ff d0                	callq  *%rax
  80662c:	c9                   	leaveq 
  80662d:	c3                   	retq   

000000000080662e <nsipc_connect>:
  80662e:	55                   	push   %rbp
  80662f:	48 89 e5             	mov    %rsp,%rbp
  806632:	48 83 ec 10          	sub    $0x10,%rsp
  806636:	89 7d fc             	mov    %edi,-0x4(%rbp)
  806639:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80663d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  806640:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  806647:	00 00 00 
  80664a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80664d:	89 10                	mov    %edx,(%rax)
  80664f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  806652:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806656:	48 89 c6             	mov    %rax,%rsi
  806659:	48 bf 04 60 81 00 00 	movabs $0x816004,%rdi
  806660:	00 00 00 
  806663:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  80666a:	00 00 00 
  80666d:	ff d0                	callq  *%rax
  80666f:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  806676:	00 00 00 
  806679:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80667c:	89 50 14             	mov    %edx,0x14(%rax)
  80667f:	bf 05 00 00 00       	mov    $0x5,%edi
  806684:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  80668b:	00 00 00 
  80668e:	ff d0                	callq  *%rax
  806690:	c9                   	leaveq 
  806691:	c3                   	retq   

0000000000806692 <nsipc_listen>:
  806692:	55                   	push   %rbp
  806693:	48 89 e5             	mov    %rsp,%rbp
  806696:	48 83 ec 10          	sub    $0x10,%rsp
  80669a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80669d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8066a0:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8066a7:	00 00 00 
  8066aa:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8066ad:	89 10                	mov    %edx,(%rax)
  8066af:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8066b6:	00 00 00 
  8066b9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8066bc:	89 50 04             	mov    %edx,0x4(%rax)
  8066bf:	bf 06 00 00 00       	mov    $0x6,%edi
  8066c4:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  8066cb:	00 00 00 
  8066ce:	ff d0                	callq  *%rax
  8066d0:	c9                   	leaveq 
  8066d1:	c3                   	retq   

00000000008066d2 <nsipc_recv>:
  8066d2:	55                   	push   %rbp
  8066d3:	48 89 e5             	mov    %rsp,%rbp
  8066d6:	48 83 ec 30          	sub    $0x30,%rsp
  8066da:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8066dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8066e1:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8066e4:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8066e7:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8066ee:	00 00 00 
  8066f1:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8066f4:	89 10                	mov    %edx,(%rax)
  8066f6:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8066fd:	00 00 00 
  806700:	8b 55 e8             	mov    -0x18(%rbp),%edx
  806703:	89 50 04             	mov    %edx,0x4(%rax)
  806706:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  80670d:	00 00 00 
  806710:	8b 55 dc             	mov    -0x24(%rbp),%edx
  806713:	89 50 08             	mov    %edx,0x8(%rax)
  806716:	bf 07 00 00 00       	mov    $0x7,%edi
  80671b:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  806722:	00 00 00 
  806725:	ff d0                	callq  *%rax
  806727:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80672a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80672e:	78 69                	js     806799 <nsipc_recv+0xc7>
  806730:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  806737:	7f 08                	jg     806741 <nsipc_recv+0x6f>
  806739:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80673c:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80673f:	7e 35                	jle    806776 <nsipc_recv+0xa4>
  806741:	48 b9 e9 7d 80 00 00 	movabs $0x807de9,%rcx
  806748:	00 00 00 
  80674b:	48 ba fe 7d 80 00 00 	movabs $0x807dfe,%rdx
  806752:	00 00 00 
  806755:	be 62 00 00 00       	mov    $0x62,%esi
  80675a:	48 bf 13 7e 80 00 00 	movabs $0x807e13,%rdi
  806761:	00 00 00 
  806764:	b8 00 00 00 00       	mov    $0x0,%eax
  806769:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  806770:	00 00 00 
  806773:	41 ff d0             	callq  *%r8
  806776:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806779:	48 63 d0             	movslq %eax,%rdx
  80677c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806780:	48 be 00 60 81 00 00 	movabs $0x816000,%rsi
  806787:	00 00 00 
  80678a:	48 89 c7             	mov    %rax,%rdi
  80678d:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  806794:	00 00 00 
  806797:	ff d0                	callq  *%rax
  806799:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80679c:	c9                   	leaveq 
  80679d:	c3                   	retq   

000000000080679e <nsipc_send>:
  80679e:	55                   	push   %rbp
  80679f:	48 89 e5             	mov    %rsp,%rbp
  8067a2:	48 83 ec 20          	sub    $0x20,%rsp
  8067a6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8067a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8067ad:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8067b0:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8067b3:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  8067ba:	00 00 00 
  8067bd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8067c0:	89 10                	mov    %edx,(%rax)
  8067c2:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8067c9:	7e 35                	jle    806800 <nsipc_send+0x62>
  8067cb:	48 b9 22 7e 80 00 00 	movabs $0x807e22,%rcx
  8067d2:	00 00 00 
  8067d5:	48 ba fe 7d 80 00 00 	movabs $0x807dfe,%rdx
  8067dc:	00 00 00 
  8067df:	be 6d 00 00 00       	mov    $0x6d,%esi
  8067e4:	48 bf 13 7e 80 00 00 	movabs $0x807e13,%rdi
  8067eb:	00 00 00 
  8067ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8067f3:	49 b8 fd 30 80 00 00 	movabs $0x8030fd,%r8
  8067fa:	00 00 00 
  8067fd:	41 ff d0             	callq  *%r8
  806800:	8b 45 f8             	mov    -0x8(%rbp),%eax
  806803:	48 63 d0             	movslq %eax,%rdx
  806806:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80680a:	48 89 c6             	mov    %rax,%rsi
  80680d:	48 bf 0c 60 81 00 00 	movabs $0x81600c,%rdi
  806814:	00 00 00 
  806817:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  80681e:	00 00 00 
  806821:	ff d0                	callq  *%rax
  806823:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  80682a:	00 00 00 
  80682d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  806830:	89 50 04             	mov    %edx,0x4(%rax)
  806833:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  80683a:	00 00 00 
  80683d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  806840:	89 50 08             	mov    %edx,0x8(%rax)
  806843:	bf 08 00 00 00       	mov    $0x8,%edi
  806848:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  80684f:	00 00 00 
  806852:	ff d0                	callq  *%rax
  806854:	c9                   	leaveq 
  806855:	c3                   	retq   

0000000000806856 <nsipc_socket>:
  806856:	55                   	push   %rbp
  806857:	48 89 e5             	mov    %rsp,%rbp
  80685a:	48 83 ec 10          	sub    $0x10,%rsp
  80685e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  806861:	89 75 f8             	mov    %esi,-0x8(%rbp)
  806864:	89 55 f4             	mov    %edx,-0xc(%rbp)
  806867:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  80686e:	00 00 00 
  806871:	8b 55 fc             	mov    -0x4(%rbp),%edx
  806874:	89 10                	mov    %edx,(%rax)
  806876:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  80687d:	00 00 00 
  806880:	8b 55 f8             	mov    -0x8(%rbp),%edx
  806883:	89 50 04             	mov    %edx,0x4(%rax)
  806886:	48 b8 00 60 81 00 00 	movabs $0x816000,%rax
  80688d:	00 00 00 
  806890:	8b 55 f4             	mov    -0xc(%rbp),%edx
  806893:	89 50 08             	mov    %edx,0x8(%rax)
  806896:	bf 09 00 00 00       	mov    $0x9,%edi
  80689b:	48 b8 5d 64 80 00 00 	movabs $0x80645d,%rax
  8068a2:	00 00 00 
  8068a5:	ff d0                	callq  *%rax
  8068a7:	c9                   	leaveq 
  8068a8:	c3                   	retq   

00000000008068a9 <pipe>:
  8068a9:	55                   	push   %rbp
  8068aa:	48 89 e5             	mov    %rsp,%rbp
  8068ad:	53                   	push   %rbx
  8068ae:	48 83 ec 38          	sub    $0x38,%rsp
  8068b2:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8068b6:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8068ba:	48 89 c7             	mov    %rax,%rdi
  8068bd:	48 b8 37 50 80 00 00 	movabs $0x805037,%rax
  8068c4:	00 00 00 
  8068c7:	ff d0                	callq  *%rax
  8068c9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8068cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8068d0:	0f 88 bf 01 00 00    	js     806a95 <pipe+0x1ec>
  8068d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8068da:	ba 07 04 00 00       	mov    $0x407,%edx
  8068df:	48 89 c6             	mov    %rax,%rsi
  8068e2:	bf 00 00 00 00       	mov    $0x0,%edi
  8068e7:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  8068ee:	00 00 00 
  8068f1:	ff d0                	callq  *%rax
  8068f3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8068f6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8068fa:	0f 88 95 01 00 00    	js     806a95 <pipe+0x1ec>
  806900:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  806904:	48 89 c7             	mov    %rax,%rdi
  806907:	48 b8 37 50 80 00 00 	movabs $0x805037,%rax
  80690e:	00 00 00 
  806911:	ff d0                	callq  *%rax
  806913:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806916:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80691a:	0f 88 5d 01 00 00    	js     806a7d <pipe+0x1d4>
  806920:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806924:	ba 07 04 00 00       	mov    $0x407,%edx
  806929:	48 89 c6             	mov    %rax,%rsi
  80692c:	bf 00 00 00 00       	mov    $0x0,%edi
  806931:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  806938:	00 00 00 
  80693b:	ff d0                	callq  *%rax
  80693d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806940:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806944:	0f 88 33 01 00 00    	js     806a7d <pipe+0x1d4>
  80694a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80694e:	48 89 c7             	mov    %rax,%rdi
  806951:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  806958:	00 00 00 
  80695b:	ff d0                	callq  *%rax
  80695d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  806961:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806965:	ba 07 04 00 00       	mov    $0x407,%edx
  80696a:	48 89 c6             	mov    %rax,%rsi
  80696d:	bf 00 00 00 00       	mov    $0x0,%edi
  806972:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  806979:	00 00 00 
  80697c:	ff d0                	callq  *%rax
  80697e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806981:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806985:	79 05                	jns    80698c <pipe+0xe3>
  806987:	e9 d9 00 00 00       	jmpq   806a65 <pipe+0x1bc>
  80698c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806990:	48 89 c7             	mov    %rax,%rdi
  806993:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  80699a:	00 00 00 
  80699d:	ff d0                	callq  *%rax
  80699f:	48 89 c2             	mov    %rax,%rdx
  8069a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8069a6:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8069ac:	48 89 d1             	mov    %rdx,%rcx
  8069af:	ba 00 00 00 00       	mov    $0x0,%edx
  8069b4:	48 89 c6             	mov    %rax,%rsi
  8069b7:	bf 00 00 00 00       	mov    $0x0,%edi
  8069bc:	48 b8 6a 48 80 00 00 	movabs $0x80486a,%rax
  8069c3:	00 00 00 
  8069c6:	ff d0                	callq  *%rax
  8069c8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8069cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8069cf:	79 1b                	jns    8069ec <pipe+0x143>
  8069d1:	90                   	nop
  8069d2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8069d6:	48 89 c6             	mov    %rax,%rsi
  8069d9:	bf 00 00 00 00       	mov    $0x0,%edi
  8069de:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  8069e5:	00 00 00 
  8069e8:	ff d0                	callq  *%rax
  8069ea:	eb 79                	jmp    806a65 <pipe+0x1bc>
  8069ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8069f0:	48 ba 60 21 81 00 00 	movabs $0x812160,%rdx
  8069f7:	00 00 00 
  8069fa:	8b 12                	mov    (%rdx),%edx
  8069fc:	89 10                	mov    %edx,(%rax)
  8069fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806a02:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  806a09:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806a0d:	48 ba 60 21 81 00 00 	movabs $0x812160,%rdx
  806a14:	00 00 00 
  806a17:	8b 12                	mov    (%rdx),%edx
  806a19:	89 10                	mov    %edx,(%rax)
  806a1b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806a1f:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  806a26:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806a2a:	48 89 c7             	mov    %rax,%rdi
  806a2d:	48 b8 e9 4f 80 00 00 	movabs $0x804fe9,%rax
  806a34:	00 00 00 
  806a37:	ff d0                	callq  *%rax
  806a39:	89 c2                	mov    %eax,%edx
  806a3b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  806a3f:	89 10                	mov    %edx,(%rax)
  806a41:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  806a45:	48 8d 58 04          	lea    0x4(%rax),%rbx
  806a49:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806a4d:	48 89 c7             	mov    %rax,%rdi
  806a50:	48 b8 e9 4f 80 00 00 	movabs $0x804fe9,%rax
  806a57:	00 00 00 
  806a5a:	ff d0                	callq  *%rax
  806a5c:	89 03                	mov    %eax,(%rbx)
  806a5e:	b8 00 00 00 00       	mov    $0x0,%eax
  806a63:	eb 33                	jmp    806a98 <pipe+0x1ef>
  806a65:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806a69:	48 89 c6             	mov    %rax,%rsi
  806a6c:	bf 00 00 00 00       	mov    $0x0,%edi
  806a71:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  806a78:	00 00 00 
  806a7b:	ff d0                	callq  *%rax
  806a7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806a81:	48 89 c6             	mov    %rax,%rsi
  806a84:	bf 00 00 00 00       	mov    $0x0,%edi
  806a89:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  806a90:	00 00 00 
  806a93:	ff d0                	callq  *%rax
  806a95:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806a98:	48 83 c4 38          	add    $0x38,%rsp
  806a9c:	5b                   	pop    %rbx
  806a9d:	5d                   	pop    %rbp
  806a9e:	c3                   	retq   

0000000000806a9f <_pipeisclosed>:
  806a9f:	55                   	push   %rbp
  806aa0:	48 89 e5             	mov    %rsp,%rbp
  806aa3:	53                   	push   %rbx
  806aa4:	48 83 ec 28          	sub    $0x28,%rsp
  806aa8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806aac:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806ab0:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  806ab7:	00 00 00 
  806aba:	48 8b 00             	mov    (%rax),%rax
  806abd:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  806ac3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806ac6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806aca:	48 89 c7             	mov    %rax,%rdi
  806acd:	48 b8 14 60 80 00 00 	movabs $0x806014,%rax
  806ad4:	00 00 00 
  806ad7:	ff d0                	callq  *%rax
  806ad9:	89 c3                	mov    %eax,%ebx
  806adb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806adf:	48 89 c7             	mov    %rax,%rdi
  806ae2:	48 b8 14 60 80 00 00 	movabs $0x806014,%rax
  806ae9:	00 00 00 
  806aec:	ff d0                	callq  *%rax
  806aee:	39 c3                	cmp    %eax,%ebx
  806af0:	0f 94 c0             	sete   %al
  806af3:	0f b6 c0             	movzbl %al,%eax
  806af6:	89 45 e8             	mov    %eax,-0x18(%rbp)
  806af9:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  806b00:	00 00 00 
  806b03:	48 8b 00             	mov    (%rax),%rax
  806b06:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  806b0c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  806b0f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806b12:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  806b15:	75 05                	jne    806b1c <_pipeisclosed+0x7d>
  806b17:	8b 45 e8             	mov    -0x18(%rbp),%eax
  806b1a:	eb 4f                	jmp    806b6b <_pipeisclosed+0xcc>
  806b1c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806b1f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  806b22:	74 42                	je     806b66 <_pipeisclosed+0xc7>
  806b24:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  806b28:	75 3c                	jne    806b66 <_pipeisclosed+0xc7>
  806b2a:	48 b8 20 30 81 00 00 	movabs $0x813020,%rax
  806b31:	00 00 00 
  806b34:	48 8b 00             	mov    (%rax),%rax
  806b37:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  806b3d:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  806b40:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806b43:	89 c6                	mov    %eax,%esi
  806b45:	48 bf 33 7e 80 00 00 	movabs $0x807e33,%rdi
  806b4c:	00 00 00 
  806b4f:	b8 00 00 00 00       	mov    $0x0,%eax
  806b54:	49 b8 36 33 80 00 00 	movabs $0x803336,%r8
  806b5b:	00 00 00 
  806b5e:	41 ff d0             	callq  *%r8
  806b61:	e9 4a ff ff ff       	jmpq   806ab0 <_pipeisclosed+0x11>
  806b66:	e9 45 ff ff ff       	jmpq   806ab0 <_pipeisclosed+0x11>
  806b6b:	48 83 c4 28          	add    $0x28,%rsp
  806b6f:	5b                   	pop    %rbx
  806b70:	5d                   	pop    %rbp
  806b71:	c3                   	retq   

0000000000806b72 <pipeisclosed>:
  806b72:	55                   	push   %rbp
  806b73:	48 89 e5             	mov    %rsp,%rbp
  806b76:	48 83 ec 30          	sub    $0x30,%rsp
  806b7a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  806b7d:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  806b81:	8b 45 dc             	mov    -0x24(%rbp),%eax
  806b84:	48 89 d6             	mov    %rdx,%rsi
  806b87:	89 c7                	mov    %eax,%edi
  806b89:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  806b90:	00 00 00 
  806b93:	ff d0                	callq  *%rax
  806b95:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806b98:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806b9c:	79 05                	jns    806ba3 <pipeisclosed+0x31>
  806b9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806ba1:	eb 31                	jmp    806bd4 <pipeisclosed+0x62>
  806ba3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806ba7:	48 89 c7             	mov    %rax,%rdi
  806baa:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  806bb1:	00 00 00 
  806bb4:	ff d0                	callq  *%rax
  806bb6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806bba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806bbe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806bc2:	48 89 d6             	mov    %rdx,%rsi
  806bc5:	48 89 c7             	mov    %rax,%rdi
  806bc8:	48 b8 9f 6a 80 00 00 	movabs $0x806a9f,%rax
  806bcf:	00 00 00 
  806bd2:	ff d0                	callq  *%rax
  806bd4:	c9                   	leaveq 
  806bd5:	c3                   	retq   

0000000000806bd6 <devpipe_read>:
  806bd6:	55                   	push   %rbp
  806bd7:	48 89 e5             	mov    %rsp,%rbp
  806bda:	48 83 ec 40          	sub    $0x40,%rsp
  806bde:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806be2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806be6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  806bea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806bee:	48 89 c7             	mov    %rax,%rdi
  806bf1:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  806bf8:	00 00 00 
  806bfb:	ff d0                	callq  *%rax
  806bfd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806c01:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806c05:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  806c09:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  806c10:	00 
  806c11:	e9 92 00 00 00       	jmpq   806ca8 <devpipe_read+0xd2>
  806c16:	eb 41                	jmp    806c59 <devpipe_read+0x83>
  806c18:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  806c1d:	74 09                	je     806c28 <devpipe_read+0x52>
  806c1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806c23:	e9 92 00 00 00       	jmpq   806cba <devpipe_read+0xe4>
  806c28:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806c2c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806c30:	48 89 d6             	mov    %rdx,%rsi
  806c33:	48 89 c7             	mov    %rax,%rdi
  806c36:	48 b8 9f 6a 80 00 00 	movabs $0x806a9f,%rax
  806c3d:	00 00 00 
  806c40:	ff d0                	callq  *%rax
  806c42:	85 c0                	test   %eax,%eax
  806c44:	74 07                	je     806c4d <devpipe_read+0x77>
  806c46:	b8 00 00 00 00       	mov    $0x0,%eax
  806c4b:	eb 6d                	jmp    806cba <devpipe_read+0xe4>
  806c4d:	48 b8 dc 47 80 00 00 	movabs $0x8047dc,%rax
  806c54:	00 00 00 
  806c57:	ff d0                	callq  *%rax
  806c59:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806c5d:	8b 10                	mov    (%rax),%edx
  806c5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806c63:	8b 40 04             	mov    0x4(%rax),%eax
  806c66:	39 c2                	cmp    %eax,%edx
  806c68:	74 ae                	je     806c18 <devpipe_read+0x42>
  806c6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806c6e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  806c72:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  806c76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806c7a:	8b 00                	mov    (%rax),%eax
  806c7c:	99                   	cltd   
  806c7d:	c1 ea 1b             	shr    $0x1b,%edx
  806c80:	01 d0                	add    %edx,%eax
  806c82:	83 e0 1f             	and    $0x1f,%eax
  806c85:	29 d0                	sub    %edx,%eax
  806c87:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806c8b:	48 98                	cltq   
  806c8d:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  806c92:	88 01                	mov    %al,(%rcx)
  806c94:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806c98:	8b 00                	mov    (%rax),%eax
  806c9a:	8d 50 01             	lea    0x1(%rax),%edx
  806c9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806ca1:	89 10                	mov    %edx,(%rax)
  806ca3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  806ca8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806cac:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  806cb0:	0f 82 60 ff ff ff    	jb     806c16 <devpipe_read+0x40>
  806cb6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806cba:	c9                   	leaveq 
  806cbb:	c3                   	retq   

0000000000806cbc <devpipe_write>:
  806cbc:	55                   	push   %rbp
  806cbd:	48 89 e5             	mov    %rsp,%rbp
  806cc0:	48 83 ec 40          	sub    $0x40,%rsp
  806cc4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806cc8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806ccc:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  806cd0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806cd4:	48 89 c7             	mov    %rax,%rdi
  806cd7:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  806cde:	00 00 00 
  806ce1:	ff d0                	callq  *%rax
  806ce3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806ce7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806ceb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  806cef:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  806cf6:	00 
  806cf7:	e9 8e 00 00 00       	jmpq   806d8a <devpipe_write+0xce>
  806cfc:	eb 31                	jmp    806d2f <devpipe_write+0x73>
  806cfe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806d02:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806d06:	48 89 d6             	mov    %rdx,%rsi
  806d09:	48 89 c7             	mov    %rax,%rdi
  806d0c:	48 b8 9f 6a 80 00 00 	movabs $0x806a9f,%rax
  806d13:	00 00 00 
  806d16:	ff d0                	callq  *%rax
  806d18:	85 c0                	test   %eax,%eax
  806d1a:	74 07                	je     806d23 <devpipe_write+0x67>
  806d1c:	b8 00 00 00 00       	mov    $0x0,%eax
  806d21:	eb 79                	jmp    806d9c <devpipe_write+0xe0>
  806d23:	48 b8 dc 47 80 00 00 	movabs $0x8047dc,%rax
  806d2a:	00 00 00 
  806d2d:	ff d0                	callq  *%rax
  806d2f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806d33:	8b 40 04             	mov    0x4(%rax),%eax
  806d36:	48 63 d0             	movslq %eax,%rdx
  806d39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806d3d:	8b 00                	mov    (%rax),%eax
  806d3f:	48 98                	cltq   
  806d41:	48 83 c0 20          	add    $0x20,%rax
  806d45:	48 39 c2             	cmp    %rax,%rdx
  806d48:	73 b4                	jae    806cfe <devpipe_write+0x42>
  806d4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806d4e:	8b 40 04             	mov    0x4(%rax),%eax
  806d51:	99                   	cltd   
  806d52:	c1 ea 1b             	shr    $0x1b,%edx
  806d55:	01 d0                	add    %edx,%eax
  806d57:	83 e0 1f             	and    $0x1f,%eax
  806d5a:	29 d0                	sub    %edx,%eax
  806d5c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  806d60:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  806d64:	48 01 ca             	add    %rcx,%rdx
  806d67:	0f b6 0a             	movzbl (%rdx),%ecx
  806d6a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806d6e:	48 98                	cltq   
  806d70:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  806d74:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806d78:	8b 40 04             	mov    0x4(%rax),%eax
  806d7b:	8d 50 01             	lea    0x1(%rax),%edx
  806d7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806d82:	89 50 04             	mov    %edx,0x4(%rax)
  806d85:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  806d8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806d8e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  806d92:	0f 82 64 ff ff ff    	jb     806cfc <devpipe_write+0x40>
  806d98:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806d9c:	c9                   	leaveq 
  806d9d:	c3                   	retq   

0000000000806d9e <devpipe_stat>:
  806d9e:	55                   	push   %rbp
  806d9f:	48 89 e5             	mov    %rsp,%rbp
  806da2:	48 83 ec 20          	sub    $0x20,%rsp
  806da6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  806daa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  806dae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806db2:	48 89 c7             	mov    %rax,%rdi
  806db5:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  806dbc:	00 00 00 
  806dbf:	ff d0                	callq  *%rax
  806dc1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  806dc5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806dc9:	48 be 46 7e 80 00 00 	movabs $0x807e46,%rsi
  806dd0:	00 00 00 
  806dd3:	48 89 c7             	mov    %rax,%rdi
  806dd6:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  806ddd:	00 00 00 
  806de0:	ff d0                	callq  *%rax
  806de2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806de6:	8b 50 04             	mov    0x4(%rax),%edx
  806de9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806ded:	8b 00                	mov    (%rax),%eax
  806def:	29 c2                	sub    %eax,%edx
  806df1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806df5:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  806dfb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806dff:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  806e06:	00 00 00 
  806e09:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806e0d:	48 b9 60 21 81 00 00 	movabs $0x812160,%rcx
  806e14:	00 00 00 
  806e17:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  806e1e:	b8 00 00 00 00       	mov    $0x0,%eax
  806e23:	c9                   	leaveq 
  806e24:	c3                   	retq   

0000000000806e25 <devpipe_close>:
  806e25:	55                   	push   %rbp
  806e26:	48 89 e5             	mov    %rsp,%rbp
  806e29:	48 83 ec 10          	sub    $0x10,%rsp
  806e2d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  806e31:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806e35:	48 89 c6             	mov    %rax,%rsi
  806e38:	bf 00 00 00 00       	mov    $0x0,%edi
  806e3d:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  806e44:	00 00 00 
  806e47:	ff d0                	callq  *%rax
  806e49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806e4d:	48 89 c7             	mov    %rax,%rdi
  806e50:	48 b8 0c 50 80 00 00 	movabs $0x80500c,%rax
  806e57:	00 00 00 
  806e5a:	ff d0                	callq  *%rax
  806e5c:	48 89 c6             	mov    %rax,%rsi
  806e5f:	bf 00 00 00 00       	mov    $0x0,%edi
  806e64:	48 b8 c5 48 80 00 00 	movabs $0x8048c5,%rax
  806e6b:	00 00 00 
  806e6e:	ff d0                	callq  *%rax
  806e70:	c9                   	leaveq 
  806e71:	c3                   	retq   

0000000000806e72 <cputchar>:
  806e72:	55                   	push   %rbp
  806e73:	48 89 e5             	mov    %rsp,%rbp
  806e76:	48 83 ec 20          	sub    $0x20,%rsp
  806e7a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806e7d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806e80:	88 45 ff             	mov    %al,-0x1(%rbp)
  806e83:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  806e87:	be 01 00 00 00       	mov    $0x1,%esi
  806e8c:	48 89 c7             	mov    %rax,%rdi
  806e8f:	48 b8 d2 46 80 00 00 	movabs $0x8046d2,%rax
  806e96:	00 00 00 
  806e99:	ff d0                	callq  *%rax
  806e9b:	c9                   	leaveq 
  806e9c:	c3                   	retq   

0000000000806e9d <getchar>:
  806e9d:	55                   	push   %rbp
  806e9e:	48 89 e5             	mov    %rsp,%rbp
  806ea1:	48 83 ec 10          	sub    $0x10,%rsp
  806ea5:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  806ea9:	ba 01 00 00 00       	mov    $0x1,%edx
  806eae:	48 89 c6             	mov    %rax,%rsi
  806eb1:	bf 00 00 00 00       	mov    $0x0,%edi
  806eb6:	48 b8 01 55 80 00 00 	movabs $0x805501,%rax
  806ebd:	00 00 00 
  806ec0:	ff d0                	callq  *%rax
  806ec2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806ec5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806ec9:	79 05                	jns    806ed0 <getchar+0x33>
  806ecb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806ece:	eb 14                	jmp    806ee4 <getchar+0x47>
  806ed0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806ed4:	7f 07                	jg     806edd <getchar+0x40>
  806ed6:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  806edb:	eb 07                	jmp    806ee4 <getchar+0x47>
  806edd:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  806ee1:	0f b6 c0             	movzbl %al,%eax
  806ee4:	c9                   	leaveq 
  806ee5:	c3                   	retq   

0000000000806ee6 <iscons>:
  806ee6:	55                   	push   %rbp
  806ee7:	48 89 e5             	mov    %rsp,%rbp
  806eea:	48 83 ec 20          	sub    $0x20,%rsp
  806eee:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806ef1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  806ef5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806ef8:	48 89 d6             	mov    %rdx,%rsi
  806efb:	89 c7                	mov    %eax,%edi
  806efd:	48 b8 cf 50 80 00 00 	movabs $0x8050cf,%rax
  806f04:	00 00 00 
  806f07:	ff d0                	callq  *%rax
  806f09:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806f0c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806f10:	79 05                	jns    806f17 <iscons+0x31>
  806f12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806f15:	eb 1a                	jmp    806f31 <iscons+0x4b>
  806f17:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806f1b:	8b 10                	mov    (%rax),%edx
  806f1d:	48 b8 a0 21 81 00 00 	movabs $0x8121a0,%rax
  806f24:	00 00 00 
  806f27:	8b 00                	mov    (%rax),%eax
  806f29:	39 c2                	cmp    %eax,%edx
  806f2b:	0f 94 c0             	sete   %al
  806f2e:	0f b6 c0             	movzbl %al,%eax
  806f31:	c9                   	leaveq 
  806f32:	c3                   	retq   

0000000000806f33 <opencons>:
  806f33:	55                   	push   %rbp
  806f34:	48 89 e5             	mov    %rsp,%rbp
  806f37:	48 83 ec 10          	sub    $0x10,%rsp
  806f3b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  806f3f:	48 89 c7             	mov    %rax,%rdi
  806f42:	48 b8 37 50 80 00 00 	movabs $0x805037,%rax
  806f49:	00 00 00 
  806f4c:	ff d0                	callq  *%rax
  806f4e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806f51:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806f55:	79 05                	jns    806f5c <opencons+0x29>
  806f57:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806f5a:	eb 5b                	jmp    806fb7 <opencons+0x84>
  806f5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806f60:	ba 07 04 00 00       	mov    $0x407,%edx
  806f65:	48 89 c6             	mov    %rax,%rsi
  806f68:	bf 00 00 00 00       	mov    $0x0,%edi
  806f6d:	48 b8 1a 48 80 00 00 	movabs $0x80481a,%rax
  806f74:	00 00 00 
  806f77:	ff d0                	callq  *%rax
  806f79:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806f7c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806f80:	79 05                	jns    806f87 <opencons+0x54>
  806f82:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806f85:	eb 30                	jmp    806fb7 <opencons+0x84>
  806f87:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806f8b:	48 ba a0 21 81 00 00 	movabs $0x8121a0,%rdx
  806f92:	00 00 00 
  806f95:	8b 12                	mov    (%rdx),%edx
  806f97:	89 10                	mov    %edx,(%rax)
  806f99:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806f9d:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  806fa4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806fa8:	48 89 c7             	mov    %rax,%rdi
  806fab:	48 b8 e9 4f 80 00 00 	movabs $0x804fe9,%rax
  806fb2:	00 00 00 
  806fb5:	ff d0                	callq  *%rax
  806fb7:	c9                   	leaveq 
  806fb8:	c3                   	retq   

0000000000806fb9 <devcons_read>:
  806fb9:	55                   	push   %rbp
  806fba:	48 89 e5             	mov    %rsp,%rbp
  806fbd:	48 83 ec 30          	sub    $0x30,%rsp
  806fc1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  806fc5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  806fc9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  806fcd:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  806fd2:	75 07                	jne    806fdb <devcons_read+0x22>
  806fd4:	b8 00 00 00 00       	mov    $0x0,%eax
  806fd9:	eb 4b                	jmp    807026 <devcons_read+0x6d>
  806fdb:	eb 0c                	jmp    806fe9 <devcons_read+0x30>
  806fdd:	48 b8 dc 47 80 00 00 	movabs $0x8047dc,%rax
  806fe4:	00 00 00 
  806fe7:	ff d0                	callq  *%rax
  806fe9:	48 b8 1c 47 80 00 00 	movabs $0x80471c,%rax
  806ff0:	00 00 00 
  806ff3:	ff d0                	callq  *%rax
  806ff5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806ff8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806ffc:	74 df                	je     806fdd <devcons_read+0x24>
  806ffe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  807002:	79 05                	jns    807009 <devcons_read+0x50>
  807004:	8b 45 fc             	mov    -0x4(%rbp),%eax
  807007:	eb 1d                	jmp    807026 <devcons_read+0x6d>
  807009:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80700d:	75 07                	jne    807016 <devcons_read+0x5d>
  80700f:	b8 00 00 00 00       	mov    $0x0,%eax
  807014:	eb 10                	jmp    807026 <devcons_read+0x6d>
  807016:	8b 45 fc             	mov    -0x4(%rbp),%eax
  807019:	89 c2                	mov    %eax,%edx
  80701b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80701f:	88 10                	mov    %dl,(%rax)
  807021:	b8 01 00 00 00       	mov    $0x1,%eax
  807026:	c9                   	leaveq 
  807027:	c3                   	retq   

0000000000807028 <devcons_write>:
  807028:	55                   	push   %rbp
  807029:	48 89 e5             	mov    %rsp,%rbp
  80702c:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  807033:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80703a:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  807041:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  807048:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80704f:	eb 76                	jmp    8070c7 <devcons_write+0x9f>
  807051:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  807058:	89 c2                	mov    %eax,%edx
  80705a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80705d:	29 c2                	sub    %eax,%edx
  80705f:	89 d0                	mov    %edx,%eax
  807061:	89 45 f8             	mov    %eax,-0x8(%rbp)
  807064:	8b 45 f8             	mov    -0x8(%rbp),%eax
  807067:	83 f8 7f             	cmp    $0x7f,%eax
  80706a:	76 07                	jbe    807073 <devcons_write+0x4b>
  80706c:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  807073:	8b 45 f8             	mov    -0x8(%rbp),%eax
  807076:	48 63 d0             	movslq %eax,%rdx
  807079:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80707c:	48 63 c8             	movslq %eax,%rcx
  80707f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  807086:	48 01 c1             	add    %rax,%rcx
  807089:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  807090:	48 89 ce             	mov    %rcx,%rsi
  807093:	48 89 c7             	mov    %rax,%rdi
  807096:	48 b8 0f 42 80 00 00 	movabs $0x80420f,%rax
  80709d:	00 00 00 
  8070a0:	ff d0                	callq  *%rax
  8070a2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8070a5:	48 63 d0             	movslq %eax,%rdx
  8070a8:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8070af:	48 89 d6             	mov    %rdx,%rsi
  8070b2:	48 89 c7             	mov    %rax,%rdi
  8070b5:	48 b8 d2 46 80 00 00 	movabs $0x8046d2,%rax
  8070bc:	00 00 00 
  8070bf:	ff d0                	callq  *%rax
  8070c1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8070c4:	01 45 fc             	add    %eax,-0x4(%rbp)
  8070c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8070ca:	48 98                	cltq   
  8070cc:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8070d3:	0f 82 78 ff ff ff    	jb     807051 <devcons_write+0x29>
  8070d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8070dc:	c9                   	leaveq 
  8070dd:	c3                   	retq   

00000000008070de <devcons_close>:
  8070de:	55                   	push   %rbp
  8070df:	48 89 e5             	mov    %rsp,%rbp
  8070e2:	48 83 ec 08          	sub    $0x8,%rsp
  8070e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8070ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8070ef:	c9                   	leaveq 
  8070f0:	c3                   	retq   

00000000008070f1 <devcons_stat>:
  8070f1:	55                   	push   %rbp
  8070f2:	48 89 e5             	mov    %rsp,%rbp
  8070f5:	48 83 ec 10          	sub    $0x10,%rsp
  8070f9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8070fd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  807101:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  807105:	48 be 52 7e 80 00 00 	movabs $0x807e52,%rsi
  80710c:	00 00 00 
  80710f:	48 89 c7             	mov    %rax,%rdi
  807112:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  807119:	00 00 00 
  80711c:	ff d0                	callq  *%rax
  80711e:	b8 00 00 00 00       	mov    $0x0,%eax
  807123:	c9                   	leaveq 
  807124:	c3                   	retq   
