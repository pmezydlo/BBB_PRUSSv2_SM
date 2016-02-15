CFLAGS=-Wall
LDLIBS+= -lpthread -lprussdrv

all: sm.bin sm data

clean:
	rm -f sm *.o *.bin

sm.bin: sm.p sm.hp
	pasm -b sm.p;



sm: sm.o

data: data.o
