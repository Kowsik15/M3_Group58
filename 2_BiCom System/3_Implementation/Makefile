CC =arm-none-eabi-gcc

MACH=cortex-m4

CFLAGS =-c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -O0 
LDFLAGS= -nostdlib -T linker_file.ld

all:clean main.o own_drivers_and_func.o startup.o finalfile.elf run

main.o:main.c
	$(CC) $(CFLAGS) -o $@ $^

own_drivers_and_func.o:own_drivers_and_func.c
	$(CC) $(CFLAGS) -o $@ $^

startup.o:startup.c
	$(CC) $(CFLAGS) -o $@ $^

finalfile.elf:main.o own_drivers_and_func.o startup.o
	$(CC) $(LDFLAGS) -o $@ $^
run:
	qemu-system-gnuarmeclipse.exe -M STM32F4-Discovery -mcu STM32F407VG -kernel finalfile.elf
clean:
	-rm -rf *.o *.elf
