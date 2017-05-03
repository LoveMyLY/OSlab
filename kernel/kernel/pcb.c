/*************************************************************************
	> File Name: kernel/kernel/pcb.c
	> Author: LoveZJT
	> Mail: 151220055@smail.nju.edu.cn
	> Created Time: 2017年05月01日 星期一 17时43分16秒
 ************************************************************************/

#include "x86.h"
#include "device.h"
#include "common.h"
#include <string.h>

extern SegDesc gdt[NR_SEGMENTS];

void IDLE()
{
	while(1)
	{
		asm volatile("hlt");
	}
}

void Intrtime(struct TrapFrame *tf)
{
	pcb[curpcb].tf=*tf;
	//pcb[curpcb].state=RUNNABLE;
	pcb[curpcb].timeCount--;
	int i=1,index=0;
	for(i=1;i<MAX_PCB_NUM&&pcb[i].inuse==1;++i)
	{
		if(pcb[i].state==SLEEP)
			pcb[i].sleepTime--;
		if(pcb[i].sleepTime==0)
		{
			pcb[i].state=RUNNABLE;
			pcb[i].timeCount=10;
		}
	}
	if(pcb[curpcb].timeCount==0&&curpcb!=0)
	{
		pcb[curpcb].state=RUNNABLE;
		for(i=1;i<MAX_PCB_NUM;++i)
		{
			if(pcb[i].state==RUNNABLE&&pcb[i].inuse==1&&i!=0)
				index=i;
		}
		pcb[index].state=RUNNING;
		pcb[index].timeCount=10;
		curpcb=index;
	}
	else if(curpcb==0)
	{
		for(i=1;i<MAX_PCB_NUM;++i)
		{
			if(pcb[i].state==RUNNABLE&&pcb[i].inuse==1&&i!=0)
				index=i;
		}
		pcb[index].state=RUNNING;
		pcb[index].timeCount=10;
		curpcb=index;
	}
	*tf=pcb[curpcb].tf;
	if(curpcb==1)
		gdt[SEG_UDATA].base_31_24=0;
	else
		gdt[SEG_UDATA].base_31_24=1;
}
void initPcb()
{
	int i=0;
	for(i=0;i<MAX_PCB_NUM;++i)
		pcb[i].inuse=0;

	pcb[0].inuse=1;
	pcb[0].state=RUNNABLE;
	pcb[0].pid=0;
	pcb[0].timeCount=10;
	pcb[0].sleepTime=0;
	pcb[0].tf.cs=0x08;
	pcb[0].tf.eip=(uint32_t)IDLE;
	pcb[0].tf.ss=0x10;
	pcb[0].tf.eflags=0x202;
	pcb[0].tf.esp=0x8000000;
	pcb[0].tf.ebp=0x8000000;

	pcb[1].inuse=1;
	pcb[1].state=RUNNABLE;
	pcb[1].pid=1;
	pcb[1].timeCount=10;
	pcb[1].sleepTime=0;
	pcb[1].tf.cs=0x1b;
	pcb[1].tf.eip=0x200000;
	pcb[1].tf.ss=0x23;
	pcb[1].tf.eflags=0x02;
	pcb[1].tf.esp=(128)<<10;
	pcb[1].tf.ebp=(128)<<10;

	curpcb=1;
}

int sys_fork(struct TrapFrame *tf)
{
	pcb[curpcb].tf=*tf;
	pcb[curpcb].state=RUNNABLE;
	int i=1,index=-1;
	for(i=1;i<MAX_PCB_NUM;++i)
	{
		if(pcb[i].inuse==0)
		{
			pcb[i].inuse=1;
			index=i;
		}
	}
	pcb[index].state=RUNNABLE;
	pcb[index].pid=index;
	pcb[index].timeCount=10;
	pcb[index].sleepTime=0;
	pcb[index].tf=*tf;
	pcb[index].tf.eax=0;
	memcpy((void *)pcb[index].tf.esp+0x1000000,(void *)pcb[curpcb].tf.esp,(128<<20)-pcb[curpcb].tf.esp);
	memcpy((void *)0x1000000+0x200000,(void *)0x200000,0x2000);
	pcb[curpcb].tf.eax=index;
	curpcb=index;
	pcb[curpcb].state=RUNNING;
	if(curpcb==1)
		gdt[SEG_UDATA].base_31_24=0;
	else
		gdt[SEG_UDATA].base_31_24=1;
	return index;
}
