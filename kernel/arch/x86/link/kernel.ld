
/******************************************************************************
 *       picos                                                                *
 *                                                                            *
 *    Copyright (C) 2014 - 2016  Andreas Grapentin                            *
 *                                                                            *
 *    This program is free software: you can redistribute it and/or modify    *
 *    it under the terms of the GNU General Public License as published by    *
 *    the Free Software Foundation, either version 3 of the License, or       *
 *    (at your option) any later version.                                     *
 *                                                                            *
 *    This program is distributed in the hope that it will be useful,         *
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 *    GNU General Public License for more details.                            *
 *                                                                            *
 *    You should have received a copy of the GNU General Public License       *
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.   *
 ******************************************************************************/

ENTRY(_start)

SECTIONS
{
    /* load into beginning of high memory */
    . = 0x1000000;

    __start = .;
    __text_start = .;
    .text :
    {
        KEEP(*(.text.multiboot))
        *(.text)
    }
    . = ALIGN(0x1000);
    __text_end = .;

    __rodata_start = .;
    .rodata :
    {
        *(.rodata)
    }
    . = ALIGN(0x1000);
    __rodata_end = .;

    __data_start = .;
    .data :
    {
        *(.data)
    }
    . = ALIGN(0x1000);
    __data_end = .;

    __bss_start = .;
    .bss :
    {
        *(.bss)
        *(.bss.stack)
    }
    . = ALIGN(0x1000);
    __bss_end = .;
    __end = .;
}
