# Projeto 1 - Cronômetro Digital usando Assembly e 8051

Alunos:
- Lucas Lima Romero (13676325)
- Luciano Gonçalves Lopes Filho (13676520)
- Marco Antonio Gaspar Garcia (11833581)

## Introdução
O projeto apresentado visa desenvolver um cronômetro digital com intervalo variável utilizando linguagem Assembly. Foi utilizado o simulador EdSim51DI, que replica um microcontrolador da família 8051.

### Especificações
- Ao pressionar **SWO** o cronômetro deve realizar uma contagem de 0 a 9 com intervalo de 0,25s.
- Ao pressionar **SW1** a contagem passa a ser realizada com intervalo de 1s.
- Ao executar o programa, a contagem não se inicia e os display estara desligado ate que **SW0** ou **SW1** sejam pressionados.


### Diagrama

![alt text](https://github.com/lucaslimaromero/SEL0614-Microprocessadores/blob/main/Imagens/Diagrama8051.png)

Os pinos do microcontrolador estao fixadas de acordo com o diagrama acima. Os pinos da porta P2 estao ligados a resistores de Pull-Up, que atuam como botões. Serão utilizados apenas SW0 e SW1 neste projeto. Enquanto isso, os pinos da porta P1 controlam o display de 7 segmentos. O microcontrolador utiliza um array de valores que contém os padrões binários necessários para acender os segmentos corretos para cada número (0 a 9). Cada valor do array é carregado no registrador P1 (chamado DISPLAY no Assembly), que controla o display de 7 segmentos.

```
int main()
```
