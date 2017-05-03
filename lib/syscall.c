#include "lib.h"
#include "types.h"
#include <stdarg.h>
#include <string.h>
/*
 * io lib here
 * 库函数写在这
 */
int32_t syscall(int num, uint32_t a1,uint32_t a2,
		uint32_t a3, uint32_t a4, uint32_t a5)
{
	int32_t ret = 0;

	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/
/*	asm volatile("movl %0, %%eax"::"g"(4));
	asm volatile("movl %0, %%ebx"::"g"(a1));
	asm volatile("movl %0, %%ecx"::"g"(a2));
	asm volatile("movl $4, %eax");
	asm volatile("movl %0, %%ecx"::"g"(num));
	asm volatile("movl %0, %%edx"::"g"(a3));
	asm volatile("movl %0, %%edi"::"g"(a4));
	asm volatile("movl %0, %%esi"::"g"(a5));

	asm volatile("int $0x80");*/

	asm volatile("int $0x80":"=a"(ret):"a"(num),"b"(a1),"c"(a2),"d"(a3),"D"(a4),"S"(a5));	
	return ret;
}

void printchar(char ch)
{
	syscall(4,1,ch,0,0,0);
	/*asm volatile("movl %0, %%eax;\
               movl %1, %%ecx;\
			   movl %2, %%ebx;\
				movl %3, %%edx;\
				movl %4, %%edi;\
				movl %5, %%esi;\
             int $0x80\
        "::"i"(4),"m"(ch),"i"(1),"i"(0),"i"(0),"i"(0));*/
}
void printstr(char *p)
{
	while(*p!='\0')
	{
		//printchar(*p);
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
	//printint(ui);

	/*if(ui<0)
	{
		//unsigned int i=(unsigned int)ui;
		char p[20];
		int j=0;
		if(ui==-2147483648)
		{
			strcpy(p,"00000008");
			j=7;
		}
		else
		{
			//printchar('-');
			ui*=-1;
			while(i!=0)
			{
				if(i<0)
					i*=-1;
				if(i%16<=9)
					p[j]=i%16+'0';
				else
					p[j]=i%16-10+'a';
				i/=16;
				j++;
			}
			for(;j<8;++j)
				p[j]=0;
			int k=j-1;
			for(;k>=0;--k)
			{
				if(p[k]<='5'&&p[k]>='0')
					p[k]='f'-(p[k]-'0');
				else if(p[k]>='6'&&p[k]<='9')
					p[k]=-1*(p[k]-'0')+15+'0';
				else
					p[k]=-1*(p[k]-'a')+5+'0';
			}
			--j;
			ui=-ui;
			ui+=1;
			printhex(ui);
		}
		while(p[j]=='0')
			--j;
		for(;j>=0;--j)
			printchar(p[j]);
		return ;
	}*/
	if(ui==0)
	{
		//printstr("0x");
		//printchar('0');
		return ;
	}
	//printstr("0x");
	printhex(ui/16);
	ui%=16;
	if(ui<10)
		printchar((char)(ui%16+'0'));
		//printint(i);
	else
		printchar((char)(ui%16+'a'-10));
}

void printf(const char *format,...){

	//char buf[1024];
	//int i=0;
	char ch;
	int i;
	char *p=0;
	va_list arg;  
    va_start(arg, format);  
	//char *fmt=;
  
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
					//++p;
					printstr(p);
					//printstr(va_arg(arg,char*));
					break;}
				case 'd':{
					i=va_arg(arg,int);
					if(i==0)
					{
						printchar('0');
						break;
					}
					/*
					else if(i<=2147483648)
						printint(i);
					else
					{
						i-=4294967295;
						--i;
						printint(i);
					}*/
					printint(i);
					break;}
				case 'x':
					i=va_arg(arg,unsigned int);
					if(i==0)
						printchar('0');
					else
						printhex(i);
					/*i=0;
					if((*p=='0')&&(*(p+1)=='x'))
					{
						break;
						printstr(p);
					}
					else
					{
						while(*p)
						{
							i=i*16+(*p-'0');
						}
						printhex(i);
					}*/
					break;
			}
		}
		else
			syscall(4,1,*format,0,0,0);
        format++;  
    }
//	buf[i]='\0';
//	syscall(4,1,(uint32_t)buf,i,0,0);
    va_end(arg);  
}

int fork()
{
	int ret=0;
	asm volatile("pushl %eax");
	//asm volatile("pushl %ebx");
	asm volatile("movl $0x2,%eax");
	asm volatile("int $0x80");
	asm volatile("movl %%eax,%0":"=m"(ret));
	//asm volatile("popl %ebx");
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
	//asm volatile("pushl %ebx");
	asm volatile("movl $0x5,%eax");
	asm volatile("int $0x80");
	asm volatile("popl %eax");
	return 0;
}

