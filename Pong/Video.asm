; -----------------------------------------------------------------------------
; NextScan. https://wiki.speccy.org/cursos/ensamblador/gfx2_direccionamiento
; Obtiene la posición de memoria correspondiente al scanline siguiente al indicado.
; 010T TSSS LLLC CCCC
; Entrada:  HL -> scanline actual.
; Salida:   HL -> scanline siguiente.
; Altera el valor de los registros AF y HL.
; -----------------------------------------------------------------------------
NextScan:
inc		h               ; Incrementa H para incrementar el scanline
ld		a, h            ; Carga el valor en A
and		$07				; Se queda con los bits del scanline
ret		nz				; Si el valor no es 0, fin de la rutina  

; Calcula la siguiente línea
ld		a, l        	; Carga el valor en A
add		a, $20          ; Añade 1 a la línea (%0010 0000)
ld		l, a            ; Carga el valor en L
ret		c				; Si hay acarreo, ha cambiado de tercio,
						; que ya viene ajustado de arriba. Fin de la rutina

; Si llega aquí, no ha cambiado de tercio y hay que ajustar 
; ya que el primer inc h incrementó el tercio
ld		a, h            ; Carga el valor en A
sub		$08         	; Resta un tercio (%0000 1000)
ld		h, a            ; Carga el valor en H
ret

