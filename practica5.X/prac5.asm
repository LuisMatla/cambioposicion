;Contreras Matla Luis Fernando (S21020225).
;García Velandia Samuel Obed (S21002413).
;Practica 5. Cambio de posición.

__CONFIG _WDT_OFF&_PWRTE_ON&_XT_OSC&_LVP_OFF&_CP_OFF ;configura los fusibles del microcontrolador.
LIST P=16F877A                     ;especifica el microcontrolador a usar (PIC16F877A).
#include "P16F877A.INC"            ;incluye el archivo de definiciones del PIC16F877A.
ORG 0x00                           ;establece el origen del programa en la dirección 0x00 (vector de reset).
GOTO INICIO                        ;salta a la etiqueta INICIO al iniciar el programa.
ORG 0x05                           ;establece el origen en 0x05 (vector de interrupción, aunque no se usa).

INICIO                              ;etiqueta de inicio del programa.
BSF STATUS, RP0                    ;pone en 1 el bit RP0 del registro STATUS (selecciona banco 1).
BCF STATUS, RP1                    ;pone en 0 el bit RP1 del registro STATUS (banco 1).
MOVLW b'11111000'                  ;mueve el valor binario 11111000 (248 decimal) al registro W.
MOVWF TRISB                        ;configura PORTB como entrada (bits 0-2 y 4-7 como entrada, bit 3 como salida).
MOVLW b'00000000'                  ;mueve el valor binario 00000000 (0 decimal) al registro W.
MOVWF TRISC                        ;configura PORTC como salida (todos los bits como salida).
BCF STATUS, RP0                    ;pone en 0 el bit RP0 del registro STATUS (regresa al banco 0).
BCF STATUS, RP1                    ;pone en 0 el bit RP1 del registro STATUS (banco 0).

MAIN                                ;etiqueta del bucle principal.
BTFSS PORTB, 3                     ;testea el bit 3 (RB3) del PORTB, si está en 1 salta la siguiente línea.
CALL BAJO                          ;si el bit 3 está en 0, llama a la subrutina BAJO.
BTFSC PORTB, 3                     ;testea el bit 3 (RB3) del PORTB, si está en 0 salta la siguiente línea.
CALL ALTO                          ;si el bit 3 está en 1, llama a la subrutina ALTO.
GOTO MAIN                          ;regresa al inicio del bucle MAIN (bucle infinito).

BAJO                                ;subrutina que se ejecuta cuando RB3 está en 0.
MOVF PORTB, W                      ;carga el valor actual del PORTB en el registro W.
SWAPF PORTB, W                     ;intercambia los nibbles (bits 0-3 con bits 4-7) y lo pone en W.
XORLW b'00001111'                  ;realiza la operación XOR con 00001111 (invierte los 4 bits menos significativos).
MOVWF PORTC                        ;mueve el resultado al puerto C.
RETURN                             ;regresa de la subrutina.

ALTO                                ;subrutina que se ejecuta cuando RB3 está en 1.
SWAPF PORTB, W                     ;intercambia los nibbles (bits 0-3 con bits 4-7) y lo pone en W.
MOVWF PORTC                        ;mueve el resultado al puerto C.
RETURN                             ;regresa de la subrutina.
END                                ;fin del programa.
