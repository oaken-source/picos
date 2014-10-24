
AC_PREREQ([2.69])
AC_INIT([picos], [0.1], [andreas@grapentin.org])
AC_CONFIG_SRCDIR([kernel/main.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([scripts])
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([-Wall -Werror foreign])

# add compile flags for freestanding binary
AX_APPEND_FLAG([-nostdlib])
AX_APPEND_FLAG([-nostartfiles])
AX_APPEND_FLAG([-ffreestanding])

# check for toolchain components
AC_PROG_CC
AM_PROG_AS

# identify target architecture
AC_CANONICAL_HOST

case "$host_cpu" in
  arm)
    ;;
  i[[34567]]86)
    ;;
  *)
    AC_MSG_ERROR([unsupported target architecture '$host_cpu'])
    ;;
esac

# tell gcc that null pointer access is ok
AX_CHECK_COMPILE_FLAG([-fno-delete-null-pointer-checks], [
  AX_APPEND_FLAG([-fno-delete-null-pointer-checks])
])

AC_CONFIG_FILES([Makefile])

AC_OUTPUT
