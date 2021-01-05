
.MODEL tiny

.DATA

mimensaje db "Bienvenido ingrese porfavor su nombre $"   
mimensaj db "Buenos dias-noches  $"

mimemoria db 200, 200 DUP(24H)    ;08H limita la lectura a 7 caracteres mas enter
                                ;DUP(24H) escribe 10 veces el caracter 24H

.CODE



mov dx,OFFSET mimensaje;
mov ah, 09h;                ;muestra en pantalla la cadena de caracteres en mimemoria hasta 
                            ;encontrar el 24H 
int 21h;

call linea;

mov  dx,OFFSET mimemoria                                
mov  ah,0AH                 ;lee una cadena de caracteres desde teclado y los guarda emn mimemoria  
int  21H                           

call linea; 
mov dx,OFFSET mimensaj;
mov ah, 09h;                ;muestra en pantalla la cadena de caracteres en mimemoria hasta 
                            ;encontrar el 24H 
int 21h;

mov dx,OFFSET mimemoria+2;
mov ah, 09h;                ;muestra en pantalla la cadena de caracteres en mimemoria hasta 
                            ;encontrar el 24H 
int 21h;

mov ah, 0h;                 ;devuelve el control al sistema operativo
int 16h;

ret;

;-------------------------------------------------------------------
;               Procedimiento para salto de linea
;-------------------------------------------------------------------

    linea PROC NEAR          
               
        MOV     AH,02H             
        MOV     DL,0DH             ; regreso de linea
        INT     21H
         
        MOV     AH,02H
        MOV     DL,0AH             ; alimentacion de linea
        INT     21H
        RET                   

     linea ENDP

END
