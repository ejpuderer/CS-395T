
obj/user/testfile:     file format elf64-x86-64


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
  80003c:	e8 39 0c 00 00       	callq  800c7a <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <xopen>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80004f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800052:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800056:	48 89 c6             	mov    %rax,%rsi
  800059:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  800060:	00 00 00 
  800063:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  80006a:	00 00 00 
  80006d:	ff d0                	callq  *%rax
  80006f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  800076:	00 00 00 
  800079:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80007c:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  800082:	bf 01 00 00 00       	mov    $0x1,%edi
  800087:	48 b8 72 2a 80 00 00 	movabs $0x802a72,%rax
  80008e:	00 00 00 
  800091:	ff d0                	callq  *%rax
  800093:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800096:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800099:	b9 07 00 00 00       	mov    $0x7,%ecx
  80009e:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8000a5:	00 00 00 
  8000a8:	be 01 00 00 00       	mov    $0x1,%esi
  8000ad:	89 c7                	mov    %eax,%edi
  8000af:	48 b8 dc 29 80 00 00 	movabs $0x8029dc,%rax
  8000b6:	00 00 00 
  8000b9:	ff d0                	callq  *%rax
  8000bb:	ba 00 00 00 00       	mov    $0x0,%edx
  8000c0:	be 00 c0 cc cc       	mov    $0xccccc000,%esi
  8000c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8000ca:	48 b8 1b 29 80 00 00 	movabs $0x80291b,%rax
  8000d1:	00 00 00 
  8000d4:	ff d0                	callq  *%rax
  8000d6:	c9                   	leaveq 
  8000d7:	c3                   	retq   

00000000008000d8 <umain>:
  8000d8:	55                   	push   %rbp
  8000d9:	48 89 e5             	mov    %rsp,%rbp
  8000dc:	53                   	push   %rbx
  8000dd:	48 81 ec 18 03 00 00 	sub    $0x318,%rsp
  8000e4:	89 bd 2c fd ff ff    	mov    %edi,-0x2d4(%rbp)
  8000ea:	48 89 b5 20 fd ff ff 	mov    %rsi,-0x2e0(%rbp)
  8000f1:	be 00 00 00 00       	mov    $0x0,%esi
  8000f6:	48 bf 46 4c 80 00 00 	movabs $0x804c46,%rdi
  8000fd:	00 00 00 
  800100:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800107:	00 00 00 
  80010a:	ff d0                	callq  *%rax
  80010c:	48 98                	cltq   
  80010e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800112:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800117:	79 39                	jns    800152 <umain+0x7a>
  800119:	48 83 7d e0 f4       	cmpq   $0xfffffffffffffff4,-0x20(%rbp)
  80011e:	74 32                	je     800152 <umain+0x7a>
  800120:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800124:	48 89 c1             	mov    %rax,%rcx
  800127:	48 ba 51 4c 80 00 00 	movabs $0x804c51,%rdx
  80012e:	00 00 00 
  800131:	be 21 00 00 00       	mov    $0x21,%esi
  800136:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  80013d:	00 00 00 
  800140:	b8 00 00 00 00       	mov    $0x0,%eax
  800145:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80014c:	00 00 00 
  80014f:	41 ff d0             	callq  *%r8
  800152:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800157:	78 2a                	js     800183 <umain+0xab>
  800159:	48 ba 80 4c 80 00 00 	movabs $0x804c80,%rdx
  800160:	00 00 00 
  800163:	be 23 00 00 00       	mov    $0x23,%esi
  800168:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  80016f:	00 00 00 
  800172:	b8 00 00 00 00       	mov    $0x0,%eax
  800177:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  80017e:	00 00 00 
  800181:	ff d1                	callq  *%rcx
  800183:	be 00 00 00 00       	mov    $0x0,%esi
  800188:	48 bf a1 4c 80 00 00 	movabs $0x804ca1,%rdi
  80018f:	00 00 00 
  800192:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800199:	00 00 00 
  80019c:	ff d0                	callq  *%rax
  80019e:	48 98                	cltq   
  8001a0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8001a4:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8001a9:	79 32                	jns    8001dd <umain+0x105>
  8001ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8001af:	48 89 c1             	mov    %rax,%rcx
  8001b2:	48 ba aa 4c 80 00 00 	movabs $0x804caa,%rdx
  8001b9:	00 00 00 
  8001bc:	be 26 00 00 00       	mov    $0x26,%esi
  8001c1:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8001c8:	00 00 00 
  8001cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8001d0:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8001d7:	00 00 00 
  8001da:	41 ff d0             	callq  *%r8
  8001dd:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001e2:	8b 00                	mov    (%rax),%eax
  8001e4:	83 f8 66             	cmp    $0x66,%eax
  8001e7:	75 18                	jne    800201 <umain+0x129>
  8001e9:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001ee:	8b 40 04             	mov    0x4(%rax),%eax
  8001f1:	85 c0                	test   %eax,%eax
  8001f3:	75 0c                	jne    800201 <umain+0x129>
  8001f5:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001fa:	8b 40 08             	mov    0x8(%rax),%eax
  8001fd:	85 c0                	test   %eax,%eax
  8001ff:	74 2a                	je     80022b <umain+0x153>
  800201:	48 ba c8 4c 80 00 00 	movabs $0x804cc8,%rdx
  800208:	00 00 00 
  80020b:	be 28 00 00 00       	mov    $0x28,%esi
  800210:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800217:	00 00 00 
  80021a:	b8 00 00 00 00       	mov    $0x0,%eax
  80021f:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  800226:	00 00 00 
  800229:	ff d1                	callq  *%rcx
  80022b:	48 bf f5 4c 80 00 00 	movabs $0x804cf5,%rdi
  800232:	00 00 00 
  800235:	b8 00 00 00 00       	mov    $0x0,%eax
  80023a:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800241:	00 00 00 
  800244:	ff d2                	callq  *%rdx
  800246:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80024d:	00 00 00 
  800250:	48 8b 40 28          	mov    0x28(%rax),%rax
  800254:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80025b:	48 89 d6             	mov    %rdx,%rsi
  80025e:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800263:	ff d0                	callq  *%rax
  800265:	48 98                	cltq   
  800267:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80026b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800270:	79 32                	jns    8002a4 <umain+0x1cc>
  800272:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800276:	48 89 c1             	mov    %rax,%rcx
  800279:	48 ba 09 4d 80 00 00 	movabs $0x804d09,%rdx
  800280:	00 00 00 
  800283:	be 2c 00 00 00       	mov    $0x2c,%esi
  800288:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  80028f:	00 00 00 
  800292:	b8 00 00 00 00       	mov    $0x0,%eax
  800297:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80029e:	00 00 00 
  8002a1:	41 ff d0             	callq  *%r8
  8002a4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002ab:	00 00 00 
  8002ae:	48 8b 00             	mov    (%rax),%rax
  8002b1:	48 89 c7             	mov    %rax,%rdi
  8002b4:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  8002bb:	00 00 00 
  8002be:	ff d0                	callq  *%rax
  8002c0:	8b 55 b0             	mov    -0x50(%rbp),%edx
  8002c3:	39 d0                	cmp    %edx,%eax
  8002c5:	74 51                	je     800318 <umain+0x240>
  8002c7:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002ce:	00 00 00 
  8002d1:	48 8b 00             	mov    (%rax),%rax
  8002d4:	48 89 c7             	mov    %rax,%rdi
  8002d7:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  8002de:	00 00 00 
  8002e1:	ff d0                	callq  *%rax
  8002e3:	89 c2                	mov    %eax,%edx
  8002e5:	8b 45 b0             	mov    -0x50(%rbp),%eax
  8002e8:	41 89 d0             	mov    %edx,%r8d
  8002eb:	89 c1                	mov    %eax,%ecx
  8002ed:	48 ba 18 4d 80 00 00 	movabs $0x804d18,%rdx
  8002f4:	00 00 00 
  8002f7:	be 2e 00 00 00       	mov    $0x2e,%esi
  8002fc:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800303:	00 00 00 
  800306:	b8 00 00 00 00       	mov    $0x0,%eax
  80030b:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  800312:	00 00 00 
  800315:	41 ff d1             	callq  *%r9
  800318:	48 bf 3e 4d 80 00 00 	movabs $0x804d3e,%rdi
  80031f:	00 00 00 
  800322:	b8 00 00 00 00       	mov    $0x0,%eax
  800327:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  80032e:	00 00 00 
  800331:	ff d2                	callq  *%rdx
  800333:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  80033a:	ba 00 02 00 00       	mov    $0x200,%edx
  80033f:	be 00 00 00 00       	mov    $0x0,%esi
  800344:	48 89 c7             	mov    %rax,%rdi
  800347:	48 b8 a7 1d 80 00 00 	movabs $0x801da7,%rax
  80034e:	00 00 00 
  800351:	ff d0                	callq  *%rax
  800353:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80035a:	00 00 00 
  80035d:	48 8b 40 10          	mov    0x10(%rax),%rax
  800361:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  800368:	ba 00 02 00 00       	mov    $0x200,%edx
  80036d:	48 89 ce             	mov    %rcx,%rsi
  800370:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800375:	ff d0                	callq  *%rax
  800377:	48 98                	cltq   
  800379:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80037d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800382:	79 32                	jns    8003b6 <umain+0x2de>
  800384:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800388:	48 89 c1             	mov    %rax,%rcx
  80038b:	48 ba 51 4d 80 00 00 	movabs $0x804d51,%rdx
  800392:	00 00 00 
  800395:	be 33 00 00 00       	mov    $0x33,%esi
  80039a:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8003a1:	00 00 00 
  8003a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8003a9:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8003b0:	00 00 00 
  8003b3:	41 ff d0             	callq  *%r8
  8003b6:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8003bd:	00 00 00 
  8003c0:	48 8b 10             	mov    (%rax),%rdx
  8003c3:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8003ca:	48 89 d6             	mov    %rdx,%rsi
  8003cd:	48 89 c7             	mov    %rax,%rdi
  8003d0:	48 b8 70 1c 80 00 00 	movabs $0x801c70,%rax
  8003d7:	00 00 00 
  8003da:	ff d0                	callq  *%rax
  8003dc:	85 c0                	test   %eax,%eax
  8003de:	74 2a                	je     80040a <umain+0x332>
  8003e0:	48 ba 5f 4d 80 00 00 	movabs $0x804d5f,%rdx
  8003e7:	00 00 00 
  8003ea:	be 35 00 00 00       	mov    $0x35,%esi
  8003ef:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8003f6:	00 00 00 
  8003f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8003fe:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  800405:	00 00 00 
  800408:	ff d1                	callq  *%rcx
  80040a:	48 bf 7d 4d 80 00 00 	movabs $0x804d7d,%rdi
  800411:	00 00 00 
  800414:	b8 00 00 00 00       	mov    $0x0,%eax
  800419:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800420:	00 00 00 
  800423:	ff d2                	callq  *%rdx
  800425:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80042c:	00 00 00 
  80042f:	48 8b 40 20          	mov    0x20(%rax),%rax
  800433:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800438:	ff d0                	callq  *%rax
  80043a:	48 98                	cltq   
  80043c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800440:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800445:	79 32                	jns    800479 <umain+0x3a1>
  800447:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80044b:	48 89 c1             	mov    %rax,%rcx
  80044e:	48 ba 90 4d 80 00 00 	movabs $0x804d90,%rdx
  800455:	00 00 00 
  800458:	be 39 00 00 00       	mov    $0x39,%esi
  80045d:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800464:	00 00 00 
  800467:	b8 00 00 00 00       	mov    $0x0,%eax
  80046c:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  800473:	00 00 00 
  800476:	41 ff d0             	callq  *%r8
  800479:	48 bf 9f 4d 80 00 00 	movabs $0x804d9f,%rdi
  800480:	00 00 00 
  800483:	b8 00 00 00 00       	mov    $0x0,%eax
  800488:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  80048f:	00 00 00 
  800492:	ff d2                	callq  *%rdx
  800494:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  800499:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80049d:	48 8b 00             	mov    (%rax),%rax
  8004a0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  8004a4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8004a8:	be 00 c0 cc cc       	mov    $0xccccc000,%esi
  8004ad:	bf 00 00 00 00       	mov    $0x0,%edi
  8004b2:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  8004b9:	00 00 00 
  8004bc:	ff d0                	callq  *%rax
  8004be:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8004c5:	00 00 00 
  8004c8:	48 8b 40 10          	mov    0x10(%rax),%rax
  8004cc:	48 8d b5 30 fd ff ff 	lea    -0x2d0(%rbp),%rsi
  8004d3:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  8004d7:	ba 00 02 00 00       	mov    $0x200,%edx
  8004dc:	48 89 cf             	mov    %rcx,%rdi
  8004df:	ff d0                	callq  *%rax
  8004e1:	48 98                	cltq   
  8004e3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8004e7:	48 83 7d e0 fd       	cmpq   $0xfffffffffffffffd,-0x20(%rbp)
  8004ec:	74 32                	je     800520 <umain+0x448>
  8004ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8004f2:	48 89 c1             	mov    %rax,%rcx
  8004f5:	48 ba b8 4d 80 00 00 	movabs $0x804db8,%rdx
  8004fc:	00 00 00 
  8004ff:	be 44 00 00 00       	mov    $0x44,%esi
  800504:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  80050b:	00 00 00 
  80050e:	b8 00 00 00 00       	mov    $0x0,%eax
  800513:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80051a:	00 00 00 
  80051d:	41 ff d0             	callq  *%r8
  800520:	48 bf ef 4d 80 00 00 	movabs $0x804def,%rdi
  800527:	00 00 00 
  80052a:	b8 00 00 00 00       	mov    $0x0,%eax
  80052f:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800536:	00 00 00 
  800539:	ff d2                	callq  *%rdx
  80053b:	be 02 01 00 00       	mov    $0x102,%esi
  800540:	48 bf 05 4e 80 00 00 	movabs $0x804e05,%rdi
  800547:	00 00 00 
  80054a:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800551:	00 00 00 
  800554:	ff d0                	callq  *%rax
  800556:	48 98                	cltq   
  800558:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80055c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800561:	79 32                	jns    800595 <umain+0x4bd>
  800563:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800567:	48 89 c1             	mov    %rax,%rcx
  80056a:	48 ba 0f 4e 80 00 00 	movabs $0x804e0f,%rdx
  800571:	00 00 00 
  800574:	be 49 00 00 00       	mov    $0x49,%esi
  800579:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800580:	00 00 00 
  800583:	b8 00 00 00 00       	mov    $0x0,%eax
  800588:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80058f:	00 00 00 
  800592:	41 ff d0             	callq  *%r8
  800595:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80059c:	00 00 00 
  80059f:	48 8b 10             	mov    (%rax),%rdx
  8005a2:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8005a9:	00 00 00 
  8005ac:	48 8b 70 18          	mov    0x18(%rax),%rsi
  8005b0:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8005b7:	00 00 00 
  8005ba:	48 8b 08             	mov    (%rax),%rcx
  8005bd:	48 89 0c 24          	mov    %rcx,(%rsp)
  8005c1:	48 8b 48 08          	mov    0x8(%rax),%rcx
  8005c5:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  8005ca:	48 8b 48 10          	mov    0x10(%rax),%rcx
  8005ce:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  8005d3:	48 8b 48 18          	mov    0x18(%rax),%rcx
  8005d7:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  8005dc:	48 8b 48 20          	mov    0x20(%rax),%rcx
  8005e0:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
  8005e5:	48 8b 48 28          	mov    0x28(%rax),%rcx
  8005e9:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
  8005ee:	48 8b 40 30          	mov    0x30(%rax),%rax
  8005f2:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  8005f7:	b9 00 c0 cc cc       	mov    $0xccccc000,%ecx
  8005fc:	48 bf 28 4e 80 00 00 	movabs $0x804e28,%rdi
  800603:	00 00 00 
  800606:	b8 00 00 00 00       	mov    $0x0,%eax
  80060b:	49 b8 59 0f 80 00 00 	movabs $0x800f59,%r8
  800612:	00 00 00 
  800615:	41 ff d0             	callq  *%r8
  800618:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80061f:	00 00 00 
  800622:	48 8b 58 18          	mov    0x18(%rax),%rbx
  800626:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80062d:	00 00 00 
  800630:	48 8b 00             	mov    (%rax),%rax
  800633:	48 89 c7             	mov    %rax,%rdi
  800636:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  80063d:	00 00 00 
  800640:	ff d0                	callq  *%rax
  800642:	48 63 d0             	movslq %eax,%rdx
  800645:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80064c:	00 00 00 
  80064f:	48 8b 00             	mov    (%rax),%rax
  800652:	48 89 c6             	mov    %rax,%rsi
  800655:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  80065a:	ff d3                	callq  *%rbx
  80065c:	48 98                	cltq   
  80065e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800662:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800669:	00 00 00 
  80066c:	48 8b 00             	mov    (%rax),%rax
  80066f:	48 89 c7             	mov    %rax,%rdi
  800672:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  800679:	00 00 00 
  80067c:	ff d0                	callq  *%rax
  80067e:	48 98                	cltq   
  800680:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
  800684:	74 32                	je     8006b8 <umain+0x5e0>
  800686:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80068a:	48 89 c1             	mov    %rax,%rcx
  80068d:	48 ba 68 4e 80 00 00 	movabs $0x804e68,%rdx
  800694:	00 00 00 
  800697:	be 4e 00 00 00       	mov    $0x4e,%esi
  80069c:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8006a3:	00 00 00 
  8006a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ab:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8006b2:	00 00 00 
  8006b5:	41 ff d0             	callq  *%r8
  8006b8:	48 bf 77 4e 80 00 00 	movabs $0x804e77,%rdi
  8006bf:	00 00 00 
  8006c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c7:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  8006ce:	00 00 00 
  8006d1:	ff d2                	callq  *%rdx
  8006d3:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8006d8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  8006df:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8006e6:	ba 00 02 00 00       	mov    $0x200,%edx
  8006eb:	be 00 00 00 00       	mov    $0x0,%esi
  8006f0:	48 89 c7             	mov    %rax,%rdi
  8006f3:	48 b8 a7 1d 80 00 00 	movabs $0x801da7,%rax
  8006fa:	00 00 00 
  8006fd:	ff d0                	callq  *%rax
  8006ff:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  800706:	00 00 00 
  800709:	48 8b 40 10          	mov    0x10(%rax),%rax
  80070d:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  800714:	ba 00 02 00 00       	mov    $0x200,%edx
  800719:	48 89 ce             	mov    %rcx,%rsi
  80071c:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800721:	ff d0                	callq  *%rax
  800723:	48 98                	cltq   
  800725:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800729:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80072e:	79 32                	jns    800762 <umain+0x68a>
  800730:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800734:	48 89 c1             	mov    %rax,%rcx
  800737:	48 ba 90 4e 80 00 00 	movabs $0x804e90,%rdx
  80073e:	00 00 00 
  800741:	be 54 00 00 00       	mov    $0x54,%esi
  800746:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  80074d:	00 00 00 
  800750:	b8 00 00 00 00       	mov    $0x0,%eax
  800755:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80075c:	00 00 00 
  80075f:	41 ff d0             	callq  *%r8
  800762:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800769:	00 00 00 
  80076c:	48 8b 00             	mov    (%rax),%rax
  80076f:	48 89 c7             	mov    %rax,%rdi
  800772:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  800779:	00 00 00 
  80077c:	ff d0                	callq  *%rax
  80077e:	48 98                	cltq   
  800780:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
  800784:	74 32                	je     8007b8 <umain+0x6e0>
  800786:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80078a:	48 89 c1             	mov    %rax,%rcx
  80078d:	48 ba b0 4e 80 00 00 	movabs $0x804eb0,%rdx
  800794:	00 00 00 
  800797:	be 56 00 00 00       	mov    $0x56,%esi
  80079c:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8007a3:	00 00 00 
  8007a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ab:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8007b2:	00 00 00 
  8007b5:	41 ff d0             	callq  *%r8
  8007b8:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8007bf:	00 00 00 
  8007c2:	48 8b 10             	mov    (%rax),%rdx
  8007c5:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8007cc:	48 89 d6             	mov    %rdx,%rsi
  8007cf:	48 89 c7             	mov    %rax,%rdi
  8007d2:	48 b8 70 1c 80 00 00 	movabs $0x801c70,%rax
  8007d9:	00 00 00 
  8007dc:	ff d0                	callq  *%rax
  8007de:	85 c0                	test   %eax,%eax
  8007e0:	74 2a                	je     80080c <umain+0x734>
  8007e2:	48 ba e8 4e 80 00 00 	movabs $0x804ee8,%rdx
  8007e9:	00 00 00 
  8007ec:	be 58 00 00 00       	mov    $0x58,%esi
  8007f1:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8007f8:	00 00 00 
  8007fb:	b8 00 00 00 00       	mov    $0x0,%eax
  800800:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  800807:	00 00 00 
  80080a:	ff d1                	callq  *%rcx
  80080c:	48 bf 18 4f 80 00 00 	movabs $0x804f18,%rdi
  800813:	00 00 00 
  800816:	b8 00 00 00 00       	mov    $0x0,%eax
  80081b:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800822:	00 00 00 
  800825:	ff d2                	callq  *%rdx
  800827:	be 00 00 00 00       	mov    $0x0,%esi
  80082c:	48 bf 46 4c 80 00 00 	movabs $0x804c46,%rdi
  800833:	00 00 00 
  800836:	48 b8 d2 34 80 00 00 	movabs $0x8034d2,%rax
  80083d:	00 00 00 
  800840:	ff d0                	callq  *%rax
  800842:	48 98                	cltq   
  800844:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800848:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80084d:	79 39                	jns    800888 <umain+0x7b0>
  80084f:	48 83 7d e0 f4       	cmpq   $0xfffffffffffffff4,-0x20(%rbp)
  800854:	74 32                	je     800888 <umain+0x7b0>
  800856:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80085a:	48 89 c1             	mov    %rax,%rcx
  80085d:	48 ba 3c 4f 80 00 00 	movabs $0x804f3c,%rdx
  800864:	00 00 00 
  800867:	be 5d 00 00 00       	mov    $0x5d,%esi
  80086c:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800873:	00 00 00 
  800876:	b8 00 00 00 00       	mov    $0x0,%eax
  80087b:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  800882:	00 00 00 
  800885:	41 ff d0             	callq  *%r8
  800888:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80088d:	78 2a                	js     8008b9 <umain+0x7e1>
  80088f:	48 ba 50 4f 80 00 00 	movabs $0x804f50,%rdx
  800896:	00 00 00 
  800899:	be 5f 00 00 00       	mov    $0x5f,%esi
  80089e:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8008a5:	00 00 00 
  8008a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8008ad:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  8008b4:	00 00 00 
  8008b7:	ff d1                	callq  *%rcx
  8008b9:	be 00 00 00 00       	mov    $0x0,%esi
  8008be:	48 bf a1 4c 80 00 00 	movabs $0x804ca1,%rdi
  8008c5:	00 00 00 
  8008c8:	48 b8 d2 34 80 00 00 	movabs $0x8034d2,%rax
  8008cf:	00 00 00 
  8008d2:	ff d0                	callq  *%rax
  8008d4:	48 98                	cltq   
  8008d6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8008da:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8008df:	79 32                	jns    800913 <umain+0x83b>
  8008e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8008e5:	48 89 c1             	mov    %rax,%rcx
  8008e8:	48 ba 6b 4f 80 00 00 	movabs $0x804f6b,%rdx
  8008ef:	00 00 00 
  8008f2:	be 62 00 00 00       	mov    $0x62,%esi
  8008f7:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8008fe:	00 00 00 
  800901:	b8 00 00 00 00       	mov    $0x0,%eax
  800906:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80090d:	00 00 00 
  800910:	41 ff d0             	callq  *%r8
  800913:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800917:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80091d:	48 c1 e0 0c          	shl    $0xc,%rax
  800921:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800925:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800929:	8b 00                	mov    (%rax),%eax
  80092b:	83 f8 66             	cmp    $0x66,%eax
  80092e:	75 16                	jne    800946 <umain+0x86e>
  800930:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800934:	8b 40 04             	mov    0x4(%rax),%eax
  800937:	85 c0                	test   %eax,%eax
  800939:	75 0b                	jne    800946 <umain+0x86e>
  80093b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80093f:	8b 40 08             	mov    0x8(%rax),%eax
  800942:	85 c0                	test   %eax,%eax
  800944:	74 2a                	je     800970 <umain+0x898>
  800946:	48 ba 80 4f 80 00 00 	movabs $0x804f80,%rdx
  80094d:	00 00 00 
  800950:	be 65 00 00 00       	mov    $0x65,%esi
  800955:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  80095c:	00 00 00 
  80095f:	b8 00 00 00 00       	mov    $0x0,%eax
  800964:	48 b9 20 0d 80 00 00 	movabs $0x800d20,%rcx
  80096b:	00 00 00 
  80096e:	ff d1                	callq  *%rcx
  800970:	48 bf a7 4f 80 00 00 	movabs $0x804fa7,%rdi
  800977:	00 00 00 
  80097a:	b8 00 00 00 00       	mov    $0x0,%eax
  80097f:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800986:	00 00 00 
  800989:	ff d2                	callq  *%rdx
  80098b:	be 01 01 00 00       	mov    $0x101,%esi
  800990:	48 bf b5 4f 80 00 00 	movabs $0x804fb5,%rdi
  800997:	00 00 00 
  80099a:	48 b8 d2 34 80 00 00 	movabs $0x8034d2,%rax
  8009a1:	00 00 00 
  8009a4:	ff d0                	callq  *%rax
  8009a6:	48 98                	cltq   
  8009a8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8009ac:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8009b1:	79 32                	jns    8009e5 <umain+0x90d>
  8009b3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8009b7:	48 89 c1             	mov    %rax,%rcx
  8009ba:	48 ba ba 4f 80 00 00 	movabs $0x804fba,%rdx
  8009c1:	00 00 00 
  8009c4:	be 6a 00 00 00       	mov    $0x6a,%esi
  8009c9:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  8009d0:	00 00 00 
  8009d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8009d8:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8009df:	00 00 00 
  8009e2:	41 ff d0             	callq  *%r8
  8009e5:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8009ec:	ba 00 02 00 00       	mov    $0x200,%edx
  8009f1:	be 00 00 00 00       	mov    $0x0,%esi
  8009f6:	48 89 c7             	mov    %rax,%rdi
  8009f9:	48 b8 a7 1d 80 00 00 	movabs $0x801da7,%rax
  800a00:	00 00 00 
  800a03:	ff d0                	callq  *%rax
  800a05:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  800a0c:	00 
  800a0d:	e9 82 00 00 00       	jmpq   800a94 <umain+0x9bc>
  800a12:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800a19:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a1d:	89 10                	mov    %edx,(%rax)
  800a1f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800a23:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  800a2a:	ba 00 02 00 00       	mov    $0x200,%edx
  800a2f:	48 89 ce             	mov    %rcx,%rsi
  800a32:	89 c7                	mov    %eax,%edi
  800a34:	48 b8 46 31 80 00 00 	movabs $0x803146,%rax
  800a3b:	00 00 00 
  800a3e:	ff d0                	callq  *%rax
  800a40:	48 98                	cltq   
  800a42:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800a46:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800a4b:	79 39                	jns    800a86 <umain+0x9ae>
  800a4d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800a51:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a55:	49 89 d0             	mov    %rdx,%r8
  800a58:	48 89 c1             	mov    %rax,%rcx
  800a5b:	48 ba c9 4f 80 00 00 	movabs $0x804fc9,%rdx
  800a62:	00 00 00 
  800a65:	be 6f 00 00 00       	mov    $0x6f,%esi
  800a6a:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800a71:	00 00 00 
  800a74:	b8 00 00 00 00       	mov    $0x0,%eax
  800a79:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  800a80:	00 00 00 
  800a83:	41 ff d1             	callq  *%r9
  800a86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a8a:	48 05 00 02 00 00    	add    $0x200,%rax
  800a90:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a94:	48 81 7d e8 ff df 01 	cmpq   $0x1dfff,-0x18(%rbp)
  800a9b:	00 
  800a9c:	0f 8e 70 ff ff ff    	jle    800a12 <umain+0x93a>
  800aa2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800aa6:	89 c7                	mov    %eax,%edi
  800aa8:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  800aaf:	00 00 00 
  800ab2:	ff d0                	callq  *%rax
  800ab4:	be 00 00 00 00       	mov    $0x0,%esi
  800ab9:	48 bf b5 4f 80 00 00 	movabs $0x804fb5,%rdi
  800ac0:	00 00 00 
  800ac3:	48 b8 d2 34 80 00 00 	movabs $0x8034d2,%rax
  800aca:	00 00 00 
  800acd:	ff d0                	callq  *%rax
  800acf:	48 98                	cltq   
  800ad1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800ad5:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  800ada:	79 32                	jns    800b0e <umain+0xa36>
  800adc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800ae0:	48 89 c1             	mov    %rax,%rcx
  800ae3:	48 ba db 4f 80 00 00 	movabs $0x804fdb,%rdx
  800aea:	00 00 00 
  800aed:	be 74 00 00 00       	mov    $0x74,%esi
  800af2:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800af9:	00 00 00 
  800afc:	b8 00 00 00 00       	mov    $0x0,%eax
  800b01:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  800b08:	00 00 00 
  800b0b:	41 ff d0             	callq  *%r8
  800b0e:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  800b15:	00 
  800b16:	e9 1a 01 00 00       	jmpq   800c35 <umain+0xb5d>
  800b1b:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800b22:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b26:	89 10                	mov    %edx,(%rax)
  800b28:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800b2c:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  800b33:	ba 00 02 00 00       	mov    $0x200,%edx
  800b38:	48 89 ce             	mov    %rcx,%rsi
  800b3b:	89 c7                	mov    %eax,%edi
  800b3d:	48 b8 d1 30 80 00 00 	movabs $0x8030d1,%rax
  800b44:	00 00 00 
  800b47:	ff d0                	callq  *%rax
  800b49:	48 98                	cltq   
  800b4b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800b4f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800b54:	79 39                	jns    800b8f <umain+0xab7>
  800b56:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800b5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b5e:	49 89 d0             	mov    %rdx,%r8
  800b61:	48 89 c1             	mov    %rax,%rcx
  800b64:	48 ba e9 4f 80 00 00 	movabs $0x804fe9,%rdx
  800b6b:	00 00 00 
  800b6e:	be 78 00 00 00       	mov    $0x78,%esi
  800b73:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800b7a:	00 00 00 
  800b7d:	b8 00 00 00 00       	mov    $0x0,%eax
  800b82:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  800b89:	00 00 00 
  800b8c:	41 ff d1             	callq  *%r9
  800b8f:	48 81 7d e0 00 02 00 	cmpq   $0x200,-0x20(%rbp)
  800b96:	00 
  800b97:	74 3f                	je     800bd8 <umain+0xb00>
  800b99:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800b9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ba1:	41 b9 00 02 00 00    	mov    $0x200,%r9d
  800ba7:	49 89 d0             	mov    %rdx,%r8
  800baa:	48 89 c1             	mov    %rax,%rcx
  800bad:	48 ba 00 50 80 00 00 	movabs $0x805000,%rdx
  800bb4:	00 00 00 
  800bb7:	be 7b 00 00 00       	mov    $0x7b,%esi
  800bbc:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800bc3:	00 00 00 
  800bc6:	b8 00 00 00 00       	mov    $0x0,%eax
  800bcb:	49 ba 20 0d 80 00 00 	movabs $0x800d20,%r10
  800bd2:	00 00 00 
  800bd5:	41 ff d2             	callq  *%r10
  800bd8:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800bdf:	8b 00                	mov    (%rax),%eax
  800be1:	48 98                	cltq   
  800be3:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800be7:	74 3e                	je     800c27 <umain+0xb4f>
  800be9:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800bf0:	8b 10                	mov    (%rax),%edx
  800bf2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bf6:	41 89 d0             	mov    %edx,%r8d
  800bf9:	48 89 c1             	mov    %rax,%rcx
  800bfc:	48 ba 30 50 80 00 00 	movabs $0x805030,%rdx
  800c03:	00 00 00 
  800c06:	be 7e 00 00 00       	mov    $0x7e,%esi
  800c0b:	48 bf 6b 4c 80 00 00 	movabs $0x804c6b,%rdi
  800c12:	00 00 00 
  800c15:	b8 00 00 00 00       	mov    $0x0,%eax
  800c1a:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  800c21:	00 00 00 
  800c24:	41 ff d1             	callq  *%r9
  800c27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c2b:	48 05 00 02 00 00    	add    $0x200,%rax
  800c31:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c35:	48 81 7d e8 ff df 01 	cmpq   $0x1dfff,-0x18(%rbp)
  800c3c:	00 
  800c3d:	0f 8e d8 fe ff ff    	jle    800b1b <umain+0xa43>
  800c43:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800c47:	89 c7                	mov    %eax,%edi
  800c49:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  800c50:	00 00 00 
  800c53:	ff d0                	callq  *%rax
  800c55:	48 bf 57 50 80 00 00 	movabs $0x805057,%rdi
  800c5c:	00 00 00 
  800c5f:	b8 00 00 00 00       	mov    $0x0,%eax
  800c64:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800c6b:	00 00 00 
  800c6e:	ff d2                	callq  *%rdx
  800c70:	48 81 c4 18 03 00 00 	add    $0x318,%rsp
  800c77:	5b                   	pop    %rbx
  800c78:	5d                   	pop    %rbp
  800c79:	c3                   	retq   

0000000000800c7a <libmain>:
  800c7a:	55                   	push   %rbp
  800c7b:	48 89 e5             	mov    %rsp,%rbp
  800c7e:	48 83 ec 10          	sub    $0x10,%rsp
  800c82:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c85:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c89:	48 b8 c1 23 80 00 00 	movabs $0x8023c1,%rax
  800c90:	00 00 00 
  800c93:	ff d0                	callq  *%rax
  800c95:	25 ff 03 00 00       	and    $0x3ff,%eax
  800c9a:	48 98                	cltq   
  800c9c:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800ca3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800caa:	00 00 00 
  800cad:	48 01 c2             	add    %rax,%rdx
  800cb0:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800cb7:	00 00 00 
  800cba:	48 89 10             	mov    %rdx,(%rax)
  800cbd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800cc1:	7e 14                	jle    800cd7 <libmain+0x5d>
  800cc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cc7:	48 8b 10             	mov    (%rax),%rdx
  800cca:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800cd1:	00 00 00 
  800cd4:	48 89 10             	mov    %rdx,(%rax)
  800cd7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800cdb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800cde:	48 89 d6             	mov    %rdx,%rsi
  800ce1:	89 c7                	mov    %eax,%edi
  800ce3:	48 b8 d8 00 80 00 00 	movabs $0x8000d8,%rax
  800cea:	00 00 00 
  800ced:	ff d0                	callq  *%rax
  800cef:	48 b8 fd 0c 80 00 00 	movabs $0x800cfd,%rax
  800cf6:	00 00 00 
  800cf9:	ff d0                	callq  *%rax
  800cfb:	c9                   	leaveq 
  800cfc:	c3                   	retq   

0000000000800cfd <exit>:
  800cfd:	55                   	push   %rbp
  800cfe:	48 89 e5             	mov    %rsp,%rbp
  800d01:	48 b8 25 2e 80 00 00 	movabs $0x802e25,%rax
  800d08:	00 00 00 
  800d0b:	ff d0                	callq  *%rax
  800d0d:	bf 00 00 00 00       	mov    $0x0,%edi
  800d12:	48 b8 7d 23 80 00 00 	movabs $0x80237d,%rax
  800d19:	00 00 00 
  800d1c:	ff d0                	callq  *%rax
  800d1e:	5d                   	pop    %rbp
  800d1f:	c3                   	retq   

0000000000800d20 <_panic>:
  800d20:	55                   	push   %rbp
  800d21:	48 89 e5             	mov    %rsp,%rbp
  800d24:	53                   	push   %rbx
  800d25:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800d2c:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800d33:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800d39:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800d40:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800d47:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800d4e:	84 c0                	test   %al,%al
  800d50:	74 23                	je     800d75 <_panic+0x55>
  800d52:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800d59:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800d5d:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800d61:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800d65:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800d69:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800d6d:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800d71:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800d75:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800d7c:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800d83:	00 00 00 
  800d86:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800d8d:	00 00 00 
  800d90:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800d94:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800d9b:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800da2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800da9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800db0:	00 00 00 
  800db3:	48 8b 18             	mov    (%rax),%rbx
  800db6:	48 b8 c1 23 80 00 00 	movabs $0x8023c1,%rax
  800dbd:	00 00 00 
  800dc0:	ff d0                	callq  *%rax
  800dc2:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800dc8:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800dcf:	41 89 c8             	mov    %ecx,%r8d
  800dd2:	48 89 d1             	mov    %rdx,%rcx
  800dd5:	48 89 da             	mov    %rbx,%rdx
  800dd8:	89 c6                	mov    %eax,%esi
  800dda:	48 bf 78 50 80 00 00 	movabs $0x805078,%rdi
  800de1:	00 00 00 
  800de4:	b8 00 00 00 00       	mov    $0x0,%eax
  800de9:	49 b9 59 0f 80 00 00 	movabs $0x800f59,%r9
  800df0:	00 00 00 
  800df3:	41 ff d1             	callq  *%r9
  800df6:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800dfd:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800e04:	48 89 d6             	mov    %rdx,%rsi
  800e07:	48 89 c7             	mov    %rax,%rdi
  800e0a:	48 b8 ad 0e 80 00 00 	movabs $0x800ead,%rax
  800e11:	00 00 00 
  800e14:	ff d0                	callq  *%rax
  800e16:	48 bf 9b 50 80 00 00 	movabs $0x80509b,%rdi
  800e1d:	00 00 00 
  800e20:	b8 00 00 00 00       	mov    $0x0,%eax
  800e25:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  800e2c:	00 00 00 
  800e2f:	ff d2                	callq  *%rdx
  800e31:	cc                   	int3   
  800e32:	eb fd                	jmp    800e31 <_panic+0x111>

0000000000800e34 <putch>:
  800e34:	55                   	push   %rbp
  800e35:	48 89 e5             	mov    %rsp,%rbp
  800e38:	48 83 ec 10          	sub    $0x10,%rsp
  800e3c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e3f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e47:	8b 00                	mov    (%rax),%eax
  800e49:	8d 48 01             	lea    0x1(%rax),%ecx
  800e4c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e50:	89 0a                	mov    %ecx,(%rdx)
  800e52:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e55:	89 d1                	mov    %edx,%ecx
  800e57:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e5b:	48 98                	cltq   
  800e5d:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800e61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e65:	8b 00                	mov    (%rax),%eax
  800e67:	3d ff 00 00 00       	cmp    $0xff,%eax
  800e6c:	75 2c                	jne    800e9a <putch+0x66>
  800e6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e72:	8b 00                	mov    (%rax),%eax
  800e74:	48 98                	cltq   
  800e76:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e7a:	48 83 c2 08          	add    $0x8,%rdx
  800e7e:	48 89 c6             	mov    %rax,%rsi
  800e81:	48 89 d7             	mov    %rdx,%rdi
  800e84:	48 b8 f5 22 80 00 00 	movabs $0x8022f5,%rax
  800e8b:	00 00 00 
  800e8e:	ff d0                	callq  *%rax
  800e90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e94:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800e9a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e9e:	8b 40 04             	mov    0x4(%rax),%eax
  800ea1:	8d 50 01             	lea    0x1(%rax),%edx
  800ea4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ea8:	89 50 04             	mov    %edx,0x4(%rax)
  800eab:	c9                   	leaveq 
  800eac:	c3                   	retq   

0000000000800ead <vcprintf>:
  800ead:	55                   	push   %rbp
  800eae:	48 89 e5             	mov    %rsp,%rbp
  800eb1:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800eb8:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800ebf:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800ec6:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800ecd:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800ed4:	48 8b 0a             	mov    (%rdx),%rcx
  800ed7:	48 89 08             	mov    %rcx,(%rax)
  800eda:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ede:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ee2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ee6:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800eea:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800ef1:	00 00 00 
  800ef4:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800efb:	00 00 00 
  800efe:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800f05:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800f0c:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800f13:	48 89 c6             	mov    %rax,%rsi
  800f16:	48 bf 34 0e 80 00 00 	movabs $0x800e34,%rdi
  800f1d:	00 00 00 
  800f20:	48 b8 0c 13 80 00 00 	movabs $0x80130c,%rax
  800f27:	00 00 00 
  800f2a:	ff d0                	callq  *%rax
  800f2c:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800f32:	48 98                	cltq   
  800f34:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800f3b:	48 83 c2 08          	add    $0x8,%rdx
  800f3f:	48 89 c6             	mov    %rax,%rsi
  800f42:	48 89 d7             	mov    %rdx,%rdi
  800f45:	48 b8 f5 22 80 00 00 	movabs $0x8022f5,%rax
  800f4c:	00 00 00 
  800f4f:	ff d0                	callq  *%rax
  800f51:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800f57:	c9                   	leaveq 
  800f58:	c3                   	retq   

0000000000800f59 <cprintf>:
  800f59:	55                   	push   %rbp
  800f5a:	48 89 e5             	mov    %rsp,%rbp
  800f5d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800f64:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800f6b:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800f72:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f79:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f80:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f87:	84 c0                	test   %al,%al
  800f89:	74 20                	je     800fab <cprintf+0x52>
  800f8b:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f8f:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f93:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f97:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f9b:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f9f:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800fa3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800fa7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800fab:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800fb2:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800fb9:	00 00 00 
  800fbc:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800fc3:	00 00 00 
  800fc6:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fca:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800fd1:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fd8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fdf:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fe6:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fed:	48 8b 0a             	mov    (%rdx),%rcx
  800ff0:	48 89 08             	mov    %rcx,(%rax)
  800ff3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ff7:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ffb:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fff:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801003:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80100a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801011:	48 89 d6             	mov    %rdx,%rsi
  801014:	48 89 c7             	mov    %rax,%rdi
  801017:	48 b8 ad 0e 80 00 00 	movabs $0x800ead,%rax
  80101e:	00 00 00 
  801021:	ff d0                	callq  *%rax
  801023:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801029:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80102f:	c9                   	leaveq 
  801030:	c3                   	retq   

0000000000801031 <printnum>:
  801031:	55                   	push   %rbp
  801032:	48 89 e5             	mov    %rsp,%rbp
  801035:	53                   	push   %rbx
  801036:	48 83 ec 38          	sub    $0x38,%rsp
  80103a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80103e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801042:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801046:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  801049:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80104d:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  801051:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  801054:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801058:	77 3b                	ja     801095 <printnum+0x64>
  80105a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80105d:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  801061:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  801064:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801068:	ba 00 00 00 00       	mov    $0x0,%edx
  80106d:	48 f7 f3             	div    %rbx
  801070:	48 89 c2             	mov    %rax,%rdx
  801073:	8b 7d cc             	mov    -0x34(%rbp),%edi
  801076:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  801079:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80107d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801081:	41 89 f9             	mov    %edi,%r9d
  801084:	48 89 c7             	mov    %rax,%rdi
  801087:	48 b8 31 10 80 00 00 	movabs $0x801031,%rax
  80108e:	00 00 00 
  801091:	ff d0                	callq  *%rax
  801093:	eb 1e                	jmp    8010b3 <printnum+0x82>
  801095:	eb 12                	jmp    8010a9 <printnum+0x78>
  801097:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80109b:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80109e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010a2:	48 89 ce             	mov    %rcx,%rsi
  8010a5:	89 d7                	mov    %edx,%edi
  8010a7:	ff d0                	callq  *%rax
  8010a9:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8010ad:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8010b1:	7f e4                	jg     801097 <printnum+0x66>
  8010b3:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8010b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8010ba:	ba 00 00 00 00       	mov    $0x0,%edx
  8010bf:	48 f7 f1             	div    %rcx
  8010c2:	48 89 d0             	mov    %rdx,%rax
  8010c5:	48 ba 90 52 80 00 00 	movabs $0x805290,%rdx
  8010cc:	00 00 00 
  8010cf:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8010d3:	0f be d0             	movsbl %al,%edx
  8010d6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8010da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010de:	48 89 ce             	mov    %rcx,%rsi
  8010e1:	89 d7                	mov    %edx,%edi
  8010e3:	ff d0                	callq  *%rax
  8010e5:	48 83 c4 38          	add    $0x38,%rsp
  8010e9:	5b                   	pop    %rbx
  8010ea:	5d                   	pop    %rbp
  8010eb:	c3                   	retq   

00000000008010ec <getuint>:
  8010ec:	55                   	push   %rbp
  8010ed:	48 89 e5             	mov    %rsp,%rbp
  8010f0:	48 83 ec 1c          	sub    $0x1c,%rsp
  8010f4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010f8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8010fb:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8010ff:	7e 52                	jle    801153 <getuint+0x67>
  801101:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801105:	8b 00                	mov    (%rax),%eax
  801107:	83 f8 30             	cmp    $0x30,%eax
  80110a:	73 24                	jae    801130 <getuint+0x44>
  80110c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801110:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801114:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801118:	8b 00                	mov    (%rax),%eax
  80111a:	89 c0                	mov    %eax,%eax
  80111c:	48 01 d0             	add    %rdx,%rax
  80111f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801123:	8b 12                	mov    (%rdx),%edx
  801125:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801128:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80112c:	89 0a                	mov    %ecx,(%rdx)
  80112e:	eb 17                	jmp    801147 <getuint+0x5b>
  801130:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801134:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801138:	48 89 d0             	mov    %rdx,%rax
  80113b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80113f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801143:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801147:	48 8b 00             	mov    (%rax),%rax
  80114a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80114e:	e9 a3 00 00 00       	jmpq   8011f6 <getuint+0x10a>
  801153:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801157:	74 4f                	je     8011a8 <getuint+0xbc>
  801159:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80115d:	8b 00                	mov    (%rax),%eax
  80115f:	83 f8 30             	cmp    $0x30,%eax
  801162:	73 24                	jae    801188 <getuint+0x9c>
  801164:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801168:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80116c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801170:	8b 00                	mov    (%rax),%eax
  801172:	89 c0                	mov    %eax,%eax
  801174:	48 01 d0             	add    %rdx,%rax
  801177:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80117b:	8b 12                	mov    (%rdx),%edx
  80117d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801180:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801184:	89 0a                	mov    %ecx,(%rdx)
  801186:	eb 17                	jmp    80119f <getuint+0xb3>
  801188:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80118c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801190:	48 89 d0             	mov    %rdx,%rax
  801193:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801197:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80119b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80119f:	48 8b 00             	mov    (%rax),%rax
  8011a2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011a6:	eb 4e                	jmp    8011f6 <getuint+0x10a>
  8011a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ac:	8b 00                	mov    (%rax),%eax
  8011ae:	83 f8 30             	cmp    $0x30,%eax
  8011b1:	73 24                	jae    8011d7 <getuint+0xeb>
  8011b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8011bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011bf:	8b 00                	mov    (%rax),%eax
  8011c1:	89 c0                	mov    %eax,%eax
  8011c3:	48 01 d0             	add    %rdx,%rax
  8011c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011ca:	8b 12                	mov    (%rdx),%edx
  8011cc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8011cf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011d3:	89 0a                	mov    %ecx,(%rdx)
  8011d5:	eb 17                	jmp    8011ee <getuint+0x102>
  8011d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011db:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8011df:	48 89 d0             	mov    %rdx,%rax
  8011e2:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8011e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011ea:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8011ee:	8b 00                	mov    (%rax),%eax
  8011f0:	89 c0                	mov    %eax,%eax
  8011f2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011fa:	c9                   	leaveq 
  8011fb:	c3                   	retq   

00000000008011fc <getint>:
  8011fc:	55                   	push   %rbp
  8011fd:	48 89 e5             	mov    %rsp,%rbp
  801200:	48 83 ec 1c          	sub    $0x1c,%rsp
  801204:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801208:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80120b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80120f:	7e 52                	jle    801263 <getint+0x67>
  801211:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801215:	8b 00                	mov    (%rax),%eax
  801217:	83 f8 30             	cmp    $0x30,%eax
  80121a:	73 24                	jae    801240 <getint+0x44>
  80121c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801220:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801224:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801228:	8b 00                	mov    (%rax),%eax
  80122a:	89 c0                	mov    %eax,%eax
  80122c:	48 01 d0             	add    %rdx,%rax
  80122f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801233:	8b 12                	mov    (%rdx),%edx
  801235:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801238:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80123c:	89 0a                	mov    %ecx,(%rdx)
  80123e:	eb 17                	jmp    801257 <getint+0x5b>
  801240:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801244:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801248:	48 89 d0             	mov    %rdx,%rax
  80124b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80124f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801253:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801257:	48 8b 00             	mov    (%rax),%rax
  80125a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80125e:	e9 a3 00 00 00       	jmpq   801306 <getint+0x10a>
  801263:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801267:	74 4f                	je     8012b8 <getint+0xbc>
  801269:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80126d:	8b 00                	mov    (%rax),%eax
  80126f:	83 f8 30             	cmp    $0x30,%eax
  801272:	73 24                	jae    801298 <getint+0x9c>
  801274:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801278:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80127c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801280:	8b 00                	mov    (%rax),%eax
  801282:	89 c0                	mov    %eax,%eax
  801284:	48 01 d0             	add    %rdx,%rax
  801287:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80128b:	8b 12                	mov    (%rdx),%edx
  80128d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801290:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801294:	89 0a                	mov    %ecx,(%rdx)
  801296:	eb 17                	jmp    8012af <getint+0xb3>
  801298:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80129c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8012a0:	48 89 d0             	mov    %rdx,%rax
  8012a3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8012a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012ab:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8012af:	48 8b 00             	mov    (%rax),%rax
  8012b2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012b6:	eb 4e                	jmp    801306 <getint+0x10a>
  8012b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012bc:	8b 00                	mov    (%rax),%eax
  8012be:	83 f8 30             	cmp    $0x30,%eax
  8012c1:	73 24                	jae    8012e7 <getint+0xeb>
  8012c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8012cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012cf:	8b 00                	mov    (%rax),%eax
  8012d1:	89 c0                	mov    %eax,%eax
  8012d3:	48 01 d0             	add    %rdx,%rax
  8012d6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012da:	8b 12                	mov    (%rdx),%edx
  8012dc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8012df:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012e3:	89 0a                	mov    %ecx,(%rdx)
  8012e5:	eb 17                	jmp    8012fe <getint+0x102>
  8012e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012eb:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8012ef:	48 89 d0             	mov    %rdx,%rax
  8012f2:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8012f6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012fa:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8012fe:	8b 00                	mov    (%rax),%eax
  801300:	48 98                	cltq   
  801302:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801306:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80130a:	c9                   	leaveq 
  80130b:	c3                   	retq   

000000000080130c <vprintfmt>:
  80130c:	55                   	push   %rbp
  80130d:	48 89 e5             	mov    %rsp,%rbp
  801310:	41 54                	push   %r12
  801312:	53                   	push   %rbx
  801313:	48 83 ec 60          	sub    $0x60,%rsp
  801317:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80131b:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80131f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801323:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  801327:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80132b:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80132f:	48 8b 0a             	mov    (%rdx),%rcx
  801332:	48 89 08             	mov    %rcx,(%rax)
  801335:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801339:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80133d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801341:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801345:	eb 17                	jmp    80135e <vprintfmt+0x52>
  801347:	85 db                	test   %ebx,%ebx
  801349:	0f 84 cc 04 00 00    	je     80181b <vprintfmt+0x50f>
  80134f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801353:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801357:	48 89 d6             	mov    %rdx,%rsi
  80135a:	89 df                	mov    %ebx,%edi
  80135c:	ff d0                	callq  *%rax
  80135e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801362:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801366:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80136a:	0f b6 00             	movzbl (%rax),%eax
  80136d:	0f b6 d8             	movzbl %al,%ebx
  801370:	83 fb 25             	cmp    $0x25,%ebx
  801373:	75 d2                	jne    801347 <vprintfmt+0x3b>
  801375:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  801379:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  801380:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801387:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80138e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801395:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801399:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80139d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8013a1:	0f b6 00             	movzbl (%rax),%eax
  8013a4:	0f b6 d8             	movzbl %al,%ebx
  8013a7:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8013aa:	83 f8 55             	cmp    $0x55,%eax
  8013ad:	0f 87 34 04 00 00    	ja     8017e7 <vprintfmt+0x4db>
  8013b3:	89 c0                	mov    %eax,%eax
  8013b5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8013bc:	00 
  8013bd:	48 b8 b8 52 80 00 00 	movabs $0x8052b8,%rax
  8013c4:	00 00 00 
  8013c7:	48 01 d0             	add    %rdx,%rax
  8013ca:	48 8b 00             	mov    (%rax),%rax
  8013cd:	ff e0                	jmpq   *%rax
  8013cf:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8013d3:	eb c0                	jmp    801395 <vprintfmt+0x89>
  8013d5:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8013d9:	eb ba                	jmp    801395 <vprintfmt+0x89>
  8013db:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8013e2:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8013e5:	89 d0                	mov    %edx,%eax
  8013e7:	c1 e0 02             	shl    $0x2,%eax
  8013ea:	01 d0                	add    %edx,%eax
  8013ec:	01 c0                	add    %eax,%eax
  8013ee:	01 d8                	add    %ebx,%eax
  8013f0:	83 e8 30             	sub    $0x30,%eax
  8013f3:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8013f6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8013fa:	0f b6 00             	movzbl (%rax),%eax
  8013fd:	0f be d8             	movsbl %al,%ebx
  801400:	83 fb 2f             	cmp    $0x2f,%ebx
  801403:	7e 0c                	jle    801411 <vprintfmt+0x105>
  801405:	83 fb 39             	cmp    $0x39,%ebx
  801408:	7f 07                	jg     801411 <vprintfmt+0x105>
  80140a:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80140f:	eb d1                	jmp    8013e2 <vprintfmt+0xd6>
  801411:	eb 58                	jmp    80146b <vprintfmt+0x15f>
  801413:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801416:	83 f8 30             	cmp    $0x30,%eax
  801419:	73 17                	jae    801432 <vprintfmt+0x126>
  80141b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80141f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801422:	89 c0                	mov    %eax,%eax
  801424:	48 01 d0             	add    %rdx,%rax
  801427:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80142a:	83 c2 08             	add    $0x8,%edx
  80142d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801430:	eb 0f                	jmp    801441 <vprintfmt+0x135>
  801432:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801436:	48 89 d0             	mov    %rdx,%rax
  801439:	48 83 c2 08          	add    $0x8,%rdx
  80143d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801441:	8b 00                	mov    (%rax),%eax
  801443:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801446:	eb 23                	jmp    80146b <vprintfmt+0x15f>
  801448:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80144c:	79 0c                	jns    80145a <vprintfmt+0x14e>
  80144e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801455:	e9 3b ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  80145a:	e9 36 ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  80145f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801466:	e9 2a ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  80146b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80146f:	79 12                	jns    801483 <vprintfmt+0x177>
  801471:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801474:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801477:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80147e:	e9 12 ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  801483:	e9 0d ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  801488:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  80148c:	e9 04 ff ff ff       	jmpq   801395 <vprintfmt+0x89>
  801491:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801494:	83 f8 30             	cmp    $0x30,%eax
  801497:	73 17                	jae    8014b0 <vprintfmt+0x1a4>
  801499:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80149d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8014a0:	89 c0                	mov    %eax,%eax
  8014a2:	48 01 d0             	add    %rdx,%rax
  8014a5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8014a8:	83 c2 08             	add    $0x8,%edx
  8014ab:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8014ae:	eb 0f                	jmp    8014bf <vprintfmt+0x1b3>
  8014b0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8014b4:	48 89 d0             	mov    %rdx,%rax
  8014b7:	48 83 c2 08          	add    $0x8,%rdx
  8014bb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8014bf:	8b 10                	mov    (%rax),%edx
  8014c1:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8014c5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014c9:	48 89 ce             	mov    %rcx,%rsi
  8014cc:	89 d7                	mov    %edx,%edi
  8014ce:	ff d0                	callq  *%rax
  8014d0:	e9 40 03 00 00       	jmpq   801815 <vprintfmt+0x509>
  8014d5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8014d8:	83 f8 30             	cmp    $0x30,%eax
  8014db:	73 17                	jae    8014f4 <vprintfmt+0x1e8>
  8014dd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8014e1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8014e4:	89 c0                	mov    %eax,%eax
  8014e6:	48 01 d0             	add    %rdx,%rax
  8014e9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8014ec:	83 c2 08             	add    $0x8,%edx
  8014ef:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8014f2:	eb 0f                	jmp    801503 <vprintfmt+0x1f7>
  8014f4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8014f8:	48 89 d0             	mov    %rdx,%rax
  8014fb:	48 83 c2 08          	add    $0x8,%rdx
  8014ff:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801503:	8b 18                	mov    (%rax),%ebx
  801505:	85 db                	test   %ebx,%ebx
  801507:	79 02                	jns    80150b <vprintfmt+0x1ff>
  801509:	f7 db                	neg    %ebx
  80150b:	83 fb 15             	cmp    $0x15,%ebx
  80150e:	7f 16                	jg     801526 <vprintfmt+0x21a>
  801510:	48 b8 e0 51 80 00 00 	movabs $0x8051e0,%rax
  801517:	00 00 00 
  80151a:	48 63 d3             	movslq %ebx,%rdx
  80151d:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  801521:	4d 85 e4             	test   %r12,%r12
  801524:	75 2e                	jne    801554 <vprintfmt+0x248>
  801526:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80152a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80152e:	89 d9                	mov    %ebx,%ecx
  801530:	48 ba a1 52 80 00 00 	movabs $0x8052a1,%rdx
  801537:	00 00 00 
  80153a:	48 89 c7             	mov    %rax,%rdi
  80153d:	b8 00 00 00 00       	mov    $0x0,%eax
  801542:	49 b8 24 18 80 00 00 	movabs $0x801824,%r8
  801549:	00 00 00 
  80154c:	41 ff d0             	callq  *%r8
  80154f:	e9 c1 02 00 00       	jmpq   801815 <vprintfmt+0x509>
  801554:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801558:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80155c:	4c 89 e1             	mov    %r12,%rcx
  80155f:	48 ba aa 52 80 00 00 	movabs $0x8052aa,%rdx
  801566:	00 00 00 
  801569:	48 89 c7             	mov    %rax,%rdi
  80156c:	b8 00 00 00 00       	mov    $0x0,%eax
  801571:	49 b8 24 18 80 00 00 	movabs $0x801824,%r8
  801578:	00 00 00 
  80157b:	41 ff d0             	callq  *%r8
  80157e:	e9 92 02 00 00       	jmpq   801815 <vprintfmt+0x509>
  801583:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801586:	83 f8 30             	cmp    $0x30,%eax
  801589:	73 17                	jae    8015a2 <vprintfmt+0x296>
  80158b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80158f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801592:	89 c0                	mov    %eax,%eax
  801594:	48 01 d0             	add    %rdx,%rax
  801597:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80159a:	83 c2 08             	add    $0x8,%edx
  80159d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8015a0:	eb 0f                	jmp    8015b1 <vprintfmt+0x2a5>
  8015a2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8015a6:	48 89 d0             	mov    %rdx,%rax
  8015a9:	48 83 c2 08          	add    $0x8,%rdx
  8015ad:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8015b1:	4c 8b 20             	mov    (%rax),%r12
  8015b4:	4d 85 e4             	test   %r12,%r12
  8015b7:	75 0a                	jne    8015c3 <vprintfmt+0x2b7>
  8015b9:	49 bc ad 52 80 00 00 	movabs $0x8052ad,%r12
  8015c0:	00 00 00 
  8015c3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8015c7:	7e 3f                	jle    801608 <vprintfmt+0x2fc>
  8015c9:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8015cd:	74 39                	je     801608 <vprintfmt+0x2fc>
  8015cf:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8015d2:	48 98                	cltq   
  8015d4:	48 89 c6             	mov    %rax,%rsi
  8015d7:	4c 89 e7             	mov    %r12,%rdi
  8015da:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  8015e1:	00 00 00 
  8015e4:	ff d0                	callq  *%rax
  8015e6:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8015e9:	eb 17                	jmp    801602 <vprintfmt+0x2f6>
  8015eb:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8015ef:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8015f3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015f7:	48 89 ce             	mov    %rcx,%rsi
  8015fa:	89 d7                	mov    %edx,%edi
  8015fc:	ff d0                	callq  *%rax
  8015fe:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801602:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801606:	7f e3                	jg     8015eb <vprintfmt+0x2df>
  801608:	eb 37                	jmp    801641 <vprintfmt+0x335>
  80160a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  80160e:	74 1e                	je     80162e <vprintfmt+0x322>
  801610:	83 fb 1f             	cmp    $0x1f,%ebx
  801613:	7e 05                	jle    80161a <vprintfmt+0x30e>
  801615:	83 fb 7e             	cmp    $0x7e,%ebx
  801618:	7e 14                	jle    80162e <vprintfmt+0x322>
  80161a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80161e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801622:	48 89 d6             	mov    %rdx,%rsi
  801625:	bf 3f 00 00 00       	mov    $0x3f,%edi
  80162a:	ff d0                	callq  *%rax
  80162c:	eb 0f                	jmp    80163d <vprintfmt+0x331>
  80162e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801632:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801636:	48 89 d6             	mov    %rdx,%rsi
  801639:	89 df                	mov    %ebx,%edi
  80163b:	ff d0                	callq  *%rax
  80163d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801641:	4c 89 e0             	mov    %r12,%rax
  801644:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801648:	0f b6 00             	movzbl (%rax),%eax
  80164b:	0f be d8             	movsbl %al,%ebx
  80164e:	85 db                	test   %ebx,%ebx
  801650:	74 10                	je     801662 <vprintfmt+0x356>
  801652:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801656:	78 b2                	js     80160a <vprintfmt+0x2fe>
  801658:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80165c:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801660:	79 a8                	jns    80160a <vprintfmt+0x2fe>
  801662:	eb 16                	jmp    80167a <vprintfmt+0x36e>
  801664:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801668:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80166c:	48 89 d6             	mov    %rdx,%rsi
  80166f:	bf 20 00 00 00       	mov    $0x20,%edi
  801674:	ff d0                	callq  *%rax
  801676:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80167a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80167e:	7f e4                	jg     801664 <vprintfmt+0x358>
  801680:	e9 90 01 00 00       	jmpq   801815 <vprintfmt+0x509>
  801685:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801689:	be 03 00 00 00       	mov    $0x3,%esi
  80168e:	48 89 c7             	mov    %rax,%rdi
  801691:	48 b8 fc 11 80 00 00 	movabs $0x8011fc,%rax
  801698:	00 00 00 
  80169b:	ff d0                	callq  *%rax
  80169d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016a5:	48 85 c0             	test   %rax,%rax
  8016a8:	79 1d                	jns    8016c7 <vprintfmt+0x3bb>
  8016aa:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8016ae:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8016b2:	48 89 d6             	mov    %rdx,%rsi
  8016b5:	bf 2d 00 00 00       	mov    $0x2d,%edi
  8016ba:	ff d0                	callq  *%rax
  8016bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016c0:	48 f7 d8             	neg    %rax
  8016c3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016c7:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8016ce:	e9 d5 00 00 00       	jmpq   8017a8 <vprintfmt+0x49c>
  8016d3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8016d7:	be 03 00 00 00       	mov    $0x3,%esi
  8016dc:	48 89 c7             	mov    %rax,%rdi
  8016df:	48 b8 ec 10 80 00 00 	movabs $0x8010ec,%rax
  8016e6:	00 00 00 
  8016e9:	ff d0                	callq  *%rax
  8016eb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016ef:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8016f6:	e9 ad 00 00 00       	jmpq   8017a8 <vprintfmt+0x49c>
  8016fb:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8016ff:	be 03 00 00 00       	mov    $0x3,%esi
  801704:	48 89 c7             	mov    %rax,%rdi
  801707:	48 b8 ec 10 80 00 00 	movabs $0x8010ec,%rax
  80170e:	00 00 00 
  801711:	ff d0                	callq  *%rax
  801713:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801717:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  80171e:	e9 85 00 00 00       	jmpq   8017a8 <vprintfmt+0x49c>
  801723:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801727:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80172b:	48 89 d6             	mov    %rdx,%rsi
  80172e:	bf 30 00 00 00       	mov    $0x30,%edi
  801733:	ff d0                	callq  *%rax
  801735:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801739:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80173d:	48 89 d6             	mov    %rdx,%rsi
  801740:	bf 78 00 00 00       	mov    $0x78,%edi
  801745:	ff d0                	callq  *%rax
  801747:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80174a:	83 f8 30             	cmp    $0x30,%eax
  80174d:	73 17                	jae    801766 <vprintfmt+0x45a>
  80174f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801753:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801756:	89 c0                	mov    %eax,%eax
  801758:	48 01 d0             	add    %rdx,%rax
  80175b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80175e:	83 c2 08             	add    $0x8,%edx
  801761:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801764:	eb 0f                	jmp    801775 <vprintfmt+0x469>
  801766:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80176a:	48 89 d0             	mov    %rdx,%rax
  80176d:	48 83 c2 08          	add    $0x8,%rdx
  801771:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801775:	48 8b 00             	mov    (%rax),%rax
  801778:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80177c:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801783:	eb 23                	jmp    8017a8 <vprintfmt+0x49c>
  801785:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801789:	be 03 00 00 00       	mov    $0x3,%esi
  80178e:	48 89 c7             	mov    %rax,%rdi
  801791:	48 b8 ec 10 80 00 00 	movabs $0x8010ec,%rax
  801798:	00 00 00 
  80179b:	ff d0                	callq  *%rax
  80179d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8017a1:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8017a8:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  8017ad:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8017b0:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8017b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017b7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8017bb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8017bf:	45 89 c1             	mov    %r8d,%r9d
  8017c2:	41 89 f8             	mov    %edi,%r8d
  8017c5:	48 89 c7             	mov    %rax,%rdi
  8017c8:	48 b8 31 10 80 00 00 	movabs $0x801031,%rax
  8017cf:	00 00 00 
  8017d2:	ff d0                	callq  *%rax
  8017d4:	eb 3f                	jmp    801815 <vprintfmt+0x509>
  8017d6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8017da:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8017de:	48 89 d6             	mov    %rdx,%rsi
  8017e1:	89 df                	mov    %ebx,%edi
  8017e3:	ff d0                	callq  *%rax
  8017e5:	eb 2e                	jmp    801815 <vprintfmt+0x509>
  8017e7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8017eb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8017ef:	48 89 d6             	mov    %rdx,%rsi
  8017f2:	bf 25 00 00 00       	mov    $0x25,%edi
  8017f7:	ff d0                	callq  *%rax
  8017f9:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8017fe:	eb 05                	jmp    801805 <vprintfmt+0x4f9>
  801800:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801805:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801809:	48 83 e8 01          	sub    $0x1,%rax
  80180d:	0f b6 00             	movzbl (%rax),%eax
  801810:	3c 25                	cmp    $0x25,%al
  801812:	75 ec                	jne    801800 <vprintfmt+0x4f4>
  801814:	90                   	nop
  801815:	90                   	nop
  801816:	e9 43 fb ff ff       	jmpq   80135e <vprintfmt+0x52>
  80181b:	48 83 c4 60          	add    $0x60,%rsp
  80181f:	5b                   	pop    %rbx
  801820:	41 5c                	pop    %r12
  801822:	5d                   	pop    %rbp
  801823:	c3                   	retq   

0000000000801824 <printfmt>:
  801824:	55                   	push   %rbp
  801825:	48 89 e5             	mov    %rsp,%rbp
  801828:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  80182f:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801836:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80183d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801844:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80184b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801852:	84 c0                	test   %al,%al
  801854:	74 20                	je     801876 <printfmt+0x52>
  801856:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80185a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80185e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801862:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801866:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80186a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80186e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801872:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801876:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80187d:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801884:	00 00 00 
  801887:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80188e:	00 00 00 
  801891:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801895:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80189c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8018a3:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8018aa:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  8018b1:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8018b8:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  8018bf:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8018c6:	48 89 c7             	mov    %rax,%rdi
  8018c9:	48 b8 0c 13 80 00 00 	movabs $0x80130c,%rax
  8018d0:	00 00 00 
  8018d3:	ff d0                	callq  *%rax
  8018d5:	c9                   	leaveq 
  8018d6:	c3                   	retq   

00000000008018d7 <sprintputch>:
  8018d7:	55                   	push   %rbp
  8018d8:	48 89 e5             	mov    %rsp,%rbp
  8018db:	48 83 ec 10          	sub    $0x10,%rsp
  8018df:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018e2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018ea:	8b 40 10             	mov    0x10(%rax),%eax
  8018ed:	8d 50 01             	lea    0x1(%rax),%edx
  8018f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018f4:	89 50 10             	mov    %edx,0x10(%rax)
  8018f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018fb:	48 8b 10             	mov    (%rax),%rdx
  8018fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801902:	48 8b 40 08          	mov    0x8(%rax),%rax
  801906:	48 39 c2             	cmp    %rax,%rdx
  801909:	73 17                	jae    801922 <sprintputch+0x4b>
  80190b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80190f:	48 8b 00             	mov    (%rax),%rax
  801912:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801916:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80191a:	48 89 0a             	mov    %rcx,(%rdx)
  80191d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801920:	88 10                	mov    %dl,(%rax)
  801922:	c9                   	leaveq 
  801923:	c3                   	retq   

0000000000801924 <vsnprintf>:
  801924:	55                   	push   %rbp
  801925:	48 89 e5             	mov    %rsp,%rbp
  801928:	48 83 ec 50          	sub    $0x50,%rsp
  80192c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801930:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801933:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801937:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80193b:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80193f:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801943:	48 8b 0a             	mov    (%rdx),%rcx
  801946:	48 89 08             	mov    %rcx,(%rax)
  801949:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80194d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801951:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801955:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801959:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80195d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801961:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801964:	48 98                	cltq   
  801966:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80196a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80196e:	48 01 d0             	add    %rdx,%rax
  801971:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801975:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80197c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801981:	74 06                	je     801989 <vsnprintf+0x65>
  801983:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801987:	7f 07                	jg     801990 <vsnprintf+0x6c>
  801989:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80198e:	eb 2f                	jmp    8019bf <vsnprintf+0x9b>
  801990:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801994:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801998:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80199c:	48 89 c6             	mov    %rax,%rsi
  80199f:	48 bf d7 18 80 00 00 	movabs $0x8018d7,%rdi
  8019a6:	00 00 00 
  8019a9:	48 b8 0c 13 80 00 00 	movabs $0x80130c,%rax
  8019b0:	00 00 00 
  8019b3:	ff d0                	callq  *%rax
  8019b5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8019b9:	c6 00 00             	movb   $0x0,(%rax)
  8019bc:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8019bf:	c9                   	leaveq 
  8019c0:	c3                   	retq   

00000000008019c1 <snprintf>:
  8019c1:	55                   	push   %rbp
  8019c2:	48 89 e5             	mov    %rsp,%rbp
  8019c5:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8019cc:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8019d3:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8019d9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8019e0:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8019e7:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8019ee:	84 c0                	test   %al,%al
  8019f0:	74 20                	je     801a12 <snprintf+0x51>
  8019f2:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8019f6:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8019fa:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8019fe:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801a02:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801a06:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801a0a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801a0e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801a12:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801a19:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801a20:	00 00 00 
  801a23:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801a2a:	00 00 00 
  801a2d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801a31:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801a38:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801a3f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801a46:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801a4d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801a54:	48 8b 0a             	mov    (%rdx),%rcx
  801a57:	48 89 08             	mov    %rcx,(%rax)
  801a5a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801a5e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801a62:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801a66:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801a6a:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801a71:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801a78:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801a7e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801a85:	48 89 c7             	mov    %rax,%rdi
  801a88:	48 b8 24 19 80 00 00 	movabs $0x801924,%rax
  801a8f:	00 00 00 
  801a92:	ff d0                	callq  *%rax
  801a94:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801a9a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801aa0:	c9                   	leaveq 
  801aa1:	c3                   	retq   

0000000000801aa2 <strlen>:
  801aa2:	55                   	push   %rbp
  801aa3:	48 89 e5             	mov    %rsp,%rbp
  801aa6:	48 83 ec 18          	sub    $0x18,%rsp
  801aaa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801aae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ab5:	eb 09                	jmp    801ac0 <strlen+0x1e>
  801ab7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801abb:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801ac0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ac4:	0f b6 00             	movzbl (%rax),%eax
  801ac7:	84 c0                	test   %al,%al
  801ac9:	75 ec                	jne    801ab7 <strlen+0x15>
  801acb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ace:	c9                   	leaveq 
  801acf:	c3                   	retq   

0000000000801ad0 <strnlen>:
  801ad0:	55                   	push   %rbp
  801ad1:	48 89 e5             	mov    %rsp,%rbp
  801ad4:	48 83 ec 20          	sub    $0x20,%rsp
  801ad8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801adc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ae0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ae7:	eb 0e                	jmp    801af7 <strnlen+0x27>
  801ae9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801aed:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801af2:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801af7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801afc:	74 0b                	je     801b09 <strnlen+0x39>
  801afe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b02:	0f b6 00             	movzbl (%rax),%eax
  801b05:	84 c0                	test   %al,%al
  801b07:	75 e0                	jne    801ae9 <strnlen+0x19>
  801b09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b0c:	c9                   	leaveq 
  801b0d:	c3                   	retq   

0000000000801b0e <strcpy>:
  801b0e:	55                   	push   %rbp
  801b0f:	48 89 e5             	mov    %rsp,%rbp
  801b12:	48 83 ec 20          	sub    $0x20,%rsp
  801b16:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b1a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b1e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b22:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801b26:	90                   	nop
  801b27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b2b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b2f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b33:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801b37:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801b3b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801b3f:	0f b6 12             	movzbl (%rdx),%edx
  801b42:	88 10                	mov    %dl,(%rax)
  801b44:	0f b6 00             	movzbl (%rax),%eax
  801b47:	84 c0                	test   %al,%al
  801b49:	75 dc                	jne    801b27 <strcpy+0x19>
  801b4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b4f:	c9                   	leaveq 
  801b50:	c3                   	retq   

0000000000801b51 <strcat>:
  801b51:	55                   	push   %rbp
  801b52:	48 89 e5             	mov    %rsp,%rbp
  801b55:	48 83 ec 20          	sub    $0x20,%rsp
  801b59:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b5d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b65:	48 89 c7             	mov    %rax,%rdi
  801b68:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  801b6f:	00 00 00 
  801b72:	ff d0                	callq  *%rax
  801b74:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801b77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b7a:	48 63 d0             	movslq %eax,%rdx
  801b7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b81:	48 01 c2             	add    %rax,%rdx
  801b84:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b88:	48 89 c6             	mov    %rax,%rsi
  801b8b:	48 89 d7             	mov    %rdx,%rdi
  801b8e:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  801b95:	00 00 00 
  801b98:	ff d0                	callq  *%rax
  801b9a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b9e:	c9                   	leaveq 
  801b9f:	c3                   	retq   

0000000000801ba0 <strncpy>:
  801ba0:	55                   	push   %rbp
  801ba1:	48 89 e5             	mov    %rsp,%rbp
  801ba4:	48 83 ec 28          	sub    $0x28,%rsp
  801ba8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801bac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801bb0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801bb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bb8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801bbc:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801bc3:	00 
  801bc4:	eb 2a                	jmp    801bf0 <strncpy+0x50>
  801bc6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bca:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801bce:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bd2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801bd6:	0f b6 12             	movzbl (%rdx),%edx
  801bd9:	88 10                	mov    %dl,(%rax)
  801bdb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801bdf:	0f b6 00             	movzbl (%rax),%eax
  801be2:	84 c0                	test   %al,%al
  801be4:	74 05                	je     801beb <strncpy+0x4b>
  801be6:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801beb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801bf0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bf4:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801bf8:	72 cc                	jb     801bc6 <strncpy+0x26>
  801bfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bfe:	c9                   	leaveq 
  801bff:	c3                   	retq   

0000000000801c00 <strlcpy>:
  801c00:	55                   	push   %rbp
  801c01:	48 89 e5             	mov    %rsp,%rbp
  801c04:	48 83 ec 28          	sub    $0x28,%rsp
  801c08:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801c0c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801c10:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801c14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c18:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801c1c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801c21:	74 3d                	je     801c60 <strlcpy+0x60>
  801c23:	eb 1d                	jmp    801c42 <strlcpy+0x42>
  801c25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c29:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801c2d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c31:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801c35:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801c39:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801c3d:	0f b6 12             	movzbl (%rdx),%edx
  801c40:	88 10                	mov    %dl,(%rax)
  801c42:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801c47:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801c4c:	74 0b                	je     801c59 <strlcpy+0x59>
  801c4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c52:	0f b6 00             	movzbl (%rax),%eax
  801c55:	84 c0                	test   %al,%al
  801c57:	75 cc                	jne    801c25 <strlcpy+0x25>
  801c59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c5d:	c6 00 00             	movb   $0x0,(%rax)
  801c60:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801c64:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c68:	48 29 c2             	sub    %rax,%rdx
  801c6b:	48 89 d0             	mov    %rdx,%rax
  801c6e:	c9                   	leaveq 
  801c6f:	c3                   	retq   

0000000000801c70 <strcmp>:
  801c70:	55                   	push   %rbp
  801c71:	48 89 e5             	mov    %rsp,%rbp
  801c74:	48 83 ec 10          	sub    $0x10,%rsp
  801c78:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c7c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c80:	eb 0a                	jmp    801c8c <strcmp+0x1c>
  801c82:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801c87:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801c8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c90:	0f b6 00             	movzbl (%rax),%eax
  801c93:	84 c0                	test   %al,%al
  801c95:	74 12                	je     801ca9 <strcmp+0x39>
  801c97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c9b:	0f b6 10             	movzbl (%rax),%edx
  801c9e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ca2:	0f b6 00             	movzbl (%rax),%eax
  801ca5:	38 c2                	cmp    %al,%dl
  801ca7:	74 d9                	je     801c82 <strcmp+0x12>
  801ca9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cad:	0f b6 00             	movzbl (%rax),%eax
  801cb0:	0f b6 d0             	movzbl %al,%edx
  801cb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cb7:	0f b6 00             	movzbl (%rax),%eax
  801cba:	0f b6 c0             	movzbl %al,%eax
  801cbd:	29 c2                	sub    %eax,%edx
  801cbf:	89 d0                	mov    %edx,%eax
  801cc1:	c9                   	leaveq 
  801cc2:	c3                   	retq   

0000000000801cc3 <strncmp>:
  801cc3:	55                   	push   %rbp
  801cc4:	48 89 e5             	mov    %rsp,%rbp
  801cc7:	48 83 ec 18          	sub    $0x18,%rsp
  801ccb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ccf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cd3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801cd7:	eb 0f                	jmp    801ce8 <strncmp+0x25>
  801cd9:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801cde:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801ce3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801ce8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801ced:	74 1d                	je     801d0c <strncmp+0x49>
  801cef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cf3:	0f b6 00             	movzbl (%rax),%eax
  801cf6:	84 c0                	test   %al,%al
  801cf8:	74 12                	je     801d0c <strncmp+0x49>
  801cfa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cfe:	0f b6 10             	movzbl (%rax),%edx
  801d01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d05:	0f b6 00             	movzbl (%rax),%eax
  801d08:	38 c2                	cmp    %al,%dl
  801d0a:	74 cd                	je     801cd9 <strncmp+0x16>
  801d0c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801d11:	75 07                	jne    801d1a <strncmp+0x57>
  801d13:	b8 00 00 00 00       	mov    $0x0,%eax
  801d18:	eb 18                	jmp    801d32 <strncmp+0x6f>
  801d1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d1e:	0f b6 00             	movzbl (%rax),%eax
  801d21:	0f b6 d0             	movzbl %al,%edx
  801d24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d28:	0f b6 00             	movzbl (%rax),%eax
  801d2b:	0f b6 c0             	movzbl %al,%eax
  801d2e:	29 c2                	sub    %eax,%edx
  801d30:	89 d0                	mov    %edx,%eax
  801d32:	c9                   	leaveq 
  801d33:	c3                   	retq   

0000000000801d34 <strchr>:
  801d34:	55                   	push   %rbp
  801d35:	48 89 e5             	mov    %rsp,%rbp
  801d38:	48 83 ec 0c          	sub    $0xc,%rsp
  801d3c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d40:	89 f0                	mov    %esi,%eax
  801d42:	88 45 f4             	mov    %al,-0xc(%rbp)
  801d45:	eb 17                	jmp    801d5e <strchr+0x2a>
  801d47:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d4b:	0f b6 00             	movzbl (%rax),%eax
  801d4e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801d51:	75 06                	jne    801d59 <strchr+0x25>
  801d53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d57:	eb 15                	jmp    801d6e <strchr+0x3a>
  801d59:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801d5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d62:	0f b6 00             	movzbl (%rax),%eax
  801d65:	84 c0                	test   %al,%al
  801d67:	75 de                	jne    801d47 <strchr+0x13>
  801d69:	b8 00 00 00 00       	mov    $0x0,%eax
  801d6e:	c9                   	leaveq 
  801d6f:	c3                   	retq   

0000000000801d70 <strfind>:
  801d70:	55                   	push   %rbp
  801d71:	48 89 e5             	mov    %rsp,%rbp
  801d74:	48 83 ec 0c          	sub    $0xc,%rsp
  801d78:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d7c:	89 f0                	mov    %esi,%eax
  801d7e:	88 45 f4             	mov    %al,-0xc(%rbp)
  801d81:	eb 13                	jmp    801d96 <strfind+0x26>
  801d83:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d87:	0f b6 00             	movzbl (%rax),%eax
  801d8a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801d8d:	75 02                	jne    801d91 <strfind+0x21>
  801d8f:	eb 10                	jmp    801da1 <strfind+0x31>
  801d91:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801d96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d9a:	0f b6 00             	movzbl (%rax),%eax
  801d9d:	84 c0                	test   %al,%al
  801d9f:	75 e2                	jne    801d83 <strfind+0x13>
  801da1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801da5:	c9                   	leaveq 
  801da6:	c3                   	retq   

0000000000801da7 <memset>:
  801da7:	55                   	push   %rbp
  801da8:	48 89 e5             	mov    %rsp,%rbp
  801dab:	48 83 ec 18          	sub    $0x18,%rsp
  801daf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801db3:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801db6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801dba:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801dbf:	75 06                	jne    801dc7 <memset+0x20>
  801dc1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dc5:	eb 69                	jmp    801e30 <memset+0x89>
  801dc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dcb:	83 e0 03             	and    $0x3,%eax
  801dce:	48 85 c0             	test   %rax,%rax
  801dd1:	75 48                	jne    801e1b <memset+0x74>
  801dd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dd7:	83 e0 03             	and    $0x3,%eax
  801dda:	48 85 c0             	test   %rax,%rax
  801ddd:	75 3c                	jne    801e1b <memset+0x74>
  801ddf:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801de6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801de9:	c1 e0 18             	shl    $0x18,%eax
  801dec:	89 c2                	mov    %eax,%edx
  801dee:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801df1:	c1 e0 10             	shl    $0x10,%eax
  801df4:	09 c2                	or     %eax,%edx
  801df6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801df9:	c1 e0 08             	shl    $0x8,%eax
  801dfc:	09 d0                	or     %edx,%eax
  801dfe:	09 45 f4             	or     %eax,-0xc(%rbp)
  801e01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e05:	48 c1 e8 02          	shr    $0x2,%rax
  801e09:	48 89 c1             	mov    %rax,%rcx
  801e0c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e10:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801e13:	48 89 d7             	mov    %rdx,%rdi
  801e16:	fc                   	cld    
  801e17:	f3 ab                	rep stos %eax,%es:(%rdi)
  801e19:	eb 11                	jmp    801e2c <memset+0x85>
  801e1b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e1f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801e22:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801e26:	48 89 d7             	mov    %rdx,%rdi
  801e29:	fc                   	cld    
  801e2a:	f3 aa                	rep stos %al,%es:(%rdi)
  801e2c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e30:	c9                   	leaveq 
  801e31:	c3                   	retq   

0000000000801e32 <memmove>:
  801e32:	55                   	push   %rbp
  801e33:	48 89 e5             	mov    %rsp,%rbp
  801e36:	48 83 ec 28          	sub    $0x28,%rsp
  801e3a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e3e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e42:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801e46:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e4a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801e4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e52:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e5a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801e5e:	0f 83 88 00 00 00    	jae    801eec <memmove+0xba>
  801e64:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e68:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e6c:	48 01 d0             	add    %rdx,%rax
  801e6f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801e73:	76 77                	jbe    801eec <memmove+0xba>
  801e75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e79:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801e7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e81:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801e85:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e89:	83 e0 03             	and    $0x3,%eax
  801e8c:	48 85 c0             	test   %rax,%rax
  801e8f:	75 3b                	jne    801ecc <memmove+0x9a>
  801e91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e95:	83 e0 03             	and    $0x3,%eax
  801e98:	48 85 c0             	test   %rax,%rax
  801e9b:	75 2f                	jne    801ecc <memmove+0x9a>
  801e9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ea1:	83 e0 03             	and    $0x3,%eax
  801ea4:	48 85 c0             	test   %rax,%rax
  801ea7:	75 23                	jne    801ecc <memmove+0x9a>
  801ea9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ead:	48 83 e8 04          	sub    $0x4,%rax
  801eb1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801eb5:	48 83 ea 04          	sub    $0x4,%rdx
  801eb9:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801ebd:	48 c1 e9 02          	shr    $0x2,%rcx
  801ec1:	48 89 c7             	mov    %rax,%rdi
  801ec4:	48 89 d6             	mov    %rdx,%rsi
  801ec7:	fd                   	std    
  801ec8:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801eca:	eb 1d                	jmp    801ee9 <memmove+0xb7>
  801ecc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ed0:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801ed4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ed8:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801edc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ee0:	48 89 d7             	mov    %rdx,%rdi
  801ee3:	48 89 c1             	mov    %rax,%rcx
  801ee6:	fd                   	std    
  801ee7:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801ee9:	fc                   	cld    
  801eea:	eb 57                	jmp    801f43 <memmove+0x111>
  801eec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ef0:	83 e0 03             	and    $0x3,%eax
  801ef3:	48 85 c0             	test   %rax,%rax
  801ef6:	75 36                	jne    801f2e <memmove+0xfc>
  801ef8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801efc:	83 e0 03             	and    $0x3,%eax
  801eff:	48 85 c0             	test   %rax,%rax
  801f02:	75 2a                	jne    801f2e <memmove+0xfc>
  801f04:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f08:	83 e0 03             	and    $0x3,%eax
  801f0b:	48 85 c0             	test   %rax,%rax
  801f0e:	75 1e                	jne    801f2e <memmove+0xfc>
  801f10:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f14:	48 c1 e8 02          	shr    $0x2,%rax
  801f18:	48 89 c1             	mov    %rax,%rcx
  801f1b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f1f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f23:	48 89 c7             	mov    %rax,%rdi
  801f26:	48 89 d6             	mov    %rdx,%rsi
  801f29:	fc                   	cld    
  801f2a:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801f2c:	eb 15                	jmp    801f43 <memmove+0x111>
  801f2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f32:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f36:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801f3a:	48 89 c7             	mov    %rax,%rdi
  801f3d:	48 89 d6             	mov    %rdx,%rsi
  801f40:	fc                   	cld    
  801f41:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801f43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f47:	c9                   	leaveq 
  801f48:	c3                   	retq   

0000000000801f49 <memcpy>:
  801f49:	55                   	push   %rbp
  801f4a:	48 89 e5             	mov    %rsp,%rbp
  801f4d:	48 83 ec 18          	sub    $0x18,%rsp
  801f51:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f55:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f59:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801f5d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801f61:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801f65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f69:	48 89 ce             	mov    %rcx,%rsi
  801f6c:	48 89 c7             	mov    %rax,%rdi
  801f6f:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  801f76:	00 00 00 
  801f79:	ff d0                	callq  *%rax
  801f7b:	c9                   	leaveq 
  801f7c:	c3                   	retq   

0000000000801f7d <memcmp>:
  801f7d:	55                   	push   %rbp
  801f7e:	48 89 e5             	mov    %rsp,%rbp
  801f81:	48 83 ec 28          	sub    $0x28,%rsp
  801f85:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f89:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f8d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801f91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f95:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f99:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f9d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fa1:	eb 36                	jmp    801fd9 <memcmp+0x5c>
  801fa3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fa7:	0f b6 10             	movzbl (%rax),%edx
  801faa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fae:	0f b6 00             	movzbl (%rax),%eax
  801fb1:	38 c2                	cmp    %al,%dl
  801fb3:	74 1a                	je     801fcf <memcmp+0x52>
  801fb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fb9:	0f b6 00             	movzbl (%rax),%eax
  801fbc:	0f b6 d0             	movzbl %al,%edx
  801fbf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fc3:	0f b6 00             	movzbl (%rax),%eax
  801fc6:	0f b6 c0             	movzbl %al,%eax
  801fc9:	29 c2                	sub    %eax,%edx
  801fcb:	89 d0                	mov    %edx,%eax
  801fcd:	eb 20                	jmp    801fef <memcmp+0x72>
  801fcf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801fd4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801fd9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fdd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801fe1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801fe5:	48 85 c0             	test   %rax,%rax
  801fe8:	75 b9                	jne    801fa3 <memcmp+0x26>
  801fea:	b8 00 00 00 00       	mov    $0x0,%eax
  801fef:	c9                   	leaveq 
  801ff0:	c3                   	retq   

0000000000801ff1 <memfind>:
  801ff1:	55                   	push   %rbp
  801ff2:	48 89 e5             	mov    %rsp,%rbp
  801ff5:	48 83 ec 28          	sub    $0x28,%rsp
  801ff9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ffd:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802000:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802004:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802008:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80200c:	48 01 d0             	add    %rdx,%rax
  80200f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802013:	eb 15                	jmp    80202a <memfind+0x39>
  802015:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802019:	0f b6 10             	movzbl (%rax),%edx
  80201c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80201f:	38 c2                	cmp    %al,%dl
  802021:	75 02                	jne    802025 <memfind+0x34>
  802023:	eb 0f                	jmp    802034 <memfind+0x43>
  802025:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80202a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80202e:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  802032:	72 e1                	jb     802015 <memfind+0x24>
  802034:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802038:	c9                   	leaveq 
  802039:	c3                   	retq   

000000000080203a <strtol>:
  80203a:	55                   	push   %rbp
  80203b:	48 89 e5             	mov    %rsp,%rbp
  80203e:	48 83 ec 34          	sub    $0x34,%rsp
  802042:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802046:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80204a:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80204d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802054:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80205b:	00 
  80205c:	eb 05                	jmp    802063 <strtol+0x29>
  80205e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802063:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802067:	0f b6 00             	movzbl (%rax),%eax
  80206a:	3c 20                	cmp    $0x20,%al
  80206c:	74 f0                	je     80205e <strtol+0x24>
  80206e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802072:	0f b6 00             	movzbl (%rax),%eax
  802075:	3c 09                	cmp    $0x9,%al
  802077:	74 e5                	je     80205e <strtol+0x24>
  802079:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80207d:	0f b6 00             	movzbl (%rax),%eax
  802080:	3c 2b                	cmp    $0x2b,%al
  802082:	75 07                	jne    80208b <strtol+0x51>
  802084:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802089:	eb 17                	jmp    8020a2 <strtol+0x68>
  80208b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80208f:	0f b6 00             	movzbl (%rax),%eax
  802092:	3c 2d                	cmp    $0x2d,%al
  802094:	75 0c                	jne    8020a2 <strtol+0x68>
  802096:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80209b:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8020a2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8020a6:	74 06                	je     8020ae <strtol+0x74>
  8020a8:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8020ac:	75 28                	jne    8020d6 <strtol+0x9c>
  8020ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020b2:	0f b6 00             	movzbl (%rax),%eax
  8020b5:	3c 30                	cmp    $0x30,%al
  8020b7:	75 1d                	jne    8020d6 <strtol+0x9c>
  8020b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020bd:	48 83 c0 01          	add    $0x1,%rax
  8020c1:	0f b6 00             	movzbl (%rax),%eax
  8020c4:	3c 78                	cmp    $0x78,%al
  8020c6:	75 0e                	jne    8020d6 <strtol+0x9c>
  8020c8:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8020cd:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8020d4:	eb 2c                	jmp    802102 <strtol+0xc8>
  8020d6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8020da:	75 19                	jne    8020f5 <strtol+0xbb>
  8020dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020e0:	0f b6 00             	movzbl (%rax),%eax
  8020e3:	3c 30                	cmp    $0x30,%al
  8020e5:	75 0e                	jne    8020f5 <strtol+0xbb>
  8020e7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8020ec:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8020f3:	eb 0d                	jmp    802102 <strtol+0xc8>
  8020f5:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8020f9:	75 07                	jne    802102 <strtol+0xc8>
  8020fb:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  802102:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802106:	0f b6 00             	movzbl (%rax),%eax
  802109:	3c 2f                	cmp    $0x2f,%al
  80210b:	7e 1d                	jle    80212a <strtol+0xf0>
  80210d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802111:	0f b6 00             	movzbl (%rax),%eax
  802114:	3c 39                	cmp    $0x39,%al
  802116:	7f 12                	jg     80212a <strtol+0xf0>
  802118:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80211c:	0f b6 00             	movzbl (%rax),%eax
  80211f:	0f be c0             	movsbl %al,%eax
  802122:	83 e8 30             	sub    $0x30,%eax
  802125:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802128:	eb 4e                	jmp    802178 <strtol+0x13e>
  80212a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80212e:	0f b6 00             	movzbl (%rax),%eax
  802131:	3c 60                	cmp    $0x60,%al
  802133:	7e 1d                	jle    802152 <strtol+0x118>
  802135:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802139:	0f b6 00             	movzbl (%rax),%eax
  80213c:	3c 7a                	cmp    $0x7a,%al
  80213e:	7f 12                	jg     802152 <strtol+0x118>
  802140:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802144:	0f b6 00             	movzbl (%rax),%eax
  802147:	0f be c0             	movsbl %al,%eax
  80214a:	83 e8 57             	sub    $0x57,%eax
  80214d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802150:	eb 26                	jmp    802178 <strtol+0x13e>
  802152:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802156:	0f b6 00             	movzbl (%rax),%eax
  802159:	3c 40                	cmp    $0x40,%al
  80215b:	7e 48                	jle    8021a5 <strtol+0x16b>
  80215d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802161:	0f b6 00             	movzbl (%rax),%eax
  802164:	3c 5a                	cmp    $0x5a,%al
  802166:	7f 3d                	jg     8021a5 <strtol+0x16b>
  802168:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80216c:	0f b6 00             	movzbl (%rax),%eax
  80216f:	0f be c0             	movsbl %al,%eax
  802172:	83 e8 37             	sub    $0x37,%eax
  802175:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802178:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80217b:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80217e:	7c 02                	jl     802182 <strtol+0x148>
  802180:	eb 23                	jmp    8021a5 <strtol+0x16b>
  802182:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802187:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80218a:	48 98                	cltq   
  80218c:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  802191:	48 89 c2             	mov    %rax,%rdx
  802194:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802197:	48 98                	cltq   
  802199:	48 01 d0             	add    %rdx,%rax
  80219c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021a0:	e9 5d ff ff ff       	jmpq   802102 <strtol+0xc8>
  8021a5:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8021aa:	74 0b                	je     8021b7 <strtol+0x17d>
  8021ac:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021b0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8021b4:	48 89 10             	mov    %rdx,(%rax)
  8021b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021bb:	74 09                	je     8021c6 <strtol+0x18c>
  8021bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021c1:	48 f7 d8             	neg    %rax
  8021c4:	eb 04                	jmp    8021ca <strtol+0x190>
  8021c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021ca:	c9                   	leaveq 
  8021cb:	c3                   	retq   

00000000008021cc <strstr>:
  8021cc:	55                   	push   %rbp
  8021cd:	48 89 e5             	mov    %rsp,%rbp
  8021d0:	48 83 ec 30          	sub    $0x30,%rsp
  8021d4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8021d8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8021dc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021e0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8021e4:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8021e8:	0f b6 00             	movzbl (%rax),%eax
  8021eb:	88 45 ff             	mov    %al,-0x1(%rbp)
  8021ee:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8021f2:	75 06                	jne    8021fa <strstr+0x2e>
  8021f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021f8:	eb 6b                	jmp    802265 <strstr+0x99>
  8021fa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021fe:	48 89 c7             	mov    %rax,%rdi
  802201:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  802208:	00 00 00 
  80220b:	ff d0                	callq  *%rax
  80220d:	48 98                	cltq   
  80220f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802213:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802217:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80221b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80221f:	0f b6 00             	movzbl (%rax),%eax
  802222:	88 45 ef             	mov    %al,-0x11(%rbp)
  802225:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  802229:	75 07                	jne    802232 <strstr+0x66>
  80222b:	b8 00 00 00 00       	mov    $0x0,%eax
  802230:	eb 33                	jmp    802265 <strstr+0x99>
  802232:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  802236:	3a 45 ff             	cmp    -0x1(%rbp),%al
  802239:	75 d8                	jne    802213 <strstr+0x47>
  80223b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80223f:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802243:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802247:	48 89 ce             	mov    %rcx,%rsi
  80224a:	48 89 c7             	mov    %rax,%rdi
  80224d:	48 b8 c3 1c 80 00 00 	movabs $0x801cc3,%rax
  802254:	00 00 00 
  802257:	ff d0                	callq  *%rax
  802259:	85 c0                	test   %eax,%eax
  80225b:	75 b6                	jne    802213 <strstr+0x47>
  80225d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802261:	48 83 e8 01          	sub    $0x1,%rax
  802265:	c9                   	leaveq 
  802266:	c3                   	retq   

0000000000802267 <syscall>:
  802267:	55                   	push   %rbp
  802268:	48 89 e5             	mov    %rsp,%rbp
  80226b:	53                   	push   %rbx
  80226c:	48 83 ec 48          	sub    $0x48,%rsp
  802270:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802273:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802276:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80227a:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80227e:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  802282:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  802286:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802289:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80228d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  802291:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802295:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  802299:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80229d:	4c 89 c3             	mov    %r8,%rbx
  8022a0:	cd 30                	int    $0x30
  8022a2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8022a6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8022aa:	74 3e                	je     8022ea <syscall+0x83>
  8022ac:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8022b1:	7e 37                	jle    8022ea <syscall+0x83>
  8022b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8022b7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8022ba:	49 89 d0             	mov    %rdx,%r8
  8022bd:	89 c1                	mov    %eax,%ecx
  8022bf:	48 ba 68 55 80 00 00 	movabs $0x805568,%rdx
  8022c6:	00 00 00 
  8022c9:	be 24 00 00 00       	mov    $0x24,%esi
  8022ce:	48 bf 85 55 80 00 00 	movabs $0x805585,%rdi
  8022d5:	00 00 00 
  8022d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8022dd:	49 b9 20 0d 80 00 00 	movabs $0x800d20,%r9
  8022e4:	00 00 00 
  8022e7:	41 ff d1             	callq  *%r9
  8022ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022ee:	48 83 c4 48          	add    $0x48,%rsp
  8022f2:	5b                   	pop    %rbx
  8022f3:	5d                   	pop    %rbp
  8022f4:	c3                   	retq   

00000000008022f5 <sys_cputs>:
  8022f5:	55                   	push   %rbp
  8022f6:	48 89 e5             	mov    %rsp,%rbp
  8022f9:	48 83 ec 20          	sub    $0x20,%rsp
  8022fd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802301:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802305:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802309:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80230d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802314:	00 
  802315:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80231b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802321:	48 89 d1             	mov    %rdx,%rcx
  802324:	48 89 c2             	mov    %rax,%rdx
  802327:	be 00 00 00 00       	mov    $0x0,%esi
  80232c:	bf 00 00 00 00       	mov    $0x0,%edi
  802331:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802338:	00 00 00 
  80233b:	ff d0                	callq  *%rax
  80233d:	c9                   	leaveq 
  80233e:	c3                   	retq   

000000000080233f <sys_cgetc>:
  80233f:	55                   	push   %rbp
  802340:	48 89 e5             	mov    %rsp,%rbp
  802343:	48 83 ec 10          	sub    $0x10,%rsp
  802347:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80234e:	00 
  80234f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802355:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80235b:	b9 00 00 00 00       	mov    $0x0,%ecx
  802360:	ba 00 00 00 00       	mov    $0x0,%edx
  802365:	be 00 00 00 00       	mov    $0x0,%esi
  80236a:	bf 01 00 00 00       	mov    $0x1,%edi
  80236f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802376:	00 00 00 
  802379:	ff d0                	callq  *%rax
  80237b:	c9                   	leaveq 
  80237c:	c3                   	retq   

000000000080237d <sys_env_destroy>:
  80237d:	55                   	push   %rbp
  80237e:	48 89 e5             	mov    %rsp,%rbp
  802381:	48 83 ec 10          	sub    $0x10,%rsp
  802385:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802388:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80238b:	48 98                	cltq   
  80238d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802394:	00 
  802395:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80239b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023a1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8023a6:	48 89 c2             	mov    %rax,%rdx
  8023a9:	be 01 00 00 00       	mov    $0x1,%esi
  8023ae:	bf 03 00 00 00       	mov    $0x3,%edi
  8023b3:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8023ba:	00 00 00 
  8023bd:	ff d0                	callq  *%rax
  8023bf:	c9                   	leaveq 
  8023c0:	c3                   	retq   

00000000008023c1 <sys_getenvid>:
  8023c1:	55                   	push   %rbp
  8023c2:	48 89 e5             	mov    %rsp,%rbp
  8023c5:	48 83 ec 10          	sub    $0x10,%rsp
  8023c9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8023d0:	00 
  8023d1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023d7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023dd:	b9 00 00 00 00       	mov    $0x0,%ecx
  8023e2:	ba 00 00 00 00       	mov    $0x0,%edx
  8023e7:	be 00 00 00 00       	mov    $0x0,%esi
  8023ec:	bf 02 00 00 00       	mov    $0x2,%edi
  8023f1:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8023f8:	00 00 00 
  8023fb:	ff d0                	callq  *%rax
  8023fd:	c9                   	leaveq 
  8023fe:	c3                   	retq   

00000000008023ff <sys_yield>:
  8023ff:	55                   	push   %rbp
  802400:	48 89 e5             	mov    %rsp,%rbp
  802403:	48 83 ec 10          	sub    $0x10,%rsp
  802407:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80240e:	00 
  80240f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802415:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80241b:	b9 00 00 00 00       	mov    $0x0,%ecx
  802420:	ba 00 00 00 00       	mov    $0x0,%edx
  802425:	be 00 00 00 00       	mov    $0x0,%esi
  80242a:	bf 0b 00 00 00       	mov    $0xb,%edi
  80242f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802436:	00 00 00 
  802439:	ff d0                	callq  *%rax
  80243b:	c9                   	leaveq 
  80243c:	c3                   	retq   

000000000080243d <sys_page_alloc>:
  80243d:	55                   	push   %rbp
  80243e:	48 89 e5             	mov    %rsp,%rbp
  802441:	48 83 ec 20          	sub    $0x20,%rsp
  802445:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802448:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80244c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80244f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802452:	48 63 c8             	movslq %eax,%rcx
  802455:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802459:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80245c:	48 98                	cltq   
  80245e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802465:	00 
  802466:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80246c:	49 89 c8             	mov    %rcx,%r8
  80246f:	48 89 d1             	mov    %rdx,%rcx
  802472:	48 89 c2             	mov    %rax,%rdx
  802475:	be 01 00 00 00       	mov    $0x1,%esi
  80247a:	bf 04 00 00 00       	mov    $0x4,%edi
  80247f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802486:	00 00 00 
  802489:	ff d0                	callq  *%rax
  80248b:	c9                   	leaveq 
  80248c:	c3                   	retq   

000000000080248d <sys_page_map>:
  80248d:	55                   	push   %rbp
  80248e:	48 89 e5             	mov    %rsp,%rbp
  802491:	48 83 ec 30          	sub    $0x30,%rsp
  802495:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802498:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80249c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80249f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8024a3:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8024a7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8024aa:	48 63 c8             	movslq %eax,%rcx
  8024ad:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8024b1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024b4:	48 63 f0             	movslq %eax,%rsi
  8024b7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024be:	48 98                	cltq   
  8024c0:	48 89 0c 24          	mov    %rcx,(%rsp)
  8024c4:	49 89 f9             	mov    %rdi,%r9
  8024c7:	49 89 f0             	mov    %rsi,%r8
  8024ca:	48 89 d1             	mov    %rdx,%rcx
  8024cd:	48 89 c2             	mov    %rax,%rdx
  8024d0:	be 01 00 00 00       	mov    $0x1,%esi
  8024d5:	bf 05 00 00 00       	mov    $0x5,%edi
  8024da:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8024e1:	00 00 00 
  8024e4:	ff d0                	callq  *%rax
  8024e6:	c9                   	leaveq 
  8024e7:	c3                   	retq   

00000000008024e8 <sys_page_unmap>:
  8024e8:	55                   	push   %rbp
  8024e9:	48 89 e5             	mov    %rsp,%rbp
  8024ec:	48 83 ec 20          	sub    $0x20,%rsp
  8024f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8024f3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8024f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024fe:	48 98                	cltq   
  802500:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802507:	00 
  802508:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80250e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802514:	48 89 d1             	mov    %rdx,%rcx
  802517:	48 89 c2             	mov    %rax,%rdx
  80251a:	be 01 00 00 00       	mov    $0x1,%esi
  80251f:	bf 06 00 00 00       	mov    $0x6,%edi
  802524:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  80252b:	00 00 00 
  80252e:	ff d0                	callq  *%rax
  802530:	c9                   	leaveq 
  802531:	c3                   	retq   

0000000000802532 <sys_env_set_status>:
  802532:	55                   	push   %rbp
  802533:	48 89 e5             	mov    %rsp,%rbp
  802536:	48 83 ec 10          	sub    $0x10,%rsp
  80253a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80253d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802540:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802543:	48 63 d0             	movslq %eax,%rdx
  802546:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802549:	48 98                	cltq   
  80254b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802552:	00 
  802553:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802559:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80255f:	48 89 d1             	mov    %rdx,%rcx
  802562:	48 89 c2             	mov    %rax,%rdx
  802565:	be 01 00 00 00       	mov    $0x1,%esi
  80256a:	bf 08 00 00 00       	mov    $0x8,%edi
  80256f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802576:	00 00 00 
  802579:	ff d0                	callq  *%rax
  80257b:	c9                   	leaveq 
  80257c:	c3                   	retq   

000000000080257d <sys_env_set_trapframe>:
  80257d:	55                   	push   %rbp
  80257e:	48 89 e5             	mov    %rsp,%rbp
  802581:	48 83 ec 20          	sub    $0x20,%rsp
  802585:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802588:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80258c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802590:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802593:	48 98                	cltq   
  802595:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80259c:	00 
  80259d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025a3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025a9:	48 89 d1             	mov    %rdx,%rcx
  8025ac:	48 89 c2             	mov    %rax,%rdx
  8025af:	be 01 00 00 00       	mov    $0x1,%esi
  8025b4:	bf 09 00 00 00       	mov    $0x9,%edi
  8025b9:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8025c0:	00 00 00 
  8025c3:	ff d0                	callq  *%rax
  8025c5:	c9                   	leaveq 
  8025c6:	c3                   	retq   

00000000008025c7 <sys_env_set_pgfault_upcall>:
  8025c7:	55                   	push   %rbp
  8025c8:	48 89 e5             	mov    %rsp,%rbp
  8025cb:	48 83 ec 20          	sub    $0x20,%rsp
  8025cf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8025d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8025d6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8025da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025dd:	48 98                	cltq   
  8025df:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8025e6:	00 
  8025e7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025ed:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025f3:	48 89 d1             	mov    %rdx,%rcx
  8025f6:	48 89 c2             	mov    %rax,%rdx
  8025f9:	be 01 00 00 00       	mov    $0x1,%esi
  8025fe:	bf 0a 00 00 00       	mov    $0xa,%edi
  802603:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  80260a:	00 00 00 
  80260d:	ff d0                	callq  *%rax
  80260f:	c9                   	leaveq 
  802610:	c3                   	retq   

0000000000802611 <sys_ipc_try_send>:
  802611:	55                   	push   %rbp
  802612:	48 89 e5             	mov    %rsp,%rbp
  802615:	48 83 ec 20          	sub    $0x20,%rsp
  802619:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80261c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802620:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802624:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  802627:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80262a:	48 63 f0             	movslq %eax,%rsi
  80262d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802631:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802634:	48 98                	cltq   
  802636:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80263a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802641:	00 
  802642:	49 89 f1             	mov    %rsi,%r9
  802645:	49 89 c8             	mov    %rcx,%r8
  802648:	48 89 d1             	mov    %rdx,%rcx
  80264b:	48 89 c2             	mov    %rax,%rdx
  80264e:	be 00 00 00 00       	mov    $0x0,%esi
  802653:	bf 0c 00 00 00       	mov    $0xc,%edi
  802658:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  80265f:	00 00 00 
  802662:	ff d0                	callq  *%rax
  802664:	c9                   	leaveq 
  802665:	c3                   	retq   

0000000000802666 <sys_ipc_recv>:
  802666:	55                   	push   %rbp
  802667:	48 89 e5             	mov    %rsp,%rbp
  80266a:	48 83 ec 10          	sub    $0x10,%rsp
  80266e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802672:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802676:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80267d:	00 
  80267e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802684:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80268a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80268f:	48 89 c2             	mov    %rax,%rdx
  802692:	be 01 00 00 00       	mov    $0x1,%esi
  802697:	bf 0d 00 00 00       	mov    $0xd,%edi
  80269c:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8026a3:	00 00 00 
  8026a6:	ff d0                	callq  *%rax
  8026a8:	c9                   	leaveq 
  8026a9:	c3                   	retq   

00000000008026aa <sys_time_msec>:
  8026aa:	55                   	push   %rbp
  8026ab:	48 89 e5             	mov    %rsp,%rbp
  8026ae:	48 83 ec 10          	sub    $0x10,%rsp
  8026b2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8026b9:	00 
  8026ba:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8026c0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8026c6:	b9 00 00 00 00       	mov    $0x0,%ecx
  8026cb:	ba 00 00 00 00       	mov    $0x0,%edx
  8026d0:	be 00 00 00 00       	mov    $0x0,%esi
  8026d5:	bf 0e 00 00 00       	mov    $0xe,%edi
  8026da:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8026e1:	00 00 00 
  8026e4:	ff d0                	callq  *%rax
  8026e6:	c9                   	leaveq 
  8026e7:	c3                   	retq   

00000000008026e8 <sys_net_transmit>:
  8026e8:	55                   	push   %rbp
  8026e9:	48 89 e5             	mov    %rsp,%rbp
  8026ec:	48 83 ec 20          	sub    $0x20,%rsp
  8026f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026f4:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8026f7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8026fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026fe:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802705:	00 
  802706:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80270c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802712:	48 89 d1             	mov    %rdx,%rcx
  802715:	48 89 c2             	mov    %rax,%rdx
  802718:	be 00 00 00 00       	mov    $0x0,%esi
  80271d:	bf 0f 00 00 00       	mov    $0xf,%edi
  802722:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802729:	00 00 00 
  80272c:	ff d0                	callq  *%rax
  80272e:	c9                   	leaveq 
  80272f:	c3                   	retq   

0000000000802730 <sys_net_receive>:
  802730:	55                   	push   %rbp
  802731:	48 89 e5             	mov    %rsp,%rbp
  802734:	48 83 ec 20          	sub    $0x20,%rsp
  802738:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80273c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80273f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802742:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802746:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80274d:	00 
  80274e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802754:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80275a:	48 89 d1             	mov    %rdx,%rcx
  80275d:	48 89 c2             	mov    %rax,%rdx
  802760:	be 00 00 00 00       	mov    $0x0,%esi
  802765:	bf 10 00 00 00       	mov    $0x10,%edi
  80276a:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802771:	00 00 00 
  802774:	ff d0                	callq  *%rax
  802776:	c9                   	leaveq 
  802777:	c3                   	retq   

0000000000802778 <sys_ept_map>:
  802778:	55                   	push   %rbp
  802779:	48 89 e5             	mov    %rsp,%rbp
  80277c:	48 83 ec 30          	sub    $0x30,%rsp
  802780:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802783:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802787:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80278a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80278e:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802792:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802795:	48 63 c8             	movslq %eax,%rcx
  802798:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80279c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80279f:	48 63 f0             	movslq %eax,%rsi
  8027a2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027a9:	48 98                	cltq   
  8027ab:	48 89 0c 24          	mov    %rcx,(%rsp)
  8027af:	49 89 f9             	mov    %rdi,%r9
  8027b2:	49 89 f0             	mov    %rsi,%r8
  8027b5:	48 89 d1             	mov    %rdx,%rcx
  8027b8:	48 89 c2             	mov    %rax,%rdx
  8027bb:	be 00 00 00 00       	mov    $0x0,%esi
  8027c0:	bf 11 00 00 00       	mov    $0x11,%edi
  8027c5:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8027cc:	00 00 00 
  8027cf:	ff d0                	callq  *%rax
  8027d1:	c9                   	leaveq 
  8027d2:	c3                   	retq   

00000000008027d3 <sys_env_mkguest>:
  8027d3:	55                   	push   %rbp
  8027d4:	48 89 e5             	mov    %rsp,%rbp
  8027d7:	48 83 ec 20          	sub    $0x20,%rsp
  8027db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8027df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8027e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8027eb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8027f2:	00 
  8027f3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8027f9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8027ff:	48 89 d1             	mov    %rdx,%rcx
  802802:	48 89 c2             	mov    %rax,%rdx
  802805:	be 00 00 00 00       	mov    $0x0,%esi
  80280a:	bf 12 00 00 00       	mov    $0x12,%edi
  80280f:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802816:	00 00 00 
  802819:	ff d0                	callq  *%rax
  80281b:	c9                   	leaveq 
  80281c:	c3                   	retq   

000000000080281d <sys_vmx_list_vms>:
  80281d:	55                   	push   %rbp
  80281e:	48 89 e5             	mov    %rsp,%rbp
  802821:	48 83 ec 10          	sub    $0x10,%rsp
  802825:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80282c:	00 
  80282d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802833:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802839:	b9 00 00 00 00       	mov    $0x0,%ecx
  80283e:	ba 00 00 00 00       	mov    $0x0,%edx
  802843:	be 00 00 00 00       	mov    $0x0,%esi
  802848:	bf 13 00 00 00       	mov    $0x13,%edi
  80284d:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802854:	00 00 00 
  802857:	ff d0                	callq  *%rax
  802859:	c9                   	leaveq 
  80285a:	c3                   	retq   

000000000080285b <sys_vmx_sel_resume>:
  80285b:	55                   	push   %rbp
  80285c:	48 89 e5             	mov    %rsp,%rbp
  80285f:	48 83 ec 10          	sub    $0x10,%rsp
  802863:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802866:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802869:	48 98                	cltq   
  80286b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802872:	00 
  802873:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802879:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80287f:	b9 00 00 00 00       	mov    $0x0,%ecx
  802884:	48 89 c2             	mov    %rax,%rdx
  802887:	be 00 00 00 00       	mov    $0x0,%esi
  80288c:	bf 14 00 00 00       	mov    $0x14,%edi
  802891:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802898:	00 00 00 
  80289b:	ff d0                	callq  *%rax
  80289d:	c9                   	leaveq 
  80289e:	c3                   	retq   

000000000080289f <sys_vmx_get_vmdisk_number>:
  80289f:	55                   	push   %rbp
  8028a0:	48 89 e5             	mov    %rsp,%rbp
  8028a3:	48 83 ec 10          	sub    $0x10,%rsp
  8028a7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8028ae:	00 
  8028af:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8028b5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8028bb:	b9 00 00 00 00       	mov    $0x0,%ecx
  8028c0:	ba 00 00 00 00       	mov    $0x0,%edx
  8028c5:	be 00 00 00 00       	mov    $0x0,%esi
  8028ca:	bf 15 00 00 00       	mov    $0x15,%edi
  8028cf:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  8028d6:	00 00 00 
  8028d9:	ff d0                	callq  *%rax
  8028db:	c9                   	leaveq 
  8028dc:	c3                   	retq   

00000000008028dd <sys_vmx_incr_vmdisk_number>:
  8028dd:	55                   	push   %rbp
  8028de:	48 89 e5             	mov    %rsp,%rbp
  8028e1:	48 83 ec 10          	sub    $0x10,%rsp
  8028e5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8028ec:	00 
  8028ed:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8028f3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8028f9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8028fe:	ba 00 00 00 00       	mov    $0x0,%edx
  802903:	be 00 00 00 00       	mov    $0x0,%esi
  802908:	bf 16 00 00 00       	mov    $0x16,%edi
  80290d:	48 b8 67 22 80 00 00 	movabs $0x802267,%rax
  802914:	00 00 00 
  802917:	ff d0                	callq  *%rax
  802919:	c9                   	leaveq 
  80291a:	c3                   	retq   

000000000080291b <ipc_recv>:
  80291b:	55                   	push   %rbp
  80291c:	48 89 e5             	mov    %rsp,%rbp
  80291f:	48 83 ec 30          	sub    $0x30,%rsp
  802923:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802927:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80292b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80292f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802934:	75 0e                	jne    802944 <ipc_recv+0x29>
  802936:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80293d:	00 00 00 
  802940:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802944:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802948:	48 89 c7             	mov    %rax,%rdi
  80294b:	48 b8 66 26 80 00 00 	movabs $0x802666,%rax
  802952:	00 00 00 
  802955:	ff d0                	callq  *%rax
  802957:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80295a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80295e:	79 27                	jns    802987 <ipc_recv+0x6c>
  802960:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802965:	74 0a                	je     802971 <ipc_recv+0x56>
  802967:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80296b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802971:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802976:	74 0a                	je     802982 <ipc_recv+0x67>
  802978:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80297c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802982:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802985:	eb 53                	jmp    8029da <ipc_recv+0xbf>
  802987:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80298c:	74 19                	je     8029a7 <ipc_recv+0x8c>
  80298e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802995:	00 00 00 
  802998:	48 8b 00             	mov    (%rax),%rax
  80299b:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8029a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029a5:	89 10                	mov    %edx,(%rax)
  8029a7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8029ac:	74 19                	je     8029c7 <ipc_recv+0xac>
  8029ae:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8029b5:	00 00 00 
  8029b8:	48 8b 00             	mov    (%rax),%rax
  8029bb:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8029c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029c5:	89 10                	mov    %edx,(%rax)
  8029c7:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8029ce:	00 00 00 
  8029d1:	48 8b 00             	mov    (%rax),%rax
  8029d4:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8029da:	c9                   	leaveq 
  8029db:	c3                   	retq   

00000000008029dc <ipc_send>:
  8029dc:	55                   	push   %rbp
  8029dd:	48 89 e5             	mov    %rsp,%rbp
  8029e0:	48 83 ec 30          	sub    $0x30,%rsp
  8029e4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029e7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8029ea:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8029ee:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8029f1:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8029f6:	75 10                	jne    802a08 <ipc_send+0x2c>
  8029f8:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8029ff:	00 00 00 
  802a02:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802a06:	eb 0e                	jmp    802a16 <ipc_send+0x3a>
  802a08:	eb 0c                	jmp    802a16 <ipc_send+0x3a>
  802a0a:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  802a11:	00 00 00 
  802a14:	ff d0                	callq  *%rax
  802a16:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802a19:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802a1c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802a20:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a23:	89 c7                	mov    %eax,%edi
  802a25:	48 b8 11 26 80 00 00 	movabs $0x802611,%rax
  802a2c:	00 00 00 
  802a2f:	ff d0                	callq  *%rax
  802a31:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a34:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  802a38:	74 d0                	je     802a0a <ipc_send+0x2e>
  802a3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a3e:	79 30                	jns    802a70 <ipc_send+0x94>
  802a40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a43:	89 c1                	mov    %eax,%ecx
  802a45:	48 ba 96 55 80 00 00 	movabs $0x805596,%rdx
  802a4c:	00 00 00 
  802a4f:	be 44 00 00 00       	mov    $0x44,%esi
  802a54:	48 bf ac 55 80 00 00 	movabs $0x8055ac,%rdi
  802a5b:	00 00 00 
  802a5e:	b8 00 00 00 00       	mov    $0x0,%eax
  802a63:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  802a6a:	00 00 00 
  802a6d:	41 ff d0             	callq  *%r8
  802a70:	c9                   	leaveq 
  802a71:	c3                   	retq   

0000000000802a72 <ipc_find_env>:
  802a72:	55                   	push   %rbp
  802a73:	48 89 e5             	mov    %rsp,%rbp
  802a76:	48 83 ec 14          	sub    $0x14,%rsp
  802a7a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a7d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a84:	eb 4e                	jmp    802ad4 <ipc_find_env+0x62>
  802a86:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802a8d:	00 00 00 
  802a90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a93:	48 98                	cltq   
  802a95:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802a9c:	48 01 d0             	add    %rdx,%rax
  802a9f:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802aa5:	8b 00                	mov    (%rax),%eax
  802aa7:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802aaa:	75 24                	jne    802ad0 <ipc_find_env+0x5e>
  802aac:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802ab3:	00 00 00 
  802ab6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ab9:	48 98                	cltq   
  802abb:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802ac2:	48 01 d0             	add    %rdx,%rax
  802ac5:	48 05 c0 00 00 00    	add    $0xc0,%rax
  802acb:	8b 40 08             	mov    0x8(%rax),%eax
  802ace:	eb 12                	jmp    802ae2 <ipc_find_env+0x70>
  802ad0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802ad4:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802adb:	7e a9                	jle    802a86 <ipc_find_env+0x14>
  802add:	b8 00 00 00 00       	mov    $0x0,%eax
  802ae2:	c9                   	leaveq 
  802ae3:	c3                   	retq   

0000000000802ae4 <fd2num>:
  802ae4:	55                   	push   %rbp
  802ae5:	48 89 e5             	mov    %rsp,%rbp
  802ae8:	48 83 ec 08          	sub    $0x8,%rsp
  802aec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802af0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802af4:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802afb:	ff ff ff 
  802afe:	48 01 d0             	add    %rdx,%rax
  802b01:	48 c1 e8 0c          	shr    $0xc,%rax
  802b05:	c9                   	leaveq 
  802b06:	c3                   	retq   

0000000000802b07 <fd2data>:
  802b07:	55                   	push   %rbp
  802b08:	48 89 e5             	mov    %rsp,%rbp
  802b0b:	48 83 ec 08          	sub    $0x8,%rsp
  802b0f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b17:	48 89 c7             	mov    %rax,%rdi
  802b1a:	48 b8 e4 2a 80 00 00 	movabs $0x802ae4,%rax
  802b21:	00 00 00 
  802b24:	ff d0                	callq  *%rax
  802b26:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802b2c:	48 c1 e0 0c          	shl    $0xc,%rax
  802b30:	c9                   	leaveq 
  802b31:	c3                   	retq   

0000000000802b32 <fd_alloc>:
  802b32:	55                   	push   %rbp
  802b33:	48 89 e5             	mov    %rsp,%rbp
  802b36:	48 83 ec 18          	sub    $0x18,%rsp
  802b3a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b3e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b45:	eb 6b                	jmp    802bb2 <fd_alloc+0x80>
  802b47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b4a:	48 98                	cltq   
  802b4c:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802b52:	48 c1 e0 0c          	shl    $0xc,%rax
  802b56:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802b5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b5e:	48 c1 e8 15          	shr    $0x15,%rax
  802b62:	48 89 c2             	mov    %rax,%rdx
  802b65:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802b6c:	01 00 00 
  802b6f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b73:	83 e0 01             	and    $0x1,%eax
  802b76:	48 85 c0             	test   %rax,%rax
  802b79:	74 21                	je     802b9c <fd_alloc+0x6a>
  802b7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b7f:	48 c1 e8 0c          	shr    $0xc,%rax
  802b83:	48 89 c2             	mov    %rax,%rdx
  802b86:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b8d:	01 00 00 
  802b90:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b94:	83 e0 01             	and    $0x1,%eax
  802b97:	48 85 c0             	test   %rax,%rax
  802b9a:	75 12                	jne    802bae <fd_alloc+0x7c>
  802b9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ba0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ba4:	48 89 10             	mov    %rdx,(%rax)
  802ba7:	b8 00 00 00 00       	mov    $0x0,%eax
  802bac:	eb 1a                	jmp    802bc8 <fd_alloc+0x96>
  802bae:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802bb2:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802bb6:	7e 8f                	jle    802b47 <fd_alloc+0x15>
  802bb8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bbc:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802bc3:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802bc8:	c9                   	leaveq 
  802bc9:	c3                   	retq   

0000000000802bca <fd_lookup>:
  802bca:	55                   	push   %rbp
  802bcb:	48 89 e5             	mov    %rsp,%rbp
  802bce:	48 83 ec 20          	sub    $0x20,%rsp
  802bd2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802bd5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802bd9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802bdd:	78 06                	js     802be5 <fd_lookup+0x1b>
  802bdf:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802be3:	7e 07                	jle    802bec <fd_lookup+0x22>
  802be5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802bea:	eb 6c                	jmp    802c58 <fd_lookup+0x8e>
  802bec:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bef:	48 98                	cltq   
  802bf1:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802bf7:	48 c1 e0 0c          	shl    $0xc,%rax
  802bfb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802bff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c03:	48 c1 e8 15          	shr    $0x15,%rax
  802c07:	48 89 c2             	mov    %rax,%rdx
  802c0a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802c11:	01 00 00 
  802c14:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c18:	83 e0 01             	and    $0x1,%eax
  802c1b:	48 85 c0             	test   %rax,%rax
  802c1e:	74 21                	je     802c41 <fd_lookup+0x77>
  802c20:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c24:	48 c1 e8 0c          	shr    $0xc,%rax
  802c28:	48 89 c2             	mov    %rax,%rdx
  802c2b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c32:	01 00 00 
  802c35:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c39:	83 e0 01             	and    $0x1,%eax
  802c3c:	48 85 c0             	test   %rax,%rax
  802c3f:	75 07                	jne    802c48 <fd_lookup+0x7e>
  802c41:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c46:	eb 10                	jmp    802c58 <fd_lookup+0x8e>
  802c48:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c4c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802c50:	48 89 10             	mov    %rdx,(%rax)
  802c53:	b8 00 00 00 00       	mov    $0x0,%eax
  802c58:	c9                   	leaveq 
  802c59:	c3                   	retq   

0000000000802c5a <fd_close>:
  802c5a:	55                   	push   %rbp
  802c5b:	48 89 e5             	mov    %rsp,%rbp
  802c5e:	48 83 ec 30          	sub    $0x30,%rsp
  802c62:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802c66:	89 f0                	mov    %esi,%eax
  802c68:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802c6b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c6f:	48 89 c7             	mov    %rax,%rdi
  802c72:	48 b8 e4 2a 80 00 00 	movabs $0x802ae4,%rax
  802c79:	00 00 00 
  802c7c:	ff d0                	callq  *%rax
  802c7e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c82:	48 89 d6             	mov    %rdx,%rsi
  802c85:	89 c7                	mov    %eax,%edi
  802c87:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  802c8e:	00 00 00 
  802c91:	ff d0                	callq  *%rax
  802c93:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c96:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c9a:	78 0a                	js     802ca6 <fd_close+0x4c>
  802c9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ca0:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802ca4:	74 12                	je     802cb8 <fd_close+0x5e>
  802ca6:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802caa:	74 05                	je     802cb1 <fd_close+0x57>
  802cac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802caf:	eb 05                	jmp    802cb6 <fd_close+0x5c>
  802cb1:	b8 00 00 00 00       	mov    $0x0,%eax
  802cb6:	eb 69                	jmp    802d21 <fd_close+0xc7>
  802cb8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802cbc:	8b 00                	mov    (%rax),%eax
  802cbe:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802cc2:	48 89 d6             	mov    %rdx,%rsi
  802cc5:	89 c7                	mov    %eax,%edi
  802cc7:	48 b8 23 2d 80 00 00 	movabs $0x802d23,%rax
  802cce:	00 00 00 
  802cd1:	ff d0                	callq  *%rax
  802cd3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cd6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cda:	78 2a                	js     802d06 <fd_close+0xac>
  802cdc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ce0:	48 8b 40 20          	mov    0x20(%rax),%rax
  802ce4:	48 85 c0             	test   %rax,%rax
  802ce7:	74 16                	je     802cff <fd_close+0xa5>
  802ce9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ced:	48 8b 40 20          	mov    0x20(%rax),%rax
  802cf1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802cf5:	48 89 d7             	mov    %rdx,%rdi
  802cf8:	ff d0                	callq  *%rax
  802cfa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cfd:	eb 07                	jmp    802d06 <fd_close+0xac>
  802cff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d06:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d0a:	48 89 c6             	mov    %rax,%rsi
  802d0d:	bf 00 00 00 00       	mov    $0x0,%edi
  802d12:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  802d19:	00 00 00 
  802d1c:	ff d0                	callq  *%rax
  802d1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d21:	c9                   	leaveq 
  802d22:	c3                   	retq   

0000000000802d23 <dev_lookup>:
  802d23:	55                   	push   %rbp
  802d24:	48 89 e5             	mov    %rsp,%rbp
  802d27:	48 83 ec 20          	sub    $0x20,%rsp
  802d2b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d2e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d32:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d39:	eb 41                	jmp    802d7c <dev_lookup+0x59>
  802d3b:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802d42:	00 00 00 
  802d45:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d48:	48 63 d2             	movslq %edx,%rdx
  802d4b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802d4f:	8b 00                	mov    (%rax),%eax
  802d51:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802d54:	75 22                	jne    802d78 <dev_lookup+0x55>
  802d56:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802d5d:	00 00 00 
  802d60:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d63:	48 63 d2             	movslq %edx,%rdx
  802d66:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802d6a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d6e:	48 89 10             	mov    %rdx,(%rax)
  802d71:	b8 00 00 00 00       	mov    $0x0,%eax
  802d76:	eb 60                	jmp    802dd8 <dev_lookup+0xb5>
  802d78:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802d7c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802d83:	00 00 00 
  802d86:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802d89:	48 63 d2             	movslq %edx,%rdx
  802d8c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802d90:	48 85 c0             	test   %rax,%rax
  802d93:	75 a6                	jne    802d3b <dev_lookup+0x18>
  802d95:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802d9c:	00 00 00 
  802d9f:	48 8b 00             	mov    (%rax),%rax
  802da2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802da8:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802dab:	89 c6                	mov    %eax,%esi
  802dad:	48 bf c0 55 80 00 00 	movabs $0x8055c0,%rdi
  802db4:	00 00 00 
  802db7:	b8 00 00 00 00       	mov    $0x0,%eax
  802dbc:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  802dc3:	00 00 00 
  802dc6:	ff d1                	callq  *%rcx
  802dc8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802dcc:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802dd3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802dd8:	c9                   	leaveq 
  802dd9:	c3                   	retq   

0000000000802dda <close>:
  802dda:	55                   	push   %rbp
  802ddb:	48 89 e5             	mov    %rsp,%rbp
  802dde:	48 83 ec 20          	sub    $0x20,%rsp
  802de2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802de5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802de9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802dec:	48 89 d6             	mov    %rdx,%rsi
  802def:	89 c7                	mov    %eax,%edi
  802df1:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  802df8:	00 00 00 
  802dfb:	ff d0                	callq  *%rax
  802dfd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e00:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e04:	79 05                	jns    802e0b <close+0x31>
  802e06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e09:	eb 18                	jmp    802e23 <close+0x49>
  802e0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e0f:	be 01 00 00 00       	mov    $0x1,%esi
  802e14:	48 89 c7             	mov    %rax,%rdi
  802e17:	48 b8 5a 2c 80 00 00 	movabs $0x802c5a,%rax
  802e1e:	00 00 00 
  802e21:	ff d0                	callq  *%rax
  802e23:	c9                   	leaveq 
  802e24:	c3                   	retq   

0000000000802e25 <close_all>:
  802e25:	55                   	push   %rbp
  802e26:	48 89 e5             	mov    %rsp,%rbp
  802e29:	48 83 ec 10          	sub    $0x10,%rsp
  802e2d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802e34:	eb 15                	jmp    802e4b <close_all+0x26>
  802e36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e39:	89 c7                	mov    %eax,%edi
  802e3b:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  802e42:	00 00 00 
  802e45:	ff d0                	callq  *%rax
  802e47:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802e4b:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802e4f:	7e e5                	jle    802e36 <close_all+0x11>
  802e51:	c9                   	leaveq 
  802e52:	c3                   	retq   

0000000000802e53 <dup>:
  802e53:	55                   	push   %rbp
  802e54:	48 89 e5             	mov    %rsp,%rbp
  802e57:	48 83 ec 40          	sub    $0x40,%rsp
  802e5b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802e5e:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802e61:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802e65:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802e68:	48 89 d6             	mov    %rdx,%rsi
  802e6b:	89 c7                	mov    %eax,%edi
  802e6d:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  802e74:	00 00 00 
  802e77:	ff d0                	callq  *%rax
  802e79:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e7c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e80:	79 08                	jns    802e8a <dup+0x37>
  802e82:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e85:	e9 70 01 00 00       	jmpq   802ffa <dup+0x1a7>
  802e8a:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802e8d:	89 c7                	mov    %eax,%edi
  802e8f:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  802e96:	00 00 00 
  802e99:	ff d0                	callq  *%rax
  802e9b:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802e9e:	48 98                	cltq   
  802ea0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802ea6:	48 c1 e0 0c          	shl    $0xc,%rax
  802eaa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802eae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802eb2:	48 89 c7             	mov    %rax,%rdi
  802eb5:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  802ebc:	00 00 00 
  802ebf:	ff d0                	callq  *%rax
  802ec1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802ec5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ec9:	48 89 c7             	mov    %rax,%rdi
  802ecc:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  802ed3:	00 00 00 
  802ed6:	ff d0                	callq  *%rax
  802ed8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802edc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ee0:	48 c1 e8 15          	shr    $0x15,%rax
  802ee4:	48 89 c2             	mov    %rax,%rdx
  802ee7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802eee:	01 00 00 
  802ef1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ef5:	83 e0 01             	and    $0x1,%eax
  802ef8:	48 85 c0             	test   %rax,%rax
  802efb:	74 73                	je     802f70 <dup+0x11d>
  802efd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f01:	48 c1 e8 0c          	shr    $0xc,%rax
  802f05:	48 89 c2             	mov    %rax,%rdx
  802f08:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f0f:	01 00 00 
  802f12:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f16:	83 e0 01             	and    $0x1,%eax
  802f19:	48 85 c0             	test   %rax,%rax
  802f1c:	74 52                	je     802f70 <dup+0x11d>
  802f1e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f22:	48 c1 e8 0c          	shr    $0xc,%rax
  802f26:	48 89 c2             	mov    %rax,%rdx
  802f29:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f30:	01 00 00 
  802f33:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f37:	25 07 0e 00 00       	and    $0xe07,%eax
  802f3c:	89 c1                	mov    %eax,%ecx
  802f3e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802f42:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f46:	41 89 c8             	mov    %ecx,%r8d
  802f49:	48 89 d1             	mov    %rdx,%rcx
  802f4c:	ba 00 00 00 00       	mov    $0x0,%edx
  802f51:	48 89 c6             	mov    %rax,%rsi
  802f54:	bf 00 00 00 00       	mov    $0x0,%edi
  802f59:	48 b8 8d 24 80 00 00 	movabs $0x80248d,%rax
  802f60:	00 00 00 
  802f63:	ff d0                	callq  *%rax
  802f65:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f68:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f6c:	79 02                	jns    802f70 <dup+0x11d>
  802f6e:	eb 57                	jmp    802fc7 <dup+0x174>
  802f70:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f74:	48 c1 e8 0c          	shr    $0xc,%rax
  802f78:	48 89 c2             	mov    %rax,%rdx
  802f7b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f82:	01 00 00 
  802f85:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f89:	25 07 0e 00 00       	and    $0xe07,%eax
  802f8e:	89 c1                	mov    %eax,%ecx
  802f90:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f94:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f98:	41 89 c8             	mov    %ecx,%r8d
  802f9b:	48 89 d1             	mov    %rdx,%rcx
  802f9e:	ba 00 00 00 00       	mov    $0x0,%edx
  802fa3:	48 89 c6             	mov    %rax,%rsi
  802fa6:	bf 00 00 00 00       	mov    $0x0,%edi
  802fab:	48 b8 8d 24 80 00 00 	movabs $0x80248d,%rax
  802fb2:	00 00 00 
  802fb5:	ff d0                	callq  *%rax
  802fb7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fbe:	79 02                	jns    802fc2 <dup+0x16f>
  802fc0:	eb 05                	jmp    802fc7 <dup+0x174>
  802fc2:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802fc5:	eb 33                	jmp    802ffa <dup+0x1a7>
  802fc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fcb:	48 89 c6             	mov    %rax,%rsi
  802fce:	bf 00 00 00 00       	mov    $0x0,%edi
  802fd3:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  802fda:	00 00 00 
  802fdd:	ff d0                	callq  *%rax
  802fdf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fe3:	48 89 c6             	mov    %rax,%rsi
  802fe6:	bf 00 00 00 00       	mov    $0x0,%edi
  802feb:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  802ff2:	00 00 00 
  802ff5:	ff d0                	callq  *%rax
  802ff7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ffa:	c9                   	leaveq 
  802ffb:	c3                   	retq   

0000000000802ffc <read>:
  802ffc:	55                   	push   %rbp
  802ffd:	48 89 e5             	mov    %rsp,%rbp
  803000:	48 83 ec 40          	sub    $0x40,%rsp
  803004:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803007:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80300b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80300f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803013:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803016:	48 89 d6             	mov    %rdx,%rsi
  803019:	89 c7                	mov    %eax,%edi
  80301b:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  803022:	00 00 00 
  803025:	ff d0                	callq  *%rax
  803027:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80302a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80302e:	78 24                	js     803054 <read+0x58>
  803030:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803034:	8b 00                	mov    (%rax),%eax
  803036:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80303a:	48 89 d6             	mov    %rdx,%rsi
  80303d:	89 c7                	mov    %eax,%edi
  80303f:	48 b8 23 2d 80 00 00 	movabs $0x802d23,%rax
  803046:	00 00 00 
  803049:	ff d0                	callq  *%rax
  80304b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80304e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803052:	79 05                	jns    803059 <read+0x5d>
  803054:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803057:	eb 76                	jmp    8030cf <read+0xd3>
  803059:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80305d:	8b 40 08             	mov    0x8(%rax),%eax
  803060:	83 e0 03             	and    $0x3,%eax
  803063:	83 f8 01             	cmp    $0x1,%eax
  803066:	75 3a                	jne    8030a2 <read+0xa6>
  803068:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80306f:	00 00 00 
  803072:	48 8b 00             	mov    (%rax),%rax
  803075:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80307b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80307e:	89 c6                	mov    %eax,%esi
  803080:	48 bf df 55 80 00 00 	movabs $0x8055df,%rdi
  803087:	00 00 00 
  80308a:	b8 00 00 00 00       	mov    $0x0,%eax
  80308f:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  803096:	00 00 00 
  803099:	ff d1                	callq  *%rcx
  80309b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8030a0:	eb 2d                	jmp    8030cf <read+0xd3>
  8030a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030a6:	48 8b 40 10          	mov    0x10(%rax),%rax
  8030aa:	48 85 c0             	test   %rax,%rax
  8030ad:	75 07                	jne    8030b6 <read+0xba>
  8030af:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8030b4:	eb 19                	jmp    8030cf <read+0xd3>
  8030b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030ba:	48 8b 40 10          	mov    0x10(%rax),%rax
  8030be:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8030c2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8030c6:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8030ca:	48 89 cf             	mov    %rcx,%rdi
  8030cd:	ff d0                	callq  *%rax
  8030cf:	c9                   	leaveq 
  8030d0:	c3                   	retq   

00000000008030d1 <readn>:
  8030d1:	55                   	push   %rbp
  8030d2:	48 89 e5             	mov    %rsp,%rbp
  8030d5:	48 83 ec 30          	sub    $0x30,%rsp
  8030d9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030dc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030e0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8030e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8030eb:	eb 49                	jmp    803136 <readn+0x65>
  8030ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030f0:	48 98                	cltq   
  8030f2:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8030f6:	48 29 c2             	sub    %rax,%rdx
  8030f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030fc:	48 63 c8             	movslq %eax,%rcx
  8030ff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803103:	48 01 c1             	add    %rax,%rcx
  803106:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803109:	48 89 ce             	mov    %rcx,%rsi
  80310c:	89 c7                	mov    %eax,%edi
  80310e:	48 b8 fc 2f 80 00 00 	movabs $0x802ffc,%rax
  803115:	00 00 00 
  803118:	ff d0                	callq  *%rax
  80311a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80311d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803121:	79 05                	jns    803128 <readn+0x57>
  803123:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803126:	eb 1c                	jmp    803144 <readn+0x73>
  803128:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80312c:	75 02                	jne    803130 <readn+0x5f>
  80312e:	eb 11                	jmp    803141 <readn+0x70>
  803130:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803133:	01 45 fc             	add    %eax,-0x4(%rbp)
  803136:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803139:	48 98                	cltq   
  80313b:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80313f:	72 ac                	jb     8030ed <readn+0x1c>
  803141:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803144:	c9                   	leaveq 
  803145:	c3                   	retq   

0000000000803146 <write>:
  803146:	55                   	push   %rbp
  803147:	48 89 e5             	mov    %rsp,%rbp
  80314a:	48 83 ec 40          	sub    $0x40,%rsp
  80314e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803151:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803155:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803159:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80315d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803160:	48 89 d6             	mov    %rdx,%rsi
  803163:	89 c7                	mov    %eax,%edi
  803165:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  80316c:	00 00 00 
  80316f:	ff d0                	callq  *%rax
  803171:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803174:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803178:	78 24                	js     80319e <write+0x58>
  80317a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80317e:	8b 00                	mov    (%rax),%eax
  803180:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803184:	48 89 d6             	mov    %rdx,%rsi
  803187:	89 c7                	mov    %eax,%edi
  803189:	48 b8 23 2d 80 00 00 	movabs $0x802d23,%rax
  803190:	00 00 00 
  803193:	ff d0                	callq  *%rax
  803195:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803198:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80319c:	79 05                	jns    8031a3 <write+0x5d>
  80319e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a1:	eb 75                	jmp    803218 <write+0xd2>
  8031a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031a7:	8b 40 08             	mov    0x8(%rax),%eax
  8031aa:	83 e0 03             	and    $0x3,%eax
  8031ad:	85 c0                	test   %eax,%eax
  8031af:	75 3a                	jne    8031eb <write+0xa5>
  8031b1:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8031b8:	00 00 00 
  8031bb:	48 8b 00             	mov    (%rax),%rax
  8031be:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8031c4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8031c7:	89 c6                	mov    %eax,%esi
  8031c9:	48 bf fb 55 80 00 00 	movabs $0x8055fb,%rdi
  8031d0:	00 00 00 
  8031d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8031d8:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  8031df:	00 00 00 
  8031e2:	ff d1                	callq  *%rcx
  8031e4:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8031e9:	eb 2d                	jmp    803218 <write+0xd2>
  8031eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031ef:	48 8b 40 18          	mov    0x18(%rax),%rax
  8031f3:	48 85 c0             	test   %rax,%rax
  8031f6:	75 07                	jne    8031ff <write+0xb9>
  8031f8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8031fd:	eb 19                	jmp    803218 <write+0xd2>
  8031ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803203:	48 8b 40 18          	mov    0x18(%rax),%rax
  803207:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80320b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80320f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803213:	48 89 cf             	mov    %rcx,%rdi
  803216:	ff d0                	callq  *%rax
  803218:	c9                   	leaveq 
  803219:	c3                   	retq   

000000000080321a <seek>:
  80321a:	55                   	push   %rbp
  80321b:	48 89 e5             	mov    %rsp,%rbp
  80321e:	48 83 ec 18          	sub    $0x18,%rsp
  803222:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803225:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803228:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80322c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80322f:	48 89 d6             	mov    %rdx,%rsi
  803232:	89 c7                	mov    %eax,%edi
  803234:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  80323b:	00 00 00 
  80323e:	ff d0                	callq  *%rax
  803240:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803243:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803247:	79 05                	jns    80324e <seek+0x34>
  803249:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80324c:	eb 0f                	jmp    80325d <seek+0x43>
  80324e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803252:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803255:	89 50 04             	mov    %edx,0x4(%rax)
  803258:	b8 00 00 00 00       	mov    $0x0,%eax
  80325d:	c9                   	leaveq 
  80325e:	c3                   	retq   

000000000080325f <ftruncate>:
  80325f:	55                   	push   %rbp
  803260:	48 89 e5             	mov    %rsp,%rbp
  803263:	48 83 ec 30          	sub    $0x30,%rsp
  803267:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80326a:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80326d:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803271:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803274:	48 89 d6             	mov    %rdx,%rsi
  803277:	89 c7                	mov    %eax,%edi
  803279:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  803280:	00 00 00 
  803283:	ff d0                	callq  *%rax
  803285:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803288:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80328c:	78 24                	js     8032b2 <ftruncate+0x53>
  80328e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803292:	8b 00                	mov    (%rax),%eax
  803294:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803298:	48 89 d6             	mov    %rdx,%rsi
  80329b:	89 c7                	mov    %eax,%edi
  80329d:	48 b8 23 2d 80 00 00 	movabs $0x802d23,%rax
  8032a4:	00 00 00 
  8032a7:	ff d0                	callq  *%rax
  8032a9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032b0:	79 05                	jns    8032b7 <ftruncate+0x58>
  8032b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032b5:	eb 72                	jmp    803329 <ftruncate+0xca>
  8032b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032bb:	8b 40 08             	mov    0x8(%rax),%eax
  8032be:	83 e0 03             	and    $0x3,%eax
  8032c1:	85 c0                	test   %eax,%eax
  8032c3:	75 3a                	jne    8032ff <ftruncate+0xa0>
  8032c5:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8032cc:	00 00 00 
  8032cf:	48 8b 00             	mov    (%rax),%rax
  8032d2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8032d8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8032db:	89 c6                	mov    %eax,%esi
  8032dd:	48 bf 18 56 80 00 00 	movabs $0x805618,%rdi
  8032e4:	00 00 00 
  8032e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8032ec:	48 b9 59 0f 80 00 00 	movabs $0x800f59,%rcx
  8032f3:	00 00 00 
  8032f6:	ff d1                	callq  *%rcx
  8032f8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8032fd:	eb 2a                	jmp    803329 <ftruncate+0xca>
  8032ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803303:	48 8b 40 30          	mov    0x30(%rax),%rax
  803307:	48 85 c0             	test   %rax,%rax
  80330a:	75 07                	jne    803313 <ftruncate+0xb4>
  80330c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803311:	eb 16                	jmp    803329 <ftruncate+0xca>
  803313:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803317:	48 8b 40 30          	mov    0x30(%rax),%rax
  80331b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80331f:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  803322:	89 ce                	mov    %ecx,%esi
  803324:	48 89 d7             	mov    %rdx,%rdi
  803327:	ff d0                	callq  *%rax
  803329:	c9                   	leaveq 
  80332a:	c3                   	retq   

000000000080332b <fstat>:
  80332b:	55                   	push   %rbp
  80332c:	48 89 e5             	mov    %rsp,%rbp
  80332f:	48 83 ec 30          	sub    $0x30,%rsp
  803333:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803336:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80333a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80333e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803341:	48 89 d6             	mov    %rdx,%rsi
  803344:	89 c7                	mov    %eax,%edi
  803346:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  80334d:	00 00 00 
  803350:	ff d0                	callq  *%rax
  803352:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803355:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803359:	78 24                	js     80337f <fstat+0x54>
  80335b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80335f:	8b 00                	mov    (%rax),%eax
  803361:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803365:	48 89 d6             	mov    %rdx,%rsi
  803368:	89 c7                	mov    %eax,%edi
  80336a:	48 b8 23 2d 80 00 00 	movabs $0x802d23,%rax
  803371:	00 00 00 
  803374:	ff d0                	callq  *%rax
  803376:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803379:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80337d:	79 05                	jns    803384 <fstat+0x59>
  80337f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803382:	eb 5e                	jmp    8033e2 <fstat+0xb7>
  803384:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803388:	48 8b 40 28          	mov    0x28(%rax),%rax
  80338c:	48 85 c0             	test   %rax,%rax
  80338f:	75 07                	jne    803398 <fstat+0x6d>
  803391:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803396:	eb 4a                	jmp    8033e2 <fstat+0xb7>
  803398:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80339c:	c6 00 00             	movb   $0x0,(%rax)
  80339f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033a3:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8033aa:	00 00 00 
  8033ad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033b1:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8033b8:	00 00 00 
  8033bb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8033bf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033c3:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8033ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033ce:	48 8b 40 28          	mov    0x28(%rax),%rax
  8033d2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8033d6:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8033da:	48 89 ce             	mov    %rcx,%rsi
  8033dd:	48 89 d7             	mov    %rdx,%rdi
  8033e0:	ff d0                	callq  *%rax
  8033e2:	c9                   	leaveq 
  8033e3:	c3                   	retq   

00000000008033e4 <stat>:
  8033e4:	55                   	push   %rbp
  8033e5:	48 89 e5             	mov    %rsp,%rbp
  8033e8:	48 83 ec 20          	sub    $0x20,%rsp
  8033ec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033f0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033f8:	be 00 00 00 00       	mov    $0x0,%esi
  8033fd:	48 89 c7             	mov    %rax,%rdi
  803400:	48 b8 d2 34 80 00 00 	movabs $0x8034d2,%rax
  803407:	00 00 00 
  80340a:	ff d0                	callq  *%rax
  80340c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80340f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803413:	79 05                	jns    80341a <stat+0x36>
  803415:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803418:	eb 2f                	jmp    803449 <stat+0x65>
  80341a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80341e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803421:	48 89 d6             	mov    %rdx,%rsi
  803424:	89 c7                	mov    %eax,%edi
  803426:	48 b8 2b 33 80 00 00 	movabs $0x80332b,%rax
  80342d:	00 00 00 
  803430:	ff d0                	callq  *%rax
  803432:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803435:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803438:	89 c7                	mov    %eax,%edi
  80343a:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  803441:	00 00 00 
  803444:	ff d0                	callq  *%rax
  803446:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803449:	c9                   	leaveq 
  80344a:	c3                   	retq   

000000000080344b <fsipc>:
  80344b:	55                   	push   %rbp
  80344c:	48 89 e5             	mov    %rsp,%rbp
  80344f:	48 83 ec 10          	sub    $0x10,%rsp
  803453:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803456:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80345a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803461:	00 00 00 
  803464:	8b 00                	mov    (%rax),%eax
  803466:	85 c0                	test   %eax,%eax
  803468:	75 1d                	jne    803487 <fsipc+0x3c>
  80346a:	bf 01 00 00 00       	mov    $0x1,%edi
  80346f:	48 b8 72 2a 80 00 00 	movabs $0x802a72,%rax
  803476:	00 00 00 
  803479:	ff d0                	callq  *%rax
  80347b:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  803482:	00 00 00 
  803485:	89 02                	mov    %eax,(%rdx)
  803487:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80348e:	00 00 00 
  803491:	8b 00                	mov    (%rax),%eax
  803493:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803496:	b9 07 00 00 00       	mov    $0x7,%ecx
  80349b:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8034a2:	00 00 00 
  8034a5:	89 c7                	mov    %eax,%edi
  8034a7:	48 b8 dc 29 80 00 00 	movabs $0x8029dc,%rax
  8034ae:	00 00 00 
  8034b1:	ff d0                	callq  *%rax
  8034b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034b7:	ba 00 00 00 00       	mov    $0x0,%edx
  8034bc:	48 89 c6             	mov    %rax,%rsi
  8034bf:	bf 00 00 00 00       	mov    $0x0,%edi
  8034c4:	48 b8 1b 29 80 00 00 	movabs $0x80291b,%rax
  8034cb:	00 00 00 
  8034ce:	ff d0                	callq  *%rax
  8034d0:	c9                   	leaveq 
  8034d1:	c3                   	retq   

00000000008034d2 <open>:
  8034d2:	55                   	push   %rbp
  8034d3:	48 89 e5             	mov    %rsp,%rbp
  8034d6:	48 83 ec 20          	sub    $0x20,%rsp
  8034da:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034de:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8034e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034e5:	48 89 c7             	mov    %rax,%rdi
  8034e8:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  8034ef:	00 00 00 
  8034f2:	ff d0                	callq  *%rax
  8034f4:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8034f9:	7e 0a                	jle    803505 <open+0x33>
  8034fb:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803500:	e9 a5 00 00 00       	jmpq   8035aa <open+0xd8>
  803505:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803509:	48 89 c7             	mov    %rax,%rdi
  80350c:	48 b8 32 2b 80 00 00 	movabs $0x802b32,%rax
  803513:	00 00 00 
  803516:	ff d0                	callq  *%rax
  803518:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80351b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80351f:	79 08                	jns    803529 <open+0x57>
  803521:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803524:	e9 81 00 00 00       	jmpq   8035aa <open+0xd8>
  803529:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80352d:	48 89 c6             	mov    %rax,%rsi
  803530:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803537:	00 00 00 
  80353a:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  803541:	00 00 00 
  803544:	ff d0                	callq  *%rax
  803546:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80354d:	00 00 00 
  803550:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803553:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803559:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80355d:	48 89 c6             	mov    %rax,%rsi
  803560:	bf 01 00 00 00       	mov    $0x1,%edi
  803565:	48 b8 4b 34 80 00 00 	movabs $0x80344b,%rax
  80356c:	00 00 00 
  80356f:	ff d0                	callq  *%rax
  803571:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803574:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803578:	79 1d                	jns    803597 <open+0xc5>
  80357a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80357e:	be 00 00 00 00       	mov    $0x0,%esi
  803583:	48 89 c7             	mov    %rax,%rdi
  803586:	48 b8 5a 2c 80 00 00 	movabs $0x802c5a,%rax
  80358d:	00 00 00 
  803590:	ff d0                	callq  *%rax
  803592:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803595:	eb 13                	jmp    8035aa <open+0xd8>
  803597:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80359b:	48 89 c7             	mov    %rax,%rdi
  80359e:	48 b8 e4 2a 80 00 00 	movabs $0x802ae4,%rax
  8035a5:	00 00 00 
  8035a8:	ff d0                	callq  *%rax
  8035aa:	c9                   	leaveq 
  8035ab:	c3                   	retq   

00000000008035ac <devfile_flush>:
  8035ac:	55                   	push   %rbp
  8035ad:	48 89 e5             	mov    %rsp,%rbp
  8035b0:	48 83 ec 10          	sub    $0x10,%rsp
  8035b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8035b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035bc:	8b 50 0c             	mov    0xc(%rax),%edx
  8035bf:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035c6:	00 00 00 
  8035c9:	89 10                	mov    %edx,(%rax)
  8035cb:	be 00 00 00 00       	mov    $0x0,%esi
  8035d0:	bf 06 00 00 00       	mov    $0x6,%edi
  8035d5:	48 b8 4b 34 80 00 00 	movabs $0x80344b,%rax
  8035dc:	00 00 00 
  8035df:	ff d0                	callq  *%rax
  8035e1:	c9                   	leaveq 
  8035e2:	c3                   	retq   

00000000008035e3 <devfile_read>:
  8035e3:	55                   	push   %rbp
  8035e4:	48 89 e5             	mov    %rsp,%rbp
  8035e7:	48 83 ec 30          	sub    $0x30,%rsp
  8035eb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8035ef:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8035f3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8035f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035fb:	8b 50 0c             	mov    0xc(%rax),%edx
  8035fe:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803605:	00 00 00 
  803608:	89 10                	mov    %edx,(%rax)
  80360a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803611:	00 00 00 
  803614:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803618:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80361c:	be 00 00 00 00       	mov    $0x0,%esi
  803621:	bf 03 00 00 00       	mov    $0x3,%edi
  803626:	48 b8 4b 34 80 00 00 	movabs $0x80344b,%rax
  80362d:	00 00 00 
  803630:	ff d0                	callq  *%rax
  803632:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803635:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803639:	79 08                	jns    803643 <devfile_read+0x60>
  80363b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80363e:	e9 a4 00 00 00       	jmpq   8036e7 <devfile_read+0x104>
  803643:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803646:	48 98                	cltq   
  803648:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80364c:	76 35                	jbe    803683 <devfile_read+0xa0>
  80364e:	48 b9 3e 56 80 00 00 	movabs $0x80563e,%rcx
  803655:	00 00 00 
  803658:	48 ba 45 56 80 00 00 	movabs $0x805645,%rdx
  80365f:	00 00 00 
  803662:	be 89 00 00 00       	mov    $0x89,%esi
  803667:	48 bf 5a 56 80 00 00 	movabs $0x80565a,%rdi
  80366e:	00 00 00 
  803671:	b8 00 00 00 00       	mov    $0x0,%eax
  803676:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80367d:	00 00 00 
  803680:	41 ff d0             	callq  *%r8
  803683:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80368a:	7e 35                	jle    8036c1 <devfile_read+0xde>
  80368c:	48 b9 68 56 80 00 00 	movabs $0x805668,%rcx
  803693:	00 00 00 
  803696:	48 ba 45 56 80 00 00 	movabs $0x805645,%rdx
  80369d:	00 00 00 
  8036a0:	be 8a 00 00 00       	mov    $0x8a,%esi
  8036a5:	48 bf 5a 56 80 00 00 	movabs $0x80565a,%rdi
  8036ac:	00 00 00 
  8036af:	b8 00 00 00 00       	mov    $0x0,%eax
  8036b4:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8036bb:	00 00 00 
  8036be:	41 ff d0             	callq  *%r8
  8036c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036c4:	48 63 d0             	movslq %eax,%rdx
  8036c7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036cb:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8036d2:	00 00 00 
  8036d5:	48 89 c7             	mov    %rax,%rdi
  8036d8:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  8036df:	00 00 00 
  8036e2:	ff d0                	callq  *%rax
  8036e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036e7:	c9                   	leaveq 
  8036e8:	c3                   	retq   

00000000008036e9 <devfile_write>:
  8036e9:	55                   	push   %rbp
  8036ea:	48 89 e5             	mov    %rsp,%rbp
  8036ed:	48 83 ec 40          	sub    $0x40,%rsp
  8036f1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8036f5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8036f9:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8036fd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803701:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803705:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  80370c:	00 
  80370d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803711:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803715:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80371a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80371e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803722:	8b 50 0c             	mov    0xc(%rax),%edx
  803725:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80372c:	00 00 00 
  80372f:	89 10                	mov    %edx,(%rax)
  803731:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803738:	00 00 00 
  80373b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80373f:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803743:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803747:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80374b:	48 89 c6             	mov    %rax,%rsi
  80374e:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803755:	00 00 00 
  803758:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  80375f:	00 00 00 
  803762:	ff d0                	callq  *%rax
  803764:	be 00 00 00 00       	mov    $0x0,%esi
  803769:	bf 04 00 00 00       	mov    $0x4,%edi
  80376e:	48 b8 4b 34 80 00 00 	movabs $0x80344b,%rax
  803775:	00 00 00 
  803778:	ff d0                	callq  *%rax
  80377a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80377d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803781:	79 05                	jns    803788 <devfile_write+0x9f>
  803783:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803786:	eb 43                	jmp    8037cb <devfile_write+0xe2>
  803788:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80378b:	48 98                	cltq   
  80378d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803791:	76 35                	jbe    8037c8 <devfile_write+0xdf>
  803793:	48 b9 3e 56 80 00 00 	movabs $0x80563e,%rcx
  80379a:	00 00 00 
  80379d:	48 ba 45 56 80 00 00 	movabs $0x805645,%rdx
  8037a4:	00 00 00 
  8037a7:	be a8 00 00 00       	mov    $0xa8,%esi
  8037ac:	48 bf 5a 56 80 00 00 	movabs $0x80565a,%rdi
  8037b3:	00 00 00 
  8037b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8037bb:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8037c2:	00 00 00 
  8037c5:	41 ff d0             	callq  *%r8
  8037c8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037cb:	c9                   	leaveq 
  8037cc:	c3                   	retq   

00000000008037cd <devfile_stat>:
  8037cd:	55                   	push   %rbp
  8037ce:	48 89 e5             	mov    %rsp,%rbp
  8037d1:	48 83 ec 20          	sub    $0x20,%rsp
  8037d5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8037d9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037e1:	8b 50 0c             	mov    0xc(%rax),%edx
  8037e4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037eb:	00 00 00 
  8037ee:	89 10                	mov    %edx,(%rax)
  8037f0:	be 00 00 00 00       	mov    $0x0,%esi
  8037f5:	bf 05 00 00 00       	mov    $0x5,%edi
  8037fa:	48 b8 4b 34 80 00 00 	movabs $0x80344b,%rax
  803801:	00 00 00 
  803804:	ff d0                	callq  *%rax
  803806:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803809:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80380d:	79 05                	jns    803814 <devfile_stat+0x47>
  80380f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803812:	eb 56                	jmp    80386a <devfile_stat+0x9d>
  803814:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803818:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80381f:	00 00 00 
  803822:	48 89 c7             	mov    %rax,%rdi
  803825:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  80382c:	00 00 00 
  80382f:	ff d0                	callq  *%rax
  803831:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803838:	00 00 00 
  80383b:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803841:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803845:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80384b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803852:	00 00 00 
  803855:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80385b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80385f:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803865:	b8 00 00 00 00       	mov    $0x0,%eax
  80386a:	c9                   	leaveq 
  80386b:	c3                   	retq   

000000000080386c <devfile_trunc>:
  80386c:	55                   	push   %rbp
  80386d:	48 89 e5             	mov    %rsp,%rbp
  803870:	48 83 ec 10          	sub    $0x10,%rsp
  803874:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803878:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80387b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80387f:	8b 50 0c             	mov    0xc(%rax),%edx
  803882:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803889:	00 00 00 
  80388c:	89 10                	mov    %edx,(%rax)
  80388e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803895:	00 00 00 
  803898:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80389b:	89 50 04             	mov    %edx,0x4(%rax)
  80389e:	be 00 00 00 00       	mov    $0x0,%esi
  8038a3:	bf 02 00 00 00       	mov    $0x2,%edi
  8038a8:	48 b8 4b 34 80 00 00 	movabs $0x80344b,%rax
  8038af:	00 00 00 
  8038b2:	ff d0                	callq  *%rax
  8038b4:	c9                   	leaveq 
  8038b5:	c3                   	retq   

00000000008038b6 <remove>:
  8038b6:	55                   	push   %rbp
  8038b7:	48 89 e5             	mov    %rsp,%rbp
  8038ba:	48 83 ec 10          	sub    $0x10,%rsp
  8038be:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038c6:	48 89 c7             	mov    %rax,%rdi
  8038c9:	48 b8 a2 1a 80 00 00 	movabs $0x801aa2,%rax
  8038d0:	00 00 00 
  8038d3:	ff d0                	callq  *%rax
  8038d5:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8038da:	7e 07                	jle    8038e3 <remove+0x2d>
  8038dc:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8038e1:	eb 33                	jmp    803916 <remove+0x60>
  8038e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038e7:	48 89 c6             	mov    %rax,%rsi
  8038ea:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8038f1:	00 00 00 
  8038f4:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  8038fb:	00 00 00 
  8038fe:	ff d0                	callq  *%rax
  803900:	be 00 00 00 00       	mov    $0x0,%esi
  803905:	bf 07 00 00 00       	mov    $0x7,%edi
  80390a:	48 b8 4b 34 80 00 00 	movabs $0x80344b,%rax
  803911:	00 00 00 
  803914:	ff d0                	callq  *%rax
  803916:	c9                   	leaveq 
  803917:	c3                   	retq   

0000000000803918 <sync>:
  803918:	55                   	push   %rbp
  803919:	48 89 e5             	mov    %rsp,%rbp
  80391c:	be 00 00 00 00       	mov    $0x0,%esi
  803921:	bf 08 00 00 00       	mov    $0x8,%edi
  803926:	48 b8 4b 34 80 00 00 	movabs $0x80344b,%rax
  80392d:	00 00 00 
  803930:	ff d0                	callq  *%rax
  803932:	5d                   	pop    %rbp
  803933:	c3                   	retq   

0000000000803934 <copy>:
  803934:	55                   	push   %rbp
  803935:	48 89 e5             	mov    %rsp,%rbp
  803938:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80393f:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803946:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80394d:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803954:	be 00 00 00 00       	mov    $0x0,%esi
  803959:	48 89 c7             	mov    %rax,%rdi
  80395c:	48 b8 d2 34 80 00 00 	movabs $0x8034d2,%rax
  803963:	00 00 00 
  803966:	ff d0                	callq  *%rax
  803968:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80396b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80396f:	79 28                	jns    803999 <copy+0x65>
  803971:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803974:	89 c6                	mov    %eax,%esi
  803976:	48 bf 74 56 80 00 00 	movabs $0x805674,%rdi
  80397d:	00 00 00 
  803980:	b8 00 00 00 00       	mov    $0x0,%eax
  803985:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  80398c:	00 00 00 
  80398f:	ff d2                	callq  *%rdx
  803991:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803994:	e9 74 01 00 00       	jmpq   803b0d <copy+0x1d9>
  803999:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8039a0:	be 01 01 00 00       	mov    $0x101,%esi
  8039a5:	48 89 c7             	mov    %rax,%rdi
  8039a8:	48 b8 d2 34 80 00 00 	movabs $0x8034d2,%rax
  8039af:	00 00 00 
  8039b2:	ff d0                	callq  *%rax
  8039b4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8039b7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8039bb:	79 39                	jns    8039f6 <copy+0xc2>
  8039bd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039c0:	89 c6                	mov    %eax,%esi
  8039c2:	48 bf 8a 56 80 00 00 	movabs $0x80568a,%rdi
  8039c9:	00 00 00 
  8039cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8039d1:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  8039d8:	00 00 00 
  8039db:	ff d2                	callq  *%rdx
  8039dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039e0:	89 c7                	mov    %eax,%edi
  8039e2:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  8039e9:	00 00 00 
  8039ec:	ff d0                	callq  *%rax
  8039ee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039f1:	e9 17 01 00 00       	jmpq   803b0d <copy+0x1d9>
  8039f6:	eb 74                	jmp    803a6c <copy+0x138>
  8039f8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8039fb:	48 63 d0             	movslq %eax,%rdx
  8039fe:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803a05:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a08:	48 89 ce             	mov    %rcx,%rsi
  803a0b:	89 c7                	mov    %eax,%edi
  803a0d:	48 b8 46 31 80 00 00 	movabs $0x803146,%rax
  803a14:	00 00 00 
  803a17:	ff d0                	callq  *%rax
  803a19:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803a1c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803a20:	79 4a                	jns    803a6c <copy+0x138>
  803a22:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803a25:	89 c6                	mov    %eax,%esi
  803a27:	48 bf a4 56 80 00 00 	movabs $0x8056a4,%rdi
  803a2e:	00 00 00 
  803a31:	b8 00 00 00 00       	mov    $0x0,%eax
  803a36:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  803a3d:	00 00 00 
  803a40:	ff d2                	callq  *%rdx
  803a42:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a45:	89 c7                	mov    %eax,%edi
  803a47:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  803a4e:	00 00 00 
  803a51:	ff d0                	callq  *%rax
  803a53:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a56:	89 c7                	mov    %eax,%edi
  803a58:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  803a5f:	00 00 00 
  803a62:	ff d0                	callq  *%rax
  803a64:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803a67:	e9 a1 00 00 00       	jmpq   803b0d <copy+0x1d9>
  803a6c:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803a73:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a76:	ba 00 02 00 00       	mov    $0x200,%edx
  803a7b:	48 89 ce             	mov    %rcx,%rsi
  803a7e:	89 c7                	mov    %eax,%edi
  803a80:	48 b8 fc 2f 80 00 00 	movabs $0x802ffc,%rax
  803a87:	00 00 00 
  803a8a:	ff d0                	callq  *%rax
  803a8c:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803a8f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803a93:	0f 8f 5f ff ff ff    	jg     8039f8 <copy+0xc4>
  803a99:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803a9d:	79 47                	jns    803ae6 <copy+0x1b2>
  803a9f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803aa2:	89 c6                	mov    %eax,%esi
  803aa4:	48 bf b7 56 80 00 00 	movabs $0x8056b7,%rdi
  803aab:	00 00 00 
  803aae:	b8 00 00 00 00       	mov    $0x0,%eax
  803ab3:	48 ba 59 0f 80 00 00 	movabs $0x800f59,%rdx
  803aba:	00 00 00 
  803abd:	ff d2                	callq  *%rdx
  803abf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac2:	89 c7                	mov    %eax,%edi
  803ac4:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  803acb:	00 00 00 
  803ace:	ff d0                	callq  *%rax
  803ad0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ad3:	89 c7                	mov    %eax,%edi
  803ad5:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  803adc:	00 00 00 
  803adf:	ff d0                	callq  *%rax
  803ae1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803ae4:	eb 27                	jmp    803b0d <copy+0x1d9>
  803ae6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ae9:	89 c7                	mov    %eax,%edi
  803aeb:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  803af2:	00 00 00 
  803af5:	ff d0                	callq  *%rax
  803af7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803afa:	89 c7                	mov    %eax,%edi
  803afc:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  803b03:	00 00 00 
  803b06:	ff d0                	callq  *%rax
  803b08:	b8 00 00 00 00       	mov    $0x0,%eax
  803b0d:	c9                   	leaveq 
  803b0e:	c3                   	retq   

0000000000803b0f <fd2sockid>:
  803b0f:	55                   	push   %rbp
  803b10:	48 89 e5             	mov    %rsp,%rbp
  803b13:	48 83 ec 20          	sub    $0x20,%rsp
  803b17:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b1a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803b1e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b21:	48 89 d6             	mov    %rdx,%rsi
  803b24:	89 c7                	mov    %eax,%edi
  803b26:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  803b2d:	00 00 00 
  803b30:	ff d0                	callq  *%rax
  803b32:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b35:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b39:	79 05                	jns    803b40 <fd2sockid+0x31>
  803b3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b3e:	eb 24                	jmp    803b64 <fd2sockid+0x55>
  803b40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b44:	8b 10                	mov    (%rax),%edx
  803b46:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803b4d:	00 00 00 
  803b50:	8b 00                	mov    (%rax),%eax
  803b52:	39 c2                	cmp    %eax,%edx
  803b54:	74 07                	je     803b5d <fd2sockid+0x4e>
  803b56:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803b5b:	eb 07                	jmp    803b64 <fd2sockid+0x55>
  803b5d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b61:	8b 40 0c             	mov    0xc(%rax),%eax
  803b64:	c9                   	leaveq 
  803b65:	c3                   	retq   

0000000000803b66 <alloc_sockfd>:
  803b66:	55                   	push   %rbp
  803b67:	48 89 e5             	mov    %rsp,%rbp
  803b6a:	48 83 ec 20          	sub    $0x20,%rsp
  803b6e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b71:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803b75:	48 89 c7             	mov    %rax,%rdi
  803b78:	48 b8 32 2b 80 00 00 	movabs $0x802b32,%rax
  803b7f:	00 00 00 
  803b82:	ff d0                	callq  *%rax
  803b84:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b87:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b8b:	78 26                	js     803bb3 <alloc_sockfd+0x4d>
  803b8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b91:	ba 07 04 00 00       	mov    $0x407,%edx
  803b96:	48 89 c6             	mov    %rax,%rsi
  803b99:	bf 00 00 00 00       	mov    $0x0,%edi
  803b9e:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  803ba5:	00 00 00 
  803ba8:	ff d0                	callq  *%rax
  803baa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bb1:	79 16                	jns    803bc9 <alloc_sockfd+0x63>
  803bb3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bb6:	89 c7                	mov    %eax,%edi
  803bb8:	48 b8 73 40 80 00 00 	movabs $0x804073,%rax
  803bbf:	00 00 00 
  803bc2:	ff d0                	callq  *%rax
  803bc4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bc7:	eb 3a                	jmp    803c03 <alloc_sockfd+0x9d>
  803bc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bcd:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803bd4:	00 00 00 
  803bd7:	8b 12                	mov    (%rdx),%edx
  803bd9:	89 10                	mov    %edx,(%rax)
  803bdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bdf:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803be6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bea:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803bed:	89 50 0c             	mov    %edx,0xc(%rax)
  803bf0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bf4:	48 89 c7             	mov    %rax,%rdi
  803bf7:	48 b8 e4 2a 80 00 00 	movabs $0x802ae4,%rax
  803bfe:	00 00 00 
  803c01:	ff d0                	callq  *%rax
  803c03:	c9                   	leaveq 
  803c04:	c3                   	retq   

0000000000803c05 <accept>:
  803c05:	55                   	push   %rbp
  803c06:	48 89 e5             	mov    %rsp,%rbp
  803c09:	48 83 ec 30          	sub    $0x30,%rsp
  803c0d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c10:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c14:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803c18:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c1b:	89 c7                	mov    %eax,%edi
  803c1d:	48 b8 0f 3b 80 00 00 	movabs $0x803b0f,%rax
  803c24:	00 00 00 
  803c27:	ff d0                	callq  *%rax
  803c29:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c2c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c30:	79 05                	jns    803c37 <accept+0x32>
  803c32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c35:	eb 3b                	jmp    803c72 <accept+0x6d>
  803c37:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803c3b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803c3f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c42:	48 89 ce             	mov    %rcx,%rsi
  803c45:	89 c7                	mov    %eax,%edi
  803c47:	48 b8 50 3f 80 00 00 	movabs $0x803f50,%rax
  803c4e:	00 00 00 
  803c51:	ff d0                	callq  *%rax
  803c53:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c56:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c5a:	79 05                	jns    803c61 <accept+0x5c>
  803c5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c5f:	eb 11                	jmp    803c72 <accept+0x6d>
  803c61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c64:	89 c7                	mov    %eax,%edi
  803c66:	48 b8 66 3b 80 00 00 	movabs $0x803b66,%rax
  803c6d:	00 00 00 
  803c70:	ff d0                	callq  *%rax
  803c72:	c9                   	leaveq 
  803c73:	c3                   	retq   

0000000000803c74 <bind>:
  803c74:	55                   	push   %rbp
  803c75:	48 89 e5             	mov    %rsp,%rbp
  803c78:	48 83 ec 20          	sub    $0x20,%rsp
  803c7c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c7f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c83:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c86:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c89:	89 c7                	mov    %eax,%edi
  803c8b:	48 b8 0f 3b 80 00 00 	movabs $0x803b0f,%rax
  803c92:	00 00 00 
  803c95:	ff d0                	callq  *%rax
  803c97:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c9a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c9e:	79 05                	jns    803ca5 <bind+0x31>
  803ca0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ca3:	eb 1b                	jmp    803cc0 <bind+0x4c>
  803ca5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803ca8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803cac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803caf:	48 89 ce             	mov    %rcx,%rsi
  803cb2:	89 c7                	mov    %eax,%edi
  803cb4:	48 b8 cf 3f 80 00 00 	movabs $0x803fcf,%rax
  803cbb:	00 00 00 
  803cbe:	ff d0                	callq  *%rax
  803cc0:	c9                   	leaveq 
  803cc1:	c3                   	retq   

0000000000803cc2 <shutdown>:
  803cc2:	55                   	push   %rbp
  803cc3:	48 89 e5             	mov    %rsp,%rbp
  803cc6:	48 83 ec 20          	sub    $0x20,%rsp
  803cca:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ccd:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803cd0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cd3:	89 c7                	mov    %eax,%edi
  803cd5:	48 b8 0f 3b 80 00 00 	movabs $0x803b0f,%rax
  803cdc:	00 00 00 
  803cdf:	ff d0                	callq  *%rax
  803ce1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ce4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ce8:	79 05                	jns    803cef <shutdown+0x2d>
  803cea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ced:	eb 16                	jmp    803d05 <shutdown+0x43>
  803cef:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803cf2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cf5:	89 d6                	mov    %edx,%esi
  803cf7:	89 c7                	mov    %eax,%edi
  803cf9:	48 b8 33 40 80 00 00 	movabs $0x804033,%rax
  803d00:	00 00 00 
  803d03:	ff d0                	callq  *%rax
  803d05:	c9                   	leaveq 
  803d06:	c3                   	retq   

0000000000803d07 <devsock_close>:
  803d07:	55                   	push   %rbp
  803d08:	48 89 e5             	mov    %rsp,%rbp
  803d0b:	48 83 ec 10          	sub    $0x10,%rsp
  803d0f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d17:	48 89 c7             	mov    %rax,%rdi
  803d1a:	48 b8 97 4b 80 00 00 	movabs $0x804b97,%rax
  803d21:	00 00 00 
  803d24:	ff d0                	callq  *%rax
  803d26:	83 f8 01             	cmp    $0x1,%eax
  803d29:	75 17                	jne    803d42 <devsock_close+0x3b>
  803d2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d2f:	8b 40 0c             	mov    0xc(%rax),%eax
  803d32:	89 c7                	mov    %eax,%edi
  803d34:	48 b8 73 40 80 00 00 	movabs $0x804073,%rax
  803d3b:	00 00 00 
  803d3e:	ff d0                	callq  *%rax
  803d40:	eb 05                	jmp    803d47 <devsock_close+0x40>
  803d42:	b8 00 00 00 00       	mov    $0x0,%eax
  803d47:	c9                   	leaveq 
  803d48:	c3                   	retq   

0000000000803d49 <connect>:
  803d49:	55                   	push   %rbp
  803d4a:	48 89 e5             	mov    %rsp,%rbp
  803d4d:	48 83 ec 20          	sub    $0x20,%rsp
  803d51:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d54:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d58:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803d5b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d5e:	89 c7                	mov    %eax,%edi
  803d60:	48 b8 0f 3b 80 00 00 	movabs $0x803b0f,%rax
  803d67:	00 00 00 
  803d6a:	ff d0                	callq  *%rax
  803d6c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d6f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d73:	79 05                	jns    803d7a <connect+0x31>
  803d75:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d78:	eb 1b                	jmp    803d95 <connect+0x4c>
  803d7a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d7d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803d81:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d84:	48 89 ce             	mov    %rcx,%rsi
  803d87:	89 c7                	mov    %eax,%edi
  803d89:	48 b8 a0 40 80 00 00 	movabs $0x8040a0,%rax
  803d90:	00 00 00 
  803d93:	ff d0                	callq  *%rax
  803d95:	c9                   	leaveq 
  803d96:	c3                   	retq   

0000000000803d97 <listen>:
  803d97:	55                   	push   %rbp
  803d98:	48 89 e5             	mov    %rsp,%rbp
  803d9b:	48 83 ec 20          	sub    $0x20,%rsp
  803d9f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803da2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803da5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803da8:	89 c7                	mov    %eax,%edi
  803daa:	48 b8 0f 3b 80 00 00 	movabs $0x803b0f,%rax
  803db1:	00 00 00 
  803db4:	ff d0                	callq  *%rax
  803db6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803db9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803dbd:	79 05                	jns    803dc4 <listen+0x2d>
  803dbf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dc2:	eb 16                	jmp    803dda <listen+0x43>
  803dc4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803dc7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dca:	89 d6                	mov    %edx,%esi
  803dcc:	89 c7                	mov    %eax,%edi
  803dce:	48 b8 04 41 80 00 00 	movabs $0x804104,%rax
  803dd5:	00 00 00 
  803dd8:	ff d0                	callq  *%rax
  803dda:	c9                   	leaveq 
  803ddb:	c3                   	retq   

0000000000803ddc <devsock_read>:
  803ddc:	55                   	push   %rbp
  803ddd:	48 89 e5             	mov    %rsp,%rbp
  803de0:	48 83 ec 20          	sub    $0x20,%rsp
  803de4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803de8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dec:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803df0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803df4:	89 c2                	mov    %eax,%edx
  803df6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dfa:	8b 40 0c             	mov    0xc(%rax),%eax
  803dfd:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803e01:	b9 00 00 00 00       	mov    $0x0,%ecx
  803e06:	89 c7                	mov    %eax,%edi
  803e08:	48 b8 44 41 80 00 00 	movabs $0x804144,%rax
  803e0f:	00 00 00 
  803e12:	ff d0                	callq  *%rax
  803e14:	c9                   	leaveq 
  803e15:	c3                   	retq   

0000000000803e16 <devsock_write>:
  803e16:	55                   	push   %rbp
  803e17:	48 89 e5             	mov    %rsp,%rbp
  803e1a:	48 83 ec 20          	sub    $0x20,%rsp
  803e1e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e22:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e26:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803e2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e2e:	89 c2                	mov    %eax,%edx
  803e30:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e34:	8b 40 0c             	mov    0xc(%rax),%eax
  803e37:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803e3b:	b9 00 00 00 00       	mov    $0x0,%ecx
  803e40:	89 c7                	mov    %eax,%edi
  803e42:	48 b8 10 42 80 00 00 	movabs $0x804210,%rax
  803e49:	00 00 00 
  803e4c:	ff d0                	callq  *%rax
  803e4e:	c9                   	leaveq 
  803e4f:	c3                   	retq   

0000000000803e50 <devsock_stat>:
  803e50:	55                   	push   %rbp
  803e51:	48 89 e5             	mov    %rsp,%rbp
  803e54:	48 83 ec 10          	sub    $0x10,%rsp
  803e58:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e5c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e64:	48 be d2 56 80 00 00 	movabs $0x8056d2,%rsi
  803e6b:	00 00 00 
  803e6e:	48 89 c7             	mov    %rax,%rdi
  803e71:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  803e78:	00 00 00 
  803e7b:	ff d0                	callq  *%rax
  803e7d:	b8 00 00 00 00       	mov    $0x0,%eax
  803e82:	c9                   	leaveq 
  803e83:	c3                   	retq   

0000000000803e84 <socket>:
  803e84:	55                   	push   %rbp
  803e85:	48 89 e5             	mov    %rsp,%rbp
  803e88:	48 83 ec 20          	sub    $0x20,%rsp
  803e8c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e8f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803e92:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803e95:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803e98:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803e9b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e9e:	89 ce                	mov    %ecx,%esi
  803ea0:	89 c7                	mov    %eax,%edi
  803ea2:	48 b8 c8 42 80 00 00 	movabs $0x8042c8,%rax
  803ea9:	00 00 00 
  803eac:	ff d0                	callq  *%rax
  803eae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803eb1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803eb5:	79 05                	jns    803ebc <socket+0x38>
  803eb7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eba:	eb 11                	jmp    803ecd <socket+0x49>
  803ebc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ebf:	89 c7                	mov    %eax,%edi
  803ec1:	48 b8 66 3b 80 00 00 	movabs $0x803b66,%rax
  803ec8:	00 00 00 
  803ecb:	ff d0                	callq  *%rax
  803ecd:	c9                   	leaveq 
  803ece:	c3                   	retq   

0000000000803ecf <nsipc>:
  803ecf:	55                   	push   %rbp
  803ed0:	48 89 e5             	mov    %rsp,%rbp
  803ed3:	48 83 ec 10          	sub    $0x10,%rsp
  803ed7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803eda:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803ee1:	00 00 00 
  803ee4:	8b 00                	mov    (%rax),%eax
  803ee6:	85 c0                	test   %eax,%eax
  803ee8:	75 1d                	jne    803f07 <nsipc+0x38>
  803eea:	bf 02 00 00 00       	mov    $0x2,%edi
  803eef:	48 b8 72 2a 80 00 00 	movabs $0x802a72,%rax
  803ef6:	00 00 00 
  803ef9:	ff d0                	callq  *%rax
  803efb:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803f02:	00 00 00 
  803f05:	89 02                	mov    %eax,(%rdx)
  803f07:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803f0e:	00 00 00 
  803f11:	8b 00                	mov    (%rax),%eax
  803f13:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803f16:	b9 07 00 00 00       	mov    $0x7,%ecx
  803f1b:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803f22:	00 00 00 
  803f25:	89 c7                	mov    %eax,%edi
  803f27:	48 b8 dc 29 80 00 00 	movabs $0x8029dc,%rax
  803f2e:	00 00 00 
  803f31:	ff d0                	callq  *%rax
  803f33:	ba 00 00 00 00       	mov    $0x0,%edx
  803f38:	be 00 00 00 00       	mov    $0x0,%esi
  803f3d:	bf 00 00 00 00       	mov    $0x0,%edi
  803f42:	48 b8 1b 29 80 00 00 	movabs $0x80291b,%rax
  803f49:	00 00 00 
  803f4c:	ff d0                	callq  *%rax
  803f4e:	c9                   	leaveq 
  803f4f:	c3                   	retq   

0000000000803f50 <nsipc_accept>:
  803f50:	55                   	push   %rbp
  803f51:	48 89 e5             	mov    %rsp,%rbp
  803f54:	48 83 ec 30          	sub    $0x30,%rsp
  803f58:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f5b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f5f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f63:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f6a:	00 00 00 
  803f6d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803f70:	89 10                	mov    %edx,(%rax)
  803f72:	bf 01 00 00 00       	mov    $0x1,%edi
  803f77:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  803f7e:	00 00 00 
  803f81:	ff d0                	callq  *%rax
  803f83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f8a:	78 3e                	js     803fca <nsipc_accept+0x7a>
  803f8c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f93:	00 00 00 
  803f96:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803f9a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f9e:	8b 40 10             	mov    0x10(%rax),%eax
  803fa1:	89 c2                	mov    %eax,%edx
  803fa3:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803fa7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fab:	48 89 ce             	mov    %rcx,%rsi
  803fae:	48 89 c7             	mov    %rax,%rdi
  803fb1:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  803fb8:	00 00 00 
  803fbb:	ff d0                	callq  *%rax
  803fbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fc1:	8b 50 10             	mov    0x10(%rax),%edx
  803fc4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fc8:	89 10                	mov    %edx,(%rax)
  803fca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fcd:	c9                   	leaveq 
  803fce:	c3                   	retq   

0000000000803fcf <nsipc_bind>:
  803fcf:	55                   	push   %rbp
  803fd0:	48 89 e5             	mov    %rsp,%rbp
  803fd3:	48 83 ec 10          	sub    $0x10,%rsp
  803fd7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fda:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803fde:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803fe1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fe8:	00 00 00 
  803feb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fee:	89 10                	mov    %edx,(%rax)
  803ff0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ff3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ff7:	48 89 c6             	mov    %rax,%rsi
  803ffa:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  804001:	00 00 00 
  804004:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  80400b:	00 00 00 
  80400e:	ff d0                	callq  *%rax
  804010:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804017:	00 00 00 
  80401a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80401d:	89 50 14             	mov    %edx,0x14(%rax)
  804020:	bf 02 00 00 00       	mov    $0x2,%edi
  804025:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  80402c:	00 00 00 
  80402f:	ff d0                	callq  *%rax
  804031:	c9                   	leaveq 
  804032:	c3                   	retq   

0000000000804033 <nsipc_shutdown>:
  804033:	55                   	push   %rbp
  804034:	48 89 e5             	mov    %rsp,%rbp
  804037:	48 83 ec 10          	sub    $0x10,%rsp
  80403b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80403e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804041:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804048:	00 00 00 
  80404b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80404e:	89 10                	mov    %edx,(%rax)
  804050:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804057:	00 00 00 
  80405a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80405d:	89 50 04             	mov    %edx,0x4(%rax)
  804060:	bf 03 00 00 00       	mov    $0x3,%edi
  804065:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  80406c:	00 00 00 
  80406f:	ff d0                	callq  *%rax
  804071:	c9                   	leaveq 
  804072:	c3                   	retq   

0000000000804073 <nsipc_close>:
  804073:	55                   	push   %rbp
  804074:	48 89 e5             	mov    %rsp,%rbp
  804077:	48 83 ec 10          	sub    $0x10,%rsp
  80407b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80407e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804085:	00 00 00 
  804088:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80408b:	89 10                	mov    %edx,(%rax)
  80408d:	bf 04 00 00 00       	mov    $0x4,%edi
  804092:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  804099:	00 00 00 
  80409c:	ff d0                	callq  *%rax
  80409e:	c9                   	leaveq 
  80409f:	c3                   	retq   

00000000008040a0 <nsipc_connect>:
  8040a0:	55                   	push   %rbp
  8040a1:	48 89 e5             	mov    %rsp,%rbp
  8040a4:	48 83 ec 10          	sub    $0x10,%rsp
  8040a8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8040ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8040af:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8040b2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040b9:	00 00 00 
  8040bc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8040bf:	89 10                	mov    %edx,(%rax)
  8040c1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8040c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040c8:	48 89 c6             	mov    %rax,%rsi
  8040cb:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8040d2:	00 00 00 
  8040d5:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  8040dc:	00 00 00 
  8040df:	ff d0                	callq  *%rax
  8040e1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040e8:	00 00 00 
  8040eb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8040ee:	89 50 14             	mov    %edx,0x14(%rax)
  8040f1:	bf 05 00 00 00       	mov    $0x5,%edi
  8040f6:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  8040fd:	00 00 00 
  804100:	ff d0                	callq  *%rax
  804102:	c9                   	leaveq 
  804103:	c3                   	retq   

0000000000804104 <nsipc_listen>:
  804104:	55                   	push   %rbp
  804105:	48 89 e5             	mov    %rsp,%rbp
  804108:	48 83 ec 10          	sub    $0x10,%rsp
  80410c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80410f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804112:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804119:	00 00 00 
  80411c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80411f:	89 10                	mov    %edx,(%rax)
  804121:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804128:	00 00 00 
  80412b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80412e:	89 50 04             	mov    %edx,0x4(%rax)
  804131:	bf 06 00 00 00       	mov    $0x6,%edi
  804136:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  80413d:	00 00 00 
  804140:	ff d0                	callq  *%rax
  804142:	c9                   	leaveq 
  804143:	c3                   	retq   

0000000000804144 <nsipc_recv>:
  804144:	55                   	push   %rbp
  804145:	48 89 e5             	mov    %rsp,%rbp
  804148:	48 83 ec 30          	sub    $0x30,%rsp
  80414c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80414f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804153:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804156:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804159:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804160:	00 00 00 
  804163:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804166:	89 10                	mov    %edx,(%rax)
  804168:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80416f:	00 00 00 
  804172:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804175:	89 50 04             	mov    %edx,0x4(%rax)
  804178:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80417f:	00 00 00 
  804182:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804185:	89 50 08             	mov    %edx,0x8(%rax)
  804188:	bf 07 00 00 00       	mov    $0x7,%edi
  80418d:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  804194:	00 00 00 
  804197:	ff d0                	callq  *%rax
  804199:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80419c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041a0:	78 69                	js     80420b <nsipc_recv+0xc7>
  8041a2:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8041a9:	7f 08                	jg     8041b3 <nsipc_recv+0x6f>
  8041ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041ae:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8041b1:	7e 35                	jle    8041e8 <nsipc_recv+0xa4>
  8041b3:	48 b9 d9 56 80 00 00 	movabs $0x8056d9,%rcx
  8041ba:	00 00 00 
  8041bd:	48 ba ee 56 80 00 00 	movabs $0x8056ee,%rdx
  8041c4:	00 00 00 
  8041c7:	be 62 00 00 00       	mov    $0x62,%esi
  8041cc:	48 bf 03 57 80 00 00 	movabs $0x805703,%rdi
  8041d3:	00 00 00 
  8041d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8041db:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  8041e2:	00 00 00 
  8041e5:	41 ff d0             	callq  *%r8
  8041e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041eb:	48 63 d0             	movslq %eax,%rdx
  8041ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041f2:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8041f9:	00 00 00 
  8041fc:	48 89 c7             	mov    %rax,%rdi
  8041ff:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804206:	00 00 00 
  804209:	ff d0                	callq  *%rax
  80420b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80420e:	c9                   	leaveq 
  80420f:	c3                   	retq   

0000000000804210 <nsipc_send>:
  804210:	55                   	push   %rbp
  804211:	48 89 e5             	mov    %rsp,%rbp
  804214:	48 83 ec 20          	sub    $0x20,%rsp
  804218:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80421b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80421f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804222:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804225:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80422c:	00 00 00 
  80422f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804232:	89 10                	mov    %edx,(%rax)
  804234:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80423b:	7e 35                	jle    804272 <nsipc_send+0x62>
  80423d:	48 b9 12 57 80 00 00 	movabs $0x805712,%rcx
  804244:	00 00 00 
  804247:	48 ba ee 56 80 00 00 	movabs $0x8056ee,%rdx
  80424e:	00 00 00 
  804251:	be 6d 00 00 00       	mov    $0x6d,%esi
  804256:	48 bf 03 57 80 00 00 	movabs $0x805703,%rdi
  80425d:	00 00 00 
  804260:	b8 00 00 00 00       	mov    $0x0,%eax
  804265:	49 b8 20 0d 80 00 00 	movabs $0x800d20,%r8
  80426c:	00 00 00 
  80426f:	41 ff d0             	callq  *%r8
  804272:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804275:	48 63 d0             	movslq %eax,%rdx
  804278:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80427c:	48 89 c6             	mov    %rax,%rsi
  80427f:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  804286:	00 00 00 
  804289:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804290:	00 00 00 
  804293:	ff d0                	callq  *%rax
  804295:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80429c:	00 00 00 
  80429f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8042a2:	89 50 04             	mov    %edx,0x4(%rax)
  8042a5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042ac:	00 00 00 
  8042af:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8042b2:	89 50 08             	mov    %edx,0x8(%rax)
  8042b5:	bf 08 00 00 00       	mov    $0x8,%edi
  8042ba:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  8042c1:	00 00 00 
  8042c4:	ff d0                	callq  *%rax
  8042c6:	c9                   	leaveq 
  8042c7:	c3                   	retq   

00000000008042c8 <nsipc_socket>:
  8042c8:	55                   	push   %rbp
  8042c9:	48 89 e5             	mov    %rsp,%rbp
  8042cc:	48 83 ec 10          	sub    $0x10,%rsp
  8042d0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8042d3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8042d6:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8042d9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042e0:	00 00 00 
  8042e3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8042e6:	89 10                	mov    %edx,(%rax)
  8042e8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042ef:	00 00 00 
  8042f2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8042f5:	89 50 04             	mov    %edx,0x4(%rax)
  8042f8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042ff:	00 00 00 
  804302:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804305:	89 50 08             	mov    %edx,0x8(%rax)
  804308:	bf 09 00 00 00       	mov    $0x9,%edi
  80430d:	48 b8 cf 3e 80 00 00 	movabs $0x803ecf,%rax
  804314:	00 00 00 
  804317:	ff d0                	callq  *%rax
  804319:	c9                   	leaveq 
  80431a:	c3                   	retq   

000000000080431b <pipe>:
  80431b:	55                   	push   %rbp
  80431c:	48 89 e5             	mov    %rsp,%rbp
  80431f:	53                   	push   %rbx
  804320:	48 83 ec 38          	sub    $0x38,%rsp
  804324:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804328:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80432c:	48 89 c7             	mov    %rax,%rdi
  80432f:	48 b8 32 2b 80 00 00 	movabs $0x802b32,%rax
  804336:	00 00 00 
  804339:	ff d0                	callq  *%rax
  80433b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80433e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804342:	0f 88 bf 01 00 00    	js     804507 <pipe+0x1ec>
  804348:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80434c:	ba 07 04 00 00       	mov    $0x407,%edx
  804351:	48 89 c6             	mov    %rax,%rsi
  804354:	bf 00 00 00 00       	mov    $0x0,%edi
  804359:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  804360:	00 00 00 
  804363:	ff d0                	callq  *%rax
  804365:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804368:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80436c:	0f 88 95 01 00 00    	js     804507 <pipe+0x1ec>
  804372:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804376:	48 89 c7             	mov    %rax,%rdi
  804379:	48 b8 32 2b 80 00 00 	movabs $0x802b32,%rax
  804380:	00 00 00 
  804383:	ff d0                	callq  *%rax
  804385:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804388:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80438c:	0f 88 5d 01 00 00    	js     8044ef <pipe+0x1d4>
  804392:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804396:	ba 07 04 00 00       	mov    $0x407,%edx
  80439b:	48 89 c6             	mov    %rax,%rsi
  80439e:	bf 00 00 00 00       	mov    $0x0,%edi
  8043a3:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  8043aa:	00 00 00 
  8043ad:	ff d0                	callq  *%rax
  8043af:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8043b2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8043b6:	0f 88 33 01 00 00    	js     8044ef <pipe+0x1d4>
  8043bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043c0:	48 89 c7             	mov    %rax,%rdi
  8043c3:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  8043ca:	00 00 00 
  8043cd:	ff d0                	callq  *%rax
  8043cf:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8043d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043d7:	ba 07 04 00 00       	mov    $0x407,%edx
  8043dc:	48 89 c6             	mov    %rax,%rsi
  8043df:	bf 00 00 00 00       	mov    $0x0,%edi
  8043e4:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  8043eb:	00 00 00 
  8043ee:	ff d0                	callq  *%rax
  8043f0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8043f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8043f7:	79 05                	jns    8043fe <pipe+0xe3>
  8043f9:	e9 d9 00 00 00       	jmpq   8044d7 <pipe+0x1bc>
  8043fe:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804402:	48 89 c7             	mov    %rax,%rdi
  804405:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  80440c:	00 00 00 
  80440f:	ff d0                	callq  *%rax
  804411:	48 89 c2             	mov    %rax,%rdx
  804414:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804418:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80441e:	48 89 d1             	mov    %rdx,%rcx
  804421:	ba 00 00 00 00       	mov    $0x0,%edx
  804426:	48 89 c6             	mov    %rax,%rsi
  804429:	bf 00 00 00 00       	mov    $0x0,%edi
  80442e:	48 b8 8d 24 80 00 00 	movabs $0x80248d,%rax
  804435:	00 00 00 
  804438:	ff d0                	callq  *%rax
  80443a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80443d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804441:	79 1b                	jns    80445e <pipe+0x143>
  804443:	90                   	nop
  804444:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804448:	48 89 c6             	mov    %rax,%rsi
  80444b:	bf 00 00 00 00       	mov    $0x0,%edi
  804450:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  804457:	00 00 00 
  80445a:	ff d0                	callq  *%rax
  80445c:	eb 79                	jmp    8044d7 <pipe+0x1bc>
  80445e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804462:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804469:	00 00 00 
  80446c:	8b 12                	mov    (%rdx),%edx
  80446e:	89 10                	mov    %edx,(%rax)
  804470:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804474:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80447b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80447f:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804486:	00 00 00 
  804489:	8b 12                	mov    (%rdx),%edx
  80448b:	89 10                	mov    %edx,(%rax)
  80448d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804491:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804498:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80449c:	48 89 c7             	mov    %rax,%rdi
  80449f:	48 b8 e4 2a 80 00 00 	movabs $0x802ae4,%rax
  8044a6:	00 00 00 
  8044a9:	ff d0                	callq  *%rax
  8044ab:	89 c2                	mov    %eax,%edx
  8044ad:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8044b1:	89 10                	mov    %edx,(%rax)
  8044b3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8044b7:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8044bb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044bf:	48 89 c7             	mov    %rax,%rdi
  8044c2:	48 b8 e4 2a 80 00 00 	movabs $0x802ae4,%rax
  8044c9:	00 00 00 
  8044cc:	ff d0                	callq  *%rax
  8044ce:	89 03                	mov    %eax,(%rbx)
  8044d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8044d5:	eb 33                	jmp    80450a <pipe+0x1ef>
  8044d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044db:	48 89 c6             	mov    %rax,%rsi
  8044de:	bf 00 00 00 00       	mov    $0x0,%edi
  8044e3:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  8044ea:	00 00 00 
  8044ed:	ff d0                	callq  *%rax
  8044ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044f3:	48 89 c6             	mov    %rax,%rsi
  8044f6:	bf 00 00 00 00       	mov    $0x0,%edi
  8044fb:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  804502:	00 00 00 
  804505:	ff d0                	callq  *%rax
  804507:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80450a:	48 83 c4 38          	add    $0x38,%rsp
  80450e:	5b                   	pop    %rbx
  80450f:	5d                   	pop    %rbp
  804510:	c3                   	retq   

0000000000804511 <_pipeisclosed>:
  804511:	55                   	push   %rbp
  804512:	48 89 e5             	mov    %rsp,%rbp
  804515:	53                   	push   %rbx
  804516:	48 83 ec 28          	sub    $0x28,%rsp
  80451a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80451e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804522:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804529:	00 00 00 
  80452c:	48 8b 00             	mov    (%rax),%rax
  80452f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804535:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804538:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80453c:	48 89 c7             	mov    %rax,%rdi
  80453f:	48 b8 97 4b 80 00 00 	movabs $0x804b97,%rax
  804546:	00 00 00 
  804549:	ff d0                	callq  *%rax
  80454b:	89 c3                	mov    %eax,%ebx
  80454d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804551:	48 89 c7             	mov    %rax,%rdi
  804554:	48 b8 97 4b 80 00 00 	movabs $0x804b97,%rax
  80455b:	00 00 00 
  80455e:	ff d0                	callq  *%rax
  804560:	39 c3                	cmp    %eax,%ebx
  804562:	0f 94 c0             	sete   %al
  804565:	0f b6 c0             	movzbl %al,%eax
  804568:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80456b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804572:	00 00 00 
  804575:	48 8b 00             	mov    (%rax),%rax
  804578:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80457e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804581:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804584:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804587:	75 05                	jne    80458e <_pipeisclosed+0x7d>
  804589:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80458c:	eb 4f                	jmp    8045dd <_pipeisclosed+0xcc>
  80458e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804591:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804594:	74 42                	je     8045d8 <_pipeisclosed+0xc7>
  804596:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80459a:	75 3c                	jne    8045d8 <_pipeisclosed+0xc7>
  80459c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8045a3:	00 00 00 
  8045a6:	48 8b 00             	mov    (%rax),%rax
  8045a9:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8045af:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8045b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8045b5:	89 c6                	mov    %eax,%esi
  8045b7:	48 bf 23 57 80 00 00 	movabs $0x805723,%rdi
  8045be:	00 00 00 
  8045c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8045c6:	49 b8 59 0f 80 00 00 	movabs $0x800f59,%r8
  8045cd:	00 00 00 
  8045d0:	41 ff d0             	callq  *%r8
  8045d3:	e9 4a ff ff ff       	jmpq   804522 <_pipeisclosed+0x11>
  8045d8:	e9 45 ff ff ff       	jmpq   804522 <_pipeisclosed+0x11>
  8045dd:	48 83 c4 28          	add    $0x28,%rsp
  8045e1:	5b                   	pop    %rbx
  8045e2:	5d                   	pop    %rbp
  8045e3:	c3                   	retq   

00000000008045e4 <pipeisclosed>:
  8045e4:	55                   	push   %rbp
  8045e5:	48 89 e5             	mov    %rsp,%rbp
  8045e8:	48 83 ec 30          	sub    $0x30,%rsp
  8045ec:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8045ef:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8045f3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8045f6:	48 89 d6             	mov    %rdx,%rsi
  8045f9:	89 c7                	mov    %eax,%edi
  8045fb:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  804602:	00 00 00 
  804605:	ff d0                	callq  *%rax
  804607:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80460a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80460e:	79 05                	jns    804615 <pipeisclosed+0x31>
  804610:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804613:	eb 31                	jmp    804646 <pipeisclosed+0x62>
  804615:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804619:	48 89 c7             	mov    %rax,%rdi
  80461c:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  804623:	00 00 00 
  804626:	ff d0                	callq  *%rax
  804628:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80462c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804630:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804634:	48 89 d6             	mov    %rdx,%rsi
  804637:	48 89 c7             	mov    %rax,%rdi
  80463a:	48 b8 11 45 80 00 00 	movabs $0x804511,%rax
  804641:	00 00 00 
  804644:	ff d0                	callq  *%rax
  804646:	c9                   	leaveq 
  804647:	c3                   	retq   

0000000000804648 <devpipe_read>:
  804648:	55                   	push   %rbp
  804649:	48 89 e5             	mov    %rsp,%rbp
  80464c:	48 83 ec 40          	sub    $0x40,%rsp
  804650:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804654:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804658:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80465c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804660:	48 89 c7             	mov    %rax,%rdi
  804663:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  80466a:	00 00 00 
  80466d:	ff d0                	callq  *%rax
  80466f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804673:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804677:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80467b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804682:	00 
  804683:	e9 92 00 00 00       	jmpq   80471a <devpipe_read+0xd2>
  804688:	eb 41                	jmp    8046cb <devpipe_read+0x83>
  80468a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80468f:	74 09                	je     80469a <devpipe_read+0x52>
  804691:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804695:	e9 92 00 00 00       	jmpq   80472c <devpipe_read+0xe4>
  80469a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80469e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046a2:	48 89 d6             	mov    %rdx,%rsi
  8046a5:	48 89 c7             	mov    %rax,%rdi
  8046a8:	48 b8 11 45 80 00 00 	movabs $0x804511,%rax
  8046af:	00 00 00 
  8046b2:	ff d0                	callq  *%rax
  8046b4:	85 c0                	test   %eax,%eax
  8046b6:	74 07                	je     8046bf <devpipe_read+0x77>
  8046b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8046bd:	eb 6d                	jmp    80472c <devpipe_read+0xe4>
  8046bf:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  8046c6:	00 00 00 
  8046c9:	ff d0                	callq  *%rax
  8046cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046cf:	8b 10                	mov    (%rax),%edx
  8046d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046d5:	8b 40 04             	mov    0x4(%rax),%eax
  8046d8:	39 c2                	cmp    %eax,%edx
  8046da:	74 ae                	je     80468a <devpipe_read+0x42>
  8046dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046e0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8046e4:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8046e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046ec:	8b 00                	mov    (%rax),%eax
  8046ee:	99                   	cltd   
  8046ef:	c1 ea 1b             	shr    $0x1b,%edx
  8046f2:	01 d0                	add    %edx,%eax
  8046f4:	83 e0 1f             	and    $0x1f,%eax
  8046f7:	29 d0                	sub    %edx,%eax
  8046f9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8046fd:	48 98                	cltq   
  8046ff:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804704:	88 01                	mov    %al,(%rcx)
  804706:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80470a:	8b 00                	mov    (%rax),%eax
  80470c:	8d 50 01             	lea    0x1(%rax),%edx
  80470f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804713:	89 10                	mov    %edx,(%rax)
  804715:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80471a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80471e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804722:	0f 82 60 ff ff ff    	jb     804688 <devpipe_read+0x40>
  804728:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80472c:	c9                   	leaveq 
  80472d:	c3                   	retq   

000000000080472e <devpipe_write>:
  80472e:	55                   	push   %rbp
  80472f:	48 89 e5             	mov    %rsp,%rbp
  804732:	48 83 ec 40          	sub    $0x40,%rsp
  804736:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80473a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80473e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804742:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804746:	48 89 c7             	mov    %rax,%rdi
  804749:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  804750:	00 00 00 
  804753:	ff d0                	callq  *%rax
  804755:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804759:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80475d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804761:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804768:	00 
  804769:	e9 8e 00 00 00       	jmpq   8047fc <devpipe_write+0xce>
  80476e:	eb 31                	jmp    8047a1 <devpipe_write+0x73>
  804770:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804774:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804778:	48 89 d6             	mov    %rdx,%rsi
  80477b:	48 89 c7             	mov    %rax,%rdi
  80477e:	48 b8 11 45 80 00 00 	movabs $0x804511,%rax
  804785:	00 00 00 
  804788:	ff d0                	callq  *%rax
  80478a:	85 c0                	test   %eax,%eax
  80478c:	74 07                	je     804795 <devpipe_write+0x67>
  80478e:	b8 00 00 00 00       	mov    $0x0,%eax
  804793:	eb 79                	jmp    80480e <devpipe_write+0xe0>
  804795:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  80479c:	00 00 00 
  80479f:	ff d0                	callq  *%rax
  8047a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047a5:	8b 40 04             	mov    0x4(%rax),%eax
  8047a8:	48 63 d0             	movslq %eax,%rdx
  8047ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047af:	8b 00                	mov    (%rax),%eax
  8047b1:	48 98                	cltq   
  8047b3:	48 83 c0 20          	add    $0x20,%rax
  8047b7:	48 39 c2             	cmp    %rax,%rdx
  8047ba:	73 b4                	jae    804770 <devpipe_write+0x42>
  8047bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047c0:	8b 40 04             	mov    0x4(%rax),%eax
  8047c3:	99                   	cltd   
  8047c4:	c1 ea 1b             	shr    $0x1b,%edx
  8047c7:	01 d0                	add    %edx,%eax
  8047c9:	83 e0 1f             	and    $0x1f,%eax
  8047cc:	29 d0                	sub    %edx,%eax
  8047ce:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8047d2:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8047d6:	48 01 ca             	add    %rcx,%rdx
  8047d9:	0f b6 0a             	movzbl (%rdx),%ecx
  8047dc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8047e0:	48 98                	cltq   
  8047e2:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8047e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047ea:	8b 40 04             	mov    0x4(%rax),%eax
  8047ed:	8d 50 01             	lea    0x1(%rax),%edx
  8047f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047f4:	89 50 04             	mov    %edx,0x4(%rax)
  8047f7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8047fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804800:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804804:	0f 82 64 ff ff ff    	jb     80476e <devpipe_write+0x40>
  80480a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80480e:	c9                   	leaveq 
  80480f:	c3                   	retq   

0000000000804810 <devpipe_stat>:
  804810:	55                   	push   %rbp
  804811:	48 89 e5             	mov    %rsp,%rbp
  804814:	48 83 ec 20          	sub    $0x20,%rsp
  804818:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80481c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804820:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804824:	48 89 c7             	mov    %rax,%rdi
  804827:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  80482e:	00 00 00 
  804831:	ff d0                	callq  *%rax
  804833:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804837:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80483b:	48 be 36 57 80 00 00 	movabs $0x805736,%rsi
  804842:	00 00 00 
  804845:	48 89 c7             	mov    %rax,%rdi
  804848:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  80484f:	00 00 00 
  804852:	ff d0                	callq  *%rax
  804854:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804858:	8b 50 04             	mov    0x4(%rax),%edx
  80485b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80485f:	8b 00                	mov    (%rax),%eax
  804861:	29 c2                	sub    %eax,%edx
  804863:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804867:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80486d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804871:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804878:	00 00 00 
  80487b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80487f:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804886:	00 00 00 
  804889:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804890:	b8 00 00 00 00       	mov    $0x0,%eax
  804895:	c9                   	leaveq 
  804896:	c3                   	retq   

0000000000804897 <devpipe_close>:
  804897:	55                   	push   %rbp
  804898:	48 89 e5             	mov    %rsp,%rbp
  80489b:	48 83 ec 10          	sub    $0x10,%rsp
  80489f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8048a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048a7:	48 89 c6             	mov    %rax,%rsi
  8048aa:	bf 00 00 00 00       	mov    $0x0,%edi
  8048af:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  8048b6:	00 00 00 
  8048b9:	ff d0                	callq  *%rax
  8048bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048bf:	48 89 c7             	mov    %rax,%rdi
  8048c2:	48 b8 07 2b 80 00 00 	movabs $0x802b07,%rax
  8048c9:	00 00 00 
  8048cc:	ff d0                	callq  *%rax
  8048ce:	48 89 c6             	mov    %rax,%rsi
  8048d1:	bf 00 00 00 00       	mov    $0x0,%edi
  8048d6:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  8048dd:	00 00 00 
  8048e0:	ff d0                	callq  *%rax
  8048e2:	c9                   	leaveq 
  8048e3:	c3                   	retq   

00000000008048e4 <cputchar>:
  8048e4:	55                   	push   %rbp
  8048e5:	48 89 e5             	mov    %rsp,%rbp
  8048e8:	48 83 ec 20          	sub    $0x20,%rsp
  8048ec:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8048ef:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048f2:	88 45 ff             	mov    %al,-0x1(%rbp)
  8048f5:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8048f9:	be 01 00 00 00       	mov    $0x1,%esi
  8048fe:	48 89 c7             	mov    %rax,%rdi
  804901:	48 b8 f5 22 80 00 00 	movabs $0x8022f5,%rax
  804908:	00 00 00 
  80490b:	ff d0                	callq  *%rax
  80490d:	c9                   	leaveq 
  80490e:	c3                   	retq   

000000000080490f <getchar>:
  80490f:	55                   	push   %rbp
  804910:	48 89 e5             	mov    %rsp,%rbp
  804913:	48 83 ec 10          	sub    $0x10,%rsp
  804917:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  80491b:	ba 01 00 00 00       	mov    $0x1,%edx
  804920:	48 89 c6             	mov    %rax,%rsi
  804923:	bf 00 00 00 00       	mov    $0x0,%edi
  804928:	48 b8 fc 2f 80 00 00 	movabs $0x802ffc,%rax
  80492f:	00 00 00 
  804932:	ff d0                	callq  *%rax
  804934:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804937:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80493b:	79 05                	jns    804942 <getchar+0x33>
  80493d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804940:	eb 14                	jmp    804956 <getchar+0x47>
  804942:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804946:	7f 07                	jg     80494f <getchar+0x40>
  804948:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80494d:	eb 07                	jmp    804956 <getchar+0x47>
  80494f:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804953:	0f b6 c0             	movzbl %al,%eax
  804956:	c9                   	leaveq 
  804957:	c3                   	retq   

0000000000804958 <iscons>:
  804958:	55                   	push   %rbp
  804959:	48 89 e5             	mov    %rsp,%rbp
  80495c:	48 83 ec 20          	sub    $0x20,%rsp
  804960:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804963:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804967:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80496a:	48 89 d6             	mov    %rdx,%rsi
  80496d:	89 c7                	mov    %eax,%edi
  80496f:	48 b8 ca 2b 80 00 00 	movabs $0x802bca,%rax
  804976:	00 00 00 
  804979:	ff d0                	callq  *%rax
  80497b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80497e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804982:	79 05                	jns    804989 <iscons+0x31>
  804984:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804987:	eb 1a                	jmp    8049a3 <iscons+0x4b>
  804989:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80498d:	8b 10                	mov    (%rax),%edx
  80498f:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804996:	00 00 00 
  804999:	8b 00                	mov    (%rax),%eax
  80499b:	39 c2                	cmp    %eax,%edx
  80499d:	0f 94 c0             	sete   %al
  8049a0:	0f b6 c0             	movzbl %al,%eax
  8049a3:	c9                   	leaveq 
  8049a4:	c3                   	retq   

00000000008049a5 <opencons>:
  8049a5:	55                   	push   %rbp
  8049a6:	48 89 e5             	mov    %rsp,%rbp
  8049a9:	48 83 ec 10          	sub    $0x10,%rsp
  8049ad:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8049b1:	48 89 c7             	mov    %rax,%rdi
  8049b4:	48 b8 32 2b 80 00 00 	movabs $0x802b32,%rax
  8049bb:	00 00 00 
  8049be:	ff d0                	callq  *%rax
  8049c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049c7:	79 05                	jns    8049ce <opencons+0x29>
  8049c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049cc:	eb 5b                	jmp    804a29 <opencons+0x84>
  8049ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049d2:	ba 07 04 00 00       	mov    $0x407,%edx
  8049d7:	48 89 c6             	mov    %rax,%rsi
  8049da:	bf 00 00 00 00       	mov    $0x0,%edi
  8049df:	48 b8 3d 24 80 00 00 	movabs $0x80243d,%rax
  8049e6:	00 00 00 
  8049e9:	ff d0                	callq  *%rax
  8049eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049ee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049f2:	79 05                	jns    8049f9 <opencons+0x54>
  8049f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049f7:	eb 30                	jmp    804a29 <opencons+0x84>
  8049f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049fd:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  804a04:	00 00 00 
  804a07:	8b 12                	mov    (%rdx),%edx
  804a09:	89 10                	mov    %edx,(%rax)
  804a0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a0f:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804a16:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a1a:	48 89 c7             	mov    %rax,%rdi
  804a1d:	48 b8 e4 2a 80 00 00 	movabs $0x802ae4,%rax
  804a24:	00 00 00 
  804a27:	ff d0                	callq  *%rax
  804a29:	c9                   	leaveq 
  804a2a:	c3                   	retq   

0000000000804a2b <devcons_read>:
  804a2b:	55                   	push   %rbp
  804a2c:	48 89 e5             	mov    %rsp,%rbp
  804a2f:	48 83 ec 30          	sub    $0x30,%rsp
  804a33:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a37:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804a3b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804a3f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804a44:	75 07                	jne    804a4d <devcons_read+0x22>
  804a46:	b8 00 00 00 00       	mov    $0x0,%eax
  804a4b:	eb 4b                	jmp    804a98 <devcons_read+0x6d>
  804a4d:	eb 0c                	jmp    804a5b <devcons_read+0x30>
  804a4f:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  804a56:	00 00 00 
  804a59:	ff d0                	callq  *%rax
  804a5b:	48 b8 3f 23 80 00 00 	movabs $0x80233f,%rax
  804a62:	00 00 00 
  804a65:	ff d0                	callq  *%rax
  804a67:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a6a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a6e:	74 df                	je     804a4f <devcons_read+0x24>
  804a70:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a74:	79 05                	jns    804a7b <devcons_read+0x50>
  804a76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a79:	eb 1d                	jmp    804a98 <devcons_read+0x6d>
  804a7b:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804a7f:	75 07                	jne    804a88 <devcons_read+0x5d>
  804a81:	b8 00 00 00 00       	mov    $0x0,%eax
  804a86:	eb 10                	jmp    804a98 <devcons_read+0x6d>
  804a88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a8b:	89 c2                	mov    %eax,%edx
  804a8d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804a91:	88 10                	mov    %dl,(%rax)
  804a93:	b8 01 00 00 00       	mov    $0x1,%eax
  804a98:	c9                   	leaveq 
  804a99:	c3                   	retq   

0000000000804a9a <devcons_write>:
  804a9a:	55                   	push   %rbp
  804a9b:	48 89 e5             	mov    %rsp,%rbp
  804a9e:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804aa5:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804aac:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804ab3:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804aba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804ac1:	eb 76                	jmp    804b39 <devcons_write+0x9f>
  804ac3:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804aca:	89 c2                	mov    %eax,%edx
  804acc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804acf:	29 c2                	sub    %eax,%edx
  804ad1:	89 d0                	mov    %edx,%eax
  804ad3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804ad6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804ad9:	83 f8 7f             	cmp    $0x7f,%eax
  804adc:	76 07                	jbe    804ae5 <devcons_write+0x4b>
  804ade:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804ae5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804ae8:	48 63 d0             	movslq %eax,%rdx
  804aeb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804aee:	48 63 c8             	movslq %eax,%rcx
  804af1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804af8:	48 01 c1             	add    %rax,%rcx
  804afb:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804b02:	48 89 ce             	mov    %rcx,%rsi
  804b05:	48 89 c7             	mov    %rax,%rdi
  804b08:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804b0f:	00 00 00 
  804b12:	ff d0                	callq  *%rax
  804b14:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804b17:	48 63 d0             	movslq %eax,%rdx
  804b1a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804b21:	48 89 d6             	mov    %rdx,%rsi
  804b24:	48 89 c7             	mov    %rax,%rdi
  804b27:	48 b8 f5 22 80 00 00 	movabs $0x8022f5,%rax
  804b2e:	00 00 00 
  804b31:	ff d0                	callq  *%rax
  804b33:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804b36:	01 45 fc             	add    %eax,-0x4(%rbp)
  804b39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b3c:	48 98                	cltq   
  804b3e:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804b45:	0f 82 78 ff ff ff    	jb     804ac3 <devcons_write+0x29>
  804b4b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b4e:	c9                   	leaveq 
  804b4f:	c3                   	retq   

0000000000804b50 <devcons_close>:
  804b50:	55                   	push   %rbp
  804b51:	48 89 e5             	mov    %rsp,%rbp
  804b54:	48 83 ec 08          	sub    $0x8,%rsp
  804b58:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804b5c:	b8 00 00 00 00       	mov    $0x0,%eax
  804b61:	c9                   	leaveq 
  804b62:	c3                   	retq   

0000000000804b63 <devcons_stat>:
  804b63:	55                   	push   %rbp
  804b64:	48 89 e5             	mov    %rsp,%rbp
  804b67:	48 83 ec 10          	sub    $0x10,%rsp
  804b6b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804b6f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804b73:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b77:	48 be 42 57 80 00 00 	movabs $0x805742,%rsi
  804b7e:	00 00 00 
  804b81:	48 89 c7             	mov    %rax,%rdi
  804b84:	48 b8 0e 1b 80 00 00 	movabs $0x801b0e,%rax
  804b8b:	00 00 00 
  804b8e:	ff d0                	callq  *%rax
  804b90:	b8 00 00 00 00       	mov    $0x0,%eax
  804b95:	c9                   	leaveq 
  804b96:	c3                   	retq   

0000000000804b97 <pageref>:
  804b97:	55                   	push   %rbp
  804b98:	48 89 e5             	mov    %rsp,%rbp
  804b9b:	48 83 ec 18          	sub    $0x18,%rsp
  804b9f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804ba3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ba7:	48 c1 e8 15          	shr    $0x15,%rax
  804bab:	48 89 c2             	mov    %rax,%rdx
  804bae:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804bb5:	01 00 00 
  804bb8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804bbc:	83 e0 01             	and    $0x1,%eax
  804bbf:	48 85 c0             	test   %rax,%rax
  804bc2:	75 07                	jne    804bcb <pageref+0x34>
  804bc4:	b8 00 00 00 00       	mov    $0x0,%eax
  804bc9:	eb 53                	jmp    804c1e <pageref+0x87>
  804bcb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804bcf:	48 c1 e8 0c          	shr    $0xc,%rax
  804bd3:	48 89 c2             	mov    %rax,%rdx
  804bd6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804bdd:	01 00 00 
  804be0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804be4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804be8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bec:	83 e0 01             	and    $0x1,%eax
  804bef:	48 85 c0             	test   %rax,%rax
  804bf2:	75 07                	jne    804bfb <pageref+0x64>
  804bf4:	b8 00 00 00 00       	mov    $0x0,%eax
  804bf9:	eb 23                	jmp    804c1e <pageref+0x87>
  804bfb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bff:	48 c1 e8 0c          	shr    $0xc,%rax
  804c03:	48 89 c2             	mov    %rax,%rdx
  804c06:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804c0d:	00 00 00 
  804c10:	48 c1 e2 04          	shl    $0x4,%rdx
  804c14:	48 01 d0             	add    %rdx,%rax
  804c17:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804c1b:	0f b7 c0             	movzwl %ax,%eax
  804c1e:	c9                   	leaveq 
  804c1f:	c3                   	retq   
