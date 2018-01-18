; A simple bootloader.

org 0x7c00	; tells the program that the data at 0x7c00 is executable code
bits 16		; declares 16 bit architecture
start: jmp boot

msg db "Welcome to the bootloader!", 0h	; declares a string
len equ $ - msg				; declares a variable len and sets it equal to current address of the pointer (end of string) - start of string.
					; Thus len = strlen(msg)

movCursor:
	mov ah, 0x02			; ah: value for SET CURSOR option
	mov bh, 0x00			; bh: page number, usually 0 
	mov dh, 10			; dh: row number for cursor
	mov dl, 24			; dl: column number for cursor

	int 0x10			; INTERRUPT 0x10
	ret

printString:
	mov ah, 0x03			; ah: value for GET CURSOR option
	mov bh, 0x00			; bh: page number, usually 0

	int 0x10			; Gets the cursor position and stores it inside the dh and dl registers

	mov bp, msg			; bp: the starting of the string msg, from where the program has to start printing
	mov ax, 0x00			; ax: setting ax to 0
	mov es, ax			; es: setting es to ax (0). This is done as the string is null terminated
					; We tell the program to read the string at bp till es (NULL byte)

	mov ah, 0x13			; ah: value for WRITE STRING option
	mov al, 0x01			; al: write mode. First bit stands for updating the cursor after writing. We set it to 1.
	mov bh, 0x00			; bh: page number, usually 0
	mov bl, 0x07			; bl: color. Higher 8 bits tell background color and lower 8 bits tell text (or foreground) color
					; Black is 0000
	mov cx, len			; cx: length of string to print

	int 0x10
	ret

print:
	mov al, 0x41	; al: character to print
	mov ah, 0x0e	; ah: value for TELETYPE OUTPUT option; that is: character output
	mov bl, 0x07	; bl: color
	mov bh, 0x00	; bh: page number

	int 0x10
	ret

boot:
	cli ; instruction to clear the interrupts flag
	cld ; instruction to clear the direction flag: referring to the direction of execution here (most probably)
	call movCursor
	call printString
	hlt ; Stop

; Generic Stuff
; v v v v v v v

times 510 - ($-$$) db 0 ; TIMES x y: repeat instruction y x times; db x: write x in byte form at the memory
			; $ refers to the address of the IP; $$ refers to the address of the starting of the section (I guesss start or boot here)
			; Hence this instruction essentially clears everything other than

dw 0xaa55		; Signature for a bootloader. These 2 bytes: 0xaa and 0x55 must be present at the end of a valid bootloader
