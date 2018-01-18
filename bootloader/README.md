# Bootloader
A bootloader has 2 basic operations: to READ and LOAD an operating system onto the main memory.

This folder provides some basic building blocks for creating your own bootloader. File `bootloader_beginner.asm` shows an example of a very basic bootloader which you may use as a starting point for building your own OS. The bash script `compile_bootloader_beginner.sh` automates most of the repetitive parts of typing commands. Feel free to go through these and get started.

## How does the bootloader load an OS?
Storage devices (like floppy disks) are divided into tracks (0, 1, 2 and so on) which are further divided into sectors. There are 18 sectors per track on a floppy disk. Each sector consists of 512 bytes. A bootloader is loaded on the first sector of track0 of our floppy disk (in this case). The OS is stored from sector1-track0 onwards. So the job of a bootloader, in the most simple terms, is to load the raw "data" from the other sectors of a storage device (not just floppies for that matter), load it onto the main memory and execute it.

That is why, in fact, we sometimes notice multiple boot processes like boot0, boot1, boot2 and so on. It is generally one boot process calling another and then another till the OS can stand on its own.

## Questions
+ How does the bootloader itself start? We know that an OS starts when the bootloader loads it onto main memory. But how does this bootloader itself start in the first place?
+ Making a sector is a very unstable process. The slightest change screws up something and the sector no longer gets created. Moreover, the problem is always solved when I move around the options for the `dd` command while making the sectors. The `dd` command has been used throughout to create these sectors. What could be the possible solutions? And what exactly is the problem?
+ Why is the data being loaded at 0x500 offset when we are storing it in a 0x50 byte buffer?
+ How can we access the address of where the sector is loaded? And why is the memory like msg assigned 0x3 instead of 0x503? (from example.asm)
