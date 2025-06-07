#!/bin/bash

# Check if a filename argument was provided
if [ -z "$1" ]; then
    echo "❌ 請提供組合語言檔名（不含副檔名），例如： ./build.sh hello"
    exit 1
fi

# Set variables
FILENAME="$1"
ASM_FILE="${FILENAME}.asm"
OBJ_FILE="${FILENAME}.o"
EXE_FILE="${FILENAME}"

# Check if .asm file exists
if [ ! -f "$ASM_FILE" ]; then
    echo "❌ 找不到檔案：$ASM_FILE"
    exit 1
fi

# Assemble
nasm -f elf32 "$ASM_FILE" -o "$OBJ_FILE"
if [ $? -ne 0 ]; then
    echo "❌ 組譯失敗"
    exit 1
fi

# Link
ld -m elf_i386 "$OBJ_FILE" -o "$EXE_FILE"
if [ $? -ne 0 ]; then
    echo "❌ 連結失敗"
    exit 1
fi

echo "✅ 編譯完成：$EXE_FILE"
