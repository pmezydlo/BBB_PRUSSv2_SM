 .origin 0  
 .entrypoint BLINK
  
        MOV r1, 5
  

TOP: 
  	QBBS HIGH, r31, 14  
	QBBC LOW, r31, 14  
	QBA TOP


HIGH:
	SET r30, r30, 15 	
	CLR r30, r30, 14
	QBA TOP

LOW:
	CLR r30, r30, 15
	SET r30, r30, 14
	QBA TOP


    BLINK:

	 SET r30, r30, 15 

         MOV r0, 0x00F00000

    DELAY:
        SUB r0, r0, 1
        QBNE DELAY, r0, 0
	CLR r30, r30, 15 
        MOV r0, 0x00F00000

    DELAY2:
        SUB r0, r0, 1
        QBNE DELAY2, r0, 0
        SUB r1, r1, 1
        QBNE BLINK, r1, 0

 MOV r31.b0, 19 + 16  
 HALT  
