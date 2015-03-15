SECTIONS{
    . = 0x00000000;
    .text : {
        *(.text);
        *(.rodata);
        }
    .data ALIGN(4): {
        *(.data);
        }

    .bss ALIGN(4): {
        *(.bss);
        }
    }
