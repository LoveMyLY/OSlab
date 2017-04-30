
kernel/kMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 6d 07 00 00       	call   100778 <initSerial>
  10000b:	e8 5c 04 00 00       	call   10046c <initIdt>
  100010:	e8 bf 07 00 00       	call   1007d4 <initIntr>
  100015:	e8 3e 02 00 00       	call   100258 <initSeg>
  10001a:	e8 b5 03 00 00       	call   1003d4 <loadUMain>
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
  1000a6:	e8 0d 07 00 00       	call   1007b8 <putChar>
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
  1000bf:	56                   	push   %esi
  1000c0:	53                   	push   %ebx
  1000c1:	8b 75 08             	mov    0x8(%ebp),%esi
  1000c4:	8b 5e 18             	mov    0x18(%esi),%ebx
  1000c7:	83 ec 0c             	sub    $0xc,%esp
  1000ca:	0f be c3             	movsbl %bl,%eax
  1000cd:	50                   	push   %eax
  1000ce:	e8 e5 06 00 00       	call   1007b8 <putChar>
  1000d3:	83 c4 10             	add    $0x10,%esp
  1000d6:	83 fb 0a             	cmp    $0xa,%ebx
  1000d9:	74 3c                	je     100117 <sys_write+0x5b>
  1000db:	66 b8 10 00          	mov    $0x10,%ax
  1000df:	8e d8                	mov    %eax,%ds
  1000e1:	8e c0                	mov    %eax,%es
  1000e3:	66 b8 30 00          	mov    $0x30,%ax
  1000e7:	8e e8                	mov    %eax,%gs
  1000e9:	a1 00 11 10 00       	mov    0x101100,%eax
  1000ee:	6b c0 50             	imul   $0x50,%eax,%eax
  1000f1:	03 05 40 11 10 00    	add    0x101140,%eax
  1000f7:	6b c0 02             	imul   $0x2,%eax,%eax
  1000fa:	89 c7                	mov    %eax,%edi
  1000fc:	8a 46 18             	mov    0x18(%esi),%al
  1000ff:	b4 0f                	mov    $0xf,%ah
  100101:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100105:	a1 40 11 10 00       	mov    0x101140,%eax
  10010a:	40                   	inc    %eax
  10010b:	a3 40 11 10 00       	mov    %eax,0x101140
  100110:	3d 9f 00 00 00       	cmp    $0x9f,%eax
  100115:	7e 10                	jle    100127 <sys_write+0x6b>
  100117:	ff 05 00 11 10 00    	incl   0x101100
  10011d:	c7 05 40 11 10 00 00 	movl   $0x0,0x101140
  100124:	00 00 00 
  100127:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10012a:	5b                   	pop    %ebx
  10012b:	5e                   	pop    %esi
  10012c:	5d                   	pop    %ebp
  10012d:	c3                   	ret    
  10012e:	66 90                	xchg   %ax,%ax

00100130 <syscallHandle>:
  100130:	55                   	push   %ebp
  100131:	89 e5                	mov    %esp,%ebp
  100133:	83 ec 08             	sub    $0x8,%esp
  100136:	8b 45 08             	mov    0x8(%ebp),%eax
  100139:	83 78 1c 04          	cmpl   $0x4,0x1c(%eax)
  10013d:	74 15                	je     100154 <syscallHandle+0x24>
  10013f:	83 ec 08             	sub    $0x8,%esp
  100142:	6a 4c                	push   $0x4c
  100144:	68 98 08 10 00       	push   $0x100898
  100149:	e8 d6 fe ff ff       	call   100024 <abort>
  10014e:	83 c4 10             	add    $0x10,%esp
  100151:	c9                   	leave  
  100152:	c3                   	ret    
  100153:	90                   	nop
  100154:	c9                   	leave  
  100155:	e9 62 ff ff ff       	jmp    1000bc <sys_write>
  10015a:	66 90                	xchg   %ax,%ax

0010015c <irqHandle>:
  10015c:	55                   	push   %ebp
  10015d:	89 e5                	mov    %esp,%ebp
  10015f:	83 ec 08             	sub    $0x8,%esp
  100162:	8b 55 08             	mov    0x8(%ebp),%edx
  100165:	b8 10 00 00 00       	mov    $0x10,%eax
  10016a:	8e c0                	mov    %eax,%es
  10016c:	8e d8                	mov    %eax,%ds
  10016e:	8e d0                	mov    %eax,%ss
  100170:	8b 42 20             	mov    0x20(%edx),%eax
  100173:	83 f8 0d             	cmp    $0xd,%eax
  100176:	74 28                	je     1001a0 <irqHandle+0x44>
  100178:	3d 80 00 00 00       	cmp    $0x80,%eax
  10017d:	74 19                	je     100198 <irqHandle+0x3c>
  10017f:	40                   	inc    %eax
  100180:	74 12                	je     100194 <irqHandle+0x38>
  100182:	83 ec 08             	sub    $0x8,%esp
  100185:	6a 1b                	push   $0x1b
  100187:	68 98 08 10 00       	push   $0x100898
  10018c:	e8 93 fe ff ff       	call   100024 <abort>
  100191:	83 c4 10             	add    $0x10,%esp
  100194:	c9                   	leave  
  100195:	c3                   	ret    
  100196:	66 90                	xchg   %ax,%ax
  100198:	89 55 08             	mov    %edx,0x8(%ebp)
  10019b:	c9                   	leave  
  10019c:	eb 92                	jmp    100130 <syscallHandle>
  10019e:	66 90                	xchg   %ax,%ax
  1001a0:	83 ec 08             	sub    $0x8,%esp
  1001a3:	6a 51                	push   $0x51
  1001a5:	68 98 08 10 00       	push   $0x100898
  1001aa:	e8 75 fe ff ff       	call   100024 <abort>
  1001af:	83 c4 10             	add    $0x10,%esp
  1001b2:	c9                   	leave  
  1001b3:	c3                   	ret    

001001b4 <GProtectFaultHandle>:
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
  1001b7:	83 ec 10             	sub    $0x10,%esp
  1001ba:	6a 51                	push   $0x51
  1001bc:	68 98 08 10 00       	push   $0x100898
  1001c1:	e8 5e fe ff ff       	call   100024 <abort>
  1001c6:	83 c4 10             	add    $0x10,%esp
  1001c9:	c9                   	leave  
  1001ca:	c3                   	ret    
  1001cb:	90                   	nop

001001cc <waitDisk>:
  1001cc:	55                   	push   %ebp
  1001cd:	89 e5                	mov    %esp,%ebp
  1001cf:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1001d4:	ec                   	in     (%dx),%al
  1001d5:	83 e0 c0             	and    $0xffffffc0,%eax
  1001d8:	3c 40                	cmp    $0x40,%al
  1001da:	75 f8                	jne    1001d4 <waitDisk+0x8>
  1001dc:	5d                   	pop    %ebp
  1001dd:	c3                   	ret    
  1001de:	66 90                	xchg   %ax,%ax

001001e0 <readSect>:
  1001e0:	55                   	push   %ebp
  1001e1:	89 e5                	mov    %esp,%ebp
  1001e3:	53                   	push   %ebx
  1001e4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1001e7:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1001ec:	ec                   	in     (%dx),%al
  1001ed:	83 e0 c0             	and    $0xffffffc0,%eax
  1001f0:	3c 40                	cmp    $0x40,%al
  1001f2:	75 f8                	jne    1001ec <readSect+0xc>
  1001f4:	ba f2 01 00 00       	mov    $0x1f2,%edx
  1001f9:	b0 01                	mov    $0x1,%al
  1001fb:	ee                   	out    %al,(%dx)
  1001fc:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100201:	88 c8                	mov    %cl,%al
  100203:	ee                   	out    %al,(%dx)
  100204:	89 c8                	mov    %ecx,%eax
  100206:	c1 f8 08             	sar    $0x8,%eax
  100209:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10020e:	ee                   	out    %al,(%dx)
  10020f:	89 c8                	mov    %ecx,%eax
  100211:	c1 f8 10             	sar    $0x10,%eax
  100214:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100219:	ee                   	out    %al,(%dx)
  10021a:	89 c8                	mov    %ecx,%eax
  10021c:	c1 f8 18             	sar    $0x18,%eax
  10021f:	83 c8 e0             	or     $0xffffffe0,%eax
  100222:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100227:	ee                   	out    %al,(%dx)
  100228:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10022d:	b0 20                	mov    $0x20,%al
  10022f:	ee                   	out    %al,(%dx)
  100230:	ec                   	in     (%dx),%al
  100231:	83 e0 c0             	and    $0xffffffc0,%eax
  100234:	3c 40                	cmp    $0x40,%al
  100236:	75 f8                	jne    100230 <readSect+0x50>
  100238:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10023b:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100241:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100246:	66 90                	xchg   %ax,%ax
  100248:	ed                   	in     (%dx),%eax
  100249:	89 01                	mov    %eax,(%ecx)
  10024b:	83 c1 04             	add    $0x4,%ecx
  10024e:	39 d9                	cmp    %ebx,%ecx
  100250:	75 f6                	jne    100248 <readSect+0x68>
  100252:	5b                   	pop    %ebx
  100253:	5d                   	pop    %ebp
  100254:	c3                   	ret    
  100255:	8d 76 00             	lea    0x0(%esi),%esi

00100258 <initSeg>:
  100258:	55                   	push   %ebp
  100259:	89 e5                	mov    %esp,%ebp
  10025b:	b9 60 11 10 00       	mov    $0x101160,%ecx
  100260:	66 c7 05 68 11 10 00 	movw   $0xffff,0x101168
  100267:	ff ff 
  100269:	66 c7 05 6a 11 10 00 	movw   $0x0,0x10116a
  100270:	00 00 
  100272:	c6 05 6c 11 10 00 00 	movb   $0x0,0x10116c
  100279:	c6 05 6d 11 10 00 9a 	movb   $0x9a,0x10116d
  100280:	c6 05 6e 11 10 00 cf 	movb   $0xcf,0x10116e
  100287:	c6 05 6f 11 10 00 00 	movb   $0x0,0x10116f
  10028e:	66 c7 05 70 11 10 00 	movw   $0xffff,0x101170
  100295:	ff ff 
  100297:	66 c7 05 72 11 10 00 	movw   $0x0,0x101172
  10029e:	00 00 
  1002a0:	c6 05 74 11 10 00 00 	movb   $0x0,0x101174
  1002a7:	c6 05 75 11 10 00 92 	movb   $0x92,0x101175
  1002ae:	c6 05 76 11 10 00 cf 	movb   $0xcf,0x101176
  1002b5:	c6 05 77 11 10 00 00 	movb   $0x0,0x101177
  1002bc:	66 c7 05 78 11 10 00 	movw   $0xffff,0x101178
  1002c3:	ff ff 
  1002c5:	66 c7 05 7a 11 10 00 	movw   $0x0,0x10117a
  1002cc:	00 00 
  1002ce:	c6 05 7c 11 10 00 00 	movb   $0x0,0x10117c
  1002d5:	c6 05 7d 11 10 00 fa 	movb   $0xfa,0x10117d
  1002dc:	c6 05 7e 11 10 00 cf 	movb   $0xcf,0x10117e
  1002e3:	c6 05 7f 11 10 00 00 	movb   $0x0,0x10117f
  1002ea:	66 c7 05 80 11 10 00 	movw   $0xffff,0x101180
  1002f1:	ff ff 
  1002f3:	66 c7 05 82 11 10 00 	movw   $0x0,0x101182
  1002fa:	00 00 
  1002fc:	c6 05 84 11 10 00 00 	movb   $0x0,0x101184
  100303:	c6 05 85 11 10 00 f2 	movb   $0xf2,0x101185
  10030a:	c6 05 86 11 10 00 cf 	movb   $0xcf,0x101186
  100311:	c6 05 87 11 10 00 00 	movb   $0x0,0x101187
  100318:	66 c7 05 88 11 10 00 	movw   $0x63,0x101188
  10031f:	63 00 
  100321:	b8 a0 11 10 00       	mov    $0x1011a0,%eax
  100326:	66 a3 8a 11 10 00    	mov    %ax,0x10118a
  10032c:	89 c2                	mov    %eax,%edx
  10032e:	c1 ea 10             	shr    $0x10,%edx
  100331:	88 15 8c 11 10 00    	mov    %dl,0x10118c
  100337:	c6 05 8d 11 10 00 89 	movb   $0x89,0x10118d
  10033e:	c6 05 8e 11 10 00 40 	movb   $0x40,0x10118e
  100345:	c1 e8 18             	shr    $0x18,%eax
  100348:	a2 8f 11 10 00       	mov    %al,0x10118f
  10034d:	a1 ac 08 10 00       	mov    0x1008ac,%eax
  100352:	8b 15 b0 08 10 00    	mov    0x1008b0,%edx
  100358:	a3 90 11 10 00       	mov    %eax,0x101190
  10035d:	89 15 94 11 10 00    	mov    %edx,0x101194
  100363:	66 c7 05 44 11 10 00 	movw   $0x37,0x101144
  10036a:	37 00 
  10036c:	66 89 0d 46 11 10 00 	mov    %cx,0x101146
  100373:	c1 e9 10             	shr    $0x10,%ecx
  100376:	66 89 0d 48 11 10 00 	mov    %cx,0x101148
  10037d:	b8 44 11 10 00       	mov    $0x101144,%eax
  100382:	0f 01 10             	lgdtl  (%eax)
  100385:	c7 05 a8 11 10 00 10 	movl   $0x10,0x1011a8
  10038c:	00 00 00 
  10038f:	c7 05 a4 11 10 00 00 	movl   $0x7f00000,0x1011a4
  100396:	00 f0 07 
  100399:	b8 28 00 00 00       	mov    $0x28,%eax
  10039e:	0f 00 d8             	ltr    %ax
  1003a1:	31 c0                	xor    %eax,%eax
  1003a3:	0f 00 d0             	lldt   %ax
  1003a6:	5d                   	pop    %ebp
  1003a7:	c3                   	ret    

001003a8 <enterUserSpace>:
  1003a8:	55                   	push   %ebp
  1003a9:	89 e5                	mov    %esp,%ebp
  1003ab:	83 ec 10             	sub    $0x10,%esp
  1003ae:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
  1003b5:	b8 23 00 00 00       	mov    $0x23,%eax
  1003ba:	8e c0                	mov    %eax,%es
  1003bc:	8e d8                	mov    %eax,%ds
  1003be:	66 6a 23             	pushw  $0x23
  1003c1:	68 00 00 02 00       	push   $0x20000
  1003c6:	ff 75 fc             	pushl  -0x4(%ebp)
  1003c9:	6a 1b                	push   $0x1b
  1003cb:	ff 75 08             	pushl  0x8(%ebp)
  1003ce:	cf                   	iret   
  1003cf:	c9                   	leave  
  1003d0:	c3                   	ret    
  1003d1:	8d 76 00             	lea    0x0(%esi),%esi

001003d4 <loadUMain>:
  1003d4:	55                   	push   %ebp
  1003d5:	89 e5                	mov    %esp,%ebp
  1003d7:	57                   	push   %edi
  1003d8:	56                   	push   %esi
  1003d9:	53                   	push   %ebx
  1003da:	81 ec 00 90 01 00    	sub    $0x19000,%esp
  1003e0:	be c9 00 00 00       	mov    $0xc9,%esi
  1003e5:	8d 9d f4 6f fe ff    	lea    -0x1900c(%ebp),%ebx
  1003eb:	90                   	nop
  1003ec:	56                   	push   %esi
  1003ed:	53                   	push   %ebx
  1003ee:	e8 ed fd ff ff       	call   1001e0 <readSect>
  1003f3:	81 c3 00 02 00 00    	add    $0x200,%ebx
  1003f9:	46                   	inc    %esi
  1003fa:	58                   	pop    %eax
  1003fb:	5a                   	pop    %edx
  1003fc:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1003ff:	39 c3                	cmp    %eax,%ebx
  100401:	75 e9                	jne    1003ec <loadUMain+0x18>
  100403:	8d 95 f4 6f fe ff    	lea    -0x1900c(%ebp),%edx
  100409:	03 95 10 70 fe ff    	add    -0x18ff0(%ebp),%edx
  10040f:	0f b7 9d 20 70 fe ff 	movzwl -0x18fe0(%ebp),%ebx
  100416:	c1 e3 05             	shl    $0x5,%ebx
  100419:	01 d3                	add    %edx,%ebx
  10041b:	31 c0                	xor    %eax,%eax
  10041d:	39 da                	cmp    %ebx,%edx
  10041f:	72 0a                	jb     10042b <loadUMain+0x57>
  100421:	eb 34                	jmp    100457 <loadUMain+0x83>
  100423:	90                   	nop
  100424:	83 c2 20             	add    $0x20,%edx
  100427:	39 d3                	cmp    %edx,%ebx
  100429:	76 2c                	jbe    100457 <loadUMain+0x83>
  10042b:	83 3a 01             	cmpl   $0x1,(%edx)
  10042e:	75 f4                	jne    100424 <loadUMain+0x50>
  100430:	8d b5 f4 6f fe ff    	lea    -0x1900c(%ebp),%esi
  100436:	03 72 04             	add    0x4(%edx),%esi
  100439:	8b 4a 10             	mov    0x10(%edx),%ecx
  10043c:	8b 7a 08             	mov    0x8(%edx),%edi
  10043f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  100441:	8b 72 10             	mov    0x10(%edx),%esi
  100444:	8b 4a 14             	mov    0x14(%edx),%ecx
  100447:	29 f1                	sub    %esi,%ecx
  100449:	03 72 08             	add    0x8(%edx),%esi
  10044c:	89 f7                	mov    %esi,%edi
  10044e:	f3 aa                	rep stos %al,%es:(%edi)
  100450:	83 c2 20             	add    $0x20,%edx
  100453:	39 d3                	cmp    %edx,%ebx
  100455:	77 d4                	ja     10042b <loadUMain+0x57>
  100457:	ff b5 0c 70 fe ff    	pushl  -0x18ff4(%ebp)
  10045d:	e8 46 ff ff ff       	call   1003a8 <enterUserSpace>
  100462:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100465:	5b                   	pop    %ebx
  100466:	5e                   	pop    %esi
  100467:	5f                   	pop    %edi
  100468:	5d                   	pop    %ebp
  100469:	c3                   	ret    
  10046a:	66 90                	xchg   %ax,%ax

0010046c <initIdt>:
  10046c:	55                   	push   %ebp
  10046d:	89 e5                	mov    %esp,%ebp
  10046f:	53                   	push   %ebx
  100470:	ba 29 08 10 00       	mov    $0x100829,%edx
  100475:	89 d3                	mov    %edx,%ebx
  100477:	c1 ea 10             	shr    $0x10,%edx
  10047a:	b9 20 1a 10 00       	mov    $0x101a20,%ecx
  10047f:	b8 20 12 10 00       	mov    $0x101220,%eax
  100484:	66 89 18             	mov    %bx,(%eax)
  100487:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  10048d:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100491:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100495:	66 89 50 06          	mov    %dx,0x6(%eax)
  100499:	83 c0 08             	add    $0x8,%eax
  10049c:	39 c1                	cmp    %eax,%ecx
  10049e:	75 e4                	jne    100484 <initIdt+0x18>
  1004a0:	b8 2f 08 10 00       	mov    $0x10082f,%eax
  1004a5:	66 a3 20 12 10 00    	mov    %ax,0x101220
  1004ab:	66 c7 05 22 12 10 00 	movw   $0x8,0x101222
  1004b2:	08 00 
  1004b4:	c6 05 24 12 10 00 00 	movb   $0x0,0x101224
  1004bb:	c6 05 25 12 10 00 8f 	movb   $0x8f,0x101225
  1004c2:	c1 e8 10             	shr    $0x10,%eax
  1004c5:	66 a3 26 12 10 00    	mov    %ax,0x101226
  1004cb:	b8 35 08 10 00       	mov    $0x100835,%eax
  1004d0:	66 a3 28 12 10 00    	mov    %ax,0x101228
  1004d6:	66 c7 05 2a 12 10 00 	movw   $0x8,0x10122a
  1004dd:	08 00 
  1004df:	c6 05 2c 12 10 00 00 	movb   $0x0,0x10122c
  1004e6:	c6 05 2d 12 10 00 8f 	movb   $0x8f,0x10122d
  1004ed:	c1 e8 10             	shr    $0x10,%eax
  1004f0:	66 a3 2e 12 10 00    	mov    %ax,0x10122e
  1004f6:	b8 3b 08 10 00       	mov    $0x10083b,%eax
  1004fb:	66 a3 30 12 10 00    	mov    %ax,0x101230
  100501:	66 c7 05 32 12 10 00 	movw   $0x8,0x101232
  100508:	08 00 
  10050a:	c6 05 34 12 10 00 00 	movb   $0x0,0x101234
  100511:	c6 05 35 12 10 00 8f 	movb   $0x8f,0x101235
  100518:	c1 e8 10             	shr    $0x10,%eax
  10051b:	66 a3 36 12 10 00    	mov    %ax,0x101236
  100521:	b8 41 08 10 00       	mov    $0x100841,%eax
  100526:	66 a3 38 12 10 00    	mov    %ax,0x101238
  10052c:	66 c7 05 3a 12 10 00 	movw   $0x8,0x10123a
  100533:	08 00 
  100535:	c6 05 3c 12 10 00 00 	movb   $0x0,0x10123c
  10053c:	c6 05 3d 12 10 00 8f 	movb   $0x8f,0x10123d
  100543:	c1 e8 10             	shr    $0x10,%eax
  100546:	66 a3 3e 12 10 00    	mov    %ax,0x10123e
  10054c:	b8 47 08 10 00       	mov    $0x100847,%eax
  100551:	66 a3 40 12 10 00    	mov    %ax,0x101240
  100557:	66 c7 05 42 12 10 00 	movw   $0x8,0x101242
  10055e:	08 00 
  100560:	c6 05 44 12 10 00 00 	movb   $0x0,0x101244
  100567:	c6 05 45 12 10 00 8f 	movb   $0x8f,0x101245
  10056e:	c1 e8 10             	shr    $0x10,%eax
  100571:	66 a3 46 12 10 00    	mov    %ax,0x101246
  100577:	b8 4d 08 10 00       	mov    $0x10084d,%eax
  10057c:	66 a3 48 12 10 00    	mov    %ax,0x101248
  100582:	66 c7 05 4a 12 10 00 	movw   $0x8,0x10124a
  100589:	08 00 
  10058b:	c6 05 4c 12 10 00 00 	movb   $0x0,0x10124c
  100592:	c6 05 4d 12 10 00 8f 	movb   $0x8f,0x10124d
  100599:	c1 e8 10             	shr    $0x10,%eax
  10059c:	66 a3 4e 12 10 00    	mov    %ax,0x10124e
  1005a2:	b8 53 08 10 00       	mov    $0x100853,%eax
  1005a7:	66 a3 50 12 10 00    	mov    %ax,0x101250
  1005ad:	66 c7 05 52 12 10 00 	movw   $0x8,0x101252
  1005b4:	08 00 
  1005b6:	c6 05 54 12 10 00 00 	movb   $0x0,0x101254
  1005bd:	c6 05 55 12 10 00 8f 	movb   $0x8f,0x101255
  1005c4:	c1 e8 10             	shr    $0x10,%eax
  1005c7:	66 a3 56 12 10 00    	mov    %ax,0x101256
  1005cd:	b8 59 08 10 00       	mov    $0x100859,%eax
  1005d2:	66 a3 58 12 10 00    	mov    %ax,0x101258
  1005d8:	66 c7 05 5a 12 10 00 	movw   $0x8,0x10125a
  1005df:	08 00 
  1005e1:	c6 05 5c 12 10 00 00 	movb   $0x0,0x10125c
  1005e8:	c6 05 5d 12 10 00 8f 	movb   $0x8f,0x10125d
  1005ef:	c1 e8 10             	shr    $0x10,%eax
  1005f2:	66 a3 5e 12 10 00    	mov    %ax,0x10125e
  1005f8:	b8 5f 08 10 00       	mov    $0x10085f,%eax
  1005fd:	66 a3 60 12 10 00    	mov    %ax,0x101260
  100603:	66 c7 05 62 12 10 00 	movw   $0x8,0x101262
  10060a:	08 00 
  10060c:	c6 05 64 12 10 00 00 	movb   $0x0,0x101264
  100613:	c6 05 65 12 10 00 8f 	movb   $0x8f,0x101265
  10061a:	c1 e8 10             	shr    $0x10,%eax
  10061d:	66 a3 66 12 10 00    	mov    %ax,0x101266
  100623:	b8 63 08 10 00       	mov    $0x100863,%eax
  100628:	66 a3 68 12 10 00    	mov    %ax,0x101268
  10062e:	66 c7 05 6a 12 10 00 	movw   $0x8,0x10126a
  100635:	08 00 
  100637:	c6 05 6c 12 10 00 00 	movb   $0x0,0x10126c
  10063e:	c6 05 6d 12 10 00 8f 	movb   $0x8f,0x10126d
  100645:	c1 e8 10             	shr    $0x10,%eax
  100648:	66 a3 6e 12 10 00    	mov    %ax,0x10126e
  10064e:	b8 69 08 10 00       	mov    $0x100869,%eax
  100653:	66 a3 70 12 10 00    	mov    %ax,0x101270
  100659:	66 c7 05 72 12 10 00 	movw   $0x8,0x101272
  100660:	08 00 
  100662:	c6 05 74 12 10 00 00 	movb   $0x0,0x101274
  100669:	c6 05 75 12 10 00 8f 	movb   $0x8f,0x101275
  100670:	c1 e8 10             	shr    $0x10,%eax
  100673:	66 a3 76 12 10 00    	mov    %ax,0x101276
  100679:	b8 6d 08 10 00       	mov    $0x10086d,%eax
  10067e:	66 a3 78 12 10 00    	mov    %ax,0x101278
  100684:	66 c7 05 7a 12 10 00 	movw   $0x8,0x10127a
  10068b:	08 00 
  10068d:	c6 05 7c 12 10 00 00 	movb   $0x0,0x10127c
  100694:	c6 05 7d 12 10 00 8f 	movb   $0x8f,0x10127d
  10069b:	c1 e8 10             	shr    $0x10,%eax
  10069e:	66 a3 7e 12 10 00    	mov    %ax,0x10127e
  1006a4:	b8 71 08 10 00       	mov    $0x100871,%eax
  1006a9:	66 a3 80 12 10 00    	mov    %ax,0x101280
  1006af:	66 c7 05 82 12 10 00 	movw   $0x8,0x101282
  1006b6:	08 00 
  1006b8:	c6 05 84 12 10 00 00 	movb   $0x0,0x101284
  1006bf:	c6 05 85 12 10 00 8f 	movb   $0x8f,0x101285
  1006c6:	c1 e8 10             	shr    $0x10,%eax
  1006c9:	66 a3 86 12 10 00    	mov    %ax,0x101286
  1006cf:	b8 75 08 10 00       	mov    $0x100875,%eax
  1006d4:	66 a3 90 12 10 00    	mov    %ax,0x101290
  1006da:	66 c7 05 92 12 10 00 	movw   $0x8,0x101292
  1006e1:	08 00 
  1006e3:	c6 05 94 12 10 00 00 	movb   $0x0,0x101294
  1006ea:	c6 05 95 12 10 00 8f 	movb   $0x8f,0x101295
  1006f1:	c1 e8 10             	shr    $0x10,%eax
  1006f4:	66 a3 96 12 10 00    	mov    %ax,0x101296
  1006fa:	b8 79 08 10 00       	mov    $0x100879,%eax
  1006ff:	66 a3 88 12 10 00    	mov    %ax,0x101288
  100705:	66 c7 05 8a 12 10 00 	movw   $0x8,0x10128a
  10070c:	08 00 
  10070e:	c6 05 8c 12 10 00 00 	movb   $0x0,0x10128c
  100715:	c6 05 8d 12 10 00 8f 	movb   $0x8f,0x10128d
  10071c:	c1 e8 10             	shr    $0x10,%eax
  10071f:	66 a3 8e 12 10 00    	mov    %ax,0x10128e
  100725:	b8 7d 08 10 00       	mov    $0x10087d,%eax
  10072a:	66 a3 20 16 10 00    	mov    %ax,0x101620
  100730:	66 c7 05 22 16 10 00 	movw   $0x8,0x101622
  100737:	08 00 
  100739:	c6 05 24 16 10 00 00 	movb   $0x0,0x101624
  100740:	c6 05 25 16 10 00 ee 	movb   $0xee,0x101625
  100747:	c1 e8 10             	shr    $0x10,%eax
  10074a:	66 a3 26 16 10 00    	mov    %ax,0x101626
  100750:	66 c7 05 4c 11 10 00 	movw   $0x7ff,0x10114c
  100757:	ff 07 
  100759:	b8 20 12 10 00       	mov    $0x101220,%eax
  10075e:	66 a3 4e 11 10 00    	mov    %ax,0x10114e
  100764:	c1 e8 10             	shr    $0x10,%eax
  100767:	66 a3 50 11 10 00    	mov    %ax,0x101150
  10076d:	b8 4c 11 10 00       	mov    $0x10114c,%eax
  100772:	0f 01 18             	lidtl  (%eax)
  100775:	5b                   	pop    %ebx
  100776:	5d                   	pop    %ebp
  100777:	c3                   	ret    

00100778 <initSerial>:
  100778:	55                   	push   %ebp
  100779:	89 e5                	mov    %esp,%ebp
  10077b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100780:	31 c0                	xor    %eax,%eax
  100782:	ee                   	out    %al,(%dx)
  100783:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100788:	b0 80                	mov    $0x80,%al
  10078a:	ee                   	out    %al,(%dx)
  10078b:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100790:	b0 01                	mov    $0x1,%al
  100792:	ee                   	out    %al,(%dx)
  100793:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100798:	31 c0                	xor    %eax,%eax
  10079a:	ee                   	out    %al,(%dx)
  10079b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1007a0:	b0 03                	mov    $0x3,%al
  1007a2:	ee                   	out    %al,(%dx)
  1007a3:	ba fa 03 00 00       	mov    $0x3fa,%edx
  1007a8:	b0 c7                	mov    $0xc7,%al
  1007aa:	ee                   	out    %al,(%dx)
  1007ab:	ba fc 03 00 00       	mov    $0x3fc,%edx
  1007b0:	b0 0b                	mov    $0xb,%al
  1007b2:	ee                   	out    %al,(%dx)
  1007b3:	5d                   	pop    %ebp
  1007b4:	c3                   	ret    
  1007b5:	8d 76 00             	lea    0x0(%esi),%esi

001007b8 <putChar>:
  1007b8:	55                   	push   %ebp
  1007b9:	89 e5                	mov    %esp,%ebp
  1007bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1007be:	ba fd 03 00 00       	mov    $0x3fd,%edx
  1007c3:	90                   	nop
  1007c4:	ec                   	in     (%dx),%al
  1007c5:	a8 20                	test   $0x20,%al
  1007c7:	74 fb                	je     1007c4 <putChar+0xc>
  1007c9:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1007ce:	88 c8                	mov    %cl,%al
  1007d0:	ee                   	out    %al,(%dx)
  1007d1:	5d                   	pop    %ebp
  1007d2:	c3                   	ret    
  1007d3:	90                   	nop

001007d4 <initIntr>:
  1007d4:	55                   	push   %ebp
  1007d5:	89 e5                	mov    %esp,%ebp
  1007d7:	ba 21 00 00 00       	mov    $0x21,%edx
  1007dc:	b0 ff                	mov    $0xff,%al
  1007de:	ee                   	out    %al,(%dx)
  1007df:	ba a1 00 00 00       	mov    $0xa1,%edx
  1007e4:	ee                   	out    %al,(%dx)
  1007e5:	ba 20 00 00 00       	mov    $0x20,%edx
  1007ea:	b0 11                	mov    $0x11,%al
  1007ec:	ee                   	out    %al,(%dx)
  1007ed:	ba 21 00 00 00       	mov    $0x21,%edx
  1007f2:	b0 20                	mov    $0x20,%al
  1007f4:	ee                   	out    %al,(%dx)
  1007f5:	b0 04                	mov    $0x4,%al
  1007f7:	ee                   	out    %al,(%dx)
  1007f8:	b0 03                	mov    $0x3,%al
  1007fa:	ee                   	out    %al,(%dx)
  1007fb:	ba a0 00 00 00       	mov    $0xa0,%edx
  100800:	b0 11                	mov    $0x11,%al
  100802:	ee                   	out    %al,(%dx)
  100803:	ba a1 00 00 00       	mov    $0xa1,%edx
  100808:	b0 28                	mov    $0x28,%al
  10080a:	ee                   	out    %al,(%dx)
  10080b:	b0 02                	mov    $0x2,%al
  10080d:	ee                   	out    %al,(%dx)
  10080e:	b0 03                	mov    $0x3,%al
  100810:	ee                   	out    %al,(%dx)
  100811:	ba 20 00 00 00       	mov    $0x20,%edx
  100816:	b0 68                	mov    $0x68,%al
  100818:	ee                   	out    %al,(%dx)
  100819:	b0 0a                	mov    $0xa,%al
  10081b:	ee                   	out    %al,(%dx)
  10081c:	ba a0 00 00 00       	mov    $0xa0,%edx
  100821:	b0 68                	mov    $0x68,%al
  100823:	ee                   	out    %al,(%dx)
  100824:	b0 0a                	mov    $0xa,%al
  100826:	ee                   	out    %al,(%dx)
  100827:	5d                   	pop    %ebp
  100828:	c3                   	ret    

00100829 <irqEmpty>:
  100829:	6a 00                	push   $0x0
  10082b:	6a ff                	push   $0xffffffff
  10082d:	eb 57                	jmp    100886 <asmDoIrq>

0010082f <irqDivError>:
  10082f:	6a 00                	push   $0x0
  100831:	6a 00                	push   $0x0
  100833:	eb 51                	jmp    100886 <asmDoIrq>

00100835 <irqStepOver>:
  100835:	6a 00                	push   $0x0
  100837:	6a 01                	push   $0x1
  100839:	eb 4b                	jmp    100886 <asmDoIrq>

0010083b <irqNMIInterrupt>:
  10083b:	6a 00                	push   $0x0
  10083d:	6a 02                	push   $0x2
  10083f:	eb 45                	jmp    100886 <asmDoIrq>

00100841 <irqBreakPoint>:
  100841:	6a 00                	push   $0x0
  100843:	6a 03                	push   $0x3
  100845:	eb 3f                	jmp    100886 <asmDoIrq>

00100847 <irqOverflow>:
  100847:	6a 00                	push   $0x0
  100849:	6a 04                	push   $0x4
  10084b:	eb 39                	jmp    100886 <asmDoIrq>

0010084d <irqBoundTest>:
  10084d:	6a 00                	push   $0x0
  10084f:	6a 05                	push   $0x5
  100851:	eb 33                	jmp    100886 <asmDoIrq>

00100853 <irqInvalidOperation>:
  100853:	6a 00                	push   $0x0
  100855:	6a 06                	push   $0x6
  100857:	eb 2d                	jmp    100886 <asmDoIrq>

00100859 <irqNoCoprocessor>:
  100859:	6a 00                	push   $0x0
  10085b:	6a 07                	push   $0x7
  10085d:	eb 27                	jmp    100886 <asmDoIrq>

0010085f <irqDoubleFault>:
  10085f:	6a 08                	push   $0x8
  100861:	eb 23                	jmp    100886 <asmDoIrq>

00100863 <irqCoprocessorOutofBound>:
  100863:	6a 00                	push   $0x0
  100865:	6a 09                	push   $0x9
  100867:	eb 1d                	jmp    100886 <asmDoIrq>

00100869 <irqInvalidTSS>:
  100869:	6a 0a                	push   $0xa
  10086b:	eb 19                	jmp    100886 <asmDoIrq>

0010086d <irqNoSegment>:
  10086d:	6a 0b                	push   $0xb
  10086f:	eb 15                	jmp    100886 <asmDoIrq>

00100871 <irqStackSegmentFault>:
  100871:	6a 0c                	push   $0xc
  100873:	eb 11                	jmp    100886 <asmDoIrq>

00100875 <irqPageFault>:
  100875:	6a 0e                	push   $0xe
  100877:	eb 0d                	jmp    100886 <asmDoIrq>

00100879 <irqGProtectFault>:
  100879:	6a 0d                	push   $0xd
  10087b:	eb 09                	jmp    100886 <asmDoIrq>

0010087d <irqSyscall>:
  10087d:	6a 00                	push   $0x0
  10087f:	68 80 00 00 00       	push   $0x80
  100884:	eb 00                	jmp    100886 <asmDoIrq>

00100886 <asmDoIrq>:
  100886:	60                   	pusha  
  100887:	54                   	push   %esp
  100888:	e8 cf f8 ff ff       	call   10015c <irqHandle>
  10088d:	83 c4 04             	add    $0x4,%esp
  100890:	61                   	popa   
  100891:	83 c4 04             	add    $0x4,%esp
  100894:	83 c4 04             	add    $0x4,%esp
  100897:	cf                   	iret   
