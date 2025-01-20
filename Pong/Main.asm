; Ensamblador para ZX Spectrum 16Kb - Pong
; Dibujando por la pantalla
org	$8000

; Dibuja dos líneas verticales, una de abajo a arriba y otra de arriba a abajo
; para probar las rutinas NextScan y PreviousScan.
Main:
ld		hl, $4000		; Apunta HL al primer scanline, primera línea, primer tercio
						; y columna 0 de la pantalla (Columna de 0 a 31)
ld		b, $c0			; B = 192. Número de scanlines que tiene la pantalla

Loop:
ld		(hl), $3c		; Pinta en la pantalla 001111000
call	NextScan		; Pasa al siguiente scanline
halt					; Descomentar línea si se quiere ver el proceso de pintado
djnz	Loop			; Hasta que B = 0


ret

include "Pong/Video.asm"

end	$8000