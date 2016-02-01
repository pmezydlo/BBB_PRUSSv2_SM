CFLAGS+=-Wall -Werror
LDLIBS+= -lpthread -lprussdrv

all: sm.bin sm

clean:
	rm -f sm *.o *.bin

sm.bin: sm.p
	pasm -b $^

sm: sm.o
