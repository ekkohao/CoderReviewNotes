# Go 基础

## 1. 基础

### 1.1 语言结构

```go
package main

import "fmt"

func main() {
   /* 这是我的第一个简单的程序 */
   fmt.Println("Hello, World!")
}
```

类似java，第一行是使用 package 关键字进行包声明，第三行使用 import 关键字导入依赖包，第5行使用 func 关键字声明一个函数，大括号为方法体。

不同的是，Go 不需要分号作为结尾，而是通过换行识别

命令行运行 GO ：`$ go run <filename>.go`

### 1.2 基本语法

**注释**

```go
// 这是单行注释
/**
 * 这是
 * 多行注释
 */
```

**变量命名**

`^[a-zA-Z_][a-zA-Z0-9_]*$`

**变量类型与初值**

方法体外的位全局变量，否则位局部变量。如果定义是没有初始化都会初始化为响应类型的零值。

**变量声明**

go 变量声明顺序和 C 与 Java 相反，类型在变量名之后，数组符号[]又在类型名前。

* var 声明变量
* const 声明常量 

```go
// 初值和类型必须指定一个，类型可以通过初值推倒
var a int
var a int = 1
var a = 1

var a, b int = 1, 2 // 只能相同类型
var a, s = 1, "hello" // 自动识别可以不同类型

// 因式分解方式声明，可以不同类型，类型和初值指定一个即可
var (
	a int = 1
    s string = "hello"
    b = 2
)

//数组
var arr [5]int;
arr := [5]int{1, 3}
arr := [...]int{1, 3} //自定识别数组大写，同样也指定一维大小自适应

// 常量，必须指定初值
const c int = 1
// 初始可以也通过内置函数获得 len(), cap(), unsafe.Sizeof()
const l = len(s)
```

**iota**

iota 可以认为是编译器内置的常量，每次 const 出现都会重置为0，名词使用后都会自增

```go
const (
    a = iota // 0
    b = iota // 1
    c = iota // 2
)

//也可以这样写
const (
    a = iota // 0
    b   // 1, 即会自定使用前面的定义值
    c  // 2
)
```



### 1.3 变量类型

**值类型**

* 布尔型  bool
* 整数型 int8, int16, int32, int64, unit8, unit16, uint32, uint64, 
* 整数扩展型 byte(类似unit8), rune(类似int32), int(相当于 int32 或 int64 取决于 CPU)，uint (unit32 或 uint64), uintptr(用于存放指针)
* 浮点型 float32, float64
* 复数型 complex64 complex128

**派生型**

* 指针型 Pointer
* 数组型
* 结构体型 struct
* Channel 型
* 函数型
* 切片型
* 接口型
* Map型

### 1.4 运算符

要注意的所有运算符两端的变量必须相同，Go 不会自动转换。int 与 int32 或 int64 都不是相同的类型。通过类型加括号来转换。

**（一）运算符分类**

**算术**

|  加  |  减  |  乘  |  除  | 取余 | 自增 | 自减 |
| :--: | :--: | :--: | :--: | :--: | :--: | :--: |
|  +   |  -   |  \*  |  /   |  %   |  ++  |  --  |

**位**

| 按位与 | 按位或 | 按位异或 | 左移 | 右移 |
| :----: | :----: | :------: | :--: | :--: |
|   &    |   \|   |    ^     | \<\< | \>\> |

**关系**

| 等于 | 不等 | 大于 | 小于 | 大于等于 | 小于等于 |
| :--: | :--: | :--: | :--: | :------: | :------: |
|  ==  |  !=  |  \>  |  \<  |   \>=    |   \<=    |

**逻辑**

|  且  |  或  |  非  |
| :--: | :--: | :--: |
|  &&  | \|\| |  !   |

**赋值**

= 号赋值，几乎所有的算术和位运算符都可以和等号组合

**地址运算**

| 取地址 | 解析值 |
| :----: | :----: |
|   &    |   \*   |

**（二）运算符优先级**

和 C 语言优先级完全一样，口诀仍用的上：**“算位关罗条赋逗”**，只是 Go 没有“条”和“逗”；右结合的口诀也相同**“单条赋”**。

### 1.5 条件语句

**if**

条件的括号可以不用写，但大括号不能省略

**switch（与 C 和 Java 有差别）**

条件的括号可以不用写，只会执行一个 case 语句，即会自动break

**select**

```go
select {
    case communication clause  :
       statement(s);      
    case communication clause  :
       statement(s); 
    /* 你可以定义任意数量的 case */
    default : /* 可选 */
       statement(s);
}
```

以下描述了 select 语句的语法：

* 每个case都必须是一个通信，所有channel表达式都会被求值，所有被发送的表达式都会被求值
* 如果任意某个通信可以进行，它就执行；其他被忽略。
* 如果有多个case都可以运行，Select会随机公平地选出一个执行。其他不会执行。 
* 否则：
  * 如果有default子句，则执行该语句。
  * 如果没有default字句，select将阻塞，直到某个通信可以运行；Go不会重新对channel或值进行求值。

### 1.6 循环语句

go 只有 for 循环，但有 3 中写法

```go
// 典型 for 写法
for i := 1; i < 10; ++i {
    // do sth
}

//foreach 写法，使用 range 关键字可以对 slice、map、数组、字符串等进行迭代循环
for key, value := range aMap {
    aMap[key] = value
}

// 类 while 写法
i := 1
for i < 10 {
    
}
```

### 1.7 函数定义

```go
func function_name( [parameter list] ) [return_types] {
   //函数体
}
```

返回类型不写表示无返回值

### 1.8 指针

```go
a := 1
var ptr1 *int = &a
ptr2 := &a
b := *ptr1

fmt.Println(a == b) // true
```

## 2. 进阶

### 2.1 结构体 struct

```go
type Books struct {
   title string
   author string
   subject string
   book_id int
}

//声明
var b Books
```

### 2.2 切片 splice

切片相当于动态数组，主要是应对数组定长太不不灵活。和 Python 切片用途相同

定义切片，通过[]加类型名

```go
//定义
var slice []int

//使用make函数指定初始大小（默认0），也可指定最大容量（也可以不指定）
var slice = make([]int, 2, 10) // 初始长度2，最大10

//初始化
slice := arr[:] // 初始化切片为 0 到 len(arr) - 1
slice := arr[1:5] // 初始化切片为 1 到 4
```

通过 append() 方法可以对切片扩容（通过申请一个更大的数组，并拷贝值，再返回），注意返回的是新的切片。通过 copy() 可以完成两个切片的拷贝

```go
numbers := []int{0}  
numbers1 := append(numbers, 1) // numbers = [0], numbers1 = [0 , 1]
numbers[0] = 2;
// numbers 拷贝到 numbers1
copy(numbers1, numbers) // numbers = [2], numbers1 = [2 , 1]
```

需要注意的是 append() 和 copy() 将不会再持有原数组的引用，只有通过 `arr[:]` 获取到的切片才持有原数组的引用。

### 2.3 范围 range

range 关键字作用于 for 循环中迭代数组(array)、切片(slice)、通道(channel)或集合(map)的元素前。在数组和切片中它返回元素的索引和索引对应的值，在集合中返回 key-value 对的 key 值。 

```go
for i, num := range nums {
    if num == 3 {
        fmt.Println("index:", i)
    }
}
```

### 2.4 Map

```go
var m map[string]int //key 为 string，value 为 int
// 插入
m["a"] = 1

//获取, 获取到第二值为是否存在于map中的布尔值
a, ok := m["a"]

//删除
delete(m, "a")
```

### 2.5 类型转换

```go
var sum = 10
var cnt = 3
var avg = float32(sum)/float(cnt) //强转，类型一样不能相互计算
```

### 2.6 接口

通过 `type <name> interface` ，任何其他类型只要实现了这些方法就是实现了这个接口。

```go
// 定义接口
type Phone interface {
    call()	//声明无返回值的方法
    name() string //声明又返回指定额方法
}

// 定义结构体
type NokiaPhone struct {
}

// 方法前指定结构体，表示对此结构体增加方法
func (nokiaPhone NokiaPhone) call() {
    fmt.Println("I am Nokia, I can call you!")
}

func (nokiaPhone NokiaPhone) name() string {
    return "NokiaPhone"
}

//至此 NokiaPhone 就实现的 Phone 接口

func main() {
    var phone Phone
    
    phone = new(NokiaPhone)
    phone.call()
    fmt.Println("I am Nokia, name =", phone.name())
}
```

### 2.7 错误处理

Go 语言通过内置的错误接口提供了非常简单的错误处理机制。

error类型是一个接口类型，这是它的定义：

```go
type error interface {
    Error() string // 返回错误信息
}
```

举例：

```go
/ 定义一个 DivideError 结构
type DivideError struct {
    dividee int
    divider int
}

// 实现 `error` 接口
func (de *DivideError) Error() string {
    return "divde 0 error"
}

// 定义 `int` 类型除法运算的函数
func Divide(varDividee int, varDivider int) (result int, errorMsg string) {
    if varDivider == 0 {
        dData := DivideError{
            dividee: varDividee,
            divider: varDivider,
        }
        errorMsg = dData.Error()
        return
    } else {
        return varDividee / varDivider, ""
    }
}
```

