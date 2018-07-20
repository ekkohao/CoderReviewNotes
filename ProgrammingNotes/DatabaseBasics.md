# 数据库

## 1. 基础

### 1.1 事物

**ACID**

* **Atomicity**  原子性，事物不可分
* **Consistency**  一致性，事物执行前后数据一致，即结果正确
* **Isolation**  隔离性，事物之间操作互不干扰
* **Durability**  持久性，一旦事务提交，则其所做的修改将会永远保存到数据库中。即使系统发生崩溃，事务执行的结果也不能丢失 

事务的 ACID 特性概念简单，但不是很好理解，主要是因为这几个特性不是一种平级关系：

- 只有满足一致性，事务的执行结果才是正确的。
- 在无并发的情况下，事务串行执行，隔离性一定能够满足。此时要只要能满足原子性，就一定能满足一致性。
- 在并发的情况下，多个事务并发执行，事务不仅要满足原子性，还需要满足隔离性，才能满足一致性。
- 事务满足持久化是为了能应对数据库崩溃的情况。

### 1.2 并发一致性

上面说了，并发事物需要满足原子性和隔离性才能满足一致性，而事务的隔离性很难保证，因此会出现很多并发一致性问题。 

**丢失更改**

T1 和 T2 两个事务都对一个数据进行修改，T1 先修改，T2 随后修改，随后TI提交，然后T2提交，T2 的修改覆盖了 T1 的修改。 

**脏读**

事物期间，读到的数据已被丢弃（另一个事物撤销了更改）而不自知。

**不可重复读**

事物期间，再次读取同一个数据与第一次读取结果不同。

**幻读**

事物期间，聚集函数两次执行结果不同。

产生并发不一致性问题主要原因是破坏了事务的隔离性，解决方法是通过并发控制来保证隔离性。并发控制可以通过**封锁**来实现，但是封锁操作需要用户自己控制，相当复杂。数据库管理系统提供了**事务的隔离级别**，让用户以一种更轻松的方式处理并发一致性问题。 

#### 1.2.1 封锁

**封锁粒度**

MySQL 中提供了两种封锁粒度：行级锁以及表级锁。

应该尽量只锁定需要修改的那部分数据，而不是所有的资源。锁定的数据量越少，发生锁争用的可能就越小，系统的并发程度就越高。

但是加锁需要消耗资源，锁的各种操作（包括获取锁、释放锁、以及检查锁状态）都会增加系统开销。因此封锁粒度越小，系统开销就越大。

在选择封锁粒度时，需要在锁开销和并发程度之间做一个权衡。

**封锁类型**

读写锁：

* 排它锁（Exclusive），简写为 X 锁，又称写锁。一个事务对数据对象 A 加了 X 锁，就可以对 A 进行读取和更新。加锁期间其它事务不能对 A 加任何锁。
* 共享锁（Shared），简写为 S 锁，又称读锁。一个事务对数据对象 A 加了 S 锁，可以对 A 进行读取操作，但是不能进行更新操作。加锁期间其它事务能对 A 加 S 锁，但是不能加 X 锁。

意向锁：

使用意向锁（Intention Locks）可以更容易地支持多粒度封锁。 MySQL中主要用来解决表锁和行锁共存的情况，试想一下，若事务 T 想要对表 A 加 X 锁，就需要先检测是否有其它事务对表 A 或者表 A 中的任意一行加了锁，那么就需要对表 A 的每一行都检测一次，这是非常耗时的。 

意向锁在原来的 X/S 锁之上引入了 IX/IS，IX/IS 都是表锁，用来表示一个事务想要在表中的某个数据行上加 X 锁或 S 锁。有以下两个规定：

- 一个事务在获得某个数据行对象的 S 锁之前，必须先获得表的 IS 锁或者更强的锁；
- 一个事务在获得某个数据行对象的 X 锁之前，必须先获得表的 IX 锁。

这样表锁只需检查IS或IX就可知道有没有行锁的存在。

**封锁协议**

1）三级封锁协议

* 一级封锁协议  修改数据时必须加X锁，事物结束时才能释放。解决丢失更改问题。因为不能同时有两个事务对同一个数据进行修改，那么事务的修改就不会被覆盖。 
* 二级封锁协议  一级协议的基础上，读取数据必须加 S 锁，读完立即释放，解决了脏读问题。因为如果一个事务在对数据 A 进行修改，根据 1 级封锁协议，会加 X 锁，那么就不能再加 S 锁了，也就是不会读入数据。 
* 三级封锁协议  在二级协议的基础上，读取数据必须加 S 锁，事物结束时才能释放，解决了不可重复读问题。因为读数据时，其它事务不能对该数据加 X 锁，从而避免了在读的期间数据发生改变。 

2）两段锁协议

加锁和解锁分为两个阶段进行。

可串行化调度是指，通过并发控制，使得并发执行的事务结果与某个串行执行的事务结果相同。

事务遵循两段锁协议是保证可串行化调度的充分条件。

#### 1.2.2 事物的隔离级别

**READ UNCOMMITTED（未提交读）**

允许读到其他事物未提交的数据。即事物修改的数据提交之前对其他事物可见。

**READ COMMITTED（已提交读）**

只能读取已经提交事物的数据。即事物修改的数据提交之前对其他事物不可见。

**REPEATABLE READ（可重复读）**

保证一个事物中多次读取一个数据结果相同。

**SERIALIZABLE（可串行化）**

任何两个事物不会同时执行。

## 2. SQL语句

字段名：使用反引号括起来的字符串，一般可将反引号神略，但当字段名和sql关键字重名时就不能省略了。

字符串：必须使用单引号单引号括起来



### 2.1 常用sql

#### 2.1.1 表操作

**create table**

```sql
create table <table_name> (
	<column_defination>,
    ...
    primary key <column_name>,
    foreigh key <column_name> references <table_name>
);
```

**列定义子句**

```sql
<column_name> <type> [not null] [default <default_value>] [unique];
```

**创建索引**

```sql
create index <index_name> on <table_name>(column_name1,...)
```



**alter table**

```sql
alter table <table_name> add <column_defination>;
alter table <table_name> drop <column_name> ;
```

**drop table**

```sql
drop table <table_name>;
```

#### 2.1.2 行操作

**插入语句 insert**

```sql
insert into <table_name> values(<value1>, <value2>, ...);
insert into <table_name>(<column1>, <column2>, ...) values(<value1>, <value2>, ...);
```

**修改语句 update**

```sql
update <table_name> set <column_name>=<value>,.. where <condition>
```

**删除语句 delete**

```sql
delete from <table_name> where <condition>
```

**查询语句 select**

```sql
select <column_names> 
from <table_name> 
[where <condition>] 
[order by <column_name> <DESC/ASC>]
[limit <offset - 1,length>];

/* 使用distinct过滤重复记录，当记录的所有字段均相同时认为记录重复 */
select distinct <column_names> from <table_name> [where <condition>];

/* from 子句还可以是一个select语句 */
select <column_names> from (<select2>);
```

**条件子句**

值得注意的是 sql 中的布尔值除了 true 和 false 还有 unknown，当某个条件表达式含为空是，其结果就是unknown。如`a.id = NULL`就是unknown，unknown 逻辑与和逻辑或的表达式结果见下面示例。

```sql
/* 常用符号 */
>, >=, < , <=, =, <>, and, or, not, is null, is not null;

/* unknown 的与或操作 */
unknown and unknown -- unknown
unknown and true -- unknown
unknown and false -- false
unknown or true -- true
unknown or false -- unknown
not unknown -- unknown

/* 区间比较 */
between 0 and 10;

/* tuple比较，相当于各元素比较后再逻辑与 */
(A,B,C, ...) = (a,b,c, ...);

/* 字符串模式匹配， (%) - 0个或多个字符，(_) - 任意一个字符，([abc]) - 集合内一个字符  */
<string_column_name> [not] like <pattern>;
/* 当需要转义%和_时，可以使用escape关键字定义一个字符来转义 */
<string_column_name> [not] like 'str\%str' escape '\';

/* select 集合比较 */

<column_name> [not] in <select>		--是否属于某集合 
[not] exists <select>	--是否集合为空
<column_name> <比较符号> [all/some] <select> 	--all，默认，集合均满足比较关系；some，部分满足
```

**select上的连接 join**

共有四种连接，内链接，左外连接，右外连接，全连接。同时这四种连接还可以加上nature关键字成为自然连接。自然连接连接的是两个表相同字段名中属性值也相同的记录，可以使用 using 指明需要比较的字段。而非自然连接可以使用 on 关键字自由选择连接属性。

内链接返回的是笛卡尔集合中满足条件的所有记录，而外连接还返回一个表某行在另一个表没有对应条件记录的行，这时另一个表中的记录使用空返回。左/右外连接返回的是笛卡尔集合中出现在左/右表中的所有记录。

```sql
/* 自然连接 */
select <column_names> from <table_name> nature join <table_name2> [using <column_name1>, ...];

/* 非自然连接 */
select <column_names> 
from <table_name>
[inner/left/right/full] join <table_name2>
on <table_name>.<column_name>=<table_name2>.<column_name>
```

假如有语句`select * form A,B where A.id = B.a_id`这样的语句成为隐式内链接，这回先求出AB表所有记录的笛卡尔集合中间表在进行where筛选。而显式内链接`select * from A join B on A.id = B.a_id`这会直接求出符合on条件的中间表。

**select的集合运算语句 union intersect except**

```sql
/* 并 */
<select1> union [all] <select2>

/* 交 */
<select1> intersect [all] <select2>

/* 差 */
<select1> except [add] <select2>

/* 默认去重，all关键字输出重复 */
```

**select分组语句 group by**

值得注意的是，含有 group by 字段的 select 语句的非聚集查询字段，必须出现在group by 字段中。比如这个语句就是错误的：`select ID,grade,count(*) from users group by grade having max(age) < 18 `，ID 这个字段在一个分组中可能有很多值，不能确定使用哪一个，sql 不允许这样的情况出现。 

```
<select> 
groupy by <column_name1>,<column_name2>,... 
[having] <condition>；
```

**别名子句 as**

可以对字段和表起别名

```sql
<column_name> as <new_name>
<table_name> as <new_name>
```

#### 2.1.3 函数

**sql支持的计算**

+，-，\*，/，&，|，^，%

**聚集函数**

avg(\<numeric_column_name\>)

min/max(\<column_name\>)

sum(\<numeric_column_name\>)

count([distinct] \<column_name\>)

在计算全部为空的列时count返回0，其余返回空。

**字符函数**

upper(\<string\>)

lower(\<string\>)

length(\<string\>)

trim(\<string\>)

char(\<ascii\>)

ascii(\<char\>)

**时间函数**

now()

**数值函数**

sin/cos/tan(\<number\>)

abs(\<number\>)

sqrt(\<number\>)

mod(\<number\>,\<number\>)

exp(\<number\>,\<number\>)

pi()

rand()

#### 2.1.4 用户操作

MySQL 的账户信息保存在 mysql 这个数据库中。

```
USE mysql;
SELECT user FROM user;
```

**创建账户**

```
CREATE USER myuser IDENTIFIED BY 'mypassword';
```

新创建的账户没有任何权限。

**修改账户名**

```
RENAME myuser TO newuser;
```

**删除账户**

```
DROP USER myuser;
```

**查看权限**

```
SHOW GRANTS FOR myuser;
```

**授予权限**

```
GRANT SELECT, INSERT ON mydatabase.* TO myuser;
```

账户用 username@host 的形式定义，username@% 使用的是默认主机名。

**删除权限**

```
REVOKE SELECT, INSERT ON mydatabase.* FROM myuser;
```

GRANT 和 REVOKE 可在几个层次上控制访问权限：

- 整个服务器，使用 GRANT ALL 和 REVOKE ALL；
- 整个数据库，使用 ON database.*；
- 特定的表，使用 ON database.table；
- 特定的列；
- 特定的存储过程。

**更改密码**

必须使用 Password() 函数

```
SET PASSWROD FOR myuser = Password('new_password');
```

### 2.2 存储过程

存储过程可以看成是对一系列 SQL 操作的批处理；

使用存储过程的好处：

- 代码封装，保证了一定的安全性；
- 代码复用；
- 由于是预先编译，因此具有很高的性能。

命令行中创建存储过程需要自定义分隔符

```sql
delimiter //
//包含 in、out 和 inout 三种参数，对应输入输出参数类型
create procedure myprocedure( out ret int )
    begin
        declare y int;	--声明变量
        select sum(col1)
        from mytable
        into y;
        select y*y into ret;
    end //

delimiter ;
```

## 2. 跳表

是有序集合的底层实现之一。

跳跃表是基于多指针有序链表实现的，可以看成多个有序链表。

![img](DatabaseBasics.assets/beba612e-dc5b-4fc2-869d-0b23408ac90a.png)

在查找时，从上层指针开始查找，找到对应的区间之后再到下一层去查找。例如下图演示了查找 22 的过程。

![img](DatabaseBasics.assets/0ea37ee2-c224-4c79-b895-e131c6805c40.png)

与红黑树等平衡树相比，跳跃表具有以下优点：

- 插入速度非常快速，因为不需要平衡树的旋转操作；
- 更容易实现；
- 支持无锁操作。

