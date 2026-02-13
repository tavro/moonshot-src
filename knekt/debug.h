#ifndef DEBUG_H
#define DEBUG_H

#include "uart.h"

#define assert(x) do { if (!(x)) panic("Assertion failed: " #x, __FILE__, __LINE__); } while (0)

void panic(const char *msg, const char *file, int line);

#endif

