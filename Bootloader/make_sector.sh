#!/bin/sh

nasm -f bin Code/$1 -o Code/$2
dd if=Code/$2 of=disk.img count=1 bs=512 conv=notrunc seek=1
