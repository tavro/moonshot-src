#include "debug.h"

#define VERSION "v0.1"

void kernel_main(void) {
        uart_puts("Hello from knekt\n");
        assert(0);
}

