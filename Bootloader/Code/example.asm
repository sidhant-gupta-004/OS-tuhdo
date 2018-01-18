; mov eax, 1
; inc eax

bits 16

jmp 0x78

msg db "Well, an OS is technically the software loaded by the bootloader, so looks like this is it, welcome to my kernel. :)", 0h
len equ $ - msg

mov ah, 0x03	; ah: routine for GET CURSOR
mov bh, 0x00	; bh: page number

int 0x10	; INTERRUPT for video I/O

mov bp, msg+0x500	; bp: starting address of string
mov ax, 0x00
mov es, ax	; es: last value of string to print (always NULL)

mov ah, 0x13	; ah: routine for PRINT STRING
mov al, 0x01	; al: write mode. Last bit 1 denotes "MOVE CURSOR AFTER WRITING"
mov bh, 0x00	; bh: page number, usually 0
mov bl, 0x07	; bl: color. Upper 4 bits for background and lower 4 bits for text (or foreground). 0000 is black

mov cx, len

int 0x10
