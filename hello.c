#include <stdio.h>

void HelloWorld(int c)
{
	int a = 5;
	int b = 9;
	printf(a + b + c);
}

int main(int argc, char* argv[]) {
	HelloWorld(7);
	return 0;
}