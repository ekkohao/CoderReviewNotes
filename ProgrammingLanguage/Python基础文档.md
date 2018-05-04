# Python基础文档

[TOC]

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

![Python-l](C:/Users/jerehao/AppData/Roaming/Typora/draftsRecover/assets/l.png)

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



## 4. 模块