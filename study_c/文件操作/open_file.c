#include<stdlib.h>

int main()
{
	FILE *fp;
	fp=fopen("test","r");	//"r" 只读	"rb"添加b之后，就是添加二进制文件
				//"w"只写 	"wb"
				//"a"追加	"ra"
				//"rt"读写
				//"wt"读建
	if(fp==NULL)
	{
		printf("打开文件失败，fp返回NULL");
	}
	return 0;
}
