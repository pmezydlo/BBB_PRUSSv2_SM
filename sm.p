
.setcallreg r29.w2
.origin 0        
.entrypoint START

#include "sm.hp"

START:
	MOV r13, 0x00000FA0
	MOV r0, 0x00000000
	LBBO r2, r0, 0, 4 /*counter for delay */
	LBBO r3, r0, 4, 4 /*number of steps */
	LBBO r4, r0, 8, 4 /*direction 0-Left 1-right */
	MOV r1, 0x00000000	

MAIN:
	QBBS EXIT, r31, 15
	
	SUB r3, r3, 1
	QBEQ EXIT, r3, 0
	
	QBEQ dir, r4, 0	        

        SUB r1, r1, 1
        QBNE phase, r1, 0
                MOV r1, 8
	
        QBA phase

        dir:

        ADD r1, r1, 1
        QBNE phase, r1, 9
                MOV r1, 1

	phase:

	CALL delay

	QBEQ STEP0, r1, 1
	QBEQ STEP1, r1, 2
	QBEQ STEP2, r1, 3
	QBEQ STEP3, r1, 4
	QBEQ STEP4, r1, 5
	QBEQ STEP5, r1, 6
	QBEQ STEP6, r1, 7
	QBEQ STEP7, r1, 8

EXIT:
	MOV r31.b0, 19 + 16  	
	HALT  

delay:
	MOV r0, r2
delay2:
        SUB r0, r0, 1
        QBNE delay2, r0, 0
        RET

STEP0:
	clrgpio P9_27  
	clrgpio P9_28
	clrgpio P9_29
	setgpio P9_30
	QBA MAIN

STEP1:
	clrgpio P9_27  
	clrgpio P9_28
	setgpio P9_29
	setgpio P9_30
	QBA MAIN

STEP2:
	clrgpio P9_27  
	clrgpio P9_28
	setgpio P9_29
	clrgpio P9_30
	QBA MAIN

STEP3:
	clrgpio P9_27  
	setgpio P9_28
	setgpio P9_29
	clrgpio P9_30
	QBA MAIN

STEP4:
	clrgpio P9_27  
	setgpio P9_28
	clrgpio P9_29
	clrgpio P9_30
	QBA MAIN

STEP5:
	setgpio P9_27  
	setgpio P9_28
	clrgpio P9_29
	clrgpio P9_30
	QBA MAIN

STEP6:
	setgpio P9_27  
	clrgpio P9_28
	clrgpio P9_29
	clrgpio P9_30
	QBA MAIN

STEP7:
	setgpio P9_27  
	clrgpio P9_28
	clrgpio P9_29
	setgpio P9_30
	QBA MAIN
