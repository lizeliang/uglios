.globl begtext, begdata, begbss, endtext, enddata, endbss
.text 
begtext:
.data 
begdata:
.bss 
begbss:

entry start
start:
	jmpi go,0x07c0
go:
	mov ax,cs
	mov ds,ax
	mov es,ax

	mov cx,#12
	mov dx,#0x0000
	mov bx,#0x000c
	mov bp,#msg
	mov ax,#0x1301
	int 0x10
hang:
	jmp hang
msg:
	.ascii "Hello world!"
	.byte 13,10
.org 510
.word 0xAA55
.text 
endtext:
.data 
enddata:
.bss 
endbss:
