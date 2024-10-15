void main(){

    // Flag para controlar o efeito bounce
    unsigned char FlagAux = 0;

    // Definindo sai­das digitais
    ADCON1 |= 0x0F;

    // Definindo a porta B como entrada
    TRISB.RB0 = 1;
    PORTB.RB0 = 1;

    // Definindo a porta D como sai­da
    TRISD.RD0 = 0;
    PORTD.RD0 = 0;

    while(1){

        // Caso o botao esteja pressionado e o nivel anterior seja baixo:
        if(PORTB.RB0 == 0 && FlagAux == 0){

            // Inverte o ni­vel logico na sai­da (LED)
            PORTD.RD0 = ~LATD.RD0;
            
            // Muda o estado para alto
            FlagAux = 1;
            Delay_ms(500);
        }

        // Caso o botao esteja pressionado e o nivel anterior seja alto:
        if (PORTB.RB0 == 0 && FlagAux == 1){
            
            // Inverte o nivel logico na saida (LED)
            PORTD.RD0 = ~LATD.RD0;

            // Muda o estado para baixo
            FlagAux = 0;
            Delay_ms(500);
        }

        // Caso o botão não esteja mais pressionado, desliga tudo
        if (PORTB.RB0 == 1){
            
            PORTD.RD0 = 0;
            FlagAux = 0;
            
            // Delay de segurança
            Delay_ms(30);
        }
    }
}