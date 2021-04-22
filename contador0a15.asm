.include "m8535def.inc"
.def aux = r16
.def periodo = r20
.def numero = r21
.def contador = r22
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
	clr contador
	ldi r23,$7D
	mov r6,r23
	ldi r24,$27
	mov r7,r24
	ldi r25,$7F
	mov r8,r25
	ldi r26,$6F
	mov r9,r26

leer:
	in aux,pinb
	mov numero,aux
	andi numero,$0F
	mov periodo,aux
	andi periodo,$F0
	swap periodo
	cpi contador,0
	breq numero0

	cpi contador,1
	breq numero1

	cpi contador,2
	breq numero2

	cpi contador,3
	breq numero3

	cpi contador,4
	breq numero4

	cpi contador,5
	breq numero5

	cpi contador,6
	breq numero6

	cpi contador,7
	breq numero7

	cpi contador,8
	breq numero8

	cpi contador,9
	breq numero9
	
	cpi contador,10
	breq numero10
	

	/*
	cpi contador,11
	breq numero11
	cpi contador,12
	breq numero12
	cpi contador,13
	breq numero13
	cpi contador,14
	breq numero14
	cpi contador,15
	breq numero15 */


tiempo:
	ldi  r17, 8;21
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
	brne tiempo
	inc contador
	rjmp leer

reseteo:
	ldi contador,255
	rjmp tiempo

numero0:
	out porta,r0
	out portc,r0
	cp numero,contador
	breq reseteo
	rjmp tiempo

numero1:
	out porta,r0
	out portc,r1
	cp numero,contador
	breq reseteo
	rjmp tiempo


numero2:
	out porta,r0
	out portc,r2
	cp numero,contador
	breq reseteo
	rjmp tiempo


numero3:
	out porta,r0
	out portc,r3
	cp numero,contador
	breq reseteo
	rjmp tiempo


numero4:
	out porta,r0
	out portc,r4
	cp numero,contador
	breq numero4
	rjmp tiempo


numero5:
	out porta,r0
	out portc,r5
	cp numero,contador
	breq numero5
	rjmp tiempo


numero6:
	out porta,r0
	out portc,r6
	cp numero,contador
	breq numero6
	rjmp tiempo


numero7:
	out porta,r0
	out portc,r7
	cp numero,contador
	breq numero7
	rjmp tiempo


numero8:
	out porta,r0
	out portc,r8
	cp numero,contador
	breq numero8
	rjmp tiempo


numero9:
	out porta,r0
	out portc,r9
	cp numero,contador
	breq reseteo
	rjmp tiempo


numero10:
	out porta,r1
	out portc,r0
	cp numero,contador
	breq reseteo
	rjmp tiempo

/*

numero11:
	out porta,r1
	out portc,r1
	cp numero,contador
	breq numero11
	rjmp tiempo

numero12:
	out porta,r1
	out portc,r2
	cp numero,contador
	breq numero12
	rjmp tiempo

numero13:
	out porta,r1
	out portc,r3
	cp numero,contador
	breq numero13
	rjmp tiempo


numero14:
	out porta,r1
	out portc,r4
	cp numero,contador
	breq numero14
	rjmp tiempo
	
numero15:
	out porta,r1
	out portc,r5
	cp numero,contador
	breq numero15
	rjmp tiempo


*/

