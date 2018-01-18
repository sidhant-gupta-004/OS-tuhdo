#!/bin/sh

nasm -f bin $1 -o bootloader
dd conv=notrunc if=bootloader of=disk.img bs=512 count=1
