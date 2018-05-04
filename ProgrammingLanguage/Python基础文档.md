# Python基础文档

[TOC]

## 前言

本文档主要参考了[廖雪峰的Python教程](https://www.liaoxuefeng.com)

## 1. Python安装

本文档所使用的编辑环境：Python版本：Python3.6；IDE：Pycharm。

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

### 2.3 运算符

###### 算数运算符

以下假设变量a为10，变量b为21：

| 运算符 | 描述                                            | 实例                                    |
| :----: | ----------------------------------------------- | --------------------------------------- |
|   +    | 加 - 两个对象相加                               | a + b 输出结果 31                       |
|   -    | 减 - 得到负数或是一个数减去另一个数             | a - b 输出结果 -11                      |
|   *    | 乘 - 两个数相乘或是返回一个被重复若干次的字符串 | a * b 输出结果 210                      |
|   /    | 除 - x 除以 y                                   | b / a 输出结果 2.1                      |
|   %    | 取模 - 返回除法的余数                           | b % a 输出结果 1                        |
|   **   | 幂 - 返回x的y次幂                               | a**b 为10的21次方                       |
|   //   | 取整除 - 返回商的整数部分                       | 9//2 输出结果 4 , 9.0//2.0 输出结果 4.0 |

###### 比较运算符

以下假设变量a为10，变量b为20：

| 运算符 | 描述                            | 实例                  |
| :----: | ------------------------------- | --------------------- |
|   ==   | 等于 - 比较对象是否相等         | (a == b) 返回 False。 |
|   !=   | 不等于 - 比较两个对象是否不相等 | (a != b) 返回 True。  |
|   >    | 大于 - 返回x是否大于y           | (a > b) 返回 False。  |
|   <    | 小于 - 返回x是否小于y。         | (a < b) 返回 True。   |
|   >=   | 大于等于 - 返回x是否大于等于y。 | (a >= b) 返回 False。 |
|   <=   | 小于等于 - 返回x是否小于等于y。 | (a <= b) 返回 True。  |

###### 赋值运算符

以下假设变量a为10，变量b为20：

| 运算符 | 描述             | 实例                                  |
| :----: | ---------------- | ------------------------------------- |
|   =    | 简单的赋值运算符 | c = a + b 将 a + b 的运算结果赋值为 c |
|   +=   | 加法赋值运算符   | c += a 等效于 c = c + a               |
|   -=   | 减法赋值运算符   | c -= a 等效于 c = c - a               |
|   *=   | 乘法赋值运算符   | c *= a 等效于 c = c * a               |
|   /=   | 除法赋值运算符   | c /= a 等效于 c = c / a               |
|   %=   | 取模赋值运算符   | c %= a 等效于 c = c % a               |
|  **=   | 幂赋值运算符     | c **= a 等效于 c = c ** a             |
|  //=   | 取整除赋值运算符 | c //= a 等效于 c = c // a             |

###### 位运算符

下表中变量 a 为 60（`0b00111100`），b 为 13（`ob00001101`）：

| 运算符 | 描述                                                         | 实例                                                         |
| :----: | ------------------------------------------------------------ | ------------------------------------------------------------ |
|   &    | 按位与运算符：参与运算的两个值,如果两个相应位都为1,则该位的结果为1,否则为0 | (a & b) 输出结果 12 ，二进制解释： 0000 1100                 |
|   \|   | 按位或运算符：只要对应的二个二进位有一个为1时，结果位就为1。 | (a \| b) 输出结果 61 ，二进制解释： 0011 1101                |
|   ^    | 按位异或运算符：当两对应的二进位相异时，结果为1              | (a ^ b) 输出结果 49 ，二进制解释： 0011 0001                 |
|   ~    | 按位取反运算符：对数据的每个二进制位取反,即把1变为0,把0变为1。~x 类似于 -x-1 | (~a ) 输出结果 -61 ，二进制解释： 1100 0011， 在一个有符号二进制数的补码形式。 |
|   <<   | 左移动运算符：运算数的各二进位全部左移若干位，由"<<"右边的数指定移动的位数，高位丢弃，低位补0。 | a << 2 输出结果 240 ，二进制解释： 1111 0000                 |
|   >>   | 右移动运算符：把">>"左边的运算数的各二进位全部右移若干位，">>"右边的数指定移动的位数 | a >> 2 输出结果 15 ，二进制解释： 0000 1111                  |

###### 逻辑运算符

Python语言支持逻辑运算符，以下假设变量 a 为 10, b为 20:

| 运算符 | 逻辑表达式 | 描述                                                         | 实例                    |
| :----: | ---------- | ------------------------------------------------------------ | ----------------------- |
|  and   | x and y    | 布尔"与" - 如果 x 为 False，x and y 返回 False，否则它返回 y 的计算值。 | (a and b) 返回 20。     |
|   or   | x or y     | 布尔"或" - 如果 x 是 True，它返回 x 的值，否则它返回 y 的计算值。 | (a or b) 返回 10。      |
|  not   | not x      | 布尔"非" - 如果 x 为 True，返回 False 。如果 x 为 False，它返回 True。 | not(a and b) 返回 False |

###### 成员运算符

除了以上的一些运算符之外，Python还支持成员运算符，测试实例中包含了一系列的成员，包括字符串，列表或元组。

| 运算符 | 描述                                                    | 实例                                              |
| :----: | ------------------------------------------------------- | ------------------------------------------------- |
|   in   | 如果在指定的序列中找到值返回 True，否则返回 False。     | x 在 y 序列中 , 如果 x 在 y 序列中返回 True。     |
| not in | 如果在指定的序列中没有找到值返回 True，否则返回 False。 | x 不在 y 序列中 , 如果 x 不在 y 序列中返回 True。 |

###### 身份运算符

身份运算符用于比较两个对象的存储单元

| 运算符 | 描述                                        | 实例                                                         |
| :----: | ------------------------------------------- | ------------------------------------------------------------ |
|   is   | is 是判断两个标识符是不是引用自一个对象     | **x is y**, 类似 **id(x) == id(y)** , 如果引用的是同一个对象则返回 True，否则返回 False |
| is not | is not 是判断两个标识符是不是引用自不同对象 | **x is not y** ， 类似 **id(a) != id(b)**。如果引用的不是同一个对象则返回结果 True，否则返回 False。 |

### 2.4 字符串变量

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

### 2.5 list与tuple

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

### 2.6 dict与set

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

### 2.7 条件判断与循环

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

### 2.8 切片

切片操作即按照一定规则取出list、tuple或str的一部分，使用切片操作符（`:`）可以很容易的完成切片操作，如：

```python
# L是一个list
L[:]        # 原样复制一个list
L[:j] 		# 取下标0到j（不含）的元素
L[i:] 		# 取下标i到结尾的元素
L[i:j]		# 取下标i到j（不含）的元素
L[i:j:k]    # 取下标i到j（不含），步长为k的元素
# i, j, k都可以为负值，下标为负值表示从末尾开始相应位置的下标
```

tuple 和 str 的切片操作与list完全相同。

需要注意的是，默认切片操作是返回一个新的对象。当需要生成原对象的切片时，可以使用`memoryview()`生成一个内存查看对象来实现。

同时切片符也可以看作一个对象，可以使用`slice()`来生成一个切片符，如：

```python
SL = slice(0,5,2)
# 则 L[SL] 等价于 L[0:5:2]
```

### 2.9 列表生成式与生成器

内置函数`range()`可以很容易生成一定规则的整数迭代器，利用它可以方便的生成list，如：

```python
list(range(1, 11))	# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

列表生成式可以对每个迭代的元素执行语句，从而生成更复杂的列表。列表生成式使用中括号加`for in`循环生成，如：

```python
pring([x * x for x in range(1, 11)])	# [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

# 可以使用多层循环
pring([m + n for m in 'ABC' for n in '123']) # ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']

# 可以使用多个变量
d = {'x': 'A', 'y': 'B', 'z': 'C' }
pring([k + '=' + v for k, v in d.items()]) # ['y=B', 'x=A', 'z=C']
```

通过列表生成式，我们可以直接创建一个列表。但是，受到内存限制，列表容量肯定是有限的。而且，创建一个包含100万个元素的列表，不仅占用很大的存储空间，如果我们仅仅需要访问前面几个元素，那后面绝大多数元素占用的空间都白白浪费了。

所以，如果列表元素可以按照某种算法推算出来，那我们是否可以在循环的过程中不断推算出后续的元素呢？这样就不必创建完整的list，从而节省大量的空间。在Python中，这种一边循环一边计算的机制，称为生成器：generator。

要创建一个generator，有很多种方法。第一种方法很简单，只要把一个列表生成式的`[]`改成`()`，就创建了一个generator：`g = (x * x for x in range(10))`。

第二种生成方法是 yield 关键字，当一个函数含有此关键字时就不再是一个函数，而是一个generator。这种generator在每次调用`next()`的时候执行，遇到`yield`语句返回，再次执行时从上次返回的`yield`语句处继续执行。如斐波那契数列生成器可以这样生成：

```python
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b, a + b
        n = n + 1
    return 'done'

# 生成
g = fid(10)
```

generator 可以直接使用在 `for in`循环中，也可以每次使用`next(g)`获取下一个元素，没有更多的元素时，抛出`StopIteration`的错误。

要获取 yield generator 的返回值，可以在捕获异常后获取，如：

```python
# 使用上个代码片段的g变量
while True:
    try:
        x = next(g)
        print('g:', x)
	except StopIteration as e:
        print('Generator return value:', e.value)	# done
        break
```

### 2.10 迭代器

我们已经知道，可以直接作用于`for in`循环的数据类型有以下两类：一类是集合数据类型，如`list`、`tuple`、`dict`、`set`、`str`等；一类是`generator`，包括生成器和带`yield`的generator function。这些可以直接作用于`for in`循环的对象统称为可迭代对象：`Iterable`。

而生成器不但可以作用于`for`循环，还可以被`next()`函数不断调用并返回下一个值，直到最后抛出`StopIteration`错误表示无法继续返回下一个值了。可以被`next()`函数调用并不断返回下一个值的对象称为迭代器：`Iterator`。

生成器都是`Iterator`对象，但`list`、`dict`、`str`虽然是`Iterable`，却不是`Iterator`。把`list`、`dict`、`str`等`Iterable`变成`Iterator`可以使用`iter()`函数。

> 你可能会问，为什么`list`、`dict`、`str`等数据类型不是`Iterator`？
>
> 这是因为Python的`Iterator`对象表示的是一个数据流，Iterator对象可以被`next()`函数调用并不断返回下一个数据，直到没有数据时抛出`StopIteration`错误。可以把这个数据流看做是一个有序序列，但我们却不能提前知道序列的长度，只能不断通过`next()`函数实现按需计算下一个数据，所以`Iterator`的计算是惰性的，只有在需要返回下一个数据时它才会计算。
>
> `Iterator`甚至可以表示一个无限大的数据流，例如全体自然数。而使用list是永远不可能存储全体自然数的。

### 2.11 正则表达式

Python提供`re`模块，包含所有正则表达式的功能。由于Python的字符串本身也用`\`转义，所以要特别注意：

```python
s = 'ABC\\-001' # Python的字符串
# 对应的正则表达式字符串变成：
# 'ABC\-001'
```

因此我们强烈建议使用Python的`r`前缀，就不用考虑转义的问题了：

```python
s = r'ABC\-001' # Python的字符串
# 对应的正则表达式字符串不变：
# 'ABC\-001'
```

先看看如何判断正则表达式是否匹配：

```python
>>> import re
>>> re.match(r'^\d{3}\-\d{3,8}$', '010-12345')
<_sre.SRE_Match object; span=(0, 9), match='010-12345'>
>>> re.match(r'^\d{3}\-\d{3,8}$', '010 12345')
>>>
```

`match()`方法判断是否匹配，如果匹配成功，返回一个`Match`对象，否则返回`None`。常见的判断方法就是：

```python
test = '用户输入的字符串'
if re.match(r'正则表达式', test):
    print('ok')
else:
    print('failed')
```

###### 切分字符串

用正则表达式切分字符串比用固定的字符更灵活，请看正常的切分代码：

```python
>>> 'a b   c'.split(' ')
['a', 'b', '', '', 'c']
```

嗯，无法识别连续的空格，用正则表达式试试：

```python
>>> re.split(r'\s+', 'a b   c')
['a', 'b', 'c']
```

无论多少个空格都可以正常分割。加入`,`试试：

```python
>>> re.split(r'[\s\,]+', 'a,b, c  d')
['a', 'b', 'c', 'd']
```

再加入`;`试试：

```python
>>> re.split(r'[\s\,\;]+', 'a,b;; c  d')
['a', 'b', 'c', 'd']
```

如果用户输入了一组标签，下次记得用正则表达式来把不规范的输入转化成正确的数组。

###### 分组

除了简单地判断是否匹配之外，正则表达式还有提取子串的强大功能。用`()`表示的就是要提取的分组（Group）。比如：

`^(\d{3})-(\d{3,8})$`分别定义了两个组，可以直接从匹配的字符串中提取出区号和本地号码：

```python
>>> m = re.match(r'^(\d{3})-(\d{3,8})$', '010-12345')
>>> m
<_sre.SRE_Match object; span=(0, 9), match='010-12345'>
>>> m.group(0)
'010-12345'
>>> m.group(1)
'010'
>>> m.group(2)
'12345'
```

如果正则表达式中定义了组，就可以在`Match`对象上用`group()`方法提取出子串来。

注意到`group(0)`永远是原始字符串，`group(1)`、`group(2)`……表示第1、2、……个子串。

提取子串非常有用。来看一个更凶残的例子：

```python
>>> t = '19:05:30'
>>> m = re.match(r'^(0[0-9]|1[0-9]|2[0-3]|[0-9])\:(0[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|[0-9])\:(0[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|[0-9])$', t)
>>> m.groups()
('19', '05', '30')
```

这个正则表达式可以直接识别合法的时间。但是有些时候，用正则表达式也无法做到完全验证，比如识别日期：

```python
'^(0[1-9]|1[0-2]|[0-9])-(0[1-9]|1[0-9]|2[0-9]|3[0-1]|[0-9])$'
```

对于`'2-30'`，`'4-31'`这样的非法日期，用正则还是识别不了，或者说写出来非常困难，这时就需要程序配合识别了。

###### 贪婪匹配

最后需要特别指出的是，正则匹配默认是贪婪匹配，也就是匹配尽可能多的字符。举例如下，匹配出数字后面的`0`：

```python
>>> re.match(r'^(\d+)(0*)$', '102300').groups()
('102300', '')
```

由于`\d+`采用贪婪匹配，直接把后面的`0`全部匹配了，结果`0*`只能匹配空字符串了。

必须让`\d+`采用非贪婪匹配（也就是尽可能少匹配），才能把后面的`0`匹配出来，加个`?`就可以让`\d+`采用非贪婪匹配：

```python
>>> re.match(r'^(\d+?)(0*)$', '102300').groups()
('1023', '00')
```

###### 预编译正则表达式

当我们在Python中使用正则表达式时，re模块内部会干两件事情：

1. 编译正则表达式，如果正则表达式的字符串本身不合法，会报错；
2. 用编译后的正则表达式去匹配字符串。

如果一个正则表达式要重复使用几千次，出于效率的考虑，我们可以预编译该正则表达式，接下来重复使用时就不需要编译这个步骤了，直接匹配：

```python
>>> import re
# 编译:
>>> re_telephone = re.compile(r'^(\d{3})-(\d{3,8})$')
# 使用：
>>> re_telephone.match('010-12345').groups()
('010', '12345')
>>> re_telephone.match('010-8086').groups()
('010', '8086')
```

编译后生成Regular Expression对象，由于该对象自己包含了正则表达式，所以调用对应的方法时不用给出正则字符串。



## 3. 函数

### 3.1 定义函数

定义一个函数要使用`def`语句，依次写出函数名、括号、括号中的参数和冒号`:`，然后，在缩进块中编写函数体，函数的返回值用`return`语句返回。如：

```python
def add(x,y):
    return x + y
```

函数执行完毕也没有`return`语句时，自动`return None`。

###### pass占位符

如果想定义一个什么事也不做的空函数，可以用`pass`关键字

```python
def nop():
    pass

# 也可以放在其他语句里
if age >= 18:
    pass 	# 缺少pass会有语法错误
```

###### 多值返回

```python
def plot(x, y):
    # do something
    return x, y

a, b = plot(1, 2)
```

实际上返回的还是一个参数，类型为tuple，在语法上，返回一个tuple可以省略括号，所以看上去是返回了多个值。

### 3.2 函数的参数

python有五种参数类型，按照参数定义必须遵循的顺序分别为：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。

###### 必选参数

即调用函数时必须传入的参数，示例：

```python
def say(s):
    print(s)
    
say() 		# 缺少参数s，会报错
say("Hi!")	# 'Hi'
```

###### 默认参数

调用函数时可以不传的参数，不传此参数时使用默认值，示例：

```python
def say(s = "Hello"):
    print(s)
    
say() 		# 'Hello'
say("Hi!")	# 'Hi'
```

需要注意的时，默认参数必须是不可变类型（如整型和字符串），若为可变类型可能会有逻辑错误，如：

```python
def add_end(L=[]):
    L.append('END')
    return L
print(add_end()) # ['END'], 得到期望结果
print(add_end()) # ['END', 'END']，再次执行，发生逻辑错误
print(add_end()) # ['END', 'END', 'END']，再次执行，还是发生逻辑错误
```

默认参数是`[]`，但是函数似乎每次都“记住了”上次添加了`'END'`后的list。

原因解释如下：Python函数在定义的时候，默认参数`L`的值就被计算出来了，即`[]`，因为默认参数`L`也是一个变量，它指向对象`[]`，每次调用该函数，如果改变了`L`的内容，则下次调用时，默认参数的内容就变了，不再是函数定义时的`[]`了。

要修改上面的例子，我们可以用`None`这个不变对象来实现：

```
def add_end(L=None):
    if L is None:
        L = []
    L.append('END')
    return L
```

###### 可变参数

在Python函数中，还可以定义可变参数。顾名思义，可变参数就是传入的参数个数是可变的，可以是1个、2个到任意个，还可以是0个。

在参数前加一个星号即可定义可变参数，这个参数会把传进来相应多个位置的参数自动组装成一个tuple来调用，如：

```python
def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum
    
calc(1, 2, 3) 	# 6
```

如果已经有一个list或者tuple，要调用一个可变参数怎么办？可以在传参时在list或者tuple前使用星号，将list或tuple的元素变成可变参数传进去：

```
nums = [1, 2, 3]
calc(*nums)
```

###### 命名关键字参数

定义一些必须使用关键字传入的参数，使用星号与必选参数分开，若有可变参数，则不用使用星号，如

```python
def person(name, age, *, city, job):
    pass

def person(name, age, *others, city, job):
    pass

# 也可以有默认值
def person(name, age, *others, city = 'Beijing', job):
    pass
```

命名关键字参数在传入时必须使用关键字传入，雨哦一顺序可以改变。

###### 关键字参数

可变参数允许你传入0个或任意个参数，这些可变参数在函数调用时自动组装为一个tuple。而关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict。参数前使用双星号标识关键字参数。示例：

```python
def person(name, **kw):
    print('name:', name, 'other:', kw)
    
person('Jack', age = 30, city = 'Beijing')		# name: Jack other: {'age': 30, 'city': 'Beijing'}
```

同时使用五种参数的函数的基本形式如下：

```python
def fun(a, b = 1, *others, c, d = 0, **kw)
```

基于上面的形式，python 中所有的函数都可以用`funtion(*arg, **kw)`的形式来调用。

### 3.3 内置函数

python的所有内置函数（版本截至到 python 3.6.5）

###### 数值和字符相关

- **abs(x)**  返回数字的绝对值， 参数x可以是整数，浮点数，复数
- **round(x[, n = 0])**  方法返回浮点数x的四舍五入值，实际使用受计算机精度影响。参数 n 为四舍五入小数点位数。
- **min/max(a, b, c, ...)**  返回给定参数的最小/大值，参数也可以是集合类型
- **bin(x)**  用于将整数转换成2进制，以字符串形式表示（以`0b`开头）。
- **oct(x)**  用于将整数转换成8进制，以字符串形式表示（以`0`开头）。
- **hex(x)**  用于将整数转换成16进制，以字符串形式表示（以`0x`开头）。
- **complex([real[, imag]])**  返回一个复数，第一个参数为实部，第二个参数为虚部；若第一个参数为字符串，则不需要第二个参数。eg：复数`2 + 3i`可以表示为`complex(2, 3)`或`complex('2+3j')`。
- **divmod(a, b)**  返回一个包含`a/b`的商和余数的tuple：`(a // b, a % b)`
- **pow(x, y[, z])**   方法返回 x 的 y 次方的值。如果 z 在存在，则再对结果进行取模，其结果等效于`pow(x, y)  % z`。
- **chr(x)**  返回一个整数（ASCII 数值或 Unicode 数值）对应的字符，只能返回一个字符。
- **ord(x)**  返回一个字符对应的整数（ASCII 数值或 Unicode 数值）。
- format

###### 类型转换

- **int(x)**  用于将数字和字符串转换成整数。
- **float(x)**  用于将整数和字符串转换成浮点数。
- **bool([x])**  用于将给定参数转换为布尔类型，如果没有参数，返回 False。
- **str(x)** 参见[str([object])](#str_object)

###### 字节数组

* **bytearray/bytes([source[, encoding[, errors]]])**  返回一个新的<u>可变/不可变</u>字节数组，可变字节数组类型标识为`bytearray(b'')`，不可变字节数组类型标识为`b''`。每个元素的值都在`[0, 255]`中。source可以有多种类型：
  - 当source为空，即没有传入任何参数时，返回初始长度为0的初始化字节数组。
  - 当source为整数时，返回指定长度的初始化字节数组。
  - 当source为字符串时，必须传入encoding，返回将字符串按照指定编码转换后的字节数组。
  - 当source为可迭代类型，则每个元素必须为`[0, 255]`中的整数。
  - 当source为与buffer接口一致的对象，则此对象也可以被用于初始化字节数组。

###### 可迭代型

* **list/tuple/set(seq)**  用于创建一个list/tuple/set，参数为空则创建长度为0的list/tuple/set，否则根据这个集合类型的参数初始化一个新的list/tuple/set。
* **dict([[mapping|iterable], [\*\*kwarg]]) **  用于创建一个dict。下面以不同方式创建`{'a' : 1, 'b' : 2}`：

  * 参数为关键字参数时，`dict(a = 1, b = 2)`
  * 参数含mapping时，`dict(zip(['a', 'b'], [1, 2]))`
  * 参数含iterable时，`dict([('a', 1), ('b', 2)])`
* **frozenset([iterable])**  返回一个冻结的集合，冻结后集合不能再添加或删除任何元素。
* **range([start = 0, ]stop[, step = 1])**  返回的是一个序列的可迭代对象，序列从 start 开始，到 stop 结束（不含 stop ），步长为 step 。
* **slice([start = 0, ]stop[, step = 1])** 返回一个切片对象，主要用在切片操作函数里的参数传递。如：`[1, 2, 3][slice(1)]`等价于`[1, 2, 3][:1]`
* **sorted(iterable, key = None, reverse  =False)**  返回的是一个指定排序的新的 list。 



* **filter(function, iterable)**  返回过滤后的新序列，序列的每个元素作为参数传递给函数进行判断，最后将返回`True`的元素放到新列表中。

* **enumerate(iterable, [start=0])**  用于将一个可遍历的数据对象(如列表、元组或字符串)组合为一个索引序列，同时列出数据下标和数据。

* **iter(object[, sentinel])**  用来生成迭代器。当只传第一个参数时则必须是一个可迭代对象；当传入第二个参数时，则参数 object 必须是一个可调用的对象（如，函数），此时，iter 创建了一个迭代器对象，每次调用这个迭代器对象的`__next__()`方法时，都会调用 object。

* **len(s)**  返回对象（字符、列表、元组等）长度或项目个数。

* **map(function, iterable, ...)**  根据提供的函数对指定序列做映射。第一个参数 function 以参数序列中的每一个元素调用 function 函数，有几个可迭代序列，function 就要有几个参数，返回包含每次 function 函数返回值的新迭代器。

* **reduce(function, iterable)**  根据提供的函数对指定序列做reduce计算。function 为接收两个参数的函数，每次调用都会把前面的计算结果作为第一个参数，下一个迭代元素作为第二个参数，如`reduce(f, [x1, x2, x3, x4])`等价于`f(f(f(x1, x2), x3), x4)`。

* **sum(iterable[, start = 0])**  方法对序列进行求和计算，`sum(iterable)`等价于`reduce(add, iterable)`。

* **all(iterable)**  判断给定的可迭代参数中的所有元素不为空串，零值，None 或 False，如果是返回 True，否则返回 False。空集合会返回 True。

* **any(iterable)**   判断给定的可迭代参数中的任意一个元素不为空串，零值，None 或 False，如果是返回 True，否则返回 False。空集合会返回 False。

* **reversed(iterable)**  返回一个反转的迭代器。

* **zip(iterable,...)**   函数用于将可迭代的对象作为参数，将对象中对应的元素打包成一个个元组，然后返回由这些元组组成的列表。如果各个迭代器的元素个数不一致，则返回列表长度与最短的对象相同。

* **memoryview(object)**  返回给定参数的内存查看对象(Memory view)。所谓内存查看对象，是指对支持缓冲区协议的数据进行包装，在不需要复制对象基础上允许Python代码访问。如：

  ```python
  str = 'abc'
  s1 = str[:1] # 产生新的对象
  strMV = memoryview(str)
  s2 = str[:2] # 不产生新的对象
  ```

* **next(iterable[, default])**  返回迭代器的下一个项目，第二参数为当不存在下一个元素时的返回值，若不使用默认值参数，则没有下一个元素则会触发 StopIteration 异常。

###### 输入与输出

* **input([prompt])**  接受一个标准输入数据，返回为`string`类型。参数`prompt`为一个字符串表示输入的提示信息。
* **print(\*objects, sep=' ', end='\n', file=sys.stdout)** 方法用于打印输出，最常见的一个函数。参数说明：
  * objects -- 复数，表示可以一次输出多个对象。输出多个对象时，需要用 , 分隔。
  * sep -- 用来间隔多个对象，默认值是一个空格。
  * end -- 用来设定以什么结尾。默认值是换行符 \n，我们可以换成其他字符串。
  * file -- 要写入的文件对象。
* **open(name[, mode[, buffering]])** 函数用于打开一个文件，创建一个 file 对象。///TODO  详见文件

###### 类相关

* classmethod
* staticmethod
* **super(type = CurrentClass , object-or-type = self)**  用于调用指定父类(超类)的一个方法。
* **property()**  函数的作用是在新式类中返回属性值
* setattr/delattr/getattr/hasattr
* **hash(object)**  用于获取取一个对象（字符串或者数值等）的哈希值
* **id([object])** 函数用于获取对象的内存地址。
* **isinstance(object, classinfo)**  函数来判断一个对象是否是一个已知的类型，考虑继承关系。`classinfo`可以是直接或间接类名、基本类型或者由它们组成的元组。
* **issubclass(class, classinfo)** 方法用于判断一个类是否是类型参数`classinfo`的子类或本身。
* **type(object)**  返回对象的类型。

###### 通用工具型

- **ascii(object)**  返回一个表示对象的字符串，对于字符串中的 非 ASCII 字符则返回通过 `repr() `函数使用 `\x`、` \u` 或 `\U` 编码的字符。
- <a name="str_object"></a>**str([object])**  返回一个对象的 string 格式，无参则返回空字符串。
- **repr(object)**  返回一个对象的 string 格式，可以供解释器读取。
- **callable(object)**  返回一个布尔值，`True`表示对象可调用，`False`表示对象不可调用。对于函数、方法、lambda函数式、类，以及实现了`__call__`方法的类实例对象，都返回`True`。
- compile
- **dir([object])**  返回一个类型列表。当参数为空时，返回当前范围内的变量、方法和定义的类型列表；带参数时，返回参数的属性、方法列表。如果参数包含方法`__dir__()`，该方法将被调用。如果参数不包含`__dir__()`，该方法将最大限度地收集参数信息。
- **globals()**  函数会以字典类型返回当前位置的全部全局变量
- **locals()**  以字典类型返回当前位置的全部局部变量。
- **vars([object])**返回对象object的属性和属性值的字典对象，如果没有参数，就打印当前调用位置的属性和属性值。
- **eval(expression[, globals[, locals]])**  用来执行一个字符串表达式，并返回表达式的值。
- **exec(expression[, globals[, locals]])**  执行储存在字符串或文件中的 Python 语句，相比于 eval，exec可以执行更复杂的 Python 代码，永远返回`None`。
- **help([object])**  函数用于查看函数或模块用途的详细说明。


### 3.4 函数式编程

函数式编程就是一种抽象程度很高的编程范式，纯粹的函数式编程语言编写的函数没有变量，因此，任意一个函数，只要输入是确定的，输出就是确定的，这种纯函数我们称之为没有副作用。而允许使用变量的程序设计语言，由于函数内部的变量状态不确定，同样的输入，可能得到不同的输出，因此，这种函数是有副作用的。

函数式编程的一个特点就是，允许把函数本身作为参数传入另一个函数，还允许返回一个函数！

Python对函数式编程提供部分支持。由于Python允许使用变量，因此，Python不是纯函数式编程语言。

###### 高阶函数

把函数作为参数传入，这样的函数称为高阶函数，函数式编程就是指这种高度抽象的编程范式。

Python内建的高阶函数有`map/reduce`、`filter`和`sorted`。

`map`接收两个参数，一个是函数，一个是`Iterable`，`map`将传入的函数依次作用到序列的每个元素，并把结果作为新的`Iterator`返回。

`reduce`也接收两个参数，同样一个是函数（必须接收两个参数），一个是`Iterable`，将传入的函数依次作用到序列的每个元素（将上一个序列函数执行的结果作为第一个参数，当前序列作为第二参数），`reduce`把结果继续和序列的下一个元素做累积计算，其效果就是：`reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)`。

和`map/reduce`类似，`filter`也接收一个函数和一个`Iterable`，返回的是一个`Iterator`。和`map`不同的是，`filter()`把传入的函数依次作用于每个元素，然后根据返回值是`True`还是`False`决定保留还是丢弃该元素。

`sorted`函数也是一个高阶函数，第一个参数为一个I`terable`为必传参数，第二个参数是可选参数`key`，可以接收一个函数来实现自定义的排序，第三个参数为一个可选布尔参数，为真表示降序，默认为假表示升序。返回值为一个新的列表。

###### 匿名函数

关键字`lambda`表示匿名函数，冒号前面的`x`表示函数参数。如：`lambda x: x * x`。

Python 的匿名函数有个限制，就是只能有一个表达式，不用写`return`，返回值就是该表达式的结果。

### 3.5 装饰器

借助函数式编程 Python 很容易实现装饰器的功能。

由于函数也是一个对象，而且函数对象可以被赋值给变量，所以，通过变量也能调用该函数。

```python
>>> def now():
...     print('2015-3-25')
...
>>> f = now
>>> f()
2015-3-25
```

函数对象有一个`__name__`属性，可以拿到函数的名字：

```python
>>> now.__name__
'now'
>>> f.__name__
'now'
```

现在，假设我们要增强`now()`函数的功能，比如，在函数调用前后自动打印日志，但又不希望修改`now()`函数的定义，这种在代码运行期间动态增加功能的方式，称之为“装饰器”（Decorator）。

本质上，decorator就是一个返回函数的高阶函数。所以，我们要定义一个能打印日志的decorator，可以定义如下：

```python
def log(func):
    def wrapper(*args, **kw):
        print('call %s():' % func.__name__)
        return func(*args, **kw)
    return wrapper
```

观察上面的`log`，因为它是一个decorator，所以接受一个函数作为参数，并返回一个函数。我们要借助Python的@语法，把decorator置于函数的定义处：

```python
@log
def now():
    print('2015-3-25')
```

调用`now()`函数，不仅会运行`now()`函数本身，还会在运行`now()`函数前打印一行日志：

```python
>>> now()
call now():
2015-3-25
```

把`@log`放到`now()`函数的定义处，相当于执行了语句：

```python
now = log(now)
```

由于`log()`是一个decorator，返回一个函数，所以，原来的`now()`函数仍然存在，只是现在同名的`now`变量指向了新的函数，于是调用`now()`将执行新函数，即在`log()`函数中返回的`wrapper()`函数。

`wrapper()`函数的参数定义是`(*args, **kw)`，因此，`wrapper()`函数可以接受任意参数的调用。在`wrapper()`函数内，首先打印日志，再紧接着调用原始函数。

如果decorator本身需要传入参数，那就需要编写一个返回decorator的高阶函数，写出来会更复杂。比如，要自定义log的文本：

```python
def log(text):
    def decorator(func):
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator
```

这个3层嵌套的decorator用法如下：

```python
@log('execute')
def now():
    print('2015-3-25')
```

执行结果如下：

```python
>>> now()
execute now():
2015-3-25
```

和两层嵌套的decorator相比，3层嵌套的效果是这样的：

```python
>>> now = log('execute')(now)
```

我们来剖析上面的语句，首先执行`log('execute')`，返回的是`decorator`函数，再调用返回的函数，参数是`now`函数，返回值最终是`wrapper`函数。

以上两种decorator的定义都没有问题，但还差最后一步。因为我们讲了函数也是对象，它有`__name__`等属性，但你去看经过decorator装饰之后的函数，它们的`__name__`已经从原来的`'now'`变成了`'wrapper'`：

```python
>>> now.__name__
'wrapper'
```

因为返回的那个`wrapper()`函数名字就是`'wrapper'`，所以，需要把原始函数的`__name__`等属性复制到`wrapper()`函数中，否则，有些依赖函数签名的代码执行就会出错。

不需要编写`wrapper.__name__ = func.__name__`这样的代码，Python内置的`functools.wraps`就是干这个事的，所以，一个完整的decorator的写法如下：

```python
import functools

def log(func):
    @functools.wraps(func)
    def wrapper(*args, **kw):
        print('call %s():' % func.__name__)
        return func(*args, **kw)
    return wrapper
```

或者针对带参数的decorator：

```python
import functools

def log(text):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kw):
            print('%s %s():' % (text, func.__name__))
            return func(*args, **kw)
        return wrapper
    return decorator
```

### 3.6 偏函数

Python的`functools`模块提供了很多有用的功能，其中一个就是偏函数（Partial function）。要注意，这里的偏函数和数学意义上的偏函数不一样。

在介绍函数参数的时候，我们讲到，通过设定参数的默认值，可以降低函数调用的难度。而偏函数也可以做到这一点。举例如下：

`int()`函数可以把字符串转换为整数，当仅传入字符串时，`int()`函数默认按十进制转换：

```python
>>> int('12345')
12345
```

但`int()`函数还提供额外的`base`参数，默认值为`10`。如果传入`base`参数，就可以做N进制的转换：

```python
>>> int('12345', base=8)
5349
>>> int('12345', 16)
74565
```

假设要转换大量的二进制字符串，每次都传入`int(x, base=2)`非常麻烦，于是，我们想到，可以定义一个`int2()`的函数，默认把`base=2`传进去：

```python
def int2(x, base=2):
    return int(x, base)
```

这样，我们转换二进制就非常方便了：

```python
>>> int2('1000000')
64
>>> int2('1010101')
85
```

`functools.partial`就是帮助我们创建一个偏函数的，不需要我们自己定义`int2()`，可以直接使用下面的代码创建一个新的函数`int2`：

```python
>>> import functools
>>> int2 = functools.partial(int, base=2)
>>> int2('1000000')
64
>>> int2('1010101')
85
```

所以，简单总结`functools.partial`的作用就是，把一个函数的某些参数给固定住（也就是设置默认值），返回一个新的函数，调用这个新函数会更简单。

注意到上面的新的`int2`函数，仅仅是把`base`参数重新设定默认值为`2`，但也可以在函数调用时传入其他值：

```python
>>> int2('1000000', base=10)
1000000
```

最后，创建偏函数时，实际上可以接收函数对象、`*args`和`**kw`这3个参数

```python
int2('10010')
```

相当于：

```python
kw = { 'base': 2 }
int('10010', **kw)
```

## 4. 模块

在计算机程序的开发过程中，随着程序代码越写越多，在一个文件里代码就会越来越长，越来越不容易维护。

为了编写可维护的代码，我们把很多函数分组，分别放到不同的文件里，这样，每个文件包含的代码就相对较少，很多编程语言都采用这种组织代码的方式。在Python中，一个`.py`文件就称之为一个模块（Module）。

你也许还想到，如果不同的人编写的模块名相同怎么办？为了避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包（Package）。

举个例子，一个`abc.py`的文件就是一个名字叫`abc`的模块，一个`xyz.py`的文件就是一个名字叫`xyz`的模块。

现在，假设我们的`abc`和`xyz`这两个模块名字与其他模块冲突了，于是我们可以通过包来组织模块，避免冲突。方法是选择一个顶层包名，比如`mycompany`，按照如下目录存放：

```
mycompany
├─ __init__.py
├─ abc.py
└─ xyz.py
```

引入了包以后，只要顶层的包名不与别人冲突，那所有模块都不会与别人冲突。现在，`abc.py`模块的名字就变成了`mycompany.abc`，类似的，`xyz.py`的模块名变成了`mycompany.xyz`。

请注意，每一个包目录下面都会有一个`__init__.py`的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是一个包。`__init__.py`可以是空文件，也可以有Python代码，因为`__init__.py`本身就是一个模块，而它的模块名就是`mycompany`。

### 4.1 使用模块

python中导入模块的两种方式：

```python
# 第一种
import sys
# 第二种
from sys import *
```

使用第一种导入方法在使用导入的函数时必须要加上模块名，而第二种则不用。

我们以内建的`sys`模块为例，编写一个`hello`的模块：

```python
#!/usr/bin/env python3		# 这个注释可以让这个文件直接在Unix/Linux/Mac上运行
# -*- coding: utf-8 -*-

' a test module '     		# 这是一个字符串，表示模块的文档注释，任何模块代码的第一个字符串都被视
							# 为模块的文档注释；
    
__author__ = 'Michael Liao'	# 使用__author__变量把作者写进去

import sys

def test():
    args = sys.argv
    if len(args)==1:
        print('Hello, world!')
    elif len(args)==2:
        print('Hello, %s!' % args[1])
    else:
        print('Too many arguments!')

if __name__=='__main__': 	# 当我们在命令行运行该模块文件时，Python解释器把一个特殊变量__name__置
    test()					# 为__main__，而如果在其他地方导入该模块时，if判断将失败
```

###### 作用域

在一个模块中，我们可能会定义很多函数和变量，但有的函数和变量我们希望给别人使用，有的函数和变量我们希望仅仅在模块内部使用。在Python中，是通过`_`前缀来实现的。

正常的函数和变量名是公开的（public），可以被直接引用，比如：`abc`，`x123`，`PI`等；

类似`__xxx__`这样的变量是特殊变量，可以被直接引用，但是有特殊用途，比如上面的`__author__`，`__name__`就是特殊变量，模块定义的文档注释也可以用特殊变量`__doc__`访问，我们自己的变量一般不要用这种变量名；

类似`_xxx`和`__xxx`这样的函数或变量就是非公开的（private），不应该被直接引用，比如`_abc`，`__abc`等；

之所以我们说，private函数和变量“不应该”被直接引用，而不是“不能”被直接引用，是因为Python并没有一种方法可以完全限制访问模块的private函数或变量，但是，从编程习惯上不应该引用private函数或变量。

### 4.2 安装第三方模块

在Python中，安装第三方模块，是通过包管理工具pip完成的。

如果你正在使用Mac或Linux，安装pip本身这个步骤就可以跳过了。

如果你正在使用Windows，请参考[安装Python](https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/0014316090478912dab2a3a9e8f4ed49d28854b292f85bb000)一节的内容，确保安装时勾选了`pip`和`Add python.exe to Path`。

在命令提示符窗口下尝试运行`pip`，如果Windows提示未找到命令，可以重新运行安装程序添加`pip`。

注意：Mac或Linux上有可能并存Python 3.x和Python 2.x，因此对应的pip命令是`pip3`。

例如，我们要安装一个第三方库——Python Imaging Library，这是Python下非常强大的处理图像的工具库。不过，PIL目前只支持到Python 2.7，并且有年头没有更新了，因此，基于PIL的Pillow项目开发非常活跃，并且支持最新的Python 3。

一般来说，第三方库都会在Python官方的[pypi.python.org](https://pypi.python.org/)网站注册，要安装一个第三方库，必须先知道该库的名称，可以在官网或者pypi上搜索，比如Pillow的名称叫[Pillow](https://pypi.python.org/pypi/Pillow/)，因此，安装Pillow的命令就是：

```
pip install Pillow
```

耐心等待下载并安装后，就可以使用Pillow了。

![且慢](./assets/l-1525398716149.png)

###### 安装常用模块

在使用Python时，我们经常需要用到很多第三方库，例如，上面提到的Pillow，以及MySQL驱动程序，Web框架Flask，科学计算Numpy等。用pip一个一个安装费时费力，还需要考虑兼容性。我们推荐直接使用[Anaconda](https://www.anaconda.com/)，这是一个基于Python的数据处理和科学计算平台，它已经内置了许多非常有用的第三方库，我们装上Anaconda，就相当于把数十个第三方模块自动安装好了，非常简单易用。

可以从[Anaconda官网](https://www.anaconda.com/download/)下载GUI安装包，安装包有500~600M，所以需要耐心等待下载。网速慢的同学请移步[国内镜像](https://pan.baidu.com/s/1kU5OCOB#list/path=%2Fpub%2Fpython)。下载后直接安装，Anaconda会把系统Path中的python指向自己自带的Python，并且，Anaconda安装的第三方模块会安装在Anaconda自己的路径下，不影响系统已安装的Python目录。

安装好Anaconda后，重新打开命令行窗口，输入python，可以看到Anaconda的信息：

```
┌────────────────────────────────────────────────────────┐
│Command Prompt - python                           - □ x │
├────────────────────────────────────────────────────────┤
│Microsoft Windows [Version 10.0.0]                      │
│(c) 2015 Microsoft Corporation. All rights reserved.    │
│                                                        │
│C:\> python                                             │
│Python 3.6.3 |Anaconda, Inc.| ... on win32              │
│Type "help", ... for more information.                  │
│>>> import numpy                                        │
│>>> _                                                   │
│                                                        │
│                                                        │
│                                                        │
└────────────────────────────────────────────────────────┘
```

可以尝试直接`import numpy`等已安装的第三方模块。



## 5. 类和对象

### 5.1 类的定义

以Student类为例，在Python中，定义类是通过`class`关键字：

```python
class Student(object):
    pass
```

`class`后面紧接着是类名，即`Student`，类名通常是大写开头的单词，紧接着是`(object)`，表示该类是从哪个类继承下来的，默认所有的类都是从 object 继承的。

定义好了`Student`类，就可以根据`Student`类创建出`Student`的实例：`bart = Student()`。

###### 构造方法与析构方法

```python
# 构造方法
def __init__(self, name, score):
    self.name = name
    self.score = score

# 析构方法
def __del__(self):
	pass
```

`__init__`方法的第一个参数永远是`self`，有了`__init__`方法，在创建实例的时候，就不能传入空的参数了，必须传入与`__init__`方法匹配的参数，但`self`不需要传，Python解释器自己会把实例变量传进去。

###### 实例属性和类属性

由于Python是动态语言，根据类创建的实例可以任意绑定属性。

给实例绑定属性的方法是通过实例变量，或者通过`self`变量：

```python
class Student(object):
    def __init__(self, name):
        self.name = name

s = Student('Bob')
s.score = 90
```

但是，如果`Student`类本身需要绑定一个属性呢？可以直接在class中定义属性，这种属性是类属性，归`Student`类所有：

```python
class Student(object):
    name = 'Student'	# 所以类实例共享这一个变量，类似于Java的静态变量
```

当我们定义了一个类属性后，这个属性虽然归类所有，但类的所有实例都可以访问到。来测试一下：

```python
>>> class Student(object):
...     name = 'Student'
...
>>> s = Student() # 创建实例s
>>> print(s.name) # 打印name属性，因为实例并没有name属性，所以会继续查找class的name属性
Student
>>> print(Student.name) # 打印类的name属性
Student
>>> s.name = 'Michael' # 给实例绑定name属性
>>> print(s.name) # 由于实例属性优先级比类属性高，因此，它会屏蔽掉类的name属性
Michael
>>> print(Student.name) # 但是类属性并未消失，用Student.name仍然可以访问
Student
>>> del s.name # 如果删除实例的name属性
>>> print(s.name) # 再次调用s.name，由于实例的name属性没有找到，类的name属性就显示出来了
Student
```

从上面的例子可以看出，在编写程序的时候，千万不要对实例属性和类属性使用相同的名字，因为相同名称的实例属性将屏蔽掉类属性，但是当你删除实例属性后，再使用相同的名称，访问到的将是类属性。

###### 访问限制

如果要让内部属性或方法不被外部访问，可以把属性的名称前加上两个下划线`__`，在Python中，实例的变量名如果以`__`开头，就变成了一个私有变量（private），只有内部可以访问，外部不能访问。

有些时候，你会看到以一个下划线开头的实例变量名，比如`_name`，这样的实例变量外部是可以访问的，但是，按照约定俗成的规定，当你看到这样的变量时，意思就是，“虽然我可以被访问，但是，请把我视为私有变量，不要随意访问”。

双下划线开头的实例变量是不是一定不能从外部访问呢？其实也不是。不能直接访问`__name`是因为Python解释器对外把`__name`变量改成了`_Student__name`，所以，仍然可以通过`_Student__name`来访问`__name`变量。

###### 多重继承

Python支持类的多继承，通过逗号分割多个继承类，如 C 继承 A 和 B ：`class C(A, B)`。

###### 动态语言的“鸭子类型”

对于静态语言（例如Java）来说，如果需要传入`Animal`类型，则传入的对象必须是`Animal`类型或者它的子类，否则，将无法调用`Animal`的`run()`方法。

对于Python这样的动态语言来说，则不一定需要传入`Animal`类型。我们只需要保证传入的对象有一个`run()`方法就可以了：

```
class Timer(object):
    def run(self):
        print('Start...')
```

这就是动态语言的“鸭子类型”，它并不要求严格的继承体系，一个对象只要“看起来像鸭子，走起路来像鸭子”，那它就可以被看做是鸭子。

Python的“file-like object“就是一种鸭子类型。对真正的文件对象，它有一个`read()`方法，返回其内容。但是，许多对象，只要有`read()`方法，都被视为“file-like object“。许多函数接收的参数就是“file-like object“，你不一定要传入真正的文件对象，完全可以传入任何实现了`read()`方法的对象。

### 5.2 属性装饰器@Property

在绑定属性时，如果我们直接把属性暴露出去，虽然写起来很简单，但是，没办法检查参数，导致可以把成绩随便改：

```python
s = Student()
s.score = 9999
```

这显然不合逻辑。为了限制score的范围，可以通过一个`set_score()`方法来设置成绩，再通过一个`get_score()`来获取成绩，这样，在`set_score()`方法里，就可以检查参数：

```python
class Student(object):

    def get_score(self):
         return self._score

    def set_score(self, value):
        if not isinstance(value, int):
            raise ValueError('score must be an integer!')
        if value < 0 or value > 100:
            raise ValueError('score must between 0 ~ 100!')
        self._score = value
```

现在，对任意的Student实例进行操作，就不能随心所欲地设置score了：

```python
>>> s = Student()
>>> s.set_score(60) # ok!
>>> s.get_score()
60
>>> s.set_score(9999)
Traceback (most recent call last):
  ...
ValueError: score must between 0 ~ 100!
```

但是，上面的调用方法又略显复杂，没有直接用属性这么直接简单。

有没有既能检查参数，又可以用类似属性这样简单的方式来访问类的变量呢？对于追求完美的Python程序员来说，这是必须要做到的！

还记得装饰器（decorator）可以给函数动态加上功能吗？对于类的方法，装饰器一样起作用。Python内置的`@property`装饰器就是负责把一个方法变成属性调用的：

```python
class Student(object):

    @property
    def score(self):
        return self._score

    @score.setter
    def score(self, value):
        if not isinstance(value, int):
            raise ValueError('score must be an integer!')
        if value < 0 or value > 100:
            raise ValueError('score must between 0 ~ 100!')
        self._score = value
```

`@property`的实现比较复杂，我们先考察如何使用。把一个getter方法变成属性，只需要加上`@property`就可以了，此时，`@property`本身又创建了另一个装饰器`@score.setter`，负责把一个setter方法变成属性赋值，于是，我们就拥有一个可控的属性操作：

```python
>>> s = Student()
>>> s.score = 60 # OK，实际转化为s.set_score(60)
>>> s.score # OK，实际转化为s.get_score()
60
>>> s.score = 9999
Traceback (most recent call last):
  ...
ValueError: score must between 0 ~ 100!
```

注意到这个神奇的`@property`，我们在对实例属性操作的时候，就知道该属性很可能不是直接暴露的，而是通过getter和setter方法来实现的。

还可以定义只读属性，只定义getter方法，不定义setter方法就是一个只读属性。

### 5.3 属性的动态添加与限定

正常情况下，当我们定义了一个class，创建了一个class的实例后，我们可以给该实例绑定任何属性和方法，这就是动态语言的灵活性。先定义class：

```python
class Student(object):
    pass
```

然后，尝试给实例绑定一个属性：

```python
>>> s = Student()
>>> s.name = 'Michael' # 动态给实例绑定一个属性
>>> print(s.name)
Michael
```

还可以尝试给实例绑定一个方法：

```python
>>> def set_age(self, age): # 定义一个函数作为实例方法
...     self.age = age
...
>>> from types import MethodType
>>> s.set_age = MethodType(set_age, s) # 给实例绑定一个方法
>>> s.set_age(25) # 调用实例方法
>>> s.age # 测试结果
25
```

但是，给一个实例绑定的方法，对另一个实例是不起作用的：

```python
>>> s2 = Student() # 创建新的实例
>>> s2.set_age(25) # 尝试调用方法
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'Student' object has no attribute 'set_age'
```

为了给所有实例都绑定方法，可以给class绑定方法：

```python
>>> def set_score(self, score):
...     self.score = score
...
>>> Student.set_score = set_score
```

给class绑定方法后，所有实例均可调用：

```python
>>> s.set_score(100)
>>> s.score
100
>>> s2.set_score(99)
>>> s2.score
99
```

通常情况下，上面的`set_score`方法可以直接定义在class中，但动态绑定允许我们在程序运行的过程中动态给class加上功能，这在静态语言中很难实现。

###### 使用__slots__

但是，如果我们想要限制实例的属性怎么办？比如，只允许对Student实例添加`name`和`age`属性。

为了达到限制的目的，Python允许在定义class的时候，定义一个特殊的`__slots__`变量，来限制该class实例能添加的属性：

```python
class Student(object):
    __slots__ = ('name', 'age') # 用tuple定义允许绑定的属性名称
```

然后，我们试试：

```python
>>> s = Student() # 创建新的实例
>>> s.name = 'Michael' # 绑定属性'name'
>>> s.age = 25 # 绑定属性'age'
>>> s.score = 99 # 绑定属性'score'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'Student' object has no attribute 'score'
```

由于`'score'`没有被放到`__slots__`中，所以不能绑定`score`属性，试图绑定`score`将得到`AttributeError`的错误。

使用`__slots__`要注意，`__slots__`定义的属性仅对当前类实例起作用，对继承的子类是不起作用的：

```python
>>> class GraduateStudent(Student):
...     pass
...
>>> g = GraduateStudent()
>>> g.score = 9999
```

除非在子类中也定义`__slots__`，这样，子类实例允许定义的属性就是自身的`__slots__`加上父类的`__slots__`。

### 5.3 定制类

看到类似`__slots__`这种形如`__xxx__`的变量或者函数名就要注意，这些在Python中是有特殊用途的。

`__slots__`我们已经知道怎么用了，`__len__()`方法我们也知道是为了能让class作用于`len()`函数。

除此之外，Python的class中还有许多这样有特殊用途的函数，可以帮助我们定制类。

###### \_\_str\_\_

我们先定义一个`Student`类，打印一个实例：

```python
>>> class Student(object):
...     def __init__(self, name):
...         self.name = name
...
>>> print(Student('Michael'))
<__main__.Student object at 0x109afb190>
```

打印出一堆`<__main__.Student object at 0x109afb190>`，不好看。

怎么才能打印得好看呢？只需要定义好`__str__()`方法，返回一个好看的字符串就可以了：

```python
>>> class Student(object):
...     def __init__(self, name):
...         self.name = name
...     def __str__(self):
...         return 'Student object (name: %s)' % self.name
...
>>> print(Student('Michael'))
Student object (name: Michael)
```

这样打印出来的实例，不但好看，而且容易看出实例内部重要的数据。

但是细心的朋友会发现直接敲变量不用`print`，打印出来的实例还是不好看：

```python
>>> s = Student('Michael')
>>> s
<__main__.Student object at 0x109afb310>
```

这是因为直接显示变量调用的不是`__str__()`，而是`__repr__()`，两者的区别是`__str__()`返回用户看到的字符串，而`__repr__()`返回程序开发者看到的字符串，也就是说，`__repr__()`是为调试服务的。

解决办法是再定义一个`__repr__()`。但是通常`__str__()`和`__repr__()`代码都是一样的，所以，有个偷懒的写法：

```python
class Student(object):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'Student object (name=%s)' % self.name
    __repr__ = __str__
```

###### \_\_iter\_\_

如果一个类想被用于`for ... in`循环，类似list或tuple那样，就必须实现一个`__iter__()`方法，该方法返回一个迭代对象，然后，Python的for循环就会不断调用该迭代对象的`__next__()`方法拿到循环的下一个值，直到遇到`StopIteration`错误时退出循环。

我们以斐波那契数列为例，写一个Fib类，可以作用于for循环：

```python
class Fib(object):
    def __init__(self):
        self.a, self.b = 0, 1 # 初始化两个计数器a，b

    def __iter__(self):
        return self # 实例本身就是迭代对象，故返回自己

    def __next__(self):
        self.a, self.b = self.b, self.a + self.b # 计算下一个值
        if self.a > 100000: # 退出循环的条件
            raise StopIteration()
        return self.a # 返回下一个值
```

现在，试试把Fib实例作用于for循环：

```python
>>> for n in Fib():
...     print(n)
...
1
1
2
3
5
...
46368
75025
```

###### \_\_getitem\_\_

Fib实例虽然能作用于for循环，看起来和list有点像，但是，把它当成list来使用还是不行，比如，取第5个元素：

```python
>>> Fib()[5]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'Fib' object does not support indexing
```

要表现得像list那样按照下标取出元素，需要实现`__getitem__()`方法：

```python
class Fib(object):
    def __getitem__(self, n):
        a, b = 1, 1
        for x in range(n):
            a, b = b, a + b
        return a
```

现在，就可以按下标访问数列的任意一项了：

```python
>>> f = Fib()
>>> f[0]
1
>>> f[1]
1
>>> f[2]
2
>>> f[3]
3
>>> f[10]
89
>>> f[100]
573147844013817084101
```

但是list有个神奇的切片方法：

```python
>>> list(range(100))[5:10]
[5, 6, 7, 8, 9]
```

对于Fib却报错。原因是`__getitem__()`传入的参数可能是一个int，也可能是一个切片对象`slice`，所以要做判断：

```python
class Fib(object):
    def __getitem__(self, n):
        if isinstance(n, int): # n是索引
            a, b = 1, 1
            for x in range(n):
                a, b = b, a + b
            return a
        if isinstance(n, slice): # n是切片
            start = n.start
            stop = n.stop
            if start is None:
                start = 0
            a, b = 1, 1
            L = []
            for x in range(stop):
                if x >= start:
                    L.append(a)
                a, b = b, a + b
            return L
```

现在试试Fib的切片：

```python
>>> f = Fib()
>>> f[0:5]
[1, 1, 2, 3, 5]
>>> f[:10]
[1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
```

但是没有对step参数作处理：

```python
>>> f[:10:2]
[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
```

也没有对负数作处理，所以，要正确实现一个`__getitem__()`还是有很多工作要做的。

此外，如果把对象看成`dict`，`__getitem__()`的参数也可能是一个可以作key的object，例如`str`。

与之对应的是`__setitem__()`方法，把对象视作list或dict来对集合赋值。最后，还有一个`__delitem__()`方法，用于删除某个元素。

总之，通过上面的方法，我们自己定义的类表现得和Python自带的list、tuple、dict没什么区别，这完全归功于动态语言的“鸭子类型”，不需要强制继承某个接口。

###### \_\_getattr\_\_

正常情况下，当我们调用类的方法或属性时，如果不存在，就会报错。比如定义`Student`类：

```python
class Student(object):

    def __init__(self):
        self.name = 'Michael'
```

调用`name`属性，没问题，但是，调用不存在的`score`属性，就有问题了：

```python
>>> s = Student()
>>> print(s.name)
Michael
>>> print(s.score)
Traceback (most recent call last):
  ...
AttributeError: 'Student' object has no attribute 'score'
```

错误信息很清楚地告诉我们，没有找到`score`这个attribute。

要避免这个错误，除了可以加上一个`score`属性外，Python还有另一个机制，那就是写一个`__getattr__()`方法，动态返回一个属性。修改如下：

```python
class Student(object):

    def __init__(self):
        self.name = 'Michael'

    def __getattr__(self, attr):
        if attr=='score':
            return 99
```

当调用不存在的属性时，比如`score`，Python解释器会试图调用`__getattr__(self, 'score')`来尝试获得属性，这样，我们就有机会返回`score`的值：

```python
>>> s = Student()
>>> s.name
'Michael'
>>> s.score
99
```

返回函数也是完全可以的：

```python
class Student(object):

    def __getattr__(self, attr):
        if attr=='age':
            return lambda: 25
```

只是调用方式要变为：

```python
>>> s.age()
25
```

注意，只有在没有找到属性的情况下，才调用`__getattr__`，已有的属性，比如`name`，不会在`__getattr__`中查找。

此外，注意到任意调用如`s.abc`都会返回`None`，这是因为我们定义的`__getattr__`默认返回就是`None`。要让class只响应特定的几个属性，我们就要按照约定，抛出`AttributeError`的错误：

```python
class Student(object):

    def __getattr__(self, attr):
        if attr=='age':
            return lambda: 25
        raise AttributeError('\'Student\' object has no attribute \'%s\'' % attr)
```

这实际上可以把一个类的所有属性和方法调用全部动态化处理了，不需要任何特殊手段。

这种完全动态调用的特性有什么实际作用呢？作用就是，可以针对完全动态的情况作调用。

举个例子：

现在很多网站都搞REST API，比如新浪微博、豆瓣啥的，调用API的URL类似：

- <http://api.server/user/friends>
- <http://api.server/user/timeline/list>

如果要写SDK，给每个URL对应的API都写一个方法，那得累死，而且，API一旦改动，SDK也要改。

利用完全动态的`__getattr__`，我们可以写出一个链式调用：

```python
class Chain(object):

    def __init__(self, path=''):
        self._path = path

    def __getattr__(self, path):
        return Chain('%s/%s' % (self._path, path))

    def __str__(self):
        return self._path

    __repr__ = __str__
```

试试：

```python
>>> Chain().status.user.timeline.list
'/status/user/timeline/list'
```

这样，无论API怎么变，SDK都可以根据URL实现完全动态的调用，而且，不随API的增加而改变！

还有些REST API会把参数放到URL中，比如GitHub的API：

```python
GET /users/:user/repos
```

调用时，需要把`:user`替换为实际用户名。如果我们能写出这样的链式调用：

```python
Chain().users('michael').repos
```

就可以非常方便地调用API了。有兴趣的童鞋可以试试写出来。

###### \_\_call\_\_

一个对象实例可以有自己的属性和方法，当我们调用实例方法时，我们用`instance.method()`来调用。能不能直接在实例本身上调用呢？在Python中，答案是肯定的。

任何类，只需要定义一个`__call__()`方法，就可以直接对实例进行调用。请看示例：

```python
class Student(object):
    def __init__(self, name):
        self.name = name

    def __call__(self):
        print('My name is %s.' % self.name)
```

调用方式如下：

```python
>>> s = Student('Michael')
>>> s() # self参数不要传入
My name is Michael.
```

`__call__()`还可以定义参数。对实例进行直接调用就好比对一个函数进行调用一样，所以你完全可以把对象看成函数，把函数看成对象，因为这两者之间本来就没啥根本的区别。

如果你把对象看成函数，那么函数本身其实也可以在运行期动态创建出来，因为类的实例都是运行期创建出来的，这么一来，我们就模糊了对象和函数的界限。

那么，怎么判断一个变量是对象还是函数呢？其实，更多的时候，我们需要判断一个对象是否能被调用，能被调用的对象就是一个`Callable`对象，比如函数和我们上面定义的带有`__call__()`的类实例：

```python
>>> callable(Student())
True
>>> callable(max)
True
>>> callable([1, 2, 3])
False
>>> callable(None)
False
>>> callable('str')
False
```

通过`callable()`函数，我们就可以判断一个对象是否是“可调用”对象。

### 5.4 枚举类

当我们需要定义常量时，一个办法是用大写变量通过整数来定义，例如月份：

```
JAN = 1
FEB = 2
MAR = 3
...
NOV = 11
DEC = 12
```

好处是简单，缺点是类型是`int`，并且仍然是变量。

更好的方法是为这样的枚举类型定义一个class类型，然后，每个常量都是class的一个唯一实例。Python提供了`Enum`类来实现这个功能：

```
from enum import Enum

Month = Enum('Month', ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))
```

这样我们就获得了`Month`类型的枚举类，可以直接使用`Month.Jan`来引用一个常量，或者枚举它的所有成员：

```
for name, member in Month.__members__.items():
    print(name, '=>', member, ',', member.value)
```

`value`属性则是自动赋给成员的`int`常量，默认从`1`开始计数。

如果需要更精确地控制枚举类型，可以从`Enum`派生出自定义类：

```
from enum import Enum, unique

@unique
class Weekday(Enum):
    Sun = 0 # Sun的value被设定为0
    Mon = 1
    Tue = 2
    Wed = 3
    Thu = 4
    Fri = 5
    Sat = 6
```

`@unique`装饰器可以帮助我们检查保证没有重复值。

访问这些枚举类型可以有若干种方法：

```python
>>> day1 = Weekday.Mon
>>> print(day1)
Weekday.Mon
>>> print(Weekday.Tue)
Weekday.Tue
>>> print(Weekday['Tue'])
Weekday.Tue
>>> print(Weekday.Tue.value)
2
>>> print(day1 == Weekday.Mon)
True
>>> print(day1 == Weekday.Tue)
False
>>> print(Weekday(1))
Weekday.Mon
>>> print(day1 == Weekday(1))
True
>>> Weekday(7)
Traceback (most recent call last):
  ...
ValueError: 7 is not a valid Weekday
>>> for name, member in Weekday.__members__.items():
...     print(name, '=>', member)
...
Sun => Weekday.Sun
Mon => Weekday.Mon
Tue => Weekday.Tue
Wed => Weekday.Wed
Thu => Weekday.Thu
Fri => Weekday.Fri
Sat => Weekday.Sat
```

可见，既可以用成员名称引用枚举常量，又可以直接根据value的值获得枚举常量。

### 5.5 元类

动态语言和静态语言最大的不同，就是函数和类的定义，不是编译时定义的，而是运行时动态创建的。

比方说我们要定义一个`Hello`的class，就写一个`hello.py`模块：

```
class Hello(object):
    def hello(self, name='world'):
        print('Hello, %s.' % name)
```

当Python解释器载入`hello`模块时，就会依次执行该模块的所有语句，执行结果就是动态创建出一个`Hello`的class对象，测试如下：

```python
>>> from hello import Hello
>>> h = Hello()
>>> h.hello()
Hello, world.
>>> print(type(Hello))
<class 'type'>
>>> print(type(h))
<class 'hello.Hello'>
```

`type()`函数可以查看一个类型或变量的类型，`Hello`是一个class，它的类型就是`type`，而`h`是一个实例，它的类型就是class `Hello`。

我们说class的定义是运行时动态创建的，而创建class的方法就是使用`type()`函数。

`type()`函数既可以返回一个对象的类型，又可以创建出新的类型，比如，我们可以通过`type()`函数创建出`Hello`类，而无需通过`class Hello(object)...`的定义：

```python
>>> def fn(self, name='world'): # 先定义函数
...     print('Hello, %s.' % name)
...
>>> Hello = type('Hello', (object,), dict(hello=fn)) # 创建Hello class
>>> h = Hello()
>>> h.hello()
Hello, world.
>>> print(type(Hello))
<class 'type'>
>>> print(type(h))
<class '__main__.Hello'>
```

要创建一个class对象，`type()`函数依次传入3个参数：

1. class的名称；
2. 继承的父类集合，注意Python支持多重继承，如果只有一个父类，别忘了tuple的单元素写法；
3. class的方法名称与函数绑定，这里我们把函数`fn`绑定到方法名`hello`上。

通过`type()`函数创建的类和直接写class是完全一样的，因为Python解释器遇到class定义时，仅仅是扫描一下class定义的语法，然后调用`type()`函数创建出class。

正常情况下，我们都用`class Xxx...`来定义类，但是，`type()`函数也允许我们动态创建出类来，也就是说，动态语言本身支持运行期动态创建类，这和静态语言有非常大的不同，要在静态语言运行期创建类，必须构造源代码字符串再调用编译器，或者借助一些工具生成字节码实现，本质上都是动态编译，会非常复杂。

###### metaclass

除了使用`type()`动态创建类以外，要控制类的创建行为，还可以使用metaclass。

metaclass，直译为元类，简单的解释就是：

当我们定义了类以后，就可以根据这个类创建出实例，所以：先定义类，然后创建实例。

但是如果我们想创建出类呢？那就必须根据metaclass创建出类，所以：先定义metaclass，然后创建类。

连接起来就是：先定义metaclass，就可以创建类，最后创建实例。

所以，metaclass允许你创建类或者修改类。换句话说，你可以把类看成是metaclass创建出来的“实例”。

metaclass是Python面向对象里最难理解，也是最难使用的魔术代码。正常情况下，你不会碰到需要使用metaclass的情况，所以，以下内容看不懂也没关系，因为基本上你不会用到。

我们先看一个简单的例子，这个metaclass可以给我们自定义的MyList增加一个`add`方法：

定义`ListMetaclass`，按照默认习惯，metaclass的类名总是以Metaclass结尾，以便清楚地表示这是一个metaclass：

```python
# metaclass是类的模板，所以必须从`type`类型派生：
class ListMetaclass(type):
    def __new__(cls, name, bases, attrs):
        attrs['add'] = lambda self, value: self.append(value)
        return type.__new__(cls, name, bases, attrs)
```

有了ListMetaclass，我们在定义类的时候还要指示使用ListMetaclass来定制类，传入关键字参数`metaclass`：

```python
class MyList(list, metaclass=ListMetaclass):
    pass
```

当我们传入关键字参数`metaclass`时，魔术就生效了，它指示Python解释器在创建`MyList`时，要通过`ListMetaclass.__new__()`来创建，在此，我们可以修改类的定义，比如，加上新的方法，然后，返回修改后的定义。

`__new__()`方法接收到的参数依次是：

1. 当前准备创建的类的对象；
2. 类的名字；
3. 类继承的父类集合；
4. 类的方法集合。

测试一下`MyList`是否可以调用`add()`方法：

```python
>>> L = MyList()
>>> L.add(1)
>> L
[1]
```

而普通的`list`没有`add()`方法：

```python
>>> L2 = list()
>>> L2.add(1)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'list' object has no attribute 'add'
```

动态修改有什么意义？直接在`MyList`定义中写上`add()`方法不是更简单吗？正常情况下，确实应该直接写，通过metaclass修改纯属变态。

但是，总会遇到需要通过metaclass修改类定义的。ORM就是一个典型的例子。

ORM全称“Object Relational Mapping”，即对象-关系映射，就是把关系数据库的一行映射为一个对象，也就是一个类对应一个表，这样，写代码更简单，不用直接操作SQL语句。

要编写一个ORM框架，所有的类都只能动态定义，因为只有使用者才能根据表的结构定义出对应的类来。

让我们来尝试编写一个ORM框架。

编写底层模块的第一步，就是先把调用接口写出来。比如，使用者如果使用这个ORM框架，想定义一个`User`类来操作对应的数据库表`User`，我们期待他写出这样的代码：

```python
class User(Model):
    # 定义类的属性到列的映射：
    id = IntegerField('id')
    name = StringField('username')
    email = StringField('email')
    password = StringField('password')

# 创建一个实例：
u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
# 保存到数据库：
u.save()
```

其中，父类`Model`和属性类型`StringField`、`IntegerField`是由ORM框架提供的，剩下的魔术方法比如`save()`全部由metaclass自动完成。虽然metaclass的编写会比较复杂，但ORM的使用者用起来却异常简单。

现在，我们就按上面的接口来实现该ORM。

首先来定义`Field`类，它负责保存数据库表的字段名和字段类型：

```python
class Field(object):

    def __init__(self, name, column_type):
        self.name = name
        self.column_type = column_type

    def __str__(self):
        return '<%s:%s>' % (self.__class__.__name__, self.name)
```

在`Field`的基础上，进一步定义各种类型的`Field`，比如`StringField`，`IntegerField`等等：

```python
class StringField(Field):

    def __init__(self, name):
        super(StringField, self).__init__(name, 'varchar(100)')

class IntegerField(Field):

    def __init__(self, name):
        super(IntegerField, self).__init__(name, 'bigint')
```

下一步，就是编写最复杂的`ModelMetaclass`了：

```python
class ModelMetaclass(type):

    def __new__(cls, name, bases, attrs):
        if name=='Model':
            return type.__new__(cls, name, bases, attrs)
        print('Found model: %s' % name)
        mappings = dict()
        for k, v in attrs.items():
            if isinstance(v, Field):
                print('Found mapping: %s ==> %s' % (k, v))
                mappings[k] = v
        for k in mappings.keys():
            attrs.pop(k)
        attrs['__mappings__'] = mappings # 保存属性和列的映射关系
        attrs['__table__'] = name # 假设表名和类名一致
        return type.__new__(cls, name, bases, attrs)
```

以及基类`Model`：

```python
class Model(dict, metaclass=ModelMetaclass):

    def __init__(self, **kw):
        super(Model, self).__init__(**kw)

    def __getattr__(self, key):
        try:
            return self[key]
        except KeyError:
            raise AttributeError(r"'Model' object has no attribute '%s'" % key)

    def __setattr__(self, key, value):
        self[key] = value

    def save(self):
        fields = []
        params = []
        args = []
        for k, v in self.__mappings__.items():
            fields.append(v.name)
            params.append('?')
            args.append(getattr(self, k, None))
        sql = 'insert into %s (%s) values (%s)' % (self.__table__, ','.join(fields), ','.join(params))
        print('SQL: %s' % sql)
        print('ARGS: %s' % str(args))
```

当用户定义一个`class User(Model)`时，Python解释器首先在当前类`User`的定义中查找`metaclass`，如果没有找到，就继续在父类`Model`中查找`metaclass`，找到了，就使用`Model`中定义的`metaclass`的`ModelMetaclass`来创建`User`类，也就是说，metaclass可以隐式地继承到子类，但子类自己却感觉不到。

在`ModelMetaclass`中，一共做了几件事情：

1. 排除掉对`Model`类的修改；
2. 在当前类（比如`User`）中查找定义的类的所有属性，如果找到一个Field属性，就把它保存到一个`__mappings__`的dict中，同时从类属性中删除该Field属性，否则，容易造成运行时错误（实例的属性会遮盖类的同名属性）；
3. 把表名保存到`__table__`中，这里简化为表名默认为类名。

在`Model`类中，就可以定义各种操作数据库的方法，比如`save()`，`delete()`，`find()`，`update`等等。

我们实现了`save()`方法，把一个实例保存到数据库中。因为有表名，属性到字段的映射和属性值的集合，就可以构造出`INSERT`语句。

编写代码试试：

```python
u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
u.save()
```

输出如下：

```python
Found model: User
Found mapping: email ==> <StringField:email>
Found mapping: password ==> <StringField:password>
Found mapping: id ==> <IntegerField:uid>
Found mapping: name ==> <StringField:username>
SQL: insert into User (password,email,username,id) values (?,?,?,?)
ARGS: ['my-pwd', 'test@orm.org', 'Michael', 12345]
```

可以看到，`save()`方法已经打印出了可执行的SQL语句，以及参数列表，只需要真正连接到数据库，执行该SQL语句，就可以完成真正的功能。

不到100行代码，我们就通过metaclass实现了一个精简的ORM框架，是不是非常简单？



## 6. IO编程

### 6.1 文件读写

读写文件是最常见的IO操作。Python内置了读写文件的函数，用法和C是兼容的。

读写文件前，我们先必须了解一下，在磁盘上读写文件的功能都是由操作系统提供的，现代操作系统不允许普通的程序直接操作磁盘，所以，读写文件就是请求操作系统打开一个文件对象（通常称为文件描述符），然后，通过操作系统提供的接口从这个文件对象中读取数据（读文件），或者把数据写入这个文件对象（写文件）。

###### 打开文件

要以读文件的模式打开一个文件对象，使用Python内置的`open()`函数：

```python
open(name[, mode[, buffering]], *, encoding, errors)
```

参数说明：

* name：要打开的文件路径和文件名。
* mode：打开模式：
  * r/w/a：以只读/只写/只追加方式打开文件，当文件不存在时，只读模式会抛出异常，后两种会新建文件。
  * b：以二进制形式打开文件，用在`r/w/a`后。
  * +：以读写方式打开文件，用在`r/w/a`后。
* buffering：如果 buffering 的值被设为 0，就不会有寄存。如果 buffering 的值取 1，访问文件时会寄存行。如果将 buffering 的值设为大于 1 的整数，表明了这就是的寄存区的缓冲大小。如果取负值，寄存区的缓冲大小则为系统默认。
* encoding：打开文件的编码方式，默认UTF-8
* errors：当以 encoding 打开文件编码出错时的处理方式，如`errors=ignore`。

```python

```



```python
>>> f = open('/Users/michael/test.txt', 'r')	# 只读方式打开文件

>>> f=open('/Users/michael/notfound.txt', 'r')	# 只读打开一个不存在的文件
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
FileNotFoundError: [Errno 2] No such file or directory: '/Users/michael/notfound.txt'


>>> f = open('/Users/michael/test.jpg', 'rb')	# 只读二进制方式打开一个文件
>>> f.read()
b'\xff\xd8\xff\xe1\x00\x18Exif\x00\x00...' # 十六进制表示的字节

>>> f = open('/Users/michael/gbk.txt', 'r+', encoding='gbk', errors='ignore') # 读写方式以gbk编码																				# 打开文件，遇到编																				# 码错误直接忽略
```

如果文件打开成功，接下来，调用`read()`方法可以一次读取文件的全部内容，Python把内容读到内存，用一个`str`对象表示：

```python
>>> f.read()
'Hello, world!'
```

###### 关闭文件

最后一步是调用`close()`方法关闭文件。文件使用完毕后必须关闭，因为文件对象会占用操作系统的资源，并且操作系统同一时间能打开的文件数量也是有限的：

```python
>>> f.close()
```

由于文件读写时都有可能产生`IOError`，一旦出错，后面的`f.close()`就不会调用。所以，为了保证无论是否出错都能正确地关闭文件，我们可以使用`try ... finally`来实现：

```python
try:
    f = open('/path/to/file', 'r')
    print(f.read())
finally:
    if f:
        f.close()
```

但是每次都这么写实在太繁琐，所以，Python引入了`with`语句来自动帮我们调用`close()`方法：

```python
with open('/path/to/file', 'r') as f:
    print(f.read())
```

这和前面的`try ... finally`是一样的，但是代码更佳简洁，并且不必调用`f.close()`方法。

###### 读取文件

调用`read()`会一次性读取文件的全部内容，如果文件有10G，内存就爆了，所以，要保险起见，可以反复调用`read(size)`方法，每次最多读取size个字节的内容。另外，调用`readline()`可以每次读取一行内容，调用`readlines()`一次读取所有内容并按行返回`list`。因此，要根据需要决定怎么调用。

如果文件很小，`read()`一次性读取最方便；如果不能确定文件大小，反复调用`read(size)`比较保险；如果是配置文件，调用`readlines()`最方便：

```python
for line in f.readlines():
    print(line.strip()) # 把末尾的'\n'删掉
```

###### file-like Object

像`open()`函数返回的这种有个`read()`方法的对象，在Python中统称为file-like Object。除了file外，还可以是内存的字节流，网络流，自定义流等等。file-like Object不要求从特定类继承，只要写个`read()`方法就行。

`StringIO`就是在内存中创建的file-like Object，常用作临时缓冲。

###### 写文件

写文件和读文件是一样的，唯一区别是调用`open()`函数时，传入标识符`'w'`或者`'wb'`表示写文本文件或写二进制文件：

```python
>>> f = open('/Users/michael/test.txt', 'w')
>>> f.write('Hello, world!')
>>> f.close()
```

你可以反复调用`write()`来写入文件，但是务必要调用`f.close()`来关闭文件。当我们写文件时，操作系统往往不会立刻把数据写入磁盘，而是放到内存缓存起来，空闲的时候再慢慢写入。只有调用`close()`方法时，操作系统才保证把没有写入的数据全部写入磁盘。忘记调用`close()`的后果是数据可能只写了一部分到磁盘，剩下的丢失了。所以，还是用`with`语句来得保险：

```python
with open('/Users/michael/test.txt', 'w') as f:
    f.write('Hello, world!')
```

要写入特定编码的文本文件，请给`open()`函数传入`encoding`参数，将字符串自动转换成指定编码。

### 6.2 StringIO和BytesIO

###### StringIO

很多时候，数据读写不一定是文件，也可以在内存中读写。

StringIO顾名思义就是在内存中读写str。

要把str写入StringIO，我们需要先创建一个StringIO，然后，像文件一样写入即可：

```python
>>> from io import StringIO
>>> f = StringIO()
>>> f.write('hello')
5
>>> f.write(' ')
1
>>> f.write('world!')
6
>>> print(f.getvalue())
hello world!
```

`getvalue()`方法用于获得写入后的str。

要读取StringIO，可以用一个str初始化StringIO，然后，像读文件一样读取：

```python
>>> from io import StringIO
>>> f = StringIO('Hello!\nHi!\nGoodbye!')
>>> while True:
...     s = f.readline()
...     if s == '':
...         break
...     print(s.strip())
...
Hello!
Hi!
Goodbye!
```

###### BytesIO

StringIO操作的只能是str，如果要操作二进制数据，就需要使用BytesIO。

BytesIO实现了在内存中读写bytes，我们创建一个BytesIO，然后写入一些bytes：

```python
>>> from io import BytesIO
>>> f = BytesIO()
>>> f.write('中文'.encode('utf-8'))
6
>>> print(f.getvalue())
b'\xe4\xb8\xad\xe6\x96\x87'
```

请注意，写入的不是str，而是经过UTF-8编码的bytes。

和StringIO类似，可以用一个bytes初始化BytesIO，然后，像读文件一样读取：

```python
>>> from io import BytesIO
>>> f = BytesIO(b'\xe4\xb8\xad\xe6\x96\x87')
>>> f.read()
b'\xe4\xb8\xad\xe6\x96\x87'
```

### 6.3 操作文件和目录

如果我们要操作文件、目录，可以在命令行下面输入操作系统提供的各种命令来完成。比如`dir`、`cp`等命令。

如果要在Python程序中执行这些目录和文件的操作怎么办？其实操作系统提供的命令只是简单地调用了操作系统提供的接口函数，Python内置的`os`模块也可以直接调用操作系统提供的接口函数。

打开Python交互式命令行，我们来看看如何使用`os`模块的基本功能：

```
>>> import os
>>> os.name # 操作系统类型
'posix'
```

如果是`posix`，说明系统是`Linux`、`Unix`或`Mac OS X`，如果是`nt`，就是`Windows`系统。

要获取详细的系统信息，可以调用`uname()`函数：

```
>>> os.uname()
posix.uname_result(sysname='Darwin', nodename='MichaelMacPro.local', release='14.3.0', version='Darwin Kernel Version 14.3.0: Mon Mar 23 11:59:05 PDT 2015; root:xnu-2782.20.48~5/RELEASE_X86_64', machine='x86_64')
```

注意`uname()`函数在Windows上不提供，也就是说，`os`模块的某些函数是跟操作系统相关的。

###### 环境变量

在操作系统中定义的环境变量，全部保存在`os.environ`这个变量中，可以直接查看：

```python
>>> os.environ
environ({'VERSIONER_PYTHON_PREFER_32_BIT': 'no', 'TERM_PROGRAM_VERSION': '326', 'LOGNAME': 'michael', 'USER': 'michael', 'PATH': '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/mysql/bin', ...})
```

要获取某个环境变量的值，可以调用`os.environ.get('key')`：

```python
>>> os.environ.get('PATH')
'/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/mysql/bin'
>>> os.environ.get('x', 'default')
'default'
```

###### 操作文件和目录

操作文件和目录的函数一部分放在`os`模块中，一部分放在`os.path`模块中，这一点要注意一下。查看、创建和删除目录可以这么调用：

```python
# 查看当前目录的绝对路径:
>>> os.path.abspath('.')
'/Users/michael'
# 在某个目录下创建一个新目录，首先把新目录的完整路径表示出来:
>>> os.path.join('/Users/michael', 'testdir')
'/Users/michael/testdir'
# 然后创建一个目录:
>>> os.mkdir('/Users/michael/testdir')
# 删掉一个目录:
>>> os.rmdir('/Users/michael/testdir')
```

把两个路径合成一个时，不要直接拼字符串，而要通过`os.path.join()`函数，这样可以正确处理不同操作系统的路径分隔符。在Linux/Unix/Mac下，`os.path.join()`返回这样的字符串：

```python
part-1/part-2
```

而Windows下会返回这样的字符串：

```python
part-1\part-2
```

同样的道理，要拆分路径时，也不要直接去拆字符串，而要通过`os.path.split()`函数，这样可以把一个路径拆分为两部分，后一部分总是最后级别的目录或文件名：

```python
>>> os.path.split('/Users/michael/testdir/file.txt')
('/Users/michael/testdir', 'file.txt')
```

`os.path.splitext()`可以直接让你得到文件扩展名，很多时候非常方便：

```python
>>> os.path.splitext('/path/to/file.txt')
('/path/to/file', '.txt')
```

这些合并、拆分路径的函数并不要求目录和文件要真实存在，它们只对字符串进行操作。

文件操作使用下面的函数。假定当前目录下有一个`test.txt`文件：

```python
# 对文件重命名:
>>> os.rename('test.txt', 'test.py')
# 删掉文件:
>>> os.remove('test.py')
```

但是复制文件的函数居然在`os`模块中不存在！原因是复制文件并非由操作系统提供的系统调用。理论上讲，我们通过上一节的读写文件可以完成文件复制，只不过要多写很多代码。

幸运的是`shutil`模块提供了`copyfile()`的函数，你还可以在`shutil`模块中找到很多实用函数，它们可以看做是`os`模块的补充。

最后看看如何利用Python的特性来过滤文件。比如我们要列出当前目录下的所有目录，只需要一行代码：

```python
>>> [x for x in os.listdir('.') if os.path.isdir(x)]
['.lein', '.local', '.m2', '.npm', '.ssh', '.Trash', '.vim', 'Applications', 'Desktop', ...]
```

要列出所有的`.py`文件，也只需一行代码：

```python
>>> [x for x in os.listdir('.') if os.path.isfile(x) and os.path.splitext(x)[1]=='.py']
['apis.py', 'config.py', 'models.py', 'pymonitor.py', 'test_db.py', 'urls.py', 'wsgiapp.py']
```

### 6.4 序列化

在程序运行的过程中，所有的变量都是在内存中，比如，定义一个dict：

```python
d = dict(name='Bob', age=20, score=88)
```

可以随时修改变量，比如把`name`改成`'Bill'`，但是一旦程序结束，变量所占用的内存就被操作系统全部回收。如果没有把修改后的`'Bill'`存储到磁盘上，下次重新运行程序，变量又被初始化为`'Bob'`。

我们把变量从内存中变成可存储或传输的过程称之为序列化，在Python中叫pickling，在其他语言中也被称之为serialization，marshalling，flattening等等，都是一个意思。

序列化之后，就可以把序列化后的内容写入磁盘，或者通过网络传输到别的机器上。

反过来，把变量内容从序列化的对象重新读到内存里称之为反序列化，即unpickling。

Python提供了`pickle`模块来实现序列化。

首先，我们尝试把一个对象序列化并写入文件：

```python
>>> import pickle
>>> d = dict(name='Bob', age=20, score=88)
>>> pickle.dumps(d)
b'\x80\x03}q\x00(X\x03\x00\x00\x00ageq\x01K\x14X\x05\x00\x00\x00scoreq\x02KXX\x04\x00\x00\x00nameq\x03X\x03\x00\x00\x00Bobq\x04u.'
```

`pickle.dumps()`方法把任意对象序列化成一个`bytes`，然后，就可以把这个`bytes`写入文件。或者用另一个方法`pickle.dump()`直接把对象序列化后写入一个file-like Object：

```python
>>> f = open('dump.txt', 'wb')
>>> pickle.dump(d, f)
>>> f.close()
```

看看写入的`dump.txt`文件，一堆乱七八糟的内容，这些都是Python保存的对象内部信息。

当我们要把对象从磁盘读到内存时，可以先把内容读到一个`bytes`，然后用`pickle.loads()`方法反序列化出对象，也可以直接用`pickle.load()`方法从一个`file-like Object`中直接反序列化出对象。我们打开另一个Python命令行来反序列化刚才保存的对象：

```python
>>> f = open('dump.txt', 'rb')
>>> d = pickle.load(f)
>>> f.close()
>>> d
{'age': 20, 'score': 88, 'name': 'Bob'}
```

变量的内容又回来了！

当然，这个变量和原来的变量是完全不相干的对象，它们只是内容相同而已。

Pickle的问题和所有其他编程语言特有的序列化问题一样，就是它只能用于Python，并且可能不同版本的Python彼此都不兼容，因此，只能用Pickle保存那些不重要的数据，不能成功地反序列化也没关系。

## 7. 进程和线程

## 8. 常用内建模块

## 9. 常用第三方模块

## 10. 错误、调试和测试