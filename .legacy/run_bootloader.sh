#!/bin/sh

gdb="-gdb"

if test "$1" = "$gdb"
then
	qemu-system-i386 -machine q35 -drive file=disk.img,format=raw,index=0,if=floppy -gdb tcp::4444 -S
	# This option allows for debugging the QEMU VM through gdb as you run it. The connection is establised 
	# on your localhost at port 4444. The -S option stops the VM from running
	# until connection is established by the debugger.
else
	qemu-system-i386 -machine q35 -drive file=disk.img,format=raw,index=0,if=floppy
fi
