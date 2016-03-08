
ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = subdir-objects

noinst_PROGRAMS = picos

picos_SOURCES = \
    kernel/main.c

if ARCH_ARM
include kernel/arch/arm/Makefile.am
endif

if ARCH_X86
include kernel/arch/x86/Makefile.am
endif
