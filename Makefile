CROSS = riscv64-unknown-elf-
CFLAGS = -ffreestanding -Wall -O2 -nostdlib -nostartfiles -g -march=rv64imac \
	-mabi=lp64 -mcmodel=medany

OBJS = arch/riscv/start.o knekt/debug.o knekt/kernel.o knekt/uart.o

all: moonshot.elf

moonshot.elf: $(OBJS)
	$(CROSS)gcc $(CFLAGS) -T linker.ld $(OBJS) -o moonshot.elf

%.o: %.c
	$(CROSS)gcc $(CFLAGS) -c $< -o $@

%.o: %.S
	$(CROSS)gcc $(CFLAGS) -c $< -o $@
