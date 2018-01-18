BUILD_DIR=../build/bootloader

BOOTLOADER_SRC = bootloader_2.asm

BOOTLOADER_OBJ := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRC))
$(BUILD_DIR)/%.o: %.asm
	nasm -f bin $< -o $@

all: bootloader

bootloader:
	nasm -f bin $(BOOTLOADER_SRC) -o $(BUILD_DIR)/bootloader.o

