/* Linker script for STM32F103RB */

MEMORY
{
  FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 128K
  RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 20K
}

ENTRY(Reset_Handler)

SECTIONS
{
  .isr_vector :
  {
    . = ALIGN(4);
    KEEP(*(.isr_vector)) /* Interrupt vectors */
    . = ALIGN(4);
  } >FLASH

  .text :
  {
    . = ALIGN(4);
    *(.text)           /* .text sections (code) */
    *(.text*)          /* .text* sections (code) */
    *(.rodata)         /* .rodata sections (constants, strings, etc.) */
    *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
    . = ALIGN(4);
  } >FLASH

  /* Define __data_load as a constant address */
  .data : AT(LOADADDR(.text) + SIZEOF(.text) + SIZEOF(.isr_vector))
  {
    __data_load = LOADADDR(.data);
    __data_start = .;
    *(.data)         /* .data sections */
    *(.data*)        /* .data* sections */
    . = ALIGN(4);
    __data_end = .;
  } >RAM

  .bss :
  {
    __bss_start = .;
    *(.bss)
    *(.bss*)
    *(COMMON)
    . = ALIGN(4);
    __bss_end = .;
  } >RAM

  ._user_heap_stack :
  {
    . = ALIGN(8);
    PROVIDE(end = .);
    PROVIDE(_end = .);
    __HeapBase = .;
    __heap_base__ = .;
    . = . + _Min_Heap_Size;
    __HeapLimit = .;
    __heap_limit__ = .;
    . = . + _Min_Stack_Size;
    . = ALIGN(8);
    __StackLimit = .;
    __stack_limit__ = .;
    . = . + 4;
    __StackTop = .;
    __stack_top__ = .;
    PROVIDE(_estack = .);
  } >RAM
}

/* Set heap and stack sizes */
_Min_Heap_Size = 0x200;
_Min_Stack_Size = 0x400;
