# OS-tuhdo
Learning and implementing a basic operating system. ;)

## Notes
### To Read
#### Part 1
+ Chapter 2: From hardware to software
+ Chapter 3: Example computer model
+ Chapter 5: ELF
+ Chapter 6: GDB, read for kicks.

#### Parts 2 & 3
+ Everything

#### Linking and Loading
We use symbols (like functions in C) to tell a program to execute certain instructions present somewhere else in memory. This is done often in programming. *Symbol resolution* is the process that replaces these symbols (the address of the function usually) with the actual "symbolic definition" of the code we want executed.

## Layout
The layout of this project is categorised as:
+ Section (bootloader, os, etc.)
+ Source code
+ Data writeable to the disk images

Hence, there are currently, the sections present as given above. Hope it is intuitive enough.

## Main Reference
The book OS-tuhdo (https://tuhdo.github.io/os01/) serves as the main learning resource for this project. I would like to really thank the author for putting together such a wonderful resource which allows anyone to learn and build something as complex as an OS from scratch.

## Acknowledgements
The following documents have been referred to and are included as part of this repository for learning purposes:
+ Intel 64 and IA-32 Architectures Software Development Manual
+ System V Application Binary Interface
+ Ralf Brown's Interrupt List: http://www.cs.cmu.edu/~ralf/files.html
+ GNU Make official manual: https://www.gnu.org/software/make/manual/
