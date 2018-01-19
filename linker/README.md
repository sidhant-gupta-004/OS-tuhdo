# Linkers
Linkers are programs that "link" an object file and turn it into an executable binary file. To understand this we should first look at how high level code comes to the level of binary machine code.
There are 2 parts of the process.
1. The source file needs to be parsed and the code needs to be syntactically and logically evaluated as being executable.
2. This compiled "object" file needs to be *arranged* such that the executable code, data (like variables), symbol relocation tables, etc. are all neatly stacked up in definite addresses (called virtual memory addresses) so that the machine executing the code knows *exactly* what is where and all misambiguity in the execution process is eliminated.

Right now, the linker script does not work due to inline assembly issues in 2.c program.

The idea I hope you get is that linkers work at a very low level, the lowest in fact (I think), to which software can reach. That's what makes it so damn interesting. :)
