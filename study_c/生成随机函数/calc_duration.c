#include<stdio.h>
#include<time.h>

//#include<stdlib.h>

#define CLOCKS_SPR_SEC ((clock_t)1000)
int main()
{
	int a,b;
	clock_t start,finish;
	start=clock();
	//
	finish=clock();
	double duration=(double)(finish-start)/CLOCKS_SPR_SEC;

	printf("Duration is %lf\n",duration);
	return 0;
}
