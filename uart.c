#include "uart.h"

#define UART_TX  0x0
#define UART_LSR 0x5

static inline void mmio_write(unsigned long addr, unsigned char val) {
        *(volatile unsigned char *)addr = val;
}

static inline unsigned char mmio_read(unsigned long addr) {
        return *(volatile unsigned char *)addr;
}

void uart_putchar(char c) {
        while (!(mmio_read(UART0 + UART_LSR) & (1 << 5)));
        mmio_write(UART0 + UART_TX, c);
}

void uart_puts(const char *s) {
        while (*s) {
                if (*s == '\n') {
                        uart_putchar('\r');
                }
                uart_putchar(*s++);
        }
}

