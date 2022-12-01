
_pedido:

;FastWaiter.c,59 :: 		void pedido ()
;FastWaiter.c,61 :: 		lcd_out(1,1, "Digite o Numero");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,62 :: 		lcd_out(2,1, "Do Pedido:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,63 :: 		}
L_end_pedido:
	RETURN      0
; end of _pedido

_quantidade:

;FastWaiter.c,65 :: 		void quantidade ()
;FastWaiter.c,67 :: 		lcd_out(1,1, "Digite a");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,68 :: 		lcd_out(2,1, "quantidade:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,69 :: 		}
L_end_quantidade:
	RETURN      0
; end of _quantidade

_escrita:

;FastWaiter.c,71 :: 		void escrita ()
;FastWaiter.c,73 :: 		if (kp=='A')
	MOVF        _kp+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_escrita0
;FastWaiter.c,74 :: 		{}
	GOTO        L_escrita1
L_escrita0:
;FastWaiter.c,75 :: 		else {lcd_chr_cp(kp);}
	MOVF        _kp+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
L_escrita1:
;FastWaiter.c,76 :: 		}
L_end_escrita:
	RETURN      0
; end of _escrita

_teclaauxiliar:

;FastWaiter.c,78 :: 		void teclaauxiliar()
;FastWaiter.c,80 :: 		if(kp == 'B')
	MOVF        _kp+0, 0 
	XORLW       66
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaauxiliar2
;FastWaiter.c,82 :: 		kp=0;
	CLRF        _kp+0 
;FastWaiter.c,83 :: 		pos=0;
	CLRF        _pos+0 
;FastWaiter.c,84 :: 		i=0;
	CLRF        _i+0 
;FastWaiter.c,85 :: 		UART1_Write(kp);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;FastWaiter.c,86 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,87 :: 		lcd_cmd (_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,88 :: 		lcd_out(1,1, "    Chamando    ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,89 :: 		lcd_out(2,1, "     Gar?on     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,90 :: 		delay_ms(1300);
	MOVLW       80
	MOVWF       R11, 0
	MOVLW       36
	MOVWF       R12, 0
	MOVLW       134
	MOVWF       R13, 0
L_teclaauxiliar3:
	DECFSZ      R13, 1, 1
	BRA         L_teclaauxiliar3
	DECFSZ      R12, 1, 1
	BRA         L_teclaauxiliar3
	DECFSZ      R11, 1, 1
	BRA         L_teclaauxiliar3
	NOP
;FastWaiter.c,91 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,92 :: 		pedido();
	CALL        _pedido+0, 0
;FastWaiter.c,93 :: 		}
L_teclaauxiliar2:
;FastWaiter.c,94 :: 		if (kp == 'D')
	MOVF        _kp+0, 0 
	XORLW       68
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaauxiliar4
;FastWaiter.c,96 :: 		kp=0;
	CLRF        _kp+0 
;FastWaiter.c,97 :: 		pos=0;
	CLRF        _pos+0 
;FastWaiter.c,98 :: 		i=0;
	CLRF        _i+0 
;FastWaiter.c,99 :: 		UART1_Write(kp);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;FastWaiter.c,100 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,101 :: 		lcd_out(1,1, "     Conta      ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,102 :: 		lcd_out(2,1, "    Enviada     ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,103 :: 		delay_ms(1300);
	MOVLW       80
	MOVWF       R11, 0
	MOVLW       36
	MOVWF       R12, 0
	MOVLW       134
	MOVWF       R13, 0
L_teclaauxiliar5:
	DECFSZ      R13, 1, 1
	BRA         L_teclaauxiliar5
	DECFSZ      R12, 1, 1
	BRA         L_teclaauxiliar5
	DECFSZ      R11, 1, 1
	BRA         L_teclaauxiliar5
	NOP
;FastWaiter.c,104 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,105 :: 		lcd_cmd (_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,106 :: 		pedido();
	CALL        _pedido+0, 0
;FastWaiter.c,107 :: 		}
L_teclaauxiliar4:
;FastWaiter.c,108 :: 		if(kp == 'C')              // Tecla limpar
	MOVF        _kp+0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaauxiliar6
;FastWaiter.c,110 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,111 :: 		lcd_cmd (_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,112 :: 		kp=0;
	CLRF        _kp+0 
;FastWaiter.c,113 :: 		pos=0;
	CLRF        _pos+0 
;FastWaiter.c,114 :: 		pedido();
	CALL        _pedido+0, 0
;FastWaiter.c,115 :: 		}
L_teclaauxiliar6:
;FastWaiter.c,116 :: 		}
L_end_teclaauxiliar:
	RETURN      0
; end of _teclaauxiliar

_leitura:

;FastWaiter.c,118 :: 		void leitura ()
;FastWaiter.c,120 :: 		kp = 0;                                // Reset key code variable
	CLRF        _kp+0 
;FastWaiter.c,122 :: 		do
L_leitura7:
;FastWaiter.c,124 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;FastWaiter.c,125 :: 		while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura7
;FastWaiter.c,127 :: 		switch (kp) {
	GOTO        L_leitura10
;FastWaiter.c,128 :: 		case  1: kp = 49; break; // 1        // Uncomment this block for keypad4x4
L_leitura12:
	MOVLW       49
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,129 :: 		case  2: kp = 50; break; // 2
L_leitura13:
	MOVLW       50
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,130 :: 		case  3: kp = 51; break; // 3
L_leitura14:
	MOVLW       51
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,131 :: 		case  4: kp = 65; break; // A
L_leitura15:
	MOVLW       65
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,132 :: 		case  5: kp = 52; break; // 4
L_leitura16:
	MOVLW       52
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,133 :: 		case  6: kp = 53; break; // 5
L_leitura17:
	MOVLW       53
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,134 :: 		case  7: kp = 54; break; // 6
L_leitura18:
	MOVLW       54
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,135 :: 		case  8: kp = 66; break; // B
L_leitura19:
	MOVLW       66
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,136 :: 		case  9: kp = 55; break; // 7
L_leitura20:
	MOVLW       55
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,137 :: 		case 10: kp = 56; break; // 8
L_leitura21:
	MOVLW       56
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,138 :: 		case 11: kp = 57; break; // 9
L_leitura22:
	MOVLW       57
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,139 :: 		case 12: kp = 67; break; // C
L_leitura23:
	MOVLW       67
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,140 :: 		case 13: kp = 42; break; // *
L_leitura24:
	MOVLW       42
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,141 :: 		case 14: kp = 48; break; // 0
L_leitura25:
	MOVLW       48
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,142 :: 		case 15: kp = 35; break; // #
L_leitura26:
	MOVLW       35
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,143 :: 		case 16: kp = 68; break; // D
L_leitura27:
	MOVLW       68
	MOVWF       _kp+0 
	GOTO        L_leitura11
;FastWaiter.c,144 :: 		}
L_leitura10:
	MOVF        _kp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura12
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura13
	MOVF        _kp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura14
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura15
	MOVF        _kp+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura16
	MOVF        _kp+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura17
	MOVF        _kp+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura18
	MOVF        _kp+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura19
	MOVF        _kp+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura20
	MOVF        _kp+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura21
	MOVF        _kp+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura22
	MOVF        _kp+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura23
	MOVF        _kp+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura24
	MOVF        _kp+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura25
	MOVF        _kp+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura26
	MOVF        _kp+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura27
L_leitura11:
;FastWaiter.c,145 :: 		if (kp != oldstate) {                  // Pressed key differs from previous
	MOVF        _kp+0, 0 
	XORWF       _oldstate+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_leitura28
;FastWaiter.c,146 :: 		oldstate = kp;
	MOVF        _kp+0, 0 
	MOVWF       _oldstate+0 
;FastWaiter.c,147 :: 		}
L_leitura28:
;FastWaiter.c,148 :: 		teclaauxiliar();
	CALL        _teclaauxiliar+0, 0
;FastWaiter.c,149 :: 		}
L_end_leitura:
	RETURN      0
; end of _leitura

_clear:

;FastWaiter.c,151 :: 		void clear(char* var, short int size)
;FastWaiter.c,153 :: 		for (count=0; count < size; count++)
	CLRF        _count+0 
	CLRF        _count+1 
L_clear29:
	MOVLW       128
	XORWF       _count+1, 0 
	MOVWF       R0 
	MOVLW       128
	BTFSC       FARG_clear_size+0, 7 
	MOVLW       127
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__clear82
	MOVF        FARG_clear_size+0, 0 
	SUBWF       _count+0, 0 
L__clear82:
	BTFSC       STATUS+0, 0 
	GOTO        L_clear30
;FastWaiter.c,155 :: 		var[count] = '\0';
	MOVF        _count+0, 0 
	ADDWF       FARG_clear_var+0, 0 
	MOVWF       FSR1L+0 
	MOVF        _count+1, 0 
	ADDWFC      FARG_clear_var+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;FastWaiter.c,153 :: 		for (count=0; count < size; count++)
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
;FastWaiter.c,156 :: 		}
	GOTO        L_clear29
L_clear30:
;FastWaiter.c,158 :: 		count = 0;
	CLRF        _count+0 
	CLRF        _count+1 
;FastWaiter.c,159 :: 		}
L_end_clear:
	RETURN      0
; end of _clear

_write:

;FastWaiter.c,162 :: 		void write(char* msg)
;FastWaiter.c,164 :: 		if (UART1_Tx_Idle())
	CALL        _UART1_Tx_Idle+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_write32
;FastWaiter.c,166 :: 		UART1_Write_Text(msg);
	MOVF        FARG_write_msg+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_write_msg+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;FastWaiter.c,167 :: 		clear(text, MSGLEN);
	MOVLW       _text+0
	MOVWF       FARG_clear_var+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_clear_var+1 
	MOVLW       19
	MOVWF       FARG_clear_size+0 
	CALL        _clear+0, 0
;FastWaiter.c,168 :: 		}
L_write32:
;FastWaiter.c,169 :: 		}
L_end_write:
	RETURN      0
; end of _write

_reader:

;FastWaiter.c,171 :: 		void reader()
;FastWaiter.c,173 :: 		if (UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_reader33
;FastWaiter.c,175 :: 		text[count] = UART1_Read();
	MOVLW       _text+0
	ADDWF       _count+0, 0 
	MOVWF       FLOC__reader+0 
	MOVLW       hi_addr(_text+0)
	ADDWFC      _count+1, 0 
	MOVWF       FLOC__reader+1 
	CALL        _UART1_Read+0, 0
	MOVFF       FLOC__reader+0, FSR1L+0
	MOVFF       FLOC__reader+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;FastWaiter.c,177 :: 		if (text[count] == '>')
	MOVLW       _text+0
	ADDWF       _count+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_text+0)
	ADDWFC      _count+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       62
	BTFSS       STATUS+0, 2 
	GOTO        L_reader34
;FastWaiter.c,179 :: 		clear(text, MSGLEN);
	MOVLW       _text+0
	MOVWF       FARG_clear_var+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_clear_var+1 
	MOVLW       19
	MOVWF       FARG_clear_size+0 
	CALL        _clear+0, 0
;FastWaiter.c,180 :: 		}
	GOTO        L_reader35
L_reader34:
;FastWaiter.c,181 :: 		else if (text[count] == '\n')
	MOVLW       _text+0
	ADDWF       _count+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_text+0)
	ADDWFC      _count+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_reader36
;FastWaiter.c,183 :: 		text[count+1] = '\0';
	MOVLW       1
	ADDWF       _count+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _count+1, 0 
	MOVWF       R1 
	MOVLW       _text+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_text+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;FastWaiter.c,185 :: 		if (word == 'O')
	MOVF        _word+0, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_reader37
;FastWaiter.c,187 :: 		if (strcmp(text, "OK\r\n") == 0)
	MOVLW       _text+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr9_FastWaiter+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr9_FastWaiter+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__reader85
	MOVLW       0
	XORWF       R0, 0 
L__reader85:
	BTFSS       STATUS+0, 2 
	GOTO        L_reader38
;FastWaiter.c,189 :: 		clear(text, MSGLEN);
	MOVLW       _text+0
	MOVWF       FARG_clear_var+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_clear_var+1 
	MOVLW       19
	MOVWF       FARG_clear_size+0 
	CALL        _clear+0, 0
;FastWaiter.c,190 :: 		}
L_reader38:
;FastWaiter.c,191 :: 		}
	GOTO        L_reader39
L_reader37:
;FastWaiter.c,192 :: 		else if (word == 'L')
	MOVF        _word+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_reader40
;FastWaiter.c,194 :: 		text[count+1] = '\0';
	MOVLW       1
	ADDWF       _count+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _count+1, 0 
	MOVWF       R1 
	MOVLW       _text+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_text+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;FastWaiter.c,196 :: 		if (strcmp(text, "Linked\r\n") == 0)
	MOVLW       _text+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr10_FastWaiter+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr10_FastWaiter+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__reader86
	MOVLW       0
	XORWF       R0, 0 
L__reader86:
	BTFSS       STATUS+0, 2 
	GOTO        L_reader41
;FastWaiter.c,198 :: 		clear(text, MSGLEN);
	MOVLW       _text+0
	MOVWF       FARG_clear_var+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_clear_var+1 
	MOVLW       19
	MOVWF       FARG_clear_size+0 
	CALL        _clear+0, 0
;FastWaiter.c,199 :: 		}
L_reader41:
;FastWaiter.c,200 :: 		}
L_reader40:
L_reader39:
;FastWaiter.c,202 :: 		}
L_reader36:
L_reader35:
;FastWaiter.c,204 :: 		count++;
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
;FastWaiter.c,205 :: 		}
L_reader33:
;FastWaiter.c,206 :: 		}
L_end_reader:
	RETURN      0
; end of _reader

_interrupt:

;FastWaiter.c,208 :: 		void interrupt()
;FastWaiter.c,210 :: 		GIE_bit = 0;
	BCF         GIE_bit+0, BitPos(GIE_bit+0) 
;FastWaiter.c,212 :: 		if (RCIF_bit == 1)
	BTFSS       RCIF_bit+0, BitPos(RCIF_bit+0) 
	GOTO        L_interrupt42
;FastWaiter.c,214 :: 		if(FERR_bit == 1)
	BTFSS       FERR_bit+0, BitPos(FERR_bit+0) 
	GOTO        L_interrupt43
;FastWaiter.c,216 :: 		rxRead = RCREG;
	MOVF        RCREG+0, 0 
	MOVWF       _rxRead+0 
	MOVLW       0
	MOVWF       _rxRead+1 
;FastWaiter.c,217 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;FastWaiter.c,218 :: 		return;
	GOTO        L__interrupt88
;FastWaiter.c,219 :: 		}
L_interrupt43:
;FastWaiter.c,221 :: 		if(OERR_bit == 1)
	BTFSS       OERR_bit+0, BitPos(OERR_bit+0) 
	GOTO        L_interrupt44
;FastWaiter.c,223 :: 		CREN_bit = 0;
	BCF         CREN_bit+0, BitPos(CREN_bit+0) 
;FastWaiter.c,224 :: 		CREN_bit = 1;
	BSF         CREN_bit+0, BitPos(CREN_bit+0) 
;FastWaiter.c,225 :: 		GIE_bit  = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;FastWaiter.c,226 :: 		return;
	GOTO        L__interrupt88
;FastWaiter.c,227 :: 		}
L_interrupt44:
;FastWaiter.c,229 :: 		count = RCREG;
	MOVF        RCREG+0, 0 
	MOVWF       _count+0 
	MOVLW       0
	MOVWF       _count+1 
;FastWaiter.c,230 :: 		count = 0;
	CLRF        _count+0 
	CLRF        _count+1 
;FastWaiter.c,232 :: 		TMR0L = oneSecond = secs = 0;
	CLRF        _secs+0 
	CLRF        _oneSecond+0 
	CLRF        _oneSecond+1 
	CLRF        TMR0L+0 
;FastWaiter.c,233 :: 		}
L_interrupt42:
;FastWaiter.c,235 :: 		if (TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt45
;FastWaiter.c,237 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;FastWaiter.c,238 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;FastWaiter.c,239 :: 		oneSecond++;
	INFSNZ      _oneSecond+0, 1 
	INCF        _oneSecond+1, 1 
;FastWaiter.c,241 :: 		if(oneSecond > 999)
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       _oneSecond+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt89
	MOVF        _oneSecond+0, 0 
	SUBLW       231
L__interrupt89:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt46
;FastWaiter.c,243 :: 		secs++;
	INCF        _secs+0, 1 
;FastWaiter.c,244 :: 		oneSecond=0;
	CLRF        _oneSecond+0 
	CLRF        _oneSecond+1 
;FastWaiter.c,245 :: 		}
L_interrupt46:
;FastWaiter.c,246 :: 		}
L_interrupt45:
;FastWaiter.c,248 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;FastWaiter.c,249 :: 		}
L_end_interrupt:
L__interrupt88:
	RETFIE      1
; end of _interrupt

_atStatus:

;FastWaiter.c,251 :: 		void atStatus()
;FastWaiter.c,253 :: 		word = 'O';
	MOVLW       79
	MOVWF       _word+0 
;FastWaiter.c,255 :: 		write("AT\r\n");
	MOVLW       ?lstr11_FastWaiter+0
	MOVWF       FARG_write_msg+0 
	MOVLW       hi_addr(?lstr11_FastWaiter+0)
	MOVWF       FARG_write_msg+1 
	CALL        _write+0, 0
;FastWaiter.c,256 :: 		Delay_ms(UART_DELAY);
	MOVLW       25
	MOVWF       R11, 0
	MOVLW       90
	MOVWF       R12, 0
	MOVLW       177
	MOVWF       R13, 0
L_atStatus47:
	DECFSZ      R13, 1, 1
	BRA         L_atStatus47
	DECFSZ      R12, 1, 1
	BRA         L_atStatus47
	DECFSZ      R11, 1, 1
	BRA         L_atStatus47
	NOP
	NOP
;FastWaiter.c,257 :: 		}
L_end_atStatus:
	RETURN      0
; end of _atStatus

_cipmux:

;FastWaiter.c,260 :: 		void cipmux()
;FastWaiter.c,262 :: 		word = 'O';
	MOVLW       79
	MOVWF       _word+0 
;FastWaiter.c,264 :: 		write("AT+CIPMUX=1\r\n");
	MOVLW       ?lstr12_FastWaiter+0
	MOVWF       FARG_write_msg+0 
	MOVLW       hi_addr(?lstr12_FastWaiter+0)
	MOVWF       FARG_write_msg+1 
	CALL        _write+0, 0
;FastWaiter.c,265 :: 		Delay_ms(UART_DELAY);
	MOVLW       25
	MOVWF       R11, 0
	MOVLW       90
	MOVWF       R12, 0
	MOVLW       177
	MOVWF       R13, 0
L_cipmux48:
	DECFSZ      R13, 1, 1
	BRA         L_cipmux48
	DECFSZ      R12, 1, 1
	BRA         L_cipmux48
	DECFSZ      R11, 1, 1
	BRA         L_cipmux48
	NOP
	NOP
;FastWaiter.c,266 :: 		}
L_end_cipmux:
	RETURN      0
; end of _cipmux

_main:

;FastWaiter.c,270 :: 		void main()
;FastWaiter.c,272 :: 		rcon=0x80;
	MOVLW       128
	MOVWF       RCON+0 
;FastWaiter.c,273 :: 		cmcon=0x0F;
	MOVLW       15
	MOVWF       CMCON+0 
;FastWaiter.c,274 :: 		intcon2=0;
	CLRF        INTCON2+0 
;FastWaiter.c,275 :: 		ADCON1 |= 0x0F;   //Define todos pi0s AN como digital I/O
	MOVLW       15
	IORWF       ADCON1+0, 1 
;FastWaiter.c,276 :: 		PORTD  = 0;
	CLRF        PORTD+0 
;FastWaiter.c,277 :: 		TRISE  = 0;
	CLRF        TRISE+0 
;FastWaiter.c,278 :: 		PORTE  = 0;
	CLRF        PORTE+0 
;FastWaiter.c,279 :: 		Keypad_Init();          // Inicializa o Teclado Matricial
	CALL        _Keypad_Init+0, 0
;FastWaiter.c,281 :: 		RCIE_bit   = 0;         // (DES)habilitar interrupcao  em RX
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;FastWaiter.c,282 :: 		TXIE_bit   = 0;         // desabilita interrupcao em TX (default)
	BCF         TXIE_bit+0, BitPos(TXIE_bit+0) 
;FastWaiter.c,283 :: 		PEIE_bit   = 1;         // habilitar/desabilitar interrupcoes perifericas (INTCON)
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;FastWaiter.c,284 :: 		GIE_bit    = 1;         // liga chave geral das interrupcoes
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;FastWaiter.c,285 :: 		TMR0IE_bit = 1;         //interrupcao do timer0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;FastWaiter.c,288 :: 		UART1_Init(38400);
	BSF         BAUDCON+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH+0 
	MOVLW       55
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;FastWaiter.c,289 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main49:
	DECFSZ      R13, 1, 1
	BRA         L_main49
	DECFSZ      R12, 1, 1
	BRA         L_main49
	DECFSZ      R11, 1, 1
	BRA         L_main49
	NOP
;FastWaiter.c,291 :: 		T0CON = 0xC4;
	MOVLW       196
	MOVWF       T0CON+0 
;FastWaiter.c,292 :: 		INTCON = 0xA0;
	MOVLW       160
	MOVWF       INTCON+0 
;FastWaiter.c,293 :: 		RCIE_bit = 0;
	BCF         RCIE_bit+0, BitPos(RCIE_bit+0) 
;FastWaiter.c,294 :: 		TXIE_bit = 0;
	BCF         TXIE_bit+0, BitPos(TXIE_bit+0) 
;FastWaiter.c,295 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;FastWaiter.c,296 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;FastWaiter.c,297 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;FastWaiter.c,298 :: 		OSCCON = 0x75;
	MOVLW       117
	MOVWF       OSCCON+0 
;FastWaiter.c,301 :: 		trisb=0;
	CLRF        TRISB+0 
;FastWaiter.c,302 :: 		portb=0;
	CLRF        PORTB+0 
;FastWaiter.c,303 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;FastWaiter.c,304 :: 		Lcd_Cmd(_Lcd_Cursor_Off);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,305 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,306 :: 		Delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main50:
	DECFSZ      R13, 1, 1
	BRA         L_main50
	DECFSZ      R12, 1, 1
	BRA         L_main50
;FastWaiter.c,307 :: 		pedido();
	CALL        _pedido+0, 0
;FastWaiter.c,309 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;FastWaiter.c,311 :: 		while (1)
L_main51:
;FastWaiter.c,313 :: 		if (i==0)
	MOVF        _i+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
;FastWaiter.c,315 :: 		pedido();
	CALL        _pedido+0, 0
;FastWaiter.c,316 :: 		leitura();
	CALL        _leitura+0, 0
;FastWaiter.c,317 :: 		}
L_main53:
;FastWaiter.c,318 :: 		if (kp != 0)
	MOVF        _kp+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main54
;FastWaiter.c,320 :: 		UART1_Write_Text("Pedido:");
	MOVLW       ?lstr13_FastWaiter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_FastWaiter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;FastWaiter.c,321 :: 		i=1;
	MOVLW       1
	MOVWF       _i+0 
;FastWaiter.c,322 :: 		do {                         // leitura do pedido
L_main55:
;FastWaiter.c,323 :: 		escrita();
	CALL        _escrita+0, 0
;FastWaiter.c,324 :: 		UART1_Write(kp);
	MOVF        _kp+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;FastWaiter.c,325 :: 		pos++;
	INCF        _pos+0, 1 
;FastWaiter.c,326 :: 		leitura();
	CALL        _leitura+0, 0
;FastWaiter.c,327 :: 		if (pos == 3)               //
	MOVF        _pos+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main58
;FastWaiter.c,329 :: 		do {                       // Maximo 3 digitos
L_main59:
;FastWaiter.c,330 :: 		leitura();                //
	CALL        _leitura+0, 0
;FastWaiter.c,331 :: 		} while (kp != 'A');       //
	MOVF        _kp+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_main59
;FastWaiter.c,332 :: 		}                           //
L_main58:
;FastWaiter.c,333 :: 		} while( kp != 'A');
	MOVF        _kp+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_main55
;FastWaiter.c,335 :: 		num = kp;
	MOVF        _kp+0, 0 
	MOVWF       _num+0 
;FastWaiter.c,337 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,338 :: 		quantidade();
	CALL        _quantidade+0, 0
;FastWaiter.c,339 :: 		kp=0;
	CLRF        _kp+0 
;FastWaiter.c,340 :: 		pos=0;
	CLRF        _pos+0 
;FastWaiter.c,341 :: 		UART1_Write_Text("  ");
	MOVLW       ?lstr14_FastWaiter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_FastWaiter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;FastWaiter.c,342 :: 		UART1_Write_Text("Quantidade:");
	MOVLW       ?lstr15_FastWaiter+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_FastWaiter+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;FastWaiter.c,343 :: 		delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main62:
	DECFSZ      R13, 1, 1
	BRA         L_main62
	DECFSZ      R12, 1, 1
	BRA         L_main62
;FastWaiter.c,345 :: 		do {
L_main63:
;FastWaiter.c,346 :: 		if (kp==0)
	MOVF        _kp+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main66
;FastWaiter.c,348 :: 		do {
L_main67:
;FastWaiter.c,349 :: 		leitura();
	CALL        _leitura+0, 0
;FastWaiter.c,350 :: 		} while (kp == 0);
	MOVF        _kp+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main67
;FastWaiter.c,351 :: 		}
L_main66:
;FastWaiter.c,352 :: 		escrita();                   // leitura da quantidade
	CALL        _escrita+0, 0
;FastWaiter.c,353 :: 		UART1_Write(kp);
	MOVF        _kp+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;FastWaiter.c,354 :: 		pos++;
	INCF        _pos+0, 1 
;FastWaiter.c,355 :: 		leitura();
	CALL        _leitura+0, 0
;FastWaiter.c,357 :: 		if (pos == 3)                //
	MOVF        _pos+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main70
;FastWaiter.c,359 :: 		do {                        // Maximo 3 digitos
L_main71:
;FastWaiter.c,360 :: 		leitura();                 //
	CALL        _leitura+0, 0
;FastWaiter.c,361 :: 		} while (kp != 'A');        //
	MOVF        _kp+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_main71
;FastWaiter.c,362 :: 		}                            //
L_main70:
;FastWaiter.c,363 :: 		} while( kp != 'A');
	MOVF        _kp+0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_main63
;FastWaiter.c,365 :: 		qtd = kp;
	MOVF        _kp+0, 0 
	MOVWF       _qtd+0 
;FastWaiter.c,367 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,368 :: 		pos=0;
	CLRF        _pos+0 
;FastWaiter.c,369 :: 		i=0;
	CLRF        _i+0 
;FastWaiter.c,370 :: 		kp=0;
	CLRF        _kp+0 
;FastWaiter.c,372 :: 		num = 0;
	CLRF        _num+0 
;FastWaiter.c,373 :: 		qtd = 0;
	CLRF        _qtd+0 
;FastWaiter.c,375 :: 		lcd_out(1,1, "     Pedido     ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,376 :: 		lcd_out(2,1, "    enviado   ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr17_FastWaiter+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_FastWaiter+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;FastWaiter.c,377 :: 		delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main74:
	DECFSZ      R13, 1, 1
	BRA         L_main74
	DECFSZ      R12, 1, 1
	BRA         L_main74
	DECFSZ      R11, 1, 1
	BRA         L_main74
	NOP
	NOP
;FastWaiter.c,378 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;FastWaiter.c,379 :: 		delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main75:
	DECFSZ      R13, 1, 1
	BRA         L_main75
	DECFSZ      R12, 1, 1
	BRA         L_main75
;FastWaiter.c,380 :: 		}
L_main54:
;FastWaiter.c,381 :: 		}//while
	GOTO        L_main51
;FastWaiter.c,382 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
