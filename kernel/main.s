
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <initTimer>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	ba 43 00 00 00       	mov    $0x43,%edx
  100008:	b0 34                	mov    $0x34,%al
  10000a:	ee                   	out    %al,(%dx)
  10000b:	ba 40 00 00 00       	mov    $0x40,%edx
  100010:	b0 9b                	mov    $0x9b,%al
  100012:	ee                   	out    %al,(%dx)
  100013:	b0 2e                	mov    $0x2e,%al
  100015:	ee                   	out    %al,(%dx)
  100016:	5d                   	pop    %ebp
  100017:	c3                   	ret    

00100018 <kEntry>:
  100018:	55                   	push   %ebp
  100019:	89 e5                	mov    %esp,%ebp
  10001b:	83 ec 08             	sub    $0x8,%esp
  10001e:	e8 a1 0b 00 00       	call   100bc4 <initSerial>
  100023:	e8 64 08 00 00       	call   10088c <initIdt>
  100028:	e8 f3 0b 00 00       	call   100c20 <initIntr>
  10002d:	ba 43 00 00 00       	mov    $0x43,%edx
  100032:	b0 34                	mov    $0x34,%al
  100034:	ee                   	out    %al,(%dx)
  100035:	ba 40 00 00 00       	mov    $0x40,%edx
  10003a:	b0 9b                	mov    $0x9b,%al
  10003c:	ee                   	out    %al,(%dx)
  10003d:	b0 2e                	mov    $0x2e,%al
  10003f:	ee                   	out    %al,(%dx)
  100040:	e8 3f 06 00 00       	call   100684 <initSeg>
  100045:	fb                   	sti    
  100046:	e8 79 03 00 00       	call   1003c4 <initPcb>
  10004b:	e8 a4 07 00 00       	call   1007f4 <loadUMain>
  100050:	eb fe                	jmp    100050 <kEntry+0x38>
  100052:	66 90                	xchg   %ax,%ax

00100054 <abort>:
  100054:	55                   	push   %ebp
  100055:	89 e5                	mov    %esp,%ebp
  100057:	57                   	push   %edi
  100058:	56                   	push   %esi
  100059:	53                   	push   %ebx
  10005a:	83 ec 1c             	sub    $0x1c,%esp
  10005d:	8b 55 08             	mov    0x8(%ebp),%edx
  100060:	fa                   	cli    
  100061:	8a 02                	mov    (%edx),%al
  100063:	b9 32 20 10 00       	mov    $0x102032,%ecx
  100068:	84 c0                	test   %al,%al
  10006a:	74 0b                	je     100077 <abort+0x23>
  10006c:	41                   	inc    %ecx
  10006d:	42                   	inc    %edx
  10006e:	88 41 ff             	mov    %al,-0x1(%ecx)
  100071:	8a 02                	mov    (%edx),%al
  100073:	84 c0                	test   %al,%al
  100075:	75 f5                	jne    10006c <abort+0x18>
  100077:	c6 01 3a             	movb   $0x3a,(%ecx)
  10007a:	bb 5d 21 10 00       	mov    $0x10215d,%ebx
  10007f:	be 0a 00 00 00       	mov    $0xa,%esi
  100084:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100089:	4b                   	dec    %ebx
  10008a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10008d:	99                   	cltd   
  10008e:	f7 fe                	idiv   %esi
  100090:	8d 42 30             	lea    0x30(%edx),%eax
  100093:	88 45 e7             	mov    %al,-0x19(%ebp)
  100096:	88 03                	mov    %al,(%ebx)
  100098:	89 f8                	mov    %edi,%eax
  10009a:	f7 6d 0c             	imull  0xc(%ebp)
  10009d:	c1 fa 02             	sar    $0x2,%edx
  1000a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1000a3:	c1 f8 1f             	sar    $0x1f,%eax
  1000a6:	29 c2                	sub    %eax,%edx
  1000a8:	89 55 0c             	mov    %edx,0xc(%ebp)
  1000ab:	75 dc                	jne    100089 <abort+0x35>
  1000ad:	41                   	inc    %ecx
  1000ae:	41                   	inc    %ecx
  1000af:	43                   	inc    %ebx
  1000b0:	8a 45 e7             	mov    -0x19(%ebp),%al
  1000b3:	88 41 ff             	mov    %al,-0x1(%ecx)
  1000b6:	8a 03                	mov    (%ebx),%al
  1000b8:	88 45 e7             	mov    %al,-0x19(%ebp)
  1000bb:	84 c0                	test   %al,%al
  1000bd:	75 ef                	jne    1000ae <abort+0x5a>
  1000bf:	c6 01 0a             	movb   $0xa,(%ecx)
  1000c2:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  1000c9:	84 c0                	test   %al,%al
  1000cb:	74 1b                	je     1000e8 <abort+0x94>
  1000cd:	bb 20 20 10 00       	mov    $0x102020,%ebx
  1000d2:	83 ec 0c             	sub    $0xc,%esp
  1000d5:	50                   	push   %eax
  1000d6:	e8 29 0b 00 00       	call   100c04 <putChar>
  1000db:	43                   	inc    %ebx
  1000dc:	0f be 03             	movsbl (%ebx),%eax
  1000df:	83 c4 10             	add    $0x10,%esp
  1000e2:	84 c0                	test   %al,%al
  1000e4:	75 ec                	jne    1000d2 <abort+0x7e>
  1000e6:	66 90                	xchg   %ax,%ax
  1000e8:	f4                   	hlt    
  1000e9:	eb fd                	jmp    1000e8 <abort+0x94>
  1000eb:	90                   	nop

001000ec <sys_write>:
  1000ec:	55                   	push   %ebp
  1000ed:	89 e5                	mov    %esp,%ebp
  1000ef:	56                   	push   %esi
  1000f0:	53                   	push   %ebx
  1000f1:	8b 75 08             	mov    0x8(%ebp),%esi
  1000f4:	8b 5e 28             	mov    0x28(%esi),%ebx
  1000f7:	83 ec 0c             	sub    $0xc,%esp
  1000fa:	0f be c3             	movsbl %bl,%eax
  1000fd:	50                   	push   %eax
  1000fe:	e8 01 0b 00 00       	call   100c04 <putChar>
  100103:	83 c4 10             	add    $0x10,%esp
  100106:	83 fb 0a             	cmp    $0xa,%ebx
  100109:	74 3c                	je     100147 <sys_write+0x5b>
  10010b:	66 b8 10 00          	mov    $0x10,%ax
  10010f:	8e d8                	mov    %eax,%ds
  100111:	8e c0                	mov    %eax,%es
  100113:	66 b8 30 00          	mov    $0x30,%ax
  100117:	8e e8                	mov    %eax,%gs
  100119:	a1 20 21 10 00       	mov    0x102120,%eax
  10011e:	6b c0 50             	imul   $0x50,%eax,%eax
  100121:	03 05 60 21 10 00    	add    0x102160,%eax
  100127:	6b c0 02             	imul   $0x2,%eax,%eax
  10012a:	89 c7                	mov    %eax,%edi
  10012c:	8a 46 28             	mov    0x28(%esi),%al
  10012f:	b4 0f                	mov    $0xf,%ah
  100131:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100135:	a1 60 21 10 00       	mov    0x102160,%eax
  10013a:	40                   	inc    %eax
  10013b:	a3 60 21 10 00       	mov    %eax,0x102160
  100140:	3d 9f 00 00 00       	cmp    $0x9f,%eax
  100145:	7e 10                	jle    100157 <sys_write+0x6b>
  100147:	ff 05 20 21 10 00    	incl   0x102120
  10014d:	c7 05 60 21 10 00 00 	movl   $0x0,0x102160
  100154:	00 00 00 
  100157:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10015a:	5b                   	pop    %ebx
  10015b:	5e                   	pop    %esi
  10015c:	5d                   	pop    %ebp
  10015d:	c3                   	ret    
  10015e:	66 90                	xchg   %ax,%ax

00100160 <syscallHandle>:
  100160:	55                   	push   %ebp
  100161:	89 e5                	mov    %esp,%ebp
  100163:	53                   	push   %ebx
  100164:	50                   	push   %eax
  100165:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100168:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10016b:	83 f8 02             	cmp    $0x2,%eax
  10016e:	74 2c                	je     10019c <syscallHandle+0x3c>
  100170:	83 f8 04             	cmp    $0x4,%eax
  100173:	75 0f                	jne    100184 <syscallHandle+0x24>
  100175:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100178:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10017b:	c9                   	leave  
  10017c:	e9 6b ff ff ff       	jmp    1000ec <sys_write>
  100181:	8d 76 00             	lea    0x0(%esi),%esi
  100184:	83 ec 08             	sub    $0x8,%esp
  100187:	6a 60                	push   $0x60
  100189:	68 f4 0c 10 00       	push   $0x100cf4
  10018e:	e8 c1 fe ff ff       	call   100054 <abort>
  100193:	83 c4 10             	add    $0x10,%esp
  100196:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100199:	c9                   	leave  
  10019a:	c3                   	ret    
  10019b:	90                   	nop
  10019c:	83 ec 0c             	sub    $0xc,%esp
  10019f:	6a 66                	push   $0x66
  1001a1:	e8 5e 0a 00 00       	call   100c04 <putChar>
  1001a6:	c7 04 24 6f 00 00 00 	movl   $0x6f,(%esp)
  1001ad:	e8 52 0a 00 00       	call   100c04 <putChar>
  1001b2:	c7 04 24 72 00 00 00 	movl   $0x72,(%esp)
  1001b9:	e8 46 0a 00 00       	call   100c04 <putChar>
  1001be:	c7 04 24 6b 00 00 00 	movl   $0x6b,(%esp)
  1001c5:	e8 3a 0a 00 00       	call   100c04 <putChar>
  1001ca:	83 c4 10             	add    $0x10,%esp
  1001cd:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1001d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001d3:	c9                   	leave  
  1001d4:	e9 ef 02 00 00       	jmp    1004c8 <sys_fork>
  1001d9:	8d 76 00             	lea    0x0(%esi),%esi

001001dc <irqHandle>:
  1001dc:	55                   	push   %ebp
  1001dd:	89 e5                	mov    %esp,%ebp
  1001df:	83 ec 08             	sub    $0x8,%esp
  1001e2:	8b 55 08             	mov    0x8(%ebp),%edx
  1001e5:	b8 10 00 00 00       	mov    $0x10,%eax
  1001ea:	8e c0                	mov    %eax,%es
  1001ec:	8e d8                	mov    %eax,%ds
  1001ee:	8e d0                	mov    %eax,%ss
  1001f0:	8b 42 30             	mov    0x30(%edx),%eax
  1001f3:	83 f8 0d             	cmp    $0xd,%eax
  1001f6:	74 40                	je     100238 <irqHandle+0x5c>
  1001f8:	7e 22                	jle    10021c <irqHandle+0x40>
  1001fa:	83 f8 20             	cmp    $0x20,%eax
  1001fd:	74 11                	je     100210 <irqHandle+0x34>
  1001ff:	83 c0 80             	add    $0xffffff80,%eax
  100202:	75 20                	jne    100224 <irqHandle+0x48>
  100204:	89 55 08             	mov    %edx,0x8(%ebp)
  100207:	c9                   	leave  
  100208:	e9 53 ff ff ff       	jmp    100160 <syscallHandle>
  10020d:	8d 76 00             	lea    0x0(%esi),%esi
  100210:	89 55 08             	mov    %edx,0x8(%ebp)
  100213:	c9                   	leave  
  100214:	e9 53 00 00 00       	jmp    10026c <Intrtime>
  100219:	8d 76 00             	lea    0x0(%esi),%esi
  10021c:	40                   	inc    %eax
  10021d:	75 05                	jne    100224 <irqHandle+0x48>
  10021f:	c9                   	leave  
  100220:	c3                   	ret    
  100221:	8d 76 00             	lea    0x0(%esi),%esi
  100224:	83 ec 08             	sub    $0x8,%esp
  100227:	6a 28                	push   $0x28
  100229:	68 f4 0c 10 00       	push   $0x100cf4
  10022e:	e8 21 fe ff ff       	call   100054 <abort>
  100233:	83 c4 10             	add    $0x10,%esp
  100236:	c9                   	leave  
  100237:	c3                   	ret    
  100238:	83 ec 08             	sub    $0x8,%esp
  10023b:	6a 65                	push   $0x65
  10023d:	68 f4 0c 10 00       	push   $0x100cf4
  100242:	e8 0d fe ff ff       	call   100054 <abort>
  100247:	83 c4 10             	add    $0x10,%esp
  10024a:	c9                   	leave  
  10024b:	c3                   	ret    

0010024c <GProtectFaultHandle>:
  10024c:	55                   	push   %ebp
  10024d:	89 e5                	mov    %esp,%ebp
  10024f:	83 ec 10             	sub    $0x10,%esp
  100252:	6a 65                	push   $0x65
  100254:	68 f4 0c 10 00       	push   $0x100cf4
  100259:	e8 f6 fd ff ff       	call   100054 <abort>
  10025e:	83 c4 10             	add    $0x10,%esp
  100261:	c9                   	leave  
  100262:	c3                   	ret    
  100263:	90                   	nop

00100264 <IDLE>:
  100264:	55                   	push   %ebp
  100265:	89 e5                	mov    %esp,%ebp
  100267:	90                   	nop
  100268:	f4                   	hlt    
  100269:	eb fd                	jmp    100268 <IDLE+0x4>
  10026b:	90                   	nop

0010026c <Intrtime>:
  10026c:	55                   	push   %ebp
  10026d:	89 e5                	mov    %esp,%ebp
  10026f:	57                   	push   %edi
  100270:	56                   	push   %esi
  100271:	53                   	push   %ebx
  100272:	8b 15 80 21 10 00    	mov    0x102180,%edx
  100278:	89 d0                	mov    %edx,%eax
  10027a:	c1 e0 06             	shl    $0x6,%eax
  10027d:	29 d0                	sub    %edx,%eax
  10027f:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100282:	c1 e3 05             	shl    $0x5,%ebx
  100285:	8d 83 e0 40 10 00    	lea    0x1040e0(%ebx),%eax
  10028b:	b9 13 00 00 00       	mov    $0x13,%ecx
  100290:	89 c7                	mov    %eax,%edi
  100292:	8b 75 08             	mov    0x8(%ebp),%esi
  100295:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100297:	ff 8b 30 41 10 00    	decl   0x104130(%ebx)
  10029d:	b8 d4 60 10 00       	mov    $0x1060d4,%eax
  1002a2:	eb 20                	jmp    1002c4 <Intrtime+0x58>
  1002a4:	8b 08                	mov    (%eax),%ecx
  1002a6:	85 c9                	test   %ecx,%ecx
  1002a8:	75 0e                	jne    1002b8 <Intrtime+0x4c>
  1002aa:	c7 40 f8 02 00 00 00 	movl   $0x2,-0x8(%eax)
  1002b1:	c7 40 fc 0a 00 00 00 	movl   $0xa,-0x4(%eax)
  1002b8:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1002bd:	3d 34 3e 11 00       	cmp    $0x113e34,%eax
  1002c2:	74 18                	je     1002dc <Intrtime+0x70>
  1002c4:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  1002c8:	75 12                	jne    1002dc <Intrtime+0x70>
  1002ca:	83 78 f8 03          	cmpl   $0x3,-0x8(%eax)
  1002ce:	75 d4                	jne    1002a4 <Intrtime+0x38>
  1002d0:	8b 38                	mov    (%eax),%edi
  1002d2:	8d 4f ff             	lea    -0x1(%edi),%ecx
  1002d5:	89 08                	mov    %ecx,(%eax)
  1002d7:	eb cd                	jmp    1002a6 <Intrtime+0x3a>
  1002d9:	8d 76 00             	lea    0x0(%esi),%esi
  1002dc:	89 d0                	mov    %edx,%eax
  1002de:	c1 e0 06             	shl    $0x6,%eax
  1002e1:	29 d0                	sub    %edx,%eax
  1002e3:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1002e6:	c1 e0 05             	shl    $0x5,%eax
  1002e9:	05 a0 21 10 00       	add    $0x1021a0,%eax
  1002ee:	8b 88 90 1f 00 00    	mov    0x1f90(%eax),%ecx
  1002f4:	85 c9                	test   %ecx,%ecx
  1002f6:	0f 85 98 00 00 00    	jne    100394 <Intrtime+0x128>
  1002fc:	85 d2                	test   %edx,%edx
  1002fe:	0f 84 94 00 00 00    	je     100398 <Intrtime+0x12c>
  100304:	c7 80 8c 1f 00 00 02 	movl   $0x2,0x1f8c(%eax)
  10030b:	00 00 00 
  10030e:	b8 cc 60 10 00       	mov    $0x1060cc,%eax
  100313:	31 d2                	xor    %edx,%edx
  100315:	b9 01 00 00 00       	mov    $0x1,%ecx
  10031a:	eb 0b                	jmp    100327 <Intrtime+0xbb>
  10031c:	41                   	inc    %ecx
  10031d:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100322:	83 f9 08             	cmp    $0x8,%ecx
  100325:	74 19                	je     100340 <Intrtime+0xd4>
  100327:	83 38 02             	cmpl   $0x2,(%eax)
  10032a:	75 f0                	jne    10031c <Intrtime+0xb0>
  10032c:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  100330:	75 ea                	jne    10031c <Intrtime+0xb0>
  100332:	89 ca                	mov    %ecx,%edx
  100334:	41                   	inc    %ecx
  100335:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  10033a:	83 f9 08             	cmp    $0x8,%ecx
  10033d:	75 e8                	jne    100327 <Intrtime+0xbb>
  10033f:	90                   	nop
  100340:	89 d0                	mov    %edx,%eax
  100342:	c1 e0 06             	shl    $0x6,%eax
  100345:	29 d0                	sub    %edx,%eax
  100347:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10034a:	c1 e0 05             	shl    $0x5,%eax
  10034d:	c7 80 2c 41 10 00 01 	movl   $0x1,0x10412c(%eax)
  100354:	00 00 00 
  100357:	c7 80 30 41 10 00 0a 	movl   $0xa,0x104130(%eax)
  10035e:	00 00 00 
  100361:	89 15 80 21 10 00    	mov    %edx,0x102180
  100367:	89 d0                	mov    %edx,%eax
  100369:	c1 e0 06             	shl    $0x6,%eax
  10036c:	29 d0                	sub    %edx,%eax
  10036e:	8d 34 82             	lea    (%edx,%eax,4),%esi
  100371:	c1 e6 05             	shl    $0x5,%esi
  100374:	81 c6 e0 40 10 00    	add    $0x1040e0,%esi
  10037a:	b9 13 00 00 00       	mov    $0x13,%ecx
  10037f:	8b 7d 08             	mov    0x8(%ebp),%edi
  100382:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100384:	4a                   	dec    %edx
  100385:	0f 95 05 c7 1e 11 00 	setne  0x111ec7
  10038c:	5b                   	pop    %ebx
  10038d:	5e                   	pop    %esi
  10038e:	5f                   	pop    %edi
  10038f:	5d                   	pop    %ebp
  100390:	c3                   	ret    
  100391:	8d 76 00             	lea    0x0(%esi),%esi
  100394:	85 d2                	test   %edx,%edx
  100396:	75 cf                	jne    100367 <Intrtime+0xfb>
  100398:	b8 cc 60 10 00       	mov    $0x1060cc,%eax
  10039d:	31 d2                	xor    %edx,%edx
  10039f:	b9 01 00 00 00       	mov    $0x1,%ecx
  1003a4:	eb 0d                	jmp    1003b3 <Intrtime+0x147>
  1003a6:	66 90                	xchg   %ax,%ax
  1003a8:	41                   	inc    %ecx
  1003a9:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1003ae:	83 f9 08             	cmp    $0x8,%ecx
  1003b1:	74 8d                	je     100340 <Intrtime+0xd4>
  1003b3:	83 38 02             	cmpl   $0x2,(%eax)
  1003b6:	75 f0                	jne    1003a8 <Intrtime+0x13c>
  1003b8:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  1003bc:	75 ea                	jne    1003a8 <Intrtime+0x13c>
  1003be:	89 ca                	mov    %ecx,%edx
  1003c0:	eb e6                	jmp    1003a8 <Intrtime+0x13c>
  1003c2:	66 90                	xchg   %ax,%ax

001003c4 <initPcb>:
  1003c4:	55                   	push   %ebp
  1003c5:	89 e5                	mov    %esp,%ebp
  1003c7:	b8 3c 41 10 00       	mov    $0x10413c,%eax
  1003cc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1003d2:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1003d7:	3d 3c 3e 11 00       	cmp    $0x113e3c,%eax
  1003dc:	75 ee                	jne    1003cc <initPcb+0x8>
  1003de:	c7 05 3c 41 10 00 01 	movl   $0x1,0x10413c
  1003e5:	00 00 00 
  1003e8:	c7 05 2c 41 10 00 02 	movl   $0x2,0x10412c
  1003ef:	00 00 00 
  1003f2:	c7 05 38 41 10 00 00 	movl   $0x0,0x104138
  1003f9:	00 00 00 
  1003fc:	c7 05 30 41 10 00 0a 	movl   $0xa,0x104130
  100403:	00 00 00 
  100406:	c7 05 34 41 10 00 00 	movl   $0x0,0x104134
  10040d:	00 00 00 
  100410:	c7 05 1c 41 10 00 08 	movl   $0x8,0x10411c
  100417:	00 00 00 
  10041a:	c7 05 18 41 10 00 64 	movl   $0x100264,0x104118
  100421:	02 10 00 
  100424:	c7 05 28 41 10 00 10 	movl   $0x10,0x104128
  10042b:	00 00 00 
  10042e:	c7 05 20 41 10 00 02 	movl   $0x202,0x104120
  100435:	02 00 00 
  100438:	c7 05 24 41 10 00 00 	movl   $0x8000000,0x104124
  10043f:	00 00 08 
  100442:	c7 05 f8 40 10 00 00 	movl   $0x8000000,0x1040f8
  100449:	00 00 08 
  10044c:	c7 05 dc 60 10 00 01 	movl   $0x1,0x1060dc
  100453:	00 00 00 
  100456:	c7 05 cc 60 10 00 02 	movl   $0x2,0x1060cc
  10045d:	00 00 00 
  100460:	c7 05 d8 60 10 00 01 	movl   $0x1,0x1060d8
  100467:	00 00 00 
  10046a:	c7 05 d0 60 10 00 0a 	movl   $0xa,0x1060d0
  100471:	00 00 00 
  100474:	c7 05 d4 60 10 00 00 	movl   $0x0,0x1060d4
  10047b:	00 00 00 
  10047e:	c7 05 bc 60 10 00 1b 	movl   $0x1b,0x1060bc
  100485:	00 00 00 
  100488:	c7 05 b8 60 10 00 00 	movl   $0x200000,0x1060b8
  10048f:	00 20 00 
  100492:	c7 05 c8 60 10 00 23 	movl   $0x23,0x1060c8
  100499:	00 00 00 
  10049c:	c7 05 c0 60 10 00 02 	movl   $0x2,0x1060c0
  1004a3:	00 00 00 
  1004a6:	c7 05 c4 60 10 00 00 	movl   $0x20000,0x1060c4
  1004ad:	00 02 00 
  1004b0:	c7 05 98 60 10 00 00 	movl   $0x20000,0x106098
  1004b7:	00 02 00 
  1004ba:	c7 05 80 21 10 00 01 	movl   $0x1,0x102180
  1004c1:	00 00 00 
  1004c4:	5d                   	pop    %ebp
  1004c5:	c3                   	ret    
  1004c6:	66 90                	xchg   %ax,%ax

001004c8 <sys_fork>:
  1004c8:	55                   	push   %ebp
  1004c9:	89 e5                	mov    %esp,%ebp
  1004cb:	57                   	push   %edi
  1004cc:	56                   	push   %esi
  1004cd:	53                   	push   %ebx
  1004ce:	56                   	push   %esi
  1004cf:	a1 80 21 10 00       	mov    0x102180,%eax
  1004d4:	89 c3                	mov    %eax,%ebx
  1004d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1004d9:	c1 e0 06             	shl    $0x6,%eax
  1004dc:	29 d8                	sub    %ebx,%eax
  1004de:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  1004e1:	c1 e2 05             	shl    $0x5,%edx
  1004e4:	8d 82 e0 40 10 00    	lea    0x1040e0(%edx),%eax
  1004ea:	b9 13 00 00 00       	mov    $0x13,%ecx
  1004ef:	89 c7                	mov    %eax,%edi
  1004f1:	8b 75 08             	mov    0x8(%ebp),%esi
  1004f4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1004f6:	c7 82 2c 41 10 00 02 	movl   $0x2,0x10412c(%edx)
  1004fd:	00 00 00 
  100500:	b9 dc 60 10 00       	mov    $0x1060dc,%ecx
  100505:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  10050a:	b8 01 00 00 00       	mov    $0x1,%eax
  10050f:	90                   	nop
  100510:	8b 19                	mov    (%ecx),%ebx
  100512:	85 db                	test   %ebx,%ebx
  100514:	75 08                	jne    10051e <sys_fork+0x56>
  100516:	c7 01 01 00 00 00    	movl   $0x1,(%ecx)
  10051c:	89 c2                	mov    %eax,%edx
  10051e:	40                   	inc    %eax
  10051f:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  100525:	83 f8 08             	cmp    $0x8,%eax
  100528:	75 e6                	jne    100510 <sys_fork+0x48>
  10052a:	89 d0                	mov    %edx,%eax
  10052c:	c1 e0 06             	shl    $0x6,%eax
  10052f:	29 d0                	sub    %edx,%eax
  100531:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100534:	c1 e0 05             	shl    $0x5,%eax
  100537:	8d 98 a0 21 10 00    	lea    0x1021a0(%eax),%ebx
  10053d:	c7 80 2c 41 10 00 02 	movl   $0x2,0x10412c(%eax)
  100544:	00 00 00 
  100547:	89 90 38 41 10 00    	mov    %edx,0x104138(%eax)
  10054d:	c7 80 30 41 10 00 0a 	movl   $0xa,0x104130(%eax)
  100554:	00 00 00 
  100557:	c7 80 34 41 10 00 00 	movl   $0x0,0x104134(%eax)
  10055e:	00 00 00 
  100561:	05 e0 40 10 00       	add    $0x1040e0,%eax
  100566:	b9 13 00 00 00       	mov    $0x13,%ecx
  10056b:	89 c7                	mov    %eax,%edi
  10056d:	8b 75 08             	mov    0x8(%ebp),%esi
  100570:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100572:	c7 83 6c 1f 00 00 00 	movl   $0x0,0x1f6c(%ebx)
  100579:	00 00 00 
  10057c:	8b 7d f0             	mov    -0x10(%ebp),%edi
  10057f:	89 f8                	mov    %edi,%eax
  100581:	c1 e0 06             	shl    $0x6,%eax
  100584:	29 f8                	sub    %edi,%eax
  100586:	8d 04 87             	lea    (%edi,%eax,4),%eax
  100589:	c1 e0 05             	shl    $0x5,%eax
  10058c:	8b b0 24 41 10 00    	mov    0x104124(%eax),%esi
  100592:	8b 83 84 1f 00 00    	mov    0x1f84(%ebx),%eax
  100598:	05 00 00 00 01       	add    $0x1000000,%eax
  10059d:	b9 00 00 00 08       	mov    $0x8000000,%ecx
  1005a2:	29 f1                	sub    %esi,%ecx
  1005a4:	89 c7                	mov    %eax,%edi
  1005a6:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1005a8:	b8 00 00 20 01       	mov    $0x1200000,%eax
  1005ad:	be 00 00 20 00       	mov    $0x200000,%esi
  1005b2:	b9 00 08 00 00       	mov    $0x800,%ecx
  1005b7:	89 c7                	mov    %eax,%edi
  1005b9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1005bb:	a1 80 21 10 00       	mov    0x102180,%eax
  1005c0:	89 c1                	mov    %eax,%ecx
  1005c2:	c1 e1 06             	shl    $0x6,%ecx
  1005c5:	29 c1                	sub    %eax,%ecx
  1005c7:	8d 04 88             	lea    (%eax,%ecx,4),%eax
  1005ca:	c1 e0 05             	shl    $0x5,%eax
  1005cd:	89 90 0c 41 10 00    	mov    %edx,0x10410c(%eax)
  1005d3:	89 15 80 21 10 00    	mov    %edx,0x102180
  1005d9:	c7 83 8c 1f 00 00 01 	movl   $0x1,0x1f8c(%ebx)
  1005e0:	00 00 00 
  1005e3:	83 fa 01             	cmp    $0x1,%edx
  1005e6:	0f 95 05 c7 1e 11 00 	setne  0x111ec7
  1005ed:	89 d0                	mov    %edx,%eax
  1005ef:	5a                   	pop    %edx
  1005f0:	5b                   	pop    %ebx
  1005f1:	5e                   	pop    %esi
  1005f2:	5f                   	pop    %edi
  1005f3:	5d                   	pop    %ebp
  1005f4:	c3                   	ret    
  1005f5:	66 90                	xchg   %ax,%ax
  1005f7:	90                   	nop

001005f8 <waitDisk>:
  1005f8:	55                   	push   %ebp
  1005f9:	89 e5                	mov    %esp,%ebp
  1005fb:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100600:	ec                   	in     (%dx),%al
  100601:	83 e0 c0             	and    $0xffffffc0,%eax
  100604:	3c 40                	cmp    $0x40,%al
  100606:	75 f8                	jne    100600 <waitDisk+0x8>
  100608:	5d                   	pop    %ebp
  100609:	c3                   	ret    
  10060a:	66 90                	xchg   %ax,%ax

0010060c <readSect>:
  10060c:	55                   	push   %ebp
  10060d:	89 e5                	mov    %esp,%ebp
  10060f:	53                   	push   %ebx
  100610:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100613:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100618:	ec                   	in     (%dx),%al
  100619:	83 e0 c0             	and    $0xffffffc0,%eax
  10061c:	3c 40                	cmp    $0x40,%al
  10061e:	75 f8                	jne    100618 <readSect+0xc>
  100620:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100625:	b0 01                	mov    $0x1,%al
  100627:	ee                   	out    %al,(%dx)
  100628:	ba f3 01 00 00       	mov    $0x1f3,%edx
  10062d:	88 c8                	mov    %cl,%al
  10062f:	ee                   	out    %al,(%dx)
  100630:	89 c8                	mov    %ecx,%eax
  100632:	c1 f8 08             	sar    $0x8,%eax
  100635:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10063a:	ee                   	out    %al,(%dx)
  10063b:	89 c8                	mov    %ecx,%eax
  10063d:	c1 f8 10             	sar    $0x10,%eax
  100640:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100645:	ee                   	out    %al,(%dx)
  100646:	89 c8                	mov    %ecx,%eax
  100648:	c1 f8 18             	sar    $0x18,%eax
  10064b:	83 c8 e0             	or     $0xffffffe0,%eax
  10064e:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100653:	ee                   	out    %al,(%dx)
  100654:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100659:	b0 20                	mov    $0x20,%al
  10065b:	ee                   	out    %al,(%dx)
  10065c:	ec                   	in     (%dx),%al
  10065d:	83 e0 c0             	and    $0xffffffc0,%eax
  100660:	3c 40                	cmp    $0x40,%al
  100662:	75 f8                	jne    10065c <readSect+0x50>
  100664:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100667:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  10066d:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100672:	66 90                	xchg   %ax,%ax
  100674:	ed                   	in     (%dx),%eax
  100675:	89 01                	mov    %eax,(%ecx)
  100677:	83 c1 04             	add    $0x4,%ecx
  10067a:	39 d9                	cmp    %ebx,%ecx
  10067c:	75 f6                	jne    100674 <readSect+0x68>
  10067e:	5b                   	pop    %ebx
  10067f:	5d                   	pop    %ebp
  100680:	c3                   	ret    
  100681:	8d 76 00             	lea    0x0(%esi),%esi

00100684 <initSeg>:
  100684:	55                   	push   %ebp
  100685:	89 e5                	mov    %esp,%ebp
  100687:	b9 a0 1e 11 00       	mov    $0x111ea0,%ecx
  10068c:	66 c7 05 a8 1e 11 00 	movw   $0xffff,0x111ea8
  100693:	ff ff 
  100695:	66 c7 05 aa 1e 11 00 	movw   $0x0,0x111eaa
  10069c:	00 00 
  10069e:	c6 05 ac 1e 11 00 00 	movb   $0x0,0x111eac
  1006a5:	c6 05 ad 1e 11 00 9a 	movb   $0x9a,0x111ead
  1006ac:	c6 05 ae 1e 11 00 cf 	movb   $0xcf,0x111eae
  1006b3:	c6 05 af 1e 11 00 00 	movb   $0x0,0x111eaf
  1006ba:	66 c7 05 b0 1e 11 00 	movw   $0xffff,0x111eb0
  1006c1:	ff ff 
  1006c3:	66 c7 05 b2 1e 11 00 	movw   $0x0,0x111eb2
  1006ca:	00 00 
  1006cc:	c6 05 b4 1e 11 00 00 	movb   $0x0,0x111eb4
  1006d3:	c6 05 b5 1e 11 00 92 	movb   $0x92,0x111eb5
  1006da:	c6 05 b6 1e 11 00 cf 	movb   $0xcf,0x111eb6
  1006e1:	c6 05 b7 1e 11 00 00 	movb   $0x0,0x111eb7
  1006e8:	66 c7 05 b8 1e 11 00 	movw   $0xffff,0x111eb8
  1006ef:	ff ff 
  1006f1:	66 c7 05 ba 1e 11 00 	movw   $0x0,0x111eba
  1006f8:	00 00 
  1006fa:	c6 05 bc 1e 11 00 00 	movb   $0x0,0x111ebc
  100701:	c6 05 bd 1e 11 00 fa 	movb   $0xfa,0x111ebd
  100708:	c6 05 be 1e 11 00 cf 	movb   $0xcf,0x111ebe
  10070f:	c6 05 bf 1e 11 00 00 	movb   $0x0,0x111ebf
  100716:	66 c7 05 c0 1e 11 00 	movw   $0xffff,0x111ec0
  10071d:	ff ff 
  10071f:	66 c7 05 c2 1e 11 00 	movw   $0x0,0x111ec2
  100726:	00 00 
  100728:	c6 05 c4 1e 11 00 00 	movb   $0x0,0x111ec4
  10072f:	c6 05 c5 1e 11 00 f2 	movb   $0xf2,0x111ec5
  100736:	c6 05 c6 1e 11 00 cf 	movb   $0xcf,0x111ec6
  10073d:	c6 05 c7 1e 11 00 00 	movb   $0x0,0x111ec7
  100744:	66 c7 05 c8 1e 11 00 	movw   $0x63,0x111ec8
  10074b:	63 00 
  10074d:	b8 e0 1e 11 00       	mov    $0x111ee0,%eax
  100752:	66 a3 ca 1e 11 00    	mov    %ax,0x111eca
  100758:	89 c2                	mov    %eax,%edx
  10075a:	c1 ea 10             	shr    $0x10,%edx
  10075d:	88 15 cc 1e 11 00    	mov    %dl,0x111ecc
  100763:	c6 05 cd 1e 11 00 89 	movb   $0x89,0x111ecd
  10076a:	c6 05 ce 1e 11 00 40 	movb   $0x40,0x111ece
  100771:	c1 e8 18             	shr    $0x18,%eax
  100774:	a2 cf 1e 11 00       	mov    %al,0x111ecf
  100779:	a1 08 0d 10 00       	mov    0x100d08,%eax
  10077e:	8b 15 0c 0d 10 00    	mov    0x100d0c,%edx
  100784:	a3 d0 1e 11 00       	mov    %eax,0x111ed0
  100789:	89 15 d4 1e 11 00    	mov    %edx,0x111ed4
  10078f:	66 c7 05 64 21 10 00 	movw   $0x37,0x102164
  100796:	37 00 
  100798:	66 89 0d 66 21 10 00 	mov    %cx,0x102166
  10079f:	c1 e9 10             	shr    $0x10,%ecx
  1007a2:	66 89 0d 68 21 10 00 	mov    %cx,0x102168
  1007a9:	b8 64 21 10 00       	mov    $0x102164,%eax
  1007ae:	0f 01 10             	lgdtl  (%eax)
  1007b1:	c7 05 e8 1e 11 00 10 	movl   $0x10,0x111ee8
  1007b8:	00 00 00 
  1007bb:	c7 05 e4 1e 11 00 00 	movl   $0x8000000,0x111ee4
  1007c2:	00 00 08 
  1007c5:	b8 28 00 00 00       	mov    $0x28,%eax
  1007ca:	0f 00 d8             	ltr    %ax
  1007cd:	31 c0                	xor    %eax,%eax
  1007cf:	0f 00 d0             	lldt   %ax
  1007d2:	5d                   	pop    %ebp
  1007d3:	c3                   	ret    

001007d4 <enterUserSpace>:
  1007d4:	55                   	push   %ebp
  1007d5:	89 e5                	mov    %esp,%ebp
  1007d7:	83 ec 10             	sub    $0x10,%esp
  1007da:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
  1007e1:	66 6a 23             	pushw  $0x23
  1007e4:	68 00 00 00 08       	push   $0x8000000
  1007e9:	ff 75 fc             	pushl  -0x4(%ebp)
  1007ec:	6a 1b                	push   $0x1b
  1007ee:	ff 75 08             	pushl  0x8(%ebp)
  1007f1:	cf                   	iret   
  1007f2:	c9                   	leave  
  1007f3:	c3                   	ret    

001007f4 <loadUMain>:
  1007f4:	55                   	push   %ebp
  1007f5:	89 e5                	mov    %esp,%ebp
  1007f7:	57                   	push   %edi
  1007f8:	56                   	push   %esi
  1007f9:	53                   	push   %ebx
  1007fa:	81 ec 00 90 01 00    	sub    $0x19000,%esp
  100800:	be c9 00 00 00       	mov    $0xc9,%esi
  100805:	8d 9d f4 6f fe ff    	lea    -0x1900c(%ebp),%ebx
  10080b:	90                   	nop
  10080c:	56                   	push   %esi
  10080d:	53                   	push   %ebx
  10080e:	e8 f9 fd ff ff       	call   10060c <readSect>
  100813:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100819:	46                   	inc    %esi
  10081a:	58                   	pop    %eax
  10081b:	5a                   	pop    %edx
  10081c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10081f:	39 c3                	cmp    %eax,%ebx
  100821:	75 e9                	jne    10080c <loadUMain+0x18>
  100823:	8d 95 f4 6f fe ff    	lea    -0x1900c(%ebp),%edx
  100829:	03 95 10 70 fe ff    	add    -0x18ff0(%ebp),%edx
  10082f:	0f b7 9d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ebx
  100836:	c1 e3 05             	shl    $0x5,%ebx
  100839:	01 d3                	add    %edx,%ebx
  10083b:	31 c0                	xor    %eax,%eax
  10083d:	39 da                	cmp    %ebx,%edx
  10083f:	72 0a                	jb     10084b <loadUMain+0x57>
  100841:	eb 34                	jmp    100877 <loadUMain+0x83>
  100843:	90                   	nop
  100844:	83 c2 20             	add    $0x20,%edx
  100847:	39 d3                	cmp    %edx,%ebx
  100849:	76 2c                	jbe    100877 <loadUMain+0x83>
  10084b:	83 3a 01             	cmpl   $0x1,(%edx)
  10084e:	75 f4                	jne    100844 <loadUMain+0x50>
  100850:	8d b5 f4 6f fe ff    	lea    -0x1900c(%ebp),%esi
  100856:	03 72 04             	add    0x4(%edx),%esi
  100859:	8b 4a 10             	mov    0x10(%edx),%ecx
  10085c:	8b 7a 08             	mov    0x8(%edx),%edi
  10085f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100861:	8b 72 10             	mov    0x10(%edx),%esi
  100864:	8b 4a 14             	mov    0x14(%edx),%ecx
  100867:	29 f1                	sub    %esi,%ecx
  100869:	03 72 08             	add    0x8(%edx),%esi
  10086c:	89 f7                	mov    %esi,%edi
  10086e:	f3 aa                	rep stos %al,%es:(%edi)
  100870:	83 c2 20             	add    $0x20,%edx
  100873:	39 d3                	cmp    %edx,%ebx
  100875:	77 d4                	ja     10084b <loadUMain+0x57>
  100877:	ff b5 0c 70 fe ff    	pushl  -0x18ff4(%ebp)
  10087d:	e8 52 ff ff ff       	call   1007d4 <enterUserSpace>
  100882:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100885:	5b                   	pop    %ebx
  100886:	5e                   	pop    %esi
  100887:	5f                   	pop    %edi
  100888:	5d                   	pop    %ebp
  100889:	c3                   	ret    
  10088a:	66 90                	xchg   %ax,%ax

0010088c <initIdt>:
  10088c:	55                   	push   %ebp
  10088d:	89 e5                	mov    %esp,%ebp
  10088f:	53                   	push   %ebx
  100890:	ba 75 0c 10 00       	mov    $0x100c75,%edx
  100895:	89 d3                	mov    %edx,%ebx
  100897:	c1 ea 10             	shr    $0x10,%edx
  10089a:	b9 60 27 11 00       	mov    $0x112760,%ecx
  10089f:	b8 60 1f 11 00       	mov    $0x111f60,%eax
  1008a4:	66 89 18             	mov    %bx,(%eax)
  1008a7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1008ad:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1008b1:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1008b5:	66 89 50 06          	mov    %dx,0x6(%eax)
  1008b9:	83 c0 08             	add    $0x8,%eax
  1008bc:	39 c1                	cmp    %eax,%ecx
  1008be:	75 e4                	jne    1008a4 <initIdt+0x18>
  1008c0:	b8 7b 0c 10 00       	mov    $0x100c7b,%eax
  1008c5:	66 a3 60 1f 11 00    	mov    %ax,0x111f60
  1008cb:	66 c7 05 62 1f 11 00 	movw   $0x8,0x111f62
  1008d2:	08 00 
  1008d4:	c6 05 64 1f 11 00 00 	movb   $0x0,0x111f64
  1008db:	c6 05 65 1f 11 00 8f 	movb   $0x8f,0x111f65
  1008e2:	c1 e8 10             	shr    $0x10,%eax
  1008e5:	66 a3 66 1f 11 00    	mov    %ax,0x111f66
  1008eb:	b8 81 0c 10 00       	mov    $0x100c81,%eax
  1008f0:	66 a3 68 1f 11 00    	mov    %ax,0x111f68
  1008f6:	66 c7 05 6a 1f 11 00 	movw   $0x8,0x111f6a
  1008fd:	08 00 
  1008ff:	c6 05 6c 1f 11 00 00 	movb   $0x0,0x111f6c
  100906:	c6 05 6d 1f 11 00 8f 	movb   $0x8f,0x111f6d
  10090d:	c1 e8 10             	shr    $0x10,%eax
  100910:	66 a3 6e 1f 11 00    	mov    %ax,0x111f6e
  100916:	b8 87 0c 10 00       	mov    $0x100c87,%eax
  10091b:	66 a3 70 1f 11 00    	mov    %ax,0x111f70
  100921:	66 c7 05 72 1f 11 00 	movw   $0x8,0x111f72
  100928:	08 00 
  10092a:	c6 05 74 1f 11 00 00 	movb   $0x0,0x111f74
  100931:	c6 05 75 1f 11 00 8f 	movb   $0x8f,0x111f75
  100938:	c1 e8 10             	shr    $0x10,%eax
  10093b:	66 a3 76 1f 11 00    	mov    %ax,0x111f76
  100941:	b8 8d 0c 10 00       	mov    $0x100c8d,%eax
  100946:	66 a3 78 1f 11 00    	mov    %ax,0x111f78
  10094c:	66 c7 05 7a 1f 11 00 	movw   $0x8,0x111f7a
  100953:	08 00 
  100955:	c6 05 7c 1f 11 00 00 	movb   $0x0,0x111f7c
  10095c:	c6 05 7d 1f 11 00 8f 	movb   $0x8f,0x111f7d
  100963:	c1 e8 10             	shr    $0x10,%eax
  100966:	66 a3 7e 1f 11 00    	mov    %ax,0x111f7e
  10096c:	b8 93 0c 10 00       	mov    $0x100c93,%eax
  100971:	66 a3 80 1f 11 00    	mov    %ax,0x111f80
  100977:	66 c7 05 82 1f 11 00 	movw   $0x8,0x111f82
  10097e:	08 00 
  100980:	c6 05 84 1f 11 00 00 	movb   $0x0,0x111f84
  100987:	c6 05 85 1f 11 00 8f 	movb   $0x8f,0x111f85
  10098e:	c1 e8 10             	shr    $0x10,%eax
  100991:	66 a3 86 1f 11 00    	mov    %ax,0x111f86
  100997:	b8 99 0c 10 00       	mov    $0x100c99,%eax
  10099c:	66 a3 88 1f 11 00    	mov    %ax,0x111f88
  1009a2:	66 c7 05 8a 1f 11 00 	movw   $0x8,0x111f8a
  1009a9:	08 00 
  1009ab:	c6 05 8c 1f 11 00 00 	movb   $0x0,0x111f8c
  1009b2:	c6 05 8d 1f 11 00 8f 	movb   $0x8f,0x111f8d
  1009b9:	c1 e8 10             	shr    $0x10,%eax
  1009bc:	66 a3 8e 1f 11 00    	mov    %ax,0x111f8e
  1009c2:	b8 9f 0c 10 00       	mov    $0x100c9f,%eax
  1009c7:	66 a3 90 1f 11 00    	mov    %ax,0x111f90
  1009cd:	66 c7 05 92 1f 11 00 	movw   $0x8,0x111f92
  1009d4:	08 00 
  1009d6:	c6 05 94 1f 11 00 00 	movb   $0x0,0x111f94
  1009dd:	c6 05 95 1f 11 00 8f 	movb   $0x8f,0x111f95
  1009e4:	c1 e8 10             	shr    $0x10,%eax
  1009e7:	66 a3 96 1f 11 00    	mov    %ax,0x111f96
  1009ed:	b8 a5 0c 10 00       	mov    $0x100ca5,%eax
  1009f2:	66 a3 98 1f 11 00    	mov    %ax,0x111f98
  1009f8:	66 c7 05 9a 1f 11 00 	movw   $0x8,0x111f9a
  1009ff:	08 00 
  100a01:	c6 05 9c 1f 11 00 00 	movb   $0x0,0x111f9c
  100a08:	c6 05 9d 1f 11 00 8f 	movb   $0x8f,0x111f9d
  100a0f:	c1 e8 10             	shr    $0x10,%eax
  100a12:	66 a3 9e 1f 11 00    	mov    %ax,0x111f9e
  100a18:	b8 ab 0c 10 00       	mov    $0x100cab,%eax
  100a1d:	66 a3 a0 1f 11 00    	mov    %ax,0x111fa0
  100a23:	66 c7 05 a2 1f 11 00 	movw   $0x8,0x111fa2
  100a2a:	08 00 
  100a2c:	c6 05 a4 1f 11 00 00 	movb   $0x0,0x111fa4
  100a33:	c6 05 a5 1f 11 00 8f 	movb   $0x8f,0x111fa5
  100a3a:	c1 e8 10             	shr    $0x10,%eax
  100a3d:	66 a3 a6 1f 11 00    	mov    %ax,0x111fa6
  100a43:	b8 af 0c 10 00       	mov    $0x100caf,%eax
  100a48:	66 a3 a8 1f 11 00    	mov    %ax,0x111fa8
  100a4e:	66 c7 05 aa 1f 11 00 	movw   $0x8,0x111faa
  100a55:	08 00 
  100a57:	c6 05 ac 1f 11 00 00 	movb   $0x0,0x111fac
  100a5e:	c6 05 ad 1f 11 00 8f 	movb   $0x8f,0x111fad
  100a65:	c1 e8 10             	shr    $0x10,%eax
  100a68:	66 a3 ae 1f 11 00    	mov    %ax,0x111fae
  100a6e:	b8 b5 0c 10 00       	mov    $0x100cb5,%eax
  100a73:	66 a3 b0 1f 11 00    	mov    %ax,0x111fb0
  100a79:	66 c7 05 b2 1f 11 00 	movw   $0x8,0x111fb2
  100a80:	08 00 
  100a82:	c6 05 b4 1f 11 00 00 	movb   $0x0,0x111fb4
  100a89:	c6 05 b5 1f 11 00 8f 	movb   $0x8f,0x111fb5
  100a90:	c1 e8 10             	shr    $0x10,%eax
  100a93:	66 a3 b6 1f 11 00    	mov    %ax,0x111fb6
  100a99:	b8 b9 0c 10 00       	mov    $0x100cb9,%eax
  100a9e:	66 a3 b8 1f 11 00    	mov    %ax,0x111fb8
  100aa4:	66 c7 05 ba 1f 11 00 	movw   $0x8,0x111fba
  100aab:	08 00 
  100aad:	c6 05 bc 1f 11 00 00 	movb   $0x0,0x111fbc
  100ab4:	c6 05 bd 1f 11 00 8f 	movb   $0x8f,0x111fbd
  100abb:	c1 e8 10             	shr    $0x10,%eax
  100abe:	66 a3 be 1f 11 00    	mov    %ax,0x111fbe
  100ac4:	b8 bd 0c 10 00       	mov    $0x100cbd,%eax
  100ac9:	66 a3 c0 1f 11 00    	mov    %ax,0x111fc0
  100acf:	66 c7 05 c2 1f 11 00 	movw   $0x8,0x111fc2
  100ad6:	08 00 
  100ad8:	c6 05 c4 1f 11 00 00 	movb   $0x0,0x111fc4
  100adf:	c6 05 c5 1f 11 00 8f 	movb   $0x8f,0x111fc5
  100ae6:	c1 e8 10             	shr    $0x10,%eax
  100ae9:	66 a3 c6 1f 11 00    	mov    %ax,0x111fc6
  100aef:	b8 c1 0c 10 00       	mov    $0x100cc1,%eax
  100af4:	66 a3 d0 1f 11 00    	mov    %ax,0x111fd0
  100afa:	66 c7 05 d2 1f 11 00 	movw   $0x8,0x111fd2
  100b01:	08 00 
  100b03:	c6 05 d4 1f 11 00 00 	movb   $0x0,0x111fd4
  100b0a:	c6 05 d5 1f 11 00 8f 	movb   $0x8f,0x111fd5
  100b11:	c1 e8 10             	shr    $0x10,%eax
  100b14:	66 a3 d6 1f 11 00    	mov    %ax,0x111fd6
  100b1a:	b8 c5 0c 10 00       	mov    $0x100cc5,%eax
  100b1f:	66 a3 c8 1f 11 00    	mov    %ax,0x111fc8
  100b25:	66 c7 05 ca 1f 11 00 	movw   $0x8,0x111fca
  100b2c:	08 00 
  100b2e:	c6 05 cc 1f 11 00 00 	movb   $0x0,0x111fcc
  100b35:	c6 05 cd 1f 11 00 8f 	movb   $0x8f,0x111fcd
  100b3c:	c1 e8 10             	shr    $0x10,%eax
  100b3f:	66 a3 ce 1f 11 00    	mov    %ax,0x111fce
  100b45:	b8 c9 0c 10 00       	mov    $0x100cc9,%eax
  100b4a:	66 a3 60 20 11 00    	mov    %ax,0x112060
  100b50:	66 c7 05 62 20 11 00 	movw   $0x8,0x112062
  100b57:	08 00 
  100b59:	c6 05 64 20 11 00 00 	movb   $0x0,0x112064
  100b60:	c6 05 65 20 11 00 ee 	movb   $0xee,0x112065
  100b67:	c1 e8 10             	shr    $0x10,%eax
  100b6a:	66 a3 66 20 11 00    	mov    %ax,0x112066
  100b70:	b8 cf 0c 10 00       	mov    $0x100ccf,%eax
  100b75:	66 a3 60 23 11 00    	mov    %ax,0x112360
  100b7b:	66 c7 05 62 23 11 00 	movw   $0x8,0x112362
  100b82:	08 00 
  100b84:	c6 05 64 23 11 00 00 	movb   $0x0,0x112364
  100b8b:	c6 05 65 23 11 00 ee 	movb   $0xee,0x112365
  100b92:	c1 e8 10             	shr    $0x10,%eax
  100b95:	66 a3 66 23 11 00    	mov    %ax,0x112366
  100b9b:	66 c7 05 6c 21 10 00 	movw   $0x7ff,0x10216c
  100ba2:	ff 07 
  100ba4:	b8 60 1f 11 00       	mov    $0x111f60,%eax
  100ba9:	66 a3 6e 21 10 00    	mov    %ax,0x10216e
  100baf:	c1 e8 10             	shr    $0x10,%eax
  100bb2:	66 a3 70 21 10 00    	mov    %ax,0x102170
  100bb8:	b8 6c 21 10 00       	mov    $0x10216c,%eax
  100bbd:	0f 01 18             	lidtl  (%eax)
  100bc0:	5b                   	pop    %ebx
  100bc1:	5d                   	pop    %ebp
  100bc2:	c3                   	ret    
  100bc3:	90                   	nop

00100bc4 <initSerial>:
  100bc4:	55                   	push   %ebp
  100bc5:	89 e5                	mov    %esp,%ebp
  100bc7:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100bcc:	31 c0                	xor    %eax,%eax
  100bce:	ee                   	out    %al,(%dx)
  100bcf:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100bd4:	b0 80                	mov    $0x80,%al
  100bd6:	ee                   	out    %al,(%dx)
  100bd7:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100bdc:	b0 01                	mov    $0x1,%al
  100bde:	ee                   	out    %al,(%dx)
  100bdf:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100be4:	31 c0                	xor    %eax,%eax
  100be6:	ee                   	out    %al,(%dx)
  100be7:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100bec:	b0 03                	mov    $0x3,%al
  100bee:	ee                   	out    %al,(%dx)
  100bef:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100bf4:	b0 c7                	mov    $0xc7,%al
  100bf6:	ee                   	out    %al,(%dx)
  100bf7:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100bfc:	b0 0b                	mov    $0xb,%al
  100bfe:	ee                   	out    %al,(%dx)
  100bff:	5d                   	pop    %ebp
  100c00:	c3                   	ret    
  100c01:	8d 76 00             	lea    0x0(%esi),%esi

00100c04 <putChar>:
  100c04:	55                   	push   %ebp
  100c05:	89 e5                	mov    %esp,%ebp
  100c07:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100c0a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100c0f:	90                   	nop
  100c10:	ec                   	in     (%dx),%al
  100c11:	a8 20                	test   $0x20,%al
  100c13:	74 fb                	je     100c10 <putChar+0xc>
  100c15:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100c1a:	88 c8                	mov    %cl,%al
  100c1c:	ee                   	out    %al,(%dx)
  100c1d:	5d                   	pop    %ebp
  100c1e:	c3                   	ret    
  100c1f:	90                   	nop

00100c20 <initIntr>:
  100c20:	55                   	push   %ebp
  100c21:	89 e5                	mov    %esp,%ebp
  100c23:	ba 21 00 00 00       	mov    $0x21,%edx
  100c28:	b0 ff                	mov    $0xff,%al
  100c2a:	ee                   	out    %al,(%dx)
  100c2b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100c30:	ee                   	out    %al,(%dx)
  100c31:	ba 20 00 00 00       	mov    $0x20,%edx
  100c36:	b0 11                	mov    $0x11,%al
  100c38:	ee                   	out    %al,(%dx)
  100c39:	ba 21 00 00 00       	mov    $0x21,%edx
  100c3e:	b0 20                	mov    $0x20,%al
  100c40:	ee                   	out    %al,(%dx)
  100c41:	b0 04                	mov    $0x4,%al
  100c43:	ee                   	out    %al,(%dx)
  100c44:	b0 03                	mov    $0x3,%al
  100c46:	ee                   	out    %al,(%dx)
  100c47:	ba a0 00 00 00       	mov    $0xa0,%edx
  100c4c:	b0 11                	mov    $0x11,%al
  100c4e:	ee                   	out    %al,(%dx)
  100c4f:	ba a1 00 00 00       	mov    $0xa1,%edx
  100c54:	b0 28                	mov    $0x28,%al
  100c56:	ee                   	out    %al,(%dx)
  100c57:	b0 02                	mov    $0x2,%al
  100c59:	ee                   	out    %al,(%dx)
  100c5a:	b0 03                	mov    $0x3,%al
  100c5c:	ee                   	out    %al,(%dx)
  100c5d:	ba 20 00 00 00       	mov    $0x20,%edx
  100c62:	b0 68                	mov    $0x68,%al
  100c64:	ee                   	out    %al,(%dx)
  100c65:	b0 0a                	mov    $0xa,%al
  100c67:	ee                   	out    %al,(%dx)
  100c68:	ba a0 00 00 00       	mov    $0xa0,%edx
  100c6d:	b0 68                	mov    $0x68,%al
  100c6f:	ee                   	out    %al,(%dx)
  100c70:	b0 0a                	mov    $0xa,%al
  100c72:	ee                   	out    %al,(%dx)
  100c73:	5d                   	pop    %ebp
  100c74:	c3                   	ret    

00100c75 <irqEmpty>:
  100c75:	6a 00                	push   $0x0
  100c77:	6a ff                	push   $0xffffffff
  100c79:	eb 5d                	jmp    100cd8 <asmDoIrq>

00100c7b <irqDivError>:
  100c7b:	6a 00                	push   $0x0
  100c7d:	6a 00                	push   $0x0
  100c7f:	eb 57                	jmp    100cd8 <asmDoIrq>

00100c81 <irqStepOver>:
  100c81:	6a 00                	push   $0x0
  100c83:	6a 01                	push   $0x1
  100c85:	eb 51                	jmp    100cd8 <asmDoIrq>

00100c87 <irqNMIInterrupt>:
  100c87:	6a 00                	push   $0x0
  100c89:	6a 02                	push   $0x2
  100c8b:	eb 4b                	jmp    100cd8 <asmDoIrq>

00100c8d <irqBreakPoint>:
  100c8d:	6a 00                	push   $0x0
  100c8f:	6a 03                	push   $0x3
  100c91:	eb 45                	jmp    100cd8 <asmDoIrq>

00100c93 <irqOverflow>:
  100c93:	6a 00                	push   $0x0
  100c95:	6a 04                	push   $0x4
  100c97:	eb 3f                	jmp    100cd8 <asmDoIrq>

00100c99 <irqBoundTest>:
  100c99:	6a 00                	push   $0x0
  100c9b:	6a 05                	push   $0x5
  100c9d:	eb 39                	jmp    100cd8 <asmDoIrq>

00100c9f <irqInvalidOperation>:
  100c9f:	6a 00                	push   $0x0
  100ca1:	6a 06                	push   $0x6
  100ca3:	eb 33                	jmp    100cd8 <asmDoIrq>

00100ca5 <irqNoCoprocessor>:
  100ca5:	6a 00                	push   $0x0
  100ca7:	6a 07                	push   $0x7
  100ca9:	eb 2d                	jmp    100cd8 <asmDoIrq>

00100cab <irqDoubleFault>:
  100cab:	6a 08                	push   $0x8
  100cad:	eb 29                	jmp    100cd8 <asmDoIrq>

00100caf <irqCoprocessorOutofBound>:
  100caf:	6a 00                	push   $0x0
  100cb1:	6a 09                	push   $0x9
  100cb3:	eb 23                	jmp    100cd8 <asmDoIrq>

00100cb5 <irqInvalidTSS>:
  100cb5:	6a 0a                	push   $0xa
  100cb7:	eb 1f                	jmp    100cd8 <asmDoIrq>

00100cb9 <irqNoSegment>:
  100cb9:	6a 0b                	push   $0xb
  100cbb:	eb 1b                	jmp    100cd8 <asmDoIrq>

00100cbd <irqStackSegmentFault>:
  100cbd:	6a 0c                	push   $0xc
  100cbf:	eb 17                	jmp    100cd8 <asmDoIrq>

00100cc1 <irqPageFault>:
  100cc1:	6a 0e                	push   $0xe
  100cc3:	eb 13                	jmp    100cd8 <asmDoIrq>

00100cc5 <irqGProtectFault>:
  100cc5:	6a 0d                	push   $0xd
  100cc7:	eb 0f                	jmp    100cd8 <asmDoIrq>

00100cc9 <irqTime>:
  100cc9:	6a 00                	push   $0x0
  100ccb:	6a 20                	push   $0x20
  100ccd:	eb 09                	jmp    100cd8 <asmDoIrq>

00100ccf <irqSyscall>:
  100ccf:	6a 00                	push   $0x0
  100cd1:	68 80 00 00 00       	push   $0x80
  100cd6:	eb 00                	jmp    100cd8 <asmDoIrq>

00100cd8 <asmDoIrq>:
  100cd8:	60                   	pusha  
  100cd9:	1e                   	push   %ds
  100cda:	06                   	push   %es
  100cdb:	0f a0                	push   %fs
  100cdd:	0f a8                	push   %gs
  100cdf:	54                   	push   %esp
  100ce0:	e8 f7 f4 ff ff       	call   1001dc <irqHandle>
  100ce5:	83 c4 04             	add    $0x4,%esp
  100ce8:	83 c4 10             	add    $0x10,%esp
  100ceb:	61                   	popa   
  100cec:	83 c4 04             	add    $0x4,%esp
  100cef:	83 c4 04             	add    $0x4,%esp
  100cf2:	cf                   	iret   
