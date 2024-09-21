org 0000h

JMP main	; Pula para a label main

org 0033h	; Define o endereco de inicio (caso estejamos utilizando interrupcoes)

main:
	MOV R0, #20h		; Movendo diretamente os valores em hex aos registradores
	MOV R1, #00h
	
LOOP:
	MOV A, @R0				; Move o conteudo de R0 ao acumulador
	SUBB A, #45h				; Subtracao A - 45
	JNC terceira_label		; Se o carry for 1, salta ao label 
	INC R1						; Incrementa R1 (R1++), nao executada se A < 45.
	

terceira_label:
	INC R0							; Incrementa R0
	CJNE R0, #24h, LOOP		; Pula a LOOP caso R0 seja diferente de 24h
	NOP								; No Operation
	
HERE:
	SJMP HERE						; Prende o programa

; O programa inicia com R0 = 20 e R1 = 0. Entao, na label LOOP, move-se de forma indireta R0 para o acumulador,
; significando que agora o acumulador guarda aquilo que era guardado no endereco 20, que era o valor
; contido em R0. Depois, Subtrai-se 45 do valor contido no acumulador. Caso o resultado seja negativo,
; o carry associado em PSW sera 1, e 0 caso seja positivo. Logo, o programa pula para a terceira_label,
; caso o carry seja 0 (Jump Not Carry), nao incrementando R1. Caso o valor seja negativo, ou seja, carry 1, ainda em LOOP, 
; R1 eh incrementado, pois nao houve salto. Na terceira_label, incrementa-se R0 e realiza-se uma operacao de voltar a LOOP
; caso R0 seja diferente de 24. Assim, novamente, agora ao acumulador A sera movido o valor contido no proximo endereco 
;de memoria, e o ciclo reinicia, testando a subtracao de A com 45. Caso R0 = 24, o programa se encerra.

; Em resumo, o programa procura (24 - R0) vezes valores menores que 45, nas posicoes apontadas por R0. A cada ciclo,
; R0 eh incrementado, e o programa procura em posicoes sequenciais. Caso o valor apontado seja menor que 45, eh incrementado
; R1, portanto, R1 salva a quantidade de valores encontrados menores que 45, nas posicoes apontadas por R0. 



end