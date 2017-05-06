#include "x86.h"
#include "device.h"
#include "common.h"
#include <string.h>

int scrX=5,scrY=0;
extern struct ProcessTable pcb[MAX_PCB_NUM];
extern int curpcb;
extern SegDesc gdt[NR_SEGMENTS];
void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

void Intrtime(struct TrapFrame *tf);
int sys_fork(struct TrapFrame *tf);
int sys_sleep(struct TrapFrame *tf);
int sys_exit(struct TrapFrame *tf);

extern SegDesc gdt[NR_SEGMENTS];

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */

	/*asm volatile("movw %%ax, %%es"::"a"(KSEL(SEG_KDATA)));
	asm volatile("movw %%ax, %%ds"::"a"(KSEL(SEG_KDATA)));
	//asm volatile("movw %%ax, %%ss"::"a"(KSEL(SEG_KDATA)));
	asm volatile("movw $0x30,%%ax");
	asm volatile("movw %%ax,%%gs");*/
/*	if(curpcb==1)
		gdt[6]=SEG(STA_W,0xb8000,0xffffffff,DPL_KERN);
	else if(curpcb==2)
		gdt[6]=SEG(STA_W,0x10b8000,0xffffffff,DPL_KERN);*/
	asm volatile("\
            movw $0x10,%ax;\
            movw %ax,%ds;\
            movw %ax,%es;\
            movw $0x30,%ax;\
            movw %ax,%gs;\
            ");

	//putChar('0'+curpcb);
	setGdt(gdt,sizeof(gdt));
	putChar('0'+gdt[SEG_UDATA].base_31_24);
	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x20:
			//putChar('0'+curpcb);
			/*putChar('t');
			putChar('i');
			putChar('m');
			putChar('e');
			putChar('r');*/
			Intrtime(tf);
			//putChar('\n');
			//putChar('0'+curpcb);
			//putChar(' ');
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default:assert(0);
		asm volatile("\
            movw %0,%%ds;\
            movw %1,%%es;\
            movw %2,%%gs;\
            "::"m"(tf->ds),"m"(tf->es),"m"(tf->gs));
	}
}

void __attribute__ ((noinline)) sys_write(struct TrapFrame *tf)
{
	
	int val_ascii=tf->ecx;
	//putChar(*tf->ecx);

	putChar(val_ascii);
	if(val_ascii=='\n')
	{
		scrX++;
		scrY=0;
		return ;
	}
	asm volatile("movl %0, %%eax;\
			imull $80, %%eax;\
			addl %1, %%eax;\
			imull $2, %%eax;\
			movl %%eax, %%edi;\
			movb %2, %%al;\
			movb $0x0c, %%ah;\
			movw %%ax, %%gs:(%%edi)\
			": :"m"(scrX), "m"(scrY),"m"(val_ascii));
	scrY++;
	if(scrY>=80)
	{
		scrX++;
		scrY=0;
	}
	//putChar(tf->ecx);
	//tf->eax=1;
}
void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	//int i=-1;
	switch(tf->eax)
	{
		case 2:
			/*putChar('f');
			putChar('o');
			putChar('r');
			putChar('k');*/
			sys_fork(tf);
			//putChar('0'+i);
			break;
		case 3:
			/*putChar('s');
			putChar('l');
			putChar('e');
			putChar('e');
			putChar('p');*/
			//putChar('0'+curpcb);
			sys_sleep(tf);
			
			break;
		case 4:
			sys_write(tf);break;
		case 5:
			/*putChar('e');
			putChar('x');
			putChar('i');
			putChar('t');*/
			sys_exit(tf);break;
		default:
			assert(0);
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}
