#include "uart.h"

void kernel_main(void) {
        uart_puts("Hello from knekt\n");
        while(1);
}
