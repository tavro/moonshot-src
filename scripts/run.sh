#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

"$ROOT/scripts/build.sh"

echo "[moonshot] launching qemu"

exec qemu-system-riscv64 -machine virt -nographic -S -s -kernel "$ROOT/moonshot.elf"

