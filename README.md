# Entrypoint

This configures the processor state to be ready to jump to a C routine after the bootloader
loads this microkernel.

Inspired by https://github.com/arjun024/mkernel

## Dependencies

Since this needs to be platform agnostic, you will need:

- nasm
- gcc
- ld

To run the OS, you will also need

- [qemu-system-i386](https://wiki.archlinux.org/title/QEMU#Installation)

## Building

Run `make rebuild` to recompile the project.

Run `make run` to start the kernel in qemu.

## Why aren't you using a cross compiler? I hate you and wish a pox on your mailman!

This was easier for a basic hello-world on my machine. Sue me.
