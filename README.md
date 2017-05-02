[实现系统调用库函数printf](http://dislab.nju.edu.cn/taohuang/lab2.html "看什么")
===
实验流程如下
---
>* Bootloader从`实模式`进入`保护模式`,加载内核至内存，并跳转执行
>* 内核初始化`IDT（Interrupt Descriptor Table，中断描述符表）`，初始化`GDT`，初始化` TSS（Task State Segment，任务状态段）`
>* 内核加载用户程序至内存，对内核堆栈进行设置，通过`iret`切换至用户空间，执行用户程序
>* 用户程序调用`自定义`实现的库函数printf打印字符串
>* printf基于中断陷入内核，由内核完成在视频映射的`显存地址`中写入内容，完成字符串的打印
