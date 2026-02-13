#ifndef UART_H
#define UART_H

#define UART0 0x10000000UL

void uart_putchar(char c);
void uart_puts(const char *s);

#endif
