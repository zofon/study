#include<stdlib.h>
#include<time.h>

int main()
{
	int n;
	srand((unsigned)time(NULL));//抛出种子
	n=rand()%100;
	printf("A random num is %d",n);
	return 0;
}
