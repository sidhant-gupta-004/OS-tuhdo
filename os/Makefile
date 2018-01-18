BUILD_DIR=../build/os
OS=example.asm

BUILD_SRC := $(wildcard * .asm)
BUILD_OBJ := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BUILD_SRC))
$(BUILD_DIR)/%.o: %.asm
	nasm -f bin $< -o $@

all: build_os

build_os:
	nasm -f bin $(OS) -o $(BUILD_DIR)/example.o
