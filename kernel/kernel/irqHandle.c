#include "x86.h"
#include "device.h"
#include "common.h"


void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

void Intrtime(struct TrapFrame *tf);
void sys_fork(struct TrapFrame *tf);

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */

	asm volatile("movw %%ax, %%es"::"a"(KSEL(SEG_KDATA)));
	asm volatile("movw %%ax, %%ds"::"a"(KSEL(SEG_KDATA)));
	asm volatile("movw %%ax, %%ss"::"a"(KSEL(SEG_KDATA)));
	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x20:
			/*putChar('e');
			putChar('n');
			putChar('t');
			putChar('e');
			putChar('r');
			putChar('0');*/
			Intrtime(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default:assert(0);
	}
}
int scrX=5,scrY=0;
void __attribute__ ((noinline)) sys_write(struct TrapFrame *tf)
{
	
	int val_ascii=tf->ecx;
	putChar(tf->ecx);
	//tf->eax=1;
	if(val_ascii=='\n')
	{
		scrX++;
		scrY=0;
		return ;
	}
	asm volatile("\
			movw $0x10,%ax;\
			movw %ax,%ds;\
			movw %ax,%es;\
			movw $0x30,%ax;\
			movw %ax,%gs;\
			");
	asm volatile("movl %0, %%eax;\
			imull $80, %%eax;\
			addl %1, %%eax;\
			imull $2, %%eax;\
			movl %%eax, %%edi;\
			movb %2, %%al;\
			movb $0x0f, %%ah;\
			movw %%ax, %%gs:(%%edi)\
			": :"m"(scrX), "m"(scrY),"m"(tf->ecx));
	scrY++;
	if(scrY>=160)
	{
		scrX++;
		scrY=0;
	}
	//putChar(tf->ecx);
	//tf->eax=1;
}
void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	
	switch(tf->eax)
	{
		case 2:
			putChar('f');
			putChar('o');
			putChar('r');
			putChar('k');
			sys_fork(tf);
			break;
		case 4:
			sys_write(tf);break;
		default:
			assert(0);
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}
