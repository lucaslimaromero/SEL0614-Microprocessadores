    org 0000h ; Começa no endereço 0
    jmp main
	org 0033h

; Definições de LED e Switch
LED EQU P1.0 ; LED 0 rotulo de P1.0
SW  EQU P2.7 ; Switch 7 rotulo de P2.7

main:
	; Ligando LED (Chave ligada)
	JB SW, $ ; While chave desligada 1
	; Chave Ligou!
	CLR LED ; Ligo o LED

	; Desligando LED (Chave Desligada)
	JNB SW, $ ; While chave ligada 0
	; Chave desligou!
	SETB LED ; Desligo o LED

	JMP main ; Restaura o ciclo

end