#pragma ogall 0x1000
#define LED1 PORTA.F1
#define LED2 PORTA.F2
#define SW1 PORTA.F0

#define MYID "1"
#define TCPID "4"
#define SERVER "192.168.1.0"
#define PORT "11000"
#define PROTOCOL "TCP"
#define UART_DELAY 400
#define CIPSIZE 3
#define UDELAY 20
#define DELAY 100
#define TIMEOUT 10
#define MSGLEN 19

int count = 0;
int oneSecond = 0;
int sensorSample = 0;
int rxRead = 0;

char text[MSGLEN] = {0};
char cipsendSize[CIPSIZE] = {0};
char secs = 0;
char word = 0;

char keypadPort at PORTD;

sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

sbit RX_port at RC7_bit; //RX
sbit TX_port at RC6_bit; //TX

sbit TRIS_RESET  at TRISC0_bit;
sbit RESET_port  at RC0_bit;

//******************************************************************************
// Vari?veis Globais
  unsigned short kp, oldstate = 0;
  unsigned short pos=0, i=0;

  unsigned char num;
  unsigned char qtd;

//******************************************************************************
// Rotinas Auxiliares
void pedido ()
{
  lcd_out(1,1, "Digite o Numero");
  lcd_out(2,1, "Do Pedido:");
}

void quantidade ()
{
  lcd_out(1,1, "Digite a");
  lcd_out(2,1, "quantidade:");
}

void escrita ()
{
    if (kp=='A')
     {}
    else {lcd_chr_cp(kp);}
}

void teclaauxiliar()
{
   if(kp == 'B')
   {
     kp=0;
     pos=0;
     i=0;
     UART1_Write(kp);
     lcd_cmd(_lcd_clear);
     lcd_cmd (_LCD_RETURN_HOME);
     lcd_out(1,1, "    Chamando    ");
     lcd_out(2,1, "     Gar?on     ");
     delay_ms(1300);
     lcd_cmd(_lcd_clear);
     pedido();
   }
   if (kp == 'D')
   {
     kp=0;
     pos=0;
     i=0;
     UART1_Write(kp);
     lcd_cmd(_lcd_clear);
     lcd_out(1,1, "     Conta      ");
     lcd_out(2,1, "    Enviada     ");
     delay_ms(1300);
     lcd_cmd(_lcd_clear);
     lcd_cmd (_LCD_RETURN_HOME);
     pedido();
   }
   if(kp == 'C')              // Tecla limpar
   {
     lcd_cmd(_lcd_clear);
     lcd_cmd (_LCD_RETURN_HOME);
     kp=0;
     pos=0;
     pedido();
   }
}

void leitura ()
{
   kp = 0;                                // Reset key code variable
    // Wait for key to be pressed and released
    do
      // kp = Keypad_Key_Press();          // Store key code in kp variable
      kp = Keypad_Key_Click();             // Store key code in kp variable
    while (!kp);
   // Prepare value for output, transform key to it's ASCII value
    switch (kp) {
      case  1: kp = 49; break; // 1        // Uncomment this block for keypad4x4
      case  2: kp = 50; break; // 2
      case  3: kp = 51; break; // 3
      case  4: kp = 65; break; // A
      case  5: kp = 52; break; // 4
      case  6: kp = 53; break; // 5
      case  7: kp = 54; break; // 6
      case  8: kp = 66; break; // B
      case  9: kp = 55; break; // 7
      case 10: kp = 56; break; // 8
      case 11: kp = 57; break; // 9
      case 12: kp = 67; break; // C
      case 13: kp = 42; break; // *
      case 14: kp = 48; break; // 0
      case 15: kp = 35; break; // #
      case 16: kp = 68; break; // D
    }
    if (kp != oldstate) {                  // Pressed key differs from previous
      oldstate = kp;
    }
    teclaauxiliar();
}

void clear(char* var, short int size)
{
    for (count=0; count < size; count++)
    {
        var[count] = '\0';
    }

    count = 0;
}


void write(char* msg)
{
    if (UART1_Tx_Idle())
    {
        UART1_Write_Text(msg);
        clear(text, MSGLEN);
    }
}

void reader()
{
        if (UART1_Data_Ready())
        {
           text[count] = UART1_Read();

           if (text[count] == '>')
           {
                clear(text, MSGLEN);
           }
           else if (text[count] == '\n')
           {
                text[count+1] = '\0';

                if (word == 'O')
                {
                    if (strcmp(text, "OK\r\n") == 0)
                    {
                        clear(text, MSGLEN);
                    }
                }
                else if (word == 'L')
                {
                    text[count+1] = '\0';

                    if (strcmp(text, "Linked\r\n") == 0)
                    {
                       clear(text, MSGLEN);
                    }
                }

           }

           count++;
        }
}

void interrupt()
{
    GIE_bit = 0;

    if (RCIF_bit == 1)
    {
        if(FERR_bit == 1)
        {
            rxRead = RCREG;
            GIE_bit = 1;
            return;
        }

        if(OERR_bit == 1)
        {
            CREN_bit = 0;
            CREN_bit = 1;
            GIE_bit  = 1;
            return;
        }

        count = RCREG;
        count = 0;

        TMR0L = oneSecond = secs = 0;
    }

    if (TMR0IF_bit)
    {
        TMR0L = 0;
        TMR0IF_bit = 0;
        oneSecond++;

        if(oneSecond > 999)
        {
            secs++;
            oneSecond=0;
        }
    }

    GIE_bit = 1;
}

void atStatus()
{
    word = 'O';

    write("AT\r\n");
    Delay_ms(UART_DELAY);
}


void cipmux()
{
    word = 'O';

    write("AT+CIPMUX=1\r\n");
    Delay_ms(UART_DELAY);
}

//******************************************************************************
//Rotina Principal
void main()
{
  rcon=0x80;
  cmcon=0x0F;
  intcon2=0;
  ADCON1 |= 0x0F;   //Define todos pi0s AN como digital I/O
  PORTD  = 0;
  TRISE  = 0;
  PORTE  = 0;
  Keypad_Init();          // Inicializa o Teclado Matricial

  RCIE_bit   = 0;         // (DES)habilitar interrupcao  em RX
  TXIE_bit   = 0;         // desabilita interrupcao em TX (default)
  PEIE_bit   = 1;         // habilitar/desabilitar interrupcoes perifericas (INTCON)
  GIE_bit    = 1;         // liga chave geral das interrupcoes
  TMR0IE_bit = 1;         //interrupcao do timer0

  // ESP8266
  UART1_Init(38400);
  Delay_ms(500);

  T0CON = 0xC4;
  INTCON = 0xA0;
  RCIE_bit = 0;
  TXIE_bit = 0;
  PEIE_bit = 1;
  GIE_bit = 1;
  TMR0IE_bit = 1;
  OSCCON = 0x75;

  // LCD______________________________________________
  trisb=0;
  portb=0;
  Lcd_Init();
  Lcd_Cmd(_Lcd_Cursor_Off);
  Lcd_Cmd(_LCD_CLEAR);
  Delay_ms(10);
  pedido();

  TMR0L = 0;

  while (1)
  {
   if (i==0)
   {
    pedido();
    leitura();
   }
   if (kp != 0)
    {
      UART1_Write_Text("Pedido:");
      i=1;
      do {                         // leitura do pedido
       escrita();
       UART1_Write(kp);
       pos++;
       leitura();
       if (pos == 3)               //
       {                           //
        do {                       // Maximo 3 digitos
         leitura();                //
        } while (kp != 'A');       //
       }                           //
      } while( kp != 'A');

     num = kp;

     lcd_cmd(_lcd_clear);
     quantidade();
     kp=0;
     pos=0;
     UART1_Write_Text("  ");
     UART1_Write_Text("Quantidade:");
     delay_ms(10);

     do {
      if (kp==0)
      {
       do {
        leitura();
        } while (kp == 0);
      }
       escrita();                   // leitura da quantidade
       UART1_Write(kp);
       pos++;
       leitura();

       if (pos == 3)                //
       {                            //
        do {                        // Maximo 3 digitos
         leitura();                 //
        } while (kp != 'A');        //
       }                            //
      } while( kp != 'A');

     qtd = kp;

     lcd_cmd(_lcd_clear);
     pos=0;
     i=0;
     kp=0;

     num = 0;
     qtd = 0;

     lcd_out(1,1, "     Pedido     ");
     lcd_out(2,1, "    enviado   ");
     delay_ms(2000);
     lcd_cmd(_lcd_clear);
     delay_ms(10);
    }
  }//while
}