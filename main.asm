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
	
	inputPrompt		db	"Please enter an unsigned int", 0h
	
	; Data to be used in the program
	
	A	db	10		;Byte
	B	dw	20		;Word
	C	dd	30		;Double word
	
section .bss
  ;Uninitialized memory reservations go here
  
	D	resd	4		;Reserve a double word of 4 bytes

section .text

global _start
_start:
  nop
  ;Code starts here

	push	welcomePrompt
	call	PrintString
	call	Printendl
	
	push	inputPrompt
	call	PrintString
	call	InputUInt
	call	Printendl
	
	call	PrintRegisters

  ;Code ends here
  nop
  mov eax,1 ; Exit system call value
  mov ebx,0 ; Exit return code
  int 80h ; Call the kernel
