#include "lib.h"
#include "types.h"
#include <stdarg.h>
#include <string.h>
/*
 * io lib here
 * 库函数写在这
 */
extern int curpcb;
int32_t syscall(int num, uint32_t a1,uint32_t a2,
		uint32_t a3, uint32_t a4, uint32_t a5)
{
	int32_t ret = 0;
	asm volatile("int $0x80":"=a"(ret):"a"(num),"b"(a1),"c"(a2),"d"(a3),"D"(a4),"S"(a5));	
	return ret;
}

void printchar(char ch)
{
	syscall(4,1,ch,0,0,0);
}
void printstr(char *p)
{
	while(*p!='\0')
	{
		syscall(4,1,*p,0,0,0);
		p++;
	}
}
void printint(int i)
{
	if(i<0)
	{
		char p[20];
		int j=0;
		if(i==-2147483648)
		{
			strcpy(p,"8463847412-");
			j=10;
		}
		else
		{
			i*=-1;
			while(i!=0)
			{
				if(i<0)
					i*=-1;
				p[j]=i%10+'0';
				++j;
				i/=10;
			}
			--j;
			printchar('-');
		}
		for(;j>=0;--j)
			printchar(p[j]);
		return ;
	}
	if(i==0)
		return ;
	printint(i/10);
	printchar((char)(i%10+'0'));
}
void printhex(unsigned int ui)
{
	if(ui==0)
		return ;
	printhex(ui/16);
	ui%=16;
	if(ui<10)
		printchar((char)(ui%16+'0'));
	else
		printchar((char)(ui%16+'a'-10));
}

void printf(const char *format,...){
	char ch;
	int i;
	char *p=0;
	va_list arg;  
    va_start(arg, format);  
  
    while (*format)  
    { 
		if(*format=='%')
		{
			format++;
			switch(*format)
			{
				case 'c':{
					ch=va_arg(arg,int);
					printchar(ch);
					break;}
				case 's':{
					p=va_arg(arg,char*);
					printstr(p);
					break;}
				case 'd':{
					i=va_arg(arg,int);
					if(i==0)
					{
						printchar('0');
						break;
					}
					printint(i);
					break;}
				case 'x':
					i=va_arg(arg,unsigned int);
					if(i==0)
						printchar('0');
					else
						printhex(i);
					break;
			}
		}
		else
			syscall(4,1,*format,0,0,0);
        format++;  
    }
    va_end(arg);  
}

int fork()
{
	int ret=0;
	asm volatile("pushl %eax");
	asm volatile("movl $0x2,%eax");
	asm volatile("int $0x80");
	asm volatile("movl %%eax,%0":"=m"(ret));
	asm volatile("popl %eax");
	return ret;
	//return 0;
}
int sleep(uint32_t time)
{
	asm volatile("pushl %eax");
	asm volatile("pushl %ebx");
	asm volatile("movl $0x3,%eax");
	asm volatile("movl %0,%%ebx"::"m"(time));
	asm volatile("int $0x80");
	asm volatile("popl %ebx");
	asm volatile("popl %eax");
	return 0;
}
int exit()
{
	asm volatile("pushl %eax");
	asm volatile("movl $0x5,%eax");
	asm volatile("int $0x80");
	asm volatile("popl %eax");
	return 0;
}

int sem_init(sem_t *sem,uint32_t value)
{
	int ret=0;
	asm volatile("pushl %eax");
	asm volatile("pushl %ebx");
	asm volatile("movl $0x6,%eax");
	asm volatile("movl %0,%%ebx"::"m"(value));
	asm volatile("int $0x80");
	asm volatile("movl %%eax,%0":"=m"(ret));
	asm volatile("popl %ebx");
	asm volatile("popl %eax");
	return ret;
}

int sem_wait(sem_t *sem)
{
	asm volatile("pushl %eax");
	asm volatile("movl $0x7,%eax");
	asm volatile("int $0x80");
	asm volatile("popl %eax");
	return 0;
}

int sem_post(sem_t *sem)
{
	asm volatile("pushl %eax");
	asm volatile("movl $0x8,%eax");
	asm volatile("int $0x80");
	asm volatile("popl %eax");
	return 0;
}

int sem_destroy(sem_t *sem)
{
	asm volatile("pushl %eax");
	asm volatile("movl $0x9,%eax");
	asm volatile("int $0x80");
	asm volatile("popl %eax");
	return 0;
}
