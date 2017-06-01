/*************************************************************************
	> File Name: kernel/kernel/sem.c
	> Author: LoveZJT
	> Mail: 151220055@smail.nju.edu.cn
	> Created Time: 2017年05月30日 星期二 15时43分55秒
 ************************************************************************/

#include "x86.h"
#include "device.h"
#include "common.h"

extern struct ProcessTable pcb[MAX_PCB_NUM];
extern int curpcb;
extern SegDesc gdt[NR_SEGMENTS];

int sys_init(struct TrapFrame *tf)
{
	xhl[0].value=tf->ebx;
	int i=0;
	for(i=0;i<10;++i)
		xhl[0].wait[i]=-1;
	xhl[0].wait_count=0;
	return 0;
}

int sys_wait(struct TrapFrame *tf)
{
	xhl[0].value--;
	if(xhl[0].value<0)
	{
		int i=xhl[0].wait_count;
		xhl[0].wait[i]=curpcb;
		++xhl[0].wait_count;
		pcb[curpcb].tf=*tf;
		pcb[curpcb].state=SLEEP;
		pcb[curpcb].timeCount=0;
		pcb[curpcb].sleepTime=1000;
		for(i=0;i<MAX_PCB_NUM;++i)
		{
			if(pcb[i].inuse==1&&pcb[i].state==RUNNABLE&&i!=curpcb)
				break;
		}
		pcb[i].state=RUNNING;
		pcb[i].timeCount=10;
		curpcb=i;
		*tf=pcb[i].tf;
		if(curpcb==1||curpcb==0)
			gdt[SEG_UDATA].base_31_24=0;
		else
			gdt[SEG_UDATA].base_31_24=1;
		setGdt(gdt,sizeof(gdt));
	}
	return 0;
}

int sys_post(struct TrapFrame *tf)
{
	xhl[0].value++;
	if(xhl[0].value<=0)
	{
		int i=xhl[0].wait[0];
		pcb[i].state=RUNNABLE;
		pcb[i].timeCount=10;
		for(i=0;i<xhl[0].wait_count-1;++i)
			xhl[0].wait[i]=xhl[0].wait[i+1];
		--xhl[0].wait_count;
	}
	return 0;
}

int sys_destroy(struct TrapFrame *tf)
{
	return 0;
}
