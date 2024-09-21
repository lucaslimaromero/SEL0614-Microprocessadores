org 0000h

main: 
	; ---- Transferência de Dados ---- ;
	MOV A, #12h		;Move imediatamente o valor 12 em hexadecimal para o acumulador

	MOV A, #00h 
	
	; Os bits a seguir definem o banco de registradores desejado
	CLR RS1 		; definindo o banco 0
	CLR RS0 
	MOV R2, #34h

	MOV B, #56 		;Move imediatamente para o reg B

	MOV 0x40, P1 	;Move o conteudo de P1 para o endereço 0x40

	CLR RS1 		;definindo o banco 1
	SETB RS0

	MOV R4, 0x40 	;Move o conteudo do endereco 0x40 para o registrador 4
	MOV 0x50, R4 	;Move o conteudo do registrador 4 para o endereco 0x50

	MOV R1, #01010000b ;50 em hex = 80 em dec

	MOV A, @R1 		;Move para A o conteudo apontado pelo endereco que eh igual ao valor contido em R1

	; Registrador de 16 bits
	; Dividido em DPH e DPL, 8 em cada
	MOV DPTR, #0x9A5B
	
	; ---- Instruções Aritméticas ---- ;
	
	MOV A, #2
	MOV B, #3
	MOV R4, #7
	
	ADD A, R4 		;Soma, o valor eh salvo em A
	DEC A 			;Decrementa A em 1 (A--)
	DEC A
	DEC A
	
	INC B 			;Incrementa B em 1 (B++)
	
	SUBB A, B 		;Subtracao, o valor eh salvo em A 

	MUL AB 			;Multiplicacao, B fica zerado a partir daqui e o valor eh salvo em A
	
	INC B
	INC B
	
	DIV AB 			;Divisao, B fica zerado e o valor eh salvo em A

	MOV 0x70, A
	MOV 0x71, B
	
	; ---- Instruções Lógicas Booleanas ---- ;
	
	MOV A, #11001100b ; 204
	MOV B, #10101010b ; 170
	
	ANL A, B 		;A AND B
	; A = 10001000
	
	RR A 			;Rotaciona a direita
	RR A
	; A = 00100010
	
	CPL A 			;Complemento de A (inverte os bits)
	; A = 11011101
	
	RL A 			;Rotaciona a esquerda
	RL A
	; A = 01110111
	
	ORL A, B 		;A OR B
	; A = 11111111
	
	XRL A, B 		;A XOR B
	; A = 01010101
	
	SWAP A 			;Troca os nibbles
	; A = 01010101
	
	MOV PSW, A
	; PSW ficou com o último bit zerado (bit de paridade)
	; 01010100

	; ---- Instruções de Desvio Condicional e Incondicional ---- ;

 	
	CLR A 			;Limpa A, A = 0

inicio:
	MOV R0, #10h
	JZ bloco2 		;Pula para bloco2 caso A = 0
	JNZ bloco3 		;Pula para bloco3 caso A != 0
	NOP 			;No Operation

bloco2:
	MOV A, R0 
	;A = 10
	JMP inicio 		;Pula incondicionalmente para bloco 3

bloco3:
	DJNZ R0, bloco3	;Decresce enquanto R0 nao for zero. Quando for zero, pula para bloco3
	CLR A
	JMP inicio 		;pula incondicionalmente para incio


end