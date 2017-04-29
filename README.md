* 实验流程如下
>Bootloader从实模式进入保护模式,加载内核至内存，并跳转执行
>内核初始化IDT（Interrupt Descriptor Table，中断描述符表），初始化GDT，初始化 TSS（Task State Segment，任务状态段）
>内核加载用户程序至内存，对内核堆栈进行设置，通过iret切换至用户空间，执行用户程序
>用户程序调用自定义实现的库函数printf打印字符串
>printf基于中断陷入内核，由内核完成在视频映射的显存地址中写入内容，完成字符串的打印
