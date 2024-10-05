org 0000h

; Nomeando as variáveis
SW EQU P2
SW0 EQU P2.0
SW1 EQU P2.1
DISPLAY EQU P1
MOV DPTR, #database	; Aponta DPTR para o início do array 'display'
MOV R0, #0

; Verificar se algum switch está pressionado
STANDBY:
	CLR CY
	MOV A, #0FFh
	SUBB A, SW
	JZ STANDBY	; se A != 0, passa reto
	MOV R0, #0	; Inicializa R0 com 0, o índice do número a ser mostrado
	
; se veio até aqui, algum switch foi pressionado
	
; Este loop acende o display
MAIN_LOOP:
	MOV A, R0				; R0 será o índice, o número a ser mostrado
	MOVC A, @A+DPTR	; Carrega o valor da tabela 'display' (com base no índice) em A
	MOV DISPLAY, A		; Mostra o número no display
    
	ACALL DELAY			; Chama a rotina de delay
	
	; Verifica se algum switch ainda está pressionado
	CLR CY
	MOV A, #0FFh
	SUBB A, SW
	JZ STANDBY 	; Caso sim, retorna ao Standby, cancelando o loop

	INC R0	; Incrementa o índice para o próximo número
	CJNE R0, #10, MAIN_LOOP	; Continua se o índice for menor que 10 (0 a 9)

	; Quando a contagem chega a 10, reinicia-se o loop
	MOV R0, #0
	SJMP MAIN_LOOP	

; Sub-rotina de delay: 250ms 5 100 250
DELAY:
	JNB SW0, DELAY_LOOP_3	; Se SW0 está pressionado (nível 0), pula o loop externo (R4)
	MOV R4, #4					; Se SW0 não estiver pressionado, configura R4 para repetir 4 vezes
DELAY_LOOP_3:
	MOV R3, #5            
DELAY_LOOP_2:
	MOV R2, #100          
DELAY_LOOP_1:
	MOV R1, #250          
DELAY_LOOP_0:
	DJNZ R1, $            
	DJNZ R2, DELAY_LOOP_1 
	DJNZ R3, DELAY_LOOP_2 
	JNB SW0, RETURN           
	DJNZ R4, DELAY_LOOP_3 
RETURN:
	RET                   
                 

database:
db 0C0h		; Valor para o número 0 no display
db 0F9h		; Valor para o número 1 no display
db 0A4h		; Valor para o número 2 no display
db 0B0h		; Valor para o número 3 no display
db 99h		; Valor para o número 4 no display
db 92h		; Valor para o número 5 no display
db 82h		; Valor para o número 6 no display
db 0F8h		; Valor para o número 7 no display
db 80h		; Valor para o número 8 no display
db 90h		; Valor para o número 9 no display

end
