ENTRY(Reset_Handler)
 
MEMORY
{
    FLASH(rx):ORIGIN =0x08000000,LENGTH =1024k
    SRAM(rwx):ORIGIN =0x20000000,LENGTH =128k
}
SECTIONS
{
    .text :
    {   
        *(.isr_vector)
        *(.text)
        *(.rodata)
        _etext = .; 
    }> FLASH 

    .data :
    {   _sdata = .; /* start of data */
        *(.data)
        _edata = .; /* end of data */
    }> SRAM AT> FLASH 

    .bss :
    {
        _sbss = .; /* start of bss */
        *(.bss)
        _ebss = .; /* end of bss */
    }> SRAM 
}
