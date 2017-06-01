
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	53                   	push   %ebx
  200005:	e8 da 03 00 00       	call   2003e4 <fork>
  20000a:	85 c0                	test   %eax,%eax
  20000c:	75 4a                	jne    200058 <uEntry+0x58>
  20000e:	c7 05 30 17 20 00 02 	movl   $0x2,0x201730
  200015:	00 00 00 
  200018:	b8 02 00 00 00       	mov    $0x2,%eax
  20001d:	bb 08 00 00 00       	mov    $0x8,%ebx
  200022:	eb 05                	jmp    200029 <uEntry+0x29>
  200024:	a1 30 17 20 00       	mov    0x201730,%eax
  200029:	4b                   	dec    %ebx
  20002a:	51                   	push   %ecx
  20002b:	53                   	push   %ebx
  20002c:	50                   	push   %eax
  20002d:	68 70 04 20 00       	push   $0x200470
  200032:	e8 6d 02 00 00       	call   2002a4 <printf>
  200037:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  20003e:	e8 b9 03 00 00       	call   2003fc <sleep>
  200043:	83 c4 10             	add    $0x10,%esp
  200046:	85 db                	test   %ebx,%ebx
  200048:	75 da                	jne    200024 <uEntry+0x24>
  20004a:	e8 c5 03 00 00       	call   200414 <exit>
  20004f:	31 c0                	xor    %eax,%eax
  200051:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  200054:	c9                   	leave  
  200055:	c3                   	ret    
  200056:	66 90                	xchg   %ax,%ax
  200058:	40                   	inc    %eax
  200059:	74 f4                	je     20004f <uEntry+0x4f>
  20005b:	c7 05 30 17 20 00 01 	movl   $0x1,0x201730
  200062:	00 00 00 
  200065:	b8 01 00 00 00       	mov    $0x1,%eax
  20006a:	bb 08 00 00 00       	mov    $0x8,%ebx
  20006f:	eb 08                	jmp    200079 <uEntry+0x79>
  200071:	8d 76 00             	lea    0x0(%esi),%esi
  200074:	a1 30 17 20 00       	mov    0x201730,%eax
  200079:	4b                   	dec    %ebx
  20007a:	52                   	push   %edx
  20007b:	53                   	push   %ebx
  20007c:	50                   	push   %eax
  20007d:	68 8d 04 20 00       	push   $0x20048d
  200082:	e8 1d 02 00 00       	call   2002a4 <printf>
  200087:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  20008e:	e8 69 03 00 00       	call   2003fc <sleep>
  200093:	83 c4 10             	add    $0x10,%esp
  200096:	85 db                	test   %ebx,%ebx
  200098:	75 da                	jne    200074 <uEntry+0x74>
  20009a:	eb ae                	jmp    20004a <uEntry+0x4a>

0020009c <syscall>:
  20009c:	55                   	push   %ebp
  20009d:	89 e5                	mov    %esp,%ebp
  20009f:	57                   	push   %edi
  2000a0:	56                   	push   %esi
  2000a1:	53                   	push   %ebx
  2000a2:	8b 55 14             	mov    0x14(%ebp),%edx
  2000a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2000a8:	8b 45 08             	mov    0x8(%ebp),%eax
  2000ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2000ae:	8b 7d 18             	mov    0x18(%ebp),%edi
  2000b1:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2000b4:	cd 80                	int    $0x80
  2000b6:	5b                   	pop    %ebx
  2000b7:	5e                   	pop    %esi
  2000b8:	5f                   	pop    %edi
  2000b9:	5d                   	pop    %ebp
  2000ba:	c3                   	ret    
  2000bb:	90                   	nop

002000bc <printchar>:
  2000bc:	55                   	push   %ebp
  2000bd:	89 e5                	mov    %esp,%ebp
  2000bf:	57                   	push   %edi
  2000c0:	56                   	push   %esi
  2000c1:	53                   	push   %ebx
  2000c2:	0f be 4d 08          	movsbl 0x8(%ebp),%ecx
  2000c6:	31 d2                	xor    %edx,%edx
  2000c8:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000cd:	b8 04 00 00 00       	mov    $0x4,%eax
  2000d2:	89 d7                	mov    %edx,%edi
  2000d4:	89 d6                	mov    %edx,%esi
  2000d6:	cd 80                	int    $0x80
  2000d8:	5b                   	pop    %ebx
  2000d9:	5e                   	pop    %esi
  2000da:	5f                   	pop    %edi
  2000db:	5d                   	pop    %ebp
  2000dc:	c3                   	ret    
  2000dd:	8d 76 00             	lea    0x0(%esi),%esi

002000e0 <printstr>:
  2000e0:	55                   	push   %ebp
  2000e1:	89 e5                	mov    %esp,%ebp
  2000e3:	57                   	push   %edi
  2000e4:	56                   	push   %esi
  2000e5:	53                   	push   %ebx
  2000e6:	8b 45 08             	mov    0x8(%ebp),%eax
  2000e9:	0f be 08             	movsbl (%eax),%ecx
  2000ec:	84 c9                	test   %cl,%cl
  2000ee:	74 22                	je     200112 <printstr+0x32>
  2000f0:	bb 01 00 00 00       	mov    $0x1,%ebx
  2000f5:	8d 76 00             	lea    0x0(%esi),%esi
  2000f8:	31 d2                	xor    %edx,%edx
  2000fa:	b8 04 00 00 00       	mov    $0x4,%eax
  2000ff:	89 d7                	mov    %edx,%edi
  200101:	89 d6                	mov    %edx,%esi
  200103:	cd 80                	int    $0x80
  200105:	ff 45 08             	incl   0x8(%ebp)
  200108:	8b 45 08             	mov    0x8(%ebp),%eax
  20010b:	0f be 08             	movsbl (%eax),%ecx
  20010e:	84 c9                	test   %cl,%cl
  200110:	75 e6                	jne    2000f8 <printstr+0x18>
  200112:	5b                   	pop    %ebx
  200113:	5e                   	pop    %esi
  200114:	5f                   	pop    %edi
  200115:	5d                   	pop    %ebp
  200116:	c3                   	ret    
  200117:	90                   	nop

00200118 <printint>:
  200118:	55                   	push   %ebp
  200119:	89 e5                	mov    %esp,%ebp
  20011b:	57                   	push   %edi
  20011c:	56                   	push   %esi
  20011d:	53                   	push   %ebx
  20011e:	83 ec 3c             	sub    $0x3c,%esp
  200121:	8b 75 08             	mov    0x8(%ebp),%esi
  200124:	85 f6                	test   %esi,%esi
  200126:	78 54                	js     20017c <printint+0x64>
  200128:	75 0a                	jne    200134 <printint+0x1c>
  20012a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20012d:	5b                   	pop    %ebx
  20012e:	5e                   	pop    %esi
  20012f:	5f                   	pop    %edi
  200130:	5d                   	pop    %ebp
  200131:	c3                   	ret    
  200132:	66 90                	xchg   %ax,%ax
  200134:	83 ec 0c             	sub    $0xc,%esp
  200137:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20013c:	f7 ee                	imul   %esi
  20013e:	89 d3                	mov    %edx,%ebx
  200140:	c1 fb 02             	sar    $0x2,%ebx
  200143:	89 f0                	mov    %esi,%eax
  200145:	c1 f8 1f             	sar    $0x1f,%eax
  200148:	29 c3                	sub    %eax,%ebx
  20014a:	53                   	push   %ebx
  20014b:	e8 c8 ff ff ff       	call   200118 <printint>
  200150:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
  200153:	01 c0                	add    %eax,%eax
  200155:	29 c6                	sub    %eax,%esi
  200157:	8d 4e 30             	lea    0x30(%esi),%ecx
  20015a:	0f b6 c9             	movzbl %cl,%ecx
  20015d:	31 d2                	xor    %edx,%edx
  20015f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200164:	b8 04 00 00 00       	mov    $0x4,%eax
  200169:	89 d7                	mov    %edx,%edi
  20016b:	89 d6                	mov    %edx,%esi
  20016d:	cd 80                	int    $0x80
  20016f:	83 c4 10             	add    $0x10,%esp
  200172:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200175:	5b                   	pop    %ebx
  200176:	5e                   	pop    %esi
  200177:	5f                   	pop    %edi
  200178:	5d                   	pop    %ebp
  200179:	c3                   	ret    
  20017a:	66 90                	xchg   %ax,%ax
  20017c:	81 fe 00 00 00 80    	cmp    $0x80000000,%esi
  200182:	0f 84 9c 00 00 00    	je     200224 <printint+0x10c>
  200188:	f7 de                	neg    %esi
  20018a:	31 c9                	xor    %ecx,%ecx
  20018c:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  20018f:	89 45 c0             	mov    %eax,-0x40(%ebp)
  200192:	bf 0a 00 00 00       	mov    $0xa,%edi
  200197:	bb 67 66 66 66       	mov    $0x66666667,%ebx
  20019c:	eb 05                	jmp    2001a3 <printint+0x8b>
  20019e:	66 90                	xchg   %ax,%ax
  2001a0:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
  2001a3:	89 f0                	mov    %esi,%eax
  2001a5:	99                   	cltd   
  2001a6:	f7 ff                	idiv   %edi
  2001a8:	8d 42 30             	lea    0x30(%edx),%eax
  2001ab:	88 45 bf             	mov    %al,-0x41(%ebp)
  2001ae:	8b 55 c0             	mov    -0x40(%ebp),%edx
  2001b1:	88 04 0a             	mov    %al,(%edx,%ecx,1)
  2001b4:	8d 41 01             	lea    0x1(%ecx),%eax
  2001b7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  2001ba:	89 f0                	mov    %esi,%eax
  2001bc:	f7 eb                	imul   %ebx
  2001be:	89 d0                	mov    %edx,%eax
  2001c0:	c1 f8 02             	sar    $0x2,%eax
  2001c3:	c1 fe 1f             	sar    $0x1f,%esi
  2001c6:	29 f0                	sub    %esi,%eax
  2001c8:	89 c6                	mov    %eax,%esi
  2001ca:	75 d4                	jne    2001a0 <printint+0x88>
  2001cc:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  2001cf:	b9 2d 00 00 00       	mov    $0x2d,%ecx
  2001d4:	bb 01 00 00 00       	mov    $0x1,%ebx
  2001d9:	b8 04 00 00 00       	mov    $0x4,%eax
  2001de:	89 f2                	mov    %esi,%edx
  2001e0:	89 f7                	mov    %esi,%edi
  2001e2:	cd 80                	int    $0x80
  2001e4:	8b 45 c0             	mov    -0x40(%ebp),%eax
  2001e7:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
  2001ea:	8d 44 18 ff          	lea    -0x1(%eax,%ebx,1),%eax
  2001ee:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  2001f1:	bb 01 00 00 00       	mov    $0x1,%ebx
  2001f6:	8a 45 bf             	mov    -0x41(%ebp),%al
  2001f9:	eb 07                	jmp    200202 <printint+0xea>
  2001fb:	90                   	nop
  2001fc:	8a 07                	mov    (%edi),%al
  2001fe:	4f                   	dec    %edi
  2001ff:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  200202:	0f be c8             	movsbl %al,%ecx
  200205:	31 d2                	xor    %edx,%edx
  200207:	b8 04 00 00 00       	mov    $0x4,%eax
  20020c:	89 d7                	mov    %edx,%edi
  20020e:	89 d6                	mov    %edx,%esi
  200210:	cd 80                	int    $0x80
  200212:	8d 4d d3             	lea    -0x2d(%ebp),%ecx
  200215:	8b 7d c4             	mov    -0x3c(%ebp),%edi
  200218:	39 f9                	cmp    %edi,%ecx
  20021a:	75 e0                	jne    2001fc <printint+0xe4>
  20021c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20021f:	5b                   	pop    %ebx
  200220:	5e                   	pop    %esi
  200221:	5f                   	pop    %edi
  200222:	5d                   	pop    %ebp
  200223:	c3                   	ret    
  200224:	8d 7d d4             	lea    -0x2c(%ebp),%edi
  200227:	89 7d c0             	mov    %edi,-0x40(%ebp)
  20022a:	be ab 04 20 00       	mov    $0x2004ab,%esi
  20022f:	b9 03 00 00 00       	mov    $0x3,%ecx
  200234:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  200236:	8a 45 de             	mov    -0x22(%ebp),%al
  200239:	88 45 bf             	mov    %al,-0x41(%ebp)
  20023c:	c7 45 c4 0a 00 00 00 	movl   $0xa,-0x3c(%ebp)
  200243:	eb 9f                	jmp    2001e4 <printint+0xcc>
  200245:	8d 76 00             	lea    0x0(%esi),%esi

00200248 <printhex>:
  200248:	55                   	push   %ebp
  200249:	89 e5                	mov    %esp,%ebp
  20024b:	8b 45 08             	mov    0x8(%ebp),%eax
  20024e:	85 c0                	test   %eax,%eax
  200250:	75 02                	jne    200254 <printhex+0xc>
  200252:	5d                   	pop    %ebp
  200253:	c3                   	ret    
  200254:	5d                   	pop    %ebp
  200255:	eb 01                	jmp    200258 <printhex.part.1>
  200257:	90                   	nop

00200258 <printhex.part.1>:
  200258:	55                   	push   %ebp
  200259:	89 e5                	mov    %esp,%ebp
  20025b:	57                   	push   %edi
  20025c:	56                   	push   %esi
  20025d:	53                   	push   %ebx
  20025e:	83 ec 18             	sub    $0x18,%esp
  200261:	89 c3                	mov    %eax,%ebx
  200263:	89 c2                	mov    %eax,%edx
  200265:	c1 ea 04             	shr    $0x4,%edx
  200268:	52                   	push   %edx
  200269:	e8 da ff ff ff       	call   200248 <printhex>
  20026e:	89 d8                	mov    %ebx,%eax
  200270:	83 e0 0f             	and    $0xf,%eax
  200273:	83 c4 10             	add    $0x10,%esp
  200276:	83 f8 09             	cmp    $0x9,%eax
  200279:	76 21                	jbe    20029c <printhex.part.1+0x44>
  20027b:	83 c0 57             	add    $0x57,%eax
  20027e:	0f b6 c8             	movzbl %al,%ecx
  200281:	31 d2                	xor    %edx,%edx
  200283:	bb 01 00 00 00       	mov    $0x1,%ebx
  200288:	b8 04 00 00 00       	mov    $0x4,%eax
  20028d:	89 d7                	mov    %edx,%edi
  20028f:	89 d6                	mov    %edx,%esi
  200291:	cd 80                	int    $0x80
  200293:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200296:	5b                   	pop    %ebx
  200297:	5e                   	pop    %esi
  200298:	5f                   	pop    %edi
  200299:	5d                   	pop    %ebp
  20029a:	c3                   	ret    
  20029b:	90                   	nop
  20029c:	8d 48 30             	lea    0x30(%eax),%ecx
  20029f:	eb e0                	jmp    200281 <printhex.part.1+0x29>
  2002a1:	8d 76 00             	lea    0x0(%esi),%esi

002002a4 <printf>:
  2002a4:	55                   	push   %ebp
  2002a5:	89 e5                	mov    %esp,%ebp
  2002a7:	57                   	push   %edi
  2002a8:	56                   	push   %esi
  2002a9:	53                   	push   %ebx
  2002aa:	83 ec 1c             	sub    $0x1c,%esp
  2002ad:	8d 45 0c             	lea    0xc(%ebp),%eax
  2002b0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  2002b3:	8b 45 08             	mov    0x8(%ebp),%eax
  2002b6:	0f be 08             	movsbl (%eax),%ecx
  2002b9:	84 c9                	test   %cl,%cl
  2002bb:	74 6b                	je     200328 <printf+0x84>
  2002bd:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002c2:	eb 24                	jmp    2002e8 <printf+0x44>
  2002c4:	31 d2                	xor    %edx,%edx
  2002c6:	b8 04 00 00 00       	mov    $0x4,%eax
  2002cb:	89 d7                	mov    %edx,%edi
  2002cd:	89 d6                	mov    %edx,%esi
  2002cf:	cd 80                	int    $0x80
  2002d1:	8b 45 08             	mov    0x8(%ebp),%eax
  2002d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2002d7:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  2002da:	89 f0                	mov    %esi,%eax
  2002dc:	40                   	inc    %eax
  2002dd:	89 45 08             	mov    %eax,0x8(%ebp)
  2002e0:	0f be 4e 01          	movsbl 0x1(%esi),%ecx
  2002e4:	84 c9                	test   %cl,%cl
  2002e6:	74 40                	je     200328 <printf+0x84>
  2002e8:	80 f9 25             	cmp    $0x25,%cl
  2002eb:	75 d7                	jne    2002c4 <printf+0x20>
  2002ed:	8b 45 08             	mov    0x8(%ebp),%eax
  2002f0:	40                   	inc    %eax
  2002f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2002f4:	8b 45 08             	mov    0x8(%ebp),%eax
  2002f7:	8a 40 01             	mov    0x1(%eax),%al
  2002fa:	3c 64                	cmp    $0x64,%al
  2002fc:	0f 84 92 00 00 00    	je     200394 <printf+0xf0>
  200302:	7e 2c                	jle    200330 <printf+0x8c>
  200304:	3c 73                	cmp    $0x73,%al
  200306:	74 50                	je     200358 <printf+0xb4>
  200308:	3c 78                	cmp    $0x78,%al
  20030a:	75 cb                	jne    2002d7 <printf+0x33>
  20030c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  20030f:	8d 78 04             	lea    0x4(%eax),%edi
  200312:	89 7d e0             	mov    %edi,-0x20(%ebp)
  200315:	8b 10                	mov    (%eax),%edx
  200317:	85 d2                	test   %edx,%edx
  200319:	0f 85 9d 00 00 00    	jne    2003bc <printf+0x118>
  20031f:	b9 30 00 00 00       	mov    $0x30,%ecx
  200324:	eb 1c                	jmp    200342 <printf+0x9e>
  200326:	66 90                	xchg   %ax,%ax
  200328:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20032b:	5b                   	pop    %ebx
  20032c:	5e                   	pop    %esi
  20032d:	5f                   	pop    %edi
  20032e:	5d                   	pop    %ebp
  20032f:	c3                   	ret    
  200330:	3c 63                	cmp    $0x63,%al
  200332:	75 a3                	jne    2002d7 <printf+0x33>
  200334:	8b 45 dc             	mov    -0x24(%ebp),%eax
  200337:	8d 78 04             	lea    0x4(%eax),%edi
  20033a:	89 7d e0             	mov    %edi,-0x20(%ebp)
  20033d:	0f be 08             	movsbl (%eax),%ecx
  200340:	31 d2                	xor    %edx,%edx
  200342:	b8 04 00 00 00       	mov    $0x4,%eax
  200347:	89 d7                	mov    %edx,%edi
  200349:	89 d6                	mov    %edx,%esi
  20034b:	cd 80                	int    $0x80
  20034d:	8b 7d e0             	mov    -0x20(%ebp),%edi
  200350:	89 7d dc             	mov    %edi,-0x24(%ebp)
  200353:	eb 82                	jmp    2002d7 <printf+0x33>
  200355:	8d 76 00             	lea    0x0(%esi),%esi
  200358:	8b 7d dc             	mov    -0x24(%ebp),%edi
  20035b:	89 f8                	mov    %edi,%eax
  20035d:	83 c7 04             	add    $0x4,%edi
  200360:	89 7d dc             	mov    %edi,-0x24(%ebp)
  200363:	8b 00                	mov    (%eax),%eax
  200365:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200368:	0f be 08             	movsbl (%eax),%ecx
  20036b:	84 c9                	test   %cl,%cl
  20036d:	0f 84 64 ff ff ff    	je     2002d7 <printf+0x33>
  200373:	90                   	nop
  200374:	31 d2                	xor    %edx,%edx
  200376:	b8 04 00 00 00       	mov    $0x4,%eax
  20037b:	89 d7                	mov    %edx,%edi
  20037d:	89 d6                	mov    %edx,%esi
  20037f:	cd 80                	int    $0x80
  200381:	ff 45 e0             	incl   -0x20(%ebp)
  200384:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200387:	0f be 08             	movsbl (%eax),%ecx
  20038a:	84 c9                	test   %cl,%cl
  20038c:	75 e6                	jne    200374 <printf+0xd0>
  20038e:	e9 44 ff ff ff       	jmp    2002d7 <printf+0x33>
  200393:	90                   	nop
  200394:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200397:	89 f8                	mov    %edi,%eax
  200399:	83 c7 04             	add    $0x4,%edi
  20039c:	89 7d dc             	mov    %edi,-0x24(%ebp)
  20039f:	8b 10                	mov    (%eax),%edx
  2003a1:	85 d2                	test   %edx,%edx
  2003a3:	75 2b                	jne    2003d0 <printf+0x12c>
  2003a5:	b9 30 00 00 00       	mov    $0x30,%ecx
  2003aa:	b8 04 00 00 00       	mov    $0x4,%eax
  2003af:	89 d7                	mov    %edx,%edi
  2003b1:	89 d6                	mov    %edx,%esi
  2003b3:	cd 80                	int    $0x80
  2003b5:	e9 1d ff ff ff       	jmp    2002d7 <printf+0x33>
  2003ba:	66 90                	xchg   %ax,%ax
  2003bc:	89 d0                	mov    %edx,%eax
  2003be:	e8 95 fe ff ff       	call   200258 <printhex.part.1>
  2003c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2003c6:	89 45 dc             	mov    %eax,-0x24(%ebp)
  2003c9:	e9 09 ff ff ff       	jmp    2002d7 <printf+0x33>
  2003ce:	66 90                	xchg   %ax,%ax
  2003d0:	83 ec 0c             	sub    $0xc,%esp
  2003d3:	52                   	push   %edx
  2003d4:	e8 3f fd ff ff       	call   200118 <printint>
  2003d9:	83 c4 10             	add    $0x10,%esp
  2003dc:	e9 f6 fe ff ff       	jmp    2002d7 <printf+0x33>
  2003e1:	8d 76 00             	lea    0x0(%esi),%esi

002003e4 <fork>:
  2003e4:	55                   	push   %ebp
  2003e5:	89 e5                	mov    %esp,%ebp
  2003e7:	83 ec 10             	sub    $0x10,%esp
  2003ea:	50                   	push   %eax
  2003eb:	b8 02 00 00 00       	mov    $0x2,%eax
  2003f0:	cd 80                	int    $0x80
  2003f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2003f5:	58                   	pop    %eax
  2003f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  2003f9:	c9                   	leave  
  2003fa:	c3                   	ret    
  2003fb:	90                   	nop

002003fc <sleep>:
  2003fc:	55                   	push   %ebp
  2003fd:	89 e5                	mov    %esp,%ebp
  2003ff:	50                   	push   %eax
  200400:	53                   	push   %ebx
  200401:	b8 03 00 00 00       	mov    $0x3,%eax
  200406:	8b 5d 08             	mov    0x8(%ebp),%ebx
  200409:	cd 80                	int    $0x80
  20040b:	5b                   	pop    %ebx
  20040c:	58                   	pop    %eax
  20040d:	31 c0                	xor    %eax,%eax
  20040f:	5d                   	pop    %ebp
  200410:	c3                   	ret    
  200411:	8d 76 00             	lea    0x0(%esi),%esi

00200414 <exit>:
  200414:	55                   	push   %ebp
  200415:	89 e5                	mov    %esp,%ebp
  200417:	50                   	push   %eax
  200418:	b8 05 00 00 00       	mov    $0x5,%eax
  20041d:	cd 80                	int    $0x80
  20041f:	58                   	pop    %eax
  200420:	31 c0                	xor    %eax,%eax
  200422:	5d                   	pop    %ebp
  200423:	c3                   	ret    

00200424 <sem_init>:
  200424:	55                   	push   %ebp
  200425:	89 e5                	mov    %esp,%ebp
  200427:	83 ec 10             	sub    $0x10,%esp
  20042a:	50                   	push   %eax
  20042b:	53                   	push   %ebx
  20042c:	b8 06 00 00 00       	mov    $0x6,%eax
  200431:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200434:	cd 80                	int    $0x80
  200436:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200439:	5b                   	pop    %ebx
  20043a:	58                   	pop    %eax
  20043b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  20043e:	c9                   	leave  
  20043f:	c3                   	ret    

00200440 <sem_wait>:
  200440:	55                   	push   %ebp
  200441:	89 e5                	mov    %esp,%ebp
  200443:	50                   	push   %eax
  200444:	b8 07 00 00 00       	mov    $0x7,%eax
  200449:	cd 80                	int    $0x80
  20044b:	58                   	pop    %eax
  20044c:	31 c0                	xor    %eax,%eax
  20044e:	5d                   	pop    %ebp
  20044f:	c3                   	ret    

00200450 <sem_post>:
  200450:	55                   	push   %ebp
  200451:	89 e5                	mov    %esp,%ebp
  200453:	50                   	push   %eax
  200454:	b8 08 00 00 00       	mov    $0x8,%eax
  200459:	cd 80                	int    $0x80
  20045b:	58                   	pop    %eax
  20045c:	31 c0                	xor    %eax,%eax
  20045e:	5d                   	pop    %ebp
  20045f:	c3                   	ret    

00200460 <sem_destroy>:
  200460:	55                   	push   %ebp
  200461:	89 e5                	mov    %esp,%ebp
  200463:	50                   	push   %eax
  200464:	b8 09 00 00 00       	mov    $0x9,%eax
  200469:	cd 80                	int    $0x80
  20046b:	58                   	pop    %eax
  20046c:	31 c0                	xor    %eax,%eax
  20046e:	5d                   	pop    %ebp
  20046f:	c3                   	ret    
