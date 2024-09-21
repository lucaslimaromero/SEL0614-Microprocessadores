# Atividade Semanal 3

Alunos:
- Lucas Lima Romero (13676325)
- Marco Antonio Gaspar Garcia (11833581)

Questão 8) No simulador EdSim51, digite e execute (clicando em "Assm") as instruções abaixo:

MOV R0, #22h
MOV 00h, #22h

Qual é a diferença entre as duas instruções acima? Reflita sobre o motivo pelo qual elas possuem ciclos de máquina diferentes, considerando que a operação é realizada na mesma posição de memória RAM (00h ou R0 ocupam o mesmo espaço).

MOV A, #22h
MOV ACC, #22h

Qual é a diferença entre as duas instruções acima? Reflita sobre a diferença de usar A ou ACC e o motivo pelo qual possuem ciclos de máquina diferentes, mesmo que a operação realizada seja a mesma.

Resposta:

Embora as instruções MOV R0, #22h e MOV 00h, #22h realizem a mesma operação, que é mover o valor 22h (em hexadecimal) para um endereço de memória, elas diferem em como essa operação é executada. A primeira, MOV R0, #22h, usa o modo de endereçamento direto, indicando o registrador R0. Já a segunda, MOV 00h, #22h, especifica uma posição de memória, exigindo um ciclo de máquina adicional para calcular qual registrador corresponde a 00h (que é o R0).

Da mesma forma, a instrução MOV ACC, #22h leva dois ciclos de máquina porque é necessário calcular o endereço do acumulador, ao contrário da MOV A, #22h, que gasta apenas um ciclo de máquina porque define essa informação diretamente.

Questão 9) 

(V) Trata-se de um microcontrolador de arquitetura Harvard.
(V) A memória EEPROM é de 4Kbytes e armazena as instruções que
comandam o microcontrolador.
(F) A memória SRAM é de 512 bytes e armazena dados voláteis
(F) O registrador IR tem a função de armazenar a instrução lida da memória
SRAM.
(V) Para esse microcontrolador, o registrador IR deve ser de 8 bits
(V) O registrador PC armazena o endereço da instrução lida da memória
EEPROM.
(F) Para esse microcontrolador, o registrador PC deve ser de 10 bits.
(V) Para esse microcontrolador, o registrador ACC deve ser de 8 bits.
(F) O registrador DPTR é um ponteiro que aponta para a última instrução lida da
memória.
(V) Para esse microcontrolador, o registrador DPTR deve ser de 10 bits
