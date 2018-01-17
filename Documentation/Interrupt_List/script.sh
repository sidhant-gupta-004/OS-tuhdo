#!/bin/sh

is="c d e f"

for i in $is
do
	unzip interrupt_list_$i.zip -d interrupt_list_$i; rm interrupt_list_$i.zip
done
