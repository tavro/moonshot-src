ENTRY(_start)

MEMORY
{
        RAM (rwx) : ORIGIN = 0x80200000, LENGTH = 128M
}

SECTIONS
{
        . = ORIGIN(RAM);

        .text : {
                *(.text*)
        } > RAM

        .rodata : {
                *(.rodata*)
        } > RAM

        .data : {
                *(.data*)
        } > RAM

        .bss : {
                *(.bss*)
                *(COMMON)
        } > RAM

        . = ALIGN(16);
        _stack_top = . + 4096;
}

