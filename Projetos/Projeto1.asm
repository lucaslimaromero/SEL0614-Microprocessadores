;1 = 0001
;2 = 0010
;3 = 0011
;4 = 0100
;5 = 0101
;6 = 0110
;7 = 0111
;8 = 1000
;9 = 1001
;
; O display acende no nível lógico 0.
;    xgfedcba
; 0: x1000000
; 1: x1111001
; 2: x0100100
; 3: x0110000
; 4: x0011001
; 5: x0010010
; 6: x0000010
; 7: x0000111
; 8: x0000000
; 9: x0011000
;
; Pode também fazer SETB P1.3 // CLR P1.3
; JB 2.1, label (salta se o switch 1 estiver pressionado)
; LED EQU P1.3 (variável)
; SW B2.1
; Chaves A1 e A0 selecionam o display (P3.3 e P3.4)
; DJNZ R0, $

org 0000h
MOV SP, #4Fh

; Quando algum switch for pressionado, A < 0xFF
standby: ; Nenhum switch pressionado.
	MOV B, P2
	MOV A, #0xFF
	CLR C
	SUBB A, B
	JZ standby
	; Se chegou aqui, algum switch foi pressionado.
	JMP show

check_sw0:
	; Se A = 0xFE, o sw0 foi pressionado
	; Se A = 0xFD, o sw1 foi pressionado
	; Se A = 0xFC, os dois sw foram pressionados
	; O 1 prevalece sobre o 0.
	CJNE A, #01h, sw1
	; Se chegou aqui, somente 0 foi pressionado
	ACALL DELAY_LOOP_START
	RET

sw1:
	MOV R3, #04h
repeat_sw1:
	ACALL DELAY_LOOP_START
	DJNZ R3, repeat_sw1
	RET


show:
	MOV P1, #11000000b		;0
	ACALL check_sw0
	MOV P1, #11111001b		;1
	ACALL check_sw0
	MOV P1, #10100100b		;2
	ACALL check_sw0 
	MOV P1, #10110000b		;3
	ACALL check_sw0
	MOV P1, #10011001b		;4
	ACALL check_sw0
	MOV P1, #10010010b		;5
	ACALL check_sw0
	MOV P1, #10000010b		;6
	ACALL check_sw0
	MOV P1, #11111000b		;7
	ACALL check_sw0
	MOV P1, #10000000b		;8
	ACALL check_sw0
	MOV P1, #10011000b		;9
	ACALL check_sw0
	JMP standby

; Estrutura para gastar tempo
DELAY_LOOP_START:
	MOV R2, #16				; 1ciclo
DELAY_LOOP1:
	MOV R1, #248			; 1ciclo
DELAY_LOOP2:
	MOV R0, #20				; 1ciclo
DELAY_LOOP3:
	NOP 					;1ciclo
	DJNZ R0, DELAY_LOOP3	;2 ciclos
	DJNZ R1, DELAY_LOOP2	;2 ciclos
	DJNZ R2, DELAY_LOOP1	;2 ciclos
	RET

; 1 + 16*(1+2) + 16*248*(1+2) + 16*248*20*(1+2) =  


end
