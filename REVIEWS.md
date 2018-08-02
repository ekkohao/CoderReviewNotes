# REVIEWS

## 1. JAVA

**（1）设计模式**

**（2）设计原则**

**（3）新建一个线程的方法；Thread 类的方法有哪些，哪些可中断**

**（4）线程池的关键参数解释，及四种简便线程池创建类**

**（5）synchronized 使用方法与锁膨胀过程**

**（6）synchronized 与 ReentrantLock **

**（7）wait() 与 sleep() **

**（8）知道的并发容器**

**（9）同步工具类**

**（10）java 相关的锁**

**（11）两种动态代理，它们的区别**

**（12）ThreadLocal的内存泄露问题**

**（13）父子类初始化顺序**

**（14）重名类加载机制**

**（15）BOI - NIO - AIO**

**（16）NIO 的三种关键角色**

**（17）常用的 IO 类**

**（18）集合类**

**（19）HashMap 与 HashTable 与 ConcurrentHashMap**

**（20）LInkedList 与 ArrayList**

**（21）ArrayList 与 Arrays.asList() 与 Vector**

**（22）String 与 StringBuffer 与 StringBuilder**

**（23）将线程不安全的集合转为线程安全的集合**

**（24）抽象方法与接口**

**（25）Object 的通用方法（四个）**

**（26）final 、static 、finalize() 作用**

## 2. 数据库

**（1）ACID 的概念及理解**

**（2）并发一致性出现的问题**

**（3）封锁类型（关于行的与关于表的）**

**（4）封锁协议与事物的隔离级额别**

**（5）sql 语句：选出学生平均成绩前三名的 sql 语句**

```sql
# 第一种
SELECT name, AVG(grade) FROM grades GROUP BY name ORDER BY AVG(grade) DESC LIMIT 0,3

# 第二种
SELECT * FROM (SELECT name, AVG(grade) AS grade FROM grades GROUP BY name) AS t 
ORDER BY t.grade DESC LIMIT 0,3
```

**(6) MySQL 的用的两个引擎，及它们区别。还知道更多其他的引擎吗？**

区别记忆口诀：“事外行”-“可压空间查询快” 

**（7）索引的优点（三点）**

**（8）常用的索引结构（四种），及优点**

**（9）索引失效，sql优化（三点）**

**（10）覆盖索引**

**（11）数据库分表方式，分表带来的问题**

**（12）MySQL主从复制，及读写分离的好处**

**（13）数据的连接方式，如何查看当前数据库的连接数量**

**（14）MVCC**

### 3. 分布式

**（1）分布式锁的实现方式**

**（2）分布式事物的实现方式**

**（3）分布式 Session 的实现方式**

**（4）负载均衡的实现方式，ngnix 用到了哪几种**

**（5）CAP 与 BASE**