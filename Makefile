
.PHONY: bootdisk bootloader os

all: bootdisk

bootloader:
	make -C bootloader

os:
	make -C os

bootdisk: bootloader os
	make -C build

run:
	make -C build run

debug:
	make -C build debug
