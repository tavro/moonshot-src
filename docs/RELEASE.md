# moonshot release notes

this document tracks changes between releases

## versioning scheme

MAJOR.MINOR.PATCH

MAJOR = architecture or ABI break

MINOR = new subsystem or major feature

PATCH = fixes / cleanup / refactors

---

## v0.1.0

first bootable kernel

### features

- RISC-V 64 support
- custom linker script
- assembly bootstrap
- UART driver
- panic system
- assertion macro
- build system
- QEMU boot support

### boot output

expected console output:

```
Hello from knekt
PANIC: Assertion failed: 0 at kernel.c:5
```

host OS tested:

- macOS ARM
- Linux x86_64

### build instructions

```
make clean
make
```

result:

moonshot.elf

### run

```
./scripts/run.sh
```

and attach gdb, connect to remote and run `continue`

