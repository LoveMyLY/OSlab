QEMU = qemu-system-i386

os.img:
	@cd bootloader; make
	@cd kernel; make
	@cd app; make
	cat bootloader/bootloader.bin kernel/kMain.elf app/uMain.elf > os.img

play: os.img
	$(QEMU) -serial stdio os.img

debug: os.img
	$(QEMU) -serial stdio -s -S os.img

clean:
	@cd bootloader; make clean
	@cd kernel; make clean
	@cd app; make clean
	rm -f os.img

run:
	make clean
	make os.img
	objdump -S kernel/kMain.elf > kernel/main.s
	objdump -S app/uMain.elf > app/main.s
	clear
	make play

gdb:
	qemu-system-i386 -s -S os.img
