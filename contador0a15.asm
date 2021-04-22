.include "m8535def.inc"
.def aux = r16
.def periodo = r20
.def numeroU = r21
ser aux
out ddra,aux
out ddrc,aux
out portb,aux
	
	ldi r17,$3F
	mov r0,r17
	ldi r18,$06
	mov r1,r18
	ldi r19,$5B
	mov r2,r19
	ldi r20,$4F
	mov r3,r20
	ldi r21,$66
	mov r4,r21
	ldi r22,$6D
	mov r5,r22
	ldi r23,$7D
	mov r6,r23
	ldi r24,$27
	mov r7,r24
	ldi r25,$7F
	mov r8,r25
	ldi r26,$6F
	mov r9,r26
	clr zh
leer:
	in aux,pinb
	mov numeroU,aux
	andi numeroU,$0F
	mov periodo,aux
	andi periodo,$F0
	swap periodo
	ldi zl,0
	add zl,numeroU
	ld numeroU,z
	out porta,r0
	out portc,numeroU
	rjmp tiempo

tiempo:
	ldi  r17, 6;21
    ldi  r18, 75 ;75
    ldi  r19, 191 ;191
L1: dec  r19
    brne L1
    dec  r18
    brne L1
    dec  r17
    brne L1
    nop
	dec periodo
	cpi periodo,0
	breq leer
	rjmp tiempo


