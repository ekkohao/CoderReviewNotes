# Python基础文档 #

[TOC]



## 1. Python安装 ##

### 1.0 本文档所使用的编辑环境

Python版本：Python3.6；IDE：Pycharm。

### 1.1 Python Interceptor ###

当我们编写Python代码时，我们得到的是一个包含Python代码的以`.py`为扩展名的文本文件。要运行代码，就需要Python解释器去执行`.py`文件。

最常用的Python解释器就是CPython，从[Python官方网站](https://www.python.org/)下载并安装好Python 3.x后，我们就直接获得了一个官方版本的解释器CPython。除此之外还有IPython、PyPy、Jython和IronPython。

> IPython是基于CPython之上的一个交互式解释器，也就是说，IPython只是在交互方式上有所增强，但是执行Python代码的功能和CPython是完全一样的。
>
> PyPy是另一个Python解释器，它的目标是执行速度。
>
> Jython是运行在Java平台上的Python解释器，可以直接把Python代码编译成Java字节码执行。
>
> IronPython是运行在微软`.Net`平台上的Python解释器，可以直接把Python代码编译成`.Net`的字节码。

### 1.2 在Windows上安装Python ###

从Python的[官方网站](https://www.python.org/)下载`Python3+`对应的64位或32位安装程序，运行`.exe`程序开始安装：

<div style="display: center">

 ![install-py35](./assets/l.png) 

</div>

勾选`Add Python to PATH`,使得cmd可以使用python命令。

## 2. Python基础 ##

### 2.1 变量命名

Python的变量命名规则与C或Java语言都相同，即必须是大小写英文、数字和`_`的组合，且不能用数字开头。

### 2.2 数据类型

| 数据类型 | 表示方法                                                     |
| :------: | :----------------------------------------------------------- |
|   整数   | 同书写整数一样，如`a = 1`、`b = 100`、`c = -100`等 <br />十六进制可以使用`0x`前缀，如 `0xff00`、`0x0009a`等 |
|  浮点数  | 浮点数也可以用书写小数一样，如`a = 1.23`、`b = 3.14`、`c = -9.01`等 <br />或者使用科学记数法，如$1.2*10^5$ 表示时将10使用e替代，写为`1.2e5` |
|  字符串  | 字符串是以单引号`'`或双引号`"`括起来的任意文本<br />单引号中的双引号和双引号中的单引号都被看作普通字符<br />也可以使用转义字符`\`转移引号为普通字符<br />如果有许多字符需要转义，可以使用`r''`或`r""` |
|  布尔值  | Python中布尔值的两个关键字为`True`和`False`<br />布尔值可以使用关系运算符关键字`not`、`and`和`or` |
|   空值   | Python中空值记为`None`                                       |

### 2.3 字符串变量

###### 字符串是不可变类型

字符串变量存储实际字符串存储位置的地址，如`name = 'Jack'`，内存中会有专门的区域存储字面量`'Jack'`，而`name`变量存储了该字面量的地址。Python中的字符串与Java中的`String`很类似，都是不可变类型。当对`name`执行某些会导致字符串更改的方法时，不会改变`'Jack'`的值，而是重新申请新的存储位置并返回新申请的地址。如对`name`变量使用替换方法，`newName = name.replace('J','H')`，执行完成后`name`变量的值仍为`'Jack'`。

###### 字符串拼接

###### python中的多行字符串 

字符串中的换行符可以使用转义字符`\n`表示，为了增加可读性，Python使用3个连续的引号（可以是单引号或双引号，也可以使用`r`加三个引号标记字符串不转义）来识别真实的换行，即被3个连续引号括起来的字符串每次换行都相当于添加`\n`，如

```python
text1 = "aaa\nbbb"
# 等价于
text2 = '''aaa
bbb'''
# 也可以在换行后开头增加`...`来缩进，有且只能是3个点
text3 = '''aaa
...bbb'''
# 上面三个text均等价
```



