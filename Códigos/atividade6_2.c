// Variável do contador
signed char ucContador = -1;

void Incremento(unsigned char Contador){

    switch(Contador){

        case 0: { latd = 0b00111111; break; } // 0 no display de 7 segmentos
        case 1: { latd = 0b00000110; break; } // 1 no display de 7 segmentos
        case 2: { latd = 0b01011011; break; } // 2 no display de 7 segmentos
        case 3: { latd = 0b01001111; break; } // 3 no display de 7 segmentos
        case 4: { latd = 0b01100110; break; } // 4 no display de 7 segmentos
        case 5: { latd = 0b01101101; break; } // 5 no display de 7 segmentos
        case 6: { latd = 0b01111101; break; } // 6 no display de 7 segmentos
        case 7: { latd = 0b00000111; break; } // 7 no display de 7 segmentos
        case 8: { latd = 0b01111111; break; } // 8 no display de 7 segmentos
        case 9: { latd = 0b01101111; break; } // 9 no display de 7 segmentos

        default:{ PORTD =0; ucContador = -1; break;} // zera todo o PORTD e
    }
}

void main(){

    unsigned char FlagAux = 0; // Variavel para contornar o efeito bounce

    ADCON1 |= 0x0F; // Pinos digitais

    // Configurando a porta D como saida
    TRISD = 0;
    PORTD = 0;

    // Configurando a porta B como entrada
    TRISB.RB0 = 1;
    PORTB.RB0 = 1;

    // Loop para verificar o acionamento do botao
    while(1){

        // Verifica o o acionamento do botao, caso o estado anterior seja baixo
        if(PORTB == 0 && FlagAux == 0){

            // Pre-Incremento e envia o valor correto para acender no display
            Incremento(++ucContador);
            FlagAux = 1;

            // Delay para tratar o bounce
            Delay_ms(40);
        }

        // Caso o botão seja solto e o estado anterior foi alto
        if(PORTB.RB0 == 1 && FlagAux == 1){
            
            // Seta o estado anterior como baixo
            FlagAux = 0;

            // Delay para tratar o bounce
            Delay_ms(40);
        }

    }

}