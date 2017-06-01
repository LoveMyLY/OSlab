
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 59 12 00 00       	call   101264 <initSerial>
  10000b:	e8 1c 0f 00 00       	call   100f2c <initIdt>
  100010:	e8 ab 12 00 00       	call   1012c0 <initIntr>
  100015:	e8 aa 00 00 00       	call   1000c4 <initTimer>
  10001a:	e8 cd 0a 00 00       	call   100aec <initSeg>
  10001f:	fb                   	sti    
  100020:	e8 73 05 00 00       	call   100598 <initPcb>
  100025:	e8 52 0c 00 00       	call   100c7c <loadUMain>
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
  10003b:	b9 52 28 10 00       	mov    $0x102852,%ecx
  100040:	84 c0                	test   %al,%al
  100042:	74 0b                	je     10004f <abort+0x23>
  100044:	41                   	inc    %ecx
  100045:	42                   	inc    %edx
  100046:	88 41 ff             	mov    %al,-0x1(%ecx)
  100049:	8a 02                	mov    (%edx),%al
  10004b:	84 c0                	test   %al,%al
  10004d:	75 f5                	jne    100044 <abort+0x18>
  10004f:	c6 01 3a             	movb   $0x3a,(%ecx)
  100052:	bb 5d 29 10 00       	mov    $0x10295d,%ebx
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
  10009a:	0f be 05 40 28 10 00 	movsbl 0x102840,%eax
  1000a1:	84 c0                	test   %al,%al
  1000a3:	74 1b                	je     1000c0 <abort+0x94>
  1000a5:	bb 40 28 10 00       	mov    $0x102840,%ebx
  1000aa:	83 ec 0c             	sub    $0xc,%esp
  1000ad:	50                   	push   %eax
  1000ae:	e8 f1 11 00 00       	call   1012a4 <putChar>
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
  1000ef:	e8 b0 11 00 00       	call   1012a4 <putChar>
  1000f4:	83 c4 10             	add    $0x10,%esp
  1000f7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  1000fb:	74 2c                	je     100129 <sys_write+0x4d>
  1000fd:	a1 64 29 10 00       	mov    0x102964,%eax
  100102:	6b c0 50             	imul   $0x50,%eax,%eax
  100105:	03 05 60 29 10 00    	add    0x102960,%eax
  10010b:	6b c0 02             	imul   $0x2,%eax,%eax
  10010e:	89 c7                	mov    %eax,%edi
  100110:	8a 45 f4             	mov    -0xc(%ebp),%al
  100113:	b4 0c                	mov    $0xc,%ah
  100115:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100119:	a1 60 29 10 00       	mov    0x102960,%eax
  10011e:	40                   	inc    %eax
  10011f:	a3 60 29 10 00       	mov    %eax,0x102960
  100124:	83 f8 4f             	cmp    $0x4f,%eax
  100127:	7e 10                	jle    100139 <sys_write+0x5d>
  100129:	ff 05 64 29 10 00    	incl   0x102964
  10012f:	c7 05 60 29 10 00 00 	movl   $0x0,0x102960
  100136:	00 00 00 
  100139:	c9                   	leave  
  10013a:	c3                   	ret    
  10013b:	90                   	nop

0010013c <syscallHandle>:
  10013c:	55                   	push   %ebp
  10013d:	89 e5                	mov    %esp,%ebp
  10013f:	83 ec 08             	sub    $0x8,%esp
  100142:	8b 45 08             	mov    0x8(%ebp),%eax
  100145:	83 78 2c 09          	cmpl   $0x9,0x2c(%eax)
  100149:	77 6d                	ja     1001b8 <syscallHandle+0x7c>
  10014b:	8b 50 2c             	mov    0x2c(%eax),%edx
  10014e:	ff 24 95 ac 13 10 00 	jmp    *0x1013ac(,%edx,4)
  100155:	8d 76 00             	lea    0x0(%esi),%esi
  100158:	89 45 08             	mov    %eax,0x8(%ebp)
  10015b:	c9                   	leave  
  10015c:	e9 c3 0d 00 00       	jmp    100f24 <sys_destroy>
  100161:	8d 76 00             	lea    0x0(%esi),%esi
  100164:	89 45 08             	mov    %eax,0x8(%ebp)
  100167:	c9                   	leave  
  100168:	e9 2f 05 00 00       	jmp    10069c <sys_fork>
  10016d:	8d 76 00             	lea    0x0(%esi),%esi
  100170:	89 45 08             	mov    %eax,0x8(%ebp)
  100173:	c9                   	leave  
  100174:	e9 7b 06 00 00       	jmp    1007f4 <sys_sleep>
  100179:	8d 76 00             	lea    0x0(%esi),%esi
  10017c:	89 45 08             	mov    %eax,0x8(%ebp)
  10017f:	c9                   	leave  
  100180:	e9 57 ff ff ff       	jmp    1000dc <sys_write>
  100185:	8d 76 00             	lea    0x0(%esi),%esi
  100188:	89 45 08             	mov    %eax,0x8(%ebp)
  10018b:	c9                   	leave  
  10018c:	e9 c3 07 00 00       	jmp    100954 <sys_exit>
  100191:	8d 76 00             	lea    0x0(%esi),%esi
  100194:	89 45 08             	mov    %eax,0x8(%ebp)
  100197:	c9                   	leave  
  100198:	e9 b3 0b 00 00       	jmp    100d50 <sys_init>
  10019d:	8d 76 00             	lea    0x0(%esi),%esi
  1001a0:	89 45 08             	mov    %eax,0x8(%ebp)
  1001a3:	c9                   	leave  
  1001a4:	e9 db 0b 00 00       	jmp    100d84 <sys_wait>
  1001a9:	8d 76 00             	lea    0x0(%esi),%esi
  1001ac:	89 45 08             	mov    %eax,0x8(%ebp)
  1001af:	c9                   	leave  
  1001b0:	e9 ff 0c 00 00       	jmp    100eb4 <sys_post>
  1001b5:	8d 76 00             	lea    0x0(%esi),%esi
  1001b8:	83 ec 08             	sub    $0x8,%esp
  1001bb:	6a 73                	push   $0x73
  1001bd:	68 98 13 10 00       	push   $0x101398
  1001c2:	e8 65 fe ff ff       	call   10002c <abort>
  1001c7:	83 c4 10             	add    $0x10,%esp
  1001ca:	c9                   	leave  
  1001cb:	c3                   	ret    

001001cc <irqHandle>:
  1001cc:	55                   	push   %ebp
  1001cd:	89 e5                	mov    %esp,%ebp
  1001cf:	53                   	push   %ebx
  1001d0:	50                   	push   %eax
  1001d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1001d4:	66 b8 10 00          	mov    $0x10,%ax
  1001d8:	8e d8                	mov    %eax,%ds
  1001da:	8e c0                	mov    %eax,%es
  1001dc:	66 b8 30 00          	mov    $0x30,%ax
  1001e0:	8e e8                	mov    %eax,%gs
  1001e2:	8b 43 30             	mov    0x30(%ebx),%eax
  1001e5:	83 f8 0d             	cmp    $0xd,%eax
  1001e8:	74 4e                	je     100238 <irqHandle+0x6c>
  1001ea:	7e 24                	jle    100210 <irqHandle+0x44>
  1001ec:	83 f8 20             	cmp    $0x20,%eax
  1001ef:	74 13                	je     100204 <irqHandle+0x38>
  1001f1:	83 c0 80             	add    $0xffffff80,%eax
  1001f4:	75 22                	jne    100218 <irqHandle+0x4c>
  1001f6:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1001f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001fc:	c9                   	leave  
  1001fd:	e9 3a ff ff ff       	jmp    10013c <syscallHandle>
  100202:	66 90                	xchg   %ax,%ax
  100204:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100207:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10020a:	c9                   	leave  
  10020b:	e9 b8 01 00 00       	jmp    1003c8 <Intrtime>
  100210:	40                   	inc    %eax
  100211:	75 05                	jne    100218 <irqHandle+0x4c>
  100213:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100216:	c9                   	leave  
  100217:	c3                   	ret    
  100218:	83 ec 08             	sub    $0x8,%esp
  10021b:	6a 36                	push   $0x36
  10021d:	68 98 13 10 00       	push   $0x101398
  100222:	e8 05 fe ff ff       	call   10002c <abort>
  100227:	8e 5b 0c             	mov    0xc(%ebx),%ds
  10022a:	8e 43 08             	mov    0x8(%ebx),%es
  10022d:	8e 2b                	mov    (%ebx),%gs
  10022f:	83 c4 10             	add    $0x10,%esp
  100232:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100235:	c9                   	leave  
  100236:	c3                   	ret    
  100237:	90                   	nop
  100238:	83 ec 08             	sub    $0x8,%esp
  10023b:	6a 78                	push   $0x78
  10023d:	68 98 13 10 00       	push   $0x101398
  100242:	e8 e5 fd ff ff       	call   10002c <abort>
  100247:	83 c4 10             	add    $0x10,%esp
  10024a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10024d:	c9                   	leave  
  10024e:	c3                   	ret    
  10024f:	90                   	nop

00100250 <GProtectFaultHandle>:
  100250:	55                   	push   %ebp
  100251:	89 e5                	mov    %esp,%ebp
  100253:	83 ec 10             	sub    $0x10,%esp
  100256:	6a 78                	push   $0x78
  100258:	68 98 13 10 00       	push   $0x101398
  10025d:	e8 ca fd ff ff       	call   10002c <abort>
  100262:	83 c4 10             	add    $0x10,%esp
  100265:	c9                   	leave  
  100266:	c3                   	ret    
  100267:	90                   	nop

00100268 <IDLE>:
  100268:	55                   	push   %ebp
  100269:	89 e5                	mov    %esp,%ebp
  10026b:	90                   	nop
  10026c:	f4                   	hlt    
  10026d:	eb fd                	jmp    10026c <IDLE+0x4>
  10026f:	90                   	nop

00100270 <debug>:
  100270:	55                   	push   %ebp
  100271:	89 e5                	mov    %esp,%ebp
  100273:	57                   	push   %edi
  100274:	56                   	push   %esi
  100275:	53                   	push   %ebx
  100276:	83 ec 18             	sub    $0x18,%esp
  100279:	6a 0a                	push   $0xa
  10027b:	e8 24 10 00 00       	call   1012a4 <putChar>
  100280:	bb d4 68 10 00       	mov    $0x1068d4,%ebx
  100285:	83 c4 10             	add    $0x10,%esp
  100288:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
  10028d:	be 67 66 66 66       	mov    $0x66666667,%esi
  100292:	66 90                	xchg   %ax,%ax
  100294:	83 7b 08 01          	cmpl   $0x1,0x8(%ebx)
  100298:	75 35                	jne    1002cf <debug+0x5f>
  10029a:	8b 43 f8             	mov    -0x8(%ebx),%eax
  10029d:	83 f8 03             	cmp    $0x3,%eax
  1002a0:	74 56                	je     1002f8 <debug+0x88>
  1002a2:	83 f8 01             	cmp    $0x1,%eax
  1002a5:	0f 84 dd 00 00 00    	je     100388 <debug+0x118>
  1002ab:	83 f8 02             	cmp    $0x2,%eax
  1002ae:	0f 84 f4 00 00 00    	je     1003a8 <debug+0x138>
  1002b4:	83 ec 0c             	sub    $0xc,%esp
  1002b7:	6a 20                	push   $0x20
  1002b9:	e8 e6 0f 00 00       	call   1012a4 <putChar>
  1002be:	81 c3 a0 1f 00 00    	add    $0x1fa0,%ebx
  1002c4:	83 c4 10             	add    $0x10,%esp
  1002c7:	81 fb 34 46 11 00    	cmp    $0x114634,%ebx
  1002cd:	75 c5                	jne    100294 <debug+0x24>
  1002cf:	83 ec 0c             	sub    $0xc,%esp
  1002d2:	a0 27 27 11 00       	mov    0x112727,%al
  1002d7:	83 c0 30             	add    $0x30,%eax
  1002da:	0f be c0             	movsbl %al,%eax
  1002dd:	50                   	push   %eax
  1002de:	e8 c1 0f 00 00       	call   1012a4 <putChar>
  1002e3:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002ea:	e8 b5 0f 00 00       	call   1012a4 <putChar>
  1002ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1002f2:	5b                   	pop    %ebx
  1002f3:	5e                   	pop    %esi
  1002f4:	5f                   	pop    %edi
  1002f5:	5d                   	pop    %ebp
  1002f6:	c3                   	ret    
  1002f7:	90                   	nop
  1002f8:	83 ec 0c             	sub    $0xc,%esp
  1002fb:	6a 73                	push   $0x73
  1002fd:	e8 a2 0f 00 00       	call   1012a4 <putChar>
  100302:	8b 0b                	mov    (%ebx),%ecx
  100304:	89 c8                	mov    %ecx,%eax
  100306:	f7 ef                	imul   %edi
  100308:	89 d0                	mov    %edx,%eax
  10030a:	c1 f8 05             	sar    $0x5,%eax
  10030d:	c1 f9 1f             	sar    $0x1f,%ecx
  100310:	29 c8                	sub    %ecx,%eax
  100312:	83 c0 30             	add    $0x30,%eax
  100315:	0f be c0             	movsbl %al,%eax
  100318:	89 04 24             	mov    %eax,(%esp)
  10031b:	e8 84 0f 00 00       	call   1012a4 <putChar>
  100320:	8b 0b                	mov    (%ebx),%ecx
  100322:	89 c8                	mov    %ecx,%eax
  100324:	f7 ef                	imul   %edi
  100326:	89 d0                	mov    %edx,%eax
  100328:	c1 f8 05             	sar    $0x5,%eax
  10032b:	89 ca                	mov    %ecx,%edx
  10032d:	c1 fa 1f             	sar    $0x1f,%edx
  100330:	29 d0                	sub    %edx,%eax
  100332:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100335:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100338:	c1 e0 02             	shl    $0x2,%eax
  10033b:	29 c1                	sub    %eax,%ecx
  10033d:	89 c8                	mov    %ecx,%eax
  10033f:	f7 ee                	imul   %esi
  100341:	89 d0                	mov    %edx,%eax
  100343:	c1 f8 02             	sar    $0x2,%eax
  100346:	c1 f9 1f             	sar    $0x1f,%ecx
  100349:	29 c8                	sub    %ecx,%eax
  10034b:	83 c0 30             	add    $0x30,%eax
  10034e:	0f b6 c0             	movzbl %al,%eax
  100351:	89 04 24             	mov    %eax,(%esp)
  100354:	e8 4b 0f 00 00       	call   1012a4 <putChar>
  100359:	8b 0b                	mov    (%ebx),%ecx
  10035b:	89 c8                	mov    %ecx,%eax
  10035d:	f7 ee                	imul   %esi
  10035f:	89 d0                	mov    %edx,%eax
  100361:	c1 f8 02             	sar    $0x2,%eax
  100364:	89 ca                	mov    %ecx,%edx
  100366:	c1 fa 1f             	sar    $0x1f,%edx
  100369:	29 d0                	sub    %edx,%eax
  10036b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10036e:	01 c0                	add    %eax,%eax
  100370:	29 c1                	sub    %eax,%ecx
  100372:	83 c1 30             	add    $0x30,%ecx
  100375:	0f b6 c9             	movzbl %cl,%ecx
  100378:	89 0c 24             	mov    %ecx,(%esp)
  10037b:	e8 24 0f 00 00       	call   1012a4 <putChar>
  100380:	83 c4 10             	add    $0x10,%esp
  100383:	e9 2c ff ff ff       	jmp    1002b4 <debug+0x44>
  100388:	83 ec 0c             	sub    $0xc,%esp
  10038b:	6a 72                	push   $0x72
  10038d:	e8 12 0f 00 00       	call   1012a4 <putChar>
  100392:	c7 04 24 69 00 00 00 	movl   $0x69,(%esp)
  100399:	e8 06 0f 00 00       	call   1012a4 <putChar>
  10039e:	83 c4 10             	add    $0x10,%esp
  1003a1:	e9 0e ff ff ff       	jmp    1002b4 <debug+0x44>
  1003a6:	66 90                	xchg   %ax,%ax
  1003a8:	83 ec 0c             	sub    $0xc,%esp
  1003ab:	6a 72                	push   $0x72
  1003ad:	e8 f2 0e 00 00       	call   1012a4 <putChar>
  1003b2:	c7 04 24 65 00 00 00 	movl   $0x65,(%esp)
  1003b9:	e8 e6 0e 00 00       	call   1012a4 <putChar>
  1003be:	83 c4 10             	add    $0x10,%esp
  1003c1:	e9 ee fe ff ff       	jmp    1002b4 <debug+0x44>
  1003c6:	66 90                	xchg   %ax,%ax

001003c8 <Intrtime>:
  1003c8:	55                   	push   %ebp
  1003c9:	89 e5                	mov    %esp,%ebp
  1003cb:	57                   	push   %edi
  1003cc:	56                   	push   %esi
  1003cd:	53                   	push   %ebx
  1003ce:	8b 15 80 29 10 00    	mov    0x102980,%edx
  1003d4:	89 d0                	mov    %edx,%eax
  1003d6:	c1 e0 06             	shl    $0x6,%eax
  1003d9:	29 d0                	sub    %edx,%eax
  1003db:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  1003de:	c1 e3 05             	shl    $0x5,%ebx
  1003e1:	8d 83 e0 48 10 00    	lea    0x1048e0(%ebx),%eax
  1003e7:	b9 13 00 00 00       	mov    $0x13,%ecx
  1003ec:	89 c7                	mov    %eax,%edi
  1003ee:	8b 75 08             	mov    0x8(%ebp),%esi
  1003f1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1003f3:	c7 83 2c 49 10 00 02 	movl   $0x2,0x10492c(%ebx)
  1003fa:	00 00 00 
  1003fd:	81 c3 a0 29 10 00    	add    $0x1029a0,%ebx
  100403:	ff 8b 90 1f 00 00    	decl   0x1f90(%ebx)
  100409:	b9 cc 68 10 00       	mov    $0x1068cc,%ecx
  10040e:	89 c8                	mov    %ecx,%eax
  100410:	eb 0e                	jmp    100420 <Intrtime+0x58>
  100412:	66 90                	xchg   %ax,%ax
  100414:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100419:	3d 2c 46 11 00       	cmp    $0x11462c,%eax
  10041e:	74 34                	je     100454 <Intrtime+0x8c>
  100420:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  100424:	75 ee                	jne    100414 <Intrtime+0x4c>
  100426:	83 38 03             	cmpl   $0x3,(%eax)
  100429:	75 e9                	jne    100414 <Intrtime+0x4c>
  10042b:	8b 78 08             	mov    0x8(%eax),%edi
  10042e:	8d 5f ff             	lea    -0x1(%edi),%ebx
  100431:	89 58 08             	mov    %ebx,0x8(%eax)
  100434:	85 db                	test   %ebx,%ebx
  100436:	7f dc                	jg     100414 <Intrtime+0x4c>
  100438:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  10043e:	c7 40 04 0a 00 00 00 	movl   $0xa,0x4(%eax)
  100445:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  10044a:	3d 2c 46 11 00       	cmp    $0x11462c,%eax
  10044f:	75 cf                	jne    100420 <Intrtime+0x58>
  100451:	8d 76 00             	lea    0x0(%esi),%esi
  100454:	89 d0                	mov    %edx,%eax
  100456:	c1 e0 06             	shl    $0x6,%eax
  100459:	29 d0                	sub    %edx,%eax
  10045b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10045e:	c1 e0 05             	shl    $0x5,%eax
  100461:	05 a0 29 10 00       	add    $0x1029a0,%eax
  100466:	8b 98 90 1f 00 00    	mov    0x1f90(%eax),%ebx
  10046c:	85 db                	test   %ebx,%ebx
  10046e:	7e 58                	jle    1004c8 <Intrtime+0x100>
  100470:	85 d2                	test   %edx,%edx
  100472:	74 58                	je     1004cc <Intrtime+0x104>
  100474:	89 d0                	mov    %edx,%eax
  100476:	89 d1                	mov    %edx,%ecx
  100478:	c1 e1 06             	shl    $0x6,%ecx
  10047b:	29 d1                	sub    %edx,%ecx
  10047d:	8d 34 8a             	lea    (%edx,%ecx,4),%esi
  100480:	c1 e6 05             	shl    $0x5,%esi
  100483:	c7 86 2c 49 10 00 01 	movl   $0x1,0x10492c(%esi)
  10048a:	00 00 00 
  10048d:	81 c6 e0 48 10 00    	add    $0x1048e0,%esi
  100493:	b9 13 00 00 00       	mov    $0x13,%ecx
  100498:	8b 7d 08             	mov    0x8(%ebp),%edi
  10049b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10049d:	83 f8 01             	cmp    $0x1,%eax
  1004a0:	0f 86 b2 00 00 00    	jbe    100558 <Intrtime+0x190>
  1004a6:	83 fa 02             	cmp    $0x2,%edx
  1004a9:	75 07                	jne    1004b2 <Intrtime+0xea>
  1004ab:	c6 05 27 27 11 00 01 	movb   $0x1,0x112727
  1004b2:	66 c7 05 22 27 11 00 	movw   $0x0,0x112722
  1004b9:	00 00 
  1004bb:	c6 05 24 27 11 00 00 	movb   $0x0,0x112724
  1004c2:	5b                   	pop    %ebx
  1004c3:	5e                   	pop    %esi
  1004c4:	5f                   	pop    %edi
  1004c5:	5d                   	pop    %ebp
  1004c6:	c3                   	ret    
  1004c7:	90                   	nop
  1004c8:	85 d2                	test   %edx,%edx
  1004ca:	75 58                	jne    100524 <Intrtime+0x15c>
  1004cc:	ba 01 00 00 00       	mov    $0x1,%edx
  1004d1:	eb 0d                	jmp    1004e0 <Intrtime+0x118>
  1004d3:	90                   	nop
  1004d4:	42                   	inc    %edx
  1004d5:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  1004db:	83 fa 08             	cmp    $0x8,%edx
  1004de:	74 3c                	je     10051c <Intrtime+0x154>
  1004e0:	83 39 02             	cmpl   $0x2,(%ecx)
  1004e3:	75 ef                	jne    1004d4 <Intrtime+0x10c>
  1004e5:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  1004e9:	75 e9                	jne    1004d4 <Intrtime+0x10c>
  1004eb:	89 d0                	mov    %edx,%eax
  1004ed:	89 d1                	mov    %edx,%ecx
  1004ef:	c1 e1 06             	shl    $0x6,%ecx
  1004f2:	29 d1                	sub    %edx,%ecx
  1004f4:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
  1004f7:	c1 e1 05             	shl    $0x5,%ecx
  1004fa:	c7 81 2c 49 10 00 01 	movl   $0x1,0x10492c(%ecx)
  100501:	00 00 00 
  100504:	c7 81 30 49 10 00 0a 	movl   $0xa,0x104930(%ecx)
  10050b:	00 00 00 
  10050e:	89 15 80 29 10 00    	mov    %edx,0x102980
  100514:	e9 5d ff ff ff       	jmp    100476 <Intrtime+0xae>
  100519:	8d 76 00             	lea    0x0(%esi),%esi
  10051c:	31 c0                	xor    %eax,%eax
  10051e:	31 d2                	xor    %edx,%edx
  100520:	eb cb                	jmp    1004ed <Intrtime+0x125>
  100522:	66 90                	xchg   %ax,%ax
  100524:	c7 80 8c 1f 00 00 02 	movl   $0x2,0x1f8c(%eax)
  10052b:	00 00 00 
  10052e:	bb 01 00 00 00       	mov    $0x1,%ebx
  100533:	eb 0f                	jmp    100544 <Intrtime+0x17c>
  100535:	8d 76 00             	lea    0x0(%esi),%esi
  100538:	43                   	inc    %ebx
  100539:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  10053f:	83 fb 08             	cmp    $0x8,%ebx
  100542:	74 20                	je     100564 <Intrtime+0x19c>
  100544:	83 39 02             	cmpl   $0x2,(%ecx)
  100547:	75 ef                	jne    100538 <Intrtime+0x170>
  100549:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  10054d:	75 e9                	jne    100538 <Intrtime+0x170>
  10054f:	39 da                	cmp    %ebx,%edx
  100551:	74 e5                	je     100538 <Intrtime+0x170>
  100553:	89 d8                	mov    %ebx,%eax
  100555:	eb 11                	jmp    100568 <Intrtime+0x1a0>
  100557:	90                   	nop
  100558:	c6 05 27 27 11 00 00 	movb   $0x0,0x112727
  10055f:	e9 4e ff ff ff       	jmp    1004b2 <Intrtime+0xea>
  100564:	31 c0                	xor    %eax,%eax
  100566:	31 db                	xor    %ebx,%ebx
  100568:	89 da                	mov    %ebx,%edx
  10056a:	c1 e2 06             	shl    $0x6,%edx
  10056d:	29 da                	sub    %ebx,%edx
  10056f:	8d 14 93             	lea    (%ebx,%edx,4),%edx
  100572:	c1 e2 05             	shl    $0x5,%edx
  100575:	c7 82 2c 49 10 00 01 	movl   $0x1,0x10492c(%edx)
  10057c:	00 00 00 
  10057f:	c7 82 30 49 10 00 0a 	movl   $0xa,0x104930(%edx)
  100586:	00 00 00 
  100589:	89 1d 80 29 10 00    	mov    %ebx,0x102980
  10058f:	89 da                	mov    %ebx,%edx
  100591:	e9 e0 fe ff ff       	jmp    100476 <Intrtime+0xae>
  100596:	66 90                	xchg   %ax,%ax

00100598 <initPcb>:
  100598:	55                   	push   %ebp
  100599:	89 e5                	mov    %esp,%ebp
  10059b:	b8 3c 49 10 00       	mov    $0x10493c,%eax
  1005a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1005a6:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1005ab:	3d 3c 46 11 00       	cmp    $0x11463c,%eax
  1005b0:	75 ee                	jne    1005a0 <initPcb+0x8>
  1005b2:	c7 05 3c 49 10 00 01 	movl   $0x1,0x10493c
  1005b9:	00 00 00 
  1005bc:	c7 05 2c 49 10 00 02 	movl   $0x2,0x10492c
  1005c3:	00 00 00 
  1005c6:	c7 05 38 49 10 00 00 	movl   $0x0,0x104938
  1005cd:	00 00 00 
  1005d0:	c7 05 30 49 10 00 0a 	movl   $0xa,0x104930
  1005d7:	00 00 00 
  1005da:	c7 05 34 49 10 00 00 	movl   $0x0,0x104934
  1005e1:	00 00 00 
  1005e4:	c7 05 1c 49 10 00 08 	movl   $0x8,0x10491c
  1005eb:	00 00 00 
  1005ee:	c7 05 18 49 10 00 68 	movl   $0x100268,0x104918
  1005f5:	02 10 00 
  1005f8:	c7 05 28 49 10 00 10 	movl   $0x10,0x104928
  1005ff:	00 00 00 
  100602:	c7 05 20 49 10 00 02 	movl   $0x202,0x104920
  100609:	02 00 00 
  10060c:	c7 05 24 49 10 00 00 	movl   $0x7800000,0x104924
  100613:	00 80 07 
  100616:	c7 05 f8 48 10 00 00 	movl   $0x7800000,0x1048f8
  10061d:	00 80 07 
  100620:	c7 05 dc 68 10 00 01 	movl   $0x1,0x1068dc
  100627:	00 00 00 
  10062a:	c7 05 cc 68 10 00 01 	movl   $0x1,0x1068cc
  100631:	00 00 00 
  100634:	c7 05 d8 68 10 00 01 	movl   $0x1,0x1068d8
  10063b:	00 00 00 
  10063e:	c7 05 d0 68 10 00 0a 	movl   $0xa,0x1068d0
  100645:	00 00 00 
  100648:	c7 05 d4 68 10 00 00 	movl   $0x0,0x1068d4
  10064f:	00 00 00 
  100652:	c7 05 bc 68 10 00 1b 	movl   $0x1b,0x1068bc
  100659:	00 00 00 
  10065c:	c7 05 b8 68 10 00 00 	movl   $0x200000,0x1068b8
  100663:	00 20 00 
  100666:	c7 05 c8 68 10 00 23 	movl   $0x23,0x1068c8
  10066d:	00 00 00 
  100670:	c7 05 c0 68 10 00 02 	movl   $0x202,0x1068c0
  100677:	02 00 00 
  10067a:	c7 05 c4 68 10 00 00 	movl   $0x6000000,0x1068c4
  100681:	00 00 06 
  100684:	c7 05 98 68 10 00 00 	movl   $0x6000000,0x106898
  10068b:	00 00 06 
  10068e:	c7 05 80 29 10 00 01 	movl   $0x1,0x102980
  100695:	00 00 00 
  100698:	5d                   	pop    %ebp
  100699:	c3                   	ret    
  10069a:	66 90                	xchg   %ax,%ax

0010069c <sys_fork>:
  10069c:	55                   	push   %ebp
  10069d:	89 e5                	mov    %esp,%ebp
  10069f:	57                   	push   %edi
  1006a0:	56                   	push   %esi
  1006a1:	53                   	push   %ebx
  1006a2:	53                   	push   %ebx
  1006a3:	8b 75 08             	mov    0x8(%ebp),%esi
  1006a6:	a1 80 29 10 00       	mov    0x102980,%eax
  1006ab:	89 c3                	mov    %eax,%ebx
  1006ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1006b0:	c1 e0 06             	shl    $0x6,%eax
  1006b3:	29 d8                	sub    %ebx,%eax
  1006b5:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  1006b8:	c1 e2 05             	shl    $0x5,%edx
  1006bb:	8d 82 e0 48 10 00    	lea    0x1048e0(%edx),%eax
  1006c1:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006c6:	89 c7                	mov    %eax,%edi
  1006c8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006ca:	c7 82 2c 49 10 00 02 	movl   $0x2,0x10492c(%edx)
  1006d1:	00 00 00 
  1006d4:	b8 dc 68 10 00       	mov    $0x1068dc,%eax
  1006d9:	ba 01 00 00 00       	mov    $0x1,%edx
  1006de:	66 90                	xchg   %ax,%ax
  1006e0:	8b 08                	mov    (%eax),%ecx
  1006e2:	85 c9                	test   %ecx,%ecx
  1006e4:	0f 84 ea 00 00 00    	je     1007d4 <sys_fork+0x138>
  1006ea:	42                   	inc    %edx
  1006eb:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1006f0:	83 fa 08             	cmp    $0x8,%edx
  1006f3:	75 eb                	jne    1006e0 <sys_fork+0x44>
  1006f5:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  1006fa:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  1006ff:	89 d0                	mov    %edx,%eax
  100701:	c1 e0 06             	shl    $0x6,%eax
  100704:	29 d0                	sub    %edx,%eax
  100706:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100709:	c1 e0 05             	shl    $0x5,%eax
  10070c:	8d 98 a0 29 10 00    	lea    0x1029a0(%eax),%ebx
  100712:	c7 80 2c 49 10 00 02 	movl   $0x2,0x10492c(%eax)
  100719:	00 00 00 
  10071c:	89 88 38 49 10 00    	mov    %ecx,0x104938(%eax)
  100722:	c7 80 30 49 10 00 0a 	movl   $0xa,0x104930(%eax)
  100729:	00 00 00 
  10072c:	c7 80 34 49 10 00 00 	movl   $0x0,0x104934(%eax)
  100733:	00 00 00 
  100736:	8d b8 e0 48 10 00    	lea    0x1048e0(%eax),%edi
  10073c:	8b 75 f0             	mov    -0x10(%ebp),%esi
  10073f:	89 f0                	mov    %esi,%eax
  100741:	c1 e0 06             	shl    $0x6,%eax
  100744:	29 f0                	sub    %esi,%eax
  100746:	8d 04 86             	lea    (%esi,%eax,4),%eax
  100749:	c1 e0 05             	shl    $0x5,%eax
  10074c:	8d b0 e0 48 10 00    	lea    0x1048e0(%eax),%esi
  100752:	b9 13 00 00 00       	mov    $0x13,%ecx
  100757:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100759:	c7 83 6c 1f 00 00 00 	movl   $0x0,0x1f6c(%ebx)
  100760:	00 00 00 
  100763:	8d b0 a0 29 10 00    	lea    0x1029a0(%eax),%esi
  100769:	8b b8 24 49 10 00    	mov    0x104924(%eax),%edi
  10076f:	89 bb 84 1f 00 00    	mov    %edi,0x1f84(%ebx)
  100775:	8b 80 f8 48 10 00    	mov    0x1048f8(%eax),%eax
  10077b:	89 83 58 1f 00 00    	mov    %eax,0x1f58(%ebx)
  100781:	8d 87 00 00 00 01    	lea    0x1000000(%edi),%eax
  100787:	b9 00 00 00 06       	mov    $0x6000000,%ecx
  10078c:	29 f9                	sub    %edi,%ecx
  10078e:	8b b6 84 1f 00 00    	mov    0x1f84(%esi),%esi
  100794:	89 c7                	mov    %eax,%edi
  100796:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100798:	b8 00 00 20 01       	mov    $0x1200000,%eax
  10079d:	be 00 00 20 00       	mov    $0x200000,%esi
  1007a2:	b9 00 08 00 00       	mov    $0x800,%ecx
  1007a7:	89 c7                	mov    %eax,%edi
  1007a9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1007ab:	a1 80 29 10 00       	mov    0x102980,%eax
  1007b0:	89 c1                	mov    %eax,%ecx
  1007b2:	c1 e1 06             	shl    $0x6,%ecx
  1007b5:	29 c1                	sub    %eax,%ecx
  1007b7:	8d 04 88             	lea    (%eax,%ecx,4),%eax
  1007ba:	c1 e0 05             	shl    $0x5,%eax
  1007bd:	8b 8b 98 1f 00 00    	mov    0x1f98(%ebx),%ecx
  1007c3:	89 88 0c 49 10 00    	mov    %ecx,0x10490c(%eax)
  1007c9:	89 d0                	mov    %edx,%eax
  1007cb:	5a                   	pop    %edx
  1007cc:	5b                   	pop    %ebx
  1007cd:	5e                   	pop    %esi
  1007ce:	5f                   	pop    %edi
  1007cf:	5d                   	pop    %ebp
  1007d0:	c3                   	ret    
  1007d1:	8d 76 00             	lea    0x0(%esi),%esi
  1007d4:	89 d0                	mov    %edx,%eax
  1007d6:	c1 e0 06             	shl    $0x6,%eax
  1007d9:	29 d0                	sub    %edx,%eax
  1007db:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1007de:	c1 e0 05             	shl    $0x5,%eax
  1007e1:	c7 80 3c 49 10 00 01 	movl   $0x1,0x10493c(%eax)
  1007e8:	00 00 00 
  1007eb:	89 d1                	mov    %edx,%ecx
  1007ed:	e9 0d ff ff ff       	jmp    1006ff <sys_fork+0x63>
  1007f2:	66 90                	xchg   %ax,%ax

001007f4 <sys_sleep>:
  1007f4:	55                   	push   %ebp
  1007f5:	89 e5                	mov    %esp,%ebp
  1007f7:	57                   	push   %edi
  1007f8:	56                   	push   %esi
  1007f9:	53                   	push   %ebx
  1007fa:	8b 15 80 29 10 00    	mov    0x102980,%edx
  100800:	89 d0                	mov    %edx,%eax
  100802:	c1 e0 06             	shl    $0x6,%eax
  100805:	29 d0                	sub    %edx,%eax
  100807:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  10080a:	c1 e3 05             	shl    $0x5,%ebx
  10080d:	8d 83 e0 48 10 00    	lea    0x1048e0(%ebx),%eax
  100813:	b9 13 00 00 00       	mov    $0x13,%ecx
  100818:	89 c7                	mov    %eax,%edi
  10081a:	8b 75 08             	mov    0x8(%ebp),%esi
  10081d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10081f:	c7 83 2c 49 10 00 02 	movl   $0x2,0x10492c(%ebx)
  100826:	00 00 00 
  100829:	81 c3 a0 29 10 00    	add    $0x1029a0,%ebx
  10082f:	ff 8b 90 1f 00 00    	decl   0x1f90(%ebx)
  100835:	b8 cc 68 10 00       	mov    $0x1068cc,%eax
  10083a:	eb 0c                	jmp    100848 <sys_sleep+0x54>
  10083c:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100841:	3d 2c 46 11 00       	cmp    $0x11462c,%eax
  100846:	74 34                	je     10087c <sys_sleep+0x88>
  100848:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  10084c:	75 2e                	jne    10087c <sys_sleep+0x88>
  10084e:	83 38 03             	cmpl   $0x3,(%eax)
  100851:	75 e9                	jne    10083c <sys_sleep+0x48>
  100853:	8b 78 08             	mov    0x8(%eax),%edi
  100856:	8d 4f ff             	lea    -0x1(%edi),%ecx
  100859:	89 48 08             	mov    %ecx,0x8(%eax)
  10085c:	85 c9                	test   %ecx,%ecx
  10085e:	7f dc                	jg     10083c <sys_sleep+0x48>
  100860:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  100866:	c7 40 04 0a 00 00 00 	movl   $0xa,0x4(%eax)
  10086d:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100872:	3d 2c 46 11 00       	cmp    $0x11462c,%eax
  100877:	75 cf                	jne    100848 <sys_sleep+0x54>
  100879:	8d 76 00             	lea    0x0(%esi),%esi
  10087c:	89 d0                	mov    %edx,%eax
  10087e:	c1 e0 06             	shl    $0x6,%eax
  100881:	29 d0                	sub    %edx,%eax
  100883:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100886:	c1 e0 05             	shl    $0x5,%eax
  100889:	8b 75 08             	mov    0x8(%ebp),%esi
  10088c:	8b 4e 20             	mov    0x20(%esi),%ecx
  10088f:	89 88 34 49 10 00    	mov    %ecx,0x104934(%eax)
  100895:	c7 80 2c 49 10 00 03 	movl   $0x3,0x10492c(%eax)
  10089c:	00 00 00 
  10089f:	b9 dc 68 10 00       	mov    $0x1068dc,%ecx
  1008a4:	b8 01 00 00 00       	mov    $0x1,%eax
  1008a9:	eb 0d                	jmp    1008b8 <sys_sleep+0xc4>
  1008ab:	90                   	nop
  1008ac:	40                   	inc    %eax
  1008ad:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  1008b3:	83 f8 08             	cmp    $0x8,%eax
  1008b6:	74 60                	je     100918 <sys_sleep+0x124>
  1008b8:	83 39 01             	cmpl   $0x1,(%ecx)
  1008bb:	75 ef                	jne    1008ac <sys_sleep+0xb8>
  1008bd:	83 79 f0 02          	cmpl   $0x2,-0x10(%ecx)
  1008c1:	75 e9                	jne    1008ac <sys_sleep+0xb8>
  1008c3:	39 c2                	cmp    %eax,%edx
  1008c5:	74 e5                	je     1008ac <sys_sleep+0xb8>
  1008c7:	89 c2                	mov    %eax,%edx
  1008c9:	c1 e2 06             	shl    $0x6,%edx
  1008cc:	29 c2                	sub    %eax,%edx
  1008ce:	8d 34 90             	lea    (%eax,%edx,4),%esi
  1008d1:	c1 e6 05             	shl    $0x5,%esi
  1008d4:	c7 86 2c 49 10 00 01 	movl   $0x1,0x10492c(%esi)
  1008db:	00 00 00 
  1008de:	c7 86 30 49 10 00 0a 	movl   $0xa,0x104930(%esi)
  1008e5:	00 00 00 
  1008e8:	a3 80 29 10 00       	mov    %eax,0x102980
  1008ed:	81 c6 e0 48 10 00    	add    $0x1048e0,%esi
  1008f3:	b9 13 00 00 00       	mov    $0x13,%ecx
  1008f8:	8b 7d 08             	mov    0x8(%ebp),%edi
  1008fb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1008fd:	83 f8 01             	cmp    $0x1,%eax
  100900:	76 43                	jbe    100945 <sys_sleep+0x151>
  100902:	83 f8 02             	cmp    $0x2,%eax
  100905:	75 07                	jne    10090e <sys_sleep+0x11a>
  100907:	c6 05 27 27 11 00 01 	movb   $0x1,0x112727
  10090e:	31 c0                	xor    %eax,%eax
  100910:	5b                   	pop    %ebx
  100911:	5e                   	pop    %esi
  100912:	5f                   	pop    %edi
  100913:	5d                   	pop    %ebp
  100914:	c3                   	ret    
  100915:	8d 76 00             	lea    0x0(%esi),%esi
  100918:	c7 05 2c 49 10 00 01 	movl   $0x1,0x10492c
  10091f:	00 00 00 
  100922:	c7 05 30 49 10 00 0a 	movl   $0xa,0x104930
  100929:	00 00 00 
  10092c:	c7 05 80 29 10 00 00 	movl   $0x0,0x102980
  100933:	00 00 00 
  100936:	be e0 48 10 00       	mov    $0x1048e0,%esi
  10093b:	b9 13 00 00 00       	mov    $0x13,%ecx
  100940:	8b 7d 08             	mov    0x8(%ebp),%edi
  100943:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100945:	c6 05 27 27 11 00 00 	movb   $0x0,0x112727
  10094c:	31 c0                	xor    %eax,%eax
  10094e:	5b                   	pop    %ebx
  10094f:	5e                   	pop    %esi
  100950:	5f                   	pop    %edi
  100951:	5d                   	pop    %ebp
  100952:	c3                   	ret    
  100953:	90                   	nop

00100954 <sys_exit>:
  100954:	55                   	push   %ebp
  100955:	89 e5                	mov    %esp,%ebp
  100957:	57                   	push   %edi
  100958:	56                   	push   %esi
  100959:	8b 0d 80 29 10 00    	mov    0x102980,%ecx
  10095f:	89 c8                	mov    %ecx,%eax
  100961:	c1 e0 06             	shl    $0x6,%eax
  100964:	29 c8                	sub    %ecx,%eax
  100966:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100969:	c1 e0 05             	shl    $0x5,%eax
  10096c:	c7 80 3c 49 10 00 00 	movl   $0x0,0x10493c(%eax)
  100973:	00 00 00 
  100976:	ba dc 68 10 00       	mov    $0x1068dc,%edx
  10097b:	b8 01 00 00 00       	mov    $0x1,%eax
  100980:	eb 0e                	jmp    100990 <sys_exit+0x3c>
  100982:	66 90                	xchg   %ax,%ax
  100984:	40                   	inc    %eax
  100985:	81 c2 a0 1f 00 00    	add    $0x1fa0,%edx
  10098b:	83 f8 08             	cmp    $0x8,%eax
  10098e:	74 14                	je     1009a4 <sys_exit+0x50>
  100990:	83 3a 01             	cmpl   $0x1,(%edx)
  100993:	75 ef                	jne    100984 <sys_exit+0x30>
  100995:	83 7a f0 02          	cmpl   $0x2,-0x10(%edx)
  100999:	75 e9                	jne    100984 <sys_exit+0x30>
  10099b:	39 c1                	cmp    %eax,%ecx
  10099d:	74 e5                	je     100984 <sys_exit+0x30>
  10099f:	89 c2                	mov    %eax,%edx
  1009a1:	eb 05                	jmp    1009a8 <sys_exit+0x54>
  1009a3:	90                   	nop
  1009a4:	31 d2                	xor    %edx,%edx
  1009a6:	31 c0                	xor    %eax,%eax
  1009a8:	89 c1                	mov    %eax,%ecx
  1009aa:	c1 e1 06             	shl    $0x6,%ecx
  1009ad:	29 c1                	sub    %eax,%ecx
  1009af:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  1009b2:	c1 e1 05             	shl    $0x5,%ecx
  1009b5:	c7 81 2c 49 10 00 01 	movl   $0x1,0x10492c(%ecx)
  1009bc:	00 00 00 
  1009bf:	c7 81 30 49 10 00 0a 	movl   $0xa,0x104930(%ecx)
  1009c6:	00 00 00 
  1009c9:	a3 80 29 10 00       	mov    %eax,0x102980
  1009ce:	b9 cc 68 10 00       	mov    $0x1068cc,%ecx
  1009d3:	eb 11                	jmp    1009e6 <sys_exit+0x92>
  1009d5:	8d 76 00             	lea    0x0(%esi),%esi
  1009d8:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  1009de:	81 f9 2c 46 11 00    	cmp    $0x11462c,%ecx
  1009e4:	74 36                	je     100a1c <sys_exit+0xc8>
  1009e6:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  1009ea:	75 30                	jne    100a1c <sys_exit+0xc8>
  1009ec:	83 39 03             	cmpl   $0x3,(%ecx)
  1009ef:	75 e7                	jne    1009d8 <sys_exit+0x84>
  1009f1:	8b 79 08             	mov    0x8(%ecx),%edi
  1009f4:	8d 77 ff             	lea    -0x1(%edi),%esi
  1009f7:	89 71 08             	mov    %esi,0x8(%ecx)
  1009fa:	85 f6                	test   %esi,%esi
  1009fc:	7f da                	jg     1009d8 <sys_exit+0x84>
  1009fe:	c7 01 02 00 00 00    	movl   $0x2,(%ecx)
  100a04:	c7 41 04 0a 00 00 00 	movl   $0xa,0x4(%ecx)
  100a0b:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  100a11:	81 f9 2c 46 11 00    	cmp    $0x11462c,%ecx
  100a17:	75 cd                	jne    1009e6 <sys_exit+0x92>
  100a19:	8d 76 00             	lea    0x0(%esi),%esi
  100a1c:	89 c1                	mov    %eax,%ecx
  100a1e:	c1 e1 06             	shl    $0x6,%ecx
  100a21:	29 c1                	sub    %eax,%ecx
  100a23:	8d 34 88             	lea    (%eax,%ecx,4),%esi
  100a26:	c1 e6 05             	shl    $0x5,%esi
  100a29:	81 c6 e0 48 10 00    	add    $0x1048e0,%esi
  100a2f:	b9 13 00 00 00       	mov    $0x13,%ecx
  100a34:	8b 7d 08             	mov    0x8(%ebp),%edi
  100a37:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100a39:	83 fa 01             	cmp    $0x1,%edx
  100a3c:	76 12                	jbe    100a50 <sys_exit+0xfc>
  100a3e:	83 f8 02             	cmp    $0x2,%eax
  100a41:	75 07                	jne    100a4a <sys_exit+0xf6>
  100a43:	c6 05 27 27 11 00 01 	movb   $0x1,0x112727
  100a4a:	31 c0                	xor    %eax,%eax
  100a4c:	5e                   	pop    %esi
  100a4d:	5f                   	pop    %edi
  100a4e:	5d                   	pop    %ebp
  100a4f:	c3                   	ret    
  100a50:	c6 05 27 27 11 00 00 	movb   $0x0,0x112727
  100a57:	31 c0                	xor    %eax,%eax
  100a59:	5e                   	pop    %esi
  100a5a:	5f                   	pop    %edi
  100a5b:	5d                   	pop    %ebp
  100a5c:	c3                   	ret    
  100a5d:	66 90                	xchg   %ax,%ax
  100a5f:	90                   	nop

00100a60 <waitDisk>:
  100a60:	55                   	push   %ebp
  100a61:	89 e5                	mov    %esp,%ebp
  100a63:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100a68:	ec                   	in     (%dx),%al
  100a69:	83 e0 c0             	and    $0xffffffc0,%eax
  100a6c:	3c 40                	cmp    $0x40,%al
  100a6e:	75 f8                	jne    100a68 <waitDisk+0x8>
  100a70:	5d                   	pop    %ebp
  100a71:	c3                   	ret    
  100a72:	66 90                	xchg   %ax,%ax

00100a74 <readSect>:
  100a74:	55                   	push   %ebp
  100a75:	89 e5                	mov    %esp,%ebp
  100a77:	53                   	push   %ebx
  100a78:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100a7b:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100a80:	ec                   	in     (%dx),%al
  100a81:	83 e0 c0             	and    $0xffffffc0,%eax
  100a84:	3c 40                	cmp    $0x40,%al
  100a86:	75 f8                	jne    100a80 <readSect+0xc>
  100a88:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100a8d:	b0 01                	mov    $0x1,%al
  100a8f:	ee                   	out    %al,(%dx)
  100a90:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100a95:	88 c8                	mov    %cl,%al
  100a97:	ee                   	out    %al,(%dx)
  100a98:	89 c8                	mov    %ecx,%eax
  100a9a:	c1 f8 08             	sar    $0x8,%eax
  100a9d:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100aa2:	ee                   	out    %al,(%dx)
  100aa3:	89 c8                	mov    %ecx,%eax
  100aa5:	c1 f8 10             	sar    $0x10,%eax
  100aa8:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100aad:	ee                   	out    %al,(%dx)
  100aae:	89 c8                	mov    %ecx,%eax
  100ab0:	c1 f8 18             	sar    $0x18,%eax
  100ab3:	83 c8 e0             	or     $0xffffffe0,%eax
  100ab6:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100abb:	ee                   	out    %al,(%dx)
  100abc:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100ac1:	b0 20                	mov    $0x20,%al
  100ac3:	ee                   	out    %al,(%dx)
  100ac4:	ec                   	in     (%dx),%al
  100ac5:	83 e0 c0             	and    $0xffffffc0,%eax
  100ac8:	3c 40                	cmp    $0x40,%al
  100aca:	75 f8                	jne    100ac4 <readSect+0x50>
  100acc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100acf:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100ad5:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100ada:	66 90                	xchg   %ax,%ax
  100adc:	ed                   	in     (%dx),%eax
  100add:	89 01                	mov    %eax,(%ecx)
  100adf:	83 c1 04             	add    $0x4,%ecx
  100ae2:	39 d9                	cmp    %ebx,%ecx
  100ae4:	75 f6                	jne    100adc <readSect+0x68>
  100ae6:	5b                   	pop    %ebx
  100ae7:	5d                   	pop    %ebp
  100ae8:	c3                   	ret    
  100ae9:	8d 76 00             	lea    0x0(%esi),%esi

00100aec <initSeg>:
  100aec:	55                   	push   %ebp
  100aed:	89 e5                	mov    %esp,%ebp
  100aef:	b9 00 27 11 00       	mov    $0x112700,%ecx
  100af4:	66 c7 05 08 27 11 00 	movw   $0xffff,0x112708
  100afb:	ff ff 
  100afd:	66 c7 05 0a 27 11 00 	movw   $0x0,0x11270a
  100b04:	00 00 
  100b06:	c6 05 0c 27 11 00 00 	movb   $0x0,0x11270c
  100b0d:	c6 05 0d 27 11 00 9a 	movb   $0x9a,0x11270d
  100b14:	c6 05 0e 27 11 00 cf 	movb   $0xcf,0x11270e
  100b1b:	c6 05 0f 27 11 00 00 	movb   $0x0,0x11270f
  100b22:	66 c7 05 10 27 11 00 	movw   $0xffff,0x112710
  100b29:	ff ff 
  100b2b:	66 c7 05 12 27 11 00 	movw   $0x0,0x112712
  100b32:	00 00 
  100b34:	c6 05 14 27 11 00 00 	movb   $0x0,0x112714
  100b3b:	c6 05 15 27 11 00 92 	movb   $0x92,0x112715
  100b42:	c6 05 16 27 11 00 cf 	movb   $0xcf,0x112716
  100b49:	c6 05 17 27 11 00 00 	movb   $0x0,0x112717
  100b50:	66 c7 05 18 27 11 00 	movw   $0xffff,0x112718
  100b57:	ff ff 
  100b59:	66 c7 05 1a 27 11 00 	movw   $0x0,0x11271a
  100b60:	00 00 
  100b62:	c6 05 1c 27 11 00 00 	movb   $0x0,0x11271c
  100b69:	c6 05 1d 27 11 00 fa 	movb   $0xfa,0x11271d
  100b70:	c6 05 1e 27 11 00 cf 	movb   $0xcf,0x11271e
  100b77:	c6 05 1f 27 11 00 00 	movb   $0x0,0x11271f
  100b7e:	66 c7 05 20 27 11 00 	movw   $0xffff,0x112720
  100b85:	ff ff 
  100b87:	66 c7 05 22 27 11 00 	movw   $0x0,0x112722
  100b8e:	00 00 
  100b90:	c6 05 24 27 11 00 00 	movb   $0x0,0x112724
  100b97:	c6 05 25 27 11 00 f2 	movb   $0xf2,0x112725
  100b9e:	c6 05 26 27 11 00 cf 	movb   $0xcf,0x112726
  100ba5:	c6 05 27 27 11 00 00 	movb   $0x0,0x112727
  100bac:	66 c7 05 28 27 11 00 	movw   $0x63,0x112728
  100bb3:	63 00 
  100bb5:	b8 40 27 11 00       	mov    $0x112740,%eax
  100bba:	66 a3 2a 27 11 00    	mov    %ax,0x11272a
  100bc0:	89 c2                	mov    %eax,%edx
  100bc2:	c1 ea 10             	shr    $0x10,%edx
  100bc5:	88 15 2c 27 11 00    	mov    %dl,0x11272c
  100bcb:	c6 05 2d 27 11 00 89 	movb   $0x89,0x11272d
  100bd2:	c6 05 2e 27 11 00 40 	movb   $0x40,0x11272e
  100bd9:	c1 e8 18             	shr    $0x18,%eax
  100bdc:	a2 2f 27 11 00       	mov    %al,0x11272f
  100be1:	a1 d4 13 10 00       	mov    0x1013d4,%eax
  100be6:	8b 15 d8 13 10 00    	mov    0x1013d8,%edx
  100bec:	a3 30 27 11 00       	mov    %eax,0x112730
  100bf1:	89 15 34 27 11 00    	mov    %edx,0x112734
  100bf7:	66 c7 05 68 29 10 00 	movw   $0x37,0x102968
  100bfe:	37 00 
  100c00:	66 89 0d 6a 29 10 00 	mov    %cx,0x10296a
  100c07:	c1 e9 10             	shr    $0x10,%ecx
  100c0a:	66 89 0d 6c 29 10 00 	mov    %cx,0x10296c
  100c11:	b8 68 29 10 00       	mov    $0x102968,%eax
  100c16:	0f 01 10             	lgdtl  (%eax)
  100c19:	c7 05 48 27 11 00 10 	movl   $0x10,0x112748
  100c20:	00 00 00 
  100c23:	c7 05 44 27 11 00 00 	movl   $0x8000000,0x112744
  100c2a:	00 00 08 
  100c2d:	b8 28 00 00 00       	mov    $0x28,%eax
  100c32:	0f 00 d8             	ltr    %ax
  100c35:	66 b8 10 00          	mov    $0x10,%ax
  100c39:	8e d8                	mov    %eax,%ds
  100c3b:	8e c0                	mov    %eax,%es
  100c3d:	8e d0                	mov    %eax,%ss
  100c3f:	8e e0                	mov    %eax,%fs
  100c41:	66 b8 30 00          	mov    $0x30,%ax
  100c45:	8e e8                	mov    %eax,%gs
  100c47:	31 c0                	xor    %eax,%eax
  100c49:	0f 00 d0             	lldt   %ax
  100c4c:	5d                   	pop    %ebp
  100c4d:	c3                   	ret    
  100c4e:	66 90                	xchg   %ax,%ax

00100c50 <enterUserSpace>:
  100c50:	55                   	push   %ebp
  100c51:	89 e5                	mov    %esp,%ebp
  100c53:	83 ec 10             	sub    $0x10,%esp
  100c56:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
  100c5d:	b8 23 00 00 00       	mov    $0x23,%eax
  100c62:	8e c0                	mov    %eax,%es
  100c64:	8e d8                	mov    %eax,%ds
  100c66:	66 6a 23             	pushw  $0x23
  100c69:	68 00 00 00 06       	push   $0x6000000
  100c6e:	ff 75 fc             	pushl  -0x4(%ebp)
  100c71:	6a 1b                	push   $0x1b
  100c73:	ff 75 08             	pushl  0x8(%ebp)
  100c76:	fb                   	sti    
  100c77:	cf                   	iret   
  100c78:	c9                   	leave  
  100c79:	c3                   	ret    
  100c7a:	66 90                	xchg   %ax,%ax

00100c7c <loadUMain>:
  100c7c:	55                   	push   %ebp
  100c7d:	89 e5                	mov    %esp,%ebp
  100c7f:	57                   	push   %edi
  100c80:	56                   	push   %esi
  100c81:	53                   	push   %ebx
  100c82:	81 ec 04 90 01 00    	sub    $0x19004,%esp
  100c88:	be c9 00 00 00       	mov    $0xc9,%esi
  100c8d:	8d 9d f4 6f fe ff    	lea    -0x1900c(%ebp),%ebx
  100c93:	8d bd f4 87 fe ff    	lea    -0x1780c(%ebp),%edi
  100c99:	8d 76 00             	lea    0x0(%esi),%esi
  100c9c:	56                   	push   %esi
  100c9d:	53                   	push   %ebx
  100c9e:	e8 d1 fd ff ff       	call   100a74 <readSect>
  100ca3:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100ca9:	46                   	inc    %esi
  100caa:	5a                   	pop    %edx
  100cab:	59                   	pop    %ecx
  100cac:	39 fb                	cmp    %edi,%ebx
  100cae:	75 ec                	jne    100c9c <loadUMain+0x20>
  100cb0:	8d 95 f4 6f fe ff    	lea    -0x1900c(%ebp),%edx
  100cb6:	03 95 10 70 fe ff    	add    -0x18ff0(%ebp),%edx
  100cbc:	0f b7 85 20 70 fe ff 	movzwl -0x18fe0(%ebp),%eax
  100cc3:	89 c1                	mov    %eax,%ecx
  100cc5:	c1 e0 05             	shl    $0x5,%eax
  100cc8:	01 d0                	add    %edx,%eax
  100cca:	89 85 f0 6f fe ff    	mov    %eax,-0x19010(%ebp)
  100cd0:	39 c2                	cmp    %eax,%edx
  100cd2:	73 67                	jae    100d3b <loadUMain+0xbf>
  100cd4:	31 c0                	xor    %eax,%eax
  100cd6:	66 90                	xchg   %ax,%ax
  100cd8:	31 db                	xor    %ebx,%ebx
  100cda:	66 85 c9             	test   %cx,%cx
  100cdd:	75 14                	jne    100cf3 <loadUMain+0x77>
  100cdf:	eb 47                	jmp    100d28 <loadUMain+0xac>
  100ce1:	8d 76 00             	lea    0x0(%esi),%esi
  100ce4:	43                   	inc    %ebx
  100ce5:	83 c2 20             	add    $0x20,%edx
  100ce8:	0f b7 8d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ecx
  100cef:	39 d9                	cmp    %ebx,%ecx
  100cf1:	7e 35                	jle    100d28 <loadUMain+0xac>
  100cf3:	83 3a 01             	cmpl   $0x1,(%edx)
  100cf6:	75 ec                	jne    100ce4 <loadUMain+0x68>
  100cf8:	8d b5 f4 6f fe ff    	lea    -0x1900c(%ebp),%esi
  100cfe:	03 72 04             	add    0x4(%edx),%esi
  100d01:	8b 4a 14             	mov    0x14(%edx),%ecx
  100d04:	8b 7a 08             	mov    0x8(%edx),%edi
  100d07:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100d09:	8b 72 10             	mov    0x10(%edx),%esi
  100d0c:	8b 4a 14             	mov    0x14(%edx),%ecx
  100d0f:	29 f1                	sub    %esi,%ecx
  100d11:	03 72 08             	add    0x8(%edx),%esi
  100d14:	89 f7                	mov    %esi,%edi
  100d16:	f3 aa                	rep stos %al,%es:(%edi)
  100d18:	43                   	inc    %ebx
  100d19:	83 c2 20             	add    $0x20,%edx
  100d1c:	0f b7 8d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ecx
  100d23:	39 d9                	cmp    %ebx,%ecx
  100d25:	7f cc                	jg     100cf3 <loadUMain+0x77>
  100d27:	90                   	nop
  100d28:	83 c2 20             	add    $0x20,%edx
  100d2b:	39 95 f0 6f fe ff    	cmp    %edx,-0x19010(%ebp)
  100d31:	76 08                	jbe    100d3b <loadUMain+0xbf>
  100d33:	8b 8d 20 70 fe ff    	mov    -0x18fe0(%ebp),%ecx
  100d39:	eb 9d                	jmp    100cd8 <loadUMain+0x5c>
  100d3b:	ff b5 0c 70 fe ff    	pushl  -0x18ff4(%ebp)
  100d41:	e8 0a ff ff ff       	call   100c50 <enterUserSpace>
  100d46:	58                   	pop    %eax
  100d47:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100d4a:	5b                   	pop    %ebx
  100d4b:	5e                   	pop    %esi
  100d4c:	5f                   	pop    %edi
  100d4d:	5d                   	pop    %ebp
  100d4e:	c3                   	ret    
  100d4f:	90                   	nop

00100d50 <sys_init>:
  100d50:	55                   	push   %ebp
  100d51:	89 e5                	mov    %esp,%ebp
  100d53:	8b 45 08             	mov    0x8(%ebp),%eax
  100d56:	8b 40 20             	mov    0x20(%eax),%eax
  100d59:	a3 a0 26 11 00       	mov    %eax,0x1126a0
  100d5e:	b8 a4 26 11 00       	mov    $0x1126a4,%eax
  100d63:	90                   	nop
  100d64:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
  100d6a:	83 c0 04             	add    $0x4,%eax
  100d6d:	3d cc 26 11 00       	cmp    $0x1126cc,%eax
  100d72:	75 f0                	jne    100d64 <sys_init+0x14>
  100d74:	c7 05 cc 26 11 00 00 	movl   $0x0,0x1126cc
  100d7b:	00 00 00 
  100d7e:	31 c0                	xor    %eax,%eax
  100d80:	5d                   	pop    %ebp
  100d81:	c3                   	ret    
  100d82:	66 90                	xchg   %ax,%ax

00100d84 <sys_wait>:
  100d84:	ff 0d a0 26 11 00    	decl   0x1126a0
  100d8a:	78 04                	js     100d90 <sys_wait+0xc>
  100d8c:	31 c0                	xor    %eax,%eax
  100d8e:	c3                   	ret    
  100d8f:	90                   	nop
  100d90:	55                   	push   %ebp
  100d91:	89 e5                	mov    %esp,%ebp
  100d93:	57                   	push   %edi
  100d94:	56                   	push   %esi
  100d95:	53                   	push   %ebx
  100d96:	a1 cc 26 11 00       	mov    0x1126cc,%eax
  100d9b:	8b 15 80 29 10 00    	mov    0x102980,%edx
  100da1:	89 14 85 a4 26 11 00 	mov    %edx,0x1126a4(,%eax,4)
  100da8:	40                   	inc    %eax
  100da9:	a3 cc 26 11 00       	mov    %eax,0x1126cc
  100dae:	89 d0                	mov    %edx,%eax
  100db0:	c1 e0 06             	shl    $0x6,%eax
  100db3:	29 d0                	sub    %edx,%eax
  100db5:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100db8:	c1 e3 05             	shl    $0x5,%ebx
  100dbb:	8d 83 e0 48 10 00    	lea    0x1048e0(%ebx),%eax
  100dc1:	b9 13 00 00 00       	mov    $0x13,%ecx
  100dc6:	89 c7                	mov    %eax,%edi
  100dc8:	8b 75 08             	mov    0x8(%ebp),%esi
  100dcb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100dcd:	c7 83 2c 49 10 00 03 	movl   $0x3,0x10492c(%ebx)
  100dd4:	00 00 00 
  100dd7:	c7 83 30 49 10 00 00 	movl   $0x0,0x104930(%ebx)
  100dde:	00 00 00 
  100de1:	c7 83 34 49 10 00 e8 	movl   $0x3e8,0x104934(%ebx)
  100de8:	03 00 00 
  100deb:	b8 3c 49 10 00       	mov    $0x10493c,%eax
  100df0:	31 db                	xor    %ebx,%ebx
  100df2:	eb 0b                	jmp    100dff <sys_wait+0x7b>
  100df4:	43                   	inc    %ebx
  100df5:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100dfa:	83 fb 08             	cmp    $0x8,%ebx
  100dfd:	74 55                	je     100e54 <sys_wait+0xd0>
  100dff:	83 38 01             	cmpl   $0x1,(%eax)
  100e02:	75 f0                	jne    100df4 <sys_wait+0x70>
  100e04:	83 78 f0 02          	cmpl   $0x2,-0x10(%eax)
  100e08:	75 ea                	jne    100df4 <sys_wait+0x70>
  100e0a:	39 da                	cmp    %ebx,%edx
  100e0c:	74 e6                	je     100df4 <sys_wait+0x70>
  100e0e:	89 d8                	mov    %ebx,%eax
  100e10:	c1 e0 06             	shl    $0x6,%eax
  100e13:	29 d8                	sub    %ebx,%eax
  100e15:	8d 34 83             	lea    (%ebx,%eax,4),%esi
  100e18:	c1 e6 05             	shl    $0x5,%esi
  100e1b:	c7 86 2c 49 10 00 01 	movl   $0x1,0x10492c(%esi)
  100e22:	00 00 00 
  100e25:	c7 86 30 49 10 00 0a 	movl   $0xa,0x104930(%esi)
  100e2c:	00 00 00 
  100e2f:	89 1d 80 29 10 00    	mov    %ebx,0x102980
  100e35:	81 c6 e0 48 10 00    	add    $0x1048e0,%esi
  100e3b:	b9 13 00 00 00       	mov    $0x13,%ecx
  100e40:	8b 7d 08             	mov    0x8(%ebp),%edi
  100e43:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100e45:	83 fb 01             	cmp    $0x1,%ebx
  100e48:	77 37                	ja     100e81 <sys_wait+0xfd>
  100e4a:	c6 05 27 27 11 00 00 	movb   $0x0,0x112727
  100e51:	eb 35                	jmp    100e88 <sys_wait+0x104>
  100e53:	90                   	nop
  100e54:	c7 05 2c 46 11 00 01 	movl   $0x1,0x11462c
  100e5b:	00 00 00 
  100e5e:	c7 05 30 46 11 00 0a 	movl   $0xa,0x114630
  100e65:	00 00 00 
  100e68:	c7 05 80 29 10 00 08 	movl   $0x8,0x102980
  100e6f:	00 00 00 
  100e72:	be e0 45 11 00       	mov    $0x1145e0,%esi
  100e77:	b9 13 00 00 00       	mov    $0x13,%ecx
  100e7c:	8b 7d 08             	mov    0x8(%ebp),%edi
  100e7f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100e81:	c6 05 27 27 11 00 01 	movb   $0x1,0x112727
  100e88:	66 c7 05 70 29 10 00 	movw   $0x37,0x102970
  100e8f:	37 00 
  100e91:	b8 00 27 11 00       	mov    $0x112700,%eax
  100e96:	66 a3 72 29 10 00    	mov    %ax,0x102972
  100e9c:	c1 e8 10             	shr    $0x10,%eax
  100e9f:	66 a3 74 29 10 00    	mov    %ax,0x102974
  100ea5:	b8 70 29 10 00       	mov    $0x102970,%eax
  100eaa:	0f 01 10             	lgdtl  (%eax)
  100ead:	31 c0                	xor    %eax,%eax
  100eaf:	5b                   	pop    %ebx
  100eb0:	5e                   	pop    %esi
  100eb1:	5f                   	pop    %edi
  100eb2:	5d                   	pop    %ebp
  100eb3:	c3                   	ret    

00100eb4 <sys_post>:
  100eb4:	a1 a0 26 11 00       	mov    0x1126a0,%eax
  100eb9:	40                   	inc    %eax
  100eba:	a3 a0 26 11 00       	mov    %eax,0x1126a0
  100ebf:	85 c0                	test   %eax,%eax
  100ec1:	7e 05                	jle    100ec8 <sys_post+0x14>
  100ec3:	31 c0                	xor    %eax,%eax
  100ec5:	c3                   	ret    
  100ec6:	66 90                	xchg   %ax,%ax
  100ec8:	55                   	push   %ebp
  100ec9:	89 e5                	mov    %esp,%ebp
  100ecb:	53                   	push   %ebx
  100ecc:	a1 a4 26 11 00       	mov    0x1126a4,%eax
  100ed1:	89 c2                	mov    %eax,%edx
  100ed3:	c1 e2 06             	shl    $0x6,%edx
  100ed6:	29 c2                	sub    %eax,%edx
  100ed8:	8d 04 90             	lea    (%eax,%edx,4),%eax
  100edb:	c1 e0 05             	shl    $0x5,%eax
  100ede:	c7 80 2c 49 10 00 02 	movl   $0x2,0x10492c(%eax)
  100ee5:	00 00 00 
  100ee8:	c7 80 30 49 10 00 0a 	movl   $0xa,0x104930(%eax)
  100eef:	00 00 00 
  100ef2:	8b 15 cc 26 11 00    	mov    0x1126cc,%edx
  100ef8:	8d 5a ff             	lea    -0x1(%edx),%ebx
  100efb:	85 db                	test   %ebx,%ebx
  100efd:	7e 19                	jle    100f18 <sys_post+0x64>
  100eff:	b8 a4 26 11 00       	mov    $0x1126a4,%eax
  100f04:	8d 0c 95 a0 26 11 00 	lea    0x1126a0(,%edx,4),%ecx
  100f0b:	90                   	nop
  100f0c:	8b 50 04             	mov    0x4(%eax),%edx
  100f0f:	89 10                	mov    %edx,(%eax)
  100f11:	83 c0 04             	add    $0x4,%eax
  100f14:	39 c8                	cmp    %ecx,%eax
  100f16:	75 f4                	jne    100f0c <sys_post+0x58>
  100f18:	89 1d cc 26 11 00    	mov    %ebx,0x1126cc
  100f1e:	31 c0                	xor    %eax,%eax
  100f20:	5b                   	pop    %ebx
  100f21:	5d                   	pop    %ebp
  100f22:	c3                   	ret    
  100f23:	90                   	nop

00100f24 <sys_destroy>:
  100f24:	55                   	push   %ebp
  100f25:	89 e5                	mov    %esp,%ebp
  100f27:	31 c0                	xor    %eax,%eax
  100f29:	5d                   	pop    %ebp
  100f2a:	c3                   	ret    
  100f2b:	90                   	nop

00100f2c <initIdt>:
  100f2c:	55                   	push   %ebp
  100f2d:	89 e5                	mov    %esp,%ebp
  100f2f:	53                   	push   %ebx
  100f30:	ba 15 13 10 00       	mov    $0x101315,%edx
  100f35:	89 d3                	mov    %edx,%ebx
  100f37:	c1 ea 10             	shr    $0x10,%edx
  100f3a:	b9 c0 2f 11 00       	mov    $0x112fc0,%ecx
  100f3f:	b8 c0 27 11 00       	mov    $0x1127c0,%eax
  100f44:	66 89 18             	mov    %bx,(%eax)
  100f47:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100f4d:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100f51:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100f55:	66 89 50 06          	mov    %dx,0x6(%eax)
  100f59:	83 c0 08             	add    $0x8,%eax
  100f5c:	39 c1                	cmp    %eax,%ecx
  100f5e:	75 e4                	jne    100f44 <initIdt+0x18>
  100f60:	b8 1b 13 10 00       	mov    $0x10131b,%eax
  100f65:	66 a3 c0 27 11 00    	mov    %ax,0x1127c0
  100f6b:	66 c7 05 c2 27 11 00 	movw   $0x8,0x1127c2
  100f72:	08 00 
  100f74:	c6 05 c4 27 11 00 00 	movb   $0x0,0x1127c4
  100f7b:	c6 05 c5 27 11 00 8f 	movb   $0x8f,0x1127c5
  100f82:	c1 e8 10             	shr    $0x10,%eax
  100f85:	66 a3 c6 27 11 00    	mov    %ax,0x1127c6
  100f8b:	b8 21 13 10 00       	mov    $0x101321,%eax
  100f90:	66 a3 c8 27 11 00    	mov    %ax,0x1127c8
  100f96:	66 c7 05 ca 27 11 00 	movw   $0x8,0x1127ca
  100f9d:	08 00 
  100f9f:	c6 05 cc 27 11 00 00 	movb   $0x0,0x1127cc
  100fa6:	c6 05 cd 27 11 00 8f 	movb   $0x8f,0x1127cd
  100fad:	c1 e8 10             	shr    $0x10,%eax
  100fb0:	66 a3 ce 27 11 00    	mov    %ax,0x1127ce
  100fb6:	b8 27 13 10 00       	mov    $0x101327,%eax
  100fbb:	66 a3 d0 27 11 00    	mov    %ax,0x1127d0
  100fc1:	66 c7 05 d2 27 11 00 	movw   $0x8,0x1127d2
  100fc8:	08 00 
  100fca:	c6 05 d4 27 11 00 00 	movb   $0x0,0x1127d4
  100fd1:	c6 05 d5 27 11 00 8f 	movb   $0x8f,0x1127d5
  100fd8:	c1 e8 10             	shr    $0x10,%eax
  100fdb:	66 a3 d6 27 11 00    	mov    %ax,0x1127d6
  100fe1:	b8 2d 13 10 00       	mov    $0x10132d,%eax
  100fe6:	66 a3 d8 27 11 00    	mov    %ax,0x1127d8
  100fec:	66 c7 05 da 27 11 00 	movw   $0x8,0x1127da
  100ff3:	08 00 
  100ff5:	c6 05 dc 27 11 00 00 	movb   $0x0,0x1127dc
  100ffc:	c6 05 dd 27 11 00 8f 	movb   $0x8f,0x1127dd
  101003:	c1 e8 10             	shr    $0x10,%eax
  101006:	66 a3 de 27 11 00    	mov    %ax,0x1127de
  10100c:	b8 33 13 10 00       	mov    $0x101333,%eax
  101011:	66 a3 e0 27 11 00    	mov    %ax,0x1127e0
  101017:	66 c7 05 e2 27 11 00 	movw   $0x8,0x1127e2
  10101e:	08 00 
  101020:	c6 05 e4 27 11 00 00 	movb   $0x0,0x1127e4
  101027:	c6 05 e5 27 11 00 8f 	movb   $0x8f,0x1127e5
  10102e:	c1 e8 10             	shr    $0x10,%eax
  101031:	66 a3 e6 27 11 00    	mov    %ax,0x1127e6
  101037:	b8 39 13 10 00       	mov    $0x101339,%eax
  10103c:	66 a3 e8 27 11 00    	mov    %ax,0x1127e8
  101042:	66 c7 05 ea 27 11 00 	movw   $0x8,0x1127ea
  101049:	08 00 
  10104b:	c6 05 ec 27 11 00 00 	movb   $0x0,0x1127ec
  101052:	c6 05 ed 27 11 00 8f 	movb   $0x8f,0x1127ed
  101059:	c1 e8 10             	shr    $0x10,%eax
  10105c:	66 a3 ee 27 11 00    	mov    %ax,0x1127ee
  101062:	b8 3f 13 10 00       	mov    $0x10133f,%eax
  101067:	66 a3 f0 27 11 00    	mov    %ax,0x1127f0
  10106d:	66 c7 05 f2 27 11 00 	movw   $0x8,0x1127f2
  101074:	08 00 
  101076:	c6 05 f4 27 11 00 00 	movb   $0x0,0x1127f4
  10107d:	c6 05 f5 27 11 00 8f 	movb   $0x8f,0x1127f5
  101084:	c1 e8 10             	shr    $0x10,%eax
  101087:	66 a3 f6 27 11 00    	mov    %ax,0x1127f6
  10108d:	b8 45 13 10 00       	mov    $0x101345,%eax
  101092:	66 a3 f8 27 11 00    	mov    %ax,0x1127f8
  101098:	66 c7 05 fa 27 11 00 	movw   $0x8,0x1127fa
  10109f:	08 00 
  1010a1:	c6 05 fc 27 11 00 00 	movb   $0x0,0x1127fc
  1010a8:	c6 05 fd 27 11 00 8f 	movb   $0x8f,0x1127fd
  1010af:	c1 e8 10             	shr    $0x10,%eax
  1010b2:	66 a3 fe 27 11 00    	mov    %ax,0x1127fe
  1010b8:	b8 4b 13 10 00       	mov    $0x10134b,%eax
  1010bd:	66 a3 00 28 11 00    	mov    %ax,0x112800
  1010c3:	66 c7 05 02 28 11 00 	movw   $0x8,0x112802
  1010ca:	08 00 
  1010cc:	c6 05 04 28 11 00 00 	movb   $0x0,0x112804
  1010d3:	c6 05 05 28 11 00 8f 	movb   $0x8f,0x112805
  1010da:	c1 e8 10             	shr    $0x10,%eax
  1010dd:	66 a3 06 28 11 00    	mov    %ax,0x112806
  1010e3:	b8 4f 13 10 00       	mov    $0x10134f,%eax
  1010e8:	66 a3 08 28 11 00    	mov    %ax,0x112808
  1010ee:	66 c7 05 0a 28 11 00 	movw   $0x8,0x11280a
  1010f5:	08 00 
  1010f7:	c6 05 0c 28 11 00 00 	movb   $0x0,0x11280c
  1010fe:	c6 05 0d 28 11 00 8f 	movb   $0x8f,0x11280d
  101105:	c1 e8 10             	shr    $0x10,%eax
  101108:	66 a3 0e 28 11 00    	mov    %ax,0x11280e
  10110e:	b8 55 13 10 00       	mov    $0x101355,%eax
  101113:	66 a3 10 28 11 00    	mov    %ax,0x112810
  101119:	66 c7 05 12 28 11 00 	movw   $0x8,0x112812
  101120:	08 00 
  101122:	c6 05 14 28 11 00 00 	movb   $0x0,0x112814
  101129:	c6 05 15 28 11 00 8f 	movb   $0x8f,0x112815
  101130:	c1 e8 10             	shr    $0x10,%eax
  101133:	66 a3 16 28 11 00    	mov    %ax,0x112816
  101139:	b8 59 13 10 00       	mov    $0x101359,%eax
  10113e:	66 a3 18 28 11 00    	mov    %ax,0x112818
  101144:	66 c7 05 1a 28 11 00 	movw   $0x8,0x11281a
  10114b:	08 00 
  10114d:	c6 05 1c 28 11 00 00 	movb   $0x0,0x11281c
  101154:	c6 05 1d 28 11 00 8f 	movb   $0x8f,0x11281d
  10115b:	c1 e8 10             	shr    $0x10,%eax
  10115e:	66 a3 1e 28 11 00    	mov    %ax,0x11281e
  101164:	b8 5d 13 10 00       	mov    $0x10135d,%eax
  101169:	66 a3 20 28 11 00    	mov    %ax,0x112820
  10116f:	66 c7 05 22 28 11 00 	movw   $0x8,0x112822
  101176:	08 00 
  101178:	c6 05 24 28 11 00 00 	movb   $0x0,0x112824
  10117f:	c6 05 25 28 11 00 8f 	movb   $0x8f,0x112825
  101186:	c1 e8 10             	shr    $0x10,%eax
  101189:	66 a3 26 28 11 00    	mov    %ax,0x112826
  10118f:	b8 61 13 10 00       	mov    $0x101361,%eax
  101194:	66 a3 30 28 11 00    	mov    %ax,0x112830
  10119a:	66 c7 05 32 28 11 00 	movw   $0x8,0x112832
  1011a1:	08 00 
  1011a3:	c6 05 34 28 11 00 00 	movb   $0x0,0x112834
  1011aa:	c6 05 35 28 11 00 8f 	movb   $0x8f,0x112835
  1011b1:	c1 e8 10             	shr    $0x10,%eax
  1011b4:	66 a3 36 28 11 00    	mov    %ax,0x112836
  1011ba:	b8 65 13 10 00       	mov    $0x101365,%eax
  1011bf:	66 a3 28 28 11 00    	mov    %ax,0x112828
  1011c5:	66 c7 05 2a 28 11 00 	movw   $0x8,0x11282a
  1011cc:	08 00 
  1011ce:	c6 05 2c 28 11 00 00 	movb   $0x0,0x11282c
  1011d5:	c6 05 2d 28 11 00 8f 	movb   $0x8f,0x11282d
  1011dc:	c1 e8 10             	shr    $0x10,%eax
  1011df:	66 a3 2e 28 11 00    	mov    %ax,0x11282e
  1011e5:	b8 69 13 10 00       	mov    $0x101369,%eax
  1011ea:	66 a3 c0 28 11 00    	mov    %ax,0x1128c0
  1011f0:	66 c7 05 c2 28 11 00 	movw   $0x8,0x1128c2
  1011f7:	08 00 
  1011f9:	c6 05 c4 28 11 00 00 	movb   $0x0,0x1128c4
  101200:	c6 05 c5 28 11 00 ee 	movb   $0xee,0x1128c5
  101207:	c1 e8 10             	shr    $0x10,%eax
  10120a:	66 a3 c6 28 11 00    	mov    %ax,0x1128c6
  101210:	b8 6f 13 10 00       	mov    $0x10136f,%eax
  101215:	66 a3 c0 2b 11 00    	mov    %ax,0x112bc0
  10121b:	66 c7 05 c2 2b 11 00 	movw   $0x8,0x112bc2
  101222:	08 00 
  101224:	c6 05 c4 2b 11 00 00 	movb   $0x0,0x112bc4
  10122b:	c6 05 c5 2b 11 00 ee 	movb   $0xee,0x112bc5
  101232:	c1 e8 10             	shr    $0x10,%eax
  101235:	66 a3 c6 2b 11 00    	mov    %ax,0x112bc6
  10123b:	66 c7 05 78 29 10 00 	movw   $0x7ff,0x102978
  101242:	ff 07 
  101244:	b8 c0 27 11 00       	mov    $0x1127c0,%eax
  101249:	66 a3 7a 29 10 00    	mov    %ax,0x10297a
  10124f:	c1 e8 10             	shr    $0x10,%eax
  101252:	66 a3 7c 29 10 00    	mov    %ax,0x10297c
  101258:	b8 78 29 10 00       	mov    $0x102978,%eax
  10125d:	0f 01 18             	lidtl  (%eax)
  101260:	5b                   	pop    %ebx
  101261:	5d                   	pop    %ebp
  101262:	c3                   	ret    
  101263:	90                   	nop

00101264 <initSerial>:
  101264:	55                   	push   %ebp
  101265:	89 e5                	mov    %esp,%ebp
  101267:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10126c:	31 c0                	xor    %eax,%eax
  10126e:	ee                   	out    %al,(%dx)
  10126f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  101274:	b0 80                	mov    $0x80,%al
  101276:	ee                   	out    %al,(%dx)
  101277:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10127c:	b0 01                	mov    $0x1,%al
  10127e:	ee                   	out    %al,(%dx)
  10127f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  101284:	31 c0                	xor    %eax,%eax
  101286:	ee                   	out    %al,(%dx)
  101287:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10128c:	b0 03                	mov    $0x3,%al
  10128e:	ee                   	out    %al,(%dx)
  10128f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  101294:	b0 c7                	mov    $0xc7,%al
  101296:	ee                   	out    %al,(%dx)
  101297:	ba fc 03 00 00       	mov    $0x3fc,%edx
  10129c:	b0 0b                	mov    $0xb,%al
  10129e:	ee                   	out    %al,(%dx)
  10129f:	5d                   	pop    %ebp
  1012a0:	c3                   	ret    
  1012a1:	8d 76 00             	lea    0x0(%esi),%esi

001012a4 <putChar>:
  1012a4:	55                   	push   %ebp
  1012a5:	89 e5                	mov    %esp,%ebp
  1012a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1012aa:	ba fd 03 00 00       	mov    $0x3fd,%edx
  1012af:	90                   	nop
  1012b0:	ec                   	in     (%dx),%al
  1012b1:	a8 20                	test   $0x20,%al
  1012b3:	74 fb                	je     1012b0 <putChar+0xc>
  1012b5:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1012ba:	88 c8                	mov    %cl,%al
  1012bc:	ee                   	out    %al,(%dx)
  1012bd:	5d                   	pop    %ebp
  1012be:	c3                   	ret    
  1012bf:	90                   	nop

001012c0 <initIntr>:
  1012c0:	55                   	push   %ebp
  1012c1:	89 e5                	mov    %esp,%ebp
  1012c3:	ba 21 00 00 00       	mov    $0x21,%edx
  1012c8:	b0 ff                	mov    $0xff,%al
  1012ca:	ee                   	out    %al,(%dx)
  1012cb:	ba a1 00 00 00       	mov    $0xa1,%edx
  1012d0:	ee                   	out    %al,(%dx)
  1012d1:	ba 20 00 00 00       	mov    $0x20,%edx
  1012d6:	b0 11                	mov    $0x11,%al
  1012d8:	ee                   	out    %al,(%dx)
  1012d9:	ba 21 00 00 00       	mov    $0x21,%edx
  1012de:	b0 20                	mov    $0x20,%al
  1012e0:	ee                   	out    %al,(%dx)
  1012e1:	b0 04                	mov    $0x4,%al
  1012e3:	ee                   	out    %al,(%dx)
  1012e4:	b0 03                	mov    $0x3,%al
  1012e6:	ee                   	out    %al,(%dx)
  1012e7:	ba a0 00 00 00       	mov    $0xa0,%edx
  1012ec:	b0 11                	mov    $0x11,%al
  1012ee:	ee                   	out    %al,(%dx)
  1012ef:	ba a1 00 00 00       	mov    $0xa1,%edx
  1012f4:	b0 28                	mov    $0x28,%al
  1012f6:	ee                   	out    %al,(%dx)
  1012f7:	b0 02                	mov    $0x2,%al
  1012f9:	ee                   	out    %al,(%dx)
  1012fa:	b0 03                	mov    $0x3,%al
  1012fc:	ee                   	out    %al,(%dx)
  1012fd:	ba 20 00 00 00       	mov    $0x20,%edx
  101302:	b0 68                	mov    $0x68,%al
  101304:	ee                   	out    %al,(%dx)
  101305:	b0 0a                	mov    $0xa,%al
  101307:	ee                   	out    %al,(%dx)
  101308:	ba a0 00 00 00       	mov    $0xa0,%edx
  10130d:	b0 68                	mov    $0x68,%al
  10130f:	ee                   	out    %al,(%dx)
  101310:	b0 0a                	mov    $0xa,%al
  101312:	ee                   	out    %al,(%dx)
  101313:	5d                   	pop    %ebp
  101314:	c3                   	ret    

00101315 <irqEmpty>:
  101315:	6a 00                	push   $0x0
  101317:	6a ff                	push   $0xffffffff
  101319:	eb 5d                	jmp    101378 <asmDoIrq>

0010131b <irqDivError>:
  10131b:	6a 00                	push   $0x0
  10131d:	6a 00                	push   $0x0
  10131f:	eb 57                	jmp    101378 <asmDoIrq>

00101321 <irqStepOver>:
  101321:	6a 00                	push   $0x0
  101323:	6a 01                	push   $0x1
  101325:	eb 51                	jmp    101378 <asmDoIrq>

00101327 <irqNMIInterrupt>:
  101327:	6a 00                	push   $0x0
  101329:	6a 02                	push   $0x2
  10132b:	eb 4b                	jmp    101378 <asmDoIrq>

0010132d <irqBreakPoint>:
  10132d:	6a 00                	push   $0x0
  10132f:	6a 03                	push   $0x3
  101331:	eb 45                	jmp    101378 <asmDoIrq>

00101333 <irqOverflow>:
  101333:	6a 00                	push   $0x0
  101335:	6a 04                	push   $0x4
  101337:	eb 3f                	jmp    101378 <asmDoIrq>

00101339 <irqBoundTest>:
  101339:	6a 00                	push   $0x0
  10133b:	6a 05                	push   $0x5
  10133d:	eb 39                	jmp    101378 <asmDoIrq>

0010133f <irqInvalidOperation>:
  10133f:	6a 00                	push   $0x0
  101341:	6a 06                	push   $0x6
  101343:	eb 33                	jmp    101378 <asmDoIrq>

00101345 <irqNoCoprocessor>:
  101345:	6a 00                	push   $0x0
  101347:	6a 07                	push   $0x7
  101349:	eb 2d                	jmp    101378 <asmDoIrq>

0010134b <irqDoubleFault>:
  10134b:	6a 08                	push   $0x8
  10134d:	eb 29                	jmp    101378 <asmDoIrq>

0010134f <irqCoprocessorOutofBound>:
  10134f:	6a 00                	push   $0x0
  101351:	6a 09                	push   $0x9
  101353:	eb 23                	jmp    101378 <asmDoIrq>

00101355 <irqInvalidTSS>:
  101355:	6a 0a                	push   $0xa
  101357:	eb 1f                	jmp    101378 <asmDoIrq>

00101359 <irqNoSegment>:
  101359:	6a 0b                	push   $0xb
  10135b:	eb 1b                	jmp    101378 <asmDoIrq>

0010135d <irqStackSegmentFault>:
  10135d:	6a 0c                	push   $0xc
  10135f:	eb 17                	jmp    101378 <asmDoIrq>

00101361 <irqPageFault>:
  101361:	6a 0e                	push   $0xe
  101363:	eb 13                	jmp    101378 <asmDoIrq>

00101365 <irqGProtectFault>:
  101365:	6a 0d                	push   $0xd
  101367:	eb 0f                	jmp    101378 <asmDoIrq>

00101369 <irqTime>:
  101369:	6a 00                	push   $0x0
  10136b:	6a 20                	push   $0x20
  10136d:	eb 09                	jmp    101378 <asmDoIrq>

0010136f <irqSyscall>:
  10136f:	6a 00                	push   $0x0
  101371:	68 80 00 00 00       	push   $0x80
  101376:	eb 00                	jmp    101378 <asmDoIrq>

00101378 <asmDoIrq>:
  101378:	60                   	pusha  
  101379:	1e                   	push   %ds
  10137a:	06                   	push   %es
  10137b:	0f a0                	push   %fs
  10137d:	0f a8                	push   %gs
  10137f:	54                   	push   %esp
  101380:	e8 47 ee ff ff       	call   1001cc <irqHandle>
  101385:	83 c4 04             	add    $0x4,%esp
  101388:	0f a9                	pop    %gs
  10138a:	0f a1                	pop    %fs
  10138c:	07                   	pop    %es
  10138d:	1f                   	pop    %ds
  10138e:	61                   	popa   
  10138f:	83 c4 04             	add    $0x4,%esp
  101392:	83 c4 04             	add    $0x4,%esp
  101395:	cf                   	iret   
