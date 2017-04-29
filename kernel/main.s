
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 21 05 00 00       	call   10052c <initSerial>
  10000b:	e8 68 04 00 00       	call   100478 <initIdt>
  100010:	e8 73 05 00 00       	call   100588 <initIntr>
  100015:	e8 4a 02 00 00       	call   100264 <initSeg>
  10001a:	e8 c1 03 00 00       	call   1003e0 <loadUMain>
  10001f:	eb fe                	jmp    10001f <kEntry+0x1f>
  100021:	66 90                	xchg   %ax,%ax
  100023:	90                   	nop

00100024 <abort>:
  100024:	55                   	push   %ebp
  100025:	89 e5                	mov    %esp,%ebp
  100027:	57                   	push   %edi
  100028:	56                   	push   %esi
  100029:	53                   	push   %ebx
  10002a:	83 ec 1c             	sub    $0x1c,%esp
  10002d:	8b 55 08             	mov    0x8(%ebp),%edx
  100030:	fa                   	cli    
  100031:	8a 02                	mov    (%edx),%al
  100033:	b9 12 10 10 00       	mov    $0x101012,%ecx
  100038:	84 c0                	test   %al,%al
  10003a:	74 0b                	je     100047 <abort+0x23>
  10003c:	41                   	inc    %ecx
  10003d:	42                   	inc    %edx
  10003e:	88 41 ff             	mov    %al,-0x1(%ecx)
  100041:	8a 02                	mov    (%edx),%al
  100043:	84 c0                	test   %al,%al
  100045:	75 f5                	jne    10003c <abort+0x18>
  100047:	c6 01 3a             	movb   $0x3a,(%ecx)
  10004a:	bb 3d 11 10 00       	mov    $0x10113d,%ebx
  10004f:	be 0a 00 00 00       	mov    $0xa,%esi
  100054:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100059:	4b                   	dec    %ebx
  10005a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10005d:	99                   	cltd   
  10005e:	f7 fe                	idiv   %esi
  100060:	8d 42 30             	lea    0x30(%edx),%eax
  100063:	88 45 e7             	mov    %al,-0x19(%ebp)
  100066:	88 03                	mov    %al,(%ebx)
  100068:	89 f8                	mov    %edi,%eax
  10006a:	f7 6d 0c             	imull  0xc(%ebp)
  10006d:	c1 fa 02             	sar    $0x2,%edx
  100070:	8b 45 0c             	mov    0xc(%ebp),%eax
  100073:	c1 f8 1f             	sar    $0x1f,%eax
  100076:	29 c2                	sub    %eax,%edx
  100078:	89 55 0c             	mov    %edx,0xc(%ebp)
  10007b:	75 dc                	jne    100059 <abort+0x35>
  10007d:	41                   	inc    %ecx
  10007e:	41                   	inc    %ecx
  10007f:	43                   	inc    %ebx
  100080:	8a 45 e7             	mov    -0x19(%ebp),%al
  100083:	88 41 ff             	mov    %al,-0x1(%ecx)
  100086:	8a 03                	mov    (%ebx),%al
  100088:	88 45 e7             	mov    %al,-0x19(%ebp)
  10008b:	84 c0                	test   %al,%al
  10008d:	75 ef                	jne    10007e <abort+0x5a>
  10008f:	c6 01 0a             	movb   $0xa,(%ecx)
  100092:	0f be 05 00 10 10 00 	movsbl 0x101000,%eax
  100099:	84 c0                	test   %al,%al
  10009b:	74 1b                	je     1000b8 <abort+0x94>
  10009d:	bb 00 10 10 00       	mov    $0x101000,%ebx
  1000a2:	83 ec 0c             	sub    $0xc,%esp
  1000a5:	50                   	push   %eax
  1000a6:	e8 c1 04 00 00       	call   10056c <putChar>
  1000ab:	43                   	inc    %ebx
  1000ac:	0f be 03             	movsbl (%ebx),%eax
  1000af:	83 c4 10             	add    $0x10,%esp
  1000b2:	84 c0                	test   %al,%al
  1000b4:	75 ec                	jne    1000a2 <abort+0x7e>
  1000b6:	66 90                	xchg   %ax,%ax
  1000b8:	f4                   	hlt    
  1000b9:	eb fd                	jmp    1000b8 <abort+0x94>
  1000bb:	90                   	nop

001000bc <sys_write>:
  1000bc:	55                   	push   %ebp
  1000bd:	89 e5                	mov    %esp,%ebp
  1000bf:	8b 55 08             	mov    0x8(%ebp),%edx
  1000c2:	8b 42 18             	mov    0x18(%edx),%eax
  1000c5:	83 f8 0a             	cmp    $0xa,%eax
  1000c8:	74 5e                	je     100128 <sys_write+0x6c>
  1000ca:	66 b8 10 00          	mov    $0x10,%ax
  1000ce:	8e d8                	mov    %eax,%ds
  1000d0:	8e c0                	mov    %eax,%es
  1000d2:	66 b8 30 00          	mov    $0x30,%ax
  1000d6:	8e e8                	mov    %eax,%gs
  1000d8:	a1 00 11 10 00       	mov    0x101100,%eax
  1000dd:	6b c0 50             	imul   $0x50,%eax,%eax
  1000e0:	03 05 40 11 10 00    	add    0x101140,%eax
  1000e6:	6b c0 02             	imul   $0x2,%eax,%eax
  1000e9:	89 c7                	mov    %eax,%edi
  1000eb:	8a 42 18             	mov    0x18(%edx),%al
  1000ee:	b4 0c                	mov    $0xc,%ah
  1000f0:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1000f4:	8b 0d 40 11 10 00    	mov    0x101140,%ecx
  1000fa:	8d 51 01             	lea    0x1(%ecx),%edx
  1000fd:	89 15 40 11 10 00    	mov    %edx,0x101140
  100103:	81 fa 9f 00 00 00    	cmp    $0x9f,%edx
  100109:	7e 10                	jle    10011b <sys_write+0x5f>
  10010b:	ff 05 00 11 10 00    	incl   0x101100
  100111:	c7 05 40 11 10 00 00 	movl   $0x0,0x101140
  100118:	00 00 00 
  10011b:	0f be c0             	movsbl %al,%eax
  10011e:	89 45 08             	mov    %eax,0x8(%ebp)
  100121:	5d                   	pop    %ebp
  100122:	e9 45 04 00 00       	jmp    10056c <putChar>
  100127:	90                   	nop
  100128:	ff 05 00 11 10 00    	incl   0x101100
  10012e:	c7 05 40 11 10 00 00 	movl   $0x0,0x101140
  100135:	00 00 00 
  100138:	5d                   	pop    %ebp
  100139:	c3                   	ret    
  10013a:	66 90                	xchg   %ax,%ax

0010013c <syscallHandle>:
  10013c:	55                   	push   %ebp
  10013d:	89 e5                	mov    %esp,%ebp
  10013f:	83 ec 08             	sub    $0x8,%esp
  100142:	8b 45 08             	mov    0x8(%ebp),%eax
  100145:	83 78 1c 04          	cmpl   $0x4,0x1c(%eax)
  100149:	74 15                	je     100160 <syscallHandle+0x24>
  10014b:	83 ec 08             	sub    $0x8,%esp
  10014e:	6a 4c                	push   $0x4c
  100150:	68 4c 06 10 00       	push   $0x10064c
  100155:	e8 ca fe ff ff       	call   100024 <abort>
  10015a:	83 c4 10             	add    $0x10,%esp
  10015d:	c9                   	leave  
  10015e:	c3                   	ret    
  10015f:	90                   	nop
  100160:	c9                   	leave  
  100161:	e9 56 ff ff ff       	jmp    1000bc <sys_write>
  100166:	66 90                	xchg   %ax,%ax

00100168 <irqHandle>:
  100168:	55                   	push   %ebp
  100169:	89 e5                	mov    %esp,%ebp
  10016b:	83 ec 08             	sub    $0x8,%esp
  10016e:	8b 55 08             	mov    0x8(%ebp),%edx
  100171:	b8 10 00 00 00       	mov    $0x10,%eax
  100176:	8e c0                	mov    %eax,%es
  100178:	8e d8                	mov    %eax,%ds
  10017a:	8e d0                	mov    %eax,%ss
  10017c:	8b 42 20             	mov    0x20(%edx),%eax
  10017f:	83 f8 0d             	cmp    $0xd,%eax
  100182:	74 28                	je     1001ac <irqHandle+0x44>
  100184:	3d 80 00 00 00       	cmp    $0x80,%eax
  100189:	74 19                	je     1001a4 <irqHandle+0x3c>
  10018b:	40                   	inc    %eax
  10018c:	74 12                	je     1001a0 <irqHandle+0x38>
  10018e:	83 ec 08             	sub    $0x8,%esp
  100191:	6a 1b                	push   $0x1b
  100193:	68 4c 06 10 00       	push   $0x10064c
  100198:	e8 87 fe ff ff       	call   100024 <abort>
  10019d:	83 c4 10             	add    $0x10,%esp
  1001a0:	c9                   	leave  
  1001a1:	c3                   	ret    
  1001a2:	66 90                	xchg   %ax,%ax
  1001a4:	89 55 08             	mov    %edx,0x8(%ebp)
  1001a7:	c9                   	leave  
  1001a8:	eb 92                	jmp    10013c <syscallHandle>
  1001aa:	66 90                	xchg   %ax,%ax
  1001ac:	83 ec 08             	sub    $0x8,%esp
  1001af:	6a 51                	push   $0x51
  1001b1:	68 4c 06 10 00       	push   $0x10064c
  1001b6:	e8 69 fe ff ff       	call   100024 <abort>
  1001bb:	83 c4 10             	add    $0x10,%esp
  1001be:	c9                   	leave  
  1001bf:	c3                   	ret    

001001c0 <GProtectFaultHandle>:
  1001c0:	55                   	push   %ebp
  1001c1:	89 e5                	mov    %esp,%ebp
  1001c3:	83 ec 10             	sub    $0x10,%esp
  1001c6:	6a 51                	push   $0x51
  1001c8:	68 4c 06 10 00       	push   $0x10064c
  1001cd:	e8 52 fe ff ff       	call   100024 <abort>
  1001d2:	83 c4 10             	add    $0x10,%esp
  1001d5:	c9                   	leave  
  1001d6:	c3                   	ret    
  1001d7:	90                   	nop

001001d8 <waitDisk>:
  1001d8:	55                   	push   %ebp
  1001d9:	89 e5                	mov    %esp,%ebp
  1001db:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1001e0:	ec                   	in     (%dx),%al
  1001e1:	83 e0 c0             	and    $0xffffffc0,%eax
  1001e4:	3c 40                	cmp    $0x40,%al
  1001e6:	75 f8                	jne    1001e0 <waitDisk+0x8>
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    
  1001ea:	66 90                	xchg   %ax,%ax

001001ec <readSect>:
  1001ec:	55                   	push   %ebp
  1001ed:	89 e5                	mov    %esp,%ebp
  1001ef:	53                   	push   %ebx
  1001f0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1001f3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1001f8:	ec                   	in     (%dx),%al
  1001f9:	83 e0 c0             	and    $0xffffffc0,%eax
  1001fc:	3c 40                	cmp    $0x40,%al
  1001fe:	75 f8                	jne    1001f8 <readSect+0xc>
  100200:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100205:	b0 01                	mov    $0x1,%al
  100207:	ee                   	out    %al,(%dx)
  100208:	ba f3 01 00 00       	mov    $0x1f3,%edx
  10020d:	88 c8                	mov    %cl,%al
  10020f:	ee                   	out    %al,(%dx)
  100210:	89 c8                	mov    %ecx,%eax
  100212:	c1 f8 08             	sar    $0x8,%eax
  100215:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10021a:	ee                   	out    %al,(%dx)
  10021b:	89 c8                	mov    %ecx,%eax
  10021d:	c1 f8 10             	sar    $0x10,%eax
  100220:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100225:	ee                   	out    %al,(%dx)
  100226:	89 c8                	mov    %ecx,%eax
  100228:	c1 f8 18             	sar    $0x18,%eax
  10022b:	83 c8 e0             	or     $0xffffffe0,%eax
  10022e:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100233:	ee                   	out    %al,(%dx)
  100234:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100239:	b0 20                	mov    $0x20,%al
  10023b:	ee                   	out    %al,(%dx)
  10023c:	ec                   	in     (%dx),%al
  10023d:	83 e0 c0             	and    $0xffffffc0,%eax
  100240:	3c 40                	cmp    $0x40,%al
  100242:	75 f8                	jne    10023c <readSect+0x50>
  100244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100247:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  10024d:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100252:	66 90                	xchg   %ax,%ax
  100254:	ed                   	in     (%dx),%eax
  100255:	89 01                	mov    %eax,(%ecx)
  100257:	83 c1 04             	add    $0x4,%ecx
  10025a:	39 d9                	cmp    %ebx,%ecx
  10025c:	75 f6                	jne    100254 <readSect+0x68>
  10025e:	5b                   	pop    %ebx
  10025f:	5d                   	pop    %ebp
  100260:	c3                   	ret    
  100261:	8d 76 00             	lea    0x0(%esi),%esi

00100264 <initSeg>:
  100264:	55                   	push   %ebp
  100265:	89 e5                	mov    %esp,%ebp
  100267:	b9 60 11 10 00       	mov    $0x101160,%ecx
  10026c:	66 c7 05 68 11 10 00 	movw   $0xffff,0x101168
  100273:	ff ff 
  100275:	66 c7 05 6a 11 10 00 	movw   $0x0,0x10116a
  10027c:	00 00 
  10027e:	c6 05 6c 11 10 00 00 	movb   $0x0,0x10116c
  100285:	c6 05 6d 11 10 00 9a 	movb   $0x9a,0x10116d
  10028c:	c6 05 6e 11 10 00 cf 	movb   $0xcf,0x10116e
  100293:	c6 05 6f 11 10 00 00 	movb   $0x0,0x10116f
  10029a:	66 c7 05 70 11 10 00 	movw   $0xffff,0x101170
  1002a1:	ff ff 
  1002a3:	66 c7 05 72 11 10 00 	movw   $0x0,0x101172
  1002aa:	00 00 
  1002ac:	c6 05 74 11 10 00 00 	movb   $0x0,0x101174
  1002b3:	c6 05 75 11 10 00 92 	movb   $0x92,0x101175
  1002ba:	c6 05 76 11 10 00 cf 	movb   $0xcf,0x101176
  1002c1:	c6 05 77 11 10 00 00 	movb   $0x0,0x101177
  1002c8:	66 c7 05 78 11 10 00 	movw   $0xffff,0x101178
  1002cf:	ff ff 
  1002d1:	66 c7 05 7a 11 10 00 	movw   $0x0,0x10117a
  1002d8:	00 00 
  1002da:	c6 05 7c 11 10 00 00 	movb   $0x0,0x10117c
  1002e1:	c6 05 7d 11 10 00 fa 	movb   $0xfa,0x10117d
  1002e8:	c6 05 7e 11 10 00 cf 	movb   $0xcf,0x10117e
  1002ef:	c6 05 7f 11 10 00 00 	movb   $0x0,0x10117f
  1002f6:	66 c7 05 80 11 10 00 	movw   $0xffff,0x101180
  1002fd:	ff ff 
  1002ff:	66 c7 05 82 11 10 00 	movw   $0x0,0x101182
  100306:	00 00 
  100308:	c6 05 84 11 10 00 00 	movb   $0x0,0x101184
  10030f:	c6 05 85 11 10 00 f2 	movb   $0xf2,0x101185
  100316:	c6 05 86 11 10 00 cf 	movb   $0xcf,0x101186
  10031d:	c6 05 87 11 10 00 00 	movb   $0x0,0x101187
  100324:	66 c7 05 88 11 10 00 	movw   $0x63,0x101188
  10032b:	63 00 
  10032d:	b8 a0 11 10 00       	mov    $0x1011a0,%eax
  100332:	66 a3 8a 11 10 00    	mov    %ax,0x10118a
  100338:	89 c2                	mov    %eax,%edx
  10033a:	c1 ea 10             	shr    $0x10,%edx
  10033d:	88 15 8c 11 10 00    	mov    %dl,0x10118c
  100343:	c6 05 8d 11 10 00 89 	movb   $0x89,0x10118d
  10034a:	c6 05 8e 11 10 00 40 	movb   $0x40,0x10118e
  100351:	c1 e8 18             	shr    $0x18,%eax
  100354:	a2 8f 11 10 00       	mov    %al,0x10118f
  100359:	a1 60 06 10 00       	mov    0x100660,%eax
  10035e:	8b 15 64 06 10 00    	mov    0x100664,%edx
  100364:	a3 90 11 10 00       	mov    %eax,0x101190
  100369:	89 15 94 11 10 00    	mov    %edx,0x101194
  10036f:	66 c7 05 44 11 10 00 	movw   $0x37,0x101144
  100376:	37 00 
  100378:	66 89 0d 46 11 10 00 	mov    %cx,0x101146
  10037f:	c1 e9 10             	shr    $0x10,%ecx
  100382:	66 89 0d 48 11 10 00 	mov    %cx,0x101148
  100389:	b8 44 11 10 00       	mov    $0x101144,%eax
  10038e:	0f 01 10             	lgdtl  (%eax)
  100391:	c7 05 a8 11 10 00 10 	movl   $0x10,0x1011a8
  100398:	00 00 00 
  10039b:	c7 05 a4 11 10 00 00 	movl   $0xf00000,0x1011a4
  1003a2:	00 f0 00 
  1003a5:	b8 28 00 00 00       	mov    $0x28,%eax
  1003aa:	0f 00 d8             	ltr    %ax
  1003ad:	31 c0                	xor    %eax,%eax
  1003af:	0f 00 d0             	lldt   %ax
  1003b2:	5d                   	pop    %ebp
  1003b3:	c3                   	ret    

001003b4 <enterUserSpace>:
  1003b4:	55                   	push   %ebp
  1003b5:	89 e5                	mov    %esp,%ebp
  1003b7:	83 ec 10             	sub    $0x10,%esp
  1003ba:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
  1003c1:	b8 23 00 00 00       	mov    $0x23,%eax
  1003c6:	8e c0                	mov    %eax,%es
  1003c8:	8e d8                	mov    %eax,%ds
  1003ca:	66 6a 23             	pushw  $0x23
  1003cd:	68 00 00 02 00       	push   $0x20000
  1003d2:	ff 75 fc             	pushl  -0x4(%ebp)
  1003d5:	6a 1b                	push   $0x1b
  1003d7:	ff 75 08             	pushl  0x8(%ebp)
  1003da:	cf                   	iret   
  1003db:	c9                   	leave  
  1003dc:	c3                   	ret    
  1003dd:	8d 76 00             	lea    0x0(%esi),%esi

001003e0 <loadUMain>:
  1003e0:	55                   	push   %ebp
  1003e1:	89 e5                	mov    %esp,%ebp
  1003e3:	57                   	push   %edi
  1003e4:	56                   	push   %esi
  1003e5:	53                   	push   %ebx
  1003e6:	81 ec 00 90 01 00    	sub    $0x19000,%esp
  1003ec:	be c9 00 00 00       	mov    $0xc9,%esi
  1003f1:	8d 9d f4 6f fe ff    	lea    -0x1900c(%ebp),%ebx
  1003f7:	90                   	nop
  1003f8:	56                   	push   %esi
  1003f9:	53                   	push   %ebx
  1003fa:	e8 ed fd ff ff       	call   1001ec <readSect>
  1003ff:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100405:	46                   	inc    %esi
  100406:	58                   	pop    %eax
  100407:	5a                   	pop    %edx
  100408:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10040b:	39 c3                	cmp    %eax,%ebx
  10040d:	75 e9                	jne    1003f8 <loadUMain+0x18>
  10040f:	8d 95 f4 6f fe ff    	lea    -0x1900c(%ebp),%edx
  100415:	03 95 10 70 fe ff    	add    -0x18ff0(%ebp),%edx
  10041b:	0f b7 9d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ebx
  100422:	c1 e3 05             	shl    $0x5,%ebx
  100425:	01 d3                	add    %edx,%ebx
  100427:	31 c0                	xor    %eax,%eax
  100429:	39 da                	cmp    %ebx,%edx
  10042b:	72 0a                	jb     100437 <loadUMain+0x57>
  10042d:	eb 34                	jmp    100463 <loadUMain+0x83>
  10042f:	90                   	nop
  100430:	83 c2 20             	add    $0x20,%edx
  100433:	39 d3                	cmp    %edx,%ebx
  100435:	76 2c                	jbe    100463 <loadUMain+0x83>
  100437:	83 3a 01             	cmpl   $0x1,(%edx)
  10043a:	75 f4                	jne    100430 <loadUMain+0x50>
  10043c:	8d b5 f4 6f fe ff    	lea    -0x1900c(%ebp),%esi
  100442:	03 72 04             	add    0x4(%edx),%esi
  100445:	8b 4a 10             	mov    0x10(%edx),%ecx
  100448:	8b 7a 08             	mov    0x8(%edx),%edi
  10044b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10044d:	8b 72 10             	mov    0x10(%edx),%esi
  100450:	8b 4a 14             	mov    0x14(%edx),%ecx
  100453:	29 f1                	sub    %esi,%ecx
  100455:	03 72 08             	add    0x8(%edx),%esi
  100458:	89 f7                	mov    %esi,%edi
  10045a:	f3 aa                	rep stos %al,%es:(%edi)
  10045c:	83 c2 20             	add    $0x20,%edx
  10045f:	39 d3                	cmp    %edx,%ebx
  100461:	77 d4                	ja     100437 <loadUMain+0x57>
  100463:	ff b5 0c 70 fe ff    	pushl  -0x18ff4(%ebp)
  100469:	e8 46 ff ff ff       	call   1003b4 <enterUserSpace>
  10046e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100471:	5b                   	pop    %ebx
  100472:	5e                   	pop    %esi
  100473:	5f                   	pop    %edi
  100474:	5d                   	pop    %ebp
  100475:	c3                   	ret    
  100476:	66 90                	xchg   %ax,%ax

00100478 <initIdt>:
  100478:	55                   	push   %ebp
  100479:	89 e5                	mov    %esp,%ebp
  10047b:	53                   	push   %ebx
  10047c:	ba dd 05 10 00       	mov    $0x1005dd,%edx
  100481:	89 d3                	mov    %edx,%ebx
  100483:	c1 ea 10             	shr    $0x10,%edx
  100486:	b9 20 1a 10 00       	mov    $0x101a20,%ecx
  10048b:	b8 20 12 10 00       	mov    $0x101220,%eax
  100490:	66 89 18             	mov    %bx,(%eax)
  100493:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100499:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  10049d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1004a1:	66 89 50 06          	mov    %dx,0x6(%eax)
  1004a5:	83 c0 08             	add    $0x8,%eax
  1004a8:	39 c1                	cmp    %eax,%ecx
  1004aa:	75 e4                	jne    100490 <initIdt+0x18>
  1004ac:	b8 2d 06 10 00       	mov    $0x10062d,%eax
  1004b1:	66 a3 88 12 10 00    	mov    %ax,0x101288
  1004b7:	66 c7 05 8a 12 10 00 	movw   $0x8,0x10128a
  1004be:	08 00 
  1004c0:	c6 05 8c 12 10 00 00 	movb   $0x0,0x10128c
  1004c7:	c6 05 8d 12 10 00 8f 	movb   $0x8f,0x10128d
  1004ce:	c1 e8 10             	shr    $0x10,%eax
  1004d1:	66 a3 8e 12 10 00    	mov    %ax,0x10128e
  1004d7:	b8 31 06 10 00       	mov    $0x100631,%eax
  1004dc:	66 a3 20 16 10 00    	mov    %ax,0x101620
  1004e2:	66 c7 05 22 16 10 00 	movw   $0x8,0x101622
  1004e9:	08 00 
  1004eb:	c6 05 24 16 10 00 00 	movb   $0x0,0x101624
  1004f2:	c6 05 25 16 10 00 ee 	movb   $0xee,0x101625
  1004f9:	c1 e8 10             	shr    $0x10,%eax
  1004fc:	66 a3 26 16 10 00    	mov    %ax,0x101626
  100502:	66 c7 05 4c 11 10 00 	movw   $0x7ff,0x10114c
  100509:	ff 07 
  10050b:	b8 20 12 10 00       	mov    $0x101220,%eax
  100510:	66 a3 4e 11 10 00    	mov    %ax,0x10114e
  100516:	c1 e8 10             	shr    $0x10,%eax
  100519:	66 a3 50 11 10 00    	mov    %ax,0x101150
  10051f:	b8 4c 11 10 00       	mov    $0x10114c,%eax
  100524:	0f 01 18             	lidtl  (%eax)
  100527:	5b                   	pop    %ebx
  100528:	5d                   	pop    %ebp
  100529:	c3                   	ret    
  10052a:	66 90                	xchg   %ax,%ax

0010052c <initSerial>:
  10052c:	55                   	push   %ebp
  10052d:	89 e5                	mov    %esp,%ebp
  10052f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100534:	31 c0                	xor    %eax,%eax
  100536:	ee                   	out    %al,(%dx)
  100537:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10053c:	b0 80                	mov    $0x80,%al
  10053e:	ee                   	out    %al,(%dx)
  10053f:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100544:	b0 01                	mov    $0x1,%al
  100546:	ee                   	out    %al,(%dx)
  100547:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10054c:	31 c0                	xor    %eax,%eax
  10054e:	ee                   	out    %al,(%dx)
  10054f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100554:	b0 03                	mov    $0x3,%al
  100556:	ee                   	out    %al,(%dx)
  100557:	ba fa 03 00 00       	mov    $0x3fa,%edx
  10055c:	b0 c7                	mov    $0xc7,%al
  10055e:	ee                   	out    %al,(%dx)
  10055f:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100564:	b0 0b                	mov    $0xb,%al
  100566:	ee                   	out    %al,(%dx)
  100567:	5d                   	pop    %ebp
  100568:	c3                   	ret    
  100569:	8d 76 00             	lea    0x0(%esi),%esi

0010056c <putChar>:
  10056c:	55                   	push   %ebp
  10056d:	89 e5                	mov    %esp,%ebp
  10056f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100572:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100577:	90                   	nop
  100578:	ec                   	in     (%dx),%al
  100579:	a8 20                	test   $0x20,%al
  10057b:	74 fb                	je     100578 <putChar+0xc>
  10057d:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100582:	88 c8                	mov    %cl,%al
  100584:	ee                   	out    %al,(%dx)
  100585:	5d                   	pop    %ebp
  100586:	c3                   	ret    
  100587:	90                   	nop

00100588 <initIntr>:
  100588:	55                   	push   %ebp
  100589:	89 e5                	mov    %esp,%ebp
  10058b:	ba 21 00 00 00       	mov    $0x21,%edx
  100590:	b0 ff                	mov    $0xff,%al
  100592:	ee                   	out    %al,(%dx)
  100593:	ba a1 00 00 00       	mov    $0xa1,%edx
  100598:	ee                   	out    %al,(%dx)
  100599:	ba 20 00 00 00       	mov    $0x20,%edx
  10059e:	b0 11                	mov    $0x11,%al
  1005a0:	ee                   	out    %al,(%dx)
  1005a1:	ba 21 00 00 00       	mov    $0x21,%edx
  1005a6:	b0 20                	mov    $0x20,%al
  1005a8:	ee                   	out    %al,(%dx)
  1005a9:	b0 04                	mov    $0x4,%al
  1005ab:	ee                   	out    %al,(%dx)
  1005ac:	b0 03                	mov    $0x3,%al
  1005ae:	ee                   	out    %al,(%dx)
  1005af:	ba a0 00 00 00       	mov    $0xa0,%edx
  1005b4:	b0 11                	mov    $0x11,%al
  1005b6:	ee                   	out    %al,(%dx)
  1005b7:	ba a1 00 00 00       	mov    $0xa1,%edx
  1005bc:	b0 28                	mov    $0x28,%al
  1005be:	ee                   	out    %al,(%dx)
  1005bf:	b0 02                	mov    $0x2,%al
  1005c1:	ee                   	out    %al,(%dx)
  1005c2:	b0 03                	mov    $0x3,%al
  1005c4:	ee                   	out    %al,(%dx)
  1005c5:	ba 20 00 00 00       	mov    $0x20,%edx
  1005ca:	b0 68                	mov    $0x68,%al
  1005cc:	ee                   	out    %al,(%dx)
  1005cd:	b0 0a                	mov    $0xa,%al
  1005cf:	ee                   	out    %al,(%dx)
  1005d0:	ba a0 00 00 00       	mov    $0xa0,%edx
  1005d5:	b0 68                	mov    $0x68,%al
  1005d7:	ee                   	out    %al,(%dx)
  1005d8:	b0 0a                	mov    $0xa,%al
  1005da:	ee                   	out    %al,(%dx)
  1005db:	5d                   	pop    %ebp
  1005dc:	c3                   	ret    

001005dd <irqEmpty>:
  1005dd:	6a 00                	push   $0x0
  1005df:	6a ff                	push   $0xffffffff
  1005e1:	eb 57                	jmp    10063a <asmDoIrq>

001005e3 <irqDivError>:
  1005e3:	6a 00                	push   $0x0
  1005e5:	6a 00                	push   $0x0
  1005e7:	eb 51                	jmp    10063a <asmDoIrq>

001005e9 <irqStepOver>:
  1005e9:	6a 00                	push   $0x0
  1005eb:	6a 01                	push   $0x1
  1005ed:	eb 4b                	jmp    10063a <asmDoIrq>

001005ef <irqNMIInterrupt>:
  1005ef:	6a 00                	push   $0x0
  1005f1:	6a 02                	push   $0x2
  1005f3:	eb 45                	jmp    10063a <asmDoIrq>

001005f5 <irqBreakPoint>:
  1005f5:	6a 00                	push   $0x0
  1005f7:	6a 03                	push   $0x3
  1005f9:	eb 3f                	jmp    10063a <asmDoIrq>

001005fb <irqOverflow>:
  1005fb:	6a 00                	push   $0x0
  1005fd:	6a 04                	push   $0x4
  1005ff:	eb 39                	jmp    10063a <asmDoIrq>

00100601 <irqBoundTest>:
  100601:	6a 00                	push   $0x0
  100603:	6a 05                	push   $0x5
  100605:	eb 33                	jmp    10063a <asmDoIrq>

00100607 <irqInvalidOperation>:
  100607:	6a 00                	push   $0x0
  100609:	6a 06                	push   $0x6
  10060b:	eb 2d                	jmp    10063a <asmDoIrq>

0010060d <irqNoCoprocessor>:
  10060d:	6a 00                	push   $0x0
  10060f:	6a 07                	push   $0x7
  100611:	eb 27                	jmp    10063a <asmDoIrq>

00100613 <irqDoubleFault>:
  100613:	6a 08                	push   $0x8
  100615:	eb 23                	jmp    10063a <asmDoIrq>

00100617 <irqCoprocessorOutofBound>:
  100617:	6a 00                	push   $0x0
  100619:	6a 09                	push   $0x9
  10061b:	eb 1d                	jmp    10063a <asmDoIrq>

0010061d <irqInvalidTSS>:
  10061d:	6a 0a                	push   $0xa
  10061f:	eb 19                	jmp    10063a <asmDoIrq>

00100621 <irqNoSegment>:
  100621:	6a 0b                	push   $0xb
  100623:	eb 15                	jmp    10063a <asmDoIrq>

00100625 <irqStackSegmentFault>:
  100625:	6a 0c                	push   $0xc
  100627:	eb 11                	jmp    10063a <asmDoIrq>

00100629 <irqPageFault>:
  100629:	6a 0e                	push   $0xe
  10062b:	eb 0d                	jmp    10063a <asmDoIrq>

0010062d <irqGProtectFault>:
  10062d:	6a 0d                	push   $0xd
  10062f:	eb 09                	jmp    10063a <asmDoIrq>

00100631 <irqSyscall>:
  100631:	6a 00                	push   $0x0
  100633:	68 80 00 00 00       	push   $0x80
  100638:	eb 00                	jmp    10063a <asmDoIrq>

0010063a <asmDoIrq>:
  10063a:	60                   	pusha  
  10063b:	54                   	push   %esp
  10063c:	e8 27 fb ff ff       	call   100168 <irqHandle>
  100641:	83 c4 04             	add    $0x4,%esp
  100644:	61                   	popa   
  100645:	83 c4 04             	add    $0x4,%esp
  100648:	83 c4 04             	add    $0x4,%esp
  10064b:	cf                   	iret   
