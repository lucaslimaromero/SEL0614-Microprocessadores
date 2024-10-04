org 0000h

SW EQU P2

; Operacoes serao realizadas com o acumulador
MAIN: 
	MOV A, SW
	CJNE A, #0FFh, pressed
	SJMP MAIN

pressed:
	CPL A ; inverte os bits
	
	; Pula para o switch pressionado
	JB ACC.0, sw_0
	JB ACC.1, sw_1 
	JB ACC.2, sw_2
	JB ACC.3, sw_3
	JB ACC.4, sw_4
	JB ACC.5, sw_5
	JB ACC.6, sw_6
	JB ACC.7, sw_7

; Atribui o valor ao R0 e loopa
sw_0:
	MOV R0, #0
	SJMP MAIN

sw_1:
	MOV R0, #1
	SJMP MAIN

sw_2:
	MOV R0, #2
	SJMP MAIN

sw_3:
	MOV R0, #3
	SJMP MAIN

sw_4:
	MOV R0, #4
	SJMP MAIN

sw_5:
	MOV R0, #5
	SJMP MAIN

sw_6:
	MOV R0, #6
	SJMP MAIN
	
sw_7:
	MOV R0, #7
	SJMP MAIN
	