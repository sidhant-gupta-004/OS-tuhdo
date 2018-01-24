# Linkers
## Notes

First let us look at compilers like `gcc`. Whenever `gcc` is asked to compile a C source code file called `prog.c`, it has the task of coverting ASCII source code into excutable machine code.

Suppose that the source code for prog.c is as follows:

```C
int add(int *a, int n);

int array[2] = {1, 2};

int main()
{
	int val = add(array, 2);
	return val;
}

int add(int *a, int n)
{
	int i, s=0;
	for (int i=0; i<n; i++)
	{
		s += a[i];
	}
	return s;
}
```

Command executed: `gcc -o prog prog.c`

We reach the final executable in the following steps:

1. It runs the preprocessor (called `cpp` for the *C preprocessor*) which converts the ASCII code into more a "understandable" format for the assembly level compiler of the code. In this process, we get 2 files called `add.i` and `main.i`.
2. This preprocessed code is now compiled into assembly language through the *C compiler* (called `cc1`). In this process, we get 2 file called `main.s` and `add.s`.
3. Next, the assembly program is converted to a binary *relocatable object file* by the *assembler* (called `as`). In this process, we get 2 files called `main.o` and `add.o`.
4. Finally, the `linker` program (called `ld`) is called which combines these 2 object files and *links* them to the necessary system files. We now get a final file called prog.

Please note that steps 1-3 take place separately for each function of a program (here `main` and `add`). Also, if you are interested in seeing these steps take place yourself, just run `gcc` with the `-v` option.

Here, let us take a look at the files `main.o` and `add.o`. These are assembly code files which contain different sections for code and data (like global variables, unintialised variables, etc.). An assembly code file (called object file hereinafter) has these 2 features:

1. The object files have *symbol references*. Each "*symbol*" is associated with a function, or a data variable.
2. The code and data all commence at address 0 - this "raw" file cannot be executed yet, because the program does not have a definite address to start at.

This is where linkers come in.

1. They *resolve* symbol references to **_symbol definition_**. This definition is stored in the object file itself and the "references" point to it.
2. They "relocate" the symbol definitions, that is, assign them definite values within the program. Then, it assigns these addresses to the corresponding symbol references. The relocation is done by following definite rules, generated by the assembler, called *relocation entries*.

TL; DR:
Object files are a raw collection of bytes. A linker links multiple object files together and gives them definite run-time locations in memory.