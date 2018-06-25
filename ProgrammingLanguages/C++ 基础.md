# C++ 基础 #

## 1. 输入与输出 ##

### 1.1 标准输入输出重定向 ###

```cpp
freopen("input.txt", "r", stdin);
freopen("output.txt", "w", stdout);
```



### 1.2 格式化输入 ###

以下是三个格式化输入函数：

```cpp
#include<cstdio> 

int scanf( const char* format, … ); // 从标准输入输入
int fscanf( std::FILE* stream, const char* format, … ); //从文件输入
int sscanf( const char* buffer, const char* format, … ); //从字符串输入
```

返回值：成功读入变量的个数。

输入结束（并不是 scanf 函数结束）：遇到空白字符，遇到宽度结束，遇到非法输入。

> 有时程序会没有判断输入结束。在Windows下，输入完毕后先按Enter键，再按Ctrl＋Z键，最后再按Enter键，即可结束输入。在Linux下，输入完毕后按Ctrl＋D键即可结束输入。

需要注意的是，scanf 读入 string 需要使用`scanf("%s",s.c_str())`；另外要格外注意的是，scanf 遇到空白字符结束读入，这个空白字符仍保留在输入流当中。

