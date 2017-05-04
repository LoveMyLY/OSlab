
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 dd 0f 00 00       	call   100fe8 <initSerial>
  10000b:	e8 a0 0c 00 00       	call   100cb0 <initIdt>
  100010:	e8 2f 10 00 00       	call   101044 <initIntr>
  100015:	e8 aa 00 00 00       	call   1000c4 <initTimer>
  10001a:	e8 35 0a 00 00       	call   100a54 <initSeg>
  10001f:	fb                   	sti    
  100020:	e8 6b 04 00 00       	call   100490 <initPcb>
  100025:	e8 b2 0b 00 00       	call   100bdc <loadUMain>
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
  10003b:	b9 f2 24 10 00       	mov    $0x1024f2,%ecx
  100040:	84 c0                	test   %al,%al
  100042:	74 0b                	je     10004f <abort+0x23>
  100044:	41                   	inc    %ecx
  100045:	42                   	inc    %edx
  100046:	88 41 ff             	mov    %al,-0x1(%ecx)
  100049:	8a 02                	mov    (%edx),%al
  10004b:	84 c0                	test   %al,%al
  10004d:	75 f5                	jne    100044 <abort+0x18>
  10004f:	c6 01 3a             	movb   $0x3a,(%ecx)
  100052:	bb 1d 26 10 00       	mov    $0x10261d,%ebx
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
  10009a:	0f be 05 e0 24 10 00 	movsbl 0x1024e0,%eax
  1000a1:	84 c0                	test   %al,%al
  1000a3:	74 1b                	je     1000c0 <abort+0x94>
  1000a5:	bb e0 24 10 00       	mov    $0x1024e0,%ebx
  1000aa:	83 ec 0c             	sub    $0xc,%esp
  1000ad:	50                   	push   %eax
  1000ae:	e8 75 0f 00 00       	call   101028 <putChar>
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
  1000ef:	e8 34 0f 00 00       	call   101028 <putChar>
  1000f4:	83 c4 10             	add    $0x10,%esp
  1000f7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
  1000fb:	74 2c                	je     100129 <sys_write+0x4d>
  1000fd:	a1 e0 25 10 00       	mov    0x1025e0,%eax
  100102:	6b c0 50             	imul   $0x50,%eax,%eax
  100105:	03 05 20 26 10 00    	add    0x102620,%eax
  10010b:	6b c0 02             	imul   $0x2,%eax,%eax
  10010e:	89 c7                	mov    %eax,%edi
  100110:	8a 45 f4             	mov    -0xc(%ebp),%al
  100113:	b4 0c                	mov    $0xc,%ah
  100115:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100119:	a1 20 26 10 00       	mov    0x102620,%eax
  10011e:	40                   	inc    %eax
  10011f:	a3 20 26 10 00       	mov    %eax,0x102620
  100124:	83 f8 4f             	cmp    $0x4f,%eax
  100127:	7e 10                	jle    100139 <sys_write+0x5d>
  100129:	ff 05 e0 25 10 00    	incl   0x1025e0
  10012f:	c7 05 20 26 10 00 00 	movl   $0x0,0x102620
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
  10015d:	e9 42 07 00 00       	jmp    1008a4 <sys_exit>
  100162:	66 90                	xchg   %ax,%ax
  100164:	89 55 08             	mov    %edx,0x8(%ebp)
  100167:	c9                   	leave  
  100168:	e9 6f ff ff ff       	jmp    1000dc <sys_write>
  10016d:	8d 76 00             	lea    0x0(%esi),%esi
  100170:	83 f8 02             	cmp    $0x2,%eax
  100173:	75 0b                	jne    100180 <syscallHandle+0x44>
  100175:	89 55 08             	mov    %edx,0x8(%ebp)
  100178:	c9                   	leave  
  100179:	e9 16 04 00 00       	jmp    100594 <sys_fork>
  10017e:	66 90                	xchg   %ax,%ax
  100180:	83 ec 08             	sub    $0x8,%esp
  100183:	68 89 00 00 00       	push   $0x89
  100188:	68 18 11 10 00       	push   $0x101118
  10018d:	e8 9a fe ff ff       	call   10002c <abort>
  100192:	83 c4 10             	add    $0x10,%esp
  100195:	c9                   	leave  
  100196:	c3                   	ret    
  100197:	90                   	nop
  100198:	89 55 08             	mov    %edx,0x8(%ebp)
  10019b:	c9                   	leave  
  10019c:	e9 97 05 00 00       	jmp    100738 <sys_sleep>
  1001a1:	8d 76 00             	lea    0x0(%esi),%esi

001001a4 <irqHandle>:
  1001a4:	55                   	push   %ebp
  1001a5:	89 e5                	mov    %esp,%ebp
  1001a7:	53                   	push   %ebx
  1001a8:	50                   	push   %eax
  1001a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1001ac:	66 b8 10 00          	mov    $0x10,%ax
  1001b0:	8e d8                	mov    %eax,%ds
  1001b2:	8e c0                	mov    %eax,%es
  1001b4:	66 b8 30 00          	mov    $0x30,%ax
  1001b8:	8e e8                	mov    %eax,%gs
  1001ba:	8b 43 30             	mov    0x30(%ebx),%eax
  1001bd:	83 f8 0d             	cmp    $0xd,%eax
  1001c0:	74 4e                	je     100210 <irqHandle+0x6c>
  1001c2:	7e 24                	jle    1001e8 <irqHandle+0x44>
  1001c4:	83 f8 20             	cmp    $0x20,%eax
  1001c7:	74 13                	je     1001dc <irqHandle+0x38>
  1001c9:	83 c0 80             	add    $0xffffff80,%eax
  1001cc:	75 22                	jne    1001f0 <irqHandle+0x4c>
  1001ce:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1001d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001d4:	c9                   	leave  
  1001d5:	e9 62 ff ff ff       	jmp    10013c <syscallHandle>
  1001da:	66 90                	xchg   %ax,%ax
  1001dc:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1001df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001e2:	c9                   	leave  
  1001e3:	e9 e0 00 00 00       	jmp    1002c8 <Intrtime>
  1001e8:	40                   	inc    %eax
  1001e9:	75 05                	jne    1001f0 <irqHandle+0x4c>
  1001eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1001ee:	c9                   	leave  
  1001ef:	c3                   	ret    
  1001f0:	83 ec 08             	sub    $0x8,%esp
  1001f3:	6a 41                	push   $0x41
  1001f5:	68 18 11 10 00       	push   $0x101118
  1001fa:	e8 2d fe ff ff       	call   10002c <abort>
  1001ff:	8e 5b 0c             	mov    0xc(%ebx),%ds
  100202:	8e 43 08             	mov    0x8(%ebx),%es
  100205:	8e 2b                	mov    (%ebx),%gs
  100207:	83 c4 10             	add    $0x10,%esp
  10020a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10020d:	c9                   	leave  
  10020e:	c3                   	ret    
  10020f:	90                   	nop
  100210:	83 ec 08             	sub    $0x8,%esp
  100213:	68 8e 00 00 00       	push   $0x8e
  100218:	68 18 11 10 00       	push   $0x101118
  10021d:	e8 0a fe ff ff       	call   10002c <abort>
  100222:	83 c4 10             	add    $0x10,%esp
  100225:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100228:	c9                   	leave  
  100229:	c3                   	ret    
  10022a:	66 90                	xchg   %ax,%ax

0010022c <GProtectFaultHandle>:
  10022c:	55                   	push   %ebp
  10022d:	89 e5                	mov    %esp,%ebp
  10022f:	83 ec 10             	sub    $0x10,%esp
  100232:	68 8e 00 00 00       	push   $0x8e
  100237:	68 18 11 10 00       	push   $0x101118
  10023c:	e8 eb fd ff ff       	call   10002c <abort>
  100241:	83 c4 10             	add    $0x10,%esp
  100244:	c9                   	leave  
  100245:	c3                   	ret    
  100246:	66 90                	xchg   %ax,%ax

00100248 <IDLE>:
  100248:	55                   	push   %ebp
  100249:	89 e5                	mov    %esp,%ebp
  10024b:	90                   	nop
  10024c:	f4                   	hlt    
  10024d:	eb fd                	jmp    10024c <IDLE+0x4>
  10024f:	90                   	nop

00100250 <debug>:
  100250:	55                   	push   %ebp
  100251:	89 e5                	mov    %esp,%ebp
  100253:	53                   	push   %ebx
  100254:	83 ec 10             	sub    $0x10,%esp
  100257:	6a 0a                	push   $0xa
  100259:	e8 ca 0d 00 00       	call   101028 <putChar>
  10025e:	bb 8c 65 10 00       	mov    $0x10658c,%ebx
  100263:	83 c4 10             	add    $0x10,%esp
  100266:	eb 30                	jmp    100298 <debug+0x48>
  100268:	83 ec 0c             	sub    $0xc,%esp
  10026b:	8a 43 04             	mov    0x4(%ebx),%al
  10026e:	83 c0 30             	add    $0x30,%eax
  100271:	0f be c0             	movsbl %al,%eax
  100274:	50                   	push   %eax
  100275:	e8 ae 0d 00 00       	call   101028 <putChar>
  10027a:	83 c4 10             	add    $0x10,%esp
  10027d:	83 ec 0c             	sub    $0xc,%esp
  100280:	6a 20                	push   $0x20
  100282:	e8 a1 0d 00 00       	call   101028 <putChar>
  100287:	81 c3 a0 1f 00 00    	add    $0x1fa0,%ebx
  10028d:	83 c4 10             	add    $0x10,%esp
  100290:	81 fb ec 42 11 00    	cmp    $0x1142ec,%ebx
  100296:	74 28                	je     1002c0 <debug+0x70>
  100298:	83 7b 10 01          	cmpl   $0x1,0x10(%ebx)
  10029c:	75 22                	jne    1002c0 <debug+0x70>
  10029e:	83 ec 0c             	sub    $0xc,%esp
  1002a1:	8a 03                	mov    (%ebx),%al
  1002a3:	83 c0 30             	add    $0x30,%eax
  1002a6:	0f be c0             	movsbl %al,%eax
  1002a9:	50                   	push   %eax
  1002aa:	e8 79 0d 00 00       	call   101028 <putChar>
  1002af:	83 c4 10             	add    $0x10,%esp
  1002b2:	83 3b 03             	cmpl   $0x3,(%ebx)
  1002b5:	75 b1                	jne    100268 <debug+0x18>
  1002b7:	83 ec 0c             	sub    $0xc,%esp
  1002ba:	8a 43 08             	mov    0x8(%ebx),%al
  1002bd:	eb af                	jmp    10026e <debug+0x1e>
  1002bf:	90                   	nop
  1002c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002c3:	c9                   	leave  
  1002c4:	c3                   	ret    
  1002c5:	8d 76 00             	lea    0x0(%esi),%esi

001002c8 <Intrtime>:
  1002c8:	55                   	push   %ebp
  1002c9:	89 e5                	mov    %esp,%ebp
  1002cb:	57                   	push   %edi
  1002cc:	56                   	push   %esi
  1002cd:	53                   	push   %ebx
  1002ce:	8b 15 40 26 10 00    	mov    0x102640,%edx
  1002d4:	89 d0                	mov    %edx,%eax
  1002d6:	c1 e0 06             	shl    $0x6,%eax
  1002d9:	29 d0                	sub    %edx,%eax
  1002db:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  1002de:	c1 e3 05             	shl    $0x5,%ebx
  1002e1:	8d 83 a0 45 10 00    	lea    0x1045a0(%ebx),%eax
  1002e7:	b9 13 00 00 00       	mov    $0x13,%ecx
  1002ec:	89 c7                	mov    %eax,%edi
  1002ee:	8b 75 08             	mov    0x8(%ebp),%esi
  1002f1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1002f3:	c7 83 ec 45 10 00 02 	movl   $0x2,0x1045ec(%ebx)
  1002fa:	00 00 00 
  1002fd:	81 c3 60 26 10 00    	add    $0x102660,%ebx
  100303:	ff 8b 90 1f 00 00    	decl   0x1f90(%ebx)
  100309:	b9 8c 65 10 00       	mov    $0x10658c,%ecx
  10030e:	89 c8                	mov    %ecx,%eax
  100310:	eb 0e                	jmp    100320 <Intrtime+0x58>
  100312:	66 90                	xchg   %ax,%ax
  100314:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100319:	3d ec 42 11 00       	cmp    $0x1142ec,%eax
  10031e:	74 34                	je     100354 <Intrtime+0x8c>
  100320:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  100324:	75 ee                	jne    100314 <Intrtime+0x4c>
  100326:	83 38 03             	cmpl   $0x3,(%eax)
  100329:	75 e9                	jne    100314 <Intrtime+0x4c>
  10032b:	8b 78 08             	mov    0x8(%eax),%edi
  10032e:	8d 5f ff             	lea    -0x1(%edi),%ebx
  100331:	89 58 08             	mov    %ebx,0x8(%eax)
  100334:	85 db                	test   %ebx,%ebx
  100336:	7f dc                	jg     100314 <Intrtime+0x4c>
  100338:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  10033e:	c7 40 04 0a 00 00 00 	movl   $0xa,0x4(%eax)
  100345:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  10034a:	3d ec 42 11 00       	cmp    $0x1142ec,%eax
  10034f:	75 cf                	jne    100320 <Intrtime+0x58>
  100351:	8d 76 00             	lea    0x0(%esi),%esi
  100354:	89 d0                	mov    %edx,%eax
  100356:	c1 e0 06             	shl    $0x6,%eax
  100359:	29 d0                	sub    %edx,%eax
  10035b:	8d 04 82             	lea    (%edx,%eax,4),%eax
  10035e:	c1 e0 05             	shl    $0x5,%eax
  100361:	05 60 26 10 00       	add    $0x102660,%eax
  100366:	8b 98 90 1f 00 00    	mov    0x1f90(%eax),%ebx
  10036c:	85 db                	test   %ebx,%ebx
  10036e:	7e 5c                	jle    1003cc <Intrtime+0x104>
  100370:	85 d2                	test   %edx,%edx
  100372:	74 5c                	je     1003d0 <Intrtime+0x108>
  100374:	89 d0                	mov    %edx,%eax
  100376:	c1 e0 06             	shl    $0x6,%eax
  100379:	29 d0                	sub    %edx,%eax
  10037b:	8d 34 82             	lea    (%edx,%eax,4),%esi
  10037e:	c1 e6 05             	shl    $0x5,%esi
  100381:	c7 86 ec 45 10 00 01 	movl   $0x1,0x1045ec(%esi)
  100388:	00 00 00 
  10038b:	81 c6 a0 45 10 00    	add    $0x1045a0,%esi
  100391:	b9 13 00 00 00       	mov    $0x13,%ecx
  100396:	8b 7d 08             	mov    0x8(%ebp),%edi
  100399:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10039b:	83 fa 01             	cmp    $0x1,%edx
  10039e:	0f 84 dc 00 00 00    	je     100480 <Intrtime+0x1b8>
  1003a4:	83 fa 02             	cmp    $0x2,%edx
  1003a7:	74 17                	je     1003c0 <Intrtime+0xf8>
  1003a9:	66 c7 05 82 23 11 00 	movw   $0x0,0x112382
  1003b0:	00 00 
  1003b2:	c6 05 84 23 11 00 00 	movb   $0x0,0x112384
  1003b9:	5b                   	pop    %ebx
  1003ba:	5e                   	pop    %esi
  1003bb:	5f                   	pop    %edi
  1003bc:	5d                   	pop    %ebp
  1003bd:	c3                   	ret    
  1003be:	66 90                	xchg   %ax,%ax
  1003c0:	c6 05 87 23 11 00 01 	movb   $0x1,0x112387
  1003c7:	eb e0                	jmp    1003a9 <Intrtime+0xe1>
  1003c9:	8d 76 00             	lea    0x0(%esi),%esi
  1003cc:	85 d2                	test   %edx,%edx
  1003ce:	75 50                	jne    100420 <Intrtime+0x158>
  1003d0:	ba 01 00 00 00       	mov    $0x1,%edx
  1003d5:	eb 0d                	jmp    1003e4 <Intrtime+0x11c>
  1003d7:	90                   	nop
  1003d8:	42                   	inc    %edx
  1003d9:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  1003df:	83 fa 08             	cmp    $0x8,%edx
  1003e2:	74 38                	je     10041c <Intrtime+0x154>
  1003e4:	83 39 02             	cmpl   $0x2,(%ecx)
  1003e7:	75 ef                	jne    1003d8 <Intrtime+0x110>
  1003e9:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  1003ed:	75 e9                	jne    1003d8 <Intrtime+0x110>
  1003ef:	89 d0                	mov    %edx,%eax
  1003f1:	c1 e0 06             	shl    $0x6,%eax
  1003f4:	29 d0                	sub    %edx,%eax
  1003f6:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1003f9:	c1 e0 05             	shl    $0x5,%eax
  1003fc:	c7 80 ec 45 10 00 01 	movl   $0x1,0x1045ec(%eax)
  100403:	00 00 00 
  100406:	c7 80 f0 45 10 00 0a 	movl   $0xa,0x1045f0(%eax)
  10040d:	00 00 00 
  100410:	89 15 40 26 10 00    	mov    %edx,0x102640
  100416:	e9 59 ff ff ff       	jmp    100374 <Intrtime+0xac>
  10041b:	90                   	nop
  10041c:	31 d2                	xor    %edx,%edx
  10041e:	eb cf                	jmp    1003ef <Intrtime+0x127>
  100420:	c7 80 8c 1f 00 00 02 	movl   $0x2,0x1f8c(%eax)
  100427:	00 00 00 
  10042a:	b8 01 00 00 00       	mov    $0x1,%eax
  10042f:	eb 0f                	jmp    100440 <Intrtime+0x178>
  100431:	8d 76 00             	lea    0x0(%esi),%esi
  100434:	40                   	inc    %eax
  100435:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  10043b:	83 f8 08             	cmp    $0x8,%eax
  10043e:	74 4c                	je     10048c <Intrtime+0x1c4>
  100440:	83 39 02             	cmpl   $0x2,(%ecx)
  100443:	75 ef                	jne    100434 <Intrtime+0x16c>
  100445:	83 79 10 01          	cmpl   $0x1,0x10(%ecx)
  100449:	75 e9                	jne    100434 <Intrtime+0x16c>
  10044b:	39 c2                	cmp    %eax,%edx
  10044d:	74 e5                	je     100434 <Intrtime+0x16c>
  10044f:	90                   	nop
  100450:	89 c2                	mov    %eax,%edx
  100452:	c1 e2 06             	shl    $0x6,%edx
  100455:	29 c2                	sub    %eax,%edx
  100457:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10045a:	c1 e2 05             	shl    $0x5,%edx
  10045d:	c7 82 ec 45 10 00 01 	movl   $0x1,0x1045ec(%edx)
  100464:	00 00 00 
  100467:	c7 82 f0 45 10 00 0a 	movl   $0xa,0x1045f0(%edx)
  10046e:	00 00 00 
  100471:	a3 40 26 10 00       	mov    %eax,0x102640
  100476:	89 c2                	mov    %eax,%edx
  100478:	e9 f7 fe ff ff       	jmp    100374 <Intrtime+0xac>
  10047d:	8d 76 00             	lea    0x0(%esi),%esi
  100480:	c6 05 87 23 11 00 00 	movb   $0x0,0x112387
  100487:	e9 1d ff ff ff       	jmp    1003a9 <Intrtime+0xe1>
  10048c:	31 c0                	xor    %eax,%eax
  10048e:	eb c0                	jmp    100450 <Intrtime+0x188>

00100490 <initPcb>:
  100490:	55                   	push   %ebp
  100491:	89 e5                	mov    %esp,%ebp
  100493:	b8 fc 45 10 00       	mov    $0x1045fc,%eax
  100498:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  10049e:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1004a3:	3d fc 42 11 00       	cmp    $0x1142fc,%eax
  1004a8:	75 ee                	jne    100498 <initPcb+0x8>
  1004aa:	c7 05 fc 45 10 00 01 	movl   $0x1,0x1045fc
  1004b1:	00 00 00 
  1004b4:	c7 05 ec 45 10 00 02 	movl   $0x2,0x1045ec
  1004bb:	00 00 00 
  1004be:	c7 05 f8 45 10 00 00 	movl   $0x0,0x1045f8
  1004c5:	00 00 00 
  1004c8:	c7 05 f0 45 10 00 0a 	movl   $0xa,0x1045f0
  1004cf:	00 00 00 
  1004d2:	c7 05 f4 45 10 00 00 	movl   $0x0,0x1045f4
  1004d9:	00 00 00 
  1004dc:	c7 05 dc 45 10 00 08 	movl   $0x8,0x1045dc
  1004e3:	00 00 00 
  1004e6:	c7 05 d8 45 10 00 48 	movl   $0x100248,0x1045d8
  1004ed:	02 10 00 
  1004f0:	c7 05 e8 45 10 00 10 	movl   $0x10,0x1045e8
  1004f7:	00 00 00 
  1004fa:	c7 05 e0 45 10 00 02 	movl   $0x202,0x1045e0
  100501:	02 00 00 
  100504:	c7 05 e4 45 10 00 00 	movl   $0x7800000,0x1045e4
  10050b:	00 80 07 
  10050e:	c7 05 b8 45 10 00 00 	movl   $0x7800000,0x1045b8
  100515:	00 80 07 
  100518:	c7 05 9c 65 10 00 01 	movl   $0x1,0x10659c
  10051f:	00 00 00 
  100522:	c7 05 8c 65 10 00 01 	movl   $0x1,0x10658c
  100529:	00 00 00 
  10052c:	c7 05 98 65 10 00 01 	movl   $0x1,0x106598
  100533:	00 00 00 
  100536:	c7 05 90 65 10 00 0a 	movl   $0xa,0x106590
  10053d:	00 00 00 
  100540:	c7 05 94 65 10 00 00 	movl   $0x0,0x106594
  100547:	00 00 00 
  10054a:	c7 05 7c 65 10 00 1b 	movl   $0x1b,0x10657c
  100551:	00 00 00 
  100554:	c7 05 78 65 10 00 00 	movl   $0x200000,0x106578
  10055b:	00 20 00 
  10055e:	c7 05 88 65 10 00 23 	movl   $0x23,0x106588
  100565:	00 00 00 
  100568:	c7 05 80 65 10 00 02 	movl   $0x202,0x106580
  10056f:	02 00 00 
  100572:	c7 05 84 65 10 00 00 	movl   $0x6000000,0x106584
  100579:	00 00 06 
  10057c:	c7 05 58 65 10 00 00 	movl   $0x6000000,0x106558
  100583:	00 00 06 
  100586:	c7 05 40 26 10 00 01 	movl   $0x1,0x102640
  10058d:	00 00 00 
  100590:	5d                   	pop    %ebp
  100591:	c3                   	ret    
  100592:	66 90                	xchg   %ax,%ax

00100594 <sys_fork>:
  100594:	55                   	push   %ebp
  100595:	89 e5                	mov    %esp,%ebp
  100597:	57                   	push   %edi
  100598:	56                   	push   %esi
  100599:	53                   	push   %ebx
  10059a:	53                   	push   %ebx
  10059b:	a1 40 26 10 00       	mov    0x102640,%eax
  1005a0:	89 c2                	mov    %eax,%edx
  1005a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1005a5:	c1 e0 06             	shl    $0x6,%eax
  1005a8:	29 d0                	sub    %edx,%eax
  1005aa:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  1005ad:	c1 e3 05             	shl    $0x5,%ebx
  1005b0:	8d 83 a0 45 10 00    	lea    0x1045a0(%ebx),%eax
  1005b6:	b9 13 00 00 00       	mov    $0x13,%ecx
  1005bb:	89 c7                	mov    %eax,%edi
  1005bd:	8b 75 08             	mov    0x8(%ebp),%esi
  1005c0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1005c2:	c7 83 ec 45 10 00 02 	movl   $0x2,0x1045ec(%ebx)
  1005c9:	00 00 00 
  1005cc:	b8 9c 65 10 00       	mov    $0x10659c,%eax
  1005d1:	bb 01 00 00 00       	mov    $0x1,%ebx
  1005d6:	66 90                	xchg   %ax,%ax
  1005d8:	8b 08                	mov    (%eax),%ecx
  1005da:	85 c9                	test   %ecx,%ecx
  1005dc:	0f 84 2a 01 00 00    	je     10070c <sys_fork+0x178>
  1005e2:	43                   	inc    %ebx
  1005e3:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1005e8:	83 fb 08             	cmp    $0x8,%ebx
  1005eb:	75 eb                	jne    1005d8 <sys_fork+0x44>
  1005ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005f2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  1005f7:	89 d9                	mov    %ebx,%ecx
  1005f9:	c1 e1 06             	shl    $0x6,%ecx
  1005fc:	29 d9                	sub    %ebx,%ecx
  1005fe:	8d 34 8b             	lea    (%ebx,%ecx,4),%esi
  100601:	c1 e6 05             	shl    $0x5,%esi
  100604:	8d 96 60 26 10 00    	lea    0x102660(%esi),%edx
  10060a:	c7 86 ec 45 10 00 02 	movl   $0x2,0x1045ec(%esi)
  100611:	00 00 00 
  100614:	89 86 f8 45 10 00    	mov    %eax,0x1045f8(%esi)
  10061a:	c7 86 f0 45 10 00 0a 	movl   $0xa,0x1045f0(%esi)
  100621:	00 00 00 
  100624:	c7 86 f4 45 10 00 00 	movl   $0x0,0x1045f4(%esi)
  10062b:	00 00 00 
  10062e:	8d be a0 45 10 00    	lea    0x1045a0(%esi),%edi
  100634:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100637:	89 c8                	mov    %ecx,%eax
  100639:	c1 e0 06             	shl    $0x6,%eax
  10063c:	29 c8                	sub    %ecx,%eax
  10063e:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  100641:	c1 e0 05             	shl    $0x5,%eax
  100644:	8d b0 a0 45 10 00    	lea    0x1045a0(%eax),%esi
  10064a:	b9 13 00 00 00       	mov    $0x13,%ecx
  10064f:	89 7d f0             	mov    %edi,-0x10(%ebp)
  100652:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100654:	c7 82 6c 1f 00 00 00 	movl   $0x0,0x1f6c(%edx)
  10065b:	00 00 00 
  10065e:	8b b0 e4 45 10 00    	mov    0x1045e4(%eax),%esi
  100664:	89 b2 84 1f 00 00    	mov    %esi,0x1f84(%edx)
  10066a:	8b 88 b8 45 10 00    	mov    0x1045b8(%eax),%ecx
  100670:	89 8a 58 1f 00 00    	mov    %ecx,0x1f58(%edx)
  100676:	8d 8e 00 00 00 01    	lea    0x1000000(%esi),%ecx
  10067c:	89 cf                	mov    %ecx,%edi
  10067e:	b9 00 00 00 06       	mov    $0x6000000,%ecx
  100683:	29 f1                	sub    %esi,%ecx
  100685:	8b b0 e4 45 10 00    	mov    0x1045e4(%eax),%esi
  10068b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10068d:	b8 00 00 20 01       	mov    $0x1200000,%eax
  100692:	be 00 00 20 00       	mov    $0x200000,%esi
  100697:	b9 00 08 00 00       	mov    $0x800,%ecx
  10069c:	89 c7                	mov    %eax,%edi
  10069e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006a0:	a1 40 26 10 00       	mov    0x102640,%eax
  1006a5:	89 c1                	mov    %eax,%ecx
  1006a7:	c1 e1 06             	shl    $0x6,%ecx
  1006aa:	29 c1                	sub    %eax,%ecx
  1006ac:	8d 04 88             	lea    (%eax,%ecx,4),%eax
  1006af:	c1 e0 05             	shl    $0x5,%eax
  1006b2:	8b 8a 98 1f 00 00    	mov    0x1f98(%edx),%ecx
  1006b8:	89 88 cc 45 10 00    	mov    %ecx,0x1045cc(%eax)
  1006be:	89 1d 40 26 10 00    	mov    %ebx,0x102640
  1006c4:	c7 82 8c 1f 00 00 01 	movl   $0x1,0x1f8c(%edx)
  1006cb:	00 00 00 
  1006ce:	b9 13 00 00 00       	mov    $0x13,%ecx
  1006d3:	8b 7d 08             	mov    0x8(%ebp),%edi
  1006d6:	8b 75 f0             	mov    -0x10(%ebp),%esi
  1006d9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1006db:	83 fb 01             	cmp    $0x1,%ebx
  1006de:	74 4c                	je     10072c <sys_fork+0x198>
  1006e0:	83 fb 02             	cmp    $0x2,%ebx
  1006e3:	74 1b                	je     100700 <sys_fork+0x16c>
  1006e5:	66 c7 05 82 23 11 00 	movw   $0x0,0x112382
  1006ec:	00 00 
  1006ee:	c6 05 84 23 11 00 00 	movb   $0x0,0x112384
  1006f5:	89 d8                	mov    %ebx,%eax
  1006f7:	5a                   	pop    %edx
  1006f8:	5b                   	pop    %ebx
  1006f9:	5e                   	pop    %esi
  1006fa:	5f                   	pop    %edi
  1006fb:	5d                   	pop    %ebp
  1006fc:	c3                   	ret    
  1006fd:	8d 76 00             	lea    0x0(%esi),%esi
  100700:	c6 05 87 23 11 00 01 	movb   $0x1,0x112387
  100707:	eb dc                	jmp    1006e5 <sys_fork+0x151>
  100709:	8d 76 00             	lea    0x0(%esi),%esi
  10070c:	89 d8                	mov    %ebx,%eax
  10070e:	c1 e0 06             	shl    $0x6,%eax
  100711:	29 d8                	sub    %ebx,%eax
  100713:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  100716:	c1 e0 05             	shl    $0x5,%eax
  100719:	c7 80 fc 45 10 00 01 	movl   $0x1,0x1045fc(%eax)
  100720:	00 00 00 
  100723:	89 d8                	mov    %ebx,%eax
  100725:	e9 cd fe ff ff       	jmp    1005f7 <sys_fork+0x63>
  10072a:	66 90                	xchg   %ax,%ax
  10072c:	c6 05 87 23 11 00 00 	movb   $0x0,0x112387
  100733:	eb b0                	jmp    1006e5 <sys_fork+0x151>
  100735:	8d 76 00             	lea    0x0(%esi),%esi

00100738 <sys_sleep>:
  100738:	55                   	push   %ebp
  100739:	89 e5                	mov    %esp,%ebp
  10073b:	57                   	push   %edi
  10073c:	56                   	push   %esi
  10073d:	53                   	push   %ebx
  10073e:	8b 15 40 26 10 00    	mov    0x102640,%edx
  100744:	89 d0                	mov    %edx,%eax
  100746:	c1 e0 06             	shl    $0x6,%eax
  100749:	29 d0                	sub    %edx,%eax
  10074b:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
  10074e:	c1 e3 05             	shl    $0x5,%ebx
  100751:	8d 83 a0 45 10 00    	lea    0x1045a0(%ebx),%eax
  100757:	b9 13 00 00 00       	mov    $0x13,%ecx
  10075c:	89 c7                	mov    %eax,%edi
  10075e:	8b 75 08             	mov    0x8(%ebp),%esi
  100761:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100763:	c7 83 ec 45 10 00 02 	movl   $0x2,0x1045ec(%ebx)
  10076a:	00 00 00 
  10076d:	81 c3 60 26 10 00    	add    $0x102660,%ebx
  100773:	ff 8b 90 1f 00 00    	decl   0x1f90(%ebx)
  100779:	b8 8c 65 10 00       	mov    $0x10658c,%eax
  10077e:	eb 0c                	jmp    10078c <sys_sleep+0x54>
  100780:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  100785:	3d ec 42 11 00       	cmp    $0x1142ec,%eax
  10078a:	74 34                	je     1007c0 <sys_sleep+0x88>
  10078c:	83 78 10 01          	cmpl   $0x1,0x10(%eax)
  100790:	75 2e                	jne    1007c0 <sys_sleep+0x88>
  100792:	83 38 03             	cmpl   $0x3,(%eax)
  100795:	75 e9                	jne    100780 <sys_sleep+0x48>
  100797:	8b 78 08             	mov    0x8(%eax),%edi
  10079a:	8d 4f ff             	lea    -0x1(%edi),%ecx
  10079d:	89 48 08             	mov    %ecx,0x8(%eax)
  1007a0:	85 c9                	test   %ecx,%ecx
  1007a2:	7f dc                	jg     100780 <sys_sleep+0x48>
  1007a4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  1007aa:	c7 40 04 0a 00 00 00 	movl   $0xa,0x4(%eax)
  1007b1:	05 a0 1f 00 00       	add    $0x1fa0,%eax
  1007b6:	3d ec 42 11 00       	cmp    $0x1142ec,%eax
  1007bb:	75 cf                	jne    10078c <sys_sleep+0x54>
  1007bd:	8d 76 00             	lea    0x0(%esi),%esi
  1007c0:	89 d0                	mov    %edx,%eax
  1007c2:	c1 e0 06             	shl    $0x6,%eax
  1007c5:	29 d0                	sub    %edx,%eax
  1007c7:	8d 04 82             	lea    (%edx,%eax,4),%eax
  1007ca:	c1 e0 05             	shl    $0x5,%eax
  1007cd:	8b 75 08             	mov    0x8(%ebp),%esi
  1007d0:	8b 4e 20             	mov    0x20(%esi),%ecx
  1007d3:	89 88 f4 45 10 00    	mov    %ecx,0x1045f4(%eax)
  1007d9:	c7 80 ec 45 10 00 03 	movl   $0x3,0x1045ec(%eax)
  1007e0:	00 00 00 
  1007e3:	b9 9c 65 10 00       	mov    $0x10659c,%ecx
  1007e8:	b8 01 00 00 00       	mov    $0x1,%eax
  1007ed:	eb 0d                	jmp    1007fc <sys_sleep+0xc4>
  1007ef:	90                   	nop
  1007f0:	40                   	inc    %eax
  1007f1:	81 c1 a0 1f 00 00    	add    $0x1fa0,%ecx
  1007f7:	83 f8 08             	cmp    $0x8,%eax
  1007fa:	74 54                	je     100850 <sys_sleep+0x118>
  1007fc:	83 39 01             	cmpl   $0x1,(%ecx)
  1007ff:	75 ef                	jne    1007f0 <sys_sleep+0xb8>
  100801:	83 79 f0 02          	cmpl   $0x2,-0x10(%ecx)
  100805:	75 e9                	jne    1007f0 <sys_sleep+0xb8>
  100807:	39 c2                	cmp    %eax,%edx
  100809:	74 e5                	je     1007f0 <sys_sleep+0xb8>
  10080b:	89 c2                	mov    %eax,%edx
  10080d:	c1 e2 06             	shl    $0x6,%edx
  100810:	29 c2                	sub    %eax,%edx
  100812:	8d 34 90             	lea    (%eax,%edx,4),%esi
  100815:	c1 e6 05             	shl    $0x5,%esi
  100818:	c7 86 ec 45 10 00 01 	movl   $0x1,0x1045ec(%esi)
  10081f:	00 00 00 
  100822:	c7 86 f0 45 10 00 0a 	movl   $0xa,0x1045f0(%esi)
  100829:	00 00 00 
  10082c:	a3 40 26 10 00       	mov    %eax,0x102640
  100831:	81 c6 a0 45 10 00    	add    $0x1045a0,%esi
  100837:	b9 13 00 00 00       	mov    $0x13,%ecx
  10083c:	8b 7d 08             	mov    0x8(%ebp),%edi
  10083f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100841:	83 f8 01             	cmp    $0x1,%eax
  100844:	75 4e                	jne    100894 <sys_sleep+0x15c>
  100846:	c6 05 87 23 11 00 00 	movb   $0x0,0x112387
  10084d:	eb 2e                	jmp    10087d <sys_sleep+0x145>
  10084f:	90                   	nop
  100850:	c7 05 ec 45 10 00 01 	movl   $0x1,0x1045ec
  100857:	00 00 00 
  10085a:	c7 05 f0 45 10 00 0a 	movl   $0xa,0x1045f0
  100861:	00 00 00 
  100864:	c7 05 40 26 10 00 00 	movl   $0x0,0x102640
  10086b:	00 00 00 
  10086e:	be a0 45 10 00       	mov    $0x1045a0,%esi
  100873:	b9 13 00 00 00       	mov    $0x13,%ecx
  100878:	8b 7d 08             	mov    0x8(%ebp),%edi
  10087b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10087d:	66 c7 05 82 23 11 00 	movw   $0x0,0x112382
  100884:	00 00 
  100886:	c6 05 84 23 11 00 00 	movb   $0x0,0x112384
  10088d:	31 c0                	xor    %eax,%eax
  10088f:	5b                   	pop    %ebx
  100890:	5e                   	pop    %esi
  100891:	5f                   	pop    %edi
  100892:	5d                   	pop    %ebp
  100893:	c3                   	ret    
  100894:	83 f8 02             	cmp    $0x2,%eax
  100897:	75 e4                	jne    10087d <sys_sleep+0x145>
  100899:	c6 05 87 23 11 00 01 	movb   $0x1,0x112387
  1008a0:	eb db                	jmp    10087d <sys_sleep+0x145>
  1008a2:	66 90                	xchg   %ax,%ax

001008a4 <sys_exit>:
  1008a4:	55                   	push   %ebp
  1008a5:	89 e5                	mov    %esp,%ebp
  1008a7:	57                   	push   %edi
  1008a8:	56                   	push   %esi
  1008a9:	8b 0d 40 26 10 00    	mov    0x102640,%ecx
  1008af:	89 c8                	mov    %ecx,%eax
  1008b1:	c1 e0 06             	shl    $0x6,%eax
  1008b4:	29 c8                	sub    %ecx,%eax
  1008b6:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1008b9:	c1 e0 05             	shl    $0x5,%eax
  1008bc:	c7 80 fc 45 10 00 00 	movl   $0x0,0x1045fc(%eax)
  1008c3:	00 00 00 
  1008c6:	ba 9c 65 10 00       	mov    $0x10659c,%edx
  1008cb:	b8 01 00 00 00       	mov    $0x1,%eax
  1008d0:	eb 12                	jmp    1008e4 <sys_exit+0x40>
  1008d2:	66 90                	xchg   %ax,%ax
  1008d4:	40                   	inc    %eax
  1008d5:	81 c2 a0 1f 00 00    	add    $0x1fa0,%edx
  1008db:	83 f8 08             	cmp    $0x8,%eax
  1008de:	0f 84 c4 00 00 00    	je     1009a8 <sys_exit+0x104>
  1008e4:	83 3a 01             	cmpl   $0x1,(%edx)
  1008e7:	75 eb                	jne    1008d4 <sys_exit+0x30>
  1008e9:	83 7a f0 02          	cmpl   $0x2,-0x10(%edx)
  1008ed:	75 e5                	jne    1008d4 <sys_exit+0x30>
  1008ef:	39 c1                	cmp    %eax,%ecx
  1008f1:	74 e1                	je     1008d4 <sys_exit+0x30>
  1008f3:	90                   	nop
  1008f4:	89 c2                	mov    %eax,%edx
  1008f6:	c1 e2 06             	shl    $0x6,%edx
  1008f9:	29 c2                	sub    %eax,%edx
  1008fb:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1008fe:	c1 e2 05             	shl    $0x5,%edx
  100901:	c7 82 ec 45 10 00 01 	movl   $0x1,0x1045ec(%edx)
  100908:	00 00 00 
  10090b:	c7 82 f0 45 10 00 0a 	movl   $0xa,0x1045f0(%edx)
  100912:	00 00 00 
  100915:	a3 40 26 10 00       	mov    %eax,0x102640
  10091a:	ba 8c 65 10 00       	mov    $0x10658c,%edx
  10091f:	eb 11                	jmp    100932 <sys_exit+0x8e>
  100921:	8d 76 00             	lea    0x0(%esi),%esi
  100924:	81 c2 a0 1f 00 00    	add    $0x1fa0,%edx
  10092a:	81 fa ec 42 11 00    	cmp    $0x1142ec,%edx
  100930:	74 36                	je     100968 <sys_exit+0xc4>
  100932:	83 7a 10 01          	cmpl   $0x1,0x10(%edx)
  100936:	75 30                	jne    100968 <sys_exit+0xc4>
  100938:	83 3a 03             	cmpl   $0x3,(%edx)
  10093b:	75 e7                	jne    100924 <sys_exit+0x80>
  10093d:	8b 7a 08             	mov    0x8(%edx),%edi
  100940:	8d 4f ff             	lea    -0x1(%edi),%ecx
  100943:	89 4a 08             	mov    %ecx,0x8(%edx)
  100946:	85 c9                	test   %ecx,%ecx
  100948:	7f da                	jg     100924 <sys_exit+0x80>
  10094a:	c7 02 02 00 00 00    	movl   $0x2,(%edx)
  100950:	c7 42 04 0a 00 00 00 	movl   $0xa,0x4(%edx)
  100957:	81 c2 a0 1f 00 00    	add    $0x1fa0,%edx
  10095d:	81 fa ec 42 11 00    	cmp    $0x1142ec,%edx
  100963:	75 cd                	jne    100932 <sys_exit+0x8e>
  100965:	8d 76 00             	lea    0x0(%esi),%esi
  100968:	89 c2                	mov    %eax,%edx
  10096a:	c1 e2 06             	shl    $0x6,%edx
  10096d:	29 c2                	sub    %eax,%edx
  10096f:	8d 34 90             	lea    (%eax,%edx,4),%esi
  100972:	c1 e6 05             	shl    $0x5,%esi
  100975:	81 c6 a0 45 10 00    	add    $0x1045a0,%esi
  10097b:	b9 13 00 00 00       	mov    $0x13,%ecx
  100980:	8b 7d 08             	mov    0x8(%ebp),%edi
  100983:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100985:	83 f8 01             	cmp    $0x1,%eax
  100988:	74 32                	je     1009bc <sys_exit+0x118>
  10098a:	83 f8 02             	cmp    $0x2,%eax
  10098d:	74 21                	je     1009b0 <sys_exit+0x10c>
  10098f:	66 c7 05 82 23 11 00 	movw   $0x0,0x112382
  100996:	00 00 
  100998:	c6 05 84 23 11 00 00 	movb   $0x0,0x112384
  10099f:	31 c0                	xor    %eax,%eax
  1009a1:	5e                   	pop    %esi
  1009a2:	5f                   	pop    %edi
  1009a3:	5d                   	pop    %ebp
  1009a4:	c3                   	ret    
  1009a5:	8d 76 00             	lea    0x0(%esi),%esi
  1009a8:	31 c0                	xor    %eax,%eax
  1009aa:	e9 45 ff ff ff       	jmp    1008f4 <sys_exit+0x50>
  1009af:	90                   	nop
  1009b0:	c6 05 87 23 11 00 01 	movb   $0x1,0x112387
  1009b7:	eb d6                	jmp    10098f <sys_exit+0xeb>
  1009b9:	8d 76 00             	lea    0x0(%esi),%esi
  1009bc:	c6 05 87 23 11 00 00 	movb   $0x0,0x112387
  1009c3:	eb ca                	jmp    10098f <sys_exit+0xeb>
  1009c5:	66 90                	xchg   %ax,%ax
  1009c7:	90                   	nop

001009c8 <waitDisk>:
  1009c8:	55                   	push   %ebp
  1009c9:	89 e5                	mov    %esp,%ebp
  1009cb:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1009d0:	ec                   	in     (%dx),%al
  1009d1:	83 e0 c0             	and    $0xffffffc0,%eax
  1009d4:	3c 40                	cmp    $0x40,%al
  1009d6:	75 f8                	jne    1009d0 <waitDisk+0x8>
  1009d8:	5d                   	pop    %ebp
  1009d9:	c3                   	ret    
  1009da:	66 90                	xchg   %ax,%ax

001009dc <readSect>:
  1009dc:	55                   	push   %ebp
  1009dd:	89 e5                	mov    %esp,%ebp
  1009df:	53                   	push   %ebx
  1009e0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1009e3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1009e8:	ec                   	in     (%dx),%al
  1009e9:	83 e0 c0             	and    $0xffffffc0,%eax
  1009ec:	3c 40                	cmp    $0x40,%al
  1009ee:	75 f8                	jne    1009e8 <readSect+0xc>
  1009f0:	ba f2 01 00 00       	mov    $0x1f2,%edx
  1009f5:	b0 01                	mov    $0x1,%al
  1009f7:	ee                   	out    %al,(%dx)
  1009f8:	ba f3 01 00 00       	mov    $0x1f3,%edx
  1009fd:	88 c8                	mov    %cl,%al
  1009ff:	ee                   	out    %al,(%dx)
  100a00:	89 c8                	mov    %ecx,%eax
  100a02:	c1 f8 08             	sar    $0x8,%eax
  100a05:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100a0a:	ee                   	out    %al,(%dx)
  100a0b:	89 c8                	mov    %ecx,%eax
  100a0d:	c1 f8 10             	sar    $0x10,%eax
  100a10:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100a15:	ee                   	out    %al,(%dx)
  100a16:	89 c8                	mov    %ecx,%eax
  100a18:	c1 f8 18             	sar    $0x18,%eax
  100a1b:	83 c8 e0             	or     $0xffffffe0,%eax
  100a1e:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100a23:	ee                   	out    %al,(%dx)
  100a24:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100a29:	b0 20                	mov    $0x20,%al
  100a2b:	ee                   	out    %al,(%dx)
  100a2c:	ec                   	in     (%dx),%al
  100a2d:	83 e0 c0             	and    $0xffffffc0,%eax
  100a30:	3c 40                	cmp    $0x40,%al
  100a32:	75 f8                	jne    100a2c <readSect+0x50>
  100a34:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100a37:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100a3d:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100a42:	66 90                	xchg   %ax,%ax
  100a44:	ed                   	in     (%dx),%eax
  100a45:	89 01                	mov    %eax,(%ecx)
  100a47:	83 c1 04             	add    $0x4,%ecx
  100a4a:	39 d9                	cmp    %ebx,%ecx
  100a4c:	75 f6                	jne    100a44 <readSect+0x68>
  100a4e:	5b                   	pop    %ebx
  100a4f:	5d                   	pop    %ebp
  100a50:	c3                   	ret    
  100a51:	8d 76 00             	lea    0x0(%esi),%esi

00100a54 <initSeg>:
  100a54:	55                   	push   %ebp
  100a55:	89 e5                	mov    %esp,%ebp
  100a57:	b9 60 23 11 00       	mov    $0x112360,%ecx
  100a5c:	66 c7 05 68 23 11 00 	movw   $0xffff,0x112368
  100a63:	ff ff 
  100a65:	66 c7 05 6a 23 11 00 	movw   $0x0,0x11236a
  100a6c:	00 00 
  100a6e:	c6 05 6c 23 11 00 00 	movb   $0x0,0x11236c
  100a75:	c6 05 6d 23 11 00 9a 	movb   $0x9a,0x11236d
  100a7c:	c6 05 6e 23 11 00 cf 	movb   $0xcf,0x11236e
  100a83:	c6 05 6f 23 11 00 00 	movb   $0x0,0x11236f
  100a8a:	66 c7 05 70 23 11 00 	movw   $0xffff,0x112370
  100a91:	ff ff 
  100a93:	66 c7 05 72 23 11 00 	movw   $0x0,0x112372
  100a9a:	00 00 
  100a9c:	c6 05 74 23 11 00 00 	movb   $0x0,0x112374
  100aa3:	c6 05 75 23 11 00 92 	movb   $0x92,0x112375
  100aaa:	c6 05 76 23 11 00 cf 	movb   $0xcf,0x112376
  100ab1:	c6 05 77 23 11 00 00 	movb   $0x0,0x112377
  100ab8:	66 c7 05 78 23 11 00 	movw   $0xffff,0x112378
  100abf:	ff ff 
  100ac1:	66 c7 05 7a 23 11 00 	movw   $0x0,0x11237a
  100ac8:	00 00 
  100aca:	c6 05 7c 23 11 00 00 	movb   $0x0,0x11237c
  100ad1:	c6 05 7d 23 11 00 fa 	movb   $0xfa,0x11237d
  100ad8:	c6 05 7e 23 11 00 cf 	movb   $0xcf,0x11237e
  100adf:	c6 05 7f 23 11 00 00 	movb   $0x0,0x11237f
  100ae6:	66 c7 05 80 23 11 00 	movw   $0xffff,0x112380
  100aed:	ff ff 
  100aef:	66 c7 05 82 23 11 00 	movw   $0x0,0x112382
  100af6:	00 00 
  100af8:	c6 05 84 23 11 00 00 	movb   $0x0,0x112384
  100aff:	c6 05 85 23 11 00 f2 	movb   $0xf2,0x112385
  100b06:	c6 05 86 23 11 00 cf 	movb   $0xcf,0x112386
  100b0d:	c6 05 87 23 11 00 00 	movb   $0x0,0x112387
  100b14:	66 c7 05 88 23 11 00 	movw   $0x63,0x112388
  100b1b:	63 00 
  100b1d:	b8 a0 23 11 00       	mov    $0x1123a0,%eax
  100b22:	66 a3 8a 23 11 00    	mov    %ax,0x11238a
  100b28:	89 c2                	mov    %eax,%edx
  100b2a:	c1 ea 10             	shr    $0x10,%edx
  100b2d:	88 15 8c 23 11 00    	mov    %dl,0x11238c
  100b33:	c6 05 8d 23 11 00 89 	movb   $0x89,0x11238d
  100b3a:	c6 05 8e 23 11 00 40 	movb   $0x40,0x11238e
  100b41:	c1 e8 18             	shr    $0x18,%eax
  100b44:	a2 8f 23 11 00       	mov    %al,0x11238f
  100b49:	a1 2c 11 10 00       	mov    0x10112c,%eax
  100b4e:	8b 15 30 11 10 00    	mov    0x101130,%edx
  100b54:	a3 90 23 11 00       	mov    %eax,0x112390
  100b59:	89 15 94 23 11 00    	mov    %edx,0x112394
  100b5f:	66 c7 05 24 26 10 00 	movw   $0x37,0x102624
  100b66:	37 00 
  100b68:	66 89 0d 26 26 10 00 	mov    %cx,0x102626
  100b6f:	c1 e9 10             	shr    $0x10,%ecx
  100b72:	66 89 0d 28 26 10 00 	mov    %cx,0x102628
  100b79:	b8 24 26 10 00       	mov    $0x102624,%eax
  100b7e:	0f 01 10             	lgdtl  (%eax)
  100b81:	c7 05 a8 23 11 00 10 	movl   $0x10,0x1123a8
  100b88:	00 00 00 
  100b8b:	c7 05 a4 23 11 00 00 	movl   $0x8000000,0x1123a4
  100b92:	00 00 08 
  100b95:	b8 28 00 00 00       	mov    $0x28,%eax
  100b9a:	0f 00 d8             	ltr    %ax
  100b9d:	66 b8 10 00          	mov    $0x10,%ax
  100ba1:	8e d8                	mov    %eax,%ds
  100ba3:	8e c0                	mov    %eax,%es
  100ba5:	8e d0                	mov    %eax,%ss
  100ba7:	8e e0                	mov    %eax,%fs
  100ba9:	66 b8 30 00          	mov    $0x30,%ax
  100bad:	8e e8                	mov    %eax,%gs
  100baf:	31 c0                	xor    %eax,%eax
  100bb1:	0f 00 d0             	lldt   %ax
  100bb4:	5d                   	pop    %ebp
  100bb5:	c3                   	ret    
  100bb6:	66 90                	xchg   %ax,%ax

00100bb8 <enterUserSpace>:
  100bb8:	55                   	push   %ebp
  100bb9:	89 e5                	mov    %esp,%ebp
  100bbb:	83 ec 10             	sub    $0x10,%esp
  100bbe:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
  100bc5:	66 6a 23             	pushw  $0x23
  100bc8:	68 00 00 00 06       	push   $0x6000000
  100bcd:	ff 75 fc             	pushl  -0x4(%ebp)
  100bd0:	6a 1b                	push   $0x1b
  100bd2:	ff 75 08             	pushl  0x8(%ebp)
  100bd5:	fb                   	sti    
  100bd6:	cf                   	iret   
  100bd7:	c9                   	leave  
  100bd8:	c3                   	ret    
  100bd9:	8d 76 00             	lea    0x0(%esi),%esi

00100bdc <loadUMain>:
  100bdc:	55                   	push   %ebp
  100bdd:	89 e5                	mov    %esp,%ebp
  100bdf:	57                   	push   %edi
  100be0:	56                   	push   %esi
  100be1:	53                   	push   %ebx
  100be2:	81 ec 04 90 01 00    	sub    $0x19004,%esp
  100be8:	be c9 00 00 00       	mov    $0xc9,%esi
  100bed:	8d 9d f4 6f fe ff    	lea    -0x1900c(%ebp),%ebx
  100bf3:	8d bd f4 87 fe ff    	lea    -0x1780c(%ebp),%edi
  100bf9:	8d 76 00             	lea    0x0(%esi),%esi
  100bfc:	56                   	push   %esi
  100bfd:	53                   	push   %ebx
  100bfe:	e8 d9 fd ff ff       	call   1009dc <readSect>
  100c03:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100c09:	46                   	inc    %esi
  100c0a:	5a                   	pop    %edx
  100c0b:	59                   	pop    %ecx
  100c0c:	39 fb                	cmp    %edi,%ebx
  100c0e:	75 ec                	jne    100bfc <loadUMain+0x20>
  100c10:	8d 95 f4 6f fe ff    	lea    -0x1900c(%ebp),%edx
  100c16:	03 95 10 70 fe ff    	add    -0x18ff0(%ebp),%edx
  100c1c:	0f b7 85 20 70 fe ff 	movzwl -0x18fe0(%ebp),%eax
  100c23:	89 c1                	mov    %eax,%ecx
  100c25:	c1 e0 05             	shl    $0x5,%eax
  100c28:	01 d0                	add    %edx,%eax
  100c2a:	89 85 f0 6f fe ff    	mov    %eax,-0x19010(%ebp)
  100c30:	39 c2                	cmp    %eax,%edx
  100c32:	73 67                	jae    100c9b <loadUMain+0xbf>
  100c34:	31 c0                	xor    %eax,%eax
  100c36:	66 90                	xchg   %ax,%ax
  100c38:	31 db                	xor    %ebx,%ebx
  100c3a:	66 85 c9             	test   %cx,%cx
  100c3d:	75 14                	jne    100c53 <loadUMain+0x77>
  100c3f:	eb 47                	jmp    100c88 <loadUMain+0xac>
  100c41:	8d 76 00             	lea    0x0(%esi),%esi
  100c44:	43                   	inc    %ebx
  100c45:	83 c2 20             	add    $0x20,%edx
  100c48:	0f b7 8d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ecx
  100c4f:	39 d9                	cmp    %ebx,%ecx
  100c51:	7e 35                	jle    100c88 <loadUMain+0xac>
  100c53:	83 3a 01             	cmpl   $0x1,(%edx)
  100c56:	75 ec                	jne    100c44 <loadUMain+0x68>
  100c58:	8d b5 f4 6f fe ff    	lea    -0x1900c(%ebp),%esi
  100c5e:	03 72 04             	add    0x4(%edx),%esi
  100c61:	8b 4a 14             	mov    0x14(%edx),%ecx
  100c64:	8b 7a 08             	mov    0x8(%edx),%edi
  100c67:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100c69:	8b 72 10             	mov    0x10(%edx),%esi
  100c6c:	8b 4a 14             	mov    0x14(%edx),%ecx
  100c6f:	29 f1                	sub    %esi,%ecx
  100c71:	03 72 08             	add    0x8(%edx),%esi
  100c74:	89 f7                	mov    %esi,%edi
  100c76:	f3 aa                	rep stos %al,%es:(%edi)
  100c78:	43                   	inc    %ebx
  100c79:	83 c2 20             	add    $0x20,%edx
  100c7c:	0f b7 8d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ecx
  100c83:	39 d9                	cmp    %ebx,%ecx
  100c85:	7f cc                	jg     100c53 <loadUMain+0x77>
  100c87:	90                   	nop
  100c88:	83 c2 20             	add    $0x20,%edx
  100c8b:	39 95 f0 6f fe ff    	cmp    %edx,-0x19010(%ebp)
  100c91:	76 08                	jbe    100c9b <loadUMain+0xbf>
  100c93:	8b 8d 20 70 fe ff    	mov    -0x18fe0(%ebp),%ecx
  100c99:	eb 9d                	jmp    100c38 <loadUMain+0x5c>
  100c9b:	ff b5 0c 70 fe ff    	pushl  -0x18ff4(%ebp)
  100ca1:	e8 12 ff ff ff       	call   100bb8 <enterUserSpace>
  100ca6:	58                   	pop    %eax
  100ca7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100caa:	5b                   	pop    %ebx
  100cab:	5e                   	pop    %esi
  100cac:	5f                   	pop    %edi
  100cad:	5d                   	pop    %ebp
  100cae:	c3                   	ret    
  100caf:	90                   	nop

00100cb0 <initIdt>:
  100cb0:	55                   	push   %ebp
  100cb1:	89 e5                	mov    %esp,%ebp
  100cb3:	53                   	push   %ebx
  100cb4:	ba 99 10 10 00       	mov    $0x101099,%edx
  100cb9:	89 d3                	mov    %edx,%ebx
  100cbb:	c1 ea 10             	shr    $0x10,%edx
  100cbe:	b9 20 2c 11 00       	mov    $0x112c20,%ecx
  100cc3:	b8 20 24 11 00       	mov    $0x112420,%eax
  100cc8:	66 89 18             	mov    %bx,(%eax)
  100ccb:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100cd1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100cd5:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100cd9:	66 89 50 06          	mov    %dx,0x6(%eax)
  100cdd:	83 c0 08             	add    $0x8,%eax
  100ce0:	39 c1                	cmp    %eax,%ecx
  100ce2:	75 e4                	jne    100cc8 <initIdt+0x18>
  100ce4:	b8 9f 10 10 00       	mov    $0x10109f,%eax
  100ce9:	66 a3 20 24 11 00    	mov    %ax,0x112420
  100cef:	66 c7 05 22 24 11 00 	movw   $0x8,0x112422
  100cf6:	08 00 
  100cf8:	c6 05 24 24 11 00 00 	movb   $0x0,0x112424
  100cff:	c6 05 25 24 11 00 8f 	movb   $0x8f,0x112425
  100d06:	c1 e8 10             	shr    $0x10,%eax
  100d09:	66 a3 26 24 11 00    	mov    %ax,0x112426
  100d0f:	b8 a5 10 10 00       	mov    $0x1010a5,%eax
  100d14:	66 a3 28 24 11 00    	mov    %ax,0x112428
  100d1a:	66 c7 05 2a 24 11 00 	movw   $0x8,0x11242a
  100d21:	08 00 
  100d23:	c6 05 2c 24 11 00 00 	movb   $0x0,0x11242c
  100d2a:	c6 05 2d 24 11 00 8f 	movb   $0x8f,0x11242d
  100d31:	c1 e8 10             	shr    $0x10,%eax
  100d34:	66 a3 2e 24 11 00    	mov    %ax,0x11242e
  100d3a:	b8 ab 10 10 00       	mov    $0x1010ab,%eax
  100d3f:	66 a3 30 24 11 00    	mov    %ax,0x112430
  100d45:	66 c7 05 32 24 11 00 	movw   $0x8,0x112432
  100d4c:	08 00 
  100d4e:	c6 05 34 24 11 00 00 	movb   $0x0,0x112434
  100d55:	c6 05 35 24 11 00 8f 	movb   $0x8f,0x112435
  100d5c:	c1 e8 10             	shr    $0x10,%eax
  100d5f:	66 a3 36 24 11 00    	mov    %ax,0x112436
  100d65:	b8 b1 10 10 00       	mov    $0x1010b1,%eax
  100d6a:	66 a3 38 24 11 00    	mov    %ax,0x112438
  100d70:	66 c7 05 3a 24 11 00 	movw   $0x8,0x11243a
  100d77:	08 00 
  100d79:	c6 05 3c 24 11 00 00 	movb   $0x0,0x11243c
  100d80:	c6 05 3d 24 11 00 8f 	movb   $0x8f,0x11243d
  100d87:	c1 e8 10             	shr    $0x10,%eax
  100d8a:	66 a3 3e 24 11 00    	mov    %ax,0x11243e
  100d90:	b8 b7 10 10 00       	mov    $0x1010b7,%eax
  100d95:	66 a3 40 24 11 00    	mov    %ax,0x112440
  100d9b:	66 c7 05 42 24 11 00 	movw   $0x8,0x112442
  100da2:	08 00 
  100da4:	c6 05 44 24 11 00 00 	movb   $0x0,0x112444
  100dab:	c6 05 45 24 11 00 8f 	movb   $0x8f,0x112445
  100db2:	c1 e8 10             	shr    $0x10,%eax
  100db5:	66 a3 46 24 11 00    	mov    %ax,0x112446
  100dbb:	b8 bd 10 10 00       	mov    $0x1010bd,%eax
  100dc0:	66 a3 48 24 11 00    	mov    %ax,0x112448
  100dc6:	66 c7 05 4a 24 11 00 	movw   $0x8,0x11244a
  100dcd:	08 00 
  100dcf:	c6 05 4c 24 11 00 00 	movb   $0x0,0x11244c
  100dd6:	c6 05 4d 24 11 00 8f 	movb   $0x8f,0x11244d
  100ddd:	c1 e8 10             	shr    $0x10,%eax
  100de0:	66 a3 4e 24 11 00    	mov    %ax,0x11244e
  100de6:	b8 c3 10 10 00       	mov    $0x1010c3,%eax
  100deb:	66 a3 50 24 11 00    	mov    %ax,0x112450
  100df1:	66 c7 05 52 24 11 00 	movw   $0x8,0x112452
  100df8:	08 00 
  100dfa:	c6 05 54 24 11 00 00 	movb   $0x0,0x112454
  100e01:	c6 05 55 24 11 00 8f 	movb   $0x8f,0x112455
  100e08:	c1 e8 10             	shr    $0x10,%eax
  100e0b:	66 a3 56 24 11 00    	mov    %ax,0x112456
  100e11:	b8 c9 10 10 00       	mov    $0x1010c9,%eax
  100e16:	66 a3 58 24 11 00    	mov    %ax,0x112458
  100e1c:	66 c7 05 5a 24 11 00 	movw   $0x8,0x11245a
  100e23:	08 00 
  100e25:	c6 05 5c 24 11 00 00 	movb   $0x0,0x11245c
  100e2c:	c6 05 5d 24 11 00 8f 	movb   $0x8f,0x11245d
  100e33:	c1 e8 10             	shr    $0x10,%eax
  100e36:	66 a3 5e 24 11 00    	mov    %ax,0x11245e
  100e3c:	b8 cf 10 10 00       	mov    $0x1010cf,%eax
  100e41:	66 a3 60 24 11 00    	mov    %ax,0x112460
  100e47:	66 c7 05 62 24 11 00 	movw   $0x8,0x112462
  100e4e:	08 00 
  100e50:	c6 05 64 24 11 00 00 	movb   $0x0,0x112464
  100e57:	c6 05 65 24 11 00 8f 	movb   $0x8f,0x112465
  100e5e:	c1 e8 10             	shr    $0x10,%eax
  100e61:	66 a3 66 24 11 00    	mov    %ax,0x112466
  100e67:	b8 d3 10 10 00       	mov    $0x1010d3,%eax
  100e6c:	66 a3 68 24 11 00    	mov    %ax,0x112468
  100e72:	66 c7 05 6a 24 11 00 	movw   $0x8,0x11246a
  100e79:	08 00 
  100e7b:	c6 05 6c 24 11 00 00 	movb   $0x0,0x11246c
  100e82:	c6 05 6d 24 11 00 8f 	movb   $0x8f,0x11246d
  100e89:	c1 e8 10             	shr    $0x10,%eax
  100e8c:	66 a3 6e 24 11 00    	mov    %ax,0x11246e
  100e92:	b8 d9 10 10 00       	mov    $0x1010d9,%eax
  100e97:	66 a3 70 24 11 00    	mov    %ax,0x112470
  100e9d:	66 c7 05 72 24 11 00 	movw   $0x8,0x112472
  100ea4:	08 00 
  100ea6:	c6 05 74 24 11 00 00 	movb   $0x0,0x112474
  100ead:	c6 05 75 24 11 00 8f 	movb   $0x8f,0x112475
  100eb4:	c1 e8 10             	shr    $0x10,%eax
  100eb7:	66 a3 76 24 11 00    	mov    %ax,0x112476
  100ebd:	b8 dd 10 10 00       	mov    $0x1010dd,%eax
  100ec2:	66 a3 78 24 11 00    	mov    %ax,0x112478
  100ec8:	66 c7 05 7a 24 11 00 	movw   $0x8,0x11247a
  100ecf:	08 00 
  100ed1:	c6 05 7c 24 11 00 00 	movb   $0x0,0x11247c
  100ed8:	c6 05 7d 24 11 00 8f 	movb   $0x8f,0x11247d
  100edf:	c1 e8 10             	shr    $0x10,%eax
  100ee2:	66 a3 7e 24 11 00    	mov    %ax,0x11247e
  100ee8:	b8 e1 10 10 00       	mov    $0x1010e1,%eax
  100eed:	66 a3 80 24 11 00    	mov    %ax,0x112480
  100ef3:	66 c7 05 82 24 11 00 	movw   $0x8,0x112482
  100efa:	08 00 
  100efc:	c6 05 84 24 11 00 00 	movb   $0x0,0x112484
  100f03:	c6 05 85 24 11 00 8f 	movb   $0x8f,0x112485
  100f0a:	c1 e8 10             	shr    $0x10,%eax
  100f0d:	66 a3 86 24 11 00    	mov    %ax,0x112486
  100f13:	b8 e5 10 10 00       	mov    $0x1010e5,%eax
  100f18:	66 a3 90 24 11 00    	mov    %ax,0x112490
  100f1e:	66 c7 05 92 24 11 00 	movw   $0x8,0x112492
  100f25:	08 00 
  100f27:	c6 05 94 24 11 00 00 	movb   $0x0,0x112494
  100f2e:	c6 05 95 24 11 00 8f 	movb   $0x8f,0x112495
  100f35:	c1 e8 10             	shr    $0x10,%eax
  100f38:	66 a3 96 24 11 00    	mov    %ax,0x112496
  100f3e:	b8 e9 10 10 00       	mov    $0x1010e9,%eax
  100f43:	66 a3 88 24 11 00    	mov    %ax,0x112488
  100f49:	66 c7 05 8a 24 11 00 	movw   $0x8,0x11248a
  100f50:	08 00 
  100f52:	c6 05 8c 24 11 00 00 	movb   $0x0,0x11248c
  100f59:	c6 05 8d 24 11 00 8f 	movb   $0x8f,0x11248d
  100f60:	c1 e8 10             	shr    $0x10,%eax
  100f63:	66 a3 8e 24 11 00    	mov    %ax,0x11248e
  100f69:	b8 ed 10 10 00       	mov    $0x1010ed,%eax
  100f6e:	66 a3 20 25 11 00    	mov    %ax,0x112520
  100f74:	66 c7 05 22 25 11 00 	movw   $0x8,0x112522
  100f7b:	08 00 
  100f7d:	c6 05 24 25 11 00 00 	movb   $0x0,0x112524
  100f84:	c6 05 25 25 11 00 ee 	movb   $0xee,0x112525
  100f8b:	c1 e8 10             	shr    $0x10,%eax
  100f8e:	66 a3 26 25 11 00    	mov    %ax,0x112526
  100f94:	b8 f3 10 10 00       	mov    $0x1010f3,%eax
  100f99:	66 a3 20 28 11 00    	mov    %ax,0x112820
  100f9f:	66 c7 05 22 28 11 00 	movw   $0x8,0x112822
  100fa6:	08 00 
  100fa8:	c6 05 24 28 11 00 00 	movb   $0x0,0x112824
  100faf:	c6 05 25 28 11 00 ee 	movb   $0xee,0x112825
  100fb6:	c1 e8 10             	shr    $0x10,%eax
  100fb9:	66 a3 26 28 11 00    	mov    %ax,0x112826
  100fbf:	66 c7 05 2c 26 10 00 	movw   $0x7ff,0x10262c
  100fc6:	ff 07 
  100fc8:	b8 20 24 11 00       	mov    $0x112420,%eax
  100fcd:	66 a3 2e 26 10 00    	mov    %ax,0x10262e
  100fd3:	c1 e8 10             	shr    $0x10,%eax
  100fd6:	66 a3 30 26 10 00    	mov    %ax,0x102630
  100fdc:	b8 2c 26 10 00       	mov    $0x10262c,%eax
  100fe1:	0f 01 18             	lidtl  (%eax)
  100fe4:	5b                   	pop    %ebx
  100fe5:	5d                   	pop    %ebp
  100fe6:	c3                   	ret    
  100fe7:	90                   	nop

00100fe8 <initSerial>:
  100fe8:	55                   	push   %ebp
  100fe9:	89 e5                	mov    %esp,%ebp
  100feb:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100ff0:	31 c0                	xor    %eax,%eax
  100ff2:	ee                   	out    %al,(%dx)
  100ff3:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100ff8:	b0 80                	mov    $0x80,%al
  100ffa:	ee                   	out    %al,(%dx)
  100ffb:	ba f8 03 00 00       	mov    $0x3f8,%edx
  101000:	b0 01                	mov    $0x1,%al
  101002:	ee                   	out    %al,(%dx)
  101003:	ba f9 03 00 00       	mov    $0x3f9,%edx
  101008:	31 c0                	xor    %eax,%eax
  10100a:	ee                   	out    %al,(%dx)
  10100b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  101010:	b0 03                	mov    $0x3,%al
  101012:	ee                   	out    %al,(%dx)
  101013:	ba fa 03 00 00       	mov    $0x3fa,%edx
  101018:	b0 c7                	mov    $0xc7,%al
  10101a:	ee                   	out    %al,(%dx)
  10101b:	ba fc 03 00 00       	mov    $0x3fc,%edx
  101020:	b0 0b                	mov    $0xb,%al
  101022:	ee                   	out    %al,(%dx)
  101023:	5d                   	pop    %ebp
  101024:	c3                   	ret    
  101025:	8d 76 00             	lea    0x0(%esi),%esi

00101028 <putChar>:
  101028:	55                   	push   %ebp
  101029:	89 e5                	mov    %esp,%ebp
  10102b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10102e:	ba fd 03 00 00       	mov    $0x3fd,%edx
  101033:	90                   	nop
  101034:	ec                   	in     (%dx),%al
  101035:	a8 20                	test   $0x20,%al
  101037:	74 fb                	je     101034 <putChar+0xc>
  101039:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10103e:	88 c8                	mov    %cl,%al
  101040:	ee                   	out    %al,(%dx)
  101041:	5d                   	pop    %ebp
  101042:	c3                   	ret    
  101043:	90                   	nop

00101044 <initIntr>:
  101044:	55                   	push   %ebp
  101045:	89 e5                	mov    %esp,%ebp
  101047:	ba 21 00 00 00       	mov    $0x21,%edx
  10104c:	b0 ff                	mov    $0xff,%al
  10104e:	ee                   	out    %al,(%dx)
  10104f:	ba a1 00 00 00       	mov    $0xa1,%edx
  101054:	ee                   	out    %al,(%dx)
  101055:	ba 20 00 00 00       	mov    $0x20,%edx
  10105a:	b0 11                	mov    $0x11,%al
  10105c:	ee                   	out    %al,(%dx)
  10105d:	ba 21 00 00 00       	mov    $0x21,%edx
  101062:	b0 20                	mov    $0x20,%al
  101064:	ee                   	out    %al,(%dx)
  101065:	b0 04                	mov    $0x4,%al
  101067:	ee                   	out    %al,(%dx)
  101068:	b0 03                	mov    $0x3,%al
  10106a:	ee                   	out    %al,(%dx)
  10106b:	ba a0 00 00 00       	mov    $0xa0,%edx
  101070:	b0 11                	mov    $0x11,%al
  101072:	ee                   	out    %al,(%dx)
  101073:	ba a1 00 00 00       	mov    $0xa1,%edx
  101078:	b0 28                	mov    $0x28,%al
  10107a:	ee                   	out    %al,(%dx)
  10107b:	b0 02                	mov    $0x2,%al
  10107d:	ee                   	out    %al,(%dx)
  10107e:	b0 03                	mov    $0x3,%al
  101080:	ee                   	out    %al,(%dx)
  101081:	ba 20 00 00 00       	mov    $0x20,%edx
  101086:	b0 68                	mov    $0x68,%al
  101088:	ee                   	out    %al,(%dx)
  101089:	b0 0a                	mov    $0xa,%al
  10108b:	ee                   	out    %al,(%dx)
  10108c:	ba a0 00 00 00       	mov    $0xa0,%edx
  101091:	b0 68                	mov    $0x68,%al
  101093:	ee                   	out    %al,(%dx)
  101094:	b0 0a                	mov    $0xa,%al
  101096:	ee                   	out    %al,(%dx)
  101097:	5d                   	pop    %ebp
  101098:	c3                   	ret    

00101099 <irqEmpty>:
  101099:	6a 00                	push   $0x0
  10109b:	6a ff                	push   $0xffffffff
  10109d:	eb 5d                	jmp    1010fc <asmDoIrq>

0010109f <irqDivError>:
  10109f:	6a 00                	push   $0x0
  1010a1:	6a 00                	push   $0x0
  1010a3:	eb 57                	jmp    1010fc <asmDoIrq>

001010a5 <irqStepOver>:
  1010a5:	6a 00                	push   $0x0
  1010a7:	6a 01                	push   $0x1
  1010a9:	eb 51                	jmp    1010fc <asmDoIrq>

001010ab <irqNMIInterrupt>:
  1010ab:	6a 00                	push   $0x0
  1010ad:	6a 02                	push   $0x2
  1010af:	eb 4b                	jmp    1010fc <asmDoIrq>

001010b1 <irqBreakPoint>:
  1010b1:	6a 00                	push   $0x0
  1010b3:	6a 03                	push   $0x3
  1010b5:	eb 45                	jmp    1010fc <asmDoIrq>

001010b7 <irqOverflow>:
  1010b7:	6a 00                	push   $0x0
  1010b9:	6a 04                	push   $0x4
  1010bb:	eb 3f                	jmp    1010fc <asmDoIrq>

001010bd <irqBoundTest>:
  1010bd:	6a 00                	push   $0x0
  1010bf:	6a 05                	push   $0x5
  1010c1:	eb 39                	jmp    1010fc <asmDoIrq>

001010c3 <irqInvalidOperation>:
  1010c3:	6a 00                	push   $0x0
  1010c5:	6a 06                	push   $0x6
  1010c7:	eb 33                	jmp    1010fc <asmDoIrq>

001010c9 <irqNoCoprocessor>:
  1010c9:	6a 00                	push   $0x0
  1010cb:	6a 07                	push   $0x7
  1010cd:	eb 2d                	jmp    1010fc <asmDoIrq>

001010cf <irqDoubleFault>:
  1010cf:	6a 08                	push   $0x8
  1010d1:	eb 29                	jmp    1010fc <asmDoIrq>

001010d3 <irqCoprocessorOutofBound>:
  1010d3:	6a 00                	push   $0x0
  1010d5:	6a 09                	push   $0x9
  1010d7:	eb 23                	jmp    1010fc <asmDoIrq>

001010d9 <irqInvalidTSS>:
  1010d9:	6a 0a                	push   $0xa
  1010db:	eb 1f                	jmp    1010fc <asmDoIrq>

001010dd <irqNoSegment>:
  1010dd:	6a 0b                	push   $0xb
  1010df:	eb 1b                	jmp    1010fc <asmDoIrq>

001010e1 <irqStackSegmentFault>:
  1010e1:	6a 0c                	push   $0xc
  1010e3:	eb 17                	jmp    1010fc <asmDoIrq>

001010e5 <irqPageFault>:
  1010e5:	6a 0e                	push   $0xe
  1010e7:	eb 13                	jmp    1010fc <asmDoIrq>

001010e9 <irqGProtectFault>:
  1010e9:	6a 0d                	push   $0xd
  1010eb:	eb 0f                	jmp    1010fc <asmDoIrq>

001010ed <irqTime>:
  1010ed:	6a 00                	push   $0x0
  1010ef:	6a 20                	push   $0x20
  1010f1:	eb 09                	jmp    1010fc <asmDoIrq>

001010f3 <irqSyscall>:
  1010f3:	6a 00                	push   $0x0
  1010f5:	68 80 00 00 00       	push   $0x80
  1010fa:	eb 00                	jmp    1010fc <asmDoIrq>

001010fc <asmDoIrq>:
  1010fc:	60                   	pusha  
  1010fd:	1e                   	push   %ds
  1010fe:	06                   	push   %es
  1010ff:	0f a0                	push   %fs
  101101:	0f a8                	push   %gs
  101103:	54                   	push   %esp
  101104:	e8 9b f0 ff ff       	call   1001a4 <irqHandle>
  101109:	83 c4 04             	add    $0x4,%esp
  10110c:	83 c4 10             	add    $0x10,%esp
  10110f:	61                   	popa   
  101110:	83 c4 04             	add    $0x4,%esp
  101113:	83 c4 04             	add    $0x4,%esp
  101116:	cf                   	iret   
