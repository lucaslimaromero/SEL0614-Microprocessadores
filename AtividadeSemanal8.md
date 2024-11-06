# Atividade Semanal 8

1. LCD com display 1023

```c
// Configuração dos pinos do LCD

// Pinos utilizados para comunicação com o display LCD
sbit LCD_RS at LATB4_bit;   // pino 4 do PORTB interligado ao RS do display
sbit LCD_EN at LATB5_bit;   // pino 5 do PORTB -> ao EN do display
sbit LCD_D4 at LATB0_bit;   // pino 0 do PORTB ao D4
sbit LCD_D5 at LATB1_bit;   // "
sbit LCD_D6 at LATB2_bit;   // "
sbit LCD_D7 at LATB3_bit;   // "

// Direção do fluxo de dados dos pinos selecionados
sbit LCD_RS_Direction at TRISB4_bit; // Direção do fluxo do pino RB4
sbit LCD_EN_Direction at TRISB5_bit; // "
sbit LCD_D4_Direction at TRISB0_bit; // "
sbit LCD_D5_Direction at TRISB1_bit; // "
sbit LCD_D6_Direction at TRISB2_bit; // "
sbit LCD_D7_Direction at TRISB3_bit; // "

void main() {
    unsigned int Leitura_ADC;     // Variável para leitura ADC
    unsigned char Texto[10];      // Texto para escrever no LCD

    TRISA.RA0 = 1;                // Pino AN0 como entrada (canal analógico escolhido neste ex.)

    // Configuração do ADC
    ADCON0 = 0b00000001;          // A/D ligado, leitura desligada, canal AN0
    ADCON1 = 0b00000000;          // Tensões de referência internas = VDD e Vss
    ADCON2 = 0b10101010;          // Justificativa para direita, FOSC/32 (tempo entre 2 e 25 us)

    // Configuração do módulo LCD
    Lcd_Init();                   // Inicializa a lib. LCD
    Lcd_Cmd(_LCD_CLEAR);          // Clear display
    Lcd_Cmd(_LCD_CURSOR_OFF);     // Cursor off
    Lcd_Out(1,1,"ADC:");          // Escreve no display

    while(1) {
        ADCON0.GO_DONE = 1;       // Liga a leitura e inicia a conversão do ADC
        while(ADCON0.GO_DONE == 1); // Aguardar o término da conversão

        Leitura_ADC = ((ADRESH << 8) | ADRESL); // Leitura do ADC entre 0 e 1023

        WordToStr(Leitura_ADC, Texto);         // Conversão do texto
        Lcd_Out(1,5,Texto);                    // Escreve no LCD
        Delay_ms(20);                          // Delay para atualizar LCD
    }
}
```

2. LCD com display 12.34

```c
#define TRUE 1

// Configuração dos pinos do LCD

// Pinos utilizados para comunicação com o display LCD
sbit LCD_RS at LATB4_bit;   // pino 4 do PORTB interligado ao RS do display
sbit LCD_EN at LATB5_bit;   // pino 5 do PORTB -> ao EN do display
sbit LCD_D4 at LATB0_bit;   // pino 0 do PORTB ao D4
sbit LCD_D5 at LATB1_bit;   // "
sbit LCD_D6 at LATB2_bit;   // "
sbit LCD_D7 at LATB3_bit;   // "

// Direção do fluxo de dados dos pinos selecionados
sbit LCD_RS_Direction at TRISB4_bit; // Direção do fluxo do pino RB4
sbit LCD_EN_Direction at TRISB5_bit; // "
sbit LCD_D4_Direction at TRISB0_bit; // "
sbit LCD_D5_Direction at TRISB1_bit; // "
sbit LCD_D6_Direction at TRISB2_bit; // "
sbit LCD_D7_Direction at TRISB3_bit; // "

void main() {
    unsigned int Valor_ADC = 0;     // Variável para leitura
    unsigned char Tensao[10];       // Arranjo textual para exibir no display

    // Configuração dos pinos como analógicos
    TRISA.RA5 = 1;
    ADCON1 = 0b00000000;            // Configura todos os canais como ADC

    // Configuração do módulo LCD
    Lcd_Init();                     // Inicializa a lib. Lcd
    Lcd_Cmd(_LCD_CLEAR);            // Clear display
    Lcd_Cmd(_LCD_CURSOR_OFF);       // Cursor off
    Lcd_Out(1,1,"ADCO:");           // Escreve no display

    ADC_Init();                     // Inicializa o módulo ADC

    while(TRUE) {
        Valor_ADC = ADC_Read(4);    // Leitura dos valores de 0 a 1023 (10 bits) no canal AN4

        // Ajustes de escala dos valores de conversão para colocar no formato float
        Valor_ADC = Valor_ADC * (1234/1023.); // Formata o valor para 0 a 1023 com ponto no final
        Tensao[0] = (Valor_ADC/1000) + '0';   // Formata o primeiro algarismo do valor
        Tensao[1] = (Valor_ADC/100)%10 + '0'; // Formata o segundo algarismo do valor
        Tensao[2] = '.';                      // Terceiro símbolo é o ponto
        Tensao[3] = (Valor_ADC/10)%10 + '0';  // Formata o quarto algarismo
        Tensao[4] = (Valor_ADC/1)%10 + '0';   // Formata o quinto algarismo
        Tensao[5] = 0;                        // Terminador NULL

        // Exibe os valores no display LCD
        Lcd_Out(1,6,Tensao);                  // Mostra os valores no display
        Delay_ms(20);                         // Atualiza display
    }
}
```
