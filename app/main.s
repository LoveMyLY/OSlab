
app/uMain.elf：     文件格式 elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 14             	sub    $0x14,%esp
  200006:	68 d4 04 20 00       	push   $0x2004d4
  20000b:	e8 84 03 00 00       	call   200394 <printf>
  200010:	c7 04 24 ea 04 20 00 	movl   $0x2004ea,(%esp)
  200017:	e8 78 03 00 00       	call   200394 <printf>
  20001c:	c7 04 24 cc 05 20 00 	movl   $0x2005cc,(%esp)
  200023:	e8 6c 03 00 00       	call   200394 <printf>
  200028:	c7 04 24 08 06 20 00 	movl   $0x200608,(%esp)
  20002f:	e8 60 03 00 00       	call   200394 <printf>
  200034:	c7 04 24 3c 06 20 00 	movl   $0x20063c,(%esp)
  20003b:	e8 54 03 00 00       	call   200394 <printf>
  200040:	c7 04 24 b8 06 20 00 	movl   $0x2006b8,(%esp)
  200047:	e8 48 03 00 00       	call   200394 <printf>
  20004c:	c7 04 24 01 05 20 00 	movl   $0x200501,(%esp)
  200053:	e8 3c 03 00 00       	call   200394 <printf>
  200058:	c7 04 24 dc 06 20 00 	movl   $0x2006dc,(%esp)
  20005f:	e8 30 03 00 00       	call   200394 <printf>
  200064:	c7 04 24 cc 05 20 00 	movl   $0x2005cc,(%esp)
  20006b:	e8 24 03 00 00       	call   200394 <printf>
  200070:	c7 04 24 1f 05 20 00 	movl   $0x20051f,(%esp)
  200077:	e8 18 03 00 00       	call   200394 <printf>
  20007c:	c7 04 24 5c 07 20 00 	movl   $0x20075c,(%esp)
  200083:	e8 0c 03 00 00       	call   200394 <printf>
  200088:	58                   	pop    %eax
  200089:	5a                   	pop    %edx
  20008a:	68 55 05 20 00       	push   $0x200555
  20008f:	6a 74                	push   $0x74
  200091:	68 2d 05 20 00       	push   $0x20052d
  200096:	68 ca 05 20 00       	push   $0x2005ca
  20009b:	68 31 05 20 00       	push   $0x200531
  2000a0:	68 38 05 20 00       	push   $0x200538
  2000a5:	e8 ea 02 00 00       	call   200394 <printf>
  2000aa:	83 c4 18             	add    $0x18,%esp
  2000ad:	6a 62                	push   $0x62
  2000af:	6a 61                	push   $0x61
  2000b1:	6a 6c                	push   $0x6c
  2000b3:	6a 53                	push   $0x53
  2000b5:	6a 4f                	push   $0x4f
  2000b7:	68 4a 05 20 00       	push   $0x20054a
  2000bc:	e8 d3 02 00 00       	call   200394 <printf>
  2000c1:	83 c4 1c             	add    $0x1c,%esp
  2000c4:	68 00 00 10 00       	push   $0x100000
  2000c9:	68 98 07 20 00       	push   $0x200798
  2000ce:	68 00 00 10 00       	push   $0x100000
  2000d3:	68 d0 07 20 00       	push   $0x2007d0
  2000d8:	68 57 05 20 00       	push   $0x200557
  2000dd:	68 60 05 20 00       	push   $0x200560
  2000e2:	68 00 08 20 00       	push   $0x200800
  2000e7:	e8 a8 02 00 00       	call   200394 <printf>
  2000ec:	83 c4 14             	add    $0x14,%esp
  2000ef:	68 b8 06 20 00       	push   $0x2006b8
  2000f4:	e8 9b 02 00 00       	call   200394 <printf>
  2000f9:	c7 04 24 01 05 20 00 	movl   $0x200501,(%esp)
  200100:	e8 8f 02 00 00       	call   200394 <printf>
  200105:	83 c4 0c             	add    $0xc,%esp
  200108:	68 18 db 00 00       	push   $0xdb18
  20010d:	68 c8 01 00 00       	push   $0x1c8
  200112:	6a 7b                	push   $0x7b
  200114:	6a 02                	push   $0x2
  200116:	6a 01                	push   $0x1
  200118:	6a 01                	push   $0x1
  20011a:	68 65 05 20 00       	push   $0x200565
  20011f:	e8 70 02 00 00       	call   200394 <printf>
  200124:	83 c4 1c             	add    $0x1c,%esp
  200127:	68 8e 8e 01 00       	push   $0x18e8e
  20012c:	68 00 80 ff ff       	push   $0xffff8000
  200131:	68 01 df ce ab       	push   $0xabcedf01
  200136:	68 00 00 00 80       	push   $0x80000000
  20013b:	6a ff                	push   $0xffffffff
  20013d:	6a 00                	push   $0x0
  20013f:	68 81 05 20 00       	push   $0x200581
  200144:	e8 4b 02 00 00       	call   200394 <printf>
  200149:	83 c4 1c             	add    $0x1c,%esp
  20014c:	68 8e 8e 01 00       	push   $0x18e8e
  200151:	68 00 80 ff ff       	push   $0xffff8000
  200156:	68 01 df ce ab       	push   $0xabcedf01
  20015b:	68 00 00 00 80       	push   $0x80000000
  200160:	6a ff                	push   $0xffffffff
  200162:	6a 00                	push   $0x0
  200164:	68 99 05 20 00       	push   $0x200599
  200169:	e8 26 02 00 00       	call   200394 <printf>
  20016e:	83 c4 14             	add    $0x14,%esp
  200171:	68 5c 07 20 00       	push   $0x20075c
  200176:	e8 19 02 00 00       	call   200394 <printf>
  20017b:	c7 04 24 b1 05 20 00 	movl   $0x2005b1,(%esp)
  200182:	e8 0d 02 00 00       	call   200394 <printf>
  200187:	83 c4 10             	add    $0x10,%esp
  20018a:	eb fe                	jmp    20018a <uEntry+0x18a>

0020018c <syscall>:
  20018c:	55                   	push   %ebp
  20018d:	89 e5                	mov    %esp,%ebp
  20018f:	57                   	push   %edi
  200190:	56                   	push   %esi
  200191:	53                   	push   %ebx
  200192:	8b 55 14             	mov    0x14(%ebp),%edx
  200195:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200198:	8b 45 08             	mov    0x8(%ebp),%eax
  20019b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  20019e:	8b 7d 18             	mov    0x18(%ebp),%edi
  2001a1:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2001a4:	cd 80                	int    $0x80
  2001a6:	5b                   	pop    %ebx
  2001a7:	5e                   	pop    %esi
  2001a8:	5f                   	pop    %edi
  2001a9:	5d                   	pop    %ebp
  2001aa:	c3                   	ret    
  2001ab:	90                   	nop

002001ac <printchar>:
  2001ac:	55                   	push   %ebp
  2001ad:	89 e5                	mov    %esp,%ebp
  2001af:	57                   	push   %edi
  2001b0:	56                   	push   %esi
  2001b1:	53                   	push   %ebx
  2001b2:	0f be 4d 08          	movsbl 0x8(%ebp),%ecx
  2001b6:	31 d2                	xor    %edx,%edx
  2001b8:	bb 01 00 00 00       	mov    $0x1,%ebx
  2001bd:	b8 04 00 00 00       	mov    $0x4,%eax
  2001c2:	89 d7                	mov    %edx,%edi
  2001c4:	89 d6                	mov    %edx,%esi
  2001c6:	cd 80                	int    $0x80
  2001c8:	5b                   	pop    %ebx
  2001c9:	5e                   	pop    %esi
  2001ca:	5f                   	pop    %edi
  2001cb:	5d                   	pop    %ebp
  2001cc:	c3                   	ret    
  2001cd:	8d 76 00             	lea    0x0(%esi),%esi

002001d0 <printstr>:
  2001d0:	55                   	push   %ebp
  2001d1:	89 e5                	mov    %esp,%ebp
  2001d3:	57                   	push   %edi
  2001d4:	56                   	push   %esi
  2001d5:	53                   	push   %ebx
  2001d6:	8b 45 08             	mov    0x8(%ebp),%eax
  2001d9:	0f be 08             	movsbl (%eax),%ecx
  2001dc:	84 c9                	test   %cl,%cl
  2001de:	74 22                	je     200202 <printstr+0x32>
  2001e0:	bb 01 00 00 00       	mov    $0x1,%ebx
  2001e5:	8d 76 00             	lea    0x0(%esi),%esi
  2001e8:	31 d2                	xor    %edx,%edx
  2001ea:	b8 04 00 00 00       	mov    $0x4,%eax
  2001ef:	89 d7                	mov    %edx,%edi
  2001f1:	89 d6                	mov    %edx,%esi
  2001f3:	cd 80                	int    $0x80
  2001f5:	ff 45 08             	incl   0x8(%ebp)
  2001f8:	8b 45 08             	mov    0x8(%ebp),%eax
  2001fb:	0f be 08             	movsbl (%eax),%ecx
  2001fe:	84 c9                	test   %cl,%cl
  200200:	75 e6                	jne    2001e8 <printstr+0x18>
  200202:	5b                   	pop    %ebx
  200203:	5e                   	pop    %esi
  200204:	5f                   	pop    %edi
  200205:	5d                   	pop    %ebp
  200206:	c3                   	ret    
  200207:	90                   	nop

00200208 <printint>:
  200208:	55                   	push   %ebp
  200209:	89 e5                	mov    %esp,%ebp
  20020b:	57                   	push   %edi
  20020c:	56                   	push   %esi
  20020d:	53                   	push   %ebx
  20020e:	83 ec 3c             	sub    $0x3c,%esp
  200211:	8b 75 08             	mov    0x8(%ebp),%esi
  200214:	85 f6                	test   %esi,%esi
  200216:	78 54                	js     20026c <printint+0x64>
  200218:	75 0a                	jne    200224 <printint+0x1c>
  20021a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20021d:	5b                   	pop    %ebx
  20021e:	5e                   	pop    %esi
  20021f:	5f                   	pop    %edi
  200220:	5d                   	pop    %ebp
  200221:	c3                   	ret    
  200222:	66 90                	xchg   %ax,%ax
  200224:	83 ec 0c             	sub    $0xc,%esp
  200227:	b8 67 66 66 66       	mov    $0x66666667,%eax
  20022c:	f7 ee                	imul   %esi
  20022e:	89 d3                	mov    %edx,%ebx
  200230:	c1 fb 02             	sar    $0x2,%ebx
  200233:	89 f0                	mov    %esi,%eax
  200235:	c1 f8 1f             	sar    $0x1f,%eax
  200238:	29 c3                	sub    %eax,%ebx
  20023a:	53                   	push   %ebx
  20023b:	e8 c8 ff ff ff       	call   200208 <printint>
  200240:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
  200243:	01 c0                	add    %eax,%eax
  200245:	29 c6                	sub    %eax,%esi
  200247:	8d 4e 30             	lea    0x30(%esi),%ecx
  20024a:	0f b6 c9             	movzbl %cl,%ecx
  20024d:	31 d2                	xor    %edx,%edx
  20024f:	bb 01 00 00 00       	mov    $0x1,%ebx
  200254:	b8 04 00 00 00       	mov    $0x4,%eax
  200259:	89 d7                	mov    %edx,%edi
  20025b:	89 d6                	mov    %edx,%esi
  20025d:	cd 80                	int    $0x80
  20025f:	83 c4 10             	add    $0x10,%esp
  200262:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200265:	5b                   	pop    %ebx
  200266:	5e                   	pop    %esi
  200267:	5f                   	pop    %edi
  200268:	5d                   	pop    %ebp
  200269:	c3                   	ret    
  20026a:	66 90                	xchg   %ax,%ax
  20026c:	81 fe 00 00 00 80    	cmp    $0x80000000,%esi
  200272:	0f 84 9c 00 00 00    	je     200314 <printint+0x10c>
  200278:	f7 de                	neg    %esi
  20027a:	31 c9                	xor    %ecx,%ecx
  20027c:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  20027f:	89 45 c0             	mov    %eax,-0x40(%ebp)
  200282:	bf 0a 00 00 00       	mov    $0xa,%edi
  200287:	bb 67 66 66 66       	mov    $0x66666667,%ebx
  20028c:	eb 05                	jmp    200293 <printint+0x8b>
  20028e:	66 90                	xchg   %ax,%ax
  200290:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
  200293:	89 f0                	mov    %esi,%eax
  200295:	99                   	cltd   
  200296:	f7 ff                	idiv   %edi
  200298:	8d 42 30             	lea    0x30(%edx),%eax
  20029b:	88 45 bf             	mov    %al,-0x41(%ebp)
  20029e:	8b 55 c0             	mov    -0x40(%ebp),%edx
  2002a1:	88 04 0a             	mov    %al,(%edx,%ecx,1)
  2002a4:	8d 41 01             	lea    0x1(%ecx),%eax
  2002a7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  2002aa:	89 f0                	mov    %esi,%eax
  2002ac:	f7 eb                	imul   %ebx
  2002ae:	89 d0                	mov    %edx,%eax
  2002b0:	c1 f8 02             	sar    $0x2,%eax
  2002b3:	c1 fe 1f             	sar    $0x1f,%esi
  2002b6:	29 f0                	sub    %esi,%eax
  2002b8:	89 c6                	mov    %eax,%esi
  2002ba:	75 d4                	jne    200290 <printint+0x88>
  2002bc:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  2002bf:	b9 2d 00 00 00       	mov    $0x2d,%ecx
  2002c4:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002c9:	b8 04 00 00 00       	mov    $0x4,%eax
  2002ce:	89 f2                	mov    %esi,%edx
  2002d0:	89 f7                	mov    %esi,%edi
  2002d2:	cd 80                	int    $0x80
  2002d4:	8b 45 c0             	mov    -0x40(%ebp),%eax
  2002d7:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
  2002da:	8d 44 18 ff          	lea    -0x1(%eax,%ebx,1),%eax
  2002de:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  2002e1:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002e6:	8a 45 bf             	mov    -0x41(%ebp),%al
  2002e9:	eb 07                	jmp    2002f2 <printint+0xea>
  2002eb:	90                   	nop
  2002ec:	8a 07                	mov    (%edi),%al
  2002ee:	4f                   	dec    %edi
  2002ef:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  2002f2:	0f be c8             	movsbl %al,%ecx
  2002f5:	31 d2                	xor    %edx,%edx
  2002f7:	b8 04 00 00 00       	mov    $0x4,%eax
  2002fc:	89 d7                	mov    %edx,%edi
  2002fe:	89 d6                	mov    %edx,%esi
  200300:	cd 80                	int    $0x80
  200302:	8d 4d d3             	lea    -0x2d(%ebp),%ecx
  200305:	8b 7d c4             	mov    -0x3c(%ebp),%edi
  200308:	39 f9                	cmp    %edi,%ecx
  20030a:	75 e0                	jne    2002ec <printint+0xe4>
  20030c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20030f:	5b                   	pop    %ebx
  200310:	5e                   	pop    %esi
  200311:	5f                   	pop    %edi
  200312:	5d                   	pop    %ebp
  200313:	c3                   	ret    
  200314:	8d 7d d4             	lea    -0x2c(%ebp),%edi
  200317:	89 7d c0             	mov    %edi,-0x40(%ebp)
  20031a:	be 28 08 20 00       	mov    $0x200828,%esi
  20031f:	b9 03 00 00 00       	mov    $0x3,%ecx
  200324:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  200326:	8a 45 de             	mov    -0x22(%ebp),%al
  200329:	88 45 bf             	mov    %al,-0x41(%ebp)
  20032c:	c7 45 c4 0a 00 00 00 	movl   $0xa,-0x3c(%ebp)
  200333:	eb 9f                	jmp    2002d4 <printint+0xcc>
  200335:	8d 76 00             	lea    0x0(%esi),%esi

00200338 <printhex>:
  200338:	55                   	push   %ebp
  200339:	89 e5                	mov    %esp,%ebp
  20033b:	8b 45 08             	mov    0x8(%ebp),%eax
  20033e:	85 c0                	test   %eax,%eax
  200340:	75 02                	jne    200344 <printhex+0xc>
  200342:	5d                   	pop    %ebp
  200343:	c3                   	ret    
  200344:	5d                   	pop    %ebp
  200345:	eb 01                	jmp    200348 <printhex.part.1>
  200347:	90                   	nop

00200348 <printhex.part.1>:
  200348:	55                   	push   %ebp
  200349:	89 e5                	mov    %esp,%ebp
  20034b:	57                   	push   %edi
  20034c:	56                   	push   %esi
  20034d:	53                   	push   %ebx
  20034e:	83 ec 18             	sub    $0x18,%esp
  200351:	89 c3                	mov    %eax,%ebx
  200353:	89 c2                	mov    %eax,%edx
  200355:	c1 ea 04             	shr    $0x4,%edx
  200358:	52                   	push   %edx
  200359:	e8 da ff ff ff       	call   200338 <printhex>
  20035e:	89 d8                	mov    %ebx,%eax
  200360:	83 e0 0f             	and    $0xf,%eax
  200363:	83 c4 10             	add    $0x10,%esp
  200366:	83 f8 09             	cmp    $0x9,%eax
  200369:	76 21                	jbe    20038c <printhex.part.1+0x44>
  20036b:	83 c0 57             	add    $0x57,%eax
  20036e:	0f b6 c8             	movzbl %al,%ecx
  200371:	31 d2                	xor    %edx,%edx
  200373:	bb 01 00 00 00       	mov    $0x1,%ebx
  200378:	b8 04 00 00 00       	mov    $0x4,%eax
  20037d:	89 d7                	mov    %edx,%edi
  20037f:	89 d6                	mov    %edx,%esi
  200381:	cd 80                	int    $0x80
  200383:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200386:	5b                   	pop    %ebx
  200387:	5e                   	pop    %esi
  200388:	5f                   	pop    %edi
  200389:	5d                   	pop    %ebp
  20038a:	c3                   	ret    
  20038b:	90                   	nop
  20038c:	8d 48 30             	lea    0x30(%eax),%ecx
  20038f:	eb e0                	jmp    200371 <printhex.part.1+0x29>
  200391:	8d 76 00             	lea    0x0(%esi),%esi

00200394 <printf>:
  200394:	55                   	push   %ebp
  200395:	89 e5                	mov    %esp,%ebp
  200397:	57                   	push   %edi
  200398:	56                   	push   %esi
  200399:	53                   	push   %ebx
  20039a:	83 ec 1c             	sub    $0x1c,%esp
  20039d:	8d 45 0c             	lea    0xc(%ebp),%eax
  2003a0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  2003a3:	8b 45 08             	mov    0x8(%ebp),%eax
  2003a6:	0f be 08             	movsbl (%eax),%ecx
  2003a9:	84 c9                	test   %cl,%cl
  2003ab:	74 6b                	je     200418 <printf+0x84>
  2003ad:	bb 01 00 00 00       	mov    $0x1,%ebx
  2003b2:	eb 24                	jmp    2003d8 <printf+0x44>
  2003b4:	31 d2                	xor    %edx,%edx
  2003b6:	b8 04 00 00 00       	mov    $0x4,%eax
  2003bb:	89 d7                	mov    %edx,%edi
  2003bd:	89 d6                	mov    %edx,%esi
  2003bf:	cd 80                	int    $0x80
  2003c1:	8b 45 08             	mov    0x8(%ebp),%eax
  2003c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2003c7:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  2003ca:	89 f0                	mov    %esi,%eax
  2003cc:	40                   	inc    %eax
  2003cd:	89 45 08             	mov    %eax,0x8(%ebp)
  2003d0:	0f be 4e 01          	movsbl 0x1(%esi),%ecx
  2003d4:	84 c9                	test   %cl,%cl
  2003d6:	74 40                	je     200418 <printf+0x84>
  2003d8:	80 f9 25             	cmp    $0x25,%cl
  2003db:	75 d7                	jne    2003b4 <printf+0x20>
  2003dd:	8b 45 08             	mov    0x8(%ebp),%eax
  2003e0:	40                   	inc    %eax
  2003e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2003e4:	8b 45 08             	mov    0x8(%ebp),%eax
  2003e7:	8a 40 01             	mov    0x1(%eax),%al
  2003ea:	3c 64                	cmp    $0x64,%al
  2003ec:	0f 84 92 00 00 00    	je     200484 <printf+0xf0>
  2003f2:	7e 2c                	jle    200420 <printf+0x8c>
  2003f4:	3c 73                	cmp    $0x73,%al
  2003f6:	74 50                	je     200448 <printf+0xb4>
  2003f8:	3c 78                	cmp    $0x78,%al
  2003fa:	75 cb                	jne    2003c7 <printf+0x33>
  2003fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2003ff:	8d 78 04             	lea    0x4(%eax),%edi
  200402:	89 7d e0             	mov    %edi,-0x20(%ebp)
  200405:	8b 10                	mov    (%eax),%edx
  200407:	85 d2                	test   %edx,%edx
  200409:	0f 85 9d 00 00 00    	jne    2004ac <printf+0x118>
  20040f:	b9 30 00 00 00       	mov    $0x30,%ecx
  200414:	eb 1c                	jmp    200432 <printf+0x9e>
  200416:	66 90                	xchg   %ax,%ax
  200418:	8d 65 f4             	lea    -0xc(%ebp),%esp
  20041b:	5b                   	pop    %ebx
  20041c:	5e                   	pop    %esi
  20041d:	5f                   	pop    %edi
  20041e:	5d                   	pop    %ebp
  20041f:	c3                   	ret    
  200420:	3c 63                	cmp    $0x63,%al
  200422:	75 a3                	jne    2003c7 <printf+0x33>
  200424:	8b 45 dc             	mov    -0x24(%ebp),%eax
  200427:	8d 78 04             	lea    0x4(%eax),%edi
  20042a:	89 7d e0             	mov    %edi,-0x20(%ebp)
  20042d:	0f be 08             	movsbl (%eax),%ecx
  200430:	31 d2                	xor    %edx,%edx
  200432:	b8 04 00 00 00       	mov    $0x4,%eax
  200437:	89 d7                	mov    %edx,%edi
  200439:	89 d6                	mov    %edx,%esi
  20043b:	cd 80                	int    $0x80
  20043d:	8b 7d e0             	mov    -0x20(%ebp),%edi
  200440:	89 7d dc             	mov    %edi,-0x24(%ebp)
  200443:	eb 82                	jmp    2003c7 <printf+0x33>
  200445:	8d 76 00             	lea    0x0(%esi),%esi
  200448:	8b 7d dc             	mov    -0x24(%ebp),%edi
  20044b:	89 f8                	mov    %edi,%eax
  20044d:	83 c7 04             	add    $0x4,%edi
  200450:	89 7d dc             	mov    %edi,-0x24(%ebp)
  200453:	8b 00                	mov    (%eax),%eax
  200455:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200458:	0f be 08             	movsbl (%eax),%ecx
  20045b:	84 c9                	test   %cl,%cl
  20045d:	0f 84 64 ff ff ff    	je     2003c7 <printf+0x33>
  200463:	90                   	nop
  200464:	31 d2                	xor    %edx,%edx
  200466:	b8 04 00 00 00       	mov    $0x4,%eax
  20046b:	89 d7                	mov    %edx,%edi
  20046d:	89 d6                	mov    %edx,%esi
  20046f:	cd 80                	int    $0x80
  200471:	ff 45 e0             	incl   -0x20(%ebp)
  200474:	8b 45 e0             	mov    -0x20(%ebp),%eax
  200477:	0f be 08             	movsbl (%eax),%ecx
  20047a:	84 c9                	test   %cl,%cl
  20047c:	75 e6                	jne    200464 <printf+0xd0>
  20047e:	e9 44 ff ff ff       	jmp    2003c7 <printf+0x33>
  200483:	90                   	nop
  200484:	8b 7d dc             	mov    -0x24(%ebp),%edi
  200487:	89 f8                	mov    %edi,%eax
  200489:	83 c7 04             	add    $0x4,%edi
  20048c:	89 7d dc             	mov    %edi,-0x24(%ebp)
  20048f:	8b 10                	mov    (%eax),%edx
  200491:	85 d2                	test   %edx,%edx
  200493:	75 2b                	jne    2004c0 <printf+0x12c>
  200495:	b9 30 00 00 00       	mov    $0x30,%ecx
  20049a:	b8 04 00 00 00       	mov    $0x4,%eax
  20049f:	89 d7                	mov    %edx,%edi
  2004a1:	89 d6                	mov    %edx,%esi
  2004a3:	cd 80                	int    $0x80
  2004a5:	e9 1d ff ff ff       	jmp    2003c7 <printf+0x33>
  2004aa:	66 90                	xchg   %ax,%ax
  2004ac:	89 d0                	mov    %edx,%eax
  2004ae:	e8 95 fe ff ff       	call   200348 <printhex.part.1>
  2004b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  2004b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
  2004b9:	e9 09 ff ff ff       	jmp    2003c7 <printf+0x33>
  2004be:	66 90                	xchg   %ax,%ax
  2004c0:	83 ec 0c             	sub    $0xc,%esp
  2004c3:	52                   	push   %edx
  2004c4:	e8 3f fd ff ff       	call   200208 <printint>
  2004c9:	83 c4 10             	add    $0x10,%esp
  2004cc:	e9 f6 fe ff ff       	jmp    2003c7 <printf+0x33>
