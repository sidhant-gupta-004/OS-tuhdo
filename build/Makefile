DISK_IMG=disk.img
BOOTLOADER=bootloader/bootloader.o
OS=os/example.o

all: bootdisk

bootdisk: bootloader os
	dd if=/dev/zero of=$(DISK_IMG) count=2880 bs=512

	dd conv=notrunc if=$(BOOTLOADER) of=$(DISK_IMG) bs=512 count=1 seek=0
	dd conv=notrunc if=$(OS) of=$(DISK_IMG) bs=512 count=1 seek=1

debug:
	qemu-system-i386 -machine q35 -drive file=$(DISK_IMG),if=floppy,index=0,format=raw -gdb tcp::4444 -S

run:
	qemu-system-i386 -machine q35 -drive file=$(DISK_IMG),if=floppy,index=0,format=raw
