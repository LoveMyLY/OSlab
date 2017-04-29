.code32

.global start
start:
	movl $((80*8+0)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $72, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存

	movl $((80*8+1)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $101, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+2)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $108, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+3)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $108, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+4)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $111, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+5)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $44, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+6)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $32, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+7)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $87, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+8)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $111, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+9)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $114, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+10)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $108, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+11)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $100, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*8+12)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $33, %al                           #42为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	
.L1:
	jmp .L1
