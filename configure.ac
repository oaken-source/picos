
 #****************************************************************************#
 #       picos                                                                #
 #                                                                            #
 #    Copyright (C) 2014 - 2016  Andreas Grapentin                            #
 #                                                                            #
 #    This program is free software: you can redistribute it and/or modify    #
 #    it under the terms of the GNU General Public License as published by    #
 #    the Free Software Foundation, either version 3 of the License, or       #
 #    (at your option) any later version.                                     #
 #                                                                            #
 #    This program is distributed in the hope that it will be useful,         #
 #    but WITHOUT ANY WARRANTY; without even the implied warranty of          #
 #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           #
 #    GNU General Public License for more details.                            #
 #                                                                            #
 #    You should have received a copy of the GNU General Public License       #
 #    along with this program.  If not, see <http://www.gnu.org/licenses/>.   #
 #****************************************************************************#

AC_PREREQ([2.69])
AC_INIT([picos], [0.1], [andreas@grapentin.org])
AC_CONFIG_SRCDIR([kernel/main.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([scripts])
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([-Wall -Werror foreign])

# add compile flags for freestanding binary
AX_APPEND_FLAG([-nostdlib])
AX_APPEND_FLAG([-ffreestanding])
AX_APPEND_FLAG([-fbuiltin])

# check for toolchain components
AC_PROG_CC
AM_PROG_AS
AM_PROG_AR

# identify target architecture
AC_CANONICAL_HOST

case "$host_cpu" in
  arm)
    arch=arm
    ;;
  aarch64)
    arch=aarch64
    ;;
  i[[34567]]86)
    arch=x86
    ;;
  *)
    AC_MSG_ERROR([unsupported target architecture '$host_cpu'])
    ;;
esac

AC_DEFINE_UNQUOTED([ARCH], ["$arch"], [the cpu type the kernel is built for])
AM_CONDITIONAL([ARCH_ARM], [test x$arch = xarm])
AM_CONDITIONAL([ARCH_X86], [test x$arch = xx86])

# tell gcc that null pointer access is ok
AX_CHECK_COMPILE_FLAG([-fno-delete-null-pointer-checks], [
  AX_APPEND_FLAG([-fno-delete-null-pointer-checks])
])

LT_INIT

AC_CONFIG_FILES([Makefile])

AC_OUTPUT
