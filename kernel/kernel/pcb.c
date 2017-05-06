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
extern int curpcb;


void IDLE()
{
	while(1)
	{
		//asm volatile("hlt");
		waitForInterrupt();
	}
}

void debug()
{
	putChar('\n');
	int i=1;
	for(i=1;i<MAX_PCB_NUM&&pcb[i].inuse==1;++i)
	{
		putChar('0'+pcb[i].state);
		if(pcb[i].state==SLEEP)
			putChar('0'+pcb[i].sleepTime);
		else
			putChar('0'+pcb[i].timeCount);
		putChar(' ');
	}
}
void Intrtime(struct TrapFrame *tf)
{
	//putChar('a');
	//putChar('0'+curpcb);
	pcb[curpcb].tf=*tf;
	pcb[curpcb].state=RUNNABLE;
	//putChar('0'+pcb[curpcb].timeCount);
	pcb[curpcb].timeCount--;
	//putChar('0'+pcb[curpcb].timeCount);
	int i=1,index=0;
	for(i=1;i<MAX_PCB_NUM;++i)
	{
		if(pcb[i].inuse==1&&pcb[i].state==SLEEP)
		{
			pcb[i].sleepTime--;
			if(pcb[i].sleepTime<=0)
			{
				pcb[i].state=RUNNABLE;
				pcb[i].timeCount=10;
			}
		}
		/*putChar('\n');
		putChar('0'+pcb[1].state);
		putChar('0'+pcb[1].sleepTime);	*/
		/*if(pcb[i].sleepTime==0)
		{
			pcb[i].state=RUNNABLE;
			pcb[i].timeCount=10;
		}*/
	}
	if(pcb[curpcb].timeCount<=0&&curpcb!=0)
	{
		index=0;
		pcb[curpcb].state=RUNNABLE;
		for(i=1;i<MAX_PCB_NUM;++i)
		{
			/*putChar('\n');
			putChar('0'+i);
			putChar('0'+pcb[i].state);
			putChar('0'+pcb[i].inuse);*/
			//putChar('\n');
			if(pcb[i].state==RUNNABLE&&pcb[i].inuse==1&&i!=curpcb)
			{
				index=i;
				break;
			}
		}
		pcb[index].state=RUNNING;
		pcb[index].timeCount=10;
		curpcb=index;
	}
	else if(curpcb==0)
	{
		index=0;
		for(i=1;i<MAX_PCB_NUM;++i)
		{
			if(pcb[i].state==RUNNABLE&&pcb[i].inuse==1&&i!=0)
			{
				index=i;
				break;
			}
		}
		pcb[index].state=RUNNING;
		pcb[index].timeCount=10;
		curpcb=index;
	}
	pcb[curpcb].state=RUNNING;
	*tf=pcb[curpcb].tf;
	if(curpcb==1)
		//gdt[SEG_UDATA].base_31_24=0;
		gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	else if(curpcb==2)
		gdt[SEG_UDATA] = SEG(STA_W,         0x1000000,       0xffffffff, DPL_USER);
	setGdt(gdt, sizeof(gdt));
		//gdt[SEG_UDATA].base_31_24=1;
	//gdt[SEG_UDATA].base_15_0=0;
	//gdt[SEG_UDATA].base_23_16=0;
	//debug();
}


void initPcb()
{
	int i=0;
	for(i=0;i<MAX_PCB_NUM;++i)
	{
		pcb[i].inuse=0;
		//putChar('0'+pcb[i].inuse);
	}

	pcb[0].inuse=1;
	pcb[0].state=RUNNABLE;
	pcb[0].pid=0;
	pcb[0].timeCount=10;
	pcb[0].sleepTime=0;
	pcb[0].tf.cs=0x08;
	pcb[0].tf.eip=(uint32_t)IDLE;
	pcb[0].tf.ss=0x10;
	pcb[0].tf.eflags=0x202;
	pcb[0].tf.esp=0x7800000;
	pcb[0].tf.ebp=0x7800000;

	pcb[1].inuse=1;
	pcb[1].state=RUNNING;
	pcb[1].pid=1;
	pcb[1].timeCount=10;
	pcb[1].sleepTime=0;
	pcb[1].tf.cs=0x1b;
	pcb[1].tf.eip=0x200000;
	pcb[1].tf.ss=0x23;
	pcb[1].tf.eflags=0x202;
	pcb[1].tf.esp=0x6000000;
	pcb[1].tf.ebp=0x6000000;

	curpcb=1;
}

int sys_fork(struct TrapFrame *tf)
{
	//putChar('b');
	//putChar('0'+curpcb);
	pcb[curpcb].tf=*tf;
	pcb[curpcb].state=RUNNABLE;
	int i=1,index=-1;
	for(i=1;i<MAX_PCB_NUM;++i)
	{
		if(pcb[i].inuse==0)
		{
			pcb[i].inuse=1;
			index=i;
			break;
		}
	}
	
	//for(i=0;i<MAX_PCB_NUM;++i)
		//putChar('0'+pcb[i].inuse);
	pcb[index].state=RUNNABLE;
	pcb[index].pid=index;
	pcb[index].timeCount=10;
	pcb[index].sleepTime=0;
	pcb[index].tf=pcb[curpcb].tf;
	pcb[index].tf.eax=0;
	pcb[index].tf.esp=pcb[curpcb].tf.esp;
	pcb[index].tf.ebp=pcb[curpcb].tf.ebp;
	memcpy((void *)pcb[index].tf.esp+0x1000000,(void *)pcb[curpcb].tf.esp,0x6000000-pcb[index].tf.esp);
//	pcb[index].tf.esp+=0x1000000;
//	pcb[index].tf.ebp+=0x1000000;
	memcpy((void *)0x1000000+0x200000,(void *)0x200000,0x2000);
	pcb[curpcb].tf.eax=pcb[index].pid;
	curpcb=index;
	pcb[curpcb].state=RUNNING;
	*tf=pcb[curpcb].tf;
	/*if(pcb[1].tf.esp==pcb[2].tf.esp)
		putChar('y');
	else
		putChar('n');*/
	/*if(curpcb==1)
		gdt[SEG_UDATA].base_31_24=0;
	else if(curpcb==2)
		gdt[SEG_UDATA].base_31_24=1;
	gdt[SEG_UDATA].base_15_0=0;
	gdt[SEG_UDATA].base_23_16=0;*/
	if(curpcb==1)
		//gdt[SEG_UDATA].base_31_24=0;
		gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	else if(curpcb==2)
		gdt[SEG_UDATA] = SEG(STA_W,         0x1000000,       0xffffffff, DPL_USER);
	setGdt(gdt, sizeof(gdt));
	/*putChar('\n');
	putChar('0'+pcb[1].state);
	putChar(' ');
	putChar('0'+pcb[1].inuse);
	putChar('\n');*/
	return index;
}

int sys_sleep(struct TrapFrame *tf)
{
	//putChar('c');
	//putChar('0'+curpcb);
	//debug();
	pcb[curpcb].tf=*tf;
	pcb[curpcb].state=RUNNABLE;
	pcb[curpcb].timeCount--;
	int i=1,index=0;
	for(i=1;i<MAX_PCB_NUM&&pcb[i].inuse==1;++i)
	{
		if(pcb[i].state==SLEEP)
		{
			pcb[i].sleepTime--;
			if(pcb[i].sleepTime<=0)
			{
				pcb[i].state=RUNNABLE;
				pcb[i].timeCount=10;
			}
		}	
		/*if(pcb[i].sleepTime==0)
		{
			pcb[i].state=RUNNABLE;
			pcb[i].timeCount=10;
		}*/
	}
	pcb[curpcb].sleepTime=tf->ebx;
	pcb[curpcb].state=SLEEP;
	for(i=1;i<MAX_PCB_NUM;++i)
	{
		if(pcb[i].inuse==1&&pcb[i].state==RUNNABLE&&i!=curpcb)
		{
			index=i;
			break;
		}
	}
	pcb[index].state=RUNNING;
	pcb[index].timeCount=10;
	curpcb=index;
	*tf=pcb[curpcb].tf;
	/*if(curpcb==1)
		gdt[SEG_UDATA].base_31_24=0;
	else if(curpcb==2)
		gdt[SEG_UDATA].base_31_24=1;
	gdt[SEG_UDATA].base_15_0=0;
	gdt[SEG_UDATA].base_23_16=0;*/

	if(curpcb==1)
		//gdt[SEG_UDATA].base_31_24=0;
		gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	else if(curpcb==2)
		gdt[SEG_UDATA] = SEG(STA_W,         0x1000000,       0xffffffff, DPL_USER);
	setGdt(gdt, sizeof(gdt));
	return 0;
}

int sys_exit(struct TrapFrame *tf)
{
	//putChar('d');
	pcb[curpcb].inuse=0;
	int i=1,index=0;
	for(i=1;i<MAX_PCB_NUM;++i)
	{
		if(pcb[i].inuse==1&&pcb[i].state==RUNNABLE&&i!=curpcb)
		{
			index=i;
			break;
		}
	}
	pcb[index].state=RUNNING;
	pcb[index].timeCount=10;
	curpcb=index;
	for(i=1;i<MAX_PCB_NUM&&pcb[i].inuse==1;++i)
	{
		if(pcb[i].state==SLEEP)
		{
			pcb[i].sleepTime--;
			if(pcb[i].sleepTime<=0)
			{
				pcb[i].state=RUNNABLE;
				pcb[i].timeCount=10;
			}
		}	
	}
	*tf=pcb[curpcb].tf;
	/*if(curpcb==1)
		gdt[SEG_UDATA].base_31_24=0;
	else if(curpcb==2)
		gdt[SEG_UDATA].base_31_24=1;
	gdt[SEG_UDATA].base_15_0=0;
	gdt[SEG_UDATA].base_23_16=0;*/
	if(curpcb==1)
		//gdt[SEG_UDATA].base_31_24=0;
		gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	else if(curpcb==2)
		gdt[SEG_UDATA] = SEG(STA_W,         0x1000000,       0xffffffff, DPL_USER);
	setGdt(gdt, sizeof(gdt));
	return 0;
}

