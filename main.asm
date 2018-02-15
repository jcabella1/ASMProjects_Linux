; Assembler Linux Template
; Program Description: 
	; A program that performs the following equations:
	; A + (B + C) = D
	; (A + C) - B = D

; Author: Jenny Abella

; Creation Date: 13/02/2018

; Revisions: 1

; Date:  19/02/2018           Modified by: 13/02/2018

; Operating System: Linux Mint 64-bit Mate

; IDE/Compiler: Geany / NASM

%include "./functions.inc"

bits 32
section .data
  ;Initialized data definitions go here
	
	welcomePrompt	db	"Welcome to my program", 0dh, 0ah, 0h
	
	valueString		db	"A = 10h, B = 2000h, C = 30000h", 0dh, 0ah, 0h
	
	equation1		dd	"A + (B + C) = D. D = ", 0h
	
	equation2		dd	"(A + C) - B = D. D = ", 0h
	
	
	; Data to be used in the program
	
	A	db	10h		;Byte
	B	dw	2000h	;Word
	C	dd	30000h	;Double word
	
section .bss
  ;Uninitialized memory reservations go here
  
	D	resd	4		;Reserve a double word

section .text

global _start
_start:
  nop
  ;Code starts here

	;Print the welcome message
	push	welcomePrompt
	call	PrintString
	call	Printendl
	
	;Print the values A, B, and C
	push	valueString
	call	PrintString
	call	Printendl
	
	;Print the equation
	push	equation1
	call	PrintString
	
	mov		eax, 0h		; Zero out eax
	mov		ebx, 0h		; Zero out ebx
	
	; Perform the equation: A + (B + C) = D
	mov		ax, [B]		; Move B to ax
	mov		ebx, [C]	; Move C to ebx
	add		eax, ebx	; Add ebx to eax
	add		al, [A]		; Add A to the value in al
	mov		[D], eax	; Move the value in eax to D (final value)
	
	;Print the final value	
	push	dword [D]
	call	Print32bitNumHex	;Print the value in hex
	call	Printendl
	
	;Print out the equation
	push 	equation2
	call	PrintString
	
	; Zero out all values
	mov		eax, 0h
	mov		ebx, 0h
	mov		[D], eax
	
	; Perform the equation: (A + C) - B = D
	mov		al, [A]		; Move A to al
	mov		ebx, [C]	; Move C to ebx
	add		eax, ebx	; Add value in ebx to value in eax
	sub		eax, [B]	; Subtract eax by B
	mov		[D], eax	; Move the final value in eax to D
	
	;Print out the final value
	push	DWORD [D]
	call	Print32bitNumHex	;Print the value in hex
	call	Printendl
	
  ;Code ends here
  nop
  mov eax,1 ; Exit system call value
  mov ebx,0 ; Exit return code
  int 80h ; Call the kernel
