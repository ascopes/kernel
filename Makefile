OBJECTS := \
	boot.o \
	kmain.o 

LINKER_SCRIPT := link.ld
KERNEL := kernel

AS := nasm
CC := gcc

# Vanity targets.
build: $(KERNEL)

clean:
	$(RM) -f $(OBJECTS)
	$(RM) -f $(KERNEL)

rebuild: clean build

run:
	$(shell command -v qemu-system-i386 qemu-system-x86_64 | head -n 1) -kernel $(KERNEL)

.PHONY: build clean rebuild run

# Actual targets.

$(KERNEL): $(OBJECTS)
	$(LD) -m elf_i386 -T $(LINKER_SCRIPT) -o $@ $^

%.o: %.s
	$(AS) -f elf32 $< -o $@

%.o: %.c
	$(CC) -m32 -Wall -Wextra -Werror -std=c11 -c $< -o $@
