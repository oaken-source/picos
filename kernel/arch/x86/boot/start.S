
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

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

// stack memory
.section .bss.stack, "aw", @nobits

.stack_bottom:
.skip 0x1000
.stack_top:

.section .text

.global _start
.type _start, @function

_start:
  // set up stack
  movl $.stack_top, %esp

  // call kernel main
  call kernel_main

  // halt
  cli
  hlt
.halt:
  jmp .halt

.size _start, . - _start
