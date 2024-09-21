org 0000h

main: 
	; ---- Transferência de Dados ---- ;
	MOV A, #12h		; Move imediatamente o valor 12 em hexadecimal para o acumulador

	MOV A, #00h 	; Zera o acumulador
	
	; Os bits a seguir definem o banco de registradores desejado
	CLR RS1 		; Definindo o banco 0
	CLR RS0 		; Definindo o banco 0
	MOV R2, #34h 	; Move o valor 34h para o registrador R2

	MOV B, #56 		; Move imediatamente para o registrador B o valor 56h

	MOV 0x40, P1 	; Move o conteúdo de P1 para o endereço 0x40

	CLR RS1 		; Definindo o banco 1
	SETB RS0		; Definindo o banco 1

	MOV R4, 0x40 	; Move o conteúdo do endereço 0x40 para o registrador R4
	MOV 0x50, R4 	; Move o conteúdo do registrador R4 para o endereço 0x50

	MOV R1, #01010000b ; 50 em hex = 80 em dec

	MOV A, @R1 		; Move para A o conteúdo apontado pelo endereço que é igual ao valor contido em R1

	; Registrador de 16 bits
	; Dividido em DPH e DPL, 8 em cada
	MOV DPTR, #0x9A5B ; Move o valor 9A5Bh para o registrador de 16 bits DPTR
	
	; ---- Instruções Aritméticas ---- ;
	
	MOV A, #2 		; Move o valor 2 para o acumulador
	MOV B, #3 		; Move o valor 3 para o registrador B
	MOV R4, #7 		; Move o valor 7 para o registrador R4
	
	ADD A, R4 		; Soma, o valor é salvo em A
	DEC A 			; Decrementa A em 1 (A--)
	DEC A 			; Decrementa A em 1 (A--)
	DEC A 			; Decrementa A em 1 (A--)
	
	INC B 			; Incrementa B em 1 (B++)
	
	SUBB A, B 		; Subtração, o valor é salvo em A 

	MUL AB 			; Multiplicação, B fica zerado a partir daqui e o valor é salvo em A
	
	INC B 			; Incrementa B em 1 (B++)
	INC B 			; Incrementa B em 1 (B++)
	
	DIV AB 			; Divisão, B fica zerado e o valor é salvo em A

	MOV 0x70, A 	; Move o conteúdo do acumulador A para o endereço 0x70
	MOV 0x71, B 	; Move o conteúdo do registrador B para o endereço 0x71
	
	; ---- Instruções Lógicas Booleanas ---- ;
	
	MOV A, #11001100b ; 204
	MOV B, #10101010b ; 170
	
	ANL A, B 		; A AND B
	; A = 10001000
	
	RR A 			; Rotaciona à direita
	RR A 			; Rotaciona à direita novamente
	; A = 00100010
	
	CPL A 			; Complemento de A (inverte os bits)
	; A = 11011101
	
	RL A 			; Rotaciona à esquerda
	RL A 			; Rotaciona à esquerda novamente
	; A = 01110111
	
	ORL A, B 		; A OR B
	; A = 11111111
	
	XRL A, B 		; A XOR B
	; A = 01010101
	
	SWAP A 			; Troca os nibbles
	; A = 01010101
	
	MOV PSW, A		; Move o conteúdo de A para o registrador PSW
	; PSW ficou com o último bit zerado (bit de paridade)
	; 01010100

	; ---- Instruções de Desvio Condicional e Incondicional ---- ;

 	CLR A 			; Limpa A, A = 0

inicio:
	MOV R0, #10h	; Move o valor 10h para R0
	JZ bloco2 		; Pula para bloco2 caso A = 0
	JNZ bloco3 		; Pula para bloco3 caso A != 0
	NOP 			; No Operation

bloco2:
	MOV A, R0 		; Move o valor de R0 para A
	; A = 10
	JMP inicio 		; Pula incondicionalmente para "inicio"

bloco3:
	DJNZ R0, bloco3	; Decresce R0 até ser zero. Quando for zero, pula para bloco3
	CLR A 			; Limpa A
	JMP inicio 		; Pula incondicionalmente para "inicio"


end
