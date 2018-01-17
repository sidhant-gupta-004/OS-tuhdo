#!/bin/sh

dd if=Code/example of=disk.img count=1 bs=512 oflag=append conv=notrunc
exit

o="-o"

if test "$1" = "$o"
then
	dd if=$2 of=disk.img bs=512 count=1 seek=512

else
	dd if=$1 of=disk.img bs=512 count=1 oflag=append conv=notrunc
fi
