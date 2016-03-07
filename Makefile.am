
ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = subdir-objects

noinst_PROGRAMS = picos

picos_SOURCES = \
    kernel/main.c

if ARCH_ARM
picos_SOURCES += \
    kernel/arch/arm/boot/start.S

picos_LDFLAGS = -T kernel/arch/arm/link/kernel.ld
endif

if ARCH_X86
picos_SOURCES += \
    kernel/arch/x86/boot/start.S

picos_LDFLAGS = -T kernel/arch/x86/link/kernel.ld
endif
