CFLAGS=-Wall
LDLIBS+= -lpthread -lprussdrv

all: sm.bin sm

clean:
	rm -f sm *.o *.bin

sm.bin: sm.p sm.hp
	pasm -b sm.p;



sm: sm.o
