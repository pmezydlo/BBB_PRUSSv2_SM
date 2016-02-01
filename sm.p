 .origin 0  
 .entrypoint BLINK
  
        MOV r1, 5
  
  BLINK:
	 SET r30, r30, 15 

        MOV r0, 0x0A000000
    DELAY:
        SUB r0, r0, 1
        QBNE DELAY, r0, 0
	CLR r30, r30, 15 
        MOV r0, 0x0A000000

    DELAY2:
        SUB r0, r0, 1
        QBNE DELAY2, r0, 0
        SUB r1, r1, 1
        QBNE BLINK, r1, 0

 MOV r31.b0, 19 + 16  
 HALT  
