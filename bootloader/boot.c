#include "boot.h"
#include<string.h>
#define SECTSIZE 512

void bootMain(void) {
	/* 加载内核至内存，并跳转执行 */
	char buf[102400],*p=buf;
	int i=1;
	for(i=1;i<=200;++i)
	{
		readSect((void *)p,i);
		p+=SECTSIZE;
	}
	struct ELFHeader *elf=(struct ELFHeader*)buf;
	struct ProgramHeader *ph=(void *)(buf+elf->phoff),*eph=ph+elf->phnum;
	for(;ph<eph;++ph)
	{
		if(ph->type==1)
		{
			memcpy((void *)ph->vaddr,buf+ph->off,ph->memsz);
			memset((void *)(ph->vaddr+ph->filesz),0,ph->memsz-ph->filesz);
		}
	}
	void (*entry)(void)=(void *)elf->entry;
	entry();
}

void waitDisk(void) { // waiting for disk
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) { // reading a sector of disk
	int i;
	waitDisk();
	outByte(0x1F2, 1);
	outByte(0x1F3, offset);
	outByte(0x1F4, offset >> 8);
	outByte(0x1F5, offset >> 16);
	outByte(0x1F6, (offset >> 24) | 0xE0);
	outByte(0x1F7, 0x20);

	waitDisk();
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}
