org 0000h

MAIN:
	; Chamar esta sub-rotina gasta 50ms
	CALL delay
	JMP $

; Gasta 50ms
delay:
	MOV R1, #100
loop:
	MOV R0, #250
	DJNZ R0, $
	DJNZ R1, loop
	RET