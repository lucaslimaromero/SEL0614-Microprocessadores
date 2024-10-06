![image](https://github.com/user-attachments/assets/6ac4b841-32e8-4cd8-ae7b-e9134a42eca8)# Projeto 1 - Cronômetro Digital usando Assembly e 8051

Alunos:
- Lucas Lima Romero (13676325)
- Luciano Gonçalves Lopes Filho (13676520)
- Marco Antonio Gaspar Garcia (11833581)

## Introdução
O projeto apresentado visa desenvolver um cronômetro digital com intervalo variável utilizando linguagem Assembly. Foi utilizado o simulador EdSim51DI, que replica um microcontrolador da família 8051.

### Especificações
- Ao pressionar o botão **SWO** o cronômetro deve realizar uma contagem de 0 a 9 com intervalo de 0,25s.
- Ao pressionar o botão **SW1** a contagem passa a ser realizada com intervalo de 1s.
- Ao executar o programa, a contagem não se inicia e os display estara desligado ate que **SW0** ou **SW1** sejam pressionados.


### Diagrama

![alt text](https://github.com/lucaslimaromero/SEL0614-Microprocessadores/blob/main/Imagens/Diagrama8051.png)

Os pinos do microcontrolador estao fixadas de acordo com o diagrama acima. Os pinos da porta P2 estao ligados a resistores de Pull-Up, que atuam como botões. Serão utilizados apenas SW0 e SW1 neste projeto. 

Enquanto isso, os pinos da porta P1 controlam o display de 7 segmentos. O microcontrolador utiliza um array de valores que contém os padrões binários necessários para acender os segmentos corretos para cada número (0 a 9). Cada valor do array é carregado no registrador P1 (chamado DISPLAY no Assembly), que controla o display de 7 segmentos. O código abaixo ilustra esse processo.

```
MOV A, 1               ; Carrega 1 no acumulador
MOVC A, @A+DPTR         ; Carrega o padrão de bits do array 'database' para o numero 1, que seria a combinação dos segmentos que forma o número '1'.
MOV DISPLAY, A          ; Envia o padrão de bits para P1, que controla o display
```

Para contexto, abaixo esta uma tabela que mostra o mapeamento de valores para o display 7 segmentos e um esquematico deste mesmo display. 
![image](https://github.com/user-attachments/assets/7c7b2bbe-ec8f-471d-8e00-b2176ad2610a)


| Número | Valor Hexadecimal | Binário (P1.7 ... P1.0) | Segmentos Ativos    |
|--------|-------------------|------------------------|---------------------|
| 0      | 0C0h              | 11000000               | a, b, c, d, e, f     |
| 1      | 0F9h              | 11111001               | b, c                 |
| 2      | 0A4h              | 10100100               | a, b, d, e, g        |
| 3      | 0B0h              | 10110000               | a, b, c, d, g        |
| 4      | 99h               | 10011001               | b, c, f, g           |
| 5      | 92h               | 10010010               | a, c, d, f, g        |
| 6      | 82h               | 10000010               | a, c, d, e, f, g     |
| 7      | 0F8h              | 11111000               | a, b, c              | 
| 8      | 80h               | 10000000               | a, b, c, d, e, f, g  |
| 9      | 90h               | 10010000               | a, b, c, d, f, g     |

