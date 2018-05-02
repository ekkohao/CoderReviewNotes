Python基础文档

[TOC]



## 1. Python安装

### 1.0 本文档所使用的编辑环境

Python版本：Python3.6；IDE：Pycharm。

### 1.1 Python Interceptor

当我们编写Python代码时，我们得到的是一个包含Python代码的以`.py`为扩展名的文本文件。要运行代码，就需要Python解释器去执行`.py`文件。

最常用的Python解释器就是CPython，从[Python官方网站](https://www.python.org/)下载并安装好Python 3.x后，我们就直接获得了一个官方版本的解释器CPython。除此之外还有IPython、PyPy、Jython和IronPython。

> IPython是基于CPython之上的一个交互式解释器，也就是说，IPython只是在交互方式上有所增强，但是执行Python代码的功能和CPython是完全一样的。
>
> PyPy是另一个Python解释器，它的目标是执行速度。
>
> Jython是运行在Java平台上的Python解释器，可以直接把Python代码编译成Java字节码执行。
>
> IronPython是运行在微软`.Net`平台上的Python解释器，可以直接把Python代码编译成`.Net`的字节码。

### 1.2 在Windows上安装Python

从Python的[官方网站](https://www.python.org/)下载`Python3+`对应的64位或32位安装程序，运行`.exe`程序开始安装：

<div align=center>

![Python-l](./assets/l.png)

</div>

勾选`Add Python to PATH`,使得cmd可以使用python命令。

## 2. Python基础

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

字符串变量在Python中的内置类为`str`。

###### 字符串是不可变类型

字符串变量存储实际字符串存储位置的地址，如`name = 'Jack'`，内存中会有专门的区域存储字面量`'Jack'`，而`name`变量存储了该字面量的地址。Python中的字符串与Java中的`String`很类似，都是不可变类型。当对`name`执行某些会导致字符串更改的方法时，不会改变`'Jack'`的值，而是重新申请新的存储位置并返回新申请的地址。如对`name`变量使用替换方法，`newName = name.replace('J','H')`，执行完成后`name`变量的值仍为`'Jack'`。

###### 字符串拼接

常用的字符串拼接方法有三种：

```python
a, b, c = "aa", "bb", "cc"

# 第一种 直接拼接
s = a + b + c

# 第二种 join(list)
s = "".join([a, b, c])

# 第三种 字符串格式化
s = "%s%s%s"%(a, b, c)
```

第二种拼接方法在大量字符串拼接时效率较高，第一个第三种适合少量字符串拼接。

###### python中的多行字符串

字符串中的换行符可以使用转义字符`\n`表示，为了增加可读性，Python使用3个连续的引号（可以是单引号或双引号）来识别真实的换行，即被3个连续引号括起来的字符串每次换行都相当于添加`\n`，如：

```python
text1 = "aaa\nbbb"
# 等价于
text2 = '''aaa
bbb'''
# 也可以在换行后开头增加`...`来缩进，3个点以下会被当成普通字符，3个点以上会生成一个点的普通字符
text3 = '''aaa
...bbb'''
# 上面三个text均等价
```

三引号也可以在引号前使用`r`关键字修饰使字符串不转义，也可以在引号后使用`%`来格式化字符串。

### 2.4 list与tuple

###### list（列表）

list是一种有序的集合，可以随时添加、修改和删除其中的元素。Python使用一对中括号`[]`表示一个list，其中元素使用逗号`,`隔开。

比如，列出篮子里的水果，就可以用一个list表示：

```python
fruits = ['Apple', 'Banana', 'Orange']
```

列表常用的操作：

```python
# 索引访问元素
print(fruits[0]) # 'Apple'
print(fruits[-1]) # 'Orange'

# 获取列表长度
print(len(fruits)) # 3
```

###### tuple（元组）

tuple可以看作是不可变的列表，即不能添加、修改和删除其中的元素，即没有`append()`，`insert()`这样的方法。tuple使用一对圆括号`()`来表示，其中元素也使用逗号`,隔开。

根据tuple定义，当你定义一个tuple时，其中的元素就必须被确定下来。tuple示例：

```python
fruits = ('Apple', 'Banana', 'Orange')
t1 = (1, 2)
t2 = () 	# 空tuple
t3 = (1,) 	# 一个元素的tuple，必须加逗号，因为(1)会被解析成1
```

tuple的访问操作和获取长度操作均与list相同。

高级特性一：切片

高级特性二：列表生成式

高级特性三：生成器

高级特性四：迭代器

### 2.5 dict与set

###### dict（字典）

dict是dictionary的简写，相当于其他语言中的map。使用键值对的形式存储元素。dict使用一对大括号`{}`来表示，键和值之间使用冒号`:`隔开，各个键值对之间使用逗号`,`隔开。

如根据学生的名字查找对应的成绩，可以用学生的名字为键，对应分数为值的dict表示：

```python
d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
```

dict的存储和查询：

```python
# 存储
d['Jack'] = 100 # 若'Jack'已存在，会覆盖掉之前的值

# 查询
print(d['Jack']) # 100
print(d['Han']) # 报错，因为不存在键为`Han`的记录
print(d.get('Han')) # None，不存在`Han`的记录get方法返回Node
print(d.get('Han', 99)) # 99, 第二参数指定了缺省值
      
# 可以使用in关键字判断键值是否存在       
print('Jack' in d) # True 
print('Han' in d) # False
```

###### set（集合）

set和dict类似，也是一组key的集合，但不同的是，set不存储value。set没有可以使用的标记符，要创建一个set，需要提供一个list作为初始化参数：

```python
 s = set([1, 1, 2, 2, 3, 3])
```

python中的集合可以使用`&`和`|`来求集合的交集和并集，结果使用新的set表示。

> 四种集合类型分别是list、tuple、dict 和 set ，分别都有对应的同名初始化函数·`list()`、`tuple()`、`dict()` 和 `set()`。

### 2.6 条件判断与循环

###### 条件判断

语法：

```python
# 冒号不能省略
if <condtion>:
    <statements>
elif <condtion>:
    <statements>
else :
    <statements>
```

当`<condition>`的值为数值型是非零值为真，零值为假；当`<condition>`的值为对象时，空值`None`为假，非空对象为真。并且不同类型值也可以使用非（not）且（and）或（or）关键字。

###### 循环语法

```python
# for_in循环，<sequence>必须是一个可迭代对象
# 可以使用isinstance(<sequence>, collections.Iterable)判断是否是可迭代对象
# 可迭代对象有两类：
# 	  一类是集合类型：list、tuple、dict、set、str
#	  另一类是generator：包括普通生成器和带yield的生成函数
for <variable> in <sequence> :
    <statements>
    
# while循环
while <condition>:
    <statements>
```

同其他语言一样，循环中可以使用`break`和`continue`关键字控制循环跳出。

###### 可迭代对象

集合类型的默认迭代对象：str迭代每个字符，list、tuple 和 set 迭代每个元素，dict 迭代每个键值。

下标迭代：可以使用`enumerate()`为每个迭代对象生成`索引-元素`对，比如：

```python
for i, item in enumerate(['a']):
    print(i, item)		# 0 'a'

for i, item in enumerate({'a': 1}.items()):
    print(i, item)		# 0 ('a', 1)    
```

同时引用多个变量的迭代还有每个元素为等大小tuple的list，比如：

```python
for x, y in [(1, 1), (2, 4), (3, 9)]:
	print(x, y)
"""
results：
1 1
2 4
3 9
"""
```



## 2. 函数

### 2.1 内置函数

python的所有内置函数（版本截至到 python 3.6.5）

###### 数值型

* **abs()**  返回数字的绝对值， 参数可以是整数，浮点数，复数
* ​

###### 类型转换型

|  函数   | 描述                                                         |
| :-----: | :----------------------------------------------------------- |
|  abs()  | 返回数字的绝对值， 参数可以是整数，浮点数，复数              |
|  min()  | 返回给定参数的最小值，参数可以为序列或多参数字               |
|  max()  | 返回给定参数的最大值，参数可以为序列或多参数字               |
|  int()  |                                                              |
| float() |                                                              |
|  str()  |                                                              |
| bool()  |                                                              |
| bin()  |  bin() 返回一个整数的二进制表示。                                                            |
|  all()  | 判断给定的可迭代参数中的所有元素不为空串，零值，None或False<br />如果是返回 True，否则返回 False。空集合会返回True。 |
|  any()  | 判断给定的可迭代参数中的任意一个元素不含空串，零值，None或False<br />如果是返回 True，否则返回 False。空集合会返回False。 |
| ascii() | 返回一个表示对象的字符串<br />对于字符串中的 非 ASCII 字符则返回通过 repr() 函数使用 \x, \u 或 \U 编码的字符 |
| bytearray([source[, encoding[, errors]]]) |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |
|         |                                                              |

