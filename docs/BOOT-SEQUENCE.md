# knekt boot sequence

this document describes the control flow from machine power-on to `kernel_main()` for knekt.

## 1. reset vector

when the machine starts, the CPU begins execution at the reset vector defined by the platform.

execution begins in:

´´´
arch/riscv/start.S
´´´

## 2. assembly startup

the assembly bootstrap performs minimal hardware preparation before entering C code.

### responsibilities

1. disable interrupts
2. set stack pointer
3. zero ´.bss´ section
4. initialize global pointer (´gp´)
5. jump into C kernel

### stack initialization

the linker script provides a symbol ´_stack_top´

startup code loads it: ´la sp, _stack_top´

### entering C

execution transfers to ´kernel_main()´. from this point onward execution is standard C environment (freestanding).

## 3. kernel_main()

defined in ´knekt/kernel.c´

current behavior:

- prints boot message through UART
- triggers assertion failure for testing panic path

## 4. UART output path

printing uses ´uart_puts()´ and ´uart_putchar()´

driver:

´´´
knekt/uart.c
´´´

UART is memory-mapped I/O with no interrupts, as of right now.

## 5. panic path

assertions use macro ´assert(x)´

defined in:

´´´
knekt/debug.h
´´´

if condition fails:

´´´
panic(msg, file, line)
´´´

panic:

- prints formatted error
- enters infinite loop
- halts kernel safely

## 6. memory layout

defined in ´linker.ld´

| section | purpose |
|--------|---------|
| .text | code |
| .rodata | constants |
| .data | initialized globals |
| .bss | zeroed globals |
| .stack | kernel stack |

