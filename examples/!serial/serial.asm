; generated by lcc-xr18DH $Version: 5.0 - XR18DH $ on Sun Oct 09 16:29:04 2016

SP:	equ	2 ;stack pointer
memAddr: equ	14
retAddr: equ	6
retVal:	equ	15
regArg1: equ	12
regArg2: equ	13
	listing off
	include lcc1802ProloDH.inc
	listing on
_outstring:
	dw L1
_fakeit:		;framesize=2
;void fakeit(){
;	asm(" req\n"
 req
 nop
 lbr $+2
 glo r14
 lbr $+2
 glo 12
 shr
 plo 12
 nop
 seq
;}
L2:
	Cretn

_main: ;copt is peeping your size 10 frame with oct 23 rules
	reserve 8
;void main(void) {
	lbr L6
L5:
;	while(1) {	// do forever
;		fakeit();//send_serial_byte(0x55);
	Ccall _fakeit
;	}
L6:
;	while(1) {	// do forever
	lbr L5
;}
L4:
	release 8
	Cretn

_send_serial_byte:		;framesize=6
	reserve 2; save room for local variables
	pushr R7
;{
;  	int i = 8;  // 8 data bits to send
	ldaD R7,8; reg:acon
;  	SETQ;							// send start bit SETQ macro
;	DELAYUS; //17 inst  						// wait for bit delay macro
 req
 nop
	lbr L12
L11:
;  	{
;asm(" glo 12\n"
;    	i--;  //1 inst
 glo 12
 shr
 plo 12
 bnf $$nobit
 seq
 br  $$done
$$nobit: req
 nop
$$done:
	decm R7,1
;    	DELAYUS; //17 inst			// wait for baud macro
 nop
;  	} //while overhead is 2.5 inst //maybe 26.5 inst
L12:
;  	while(i) //LBR=1.5 inst                     // send 8 serial bits, LSB first
	jnzU2 R7,L11; NE 0
;	CLRQ;					// send stop bit macro
;	DELAYUS;
;	DELAYUS; 				// wait a couple of bits for safety macro
 seq
 nop
 nop
;}
L8:
	popr R7
	release 2; release room for local variables 
	Cretn

L1:
	db 84
	db 104
	db 105
	db 115
	db 32
	db 105
	db 115
	db 32
	db 97
	db 32
	db 116
	db 101
	db 115
	db 116
	db 32
	db 111
	db 102
	db 32
	db 116
	db 104
	db 105
	db 115
	db 32
	db 115
	db 121
	db 115
	db 116
	db 101
	db 109
	db 46
	db 32
	db 49
	db 50
	db 51
	db 52
	db 53
	db 54
	db 55
	db 56
	db 57
	db 48
	db 10
	db 13
	db 0
	include lcc1802EpiloDH.inc
	include IO1802.inc
