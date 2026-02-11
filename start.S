.section .text
.global _start

_start:
        la sp, _stack_top
        call kernel_main

1:  j 1b
