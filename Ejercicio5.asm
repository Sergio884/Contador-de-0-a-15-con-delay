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
	clr zh

rjmp leer

retencion:
	ldi zl,0
	cpi aux,10
	brcc retencionMayor
	add zl,aux
	ld aux,z
	out porta,r0
	out portc,aux
	rjmp leer

retencionMayor:
	ldi r22,10
	sub aux,r22
	add zl,aux
	ld aux,z
	out porta,r1
	out portc,aux


leer:
	in aux,pinb
	mov numero,aux
	andi numero,$0F
	mov periodo,aux
	andi periodo,$F0
	swap periodo
	cpi periodo,0
	breq retencion
	cpi contador,0
	breq numero0

	cpi contador,1
	breq jump1

	cpi contador,2
	breq jump2

	cpi contador,3
	breq jump3

	cpi contador,4
	breq jump4

	cpi contador,5
	breq jump5

	cpi contador,6
	breq jump6

	cpi contador,7
	breq jump7

	cpi contador,8
	breq jump8

	cpi contador,9
	breq jump9
	
	cpi contador,10
	breq jump10
	
	cpi contador,11
	breq jump11
	cpi contador,12
	breq jump12
	cpi contador,13
	breq jump13
	cpi contador,14
	breq jump14
	cpi contador,15
	breq jump15


jump0:
	rjmp numero0
jump1:
	rjmp numero1
jump2:
	rjmp numero2
jump3:
	rjmp numero3
jump4:
	rjmp numero4
jump5:
	rjmp numero5
jump6:
	rjmp numero6

jumpLeer1:
	rjmp leer
jump7:
	rjmp numero7
jump8:
	rjmp numero8
jump9:
	rjmp numero9
jump10:
	rjmp numero10
jump11:
	rjmp numero11
jump12:
	rjmp numero12
jump13:
	rjmp numero13
jump14:
	rjmp numero14
jump15:
	rjmp numero15


numero0:
	out porta,r0
	out portc,r0
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo

numero1:
	out porta,r0
	out portc,r1
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo


numero2:
	out porta,r0
	out portc,r2
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo


numero3:
	out porta,r0
	out portc,r3
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo


numero4:
	out porta,r0
	out portc,r4
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo


numero5:
	out porta,r0
	out portc,r5
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo


numero6:
	out porta,r0
	out portc,r6
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo



numero7:
	out porta,r0
	out portc,r7
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo


numero8:
	out porta,r0
	out portc,r8
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo

numero9:
	out porta,r0
	out portc,r9
	cp numero,contador
	breq jumpReseteo
	rjmp tiempo

jumpLeer2:
	rjmp jumpLeer1

jumpReseteo:
	rjmp reseteo

numero10:
	out porta,r1
	out portc,r0
	cp numero,contador
	breq reseteo
	rjmp tiempo
numero11:
	out porta,r1
	out portc,r1
	cp numero,contador
	breq reseteo
	rjmp tiempo

numero12:
	out porta,r1
	out portc,r2
	cp numero,contador
	breq reseteo
	rjmp tiempo

numero13:
	out porta,r1
	out portc,r3
	cp numero,contador
	breq reseteo
	rjmp tiempo


numero14:
	out porta,r1
	out portc,r4
	cp numero,contador
	breq reseteo
	rjmp tiempo
	
numero15:
	out porta,r1
	out portc,r5
	cp numero,contador
	breq reseteo
	rjmp tiempo

reseteo:
	ldi contador,255
	rjmp tiempo

tiempo:
	ldi  r17, 21;21
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
	rjmp jumpLeer2
