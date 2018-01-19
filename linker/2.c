void test() {}

int main()
{
	__asm__(
		".intel_syntax"
		"mov eax, 1;\n"
		"mov ebx, 0;\n"
		"int 0x80;"
	);
}
