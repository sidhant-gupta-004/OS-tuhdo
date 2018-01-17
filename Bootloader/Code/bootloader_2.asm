; Another simple bootloader

org 0x7c00
bits 16
start: jmp boot

msg db "Loading the Operating System", 0h

boot:
	cli	; clear the interrupt flag
	cld	; clear the direction flag

	mov ax, 0x50	; ax: set to 0x50
	mov es, ax	; es: set to ax (0x50)
	xor bx, bx	; bx: set to 0 by self-xoring
			; Used to set the buffer into which our program would be copied in from the sector

	mov ah, 0x02	; routine for READING INTO MEMORY
	mov al, 0x02	; al: number of sectors to read (= 2)
	mov cl, 0x02	; cl: sector number (= 2)
	mov ch, 0x00	; ch: track (/cylinder) number (= 0)
	mov dh, 0x00	; dh: head number (head as in, the R/W "head" of a storage device) (= 0)
	mov dl, 0x00	; dl: drive number (floppy1, floppy2, drive0, drive1...)

	int 0x13
	jmp 0x0:0x500	; jump to the buffer, which now should contain the code we read in from the other sector, and execute it.

times 510 - ($ - $$) db 0
dw 0xaa55
