ENTRY(main)

SECTIONS
{
	. = 0x10000;	/* Points the location counter to the address 0x10000 */
	.text : { *(.text) }	/* Starts writing the .text section of all input object files at the location counter (here 0x10000) onwards. */

	. = 0x8000000;	/* Points the location counter to the address 0x8000000 */
	.data : { *(.data) }	/* Starts writing the .text section of all input object files at the location counter (here 0x8000000) onwards. */
	.bss : { *(.bss) }	/* Starts writing the .text section of all input object files at the location counter (here the end of .data section) onwards. */
}
