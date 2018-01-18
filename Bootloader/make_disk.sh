#!/bin/sh

rm disk.img
dd if=/dev/zero of=disk.img bs=512 count=2880
