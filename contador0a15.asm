.include "m8535def.inc"
.def aux = r16
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
	out porta,r9
	out portc,r0
	rjmp leer


