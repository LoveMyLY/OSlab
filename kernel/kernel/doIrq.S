.code32

.global irqEmpty
irqEmpty:
	pushl $0 // push dummy error code
	pushl $-1 // push interrupt vector into kernel
	jmp asmDoIrq

.global irqDivError
irqDivError:
	pushl $0
	pushl $0
	jmp asmDoIrq

.global irqStepOver
irqStepOver:
	pushl $0
	pushl $1
	jmp asmDoIrq

.global irqNMIInterrupt
irqNMIInterrupt:
	pushl $0
	pushl $2
	jmp asmDoIrq

.global irqBreakPoint
irqBreakPoint:
	pushl $0
	pushl $3
	jmp asmDoIrq

.global irqOverflow
irqOverflow:
	pushl $0
	pushl $4
	jmp asmDoIrq

.global irqBoundTest
irqBoundTest:
	pushl $0
	pushl $5
	jmp asmDoIrq

.global irqInvalidOperation
irqInvalidOperation:
	pushl $0
	pushl $6
	jmp asmDoIrq

.global irqNoCoprocessor
irqNoCoprocessor:
	pushl $0
	pushl $7
	jmp asmDoIrq

.global irqDoubleFault
irqDoubleFault:
	pushl $8
	jmp asmDoIrq

.global irqCoprocessorOutofBound
irqCoprocessorOutofBound:
	pushl $0
	pushl $9
	jmp asmDoIrq

.global irqInvalidTSS
irqInvalidTSS:
	pushl $10
	jmp asmDoIrq

.global irqNoSegment
irqNoSegment:
	pushl $11
	jmp asmDoIrq

.global irqStackSegmentFault
irqStackSegmentFault:
	pushl $12
	jmp asmDoIrq

.global irqPageFault
irqPageFault:
	pushl $14
	jmp asmDoIrq

.global irqGProtectFault
irqGProtectFault:
	pushl $0xd
	jmp asmDoIrq

.global irqTime
irqTime:
	pushl $0
	pushl $0x20
	jmp asmDoIrq

.global irqSyscall
irqSyscall:
	pushl $0 // push dummy error code
	pushl $0x80 // push interrupt vector into kernel stack
	jmp asmDoIrq

.global asmDoIrq
asmDoIrq:
	pushal // push process state into kernel stack
	pushl %ds
	pushl %es
	pushl %fs
	pushl %gs
	pushl %esp
	call irqHandle
	addl $4, %esp
	//addl $16, %esp
	popl %gs
	popl %fs
	popl %es
	popl %ds
	popal
	addl $4, %esp //interrupt vector is on top of kernel stack
	addl $4, %esp //error code is on top of kernel stack
	iret
