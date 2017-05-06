
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 41 11 00 00       	call   10114c <initSerial>
  10000b:	e8 04 0e 00 00       	call   100e14 <initIdt>
  100010:	e8 93 11 00 00       	call   1011a8 <initIntr>
  100015:	e8 aa 00 00 00       	call   1000c4 <initTimer>
  10001a:	e8 99 0b 00 00       	call   100bb8 <initSeg>
  10001f:	fb                   	sti    
  100020:	e8 ef 04 00 00       	call   100514 <initPcb>
  100025:	e8 16 0d 00 00       	call   100d40 <loadUMain>
  10002a:	eb fe                	jmp    10002a <kEntry+0x2a>

0010002c <abort>:
  10002c:	55                   	push   %ebp
  10002d:	89 e5                	mov    %esp,%ebp
  10002f:	57                   	push   %edi
  100030:	56                   	push   %esi
  100031:	53                   	push   %ebx
  100032:	83 ec 1c             	sub    $0x1c,%esp
  100035:	8b 55 08             	mov    0x8(%ebp),%edx
  100038:	fa                   	cli    
  100039:	8a 02                	mov    (%edx),%al
  10003b:	b9 52 26 10 00       	mov    $0x102652,%ecx
  100040:	84 c0                	test   %al,%al
  100042:	74 0b                	je     10004f <abort+0x23>
  100044:	41                   	inc    %ecx
  100045:	42                   	inc    %edx
  100046:	88 41 ff             	mov    %al,-0x1(%ecx)
  100049:	8a 02                	mov    (%edx),%al
  10004b:	84 c0                	test   %al,%al
  10004d:	75 f5                	jne    100044 <abort+0x18>
  10004f:	c6 01 3a             	movb   $0x3a,(%ecx)
  100052:	bb 7d 27 10 00       	mov    $0x10277d,%ebx
  100057:	be 0a 00 00 00       	mov    $0xa,%esi
  10005c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100061:	4b                   	dec    %ebx
  100062:	8b 45 0c             	mov    0xc(%ebp),%eax
  100065:	99                   	cltd   
  100066:	f7 fe                	idiv   %esi
  100068:	8d 42 30             	lea    0x30(%edx),%eax
  10006b:	88 45 e7             	mov    %al,-0x19(%ebp)
  10006e:	88 03                	mov    %al,(%ebx)
  100070:	89 f8                	mov    %edi,%eax
  100072:	f7 6d 0c             	imull  0xc(%ebp)
  100075:	c1 fa 02             	sar    $0x2,%edx
  100078:	8b 45 0c             	mov    0xc(%ebp),%eax
  10007b:	c1 f8 1f             	sar    $0x1f,%eax
  10007e:	29 c2                	sub    %eax,%edx
  100080:	89 55 0c             	mov    %edx,0xc(%ebp)
  100083:	75 dc                	jne    100061 <abort+0x35>
  100085:	41                   	inc    %ecx
  100086:	41                   	inc    %ecx
  100087:	43                   	inc    %ebx
  100088:	8a 45 e7             	mov    -0x19(%ebp),%al
  10008b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10008e:	8a 03                	mov    (%ebx),%al
  100090:	88 45 e7             	mov    %al,-0x19(%ebp)
  100093:	84 c0                	test   %al,%al
  100095:	75 ef                	jne    100086 <abort+0x5a>
  100097:	c6 01 0a             	movb   $0xa,(%ecx)
  10009a:	0f be 05 40 26 10 00 	movsbl 0x102640,%eax
  1000a1:	84 c0                	test   %al,%al
  1000a3:	74 1b                	je     1000c0 <abort+0x94>
  1000a5:	bb 40 26 10 00       	mov    $0x102640,%ebx
  1000aa:	83 ec 0c             	sub    $0xc,%esp
  1000ad:	50                   	push   %eax
  1000ae:	e8 d9 10 00 00       	call   10118c <putChar>
  1000b3:	43                   	inc    %ebx
  1000b4:	0f be 03             	movsbl (%ebx),%eax
  1000b7:	83 c4 10             	add    $0x10,%esp
  1000ba:	84 c0                	test   %al,%al
  1000bc:	75 ec                	jne    1000aa <abort+0x7e>
  1000be:	66 90                	xchg   %ax,%ax
  1000c0:	f4                   	hlt    
  1000c1:	eb fd                	jmp    1000c0 <abort+0x94>
  1000c3:	90                   	nop

001000c4 <initTimer>:
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	ba 43 00 00 00       	mov    $0x43,%edx
  1000cc:	b0 34                	mov    $0x34,%al
  1000ce:	ee                   	out    %al,(%dx)
  1000cf:	ba 40 00 00 00       	mov    $0x40,%edx
  1000d4:	b0 9b                	mov    $0x9b,%al
  1000d6:	ee                   	out    %al,(%dx)
  1000d7:	b0 2e                	mov    $0x2e,%al
  1000d9:	ee                   	out    %al,(%dx)
  1000da:	5d                   	pop    %ebp
  1000db:	c3                   	ret    

001000dc <sys_write>:
  1000dc:	55                   	push   %ebp
  1000dd:	89 e5                	mov    %esp,%ebp
  1000df:	83 ec 24             	sub    $0x24,%esp
  1000e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1000e5:	8b 40 28             	mov    0x28(%eax),%eax
  1000e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1000eb:	0f be c0             	movsbl %al,%eax
  1000ee:	50                   	push   %eax
  1000ef:	e8 98 10 00 00       	call   10118c <putChar>
  1000f4:	83 c4 10             	add    $0x10,%esp
  1000f7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  1000fb:	74 2c                	je     100129 <sys_write+0x4d>
  1000fd:	a1 40 27 10 00       	mov    0x102740,%eax
  100102:	6b c0 50             	imul   $0x50,%eax,%eax
  100105:	03 05 80 27 10 00    	add    0x102780,%eax
  10010b:	6b c0 02             	imul   $0x2,%eax,%eax
  10010e:	89 c7                	mov    %eax,%edi
  100110:	8a 45 f4             	mov    -0xc(%ebp),%al
  100113:	b4 0c                	mov    $0xc,%ah
  100115:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100119:	a1 80 27 10 00       	mov    0x102780,%eax
  10011e:	40                   	inc    %eax
  10011f:	a3 80 27 10 00       	mov    %eax,0x102780
  100124:	83 f8 4f             	cmp    $0x4f,%eax
  100127:	7e 10                	jle    100139 <sys_write+0x5d>
  100129:	ff 05 40 27 10 00    	incl   0x102740
  10012f:	c7 05 80 27 10 00 00 	movl   $0x0,0x102780
  100136:	00 00 00 
  100139:	c9                   	leave  
  10013a:	c3                   	ret    
  10013b:	90                   	nop

0010013c <syscallHandle>:
  10013c:	55                   	push   %ebp
  10013d:	89 e5                	mov    %esp,%ebp
  10013f:	83 ec 08             	sub    $0x8,%esp
  100142:	8b 55 08             	mov    0x8(%ebp),%edx
  100145:	8b 42 2c             	mov    0x2c(%edx),%eax
  100148:	83 f8 03             	cmp    $0x3,%eax
  10014b:	74 4b                	je     100198 <syscallHandle+0x5c>
  10014d:	76 21                	jbe    100170 <syscallHandle+0x34>
  10014f:	83 f8 04             	cmp    $0x4,%eax
  100152:	74 10                	je     100164 <syscallHandle+0x28>
  100154:	83 f8 05             	cmp    $0x5,%eax
  100157:	75 27                	jne    100180 <syscallHandle+0x44>
  100159:	89 55 08             	mov    %edx,0x8(%ebp)
  10015c:	c9                   	leave  
  10015d:	e9 62 08 00 00       	jmp    1009c4 <sys_exit>
  100162:	66 90                	xchg   %ax,%ax
  100164:	89 55 08             	mov    %edx,0x8(%ebp)
  100167:	c9                   	leave  
  100168:	e9 6f ff ff ff       	jmp    1000dc <sys_write>
  10016d:	8d 76 00             	lea    0x0(%esi),%esi
  100170:	83 f8 02             	cmp    $0x2,%eax
  100173:	75 0b                	jne    100180 <syscallHandle+0x44>
  100175:	89 55 08             	mov    %edx,0x8(%ebp)
  100178:	c9                   	leave  
  100179:	e9 9a 04 00 00       	jmp    100618 <sys_fork>
  10017e:	66 90                	xchg   %ax,%ax
  100180:	83 ec 08             	sub    $0x8,%esp
  100183:	68 8c 00 00 00       	push   $0x8c
  100188:	68 7c 12 10 00       	push   $0x10127c
  10018d:	e8 9a fe ff ff       	call   10002c <abort>
  100192:	83 c4 10             	add    $0x10,%esp
  100195:	c9                   	leave  
  100196:	c3                   	ret    
  100197:	90                   	nop
  100198:	89 55 08             	mov    %edx,0x8(%ebp)
  10019b:	c9                   	leave  
  10019c:	e9 63 06 00 00       	jmp    100804 <sys_sleep>
  1001a1:	8d 76 00             	lea    0x0(%esi),%esi

001001a4 <irqHandle>:
  1001a4:	55                   	push   %ebp
  1001a5:	89 e5                	mov    %esp,%ebp
  1001a7:	53                   	push   %ebx
  1001a8:	83 ec 10             	sub    $0x10,%esp
  1001ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1001ae:	66 b8 10 00          	mov    $0x10,%ax
  1001b2:	8e d8                	mov    %eax,%ds
  1001b4:	8e c0                	mov    %eax,%es
  1001b6:	66 b8 30 00          	mov    $0x30,%ax
  1001ba:	8e e8                	mov    %eax,%gs
  1001bc:	66 c7 05 84 27 10 00 	movw   $0x37,0x102784
  1001c3:	37 00 
  1001c5:	b8 e0 24 11 00       	mov    $0x1124e0,%eax
  1001ca:	66 a3 86 27 10 00    	mov    %ax,0x102786
  1001d0:	c1 e8 10             	shr    $0x10,%eax
  1001d3:	66 a3 88 27 10 00    	mov    %ax,0x102788
  1001d9:	b8 84 27 10 00       	mov    $0x102784,%eax
  1001de:	0f 01 10             	lgdtl  (%eax)
  1001e1:	a0 07 25 11 00       	mov    0x112507,%al
  1001e6:	83 c0 30             	add    $0x30,%eax
  1001e9:	0f be c0             	movsbl %al,%eax
  1001ec:	50                   	push   %eax
  1001ed:	e8 9a 0f 00 00       	call   10118c <putChar>
  1001f2:	83 c4 10             	add    $0x10,%esp
  1001f5:	8b 43 30             	mov    0x30(%ebx),%eax
  1001f8:	83 f8 0d             	cmp    $0xd,%eax
  1001fb:	74 4f                	je     10024c <irqHandle+0xa8>
  1001fd:	7e 25                	jle    100224 <irqHandle+0x80>
  1001ff:	83 f8 20             	cmp    $0x20,%eax
  100202:	74 14                	je     100218 <irqHandle+0x74>
  100204:	83 c0 80             	add    $0xffffff80,%eax
  100207:	75 23                	jne    10022c <irqHandle+0x88>
  100209:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10020c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10020f:	c9                   	leave  
  100210:	e9 27 ff ff ff       	jmp    10013c <syscallHandle>
  100215:	8d 76 00             	lea    0x0(%esi),%esi
  100218:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10021b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10021e:	c9                   	leave  
  10021f:	e9 e0 00 00 00       	jmp    100304 <Intrtime>
  100224:	40                   	inc    %eax
  100225:	75 05                	jne    10022c <irqHandle+0x88>
  100227:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10022a:	c9                   	leave  
  10022b:	c3                   	ret    
  10022c:	83 ec 08             	sub    $0x8,%esp
  10022f:	6a 44                	push   $0x44
  100231:	68 7c 12 10 00       	push   $0x10127c
  100236:	e8 f1 fd ff ff       	call   10002c <abort>
  10023b:	8e 5b 0c             	mov    0xc(%ebx),%ds
  10023e:	8e 43 08             	mov    0x8(%ebx),%es
  100241:	8e 2b                	mov    (%ebx),%gs
  100243:	83 c4 10             	add    $0x10,%esp
  100246:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100249:	c9                   	leave  
  10024a:	c3                   	ret    
  10024b:	90                   	nop
  10024c:	83 ec 08             	sub    $0x8,%esp
  10024f:	68 91 00 00 00       	push   $0x91
  100254:	68 7c 12 10 00       	push   $0x10127c
  100259:	e8 ce fd ff ff       	call   10002c <abort>
  10025e:	83 c4 10             	add    $0x10,%esp
  100261:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100264:	c9                   	leave  
  100265:	c3                   	ret    
  100266:	66 90                	xchg   %ax,%ax

00100268 <GProtectFaultHandle>:
  100268:	55                   	push   %ebp
  100269:	89 e5                	mov    %esp,%ebp
  10026b:	83 ec 10             	sub    $0x10,%esp
  10026e:	68 91 00 00 00       	push   $0x91
  100273:	68 7c 12 10 00       	push   $0x10127c
  100278:	e8 af fd ff ff       	call   10002c <abort>
  10027d:	83 c4 10             	add    $0x10,%esp
  100280:	c9                   	leave  
  100281:	c3                   	ret    
  100282:	66 90                	xchg   %ax,%ax

00100284 <IDLE>:
  100284:	55                   	push   %ebp
  100285:	89 e5                	mov    %esp,%ebp
  100287:	90                   	nop
  100288:	f4                   	hlt    
  100289:	eb fd                	jmp    100288 <IDLE+0x4>
  10028b:	90                   	nop

0010028c <debug>:
  10028c:	55                   	push   %ebp
  10028d:	89 e5                	mov    %esp,%ebp
  10028f:	53                   	push   %ebx
  100290:	83 ec 10             	sub    $0x10,%esp
  100293:	6a 0a                	push   $0xa
  100295:	e8 f2 0e 00 00       	call   10118c <putChar>
  10029a:	bb 0c 67 10 00       	mov    $0x10670c,%ebx
  10029f:	83 c4 10             	add    $0x10,%esp
  1002a2:	eb 30                	jmp    1002d4 <debug+0x48>
  1002a4:	83 ec 0c             	sub    $0xc,%esp
  1002a7:	8a 43 04             	mov    0x4(%ebx),%al
  1002aa:	83 c0 30             	add    $0x30,%eax
  1002ad:	0f be c0             	movsbl %al,%eax
  1002b0:	50                   	push   %eax
  1002b1:	e8 d6 0e 00 00       	call   10118c <putChar>
  1002b6:	83 c4 10             	add    $0x10,%esp
  1002b9:	83 ec 0c             	sub    $0xc,%esp
  1002bc:	6a 20                	push   $0x20
  1002be:	e8 c9 0e 00 00       	call   10118c <putChar>
  1002c3:	81 c3 a0 1f 00 00    	add    $0x1fa0,%ebx
  1002c9:	83 c4 10             	add    $0x10,%esp
  1002cc:	81 fb 6c 44 11 00    	cmp    $0x11446c,%ebx
  1002d2:	74 28                	je     1002fc <debug+0x70>
  1002d4:	83 7b 10 01          	cmpl   $0x1,0x10(%ebx)
  1002d8:	75 22                	jne    1002fc <debug+0x70>
  1002da:	83 ec 0c             	sub    $0xc,%esp
  1002dd:	8a 03                	mov    (%ebx),%al
  1002df:	83 c0 30             	add    $0x30,%eax
  1002e2:	0f be c0             	movsbl %al,%eax
  1002e5:	50                   	push   %eax
  1002e6:	e8 a1 0e 00 00       	call   10118c <putChar>
  1002eb:	83 c4 10             	add    $0x10,%esp
  1002ee:	83 3b 03             	cmpl   $0x3,(%ebx)
  1002f1:	75 b1                	jne    1002a4 <debug+0x18>
  1002f3:	83 ec 0c             	sub    $0xc,%esp
  1002f6:	8a 43 08             	mov    0x8(%ebx),%al
  1002f9:	eb af                	jmp    1002aa <debug+0x1e>
  1002fb:	90                   	nop
  1002fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002ff:	c9                   	leave  
  100300:	c3                   	ret    
  100301:	8d 76 00             	lea    0x0(%esi),%esi

00100304 <Intrtime>:
  100304:	55                   	push   %ebp
  100305:	89 e5                	mov    %esp,%ebp
  100307:	57                   	push   %edi
  100308:	56                   	push   %esi
  100309:	53                   	push   %ebx
  10030a:	8b 15 c0 27 10 00    	mov    0x1027c0,%edx
  100310:	89 d0                	mov    %edx,%eax
  100312:	c1 e0 06             	shl    $0x6,%eax
  100315:	29 d0                	sub    %edx,%eax
  100317:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  10031a:	c1 e3 05             	shl    $0x5,%ebx
  10031d:	8d 83 20 47 10 00    	lea    0x104720(%ebx),%eax
  100323:	b9 13 00 00 00       	mov    $0x13,%ecx
  100328:	89 c7                	mov    %eax,%edi
  10032a:	8b 75 08             	mov    0x8(%ebp),%esi
  10032d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10032f:	c7 83 6c 47 10 00 02 	movl   $0x2,0x10476c(%ebx)
  100336:	00 00 00 
  100339:	81 c3 e0 27 10 00    	add    $0x1027e0,%ebx
  10033f:	ff 8b 90 1f 00 00    	decl   0x1f90(%ebx)
  100345:	b9 0c 67 10 00       	mov    $0x10670c,%ecx
  10034a:	89 c8                	mov    %ecx,%eax
  10034c:	eb 0e                	jmp    10035c <Intrtime+0x58>
  10034e:	66 90                	xchg   %ax,%ax
  100350:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100355:	3d 6c 44 11 00       	cmp    $0x11446c,%eax
  10035a:	74 34                	je     100390 <Intrtime+0x8c>
  10035c:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  100360:	75 ee                	jne    100350 <Intrtime+0x4c>
  100362:	83 38 03             	cmpl   $0x3,(%eax)
  100365:	75 e9                	jne    100350 <Intrtime+0x4c>
  100367:	8b 78 08             	mov    0x8(%eax),%edi
  10036a:	8d 5f ff             	lea    -0x1(%edi),%ebx
  10036d:	89 58 08             	mov    %ebx,0x8(%eax)
  100370:	85 db                	test   %ebx,%ebx
  100372:	7f dc                	jg     100350 <Intrtime+0x4c>
  100374:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  10037a:	c7 40 04 0a 00 00 00 	movl   $0xa,0x4(%eax)
  100381:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100386:	3d 6c 44 11 00       	cmp    $0x11446c,%eax
  10038b:	75 cf                	jne    10035c <Intrtime+0x58>
  10038d:	8d 76 00             	lea    0x0(%esi),%esi
  100390:	89 d0                	mov    %edx,%eax
  100392:	c1 e0 06             	shl    $0x6,%eax
  100395:	29 d0                	sub    %edx,%eax
  100397:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10039a:	c1 e0 05             	shl    $0x5,%eax
  10039d:	05 e0 27 10 00       	add    $0x1027e0,%eax
  1003a2:	8b 98 90 1f 00 00    	mov    0x1f90(%eax),%ebx
  1003a8:	85 db                	test   %ebx,%ebx
  1003aa:	7e 7c                	jle    100428 <Intrtime+0x124>
  1003ac:	85 d2                	test   %edx,%edx
  1003ae:	74 7c                	je     10042c <Intrtime+0x128>
  1003b0:	89 d0                	mov    %edx,%eax
  1003b2:	c1 e0 06             	shl    $0x6,%eax
  1003b5:	29 d0                	sub    %edx,%eax
  1003b7:	8d 34 82             	lea    (%edx,%eax,4),%esi
  1003ba:	c1 e6 05             	shl    $0x5,%esi
  1003bd:	c7 86 6c 47 10 00 01 	movl   $0x1,0x10476c(%esi)
  1003c4:	00 00 00 
  1003c7:	81 c6 20 47 10 00    	add    $0x104720,%esi
  1003cd:	b9 13 00 00 00       	mov    $0x13,%ecx
  1003d2:	8b 7d 08             	mov    0x8(%ebp),%edi
  1003d5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1003d7:	83 fa 01             	cmp    $0x1,%edx
  1003da:	0f 84 fc 00 00 00    	je     1004dc <Intrtime+0x1d8>
  1003e0:	83 fa 02             	cmp    $0x2,%edx
  1003e3:	74 2b                	je     100410 <Intrtime+0x10c>
  1003e5:	66 c7 05 8c 27 10 00 	movw   $0x37,0x10278c
  1003ec:	37 00 
  1003ee:	b8 e0 24 11 00       	mov    $0x1124e0,%eax
  1003f3:	66 a3 8e 27 10 00    	mov    %ax,0x10278e
  1003f9:	c1 e8 10             	shr    $0x10,%eax
  1003fc:	66 a3 90 27 10 00    	mov    %ax,0x102790
  100402:	b8 8c 27 10 00       	mov    $0x10278c,%eax
  100407:	0f 01 10             	lgdtl  (%eax)
  10040a:	5b                   	pop    %ebx
  10040b:	5e                   	pop    %esi
  10040c:	5f                   	pop    %edi
  10040d:	5d                   	pop    %ebp
  10040e:	c3                   	ret    
  10040f:	90                   	nop
  100410:	a1 90 12 10 00       	mov    0x101290,%eax
  100415:	8b 15 94 12 10 00    	mov    0x101294,%edx
  10041b:	a3 00 25 11 00       	mov    %eax,0x112500
  100420:	89 15 04 25 11 00    	mov    %edx,0x112504
  100426:	eb bd                	jmp    1003e5 <Intrtime+0xe1>
  100428:	85 d2                	test   %edx,%edx
  10042a:	75 50                	jne    10047c <Intrtime+0x178>
  10042c:	ba 01 00 00 00       	mov    $0x1,%edx
  100431:	eb 0d                	jmp    100440 <Intrtime+0x13c>
  100433:	90                   	nop
  100434:	42                   	inc    %edx
  100435:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  10043b:	83 fa 08             	cmp    $0x8,%edx
  10043e:	74 38                	je     100478 <Intrtime+0x174>
  100440:	83 39 02             	cmpl   $0x2,(%ecx)
  100443:	75 ef                	jne    100434 <Intrtime+0x130>
  100445:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  100449:	75 e9                	jne    100434 <Intrtime+0x130>
  10044b:	89 d0                	mov    %edx,%eax
  10044d:	c1 e0 06             	shl    $0x6,%eax
  100450:	29 d0                	sub    %edx,%eax
  100452:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100455:	c1 e0 05             	shl    $0x5,%eax
  100458:	c7 80 6c 47 10 00 01 	movl   $0x1,0x10476c(%eax)
  10045f:	00 00 00 
  100462:	c7 80 70 47 10 00 0a 	movl   $0xa,0x104770(%eax)
  100469:	00 00 00 
  10046c:	89 15 c0 27 10 00    	mov    %edx,0x1027c0
  100472:	e9 39 ff ff ff       	jmp    1003b0 <Intrtime+0xac>
  100477:	90                   	nop
  100478:	31 d2                	xor    %edx,%edx
  10047a:	eb cf                	jmp    10044b <Intrtime+0x147>
  10047c:	c7 80 8c 1f 00 00 02 	movl   $0x2,0x1f8c(%eax)
  100483:	00 00 00 
  100486:	b8 01 00 00 00       	mov    $0x1,%eax
  10048b:	eb 0f                	jmp    10049c <Intrtime+0x198>
  10048d:	8d 76 00             	lea    0x0(%esi),%esi
  100490:	40                   	inc    %eax
  100491:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  100497:	83 f8 08             	cmp    $0x8,%eax
  10049a:	74 74                	je     100510 <Intrtime+0x20c>
  10049c:	83 39 02             	cmpl   $0x2,(%ecx)
  10049f:	75 ef                	jne    100490 <Intrtime+0x18c>
  1004a1:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  1004a5:	75 e9                	jne    100490 <Intrtime+0x18c>
  1004a7:	39 c2                	cmp    %eax,%edx
  1004a9:	74 e5                	je     100490 <Intrtime+0x18c>
  1004ab:	90                   	nop
  1004ac:	89 c2                	mov    %eax,%edx
  1004ae:	c1 e2 06             	shl    $0x6,%edx
  1004b1:	29 c2                	sub    %eax,%edx
  1004b3:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1004b6:	c1 e2 05             	shl    $0x5,%edx
  1004b9:	c7 82 6c 47 10 00 01 	movl   $0x1,0x10476c(%edx)
  1004c0:	00 00 00 
  1004c3:	c7 82 70 47 10 00 0a 	movl   $0xa,0x104770(%edx)
  1004ca:	00 00 00 
  1004cd:	a3 c0 27 10 00       	mov    %eax,0x1027c0
  1004d2:	89 c2                	mov    %eax,%edx
  1004d4:	e9 d7 fe ff ff       	jmp    1003b0 <Intrtime+0xac>
  1004d9:	8d 76 00             	lea    0x0(%esi),%esi
  1004dc:	66 c7 05 00 25 11 00 	movw   $0xffff,0x112500
  1004e3:	ff ff 
  1004e5:	66 c7 05 02 25 11 00 	movw   $0x0,0x112502
  1004ec:	00 00 
  1004ee:	c6 05 04 25 11 00 00 	movb   $0x0,0x112504
  1004f5:	c6 05 05 25 11 00 f2 	movb   $0xf2,0x112505
  1004fc:	c6 05 06 25 11 00 cf 	movb   $0xcf,0x112506
  100503:	c6 05 07 25 11 00 00 	movb   $0x0,0x112507
  10050a:	e9 d6 fe ff ff       	jmp    1003e5 <Intrtime+0xe1>
  10050f:	90                   	nop
  100510:	31 c0                	xor    %eax,%eax
  100512:	eb 98                	jmp    1004ac <Intrtime+0x1a8>

00100514 <initPcb>:
  100514:	55                   	push   %ebp
  100515:	89 e5                	mov    %esp,%ebp
  100517:	b8 7c 47 10 00       	mov    $0x10477c,%eax
  10051c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  100522:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100527:	3d 7c 44 11 00       	cmp    $0x11447c,%eax
  10052c:	75 ee                	jne    10051c <initPcb+0x8>
  10052e:	c7 05 7c 47 10 00 01 	movl   $0x1,0x10477c
  100535:	00 00 00 
  100538:	c7 05 6c 47 10 00 02 	movl   $0x2,0x10476c
  10053f:	00 00 00 
  100542:	c7 05 78 47 10 00 00 	movl   $0x0,0x104778
  100549:	00 00 00 
  10054c:	c7 05 70 47 10 00 0a 	movl   $0xa,0x104770
  100553:	00 00 00 
  100556:	c7 05 74 47 10 00 00 	movl   $0x0,0x104774
  10055d:	00 00 00 
  100560:	c7 05 5c 47 10 00 08 	movl   $0x8,0x10475c
  100567:	00 00 00 
  10056a:	c7 05 58 47 10 00 84 	movl   $0x100284,0x104758
  100571:	02 10 00 
  100574:	c7 05 68 47 10 00 10 	movl   $0x10,0x104768
  10057b:	00 00 00 
  10057e:	c7 05 60 47 10 00 02 	movl   $0x202,0x104760
  100585:	02 00 00 
  100588:	c7 05 64 47 10 00 00 	movl   $0x7800000,0x104764
  10058f:	00 80 07 
  100592:	c7 05 38 47 10 00 00 	movl   $0x7800000,0x104738
  100599:	00 80 07 
  10059c:	c7 05 1c 67 10 00 01 	movl   $0x1,0x10671c
  1005a3:	00 00 00 
  1005a6:	c7 05 0c 67 10 00 01 	movl   $0x1,0x10670c
  1005ad:	00 00 00 
  1005b0:	c7 05 18 67 10 00 01 	movl   $0x1,0x106718
  1005b7:	00 00 00 
  1005ba:	c7 05 10 67 10 00 0a 	movl   $0xa,0x106710
  1005c1:	00 00 00 
  1005c4:	c7 05 14 67 10 00 00 	movl   $0x0,0x106714
  1005cb:	00 00 00 
  1005ce:	c7 05 fc 66 10 00 1b 	movl   $0x1b,0x1066fc
  1005d5:	00 00 00 
  1005d8:	c7 05 f8 66 10 00 00 	movl   $0x200000,0x1066f8
  1005df:	00 20 00 
  1005e2:	c7 05 08 67 10 00 23 	movl   $0x23,0x106708
  1005e9:	00 00 00 
  1005ec:	c7 05 00 67 10 00 02 	movl   $0x202,0x106700
  1005f3:	02 00 00 
  1005f6:	c7 05 04 67 10 00 00 	movl   $0x6000000,0x106704
  1005fd:	00 00 06 
  100600:	c7 05 d8 66 10 00 00 	movl   $0x6000000,0x1066d8
  100607:	00 00 06 
  10060a:	c7 05 c0 27 10 00 01 	movl   $0x1,0x1027c0
  100611:	00 00 00 
  100614:	5d                   	pop    %ebp
  100615:	c3                   	ret    
  100616:	66 90                	xchg   %ax,%ax

00100618 <sys_fork>:
  100618:	55                   	push   %ebp
  100619:	89 e5                	mov    %esp,%ebp
  10061b:	57                   	push   %edi
  10061c:	56                   	push   %esi
  10061d:	53                   	push   %ebx
  10061e:	53                   	push   %ebx
  10061f:	a1 c0 27 10 00       	mov    0x1027c0,%eax
  100624:	89 c2                	mov    %eax,%edx
  100626:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100629:	c1 e0 06             	shl    $0x6,%eax
  10062c:	29 d0                	sub    %edx,%eax
  10062e:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100631:	c1 e3 05             	shl    $0x5,%ebx
  100634:	8d 83 20 47 10 00    	lea    0x104720(%ebx),%eax
  10063a:	b9 13 00 00 00       	mov    $0x13,%ecx
  10063f:	89 c7                	mov    %eax,%edi
  100641:	8b 75 08             	mov    0x8(%ebp),%esi
  100644:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100646:	c7 83 6c 47 10 00 02 	movl   $0x2,0x10476c(%ebx)
  10064d:	00 00 00 
  100650:	b8 1c 67 10 00       	mov    $0x10671c,%eax
  100655:	bb 01 00 00 00       	mov    $0x1,%ebx
  10065a:	66 90                	xchg   %ax,%ax
  10065c:	8b 08                	mov    (%eax),%ecx
  10065e:	85 c9                	test   %ecx,%ecx
  100660:	0f 84 4a 01 00 00    	je     1007b0 <sys_fork+0x198>
  100666:	43                   	inc    %ebx
  100667:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  10066c:	83 fb 08             	cmp    $0x8,%ebx
  10066f:	75 eb                	jne    10065c <sys_fork+0x44>
  100671:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100676:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  10067b:	89 d9                	mov    %ebx,%ecx
  10067d:	c1 e1 06             	shl    $0x6,%ecx
  100680:	29 d9                	sub    %ebx,%ecx
  100682:	8d 34 8b             	lea    (%ebx,%ecx,4),%esi
  100685:	c1 e6 05             	shl    $0x5,%esi
  100688:	8d 96 e0 27 10 00    	lea    0x1027e0(%esi),%edx
  10068e:	c7 86 6c 47 10 00 02 	movl   $0x2,0x10476c(%esi)
  100695:	00 00 00 
  100698:	89 86 78 47 10 00    	mov    %eax,0x104778(%esi)
  10069e:	c7 86 70 47 10 00 0a 	movl   $0xa,0x104770(%esi)
  1006a5:	00 00 00 
  1006a8:	c7 86 74 47 10 00 00 	movl   $0x0,0x104774(%esi)
  1006af:	00 00 00 
  1006b2:	8d be 20 47 10 00    	lea    0x104720(%esi),%edi
  1006b8:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  1006bb:	89 c8                	mov    %ecx,%eax
  1006bd:	c1 e0 06             	shl    $0x6,%eax
  1006c0:	29 c8                	sub    %ecx,%eax
  1006c2:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1006c5:	c1 e0 05             	shl    $0x5,%eax
  1006c8:	8d b0 20 47 10 00    	lea    0x104720(%eax),%esi
  1006ce:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006d3:	89 7d f0             	mov    %edi,-0x10(%ebp)
  1006d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006d8:	c7 82 6c 1f 00 00 00 	movl   $0x0,0x1f6c(%edx)
  1006df:	00 00 00 
  1006e2:	8b b0 64 47 10 00    	mov    0x104764(%eax),%esi
  1006e8:	89 b2 84 1f 00 00    	mov    %esi,0x1f84(%edx)
  1006ee:	8b 88 38 47 10 00    	mov    0x104738(%eax),%ecx
  1006f4:	89 8a 58 1f 00 00    	mov    %ecx,0x1f58(%edx)
  1006fa:	8d 8e 00 00 00 01    	lea    0x1000000(%esi),%ecx
  100700:	89 cf                	mov    %ecx,%edi
  100702:	b9 00 00 00 06       	mov    $0x6000000,%ecx
  100707:	29 f1                	sub    %esi,%ecx
  100709:	8b b0 64 47 10 00    	mov    0x104764(%eax),%esi
  10070f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100711:	b8 00 00 20 01       	mov    $0x1200000,%eax
  100716:	be 00 00 20 00       	mov    $0x200000,%esi
  10071b:	b9 00 08 00 00       	mov    $0x800,%ecx
  100720:	89 c7                	mov    %eax,%edi
  100722:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100724:	a1 c0 27 10 00       	mov    0x1027c0,%eax
  100729:	89 c1                	mov    %eax,%ecx
  10072b:	c1 e1 06             	shl    $0x6,%ecx
  10072e:	29 c1                	sub    %eax,%ecx
  100730:	8d 04 88             	lea    (%eax,%ecx,4),%eax
  100733:	c1 e0 05             	shl    $0x5,%eax
  100736:	8b 8a 98 1f 00 00    	mov    0x1f98(%edx),%ecx
  10073c:	89 88 4c 47 10 00    	mov    %ecx,0x10474c(%eax)
  100742:	89 1d c0 27 10 00    	mov    %ebx,0x1027c0
  100748:	c7 82 8c 1f 00 00 01 	movl   $0x1,0x1f8c(%edx)
  10074f:	00 00 00 
  100752:	b9 13 00 00 00       	mov    $0x13,%ecx
  100757:	8b 7d 08             	mov    0x8(%ebp),%edi
  10075a:	8b 75 f0             	mov    -0x10(%ebp),%esi
  10075d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10075f:	83 fb 01             	cmp    $0x1,%ebx
  100762:	74 6c                	je     1007d0 <sys_fork+0x1b8>
  100764:	83 fb 02             	cmp    $0x2,%ebx
  100767:	74 2f                	je     100798 <sys_fork+0x180>
  100769:	66 c7 05 8c 27 10 00 	movw   $0x37,0x10278c
  100770:	37 00 
  100772:	b8 e0 24 11 00       	mov    $0x1124e0,%eax
  100777:	66 a3 8e 27 10 00    	mov    %ax,0x10278e
  10077d:	c1 e8 10             	shr    $0x10,%eax
  100780:	66 a3 90 27 10 00    	mov    %ax,0x102790
  100786:	b8 8c 27 10 00       	mov    $0x10278c,%eax
  10078b:	0f 01 10             	lgdtl  (%eax)
  10078e:	89 d8                	mov    %ebx,%eax
  100790:	5a                   	pop    %edx
  100791:	5b                   	pop    %ebx
  100792:	5e                   	pop    %esi
  100793:	5f                   	pop    %edi
  100794:	5d                   	pop    %ebp
  100795:	c3                   	ret    
  100796:	66 90                	xchg   %ax,%ax
  100798:	a1 90 12 10 00       	mov    0x101290,%eax
  10079d:	8b 15 94 12 10 00    	mov    0x101294,%edx
  1007a3:	a3 00 25 11 00       	mov    %eax,0x112500
  1007a8:	89 15 04 25 11 00    	mov    %edx,0x112504
  1007ae:	eb b9                	jmp    100769 <sys_fork+0x151>
  1007b0:	89 d8                	mov    %ebx,%eax
  1007b2:	c1 e0 06             	shl    $0x6,%eax
  1007b5:	29 d8                	sub    %ebx,%eax
  1007b7:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1007ba:	c1 e0 05             	shl    $0x5,%eax
  1007bd:	c7 80 7c 47 10 00 01 	movl   $0x1,0x10477c(%eax)
  1007c4:	00 00 00 
  1007c7:	89 d8                	mov    %ebx,%eax
  1007c9:	e9 ad fe ff ff       	jmp    10067b <sys_fork+0x63>
  1007ce:	66 90                	xchg   %ax,%ax
  1007d0:	66 c7 05 00 25 11 00 	movw   $0xffff,0x112500
  1007d7:	ff ff 
  1007d9:	66 c7 05 02 25 11 00 	movw   $0x0,0x112502
  1007e0:	00 00 
  1007e2:	c6 05 04 25 11 00 00 	movb   $0x0,0x112504
  1007e9:	c6 05 05 25 11 00 f2 	movb   $0xf2,0x112505
  1007f0:	c6 05 06 25 11 00 cf 	movb   $0xcf,0x112506
  1007f7:	c6 05 07 25 11 00 00 	movb   $0x0,0x112507
  1007fe:	e9 66 ff ff ff       	jmp    100769 <sys_fork+0x151>
  100803:	90                   	nop

00100804 <sys_sleep>:
  100804:	55                   	push   %ebp
  100805:	89 e5                	mov    %esp,%ebp
  100807:	57                   	push   %edi
  100808:	56                   	push   %esi
  100809:	53                   	push   %ebx
  10080a:	8b 15 c0 27 10 00    	mov    0x1027c0,%edx
  100810:	89 d0                	mov    %edx,%eax
  100812:	c1 e0 06             	shl    $0x6,%eax
  100815:	29 d0                	sub    %edx,%eax
  100817:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  10081a:	c1 e3 05             	shl    $0x5,%ebx
  10081d:	8d 83 20 47 10 00    	lea    0x104720(%ebx),%eax
  100823:	b9 13 00 00 00       	mov    $0x13,%ecx
  100828:	89 c7                	mov    %eax,%edi
  10082a:	8b 75 08             	mov    0x8(%ebp),%esi
  10082d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10082f:	c7 83 6c 47 10 00 02 	movl   $0x2,0x10476c(%ebx)
  100836:	00 00 00 
  100839:	81 c3 e0 27 10 00    	add    $0x1027e0,%ebx
  10083f:	ff 8b 90 1f 00 00    	decl   0x1f90(%ebx)
  100845:	b8 0c 67 10 00       	mov    $0x10670c,%eax
  10084a:	eb 0c                	jmp    100858 <sys_sleep+0x54>
  10084c:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100851:	3d 6c 44 11 00       	cmp    $0x11446c,%eax
  100856:	74 34                	je     10088c <sys_sleep+0x88>
  100858:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  10085c:	75 2e                	jne    10088c <sys_sleep+0x88>
  10085e:	83 38 03             	cmpl   $0x3,(%eax)
  100861:	75 e9                	jne    10084c <sys_sleep+0x48>
  100863:	8b 78 08             	mov    0x8(%eax),%edi
  100866:	8d 4f ff             	lea    -0x1(%edi),%ecx
  100869:	89 48 08             	mov    %ecx,0x8(%eax)
  10086c:	85 c9                	test   %ecx,%ecx
  10086e:	7f dc                	jg     10084c <sys_sleep+0x48>
  100870:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  100876:	c7 40 04 0a 00 00 00 	movl   $0xa,0x4(%eax)
  10087d:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100882:	3d 6c 44 11 00       	cmp    $0x11446c,%eax
  100887:	75 cf                	jne    100858 <sys_sleep+0x54>
  100889:	8d 76 00             	lea    0x0(%esi),%esi
  10088c:	89 d0                	mov    %edx,%eax
  10088e:	c1 e0 06             	shl    $0x6,%eax
  100891:	29 d0                	sub    %edx,%eax
  100893:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100896:	c1 e0 05             	shl    $0x5,%eax
  100899:	8b 75 08             	mov    0x8(%ebp),%esi
  10089c:	8b 4e 20             	mov    0x20(%esi),%ecx
  10089f:	89 88 74 47 10 00    	mov    %ecx,0x104774(%eax)
  1008a5:	c7 80 6c 47 10 00 03 	movl   $0x3,0x10476c(%eax)
  1008ac:	00 00 00 
  1008af:	b9 1c 67 10 00       	mov    $0x10671c,%ecx
  1008b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1008b9:	eb 11                	jmp    1008cc <sys_sleep+0xc8>
  1008bb:	90                   	nop
  1008bc:	40                   	inc    %eax
  1008bd:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  1008c3:	83 f8 08             	cmp    $0x8,%eax
  1008c6:	0f 84 80 00 00 00    	je     10094c <sys_sleep+0x148>
  1008cc:	83 39 01             	cmpl   $0x1,(%ecx)
  1008cf:	75 eb                	jne    1008bc <sys_sleep+0xb8>
  1008d1:	83 79 f0 02          	cmpl   $0x2,-0x10(%ecx)
  1008d5:	75 e5                	jne    1008bc <sys_sleep+0xb8>
  1008d7:	39 c2                	cmp    %eax,%edx
  1008d9:	74 e1                	je     1008bc <sys_sleep+0xb8>
  1008db:	89 c2                	mov    %eax,%edx
  1008dd:	c1 e2 06             	shl    $0x6,%edx
  1008e0:	29 c2                	sub    %eax,%edx
  1008e2:	8d 34 90             	lea    (%eax,%edx,4),%esi
  1008e5:	c1 e6 05             	shl    $0x5,%esi
  1008e8:	c7 86 6c 47 10 00 01 	movl   $0x1,0x10476c(%esi)
  1008ef:	00 00 00 
  1008f2:	c7 86 70 47 10 00 0a 	movl   $0xa,0x104770(%esi)
  1008f9:	00 00 00 
  1008fc:	a3 c0 27 10 00       	mov    %eax,0x1027c0
  100901:	81 c6 20 47 10 00    	add    $0x104720,%esi
  100907:	b9 13 00 00 00       	mov    $0x13,%ecx
  10090c:	8b 7d 08             	mov    0x8(%ebp),%edi
  10090f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100911:	83 f8 01             	cmp    $0x1,%eax
  100914:	0f 85 8b 00 00 00    	jne    1009a5 <sys_sleep+0x1a1>
  10091a:	66 c7 05 00 25 11 00 	movw   $0xffff,0x112500
  100921:	ff ff 
  100923:	66 c7 05 02 25 11 00 	movw   $0x0,0x112502
  10092a:	00 00 
  10092c:	c6 05 04 25 11 00 00 	movb   $0x0,0x112504
  100933:	c6 05 05 25 11 00 f2 	movb   $0xf2,0x112505
  10093a:	c6 05 06 25 11 00 cf 	movb   $0xcf,0x112506
  100941:	c6 05 07 25 11 00 00 	movb   $0x0,0x112507
  100948:	eb 2f                	jmp    100979 <sys_sleep+0x175>
  10094a:	66 90                	xchg   %ax,%ax
  10094c:	c7 05 6c 47 10 00 01 	movl   $0x1,0x10476c
  100953:	00 00 00 
  100956:	c7 05 70 47 10 00 0a 	movl   $0xa,0x104770
  10095d:	00 00 00 
  100960:	c7 05 c0 27 10 00 00 	movl   $0x0,0x1027c0
  100967:	00 00 00 
  10096a:	be 20 47 10 00       	mov    $0x104720,%esi
  10096f:	b9 13 00 00 00       	mov    $0x13,%ecx
  100974:	8b 7d 08             	mov    0x8(%ebp),%edi
  100977:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100979:	66 c7 05 8c 27 10 00 	movw   $0x37,0x10278c
  100980:	37 00 
  100982:	b8 e0 24 11 00       	mov    $0x1124e0,%eax
  100987:	66 a3 8e 27 10 00    	mov    %ax,0x10278e
  10098d:	c1 e8 10             	shr    $0x10,%eax
  100990:	66 a3 90 27 10 00    	mov    %ax,0x102790
  100996:	b8 8c 27 10 00       	mov    $0x10278c,%eax
  10099b:	0f 01 10             	lgdtl  (%eax)
  10099e:	31 c0                	xor    %eax,%eax
  1009a0:	5b                   	pop    %ebx
  1009a1:	5e                   	pop    %esi
  1009a2:	5f                   	pop    %edi
  1009a3:	5d                   	pop    %ebp
  1009a4:	c3                   	ret    
  1009a5:	83 f8 02             	cmp    $0x2,%eax
  1009a8:	75 cf                	jne    100979 <sys_sleep+0x175>
  1009aa:	a1 90 12 10 00       	mov    0x101290,%eax
  1009af:	8b 15 94 12 10 00    	mov    0x101294,%edx
  1009b5:	a3 00 25 11 00       	mov    %eax,0x112500
  1009ba:	89 15 04 25 11 00    	mov    %edx,0x112504
  1009c0:	eb b7                	jmp    100979 <sys_sleep+0x175>
  1009c2:	66 90                	xchg   %ax,%ax

001009c4 <sys_exit>:
  1009c4:	55                   	push   %ebp
  1009c5:	89 e5                	mov    %esp,%ebp
  1009c7:	57                   	push   %edi
  1009c8:	56                   	push   %esi
  1009c9:	8b 0d c0 27 10 00    	mov    0x1027c0,%ecx
  1009cf:	89 c8                	mov    %ecx,%eax
  1009d1:	c1 e0 06             	shl    $0x6,%eax
  1009d4:	29 c8                	sub    %ecx,%eax
  1009d6:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1009d9:	c1 e0 05             	shl    $0x5,%eax
  1009dc:	c7 80 7c 47 10 00 00 	movl   $0x0,0x10477c(%eax)
  1009e3:	00 00 00 
  1009e6:	ba 1c 67 10 00       	mov    $0x10671c,%edx
  1009eb:	b8 01 00 00 00       	mov    $0x1,%eax
  1009f0:	eb 12                	jmp    100a04 <sys_exit+0x40>
  1009f2:	66 90                	xchg   %ax,%ax
  1009f4:	40                   	inc    %eax
  1009f5:	81 c2 a0 1f 00 00    	add    $0x1fa0,%edx
  1009fb:	83 f8 08             	cmp    $0x8,%eax
  1009fe:	0f 84 d8 00 00 00    	je     100adc <sys_exit+0x118>
  100a04:	83 3a 01             	cmpl   $0x1,(%edx)
  100a07:	75 eb                	jne    1009f4 <sys_exit+0x30>
  100a09:	83 7a f0 02          	cmpl   $0x2,-0x10(%edx)
  100a0d:	75 e5                	jne    1009f4 <sys_exit+0x30>
  100a0f:	39 c1                	cmp    %eax,%ecx
  100a11:	74 e1                	je     1009f4 <sys_exit+0x30>
  100a13:	90                   	nop
  100a14:	89 c2                	mov    %eax,%edx
  100a16:	c1 e2 06             	shl    $0x6,%edx
  100a19:	29 c2                	sub    %eax,%edx
  100a1b:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100a1e:	c1 e2 05             	shl    $0x5,%edx
  100a21:	c7 82 6c 47 10 00 01 	movl   $0x1,0x10476c(%edx)
  100a28:	00 00 00 
  100a2b:	c7 82 70 47 10 00 0a 	movl   $0xa,0x104770(%edx)
  100a32:	00 00 00 
  100a35:	a3 c0 27 10 00       	mov    %eax,0x1027c0
  100a3a:	ba 0c 67 10 00       	mov    $0x10670c,%edx
  100a3f:	eb 11                	jmp    100a52 <sys_exit+0x8e>
  100a41:	8d 76 00             	lea    0x0(%esi),%esi
  100a44:	81 c2 a0 1f 00 00    	add    $0x1fa0,%edx
  100a4a:	81 fa 6c 44 11 00    	cmp    $0x11446c,%edx
  100a50:	74 36                	je     100a88 <sys_exit+0xc4>
  100a52:	83 7a 10 01          	cmpl   $0x1,0x10(%edx)
  100a56:	75 30                	jne    100a88 <sys_exit+0xc4>
  100a58:	83 3a 03             	cmpl   $0x3,(%edx)
  100a5b:	75 e7                	jne    100a44 <sys_exit+0x80>
  100a5d:	8b 7a 08             	mov    0x8(%edx),%edi
  100a60:	8d 4f ff             	lea    -0x1(%edi),%ecx
  100a63:	89 4a 08             	mov    %ecx,0x8(%edx)
  100a66:	85 c9                	test   %ecx,%ecx
  100a68:	7f da                	jg     100a44 <sys_exit+0x80>
  100a6a:	c7 02 02 00 00 00    	movl   $0x2,(%edx)
  100a70:	c7 42 04 0a 00 00 00 	movl   $0xa,0x4(%edx)
  100a77:	81 c2 a0 1f 00 00    	add    $0x1fa0,%edx
  100a7d:	81 fa 6c 44 11 00    	cmp    $0x11446c,%edx
  100a83:	75 cd                	jne    100a52 <sys_exit+0x8e>
  100a85:	8d 76 00             	lea    0x0(%esi),%esi
  100a88:	89 c2                	mov    %eax,%edx
  100a8a:	c1 e2 06             	shl    $0x6,%edx
  100a8d:	29 c2                	sub    %eax,%edx
  100a8f:	8d 34 90             	lea    (%eax,%edx,4),%esi
  100a92:	c1 e6 05             	shl    $0x5,%esi
  100a95:	81 c6 20 47 10 00    	add    $0x104720,%esi
  100a9b:	b9 13 00 00 00       	mov    $0x13,%ecx
  100aa0:	8b 7d 08             	mov    0x8(%ebp),%edi
  100aa3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100aa5:	83 f8 01             	cmp    $0x1,%eax
  100aa8:	74 52                	je     100afc <sys_exit+0x138>
  100aaa:	83 f8 02             	cmp    $0x2,%eax
  100aad:	74 35                	je     100ae4 <sys_exit+0x120>
  100aaf:	66 c7 05 8c 27 10 00 	movw   $0x37,0x10278c
  100ab6:	37 00 
  100ab8:	b8 e0 24 11 00       	mov    $0x1124e0,%eax
  100abd:	66 a3 8e 27 10 00    	mov    %ax,0x10278e
  100ac3:	c1 e8 10             	shr    $0x10,%eax
  100ac6:	66 a3 90 27 10 00    	mov    %ax,0x102790
  100acc:	b8 8c 27 10 00       	mov    $0x10278c,%eax
  100ad1:	0f 01 10             	lgdtl  (%eax)
  100ad4:	31 c0                	xor    %eax,%eax
  100ad6:	5e                   	pop    %esi
  100ad7:	5f                   	pop    %edi
  100ad8:	5d                   	pop    %ebp
  100ad9:	c3                   	ret    
  100ada:	66 90                	xchg   %ax,%ax
  100adc:	31 c0                	xor    %eax,%eax
  100ade:	e9 31 ff ff ff       	jmp    100a14 <sys_exit+0x50>
  100ae3:	90                   	nop
  100ae4:	a1 90 12 10 00       	mov    0x101290,%eax
  100ae9:	8b 15 94 12 10 00    	mov    0x101294,%edx
  100aef:	a3 00 25 11 00       	mov    %eax,0x112500
  100af4:	89 15 04 25 11 00    	mov    %edx,0x112504
  100afa:	eb b3                	jmp    100aaf <sys_exit+0xeb>
  100afc:	66 c7 05 00 25 11 00 	movw   $0xffff,0x112500
  100b03:	ff ff 
  100b05:	66 c7 05 02 25 11 00 	movw   $0x0,0x112502
  100b0c:	00 00 
  100b0e:	c6 05 04 25 11 00 00 	movb   $0x0,0x112504
  100b15:	c6 05 05 25 11 00 f2 	movb   $0xf2,0x112505
  100b1c:	c6 05 06 25 11 00 cf 	movb   $0xcf,0x112506
  100b23:	c6 05 07 25 11 00 00 	movb   $0x0,0x112507
  100b2a:	eb 83                	jmp    100aaf <sys_exit+0xeb>

00100b2c <waitDisk>:
  100b2c:	55                   	push   %ebp
  100b2d:	89 e5                	mov    %esp,%ebp
  100b2f:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100b34:	ec                   	in     (%dx),%al
  100b35:	83 e0 c0             	and    $0xffffffc0,%eax
  100b38:	3c 40                	cmp    $0x40,%al
  100b3a:	75 f8                	jne    100b34 <waitDisk+0x8>
  100b3c:	5d                   	pop    %ebp
  100b3d:	c3                   	ret    
  100b3e:	66 90                	xchg   %ax,%ax

00100b40 <readSect>:
  100b40:	55                   	push   %ebp
  100b41:	89 e5                	mov    %esp,%ebp
  100b43:	53                   	push   %ebx
  100b44:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100b47:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100b4c:	ec                   	in     (%dx),%al
  100b4d:	83 e0 c0             	and    $0xffffffc0,%eax
  100b50:	3c 40                	cmp    $0x40,%al
  100b52:	75 f8                	jne    100b4c <readSect+0xc>
  100b54:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100b59:	b0 01                	mov    $0x1,%al
  100b5b:	ee                   	out    %al,(%dx)
  100b5c:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100b61:	88 c8                	mov    %cl,%al
  100b63:	ee                   	out    %al,(%dx)
  100b64:	89 c8                	mov    %ecx,%eax
  100b66:	c1 f8 08             	sar    $0x8,%eax
  100b69:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100b6e:	ee                   	out    %al,(%dx)
  100b6f:	89 c8                	mov    %ecx,%eax
  100b71:	c1 f8 10             	sar    $0x10,%eax
  100b74:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100b79:	ee                   	out    %al,(%dx)
  100b7a:	89 c8                	mov    %ecx,%eax
  100b7c:	c1 f8 18             	sar    $0x18,%eax
  100b7f:	83 c8 e0             	or     $0xffffffe0,%eax
  100b82:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100b87:	ee                   	out    %al,(%dx)
  100b88:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100b8d:	b0 20                	mov    $0x20,%al
  100b8f:	ee                   	out    %al,(%dx)
  100b90:	ec                   	in     (%dx),%al
  100b91:	83 e0 c0             	and    $0xffffffc0,%eax
  100b94:	3c 40                	cmp    $0x40,%al
  100b96:	75 f8                	jne    100b90 <readSect+0x50>
  100b98:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100b9b:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100ba1:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100ba6:	66 90                	xchg   %ax,%ax
  100ba8:	ed                   	in     (%dx),%eax
  100ba9:	89 01                	mov    %eax,(%ecx)
  100bab:	83 c1 04             	add    $0x4,%ecx
  100bae:	39 d9                	cmp    %ebx,%ecx
  100bb0:	75 f6                	jne    100ba8 <readSect+0x68>
  100bb2:	5b                   	pop    %ebx
  100bb3:	5d                   	pop    %ebp
  100bb4:	c3                   	ret    
  100bb5:	8d 76 00             	lea    0x0(%esi),%esi

00100bb8 <initSeg>:
  100bb8:	55                   	push   %ebp
  100bb9:	89 e5                	mov    %esp,%ebp
  100bbb:	b9 e0 24 11 00       	mov    $0x1124e0,%ecx
  100bc0:	66 c7 05 e8 24 11 00 	movw   $0xffff,0x1124e8
  100bc7:	ff ff 
  100bc9:	66 c7 05 ea 24 11 00 	movw   $0x0,0x1124ea
  100bd0:	00 00 
  100bd2:	c6 05 ec 24 11 00 00 	movb   $0x0,0x1124ec
  100bd9:	c6 05 ed 24 11 00 9a 	movb   $0x9a,0x1124ed
  100be0:	c6 05 ee 24 11 00 cf 	movb   $0xcf,0x1124ee
  100be7:	c6 05 ef 24 11 00 00 	movb   $0x0,0x1124ef
  100bee:	66 c7 05 f0 24 11 00 	movw   $0xffff,0x1124f0
  100bf5:	ff ff 
  100bf7:	66 c7 05 f2 24 11 00 	movw   $0x0,0x1124f2
  100bfe:	00 00 
  100c00:	c6 05 f4 24 11 00 00 	movb   $0x0,0x1124f4
  100c07:	c6 05 f5 24 11 00 92 	movb   $0x92,0x1124f5
  100c0e:	c6 05 f6 24 11 00 cf 	movb   $0xcf,0x1124f6
  100c15:	c6 05 f7 24 11 00 00 	movb   $0x0,0x1124f7
  100c1c:	66 c7 05 f8 24 11 00 	movw   $0xffff,0x1124f8
  100c23:	ff ff 
  100c25:	66 c7 05 fa 24 11 00 	movw   $0x0,0x1124fa
  100c2c:	00 00 
  100c2e:	c6 05 fc 24 11 00 00 	movb   $0x0,0x1124fc
  100c35:	c6 05 fd 24 11 00 fa 	movb   $0xfa,0x1124fd
  100c3c:	c6 05 fe 24 11 00 cf 	movb   $0xcf,0x1124fe
  100c43:	c6 05 ff 24 11 00 00 	movb   $0x0,0x1124ff
  100c4a:	66 c7 05 00 25 11 00 	movw   $0xffff,0x112500
  100c51:	ff ff 
  100c53:	66 c7 05 02 25 11 00 	movw   $0x0,0x112502
  100c5a:	00 00 
  100c5c:	c6 05 04 25 11 00 00 	movb   $0x0,0x112504
  100c63:	c6 05 05 25 11 00 f2 	movb   $0xf2,0x112505
  100c6a:	c6 05 06 25 11 00 cf 	movb   $0xcf,0x112506
  100c71:	c6 05 07 25 11 00 00 	movb   $0x0,0x112507
  100c78:	66 c7 05 08 25 11 00 	movw   $0x63,0x112508
  100c7f:	63 00 
  100c81:	b8 20 25 11 00       	mov    $0x112520,%eax
  100c86:	66 a3 0a 25 11 00    	mov    %ax,0x11250a
  100c8c:	89 c2                	mov    %eax,%edx
  100c8e:	c1 ea 10             	shr    $0x10,%edx
  100c91:	88 15 0c 25 11 00    	mov    %dl,0x11250c
  100c97:	c6 05 0d 25 11 00 89 	movb   $0x89,0x11250d
  100c9e:	c6 05 0e 25 11 00 40 	movb   $0x40,0x11250e
  100ca5:	c1 e8 18             	shr    $0x18,%eax
  100ca8:	a2 0f 25 11 00       	mov    %al,0x11250f
  100cad:	a1 98 12 10 00       	mov    0x101298,%eax
  100cb2:	8b 15 9c 12 10 00    	mov    0x10129c,%edx
  100cb8:	a3 10 25 11 00       	mov    %eax,0x112510
  100cbd:	89 15 14 25 11 00    	mov    %edx,0x112514
  100cc3:	66 c7 05 94 27 10 00 	movw   $0x37,0x102794
  100cca:	37 00 
  100ccc:	66 89 0d 96 27 10 00 	mov    %cx,0x102796
  100cd3:	c1 e9 10             	shr    $0x10,%ecx
  100cd6:	66 89 0d 98 27 10 00 	mov    %cx,0x102798
  100cdd:	b8 94 27 10 00       	mov    $0x102794,%eax
  100ce2:	0f 01 10             	lgdtl  (%eax)
  100ce5:	c7 05 28 25 11 00 10 	movl   $0x10,0x112528
  100cec:	00 00 00 
  100cef:	c7 05 24 25 11 00 00 	movl   $0x8000000,0x112524
  100cf6:	00 00 08 
  100cf9:	b8 28 00 00 00       	mov    $0x28,%eax
  100cfe:	0f 00 d8             	ltr    %ax
  100d01:	66 b8 10 00          	mov    $0x10,%ax
  100d05:	8e d8                	mov    %eax,%ds
  100d07:	8e c0                	mov    %eax,%es
  100d09:	8e d0                	mov    %eax,%ss
  100d0b:	8e e0                	mov    %eax,%fs
  100d0d:	66 b8 30 00          	mov    $0x30,%ax
  100d11:	8e e8                	mov    %eax,%gs
  100d13:	31 c0                	xor    %eax,%eax
  100d15:	0f 00 d0             	lldt   %ax
  100d18:	5d                   	pop    %ebp
  100d19:	c3                   	ret    
  100d1a:	66 90                	xchg   %ax,%ax

00100d1c <enterUserSpace>:
  100d1c:	55                   	push   %ebp
  100d1d:	89 e5                	mov    %esp,%ebp
  100d1f:	83 ec 10             	sub    $0x10,%esp
  100d22:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
  100d29:	66 6a 23             	pushw  $0x23
  100d2c:	68 00 00 00 06       	push   $0x6000000
  100d31:	ff 75 fc             	pushl  -0x4(%ebp)
  100d34:	6a 1b                	push   $0x1b
  100d36:	ff 75 08             	pushl  0x8(%ebp)
  100d39:	fb                   	sti    
  100d3a:	cf                   	iret   
  100d3b:	c9                   	leave  
  100d3c:	c3                   	ret    
  100d3d:	8d 76 00             	lea    0x0(%esi),%esi

00100d40 <loadUMain>:
  100d40:	55                   	push   %ebp
  100d41:	89 e5                	mov    %esp,%ebp
  100d43:	57                   	push   %edi
  100d44:	56                   	push   %esi
  100d45:	53                   	push   %ebx
  100d46:	81 ec 04 90 01 00    	sub    $0x19004,%esp
  100d4c:	be c9 00 00 00       	mov    $0xc9,%esi
  100d51:	8d 9d f4 6f fe ff    	lea    -0x1900c(%ebp),%ebx
  100d57:	8d bd f4 87 fe ff    	lea    -0x1780c(%ebp),%edi
  100d5d:	8d 76 00             	lea    0x0(%esi),%esi
  100d60:	56                   	push   %esi
  100d61:	53                   	push   %ebx
  100d62:	e8 d9 fd ff ff       	call   100b40 <readSect>
  100d67:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100d6d:	46                   	inc    %esi
  100d6e:	5a                   	pop    %edx
  100d6f:	59                   	pop    %ecx
  100d70:	39 fb                	cmp    %edi,%ebx
  100d72:	75 ec                	jne    100d60 <loadUMain+0x20>
  100d74:	8d 95 f4 6f fe ff    	lea    -0x1900c(%ebp),%edx
  100d7a:	03 95 10 70 fe ff    	add    -0x18ff0(%ebp),%edx
  100d80:	0f b7 85 20 70 fe ff 	movzwl -0x18fe0(%ebp),%eax
  100d87:	89 c1                	mov    %eax,%ecx
  100d89:	c1 e0 05             	shl    $0x5,%eax
  100d8c:	01 d0                	add    %edx,%eax
  100d8e:	89 85 f0 6f fe ff    	mov    %eax,-0x19010(%ebp)
  100d94:	39 c2                	cmp    %eax,%edx
  100d96:	73 67                	jae    100dff <loadUMain+0xbf>
  100d98:	31 c0                	xor    %eax,%eax
  100d9a:	66 90                	xchg   %ax,%ax
  100d9c:	31 db                	xor    %ebx,%ebx
  100d9e:	66 85 c9             	test   %cx,%cx
  100da1:	75 14                	jne    100db7 <loadUMain+0x77>
  100da3:	eb 47                	jmp    100dec <loadUMain+0xac>
  100da5:	8d 76 00             	lea    0x0(%esi),%esi
  100da8:	43                   	inc    %ebx
  100da9:	83 c2 20             	add    $0x20,%edx
  100dac:	0f b7 8d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ecx
  100db3:	39 d9                	cmp    %ebx,%ecx
  100db5:	7e 35                	jle    100dec <loadUMain+0xac>
  100db7:	83 3a 01             	cmpl   $0x1,(%edx)
  100dba:	75 ec                	jne    100da8 <loadUMain+0x68>
  100dbc:	8d b5 f4 6f fe ff    	lea    -0x1900c(%ebp),%esi
  100dc2:	03 72 04             	add    0x4(%edx),%esi
  100dc5:	8b 4a 14             	mov    0x14(%edx),%ecx
  100dc8:	8b 7a 08             	mov    0x8(%edx),%edi
  100dcb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100dcd:	8b 72 10             	mov    0x10(%edx),%esi
  100dd0:	8b 4a 14             	mov    0x14(%edx),%ecx
  100dd3:	29 f1                	sub    %esi,%ecx
  100dd5:	03 72 08             	add    0x8(%edx),%esi
  100dd8:	89 f7                	mov    %esi,%edi
  100dda:	f3 aa                	rep stos %al,%es:(%edi)
  100ddc:	43                   	inc    %ebx
  100ddd:	83 c2 20             	add    $0x20,%edx
  100de0:	0f b7 8d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ecx
  100de7:	39 d9                	cmp    %ebx,%ecx
  100de9:	7f cc                	jg     100db7 <loadUMain+0x77>
  100deb:	90                   	nop
  100dec:	83 c2 20             	add    $0x20,%edx
  100def:	39 95 f0 6f fe ff    	cmp    %edx,-0x19010(%ebp)
  100df5:	76 08                	jbe    100dff <loadUMain+0xbf>
  100df7:	8b 8d 20 70 fe ff    	mov    -0x18fe0(%ebp),%ecx
  100dfd:	eb 9d                	jmp    100d9c <loadUMain+0x5c>
  100dff:	ff b5 0c 70 fe ff    	pushl  -0x18ff4(%ebp)
  100e05:	e8 12 ff ff ff       	call   100d1c <enterUserSpace>
  100e0a:	58                   	pop    %eax
  100e0b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100e0e:	5b                   	pop    %ebx
  100e0f:	5e                   	pop    %esi
  100e10:	5f                   	pop    %edi
  100e11:	5d                   	pop    %ebp
  100e12:	c3                   	ret    
  100e13:	90                   	nop

00100e14 <initIdt>:
  100e14:	55                   	push   %ebp
  100e15:	89 e5                	mov    %esp,%ebp
  100e17:	53                   	push   %ebx
  100e18:	ba fd 11 10 00       	mov    $0x1011fd,%edx
  100e1d:	89 d3                	mov    %edx,%ebx
  100e1f:	c1 ea 10             	shr    $0x10,%edx
  100e22:	b9 a0 2d 11 00       	mov    $0x112da0,%ecx
  100e27:	b8 a0 25 11 00       	mov    $0x1125a0,%eax
  100e2c:	66 89 18             	mov    %bx,(%eax)
  100e2f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100e35:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100e39:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100e3d:	66 89 50 06          	mov    %dx,0x6(%eax)
  100e41:	83 c0 08             	add    $0x8,%eax
  100e44:	39 c1                	cmp    %eax,%ecx
  100e46:	75 e4                	jne    100e2c <initIdt+0x18>
  100e48:	b8 03 12 10 00       	mov    $0x101203,%eax
  100e4d:	66 a3 a0 25 11 00    	mov    %ax,0x1125a0
  100e53:	66 c7 05 a2 25 11 00 	movw   $0x8,0x1125a2
  100e5a:	08 00 
  100e5c:	c6 05 a4 25 11 00 00 	movb   $0x0,0x1125a4
  100e63:	c6 05 a5 25 11 00 8f 	movb   $0x8f,0x1125a5
  100e6a:	c1 e8 10             	shr    $0x10,%eax
  100e6d:	66 a3 a6 25 11 00    	mov    %ax,0x1125a6
  100e73:	b8 09 12 10 00       	mov    $0x101209,%eax
  100e78:	66 a3 a8 25 11 00    	mov    %ax,0x1125a8
  100e7e:	66 c7 05 aa 25 11 00 	movw   $0x8,0x1125aa
  100e85:	08 00 
  100e87:	c6 05 ac 25 11 00 00 	movb   $0x0,0x1125ac
  100e8e:	c6 05 ad 25 11 00 8f 	movb   $0x8f,0x1125ad
  100e95:	c1 e8 10             	shr    $0x10,%eax
  100e98:	66 a3 ae 25 11 00    	mov    %ax,0x1125ae
  100e9e:	b8 0f 12 10 00       	mov    $0x10120f,%eax
  100ea3:	66 a3 b0 25 11 00    	mov    %ax,0x1125b0
  100ea9:	66 c7 05 b2 25 11 00 	movw   $0x8,0x1125b2
  100eb0:	08 00 
  100eb2:	c6 05 b4 25 11 00 00 	movb   $0x0,0x1125b4
  100eb9:	c6 05 b5 25 11 00 8f 	movb   $0x8f,0x1125b5
  100ec0:	c1 e8 10             	shr    $0x10,%eax
  100ec3:	66 a3 b6 25 11 00    	mov    %ax,0x1125b6
  100ec9:	b8 15 12 10 00       	mov    $0x101215,%eax
  100ece:	66 a3 b8 25 11 00    	mov    %ax,0x1125b8
  100ed4:	66 c7 05 ba 25 11 00 	movw   $0x8,0x1125ba
  100edb:	08 00 
  100edd:	c6 05 bc 25 11 00 00 	movb   $0x0,0x1125bc
  100ee4:	c6 05 bd 25 11 00 8f 	movb   $0x8f,0x1125bd
  100eeb:	c1 e8 10             	shr    $0x10,%eax
  100eee:	66 a3 be 25 11 00    	mov    %ax,0x1125be
  100ef4:	b8 1b 12 10 00       	mov    $0x10121b,%eax
  100ef9:	66 a3 c0 25 11 00    	mov    %ax,0x1125c0
  100eff:	66 c7 05 c2 25 11 00 	movw   $0x8,0x1125c2
  100f06:	08 00 
  100f08:	c6 05 c4 25 11 00 00 	movb   $0x0,0x1125c4
  100f0f:	c6 05 c5 25 11 00 8f 	movb   $0x8f,0x1125c5
  100f16:	c1 e8 10             	shr    $0x10,%eax
  100f19:	66 a3 c6 25 11 00    	mov    %ax,0x1125c6
  100f1f:	b8 21 12 10 00       	mov    $0x101221,%eax
  100f24:	66 a3 c8 25 11 00    	mov    %ax,0x1125c8
  100f2a:	66 c7 05 ca 25 11 00 	movw   $0x8,0x1125ca
  100f31:	08 00 
  100f33:	c6 05 cc 25 11 00 00 	movb   $0x0,0x1125cc
  100f3a:	c6 05 cd 25 11 00 8f 	movb   $0x8f,0x1125cd
  100f41:	c1 e8 10             	shr    $0x10,%eax
  100f44:	66 a3 ce 25 11 00    	mov    %ax,0x1125ce
  100f4a:	b8 27 12 10 00       	mov    $0x101227,%eax
  100f4f:	66 a3 d0 25 11 00    	mov    %ax,0x1125d0
  100f55:	66 c7 05 d2 25 11 00 	movw   $0x8,0x1125d2
  100f5c:	08 00 
  100f5e:	c6 05 d4 25 11 00 00 	movb   $0x0,0x1125d4
  100f65:	c6 05 d5 25 11 00 8f 	movb   $0x8f,0x1125d5
  100f6c:	c1 e8 10             	shr    $0x10,%eax
  100f6f:	66 a3 d6 25 11 00    	mov    %ax,0x1125d6
  100f75:	b8 2d 12 10 00       	mov    $0x10122d,%eax
  100f7a:	66 a3 d8 25 11 00    	mov    %ax,0x1125d8
  100f80:	66 c7 05 da 25 11 00 	movw   $0x8,0x1125da
  100f87:	08 00 
  100f89:	c6 05 dc 25 11 00 00 	movb   $0x0,0x1125dc
  100f90:	c6 05 dd 25 11 00 8f 	movb   $0x8f,0x1125dd
  100f97:	c1 e8 10             	shr    $0x10,%eax
  100f9a:	66 a3 de 25 11 00    	mov    %ax,0x1125de
  100fa0:	b8 33 12 10 00       	mov    $0x101233,%eax
  100fa5:	66 a3 e0 25 11 00    	mov    %ax,0x1125e0
  100fab:	66 c7 05 e2 25 11 00 	movw   $0x8,0x1125e2
  100fb2:	08 00 
  100fb4:	c6 05 e4 25 11 00 00 	movb   $0x0,0x1125e4
  100fbb:	c6 05 e5 25 11 00 8f 	movb   $0x8f,0x1125e5
  100fc2:	c1 e8 10             	shr    $0x10,%eax
  100fc5:	66 a3 e6 25 11 00    	mov    %ax,0x1125e6
  100fcb:	b8 37 12 10 00       	mov    $0x101237,%eax
  100fd0:	66 a3 e8 25 11 00    	mov    %ax,0x1125e8
  100fd6:	66 c7 05 ea 25 11 00 	movw   $0x8,0x1125ea
  100fdd:	08 00 
  100fdf:	c6 05 ec 25 11 00 00 	movb   $0x0,0x1125ec
  100fe6:	c6 05 ed 25 11 00 8f 	movb   $0x8f,0x1125ed
  100fed:	c1 e8 10             	shr    $0x10,%eax
  100ff0:	66 a3 ee 25 11 00    	mov    %ax,0x1125ee
  100ff6:	b8 3d 12 10 00       	mov    $0x10123d,%eax
  100ffb:	66 a3 f0 25 11 00    	mov    %ax,0x1125f0
  101001:	66 c7 05 f2 25 11 00 	movw   $0x8,0x1125f2
  101008:	08 00 
  10100a:	c6 05 f4 25 11 00 00 	movb   $0x0,0x1125f4
  101011:	c6 05 f5 25 11 00 8f 	movb   $0x8f,0x1125f5
  101018:	c1 e8 10             	shr    $0x10,%eax
  10101b:	66 a3 f6 25 11 00    	mov    %ax,0x1125f6
  101021:	b8 41 12 10 00       	mov    $0x101241,%eax
  101026:	66 a3 f8 25 11 00    	mov    %ax,0x1125f8
  10102c:	66 c7 05 fa 25 11 00 	movw   $0x8,0x1125fa
  101033:	08 00 
  101035:	c6 05 fc 25 11 00 00 	movb   $0x0,0x1125fc
  10103c:	c6 05 fd 25 11 00 8f 	movb   $0x8f,0x1125fd
  101043:	c1 e8 10             	shr    $0x10,%eax
  101046:	66 a3 fe 25 11 00    	mov    %ax,0x1125fe
  10104c:	b8 45 12 10 00       	mov    $0x101245,%eax
  101051:	66 a3 00 26 11 00    	mov    %ax,0x112600
  101057:	66 c7 05 02 26 11 00 	movw   $0x8,0x112602
  10105e:	08 00 
  101060:	c6 05 04 26 11 00 00 	movb   $0x0,0x112604
  101067:	c6 05 05 26 11 00 8f 	movb   $0x8f,0x112605
  10106e:	c1 e8 10             	shr    $0x10,%eax
  101071:	66 a3 06 26 11 00    	mov    %ax,0x112606
  101077:	b8 49 12 10 00       	mov    $0x101249,%eax
  10107c:	66 a3 10 26 11 00    	mov    %ax,0x112610
  101082:	66 c7 05 12 26 11 00 	movw   $0x8,0x112612
  101089:	08 00 
  10108b:	c6 05 14 26 11 00 00 	movb   $0x0,0x112614
  101092:	c6 05 15 26 11 00 8f 	movb   $0x8f,0x112615
  101099:	c1 e8 10             	shr    $0x10,%eax
  10109c:	66 a3 16 26 11 00    	mov    %ax,0x112616
  1010a2:	b8 4d 12 10 00       	mov    $0x10124d,%eax
  1010a7:	66 a3 08 26 11 00    	mov    %ax,0x112608
  1010ad:	66 c7 05 0a 26 11 00 	movw   $0x8,0x11260a
  1010b4:	08 00 
  1010b6:	c6 05 0c 26 11 00 00 	movb   $0x0,0x11260c
  1010bd:	c6 05 0d 26 11 00 8f 	movb   $0x8f,0x11260d
  1010c4:	c1 e8 10             	shr    $0x10,%eax
  1010c7:	66 a3 0e 26 11 00    	mov    %ax,0x11260e
  1010cd:	b8 51 12 10 00       	mov    $0x101251,%eax
  1010d2:	66 a3 a0 26 11 00    	mov    %ax,0x1126a0
  1010d8:	66 c7 05 a2 26 11 00 	movw   $0x8,0x1126a2
  1010df:	08 00 
  1010e1:	c6 05 a4 26 11 00 00 	movb   $0x0,0x1126a4
  1010e8:	c6 05 a5 26 11 00 ee 	movb   $0xee,0x1126a5
  1010ef:	c1 e8 10             	shr    $0x10,%eax
  1010f2:	66 a3 a6 26 11 00    	mov    %ax,0x1126a6
  1010f8:	b8 57 12 10 00       	mov    $0x101257,%eax
  1010fd:	66 a3 a0 29 11 00    	mov    %ax,0x1129a0
  101103:	66 c7 05 a2 29 11 00 	movw   $0x8,0x1129a2
  10110a:	08 00 
  10110c:	c6 05 a4 29 11 00 00 	movb   $0x0,0x1129a4
  101113:	c6 05 a5 29 11 00 ee 	movb   $0xee,0x1129a5
  10111a:	c1 e8 10             	shr    $0x10,%eax
  10111d:	66 a3 a6 29 11 00    	mov    %ax,0x1129a6
  101123:	66 c7 05 9c 27 10 00 	movw   $0x7ff,0x10279c
  10112a:	ff 07 
  10112c:	b8 a0 25 11 00       	mov    $0x1125a0,%eax
  101131:	66 a3 9e 27 10 00    	mov    %ax,0x10279e
  101137:	c1 e8 10             	shr    $0x10,%eax
  10113a:	66 a3 a0 27 10 00    	mov    %ax,0x1027a0
  101140:	b8 9c 27 10 00       	mov    $0x10279c,%eax
  101145:	0f 01 18             	lidtl  (%eax)
  101148:	5b                   	pop    %ebx
  101149:	5d                   	pop    %ebp
  10114a:	c3                   	ret    
  10114b:	90                   	nop

0010114c <initSerial>:
  10114c:	55                   	push   %ebp
  10114d:	89 e5                	mov    %esp,%ebp
  10114f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  101154:	31 c0                	xor    %eax,%eax
  101156:	ee                   	out    %al,(%dx)
  101157:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10115c:	b0 80                	mov    $0x80,%al
  10115e:	ee                   	out    %al,(%dx)
  10115f:	ba f8 03 00 00       	mov    $0x3f8,%edx
  101164:	b0 01                	mov    $0x1,%al
  101166:	ee                   	out    %al,(%dx)
  101167:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10116c:	31 c0                	xor    %eax,%eax
  10116e:	ee                   	out    %al,(%dx)
  10116f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  101174:	b0 03                	mov    $0x3,%al
  101176:	ee                   	out    %al,(%dx)
  101177:	ba fa 03 00 00       	mov    $0x3fa,%edx
  10117c:	b0 c7                	mov    $0xc7,%al
  10117e:	ee                   	out    %al,(%dx)
  10117f:	ba fc 03 00 00       	mov    $0x3fc,%edx
  101184:	b0 0b                	mov    $0xb,%al
  101186:	ee                   	out    %al,(%dx)
  101187:	5d                   	pop    %ebp
  101188:	c3                   	ret    
  101189:	8d 76 00             	lea    0x0(%esi),%esi

0010118c <putChar>:
  10118c:	55                   	push   %ebp
  10118d:	89 e5                	mov    %esp,%ebp
  10118f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  101192:	ba fd 03 00 00       	mov    $0x3fd,%edx
  101197:	90                   	nop
  101198:	ec                   	in     (%dx),%al
  101199:	a8 20                	test   $0x20,%al
  10119b:	74 fb                	je     101198 <putChar+0xc>
  10119d:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1011a2:	88 c8                	mov    %cl,%al
  1011a4:	ee                   	out    %al,(%dx)
  1011a5:	5d                   	pop    %ebp
  1011a6:	c3                   	ret    
  1011a7:	90                   	nop

001011a8 <initIntr>:
  1011a8:	55                   	push   %ebp
  1011a9:	89 e5                	mov    %esp,%ebp
  1011ab:	ba 21 00 00 00       	mov    $0x21,%edx
  1011b0:	b0 ff                	mov    $0xff,%al
  1011b2:	ee                   	out    %al,(%dx)
  1011b3:	ba a1 00 00 00       	mov    $0xa1,%edx
  1011b8:	ee                   	out    %al,(%dx)
  1011b9:	ba 20 00 00 00       	mov    $0x20,%edx
  1011be:	b0 11                	mov    $0x11,%al
  1011c0:	ee                   	out    %al,(%dx)
  1011c1:	ba 21 00 00 00       	mov    $0x21,%edx
  1011c6:	b0 20                	mov    $0x20,%al
  1011c8:	ee                   	out    %al,(%dx)
  1011c9:	b0 04                	mov    $0x4,%al
  1011cb:	ee                   	out    %al,(%dx)
  1011cc:	b0 03                	mov    $0x3,%al
  1011ce:	ee                   	out    %al,(%dx)
  1011cf:	ba a0 00 00 00       	mov    $0xa0,%edx
  1011d4:	b0 11                	mov    $0x11,%al
  1011d6:	ee                   	out    %al,(%dx)
  1011d7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1011dc:	b0 28                	mov    $0x28,%al
  1011de:	ee                   	out    %al,(%dx)
  1011df:	b0 02                	mov    $0x2,%al
  1011e1:	ee                   	out    %al,(%dx)
  1011e2:	b0 03                	mov    $0x3,%al
  1011e4:	ee                   	out    %al,(%dx)
  1011e5:	ba 20 00 00 00       	mov    $0x20,%edx
  1011ea:	b0 68                	mov    $0x68,%al
  1011ec:	ee                   	out    %al,(%dx)
  1011ed:	b0 0a                	mov    $0xa,%al
  1011ef:	ee                   	out    %al,(%dx)
  1011f0:	ba a0 00 00 00       	mov    $0xa0,%edx
  1011f5:	b0 68                	mov    $0x68,%al
  1011f7:	ee                   	out    %al,(%dx)
  1011f8:	b0 0a                	mov    $0xa,%al
  1011fa:	ee                   	out    %al,(%dx)
  1011fb:	5d                   	pop    %ebp
  1011fc:	c3                   	ret    

001011fd <irqEmpty>:
  1011fd:	6a 00                	push   $0x0
  1011ff:	6a ff                	push   $0xffffffff
  101201:	eb 5d                	jmp    101260 <asmDoIrq>

00101203 <irqDivError>:
  101203:	6a 00                	push   $0x0
  101205:	6a 00                	push   $0x0
  101207:	eb 57                	jmp    101260 <asmDoIrq>

00101209 <irqStepOver>:
  101209:	6a 00                	push   $0x0
  10120b:	6a 01                	push   $0x1
  10120d:	eb 51                	jmp    101260 <asmDoIrq>

0010120f <irqNMIInterrupt>:
  10120f:	6a 00                	push   $0x0
  101211:	6a 02                	push   $0x2
  101213:	eb 4b                	jmp    101260 <asmDoIrq>

00101215 <irqBreakPoint>:
  101215:	6a 00                	push   $0x0
  101217:	6a 03                	push   $0x3
  101219:	eb 45                	jmp    101260 <asmDoIrq>

0010121b <irqOverflow>:
  10121b:	6a 00                	push   $0x0
  10121d:	6a 04                	push   $0x4
  10121f:	eb 3f                	jmp    101260 <asmDoIrq>

00101221 <irqBoundTest>:
  101221:	6a 00                	push   $0x0
  101223:	6a 05                	push   $0x5
  101225:	eb 39                	jmp    101260 <asmDoIrq>

00101227 <irqInvalidOperation>:
  101227:	6a 00                	push   $0x0
  101229:	6a 06                	push   $0x6
  10122b:	eb 33                	jmp    101260 <asmDoIrq>

0010122d <irqNoCoprocessor>:
  10122d:	6a 00                	push   $0x0
  10122f:	6a 07                	push   $0x7
  101231:	eb 2d                	jmp    101260 <asmDoIrq>

00101233 <irqDoubleFault>:
  101233:	6a 08                	push   $0x8
  101235:	eb 29                	jmp    101260 <asmDoIrq>

00101237 <irqCoprocessorOutofBound>:
  101237:	6a 00                	push   $0x0
  101239:	6a 09                	push   $0x9
  10123b:	eb 23                	jmp    101260 <asmDoIrq>

0010123d <irqInvalidTSS>:
  10123d:	6a 0a                	push   $0xa
  10123f:	eb 1f                	jmp    101260 <asmDoIrq>

00101241 <irqNoSegment>:
  101241:	6a 0b                	push   $0xb
  101243:	eb 1b                	jmp    101260 <asmDoIrq>

00101245 <irqStackSegmentFault>:
  101245:	6a 0c                	push   $0xc
  101247:	eb 17                	jmp    101260 <asmDoIrq>

00101249 <irqPageFault>:
  101249:	6a 0e                	push   $0xe
  10124b:	eb 13                	jmp    101260 <asmDoIrq>

0010124d <irqGProtectFault>:
  10124d:	6a 0d                	push   $0xd
  10124f:	eb 0f                	jmp    101260 <asmDoIrq>

00101251 <irqTime>:
  101251:	6a 00                	push   $0x0
  101253:	6a 20                	push   $0x20
  101255:	eb 09                	jmp    101260 <asmDoIrq>

00101257 <irqSyscall>:
  101257:	6a 00                	push   $0x0
  101259:	68 80 00 00 00       	push   $0x80
  10125e:	eb 00                	jmp    101260 <asmDoIrq>

00101260 <asmDoIrq>:
  101260:	60                   	pusha  
  101261:	1e                   	push   %ds
  101262:	06                   	push   %es
  101263:	0f a0                	push   %fs
  101265:	0f a8                	push   %gs
  101267:	54                   	push   %esp
  101268:	e8 37 ef ff ff       	call   1001a4 <irqHandle>
  10126d:	83 c4 04             	add    $0x4,%esp
  101270:	83 c4 10             	add    $0x10,%esp
  101273:	61                   	popa   
  101274:	83 c4 04             	add    $0x4,%esp
  101277:	83 c4 04             	add    $0x4,%esp
  10127a:	cf                   	iret   
