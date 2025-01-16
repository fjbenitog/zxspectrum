org $8000

; Atributos permanentes pantalla (FBPPPIII)
ATTR_S: equ $5c8d

; Atributo actual (FBPPPIII)
ATTR_T: equ $5c8f

;Rutina ROM similar AT BASIC
LOCATE: equ $0dd9

; Rutina ROM CLS BASIC
CLS: equ $0daf

Inicio:
ld a, $0e
ld hl, ATTR_T
ld (hl), a
ld hl, ATTR_S
ld (hl), a

call CLS

ld a, $06
out ($fe), a

ld b, $18-$0a
ld c, $21-$02
call LOCATE

ld hl, msg

Bucle:
ld a, (hl)
or a
jr z, Fin
rst $10
inc hl
jr Bucle

Fin:
jr Fin
msg: defm 'Hola ensamblador ZX Spectrum', $00


end $8000
