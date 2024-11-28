# Atividade Semanal 5

Alunos:
- Lucas Lima Romero (13676325)
- Marco Antonio Gaspar Garcia (11833581)

Questão 10) 

Responder com verdadeiro (V) ou falso (F) às seguintes afirmações sobre a Pilha (Stack).

- **(F)** A pilha é uma memória RAM sequencial do tipo FIFO.

- **(V)** A pilha geralmente é utilizada para armazenar endereço de retorno de sub-rotinas e também de interrupções.

- **(F)** O ponteiro de pilha (Stack Pointer) é um registrador que aponta para um endereço da memória ROM, que é o endereço de retorno do programa após o atendimento a uma interrupção ou sub-rotina.

- **(V)** As instruções PUSH e POP são exclusivas para operações com pilha.

- **(F)** A instrução CALL <endereço> deve ser usada para indicar qual endereço o programa deve desviar no caso de um atendimento à interrupção ou chamada de sub-rotina.

- **(V)** A instrução RET, colocada no final de uma sub-rotina, faz com que o último endereço armazenado na pilha seja carregado no registrador PC (program counter).

- **(V)** A área da RAM interna dedicada à pilha é determinada pelo ponteiro SP, um dos SFRs, que possui tamanho 8 bits, mesmo tamanho do barramento de endereço da CPU.

- **(F)** Geralmente são baseadas em flip-flops tipo D

<br>
Questão 11)

Refletir se existe diferença entre o endereço armazenado em um espaço de pilha e o endereço armazenado no Stack Pointer (SP)?

Resposta: 

O endereço na pilha refere-se ao dado efetivamente armazenado na pilha (como endereços de retorno ou valores temporários), enquanto o SP armazena o endereço da memória RAM que aponta para o topo da pilha, controlando onde os dados serão empurrados ou retirados. Portanto, há uma distinção clara entre o que é armazenado na pilha (conteúdo) e o que é armazenado no SP (endereço que aponta para o topo da pilha).

<br>
Questão 12) 

Supondo que um banco de 8 LEDs foi conectado à Porta P1 e um banco de 8 Switches conectado à P2 (EdSim51). Acender o LED 0 (pode ser qualquer outro) ao acionar o Switch 7 (pode ser qualquer outro). Apagar o LED ao desligar o Switch.

Resposta:

Ver código em ~/Códigos/atividade5_12.asm


<br>
Questão 13)

Supondo que foram conectados um banco de 8 switches na Porta P2 (EdSim51). Escrever um programa em Assembly para monitorar, quando uma das chaves for pressionada, e indicar o número da chave pressionada em R0 (Se SW3 foi pressionada, então R0 = 3). 

Resposta: 

Ver código em ~/Códigos/atividade5_13.asm


<br>
Questão 14)

Criar uma subrotina de delay de 50 milissegundos a partir da contagem de ciclos de instruções e intervalo de tempo. Essa estrutura poderá servir para piscar um LED a cada 50 ms (ver exemplo na aula correspondente).

Resposta: 

Ver código em ~/Códigos/atividade5_14.asm


<br>
Questão 15)

Colocou-se 3 LEDs nos endereços P1.0, P1.1 e P1.2 no microcontrolador e 3 chaves nos endereços P2.0, P2.1 e P2.2. Considerando que os LEDs acendem quando é colocado nível baixo na saída e as chaves, quando pressionadas, colocam nível baixo na porta, explique o funcionamento do programa a seguir quando cada chave é pressionada.

Resposta: 

ORG 0000H 
 
Leitura: 
    JNB P2.0, PX    ; Para cada chave, salta para uma subrotina diferente
    JNB P2.1, PY 
    JNB P2.2, PZ 
    LCALL Leitura   ; Caso nenhuma das 3 primeiras chaves tenha sido pressionada, retorna ao loop

PX:  
    MOV P1, #0  ; Acende todos os LEDs, pois o led acende em nível lógico baixo (zero)
    RET 
 
PY:  
    MOV P1, #00000101b  ; Acende os todos os leds, menos o 0 e o 2, que estão em nível lógico alto
    RET 

PZ: 
    MOV A, P1   ; Copia 11111111 para o acumulador
    CPL A       ; Complementar: A = 00000000
    MOV P1, A   ; Acende todos os LEDs
    RET 
 
FIM:  
    SJMP FIM    ; Encerra o programa
