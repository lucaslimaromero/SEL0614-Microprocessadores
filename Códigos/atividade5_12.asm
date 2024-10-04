org 0000h

; Declarando as variaveis
LED EQU P1.0
SW EQU P2.7
JMP MAIN
 
; Verifica qual o estado de SW (Loop)
MAIN:
	JNB SW, ON
	JB SW, OFF
	
; Caso SW = 0, ON
ON:
	CLR LED
	JMP MAIN

; Caso SW = 1, OFF
OFF:
	SETB LED
	JMP MAIN
	