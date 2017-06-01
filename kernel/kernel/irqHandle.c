#include "x86.h"
#include "device.h"
#include "common.h"
#include <string.h>

int scrX=0,scrY=0;
extern struct ProcessTable pcb[MAX_PCB_NUM];
extern int curpcb;
extern SegDesc gdt[NR_SEGMENTS];
void syscallHandle(struct TrapFrame *tf);
extern Semaphore xhl[2];

void GProtectFaultHandle(struct TrapFrame *tf);

void Intrtime(struct TrapFrame *tf);
int sys_fork(struct TrapFrame *tf);
int sys_sleep(struct TrapFrame *tf);
int sys_exit(struct TrapFrame *tf);

int sys_init(struct TrapFrame *tf);
int sys_wait(struct TrapFrame *tf);
int sys_post(struct TrapFrame *tf);
int sys_destroy(struct TrapFrame *tf);

extern SegDesc gdt[NR_SEGMENTS];

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */

	asm volatile("\
            movw $0x10,%ax;\
            movw %ax,%ds;\
            movw %ax,%es;\
            movw $0x30,%ax;\
            movw %ax,%gs;\
            ");
	

	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x20:
			Intrtime(tf);
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
}
void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	//int i=-1;
	switch(tf->eax)
	{
		case 2:
			sys_fork(tf);
			break;
		case 3:
			sys_sleep(tf);
			break;
		case 4:
			sys_write(tf);break;
		case 5:
			sys_exit(tf);break;
		case 6:
			sys_init(tf);break;
		case 7:
			sys_wait(tf);break;
		case 8:
			sys_post(tf);break;
		case 9:
			sys_destroy(tf);break;
		default:
			assert(0);
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}
