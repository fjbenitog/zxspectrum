; 010T TSSS LLLC CCCC
; TT Tercio
; SSS Scanline
; LLL Linea
; CCCCC Columna

NextScan:
inc h       ; Incrementa H para incrementa el scanline
ld a, h     ; Carga el valor en A
and $07     ; Se queda con los bits del scanline
ret nz      ; si el valor no es 0, fin rutina

;Calcula la siguiente linea
ld a, l     ; Carga el valor en A
add a, $20  ; Añade uno a la lines (%0010 0000)
ld l, a     ; Caga el valor en L
ret c       ; Si hay acarreo, ha cambiado de  tercio. Fin rutina

; Si llega aqui, no hay cambio de tercio y hay que ajustar
; ya que el primer INC H lo incremento
ld a, h     ; Carga el valor en a
sub $80     ; Resta un tercio (%0000 1000)
ld h,a      ; Carga el valor en h
ret