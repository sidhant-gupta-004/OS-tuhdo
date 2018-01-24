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


