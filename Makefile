CROSS ?= riscv64-unknown-elf-

CFLAGS = -ffreestanding -Wall -O2 -g \
	-march=rv64imac -mabi=lp64 -mcmodel=medany

LDFLAGS = -nostdlib -nostartfiles -T linker.ld

OBJS = arch/riscv/start.o \
       knekt/kernel.o \
       knekt/uart.o \
       knekt/debug.o

all: moonshot.elf

moonshot.elf: $(OBJS)
	$(CROSS)gcc $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@

arch/riscv/%.o: arch/riscv/%.S
	$(CROSS)gcc $(CFLAGS) -c $< -o $@

knekt/%.o: knekt/%.c
	$(CROSS)gcc $(CFLAGS) -c $< -o $@

clean:
	rm -f arch/riscv/*.o knekt/*.o *.elf
