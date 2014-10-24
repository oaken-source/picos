
ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = subdir-objects

noinst_PROGRAMS = picos

picos_SOURCES = \
    kernel/boot/start.S \
    kernel/main.c \
    kernel/link/arm-eabi.ld

picos_LDFLAGS = -T kernel/link/arm-eabi.ld
