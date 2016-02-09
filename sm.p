
.setcallreg r29.w2
.origin 0        
.entrypoint START

#include "sm.hp"

START:
	MOV r1, 5


STEP0:
	clrgpio P9_27  
	clrgpio P9_28
	clrgpio P9_29
	setgpio P9_30
	CALL delay

STEP1:
	clrgpio P9_27  
	clrgpio P9_28
	setgpio P9_29
	setgpio P9_30
	CALL delay

STEP2:
	clrgpio P9_27  
	clrgpio P9_28
	setgpio P9_29
	clrgpio P9_30
	CALL delay

STEP3:
	clrgpio P9_27  
	setgpio P9_28
	setgpio P9_29
	clrgpio P9_30
	CALL delay

STEP4:
	clrgpio P9_27  
	setgpio P9_28
	clrgpio P9_29
	clrgpio P9_30
	CALL delay

STEP5:
	setgpio P9_27  
	setgpio P9_28
	clrgpio P9_29
	clrgpio P9_30
	CALL delay

STEP6:
	setgpio P9_27  
	clrgpio P9_28
	clrgpio P9_29
	clrgpio P9_30
	CALL delay

STEP7:
	setgpio P9_27  
	clrgpio P9_28
	clrgpio P9_29
	setgpio P9_30
	CALL delay
	JMP STEP0

EXIT:
	MOV r31.b0, 19 + 16  	
	HALT  

delay:
	MOV r0, 0x00040000
delay2:
        SUB r0, r0, 1
        QBNE delay2, r0, 0
        RET

