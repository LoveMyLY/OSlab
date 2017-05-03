
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
  10001e:	e8 a1 0f 00 00       	call   100fc4 <initSerial>
  100023:	e8 64 0c 00 00       	call   100c8c <initIdt>
  100028:	e8 f3 0f 00 00       	call   101020 <initIntr>
  10002d:	ba 43 00 00 00       	mov    $0x43,%edx
  100032:	b0 34                	mov    $0x34,%al
  100034:	ee                   	out    %al,(%dx)
  100035:	ba 40 00 00 00       	mov    $0x40,%edx
  10003a:	b0 9b                	mov    $0x9b,%al
  10003c:	ee                   	out    %al,(%dx)
  10003d:	b0 2e                	mov    $0x2e,%al
  10003f:	ee                   	out    %al,(%dx)
  100040:	e8 2f 0a 00 00       	call   100a74 <initSeg>
  100045:	fb                   	sti    
  100046:	e8 91 04 00 00       	call   1004dc <initPcb>
  10004b:	e8 a4 0b 00 00       	call   100bf4 <loadUMain>
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
  100063:	b9 d2 24 10 00       	mov    $0x1024d2,%ecx
  100068:	84 c0                	test   %al,%al
  10006a:	74 0b                	je     100077 <abort+0x23>
  10006c:	41                   	inc    %ecx
  10006d:	42                   	inc    %edx
  10006e:	88 41 ff             	mov    %al,-0x1(%ecx)
  100071:	8a 02                	mov    (%edx),%al
  100073:	84 c0                	test   %al,%al
  100075:	75 f5                	jne    10006c <abort+0x18>
  100077:	c6 01 3a             	movb   $0x3a,(%ecx)
  10007a:	bb fd 25 10 00       	mov    $0x1025fd,%ebx
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
  1000c2:	0f be 05 c0 24 10 00 	movsbl 0x1024c0,%eax
  1000c9:	84 c0                	test   %al,%al
  1000cb:	74 1b                	je     1000e8 <abort+0x94>
  1000cd:	bb c0 24 10 00       	mov    $0x1024c0,%ebx
  1000d2:	83 ec 0c             	sub    $0xc,%esp
  1000d5:	50                   	push   %eax
  1000d6:	e8 29 0f 00 00       	call   101004 <putChar>
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
  1000fe:	e8 01 0f 00 00       	call   101004 <putChar>
  100103:	83 c4 10             	add    $0x10,%esp
  100106:	83 fb 0a             	cmp    $0xa,%ebx
  100109:	74 3c                	je     100147 <sys_write+0x5b>
  10010b:	66 b8 10 00          	mov    $0x10,%ax
  10010f:	8e d8                	mov    %eax,%ds
  100111:	8e c0                	mov    %eax,%es
  100113:	66 b8 30 00          	mov    $0x30,%ax
  100117:	8e e8                	mov    %eax,%gs
  100119:	a1 c0 25 10 00       	mov    0x1025c0,%eax
  10011e:	6b c0 50             	imul   $0x50,%eax,%eax
  100121:	03 05 00 26 10 00    	add    0x102600,%eax
  100127:	6b c0 02             	imul   $0x2,%eax,%eax
  10012a:	89 c7                	mov    %eax,%edi
  10012c:	8a 46 28             	mov    0x28(%esi),%al
  10012f:	b4 0f                	mov    $0xf,%ah
  100131:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100135:	a1 00 26 10 00       	mov    0x102600,%eax
  10013a:	40                   	inc    %eax
  10013b:	a3 00 26 10 00       	mov    %eax,0x102600
  100140:	3d 9f 00 00 00       	cmp    $0x9f,%eax
  100145:	7e 10                	jle    100157 <sys_write+0x6b>
  100147:	ff 05 c0 25 10 00    	incl   0x1025c0
  10014d:	c7 05 00 26 10 00 00 	movl   $0x0,0x102600
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
  100163:	83 ec 08             	sub    $0x8,%esp
  100166:	8b 55 08             	mov    0x8(%ebp),%edx
  100169:	8b 42 2c             	mov    0x2c(%edx),%eax
  10016c:	83 f8 03             	cmp    $0x3,%eax
  10016f:	74 4b                	je     1001bc <syscallHandle+0x5c>
  100171:	76 21                	jbe    100194 <syscallHandle+0x34>
  100173:	83 f8 04             	cmp    $0x4,%eax
  100176:	74 10                	je     100188 <syscallHandle+0x28>
  100178:	83 f8 05             	cmp    $0x5,%eax
  10017b:	75 27                	jne    1001a4 <syscallHandle+0x44>
  10017d:	89 55 08             	mov    %edx,0x8(%ebp)
  100180:	c9                   	leave  
  100181:	e9 72 07 00 00       	jmp    1008f8 <sys_exit>
  100186:	66 90                	xchg   %ax,%ax
  100188:	89 55 08             	mov    %edx,0x8(%ebp)
  10018b:	c9                   	leave  
  10018c:	e9 5b ff ff ff       	jmp    1000ec <sys_write>
  100191:	8d 76 00             	lea    0x0(%esi),%esi
  100194:	83 f8 02             	cmp    $0x2,%eax
  100197:	75 0b                	jne    1001a4 <syscallHandle+0x44>
  100199:	89 55 08             	mov    %edx,0x8(%ebp)
  10019c:	c9                   	leave  
  10019d:	e9 3e 04 00 00       	jmp    1005e0 <sys_fork>
  1001a2:	66 90                	xchg   %ax,%ax
  1001a4:	83 ec 08             	sub    $0x8,%esp
  1001a7:	68 85 00 00 00       	push   $0x85
  1001ac:	68 f4 10 10 00       	push   $0x1010f4
  1001b1:	e8 9e fe ff ff       	call   100054 <abort>
  1001b6:	83 c4 10             	add    $0x10,%esp
  1001b9:	c9                   	leave  
  1001ba:	c3                   	ret    
  1001bb:	90                   	nop
  1001bc:	89 55 08             	mov    %edx,0x8(%ebp)
  1001bf:	c9                   	leave  
  1001c0:	e9 b3 05 00 00       	jmp    100778 <sys_sleep>
  1001c5:	8d 76 00             	lea    0x0(%esi),%esi

001001c8 <irqHandle>:
  1001c8:	55                   	push   %ebp
  1001c9:	89 e5                	mov    %esp,%ebp
  1001cb:	53                   	push   %ebx
  1001cc:	83 ec 10             	sub    $0x10,%esp
  1001cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1001d2:	66 b8 10 00          	mov    $0x10,%ax
  1001d6:	8e d8                	mov    %eax,%ds
  1001d8:	8e c0                	mov    %eax,%es
  1001da:	66 b8 30 00          	mov    $0x30,%ax
  1001de:	8e e8                	mov    %eax,%gs
  1001e0:	a0 20 26 10 00       	mov    0x102620,%al
  1001e5:	83 c0 30             	add    $0x30,%eax
  1001e8:	0f be c0             	movsbl %al,%eax
  1001eb:	50                   	push   %eax
  1001ec:	e8 13 0e 00 00       	call   101004 <putChar>
  1001f1:	83 c4 10             	add    $0x10,%esp
  1001f4:	8b 43 30             	mov    0x30(%ebx),%eax
  1001f7:	83 f8 0d             	cmp    $0xd,%eax
  1001fa:	74 4c                	je     100248 <irqHandle+0x80>
  1001fc:	7e 22                	jle    100220 <irqHandle+0x58>
  1001fe:	83 f8 20             	cmp    $0x20,%eax
  100201:	74 11                	je     100214 <irqHandle+0x4c>
  100203:	83 c0 80             	add    $0xffffff80,%eax
  100206:	75 20                	jne    100228 <irqHandle+0x60>
  100208:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10020b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10020e:	c9                   	leave  
  10020f:	e9 4c ff ff ff       	jmp    100160 <syscallHandle>
  100214:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100217:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10021a:	c9                   	leave  
  10021b:	e9 e0 00 00 00       	jmp    100300 <Intrtime>
  100220:	40                   	inc    %eax
  100221:	75 05                	jne    100228 <irqHandle+0x60>
  100223:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100226:	c9                   	leave  
  100227:	c3                   	ret    
  100228:	83 ec 08             	sub    $0x8,%esp
  10022b:	6a 38                	push   $0x38
  10022d:	68 f4 10 10 00       	push   $0x1010f4
  100232:	e8 1d fe ff ff       	call   100054 <abort>
  100237:	8e 5b 0c             	mov    0xc(%ebx),%ds
  10023a:	8e 43 08             	mov    0x8(%ebx),%es
  10023d:	8e 2b                	mov    (%ebx),%gs
  10023f:	83 c4 10             	add    $0x10,%esp
  100242:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100245:	c9                   	leave  
  100246:	c3                   	ret    
  100247:	90                   	nop
  100248:	83 ec 08             	sub    $0x8,%esp
  10024b:	68 8a 00 00 00       	push   $0x8a
  100250:	68 f4 10 10 00       	push   $0x1010f4
  100255:	e8 fa fd ff ff       	call   100054 <abort>
  10025a:	83 c4 10             	add    $0x10,%esp
  10025d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100260:	c9                   	leave  
  100261:	c3                   	ret    
  100262:	66 90                	xchg   %ax,%ax

00100264 <GProtectFaultHandle>:
  100264:	55                   	push   %ebp
  100265:	89 e5                	mov    %esp,%ebp
  100267:	83 ec 10             	sub    $0x10,%esp
  10026a:	68 8a 00 00 00       	push   $0x8a
  10026f:	68 f4 10 10 00       	push   $0x1010f4
  100274:	e8 db fd ff ff       	call   100054 <abort>
  100279:	83 c4 10             	add    $0x10,%esp
  10027c:	c9                   	leave  
  10027d:	c3                   	ret    
  10027e:	66 90                	xchg   %ax,%ax

00100280 <IDLE>:
  100280:	55                   	push   %ebp
  100281:	89 e5                	mov    %esp,%ebp
  100283:	90                   	nop
  100284:	f4                   	hlt    
  100285:	eb fd                	jmp    100284 <IDLE+0x4>
  100287:	90                   	nop

00100288 <debug>:
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	53                   	push   %ebx
  10028c:	83 ec 10             	sub    $0x10,%esp
  10028f:	6a 0a                	push   $0xa
  100291:	e8 6e 0d 00 00       	call   101004 <putChar>
  100296:	bb 6c 65 10 00       	mov    $0x10656c,%ebx
  10029b:	83 c4 10             	add    $0x10,%esp
  10029e:	eb 30                	jmp    1002d0 <debug+0x48>
  1002a0:	83 ec 0c             	sub    $0xc,%esp
  1002a3:	8a 43 04             	mov    0x4(%ebx),%al
  1002a6:	83 c0 30             	add    $0x30,%eax
  1002a9:	0f be c0             	movsbl %al,%eax
  1002ac:	50                   	push   %eax
  1002ad:	e8 52 0d 00 00       	call   101004 <putChar>
  1002b2:	83 c4 10             	add    $0x10,%esp
  1002b5:	83 ec 0c             	sub    $0xc,%esp
  1002b8:	6a 20                	push   $0x20
  1002ba:	e8 45 0d 00 00       	call   101004 <putChar>
  1002bf:	81 c3 a0 1f 00 00    	add    $0x1fa0,%ebx
  1002c5:	83 c4 10             	add    $0x10,%esp
  1002c8:	81 fb cc 42 11 00    	cmp    $0x1142cc,%ebx
  1002ce:	74 28                	je     1002f8 <debug+0x70>
  1002d0:	83 7b 10 01          	cmpl   $0x1,0x10(%ebx)
  1002d4:	75 22                	jne    1002f8 <debug+0x70>
  1002d6:	83 ec 0c             	sub    $0xc,%esp
  1002d9:	8a 03                	mov    (%ebx),%al
  1002db:	83 c0 30             	add    $0x30,%eax
  1002de:	0f be c0             	movsbl %al,%eax
  1002e1:	50                   	push   %eax
  1002e2:	e8 1d 0d 00 00       	call   101004 <putChar>
  1002e7:	83 c4 10             	add    $0x10,%esp
  1002ea:	83 3b 03             	cmpl   $0x3,(%ebx)
  1002ed:	75 b1                	jne    1002a0 <debug+0x18>
  1002ef:	83 ec 0c             	sub    $0xc,%esp
  1002f2:	8a 43 08             	mov    0x8(%ebx),%al
  1002f5:	eb af                	jmp    1002a6 <debug+0x1e>
  1002f7:	90                   	nop
  1002f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002fb:	c9                   	leave  
  1002fc:	c3                   	ret    
  1002fd:	8d 76 00             	lea    0x0(%esi),%esi

00100300 <Intrtime>:
  100300:	55                   	push   %ebp
  100301:	89 e5                	mov    %esp,%ebp
  100303:	57                   	push   %edi
  100304:	56                   	push   %esi
  100305:	53                   	push   %ebx
  100306:	83 ec 18             	sub    $0x18,%esp
  100309:	6a 61                	push   $0x61
  10030b:	e8 f4 0c 00 00       	call   101004 <putChar>
  100310:	8b 15 20 26 10 00    	mov    0x102620,%edx
  100316:	89 d0                	mov    %edx,%eax
  100318:	c1 e0 06             	shl    $0x6,%eax
  10031b:	29 d0                	sub    %edx,%eax
  10031d:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100320:	c1 e3 05             	shl    $0x5,%ebx
  100323:	8d 83 80 45 10 00    	lea    0x104580(%ebx),%eax
  100329:	b9 13 00 00 00       	mov    $0x13,%ecx
  10032e:	89 c7                	mov    %eax,%edi
  100330:	8b 75 08             	mov    0x8(%ebp),%esi
  100333:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100335:	c7 83 cc 45 10 00 02 	movl   $0x2,0x1045cc(%ebx)
  10033c:	00 00 00 
  10033f:	81 c3 40 26 10 00    	add    $0x102640,%ebx
  100345:	ff 8b 90 1f 00 00    	decl   0x1f90(%ebx)
  10034b:	b9 6c 65 10 00       	mov    $0x10656c,%ecx
  100350:	83 c4 10             	add    $0x10,%esp
  100353:	89 c8                	mov    %ecx,%eax
  100355:	eb 0d                	jmp    100364 <Intrtime+0x64>
  100357:	90                   	nop
  100358:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  10035d:	3d cc 42 11 00       	cmp    $0x1142cc,%eax
  100362:	74 34                	je     100398 <Intrtime+0x98>
  100364:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  100368:	75 2e                	jne    100398 <Intrtime+0x98>
  10036a:	83 38 03             	cmpl   $0x3,(%eax)
  10036d:	75 e9                	jne    100358 <Intrtime+0x58>
  10036f:	8b 78 08             	mov    0x8(%eax),%edi
  100372:	8d 5f ff             	lea    -0x1(%edi),%ebx
  100375:	89 58 08             	mov    %ebx,0x8(%eax)
  100378:	85 db                	test   %ebx,%ebx
  10037a:	75 dc                	jne    100358 <Intrtime+0x58>
  10037c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  100382:	c7 40 04 0a 00 00 00 	movl   $0xa,0x4(%eax)
  100389:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  10038e:	3d cc 42 11 00       	cmp    $0x1142cc,%eax
  100393:	75 cf                	jne    100364 <Intrtime+0x64>
  100395:	8d 76 00             	lea    0x0(%esi),%esi
  100398:	89 d0                	mov    %edx,%eax
  10039a:	c1 e0 06             	shl    $0x6,%eax
  10039d:	29 d0                	sub    %edx,%eax
  10039f:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1003a2:	c1 e0 05             	shl    $0x5,%eax
  1003a5:	05 40 26 10 00       	add    $0x102640,%eax
  1003aa:	8b 98 90 1f 00 00    	mov    0x1f90(%eax),%ebx
  1003b0:	85 db                	test   %ebx,%ebx
  1003b2:	0f 85 b8 00 00 00    	jne    100470 <Intrtime+0x170>
  1003b8:	85 d2                	test   %edx,%edx
  1003ba:	0f 84 b4 00 00 00    	je     100474 <Intrtime+0x174>
  1003c0:	c7 80 8c 1f 00 00 02 	movl   $0x2,0x1f8c(%eax)
  1003c7:	00 00 00 
  1003ca:	b8 01 00 00 00       	mov    $0x1,%eax
  1003cf:	eb 0f                	jmp    1003e0 <Intrtime+0xe0>
  1003d1:	8d 76 00             	lea    0x0(%esi),%esi
  1003d4:	40                   	inc    %eax
  1003d5:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  1003db:	83 f8 08             	cmp    $0x8,%eax
  1003de:	74 1c                	je     1003fc <Intrtime+0xfc>
  1003e0:	83 39 02             	cmpl   $0x2,(%ecx)
  1003e3:	75 ef                	jne    1003d4 <Intrtime+0xd4>
  1003e5:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  1003e9:	75 e9                	jne    1003d4 <Intrtime+0xd4>
  1003eb:	39 c2                	cmp    %eax,%edx
  1003ed:	75 0f                	jne    1003fe <Intrtime+0xfe>
  1003ef:	40                   	inc    %eax
  1003f0:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  1003f6:	83 f8 08             	cmp    $0x8,%eax
  1003f9:	75 e5                	jne    1003e0 <Intrtime+0xe0>
  1003fb:	90                   	nop
  1003fc:	31 c0                	xor    %eax,%eax
  1003fe:	89 c2                	mov    %eax,%edx
  100400:	c1 e2 06             	shl    $0x6,%edx
  100403:	29 c2                	sub    %eax,%edx
  100405:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100408:	c1 e2 05             	shl    $0x5,%edx
  10040b:	c7 82 cc 45 10 00 01 	movl   $0x1,0x1045cc(%edx)
  100412:	00 00 00 
  100415:	c7 82 d0 45 10 00 0a 	movl   $0xa,0x1045d0(%edx)
  10041c:	00 00 00 
  10041f:	a3 20 26 10 00       	mov    %eax,0x102620
  100424:	89 c2                	mov    %eax,%edx
  100426:	89 d0                	mov    %edx,%eax
  100428:	c1 e0 06             	shl    $0x6,%eax
  10042b:	29 d0                	sub    %edx,%eax
  10042d:	8d 34 82             	lea    (%edx,%eax,4),%esi
  100430:	c1 e6 05             	shl    $0x5,%esi
  100433:	c7 86 cc 45 10 00 01 	movl   $0x1,0x1045cc(%esi)
  10043a:	00 00 00 
  10043d:	81 c6 80 45 10 00    	add    $0x104580,%esi
  100443:	b9 13 00 00 00       	mov    $0x13,%ecx
  100448:	8b 7d 08             	mov    0x8(%ebp),%edi
  10044b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10044d:	83 fa 01             	cmp    $0x1,%edx
  100450:	74 7e                	je     1004d0 <Intrtime+0x1d0>
  100452:	83 fa 02             	cmp    $0x2,%edx
  100455:	74 69                	je     1004c0 <Intrtime+0x1c0>
  100457:	66 c7 05 62 23 11 00 	movw   $0x0,0x112362
  10045e:	00 00 
  100460:	c6 05 64 23 11 00 00 	movb   $0x0,0x112364
  100467:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10046a:	5b                   	pop    %ebx
  10046b:	5e                   	pop    %esi
  10046c:	5f                   	pop    %edi
  10046d:	5d                   	pop    %ebp
  10046e:	c3                   	ret    
  10046f:	90                   	nop
  100470:	85 d2                	test   %edx,%edx
  100472:	75 b2                	jne    100426 <Intrtime+0x126>
  100474:	ba 01 00 00 00       	mov    $0x1,%edx
  100479:	eb 0d                	jmp    100488 <Intrtime+0x188>
  10047b:	90                   	nop
  10047c:	42                   	inc    %edx
  10047d:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  100483:	83 fa 08             	cmp    $0x8,%edx
  100486:	74 44                	je     1004cc <Intrtime+0x1cc>
  100488:	83 39 02             	cmpl   $0x2,(%ecx)
  10048b:	75 ef                	jne    10047c <Intrtime+0x17c>
  10048d:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  100491:	75 e9                	jne    10047c <Intrtime+0x17c>
  100493:	89 d0                	mov    %edx,%eax
  100495:	c1 e0 06             	shl    $0x6,%eax
  100498:	29 d0                	sub    %edx,%eax
  10049a:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10049d:	c1 e0 05             	shl    $0x5,%eax
  1004a0:	c7 80 cc 45 10 00 01 	movl   $0x1,0x1045cc(%eax)
  1004a7:	00 00 00 
  1004aa:	c7 80 d0 45 10 00 0a 	movl   $0xa,0x1045d0(%eax)
  1004b1:	00 00 00 
  1004b4:	89 15 20 26 10 00    	mov    %edx,0x102620
  1004ba:	e9 67 ff ff ff       	jmp    100426 <Intrtime+0x126>
  1004bf:	90                   	nop
  1004c0:	c6 05 67 23 11 00 01 	movb   $0x1,0x112367
  1004c7:	eb 8e                	jmp    100457 <Intrtime+0x157>
  1004c9:	8d 76 00             	lea    0x0(%esi),%esi
  1004cc:	31 d2                	xor    %edx,%edx
  1004ce:	eb c3                	jmp    100493 <Intrtime+0x193>
  1004d0:	c6 05 67 23 11 00 00 	movb   $0x0,0x112367
  1004d7:	e9 7b ff ff ff       	jmp    100457 <Intrtime+0x157>

001004dc <initPcb>:
  1004dc:	55                   	push   %ebp
  1004dd:	89 e5                	mov    %esp,%ebp
  1004df:	b8 dc 45 10 00       	mov    $0x1045dc,%eax
  1004e4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1004ea:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1004ef:	3d dc 42 11 00       	cmp    $0x1142dc,%eax
  1004f4:	75 ee                	jne    1004e4 <initPcb+0x8>
  1004f6:	c7 05 dc 45 10 00 01 	movl   $0x1,0x1045dc
  1004fd:	00 00 00 
  100500:	c7 05 cc 45 10 00 02 	movl   $0x2,0x1045cc
  100507:	00 00 00 
  10050a:	c7 05 d8 45 10 00 00 	movl   $0x0,0x1045d8
  100511:	00 00 00 
  100514:	c7 05 d0 45 10 00 0a 	movl   $0xa,0x1045d0
  10051b:	00 00 00 
  10051e:	c7 05 d4 45 10 00 00 	movl   $0x0,0x1045d4
  100525:	00 00 00 
  100528:	c7 05 bc 45 10 00 08 	movl   $0x8,0x1045bc
  10052f:	00 00 00 
  100532:	c7 05 b8 45 10 00 80 	movl   $0x100280,0x1045b8
  100539:	02 10 00 
  10053c:	c7 05 c8 45 10 00 10 	movl   $0x10,0x1045c8
  100543:	00 00 00 
  100546:	c7 05 c0 45 10 00 02 	movl   $0x202,0x1045c0
  10054d:	02 00 00 
  100550:	c7 05 c4 45 10 00 00 	movl   $0x8000000,0x1045c4
  100557:	00 00 08 
  10055a:	c7 05 98 45 10 00 00 	movl   $0x8000000,0x104598
  100561:	00 00 08 
  100564:	c7 05 7c 65 10 00 01 	movl   $0x1,0x10657c
  10056b:	00 00 00 
  10056e:	c7 05 6c 65 10 00 01 	movl   $0x1,0x10656c
  100575:	00 00 00 
  100578:	c7 05 78 65 10 00 01 	movl   $0x1,0x106578
  10057f:	00 00 00 
  100582:	c7 05 70 65 10 00 0a 	movl   $0xa,0x106570
  100589:	00 00 00 
  10058c:	c7 05 74 65 10 00 00 	movl   $0x0,0x106574
  100593:	00 00 00 
  100596:	c7 05 5c 65 10 00 1b 	movl   $0x1b,0x10655c
  10059d:	00 00 00 
  1005a0:	c7 05 58 65 10 00 00 	movl   $0x200000,0x106558
  1005a7:	00 20 00 
  1005aa:	c7 05 68 65 10 00 23 	movl   $0x23,0x106568
  1005b1:	00 00 00 
  1005b4:	c7 05 60 65 10 00 02 	movl   $0x2,0x106560
  1005bb:	00 00 00 
  1005be:	c7 05 64 65 10 00 00 	movl   $0x8000000,0x106564
  1005c5:	00 00 08 
  1005c8:	c7 05 38 65 10 00 00 	movl   $0x8000000,0x106538
  1005cf:	00 00 08 
  1005d2:	c7 05 20 26 10 00 01 	movl   $0x1,0x102620
  1005d9:	00 00 00 
  1005dc:	5d                   	pop    %ebp
  1005dd:	c3                   	ret    
  1005de:	66 90                	xchg   %ax,%ax

001005e0 <sys_fork>:
  1005e0:	55                   	push   %ebp
  1005e1:	89 e5                	mov    %esp,%ebp
  1005e3:	57                   	push   %edi
  1005e4:	56                   	push   %esi
  1005e5:	53                   	push   %ebx
  1005e6:	83 ec 28             	sub    $0x28,%esp
  1005e9:	6a 62                	push   $0x62
  1005eb:	e8 14 0a 00 00       	call   101004 <putChar>
  1005f0:	8b 1d 20 26 10 00    	mov    0x102620,%ebx
  1005f6:	89 d8                	mov    %ebx,%eax
  1005f8:	c1 e0 06             	shl    $0x6,%eax
  1005fb:	29 d8                	sub    %ebx,%eax
  1005fd:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  100600:	c1 e2 05             	shl    $0x5,%edx
  100603:	8d 82 80 45 10 00    	lea    0x104580(%edx),%eax
  100609:	b9 13 00 00 00       	mov    $0x13,%ecx
  10060e:	89 c7                	mov    %eax,%edi
  100610:	8b 75 08             	mov    0x8(%ebp),%esi
  100613:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100615:	c7 82 cc 45 10 00 02 	movl   $0x2,0x1045cc(%edx)
  10061c:	00 00 00 
  10061f:	b8 7c 65 10 00       	mov    $0x10657c,%eax
  100624:	83 c4 10             	add    $0x10,%esp
  100627:	ba 01 00 00 00       	mov    $0x1,%edx
  10062c:	8b 08                	mov    (%eax),%ecx
  10062e:	85 c9                	test   %ecx,%ecx
  100630:	0f 84 16 01 00 00    	je     10074c <sys_fork+0x16c>
  100636:	42                   	inc    %edx
  100637:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  10063c:	83 fa 08             	cmp    $0x8,%edx
  10063f:	75 eb                	jne    10062c <sys_fork+0x4c>
  100641:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  100648:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  10064d:	89 d0                	mov    %edx,%eax
  10064f:	c1 e0 06             	shl    $0x6,%eax
  100652:	29 d0                	sub    %edx,%eax
  100654:	8d 34 82             	lea    (%edx,%eax,4),%esi
  100657:	c1 e6 05             	shl    $0x5,%esi
  10065a:	8d 86 40 26 10 00    	lea    0x102640(%esi),%eax
  100660:	c7 86 cc 45 10 00 02 	movl   $0x2,0x1045cc(%esi)
  100667:	00 00 00 
  10066a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  10066d:	89 be d8 45 10 00    	mov    %edi,0x1045d8(%esi)
  100673:	c7 86 d0 45 10 00 0a 	movl   $0xa,0x1045d0(%esi)
  10067a:	00 00 00 
  10067d:	c7 86 d4 45 10 00 00 	movl   $0x0,0x1045d4(%esi)
  100684:	00 00 00 
  100687:	81 c6 80 45 10 00    	add    $0x104580,%esi
  10068d:	b9 13 00 00 00       	mov    $0x13,%ecx
  100692:	89 75 e0             	mov    %esi,-0x20(%ebp)
  100695:	89 f7                	mov    %esi,%edi
  100697:	8b 75 08             	mov    0x8(%ebp),%esi
  10069a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10069c:	c7 80 6c 1f 00 00 00 	movl   $0x0,0x1f6c(%eax)
  1006a3:	00 00 00 
  1006a6:	8b b0 84 1f 00 00    	mov    0x1f84(%eax),%esi
  1006ac:	8d 8e 00 00 00 01    	lea    0x1000000(%esi),%ecx
  1006b2:	89 cf                	mov    %ecx,%edi
  1006b4:	b9 00 00 00 08       	mov    $0x8000000,%ecx
  1006b9:	29 f1                	sub    %esi,%ecx
  1006bb:	89 de                	mov    %ebx,%esi
  1006bd:	c1 e6 06             	shl    $0x6,%esi
  1006c0:	29 de                	sub    %ebx,%esi
  1006c2:	8d 1c b3             	lea    (%ebx,%esi,4),%ebx
  1006c5:	c1 e3 05             	shl    $0x5,%ebx
  1006c8:	8b b3 c4 45 10 00    	mov    0x1045c4(%ebx),%esi
  1006ce:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1006d0:	bb 00 00 20 01       	mov    $0x1200000,%ebx
  1006d5:	be 00 00 20 00       	mov    $0x200000,%esi
  1006da:	b9 00 08 00 00       	mov    $0x800,%ecx
  1006df:	89 df                	mov    %ebx,%edi
  1006e1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006e3:	8b 1d 20 26 10 00    	mov    0x102620,%ebx
  1006e9:	89 d9                	mov    %ebx,%ecx
  1006eb:	c1 e1 06             	shl    $0x6,%ecx
  1006ee:	29 d9                	sub    %ebx,%ecx
  1006f0:	8d 0c 8b             	lea    (%ebx,%ecx,4),%ecx
  1006f3:	c1 e1 05             	shl    $0x5,%ecx
  1006f6:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  1006f9:	89 99 ac 45 10 00    	mov    %ebx,0x1045ac(%ecx)
  1006ff:	89 15 20 26 10 00    	mov    %edx,0x102620
  100705:	c7 80 8c 1f 00 00 01 	movl   $0x1,0x1f8c(%eax)
  10070c:	00 00 00 
  10070f:	b9 13 00 00 00       	mov    $0x13,%ecx
  100714:	8b 7d 08             	mov    0x8(%ebp),%edi
  100717:	8b 75 e0             	mov    -0x20(%ebp),%esi
  10071a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10071c:	83 fa 01             	cmp    $0x1,%edx
  10071f:	74 4b                	je     10076c <sys_fork+0x18c>
  100721:	83 fa 02             	cmp    $0x2,%edx
  100724:	74 1a                	je     100740 <sys_fork+0x160>
  100726:	66 c7 05 62 23 11 00 	movw   $0x0,0x112362
  10072d:	00 00 
  10072f:	c6 05 64 23 11 00 00 	movb   $0x0,0x112364
  100736:	89 d0                	mov    %edx,%eax
  100738:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10073b:	5b                   	pop    %ebx
  10073c:	5e                   	pop    %esi
  10073d:	5f                   	pop    %edi
  10073e:	5d                   	pop    %ebp
  10073f:	c3                   	ret    
  100740:	c6 05 67 23 11 00 01 	movb   $0x1,0x112367
  100747:	eb dd                	jmp    100726 <sys_fork+0x146>
  100749:	8d 76 00             	lea    0x0(%esi),%esi
  10074c:	89 d0                	mov    %edx,%eax
  10074e:	c1 e0 06             	shl    $0x6,%eax
  100751:	29 d0                	sub    %edx,%eax
  100753:	8d 04 82             	lea    (%edx,%eax,4),%eax
  100756:	c1 e0 05             	shl    $0x5,%eax
  100759:	c7 80 dc 45 10 00 01 	movl   $0x1,0x1045dc(%eax)
  100760:	00 00 00 
  100763:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  100766:	e9 e2 fe ff ff       	jmp    10064d <sys_fork+0x6d>
  10076b:	90                   	nop
  10076c:	c6 05 67 23 11 00 00 	movb   $0x0,0x112367
  100773:	eb b1                	jmp    100726 <sys_fork+0x146>
  100775:	8d 76 00             	lea    0x0(%esi),%esi

00100778 <sys_sleep>:
  100778:	55                   	push   %ebp
  100779:	89 e5                	mov    %esp,%ebp
  10077b:	57                   	push   %edi
  10077c:	56                   	push   %esi
  10077d:	53                   	push   %ebx
  10077e:	83 ec 18             	sub    $0x18,%esp
  100781:	6a 63                	push   $0x63
  100783:	e8 7c 08 00 00       	call   101004 <putChar>
  100788:	8b 15 20 26 10 00    	mov    0x102620,%edx
  10078e:	89 d0                	mov    %edx,%eax
  100790:	c1 e0 06             	shl    $0x6,%eax
  100793:	29 d0                	sub    %edx,%eax
  100795:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  100798:	c1 e3 05             	shl    $0x5,%ebx
  10079b:	8d 83 80 45 10 00    	lea    0x104580(%ebx),%eax
  1007a1:	b9 13 00 00 00       	mov    $0x13,%ecx
  1007a6:	89 c7                	mov    %eax,%edi
  1007a8:	8b 75 08             	mov    0x8(%ebp),%esi
  1007ab:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1007ad:	c7 83 cc 45 10 00 02 	movl   $0x2,0x1045cc(%ebx)
  1007b4:	00 00 00 
  1007b7:	81 c3 40 26 10 00    	add    $0x102640,%ebx
  1007bd:	ff 8b 90 1f 00 00    	decl   0x1f90(%ebx)
  1007c3:	b8 6c 65 10 00       	mov    $0x10656c,%eax
  1007c8:	83 c4 10             	add    $0x10,%esp
  1007cb:	eb 0f                	jmp    1007dc <sys_sleep+0x64>
  1007cd:	8d 76 00             	lea    0x0(%esi),%esi
  1007d0:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1007d5:	3d cc 42 11 00       	cmp    $0x1142cc,%eax
  1007da:	74 34                	je     100810 <sys_sleep+0x98>
  1007dc:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  1007e0:	75 2e                	jne    100810 <sys_sleep+0x98>
  1007e2:	83 38 03             	cmpl   $0x3,(%eax)
  1007e5:	75 e9                	jne    1007d0 <sys_sleep+0x58>
  1007e7:	8b 78 08             	mov    0x8(%eax),%edi
  1007ea:	8d 4f ff             	lea    -0x1(%edi),%ecx
  1007ed:	89 48 08             	mov    %ecx,0x8(%eax)
  1007f0:	85 c9                	test   %ecx,%ecx
  1007f2:	75 dc                	jne    1007d0 <sys_sleep+0x58>
  1007f4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  1007fa:	c7 40 04 0a 00 00 00 	movl   $0xa,0x4(%eax)
  100801:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100806:	3d cc 42 11 00       	cmp    $0x1142cc,%eax
  10080b:	75 cf                	jne    1007dc <sys_sleep+0x64>
  10080d:	8d 76 00             	lea    0x0(%esi),%esi
  100810:	89 d0                	mov    %edx,%eax
  100812:	c1 e0 06             	shl    $0x6,%eax
  100815:	29 d0                	sub    %edx,%eax
  100817:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10081a:	c1 e0 05             	shl    $0x5,%eax
  10081d:	8b 75 08             	mov    0x8(%ebp),%esi
  100820:	8b 4e 20             	mov    0x20(%esi),%ecx
  100823:	89 88 d4 45 10 00    	mov    %ecx,0x1045d4(%eax)
  100829:	c7 80 cc 45 10 00 03 	movl   $0x3,0x1045cc(%eax)
  100830:	00 00 00 
  100833:	b9 7c 65 10 00       	mov    $0x10657c,%ecx
  100838:	b8 01 00 00 00       	mov    $0x1,%eax
  10083d:	eb 0d                	jmp    10084c <sys_sleep+0xd4>
  10083f:	90                   	nop
  100840:	40                   	inc    %eax
  100841:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  100847:	83 f8 08             	cmp    $0x8,%eax
  10084a:	74 54                	je     1008a0 <sys_sleep+0x128>
  10084c:	83 39 01             	cmpl   $0x1,(%ecx)
  10084f:	75 ef                	jne    100840 <sys_sleep+0xc8>
  100851:	83 79 f0 02          	cmpl   $0x2,-0x10(%ecx)
  100855:	75 e9                	jne    100840 <sys_sleep+0xc8>
  100857:	39 c2                	cmp    %eax,%edx
  100859:	74 e5                	je     100840 <sys_sleep+0xc8>
  10085b:	89 c2                	mov    %eax,%edx
  10085d:	c1 e2 06             	shl    $0x6,%edx
  100860:	29 c2                	sub    %eax,%edx
  100862:	8d 34 90             	lea    (%eax,%edx,4),%esi
  100865:	c1 e6 05             	shl    $0x5,%esi
  100868:	c7 86 cc 45 10 00 01 	movl   $0x1,0x1045cc(%esi)
  10086f:	00 00 00 
  100872:	c7 86 d0 45 10 00 0a 	movl   $0xa,0x1045d0(%esi)
  100879:	00 00 00 
  10087c:	a3 20 26 10 00       	mov    %eax,0x102620
  100881:	81 c6 80 45 10 00    	add    $0x104580,%esi
  100887:	b9 13 00 00 00       	mov    $0x13,%ecx
  10088c:	8b 7d 08             	mov    0x8(%ebp),%edi
  10088f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100891:	83 f8 01             	cmp    $0x1,%eax
  100894:	75 51                	jne    1008e7 <sys_sleep+0x16f>
  100896:	c6 05 67 23 11 00 00 	movb   $0x0,0x112367
  10089d:	eb 2e                	jmp    1008cd <sys_sleep+0x155>
  10089f:	90                   	nop
  1008a0:	c7 05 cc 45 10 00 01 	movl   $0x1,0x1045cc
  1008a7:	00 00 00 
  1008aa:	c7 05 d0 45 10 00 0a 	movl   $0xa,0x1045d0
  1008b1:	00 00 00 
  1008b4:	c7 05 20 26 10 00 00 	movl   $0x0,0x102620
  1008bb:	00 00 00 
  1008be:	be 80 45 10 00       	mov    $0x104580,%esi
  1008c3:	b9 13 00 00 00       	mov    $0x13,%ecx
  1008c8:	8b 7d 08             	mov    0x8(%ebp),%edi
  1008cb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1008cd:	66 c7 05 62 23 11 00 	movw   $0x0,0x112362
  1008d4:	00 00 
  1008d6:	c6 05 64 23 11 00 00 	movb   $0x0,0x112364
  1008dd:	31 c0                	xor    %eax,%eax
  1008df:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1008e2:	5b                   	pop    %ebx
  1008e3:	5e                   	pop    %esi
  1008e4:	5f                   	pop    %edi
  1008e5:	5d                   	pop    %ebp
  1008e6:	c3                   	ret    
  1008e7:	83 f8 02             	cmp    $0x2,%eax
  1008ea:	75 e1                	jne    1008cd <sys_sleep+0x155>
  1008ec:	c6 05 67 23 11 00 01 	movb   $0x1,0x112367
  1008f3:	eb d8                	jmp    1008cd <sys_sleep+0x155>
  1008f5:	8d 76 00             	lea    0x0(%esi),%esi

001008f8 <sys_exit>:
  1008f8:	55                   	push   %ebp
  1008f9:	89 e5                	mov    %esp,%ebp
  1008fb:	57                   	push   %edi
  1008fc:	56                   	push   %esi
  1008fd:	83 ec 0c             	sub    $0xc,%esp
  100900:	6a 64                	push   $0x64
  100902:	e8 fd 06 00 00       	call   101004 <putChar>
  100907:	8b 0d 20 26 10 00    	mov    0x102620,%ecx
  10090d:	89 c8                	mov    %ecx,%eax
  10090f:	c1 e0 06             	shl    $0x6,%eax
  100912:	29 c8                	sub    %ecx,%eax
  100914:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100917:	c1 e0 05             	shl    $0x5,%eax
  10091a:	c7 80 dc 45 10 00 00 	movl   $0x0,0x1045dc(%eax)
  100921:	00 00 00 
  100924:	b8 7c 65 10 00       	mov    $0x10657c,%eax
  100929:	83 c4 10             	add    $0x10,%esp
  10092c:	ba 01 00 00 00       	mov    $0x1,%edx
  100931:	eb 0c                	jmp    10093f <sys_exit+0x47>
  100933:	90                   	nop
  100934:	42                   	inc    %edx
  100935:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  10093a:	83 fa 08             	cmp    $0x8,%edx
  10093d:	74 55                	je     100994 <sys_exit+0x9c>
  10093f:	83 38 01             	cmpl   $0x1,(%eax)
  100942:	75 f0                	jne    100934 <sys_exit+0x3c>
  100944:	83 78 f0 02          	cmpl   $0x2,-0x10(%eax)
  100948:	75 ea                	jne    100934 <sys_exit+0x3c>
  10094a:	39 d1                	cmp    %edx,%ecx
  10094c:	74 e6                	je     100934 <sys_exit+0x3c>
  10094e:	89 d0                	mov    %edx,%eax
  100950:	c1 e0 06             	shl    $0x6,%eax
  100953:	29 d0                	sub    %edx,%eax
  100955:	8d 34 82             	lea    (%edx,%eax,4),%esi
  100958:	c1 e6 05             	shl    $0x5,%esi
  10095b:	c7 86 cc 45 10 00 01 	movl   $0x1,0x1045cc(%esi)
  100962:	00 00 00 
  100965:	c7 86 d0 45 10 00 0a 	movl   $0xa,0x1045d0(%esi)
  10096c:	00 00 00 
  10096f:	89 15 20 26 10 00    	mov    %edx,0x102620
  100975:	81 c6 80 45 10 00    	add    $0x104580,%esi
  10097b:	b9 13 00 00 00       	mov    $0x13,%ecx
  100980:	8b 7d 08             	mov    0x8(%ebp),%edi
  100983:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100985:	83 fa 01             	cmp    $0x1,%edx
  100988:	75 50                	jne    1009da <sys_exit+0xe2>
  10098a:	c6 05 67 23 11 00 00 	movb   $0x0,0x112367
  100991:	eb 2e                	jmp    1009c1 <sys_exit+0xc9>
  100993:	90                   	nop
  100994:	c7 05 cc 45 10 00 01 	movl   $0x1,0x1045cc
  10099b:	00 00 00 
  10099e:	c7 05 d0 45 10 00 0a 	movl   $0xa,0x1045d0
  1009a5:	00 00 00 
  1009a8:	c7 05 20 26 10 00 00 	movl   $0x0,0x102620
  1009af:	00 00 00 
  1009b2:	be 80 45 10 00       	mov    $0x104580,%esi
  1009b7:	b9 13 00 00 00       	mov    $0x13,%ecx
  1009bc:	8b 7d 08             	mov    0x8(%ebp),%edi
  1009bf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1009c1:	66 c7 05 62 23 11 00 	movw   $0x0,0x112362
  1009c8:	00 00 
  1009ca:	c6 05 64 23 11 00 00 	movb   $0x0,0x112364
  1009d1:	31 c0                	xor    %eax,%eax
  1009d3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1009d6:	5e                   	pop    %esi
  1009d7:	5f                   	pop    %edi
  1009d8:	5d                   	pop    %ebp
  1009d9:	c3                   	ret    
  1009da:	83 fa 02             	cmp    $0x2,%edx
  1009dd:	75 e2                	jne    1009c1 <sys_exit+0xc9>
  1009df:	c6 05 67 23 11 00 01 	movb   $0x1,0x112367
  1009e6:	eb d9                	jmp    1009c1 <sys_exit+0xc9>

001009e8 <waitDisk>:
  1009e8:	55                   	push   %ebp
  1009e9:	89 e5                	mov    %esp,%ebp
  1009eb:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1009f0:	ec                   	in     (%dx),%al
  1009f1:	83 e0 c0             	and    $0xffffffc0,%eax
  1009f4:	3c 40                	cmp    $0x40,%al
  1009f6:	75 f8                	jne    1009f0 <waitDisk+0x8>
  1009f8:	5d                   	pop    %ebp
  1009f9:	c3                   	ret    
  1009fa:	66 90                	xchg   %ax,%ax

001009fc <readSect>:
  1009fc:	55                   	push   %ebp
  1009fd:	89 e5                	mov    %esp,%ebp
  1009ff:	53                   	push   %ebx
  100a00:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100a03:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100a08:	ec                   	in     (%dx),%al
  100a09:	83 e0 c0             	and    $0xffffffc0,%eax
  100a0c:	3c 40                	cmp    $0x40,%al
  100a0e:	75 f8                	jne    100a08 <readSect+0xc>
  100a10:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100a15:	b0 01                	mov    $0x1,%al
  100a17:	ee                   	out    %al,(%dx)
  100a18:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100a1d:	88 c8                	mov    %cl,%al
  100a1f:	ee                   	out    %al,(%dx)
  100a20:	89 c8                	mov    %ecx,%eax
  100a22:	c1 f8 08             	sar    $0x8,%eax
  100a25:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100a2a:	ee                   	out    %al,(%dx)
  100a2b:	89 c8                	mov    %ecx,%eax
  100a2d:	c1 f8 10             	sar    $0x10,%eax
  100a30:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100a35:	ee                   	out    %al,(%dx)
  100a36:	89 c8                	mov    %ecx,%eax
  100a38:	c1 f8 18             	sar    $0x18,%eax
  100a3b:	83 c8 e0             	or     $0xffffffe0,%eax
  100a3e:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100a43:	ee                   	out    %al,(%dx)
  100a44:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100a49:	b0 20                	mov    $0x20,%al
  100a4b:	ee                   	out    %al,(%dx)
  100a4c:	ec                   	in     (%dx),%al
  100a4d:	83 e0 c0             	and    $0xffffffc0,%eax
  100a50:	3c 40                	cmp    $0x40,%al
  100a52:	75 f8                	jne    100a4c <readSect+0x50>
  100a54:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100a57:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100a5d:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100a62:	66 90                	xchg   %ax,%ax
  100a64:	ed                   	in     (%dx),%eax
  100a65:	89 01                	mov    %eax,(%ecx)
  100a67:	83 c1 04             	add    $0x4,%ecx
  100a6a:	39 d9                	cmp    %ebx,%ecx
  100a6c:	75 f6                	jne    100a64 <readSect+0x68>
  100a6e:	5b                   	pop    %ebx
  100a6f:	5d                   	pop    %ebp
  100a70:	c3                   	ret    
  100a71:	8d 76 00             	lea    0x0(%esi),%esi

00100a74 <initSeg>:
  100a74:	55                   	push   %ebp
  100a75:	89 e5                	mov    %esp,%ebp
  100a77:	b9 40 23 11 00       	mov    $0x112340,%ecx
  100a7c:	66 c7 05 48 23 11 00 	movw   $0xffff,0x112348
  100a83:	ff ff 
  100a85:	66 c7 05 4a 23 11 00 	movw   $0x0,0x11234a
  100a8c:	00 00 
  100a8e:	c6 05 4c 23 11 00 00 	movb   $0x0,0x11234c
  100a95:	c6 05 4d 23 11 00 9a 	movb   $0x9a,0x11234d
  100a9c:	c6 05 4e 23 11 00 cf 	movb   $0xcf,0x11234e
  100aa3:	c6 05 4f 23 11 00 00 	movb   $0x0,0x11234f
  100aaa:	66 c7 05 50 23 11 00 	movw   $0xffff,0x112350
  100ab1:	ff ff 
  100ab3:	66 c7 05 52 23 11 00 	movw   $0x0,0x112352
  100aba:	00 00 
  100abc:	c6 05 54 23 11 00 00 	movb   $0x0,0x112354
  100ac3:	c6 05 55 23 11 00 92 	movb   $0x92,0x112355
  100aca:	c6 05 56 23 11 00 cf 	movb   $0xcf,0x112356
  100ad1:	c6 05 57 23 11 00 00 	movb   $0x0,0x112357
  100ad8:	66 c7 05 58 23 11 00 	movw   $0xffff,0x112358
  100adf:	ff ff 
  100ae1:	66 c7 05 5a 23 11 00 	movw   $0x0,0x11235a
  100ae8:	00 00 
  100aea:	c6 05 5c 23 11 00 00 	movb   $0x0,0x11235c
  100af1:	c6 05 5d 23 11 00 fa 	movb   $0xfa,0x11235d
  100af8:	c6 05 5e 23 11 00 cf 	movb   $0xcf,0x11235e
  100aff:	c6 05 5f 23 11 00 00 	movb   $0x0,0x11235f
  100b06:	66 c7 05 60 23 11 00 	movw   $0xffff,0x112360
  100b0d:	ff ff 
  100b0f:	66 c7 05 62 23 11 00 	movw   $0x0,0x112362
  100b16:	00 00 
  100b18:	c6 05 64 23 11 00 00 	movb   $0x0,0x112364
  100b1f:	c6 05 65 23 11 00 f2 	movb   $0xf2,0x112365
  100b26:	c6 05 66 23 11 00 cf 	movb   $0xcf,0x112366
  100b2d:	c6 05 67 23 11 00 00 	movb   $0x0,0x112367
  100b34:	66 c7 05 68 23 11 00 	movw   $0x63,0x112368
  100b3b:	63 00 
  100b3d:	b8 80 23 11 00       	mov    $0x112380,%eax
  100b42:	66 a3 6a 23 11 00    	mov    %ax,0x11236a
  100b48:	89 c2                	mov    %eax,%edx
  100b4a:	c1 ea 10             	shr    $0x10,%edx
  100b4d:	88 15 6c 23 11 00    	mov    %dl,0x11236c
  100b53:	c6 05 6d 23 11 00 89 	movb   $0x89,0x11236d
  100b5a:	c6 05 6e 23 11 00 40 	movb   $0x40,0x11236e
  100b61:	c1 e8 18             	shr    $0x18,%eax
  100b64:	a2 6f 23 11 00       	mov    %al,0x11236f
  100b69:	a1 08 11 10 00       	mov    0x101108,%eax
  100b6e:	8b 15 0c 11 10 00    	mov    0x10110c,%edx
  100b74:	a3 70 23 11 00       	mov    %eax,0x112370
  100b79:	89 15 74 23 11 00    	mov    %edx,0x112374
  100b7f:	66 c7 05 04 26 10 00 	movw   $0x37,0x102604
  100b86:	37 00 
  100b88:	66 89 0d 06 26 10 00 	mov    %cx,0x102606
  100b8f:	c1 e9 10             	shr    $0x10,%ecx
  100b92:	66 89 0d 08 26 10 00 	mov    %cx,0x102608
  100b99:	b8 04 26 10 00       	mov    $0x102604,%eax
  100b9e:	0f 01 10             	lgdtl  (%eax)
  100ba1:	c7 05 88 23 11 00 10 	movl   $0x10,0x112388
  100ba8:	00 00 00 
  100bab:	c7 05 84 23 11 00 00 	movl   $0x7f00000,0x112384
  100bb2:	00 f0 07 
  100bb5:	b8 28 00 00 00       	mov    $0x28,%eax
  100bba:	0f 00 d8             	ltr    %ax
  100bbd:	66 b8 10 00          	mov    $0x10,%ax
  100bc1:	8e d8                	mov    %eax,%ds
  100bc3:	8e c0                	mov    %eax,%es
  100bc5:	8e d0                	mov    %eax,%ss
  100bc7:	8e e0                	mov    %eax,%fs
  100bc9:	66 b8 30 00          	mov    $0x30,%ax
  100bcd:	8e e8                	mov    %eax,%gs
  100bcf:	31 c0                	xor    %eax,%eax
  100bd1:	0f 00 d0             	lldt   %ax
  100bd4:	5d                   	pop    %ebp
  100bd5:	c3                   	ret    
  100bd6:	66 90                	xchg   %ax,%ax

00100bd8 <enterUserSpace>:
  100bd8:	55                   	push   %ebp
  100bd9:	89 e5                	mov    %esp,%ebp
  100bdb:	b8 23 00 00 00       	mov    $0x23,%eax
  100be0:	8e d8                	mov    %eax,%ds
  100be2:	8e c0                	mov    %eax,%es
  100be4:	50                   	push   %eax
  100be5:	68 00 00 00 08       	push   $0x8000000
  100bea:	9c                   	pushf  
  100beb:	6a 1b                	push   $0x1b
  100bed:	ff 75 08             	pushl  0x8(%ebp)
  100bf0:	fb                   	sti    
  100bf1:	cf                   	iret   
  100bf2:	5d                   	pop    %ebp
  100bf3:	c3                   	ret    

00100bf4 <loadUMain>:
  100bf4:	55                   	push   %ebp
  100bf5:	89 e5                	mov    %esp,%ebp
  100bf7:	57                   	push   %edi
  100bf8:	56                   	push   %esi
  100bf9:	53                   	push   %ebx
  100bfa:	81 ec 00 90 01 00    	sub    $0x19000,%esp
  100c00:	be c9 00 00 00       	mov    $0xc9,%esi
  100c05:	8d 9d f4 6f fe ff    	lea    -0x1900c(%ebp),%ebx
  100c0b:	90                   	nop
  100c0c:	56                   	push   %esi
  100c0d:	53                   	push   %ebx
  100c0e:	e8 e9 fd ff ff       	call   1009fc <readSect>
  100c13:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100c19:	46                   	inc    %esi
  100c1a:	58                   	pop    %eax
  100c1b:	5a                   	pop    %edx
  100c1c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100c1f:	39 c3                	cmp    %eax,%ebx
  100c21:	75 e9                	jne    100c0c <loadUMain+0x18>
  100c23:	8d 95 f4 6f fe ff    	lea    -0x1900c(%ebp),%edx
  100c29:	03 95 10 70 fe ff    	add    -0x18ff0(%ebp),%edx
  100c2f:	0f b7 9d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ebx
  100c36:	c1 e3 05             	shl    $0x5,%ebx
  100c39:	01 d3                	add    %edx,%ebx
  100c3b:	31 c0                	xor    %eax,%eax
  100c3d:	39 da                	cmp    %ebx,%edx
  100c3f:	72 0a                	jb     100c4b <loadUMain+0x57>
  100c41:	eb 34                	jmp    100c77 <loadUMain+0x83>
  100c43:	90                   	nop
  100c44:	83 c2 20             	add    $0x20,%edx
  100c47:	39 d3                	cmp    %edx,%ebx
  100c49:	76 2c                	jbe    100c77 <loadUMain+0x83>
  100c4b:	83 3a 01             	cmpl   $0x1,(%edx)
  100c4e:	75 f4                	jne    100c44 <loadUMain+0x50>
  100c50:	8d b5 f4 6f fe ff    	lea    -0x1900c(%ebp),%esi
  100c56:	03 72 04             	add    0x4(%edx),%esi
  100c59:	8b 4a 10             	mov    0x10(%edx),%ecx
  100c5c:	8b 7a 08             	mov    0x8(%edx),%edi
  100c5f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100c61:	8b 72 10             	mov    0x10(%edx),%esi
  100c64:	8b 4a 14             	mov    0x14(%edx),%ecx
  100c67:	29 f1                	sub    %esi,%ecx
  100c69:	03 72 08             	add    0x8(%edx),%esi
  100c6c:	89 f7                	mov    %esi,%edi
  100c6e:	f3 aa                	rep stos %al,%es:(%edi)
  100c70:	83 c2 20             	add    $0x20,%edx
  100c73:	39 d3                	cmp    %edx,%ebx
  100c75:	77 d4                	ja     100c4b <loadUMain+0x57>
  100c77:	ff b5 0c 70 fe ff    	pushl  -0x18ff4(%ebp)
  100c7d:	e8 56 ff ff ff       	call   100bd8 <enterUserSpace>
  100c82:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100c85:	5b                   	pop    %ebx
  100c86:	5e                   	pop    %esi
  100c87:	5f                   	pop    %edi
  100c88:	5d                   	pop    %ebp
  100c89:	c3                   	ret    
  100c8a:	66 90                	xchg   %ax,%ax

00100c8c <initIdt>:
  100c8c:	55                   	push   %ebp
  100c8d:	89 e5                	mov    %esp,%ebp
  100c8f:	53                   	push   %ebx
  100c90:	ba 75 10 10 00       	mov    $0x101075,%edx
  100c95:	89 d3                	mov    %edx,%ebx
  100c97:	c1 ea 10             	shr    $0x10,%edx
  100c9a:	b9 00 2c 11 00       	mov    $0x112c00,%ecx
  100c9f:	b8 00 24 11 00       	mov    $0x112400,%eax
  100ca4:	66 89 18             	mov    %bx,(%eax)
  100ca7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100cad:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100cb1:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100cb5:	66 89 50 06          	mov    %dx,0x6(%eax)
  100cb9:	83 c0 08             	add    $0x8,%eax
  100cbc:	39 c1                	cmp    %eax,%ecx
  100cbe:	75 e4                	jne    100ca4 <initIdt+0x18>
  100cc0:	b8 7b 10 10 00       	mov    $0x10107b,%eax
  100cc5:	66 a3 00 24 11 00    	mov    %ax,0x112400
  100ccb:	66 c7 05 02 24 11 00 	movw   $0x8,0x112402
  100cd2:	08 00 
  100cd4:	c6 05 04 24 11 00 00 	movb   $0x0,0x112404
  100cdb:	c6 05 05 24 11 00 8f 	movb   $0x8f,0x112405
  100ce2:	c1 e8 10             	shr    $0x10,%eax
  100ce5:	66 a3 06 24 11 00    	mov    %ax,0x112406
  100ceb:	b8 81 10 10 00       	mov    $0x101081,%eax
  100cf0:	66 a3 08 24 11 00    	mov    %ax,0x112408
  100cf6:	66 c7 05 0a 24 11 00 	movw   $0x8,0x11240a
  100cfd:	08 00 
  100cff:	c6 05 0c 24 11 00 00 	movb   $0x0,0x11240c
  100d06:	c6 05 0d 24 11 00 8f 	movb   $0x8f,0x11240d
  100d0d:	c1 e8 10             	shr    $0x10,%eax
  100d10:	66 a3 0e 24 11 00    	mov    %ax,0x11240e
  100d16:	b8 87 10 10 00       	mov    $0x101087,%eax
  100d1b:	66 a3 10 24 11 00    	mov    %ax,0x112410
  100d21:	66 c7 05 12 24 11 00 	movw   $0x8,0x112412
  100d28:	08 00 
  100d2a:	c6 05 14 24 11 00 00 	movb   $0x0,0x112414
  100d31:	c6 05 15 24 11 00 8f 	movb   $0x8f,0x112415
  100d38:	c1 e8 10             	shr    $0x10,%eax
  100d3b:	66 a3 16 24 11 00    	mov    %ax,0x112416
  100d41:	b8 8d 10 10 00       	mov    $0x10108d,%eax
  100d46:	66 a3 18 24 11 00    	mov    %ax,0x112418
  100d4c:	66 c7 05 1a 24 11 00 	movw   $0x8,0x11241a
  100d53:	08 00 
  100d55:	c6 05 1c 24 11 00 00 	movb   $0x0,0x11241c
  100d5c:	c6 05 1d 24 11 00 8f 	movb   $0x8f,0x11241d
  100d63:	c1 e8 10             	shr    $0x10,%eax
  100d66:	66 a3 1e 24 11 00    	mov    %ax,0x11241e
  100d6c:	b8 93 10 10 00       	mov    $0x101093,%eax
  100d71:	66 a3 20 24 11 00    	mov    %ax,0x112420
  100d77:	66 c7 05 22 24 11 00 	movw   $0x8,0x112422
  100d7e:	08 00 
  100d80:	c6 05 24 24 11 00 00 	movb   $0x0,0x112424
  100d87:	c6 05 25 24 11 00 8f 	movb   $0x8f,0x112425
  100d8e:	c1 e8 10             	shr    $0x10,%eax
  100d91:	66 a3 26 24 11 00    	mov    %ax,0x112426
  100d97:	b8 99 10 10 00       	mov    $0x101099,%eax
  100d9c:	66 a3 28 24 11 00    	mov    %ax,0x112428
  100da2:	66 c7 05 2a 24 11 00 	movw   $0x8,0x11242a
  100da9:	08 00 
  100dab:	c6 05 2c 24 11 00 00 	movb   $0x0,0x11242c
  100db2:	c6 05 2d 24 11 00 8f 	movb   $0x8f,0x11242d
  100db9:	c1 e8 10             	shr    $0x10,%eax
  100dbc:	66 a3 2e 24 11 00    	mov    %ax,0x11242e
  100dc2:	b8 9f 10 10 00       	mov    $0x10109f,%eax
  100dc7:	66 a3 30 24 11 00    	mov    %ax,0x112430
  100dcd:	66 c7 05 32 24 11 00 	movw   $0x8,0x112432
  100dd4:	08 00 
  100dd6:	c6 05 34 24 11 00 00 	movb   $0x0,0x112434
  100ddd:	c6 05 35 24 11 00 8f 	movb   $0x8f,0x112435
  100de4:	c1 e8 10             	shr    $0x10,%eax
  100de7:	66 a3 36 24 11 00    	mov    %ax,0x112436
  100ded:	b8 a5 10 10 00       	mov    $0x1010a5,%eax
  100df2:	66 a3 38 24 11 00    	mov    %ax,0x112438
  100df8:	66 c7 05 3a 24 11 00 	movw   $0x8,0x11243a
  100dff:	08 00 
  100e01:	c6 05 3c 24 11 00 00 	movb   $0x0,0x11243c
  100e08:	c6 05 3d 24 11 00 8f 	movb   $0x8f,0x11243d
  100e0f:	c1 e8 10             	shr    $0x10,%eax
  100e12:	66 a3 3e 24 11 00    	mov    %ax,0x11243e
  100e18:	b8 ab 10 10 00       	mov    $0x1010ab,%eax
  100e1d:	66 a3 40 24 11 00    	mov    %ax,0x112440
  100e23:	66 c7 05 42 24 11 00 	movw   $0x8,0x112442
  100e2a:	08 00 
  100e2c:	c6 05 44 24 11 00 00 	movb   $0x0,0x112444
  100e33:	c6 05 45 24 11 00 8f 	movb   $0x8f,0x112445
  100e3a:	c1 e8 10             	shr    $0x10,%eax
  100e3d:	66 a3 46 24 11 00    	mov    %ax,0x112446
  100e43:	b8 af 10 10 00       	mov    $0x1010af,%eax
  100e48:	66 a3 48 24 11 00    	mov    %ax,0x112448
  100e4e:	66 c7 05 4a 24 11 00 	movw   $0x8,0x11244a
  100e55:	08 00 
  100e57:	c6 05 4c 24 11 00 00 	movb   $0x0,0x11244c
  100e5e:	c6 05 4d 24 11 00 8f 	movb   $0x8f,0x11244d
  100e65:	c1 e8 10             	shr    $0x10,%eax
  100e68:	66 a3 4e 24 11 00    	mov    %ax,0x11244e
  100e6e:	b8 b5 10 10 00       	mov    $0x1010b5,%eax
  100e73:	66 a3 50 24 11 00    	mov    %ax,0x112450
  100e79:	66 c7 05 52 24 11 00 	movw   $0x8,0x112452
  100e80:	08 00 
  100e82:	c6 05 54 24 11 00 00 	movb   $0x0,0x112454
  100e89:	c6 05 55 24 11 00 8f 	movb   $0x8f,0x112455
  100e90:	c1 e8 10             	shr    $0x10,%eax
  100e93:	66 a3 56 24 11 00    	mov    %ax,0x112456
  100e99:	b8 b9 10 10 00       	mov    $0x1010b9,%eax
  100e9e:	66 a3 58 24 11 00    	mov    %ax,0x112458
  100ea4:	66 c7 05 5a 24 11 00 	movw   $0x8,0x11245a
  100eab:	08 00 
  100ead:	c6 05 5c 24 11 00 00 	movb   $0x0,0x11245c
  100eb4:	c6 05 5d 24 11 00 8f 	movb   $0x8f,0x11245d
  100ebb:	c1 e8 10             	shr    $0x10,%eax
  100ebe:	66 a3 5e 24 11 00    	mov    %ax,0x11245e
  100ec4:	b8 bd 10 10 00       	mov    $0x1010bd,%eax
  100ec9:	66 a3 60 24 11 00    	mov    %ax,0x112460
  100ecf:	66 c7 05 62 24 11 00 	movw   $0x8,0x112462
  100ed6:	08 00 
  100ed8:	c6 05 64 24 11 00 00 	movb   $0x0,0x112464
  100edf:	c6 05 65 24 11 00 8f 	movb   $0x8f,0x112465
  100ee6:	c1 e8 10             	shr    $0x10,%eax
  100ee9:	66 a3 66 24 11 00    	mov    %ax,0x112466
  100eef:	b8 c1 10 10 00       	mov    $0x1010c1,%eax
  100ef4:	66 a3 70 24 11 00    	mov    %ax,0x112470
  100efa:	66 c7 05 72 24 11 00 	movw   $0x8,0x112472
  100f01:	08 00 
  100f03:	c6 05 74 24 11 00 00 	movb   $0x0,0x112474
  100f0a:	c6 05 75 24 11 00 8f 	movb   $0x8f,0x112475
  100f11:	c1 e8 10             	shr    $0x10,%eax
  100f14:	66 a3 76 24 11 00    	mov    %ax,0x112476
  100f1a:	b8 c5 10 10 00       	mov    $0x1010c5,%eax
  100f1f:	66 a3 68 24 11 00    	mov    %ax,0x112468
  100f25:	66 c7 05 6a 24 11 00 	movw   $0x8,0x11246a
  100f2c:	08 00 
  100f2e:	c6 05 6c 24 11 00 00 	movb   $0x0,0x11246c
  100f35:	c6 05 6d 24 11 00 8f 	movb   $0x8f,0x11246d
  100f3c:	c1 e8 10             	shr    $0x10,%eax
  100f3f:	66 a3 6e 24 11 00    	mov    %ax,0x11246e
  100f45:	b8 c9 10 10 00       	mov    $0x1010c9,%eax
  100f4a:	66 a3 00 25 11 00    	mov    %ax,0x112500
  100f50:	66 c7 05 02 25 11 00 	movw   $0x8,0x112502
  100f57:	08 00 
  100f59:	c6 05 04 25 11 00 00 	movb   $0x0,0x112504
  100f60:	c6 05 05 25 11 00 ee 	movb   $0xee,0x112505
  100f67:	c1 e8 10             	shr    $0x10,%eax
  100f6a:	66 a3 06 25 11 00    	mov    %ax,0x112506
  100f70:	b8 cf 10 10 00       	mov    $0x1010cf,%eax
  100f75:	66 a3 00 28 11 00    	mov    %ax,0x112800
  100f7b:	66 c7 05 02 28 11 00 	movw   $0x8,0x112802
  100f82:	08 00 
  100f84:	c6 05 04 28 11 00 00 	movb   $0x0,0x112804
  100f8b:	c6 05 05 28 11 00 ee 	movb   $0xee,0x112805
  100f92:	c1 e8 10             	shr    $0x10,%eax
  100f95:	66 a3 06 28 11 00    	mov    %ax,0x112806
  100f9b:	66 c7 05 0c 26 10 00 	movw   $0x7ff,0x10260c
  100fa2:	ff 07 
  100fa4:	b8 00 24 11 00       	mov    $0x112400,%eax
  100fa9:	66 a3 0e 26 10 00    	mov    %ax,0x10260e
  100faf:	c1 e8 10             	shr    $0x10,%eax
  100fb2:	66 a3 10 26 10 00    	mov    %ax,0x102610
  100fb8:	b8 0c 26 10 00       	mov    $0x10260c,%eax
  100fbd:	0f 01 18             	lidtl  (%eax)
  100fc0:	5b                   	pop    %ebx
  100fc1:	5d                   	pop    %ebp
  100fc2:	c3                   	ret    
  100fc3:	90                   	nop

00100fc4 <initSerial>:
  100fc4:	55                   	push   %ebp
  100fc5:	89 e5                	mov    %esp,%ebp
  100fc7:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100fcc:	31 c0                	xor    %eax,%eax
  100fce:	ee                   	out    %al,(%dx)
  100fcf:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100fd4:	b0 80                	mov    $0x80,%al
  100fd6:	ee                   	out    %al,(%dx)
  100fd7:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100fdc:	b0 01                	mov    $0x1,%al
  100fde:	ee                   	out    %al,(%dx)
  100fdf:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100fe4:	31 c0                	xor    %eax,%eax
  100fe6:	ee                   	out    %al,(%dx)
  100fe7:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100fec:	b0 03                	mov    $0x3,%al
  100fee:	ee                   	out    %al,(%dx)
  100fef:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100ff4:	b0 c7                	mov    $0xc7,%al
  100ff6:	ee                   	out    %al,(%dx)
  100ff7:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100ffc:	b0 0b                	mov    $0xb,%al
  100ffe:	ee                   	out    %al,(%dx)
  100fff:	5d                   	pop    %ebp
  101000:	c3                   	ret    
  101001:	8d 76 00             	lea    0x0(%esi),%esi

00101004 <putChar>:
  101004:	55                   	push   %ebp
  101005:	89 e5                	mov    %esp,%ebp
  101007:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10100a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10100f:	90                   	nop
  101010:	ec                   	in     (%dx),%al
  101011:	a8 20                	test   $0x20,%al
  101013:	74 fb                	je     101010 <putChar+0xc>
  101015:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10101a:	88 c8                	mov    %cl,%al
  10101c:	ee                   	out    %al,(%dx)
  10101d:	5d                   	pop    %ebp
  10101e:	c3                   	ret    
  10101f:	90                   	nop

00101020 <initIntr>:
  101020:	55                   	push   %ebp
  101021:	89 e5                	mov    %esp,%ebp
  101023:	ba 21 00 00 00       	mov    $0x21,%edx
  101028:	b0 ff                	mov    $0xff,%al
  10102a:	ee                   	out    %al,(%dx)
  10102b:	ba a1 00 00 00       	mov    $0xa1,%edx
  101030:	ee                   	out    %al,(%dx)
  101031:	ba 20 00 00 00       	mov    $0x20,%edx
  101036:	b0 11                	mov    $0x11,%al
  101038:	ee                   	out    %al,(%dx)
  101039:	ba 21 00 00 00       	mov    $0x21,%edx
  10103e:	b0 20                	mov    $0x20,%al
  101040:	ee                   	out    %al,(%dx)
  101041:	b0 04                	mov    $0x4,%al
  101043:	ee                   	out    %al,(%dx)
  101044:	b0 03                	mov    $0x3,%al
  101046:	ee                   	out    %al,(%dx)
  101047:	ba a0 00 00 00       	mov    $0xa0,%edx
  10104c:	b0 11                	mov    $0x11,%al
  10104e:	ee                   	out    %al,(%dx)
  10104f:	ba a1 00 00 00       	mov    $0xa1,%edx
  101054:	b0 28                	mov    $0x28,%al
  101056:	ee                   	out    %al,(%dx)
  101057:	b0 02                	mov    $0x2,%al
  101059:	ee                   	out    %al,(%dx)
  10105a:	b0 03                	mov    $0x3,%al
  10105c:	ee                   	out    %al,(%dx)
  10105d:	ba 20 00 00 00       	mov    $0x20,%edx
  101062:	b0 68                	mov    $0x68,%al
  101064:	ee                   	out    %al,(%dx)
  101065:	b0 0a                	mov    $0xa,%al
  101067:	ee                   	out    %al,(%dx)
  101068:	ba a0 00 00 00       	mov    $0xa0,%edx
  10106d:	b0 68                	mov    $0x68,%al
  10106f:	ee                   	out    %al,(%dx)
  101070:	b0 0a                	mov    $0xa,%al
  101072:	ee                   	out    %al,(%dx)
  101073:	5d                   	pop    %ebp
  101074:	c3                   	ret    

00101075 <irqEmpty>:
  101075:	6a 00                	push   $0x0
  101077:	6a ff                	push   $0xffffffff
  101079:	eb 5d                	jmp    1010d8 <asmDoIrq>

0010107b <irqDivError>:
  10107b:	6a 00                	push   $0x0
  10107d:	6a 00                	push   $0x0
  10107f:	eb 57                	jmp    1010d8 <asmDoIrq>

00101081 <irqStepOver>:
  101081:	6a 00                	push   $0x0
  101083:	6a 01                	push   $0x1
  101085:	eb 51                	jmp    1010d8 <asmDoIrq>

00101087 <irqNMIInterrupt>:
  101087:	6a 00                	push   $0x0
  101089:	6a 02                	push   $0x2
  10108b:	eb 4b                	jmp    1010d8 <asmDoIrq>

0010108d <irqBreakPoint>:
  10108d:	6a 00                	push   $0x0
  10108f:	6a 03                	push   $0x3
  101091:	eb 45                	jmp    1010d8 <asmDoIrq>

00101093 <irqOverflow>:
  101093:	6a 00                	push   $0x0
  101095:	6a 04                	push   $0x4
  101097:	eb 3f                	jmp    1010d8 <asmDoIrq>

00101099 <irqBoundTest>:
  101099:	6a 00                	push   $0x0
  10109b:	6a 05                	push   $0x5
  10109d:	eb 39                	jmp    1010d8 <asmDoIrq>

0010109f <irqInvalidOperation>:
  10109f:	6a 00                	push   $0x0
  1010a1:	6a 06                	push   $0x6
  1010a3:	eb 33                	jmp    1010d8 <asmDoIrq>

001010a5 <irqNoCoprocessor>:
  1010a5:	6a 00                	push   $0x0
  1010a7:	6a 07                	push   $0x7
  1010a9:	eb 2d                	jmp    1010d8 <asmDoIrq>

001010ab <irqDoubleFault>:
  1010ab:	6a 08                	push   $0x8
  1010ad:	eb 29                	jmp    1010d8 <asmDoIrq>

001010af <irqCoprocessorOutofBound>:
  1010af:	6a 00                	push   $0x0
  1010b1:	6a 09                	push   $0x9
  1010b3:	eb 23                	jmp    1010d8 <asmDoIrq>

001010b5 <irqInvalidTSS>:
  1010b5:	6a 0a                	push   $0xa
  1010b7:	eb 1f                	jmp    1010d8 <asmDoIrq>

001010b9 <irqNoSegment>:
  1010b9:	6a 0b                	push   $0xb
  1010bb:	eb 1b                	jmp    1010d8 <asmDoIrq>

001010bd <irqStackSegmentFault>:
  1010bd:	6a 0c                	push   $0xc
  1010bf:	eb 17                	jmp    1010d8 <asmDoIrq>

001010c1 <irqPageFault>:
  1010c1:	6a 0e                	push   $0xe
  1010c3:	eb 13                	jmp    1010d8 <asmDoIrq>

001010c5 <irqGProtectFault>:
  1010c5:	6a 0d                	push   $0xd
  1010c7:	eb 0f                	jmp    1010d8 <asmDoIrq>

001010c9 <irqTime>:
  1010c9:	6a 00                	push   $0x0
  1010cb:	6a 20                	push   $0x20
  1010cd:	eb 09                	jmp    1010d8 <asmDoIrq>

001010cf <irqSyscall>:
  1010cf:	6a 00                	push   $0x0
  1010d1:	68 80 00 00 00       	push   $0x80
  1010d6:	eb 00                	jmp    1010d8 <asmDoIrq>

001010d8 <asmDoIrq>:
  1010d8:	60                   	pusha  
  1010d9:	1e                   	push   %ds
  1010da:	06                   	push   %es
  1010db:	0f a0                	push   %fs
  1010dd:	0f a8                	push   %gs
  1010df:	54                   	push   %esp
  1010e0:	e8 e3 f0 ff ff       	call   1001c8 <irqHandle>
  1010e5:	83 c4 04             	add    $0x4,%esp
  1010e8:	83 c4 10             	add    $0x10,%esp
  1010eb:	61                   	popa   
  1010ec:	83 c4 04             	add    $0x4,%esp
  1010ef:	83 c4 04             	add    $0x4,%esp
  1010f2:	cf                   	iret   
