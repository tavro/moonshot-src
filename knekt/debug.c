#include "debug.h"

void panic(const char *msg, const char *file, int line) {
        uart_puts("PANIC: ");
        uart_puts(msg);
        uart_puts(" at ");
        uart_puts(file);
        uart_puts(":");
        char buf[10];
        int n = line, i = 0;
        if (n == 0) uart_puts("0");
        while(n) {
                buf[i++] = '0' + (n % 10);
                n /= 10;
        }
        while(i--) uart_putchar(buf[i]);
        while(1);
}

