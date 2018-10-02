# REVIEWS

## 1. JAVA

1. 集合类
   1. HashMap 原理 —— get, put, resize(re) 16，8，6，64
   2. ConcurrentHashMap 原理 —— get, put, resize
   3. TreeMap 
   4. ArrayList（Vector，Stack）与 LinkedList 
   5. HashSet，TreeSet
2. 多线程
   1. 实现线程的方法（三种）
   2. 线程的六种方法
   3. 线程池原理
   4. synchronize 与 lock
   5. synchronize 工作原理
   6. 各种锁
3. IO
   1. BIO
   2. NIO
   3. AIO
4. 基础
   1. 关键字：static，final
   2. 

///////////////////////////////////////// SEP ////////////////////////////////////////

3. 设计模式

   答：2+1+3

4. 设计原则

   答：接单开，依里迪

5. 新建一个线程的方法，具体实现；Thread 类的方法有哪些，哪些可中断

   答：三种；6个（run, start, join, interrupt, sleep, yelid），进入阻塞态的都可以中断（join, sleep, 以及 Object,wait）

6. 线程池的关键参数解释，及四种简便线程池创建类

7. 阻塞队列原理，手写一个阻塞队列

8. synchronized 使用方法与锁膨胀过程

9. synchronized 与 ReentrantLock 

10. wait() 与 sleep() 

11. 知道的并发容器和同步工具类

    答：concurrent\*，copyOnWrite\*；Unsave.\*，Atomic\*，闭锁，循环栅栏

12. 闭锁和循环栅栏的实现

13. java 相关的锁

    答：原生同步锁，可重入锁，读写锁（读者优先/写者优先）

14. 两种动态代理，它们的区别

15. ThreadLocal的内存泄露问题

16. 父子类初始化顺序

17. 重名类加载机制

18. BIO - NIO - AIO

19. NIO 的三种关键角色

20. 常用的 IO 类

21. 集合类

22. HashMap 与 HashTable 与 ConcurrentHashMap

23. LInkedList 与 ArrayList

24. ArrayList 与 Arrays.asList() 与 Vector

25. String 与 StringBuffer 与 StringBuilder

26. 将线程不安全的集合转为线程安全的集合

27. 抽象方法与接口

28. Object 的通用方法（四个）

29. final 、static 、finalize() 作用

30. 静态代理与动态代理

31. 哪个类可以用作LRU

32. 有哪几种异常，分别举例

33. 四种引用，它们的作用

34. 并发情况下 HashMap 的问题

35. JVM 内存布局，堆的内存布局

36. 虚拟机方法区的演变

37. -Xmx，-Xms，-Xmn（-XX: NewSIze, -XX:MaxNewSize），-Xss，-XX:SurvivorRatio, -XX:NewRatio N

38. JVM 调优

39. 对象内存布局，OOP-KLASS

40. 对象存活判断，finalize() 方法处理

41. 垃圾回收算法

42. 内存分配与回收策略

43. 分带或分区回收的可达性分析过程

44. 并发标记过程（三色标记法）

45. 垃圾回收器（所有），回收过程

46. 类加载过程

47. 类加载器和类加载机制，优点

48. OSGI 类加载机制

49. java 内存模型

50. volatile 两层语义

51. Spring IOC 实现，优点

52. Spring AOP 实现，AOP 思想

53. BeanFactory 和 ApplicationContext

54. Bean 的配置方式，生命周期

55. Spring 中用到的设计模式

56. Spring 循环依赖的解决

## **2**. 数据库

1. ACID 的概念及理解

2. 并发一致性出现的问题

3. 封锁类型（关于行的与关于表的）

4. 封锁协议与事物的隔离级额别

5. sql 语句：选出学生平均成绩前三名的 sql 语句

    ```sql
    # 第一种
    SELECT name, AVG(grade) FROM grades GROUP BY name ORDER BY AVG(grade) DESC LIMIT 0,3
    
    # 第二种
    SELECT * FROM (SELECT name, AVG(grade) AS grade FROM grades GROUP BY name) AS t 
    ORDER BY t.grade DESC LIMIT 0,3
    ```

6. MySQL 的用的两个引擎，及它们区别。还知道更多其他的引擎吗？

    区别记忆口诀：“事外行”-“可压空间查询快” 

7. 索引的优点（三点）

8. 常用的索引结构（四种），及优点

9. 索引失效，sql优化（三点）

10. 覆盖索引

11. 数据库分表方式，分表带来的问题

12. MySQL主从复制过程，及读写分离的好处

13. 数据的连接方式，如何查看当前数据库的连接数量

14. MVCC

15. sql 分析方法（慢查询日志，explain，profile）

16. 表数据量过大引起查询慢的解决方法

17. 数据库设计范式

18. MySQL 默认的连接方式

     答：应该是长连接，因为 MySQL 可以配置连接超时时间。

19. 事务是什么，事务回滚如何实现

## 3. 网络

1. OSI网络模型，数据包传递过程
2. TCP/IP模型，各层典型协议
3. HTTP 1.0 与 1.1 与 2
4. HTTP 工作流程
5. HTTP 请求和应答报文
6. HTTP 请求类型
7. HTTP 强制缓存与协商缓存
8. TCP 三次握手，两次可以吗
9. TCP 四次挥手，TIME_WAIT 存在的原因
10. TCP 流量控制和拥塞控制
11. TCP 的四种计时器
12. TCP 的粘包与拆包
13. TCP 与 UDP 的区别，哪些协议使用了它们
14. 视频直播和视频应该用 TCP 还是 UDP
15. DNS 工作过程
16. IP 子网的字段，网络地址与广播地址
17. 单播，组播，广播
18. ARP 工作过程
19. ICMP 工作过程
20. IP数据包传输过程
21. 路由器与交换机
22. socket 每个方法对应 TCP 的状态

## 4. 操作系统

1. 读写锁。公平竞争，读者优先和写者优先的实现
2. 分页式内存管理原理

## 5. 算法和数据结构

1. 堆排序，如何建造初始堆，为什么这样建

2. 手写跳表

## 6. Linux

1. 文件系统 inode 结构，如何存储大文件

2. 文本查找的命令

3. 可以查找文件的5个命令，它们的区别

   答：locate, find -name, whereis, which, type 

4. 查看进程的命令

   答：ps -aux, pstree

5. 查看端口号的命令

   答：netstat

6. 查看内存的命令

   答：free -k, free -m, top

7. 子进程创建的三种方式

8. fork 共享的资源
   答：已打开文件，用户和用户组ID

9. 孤儿进程与僵尸进程

10. 六种 IPC

11. select, poll, epoll
    答：数量限制，触发方式，事务检测

12. apache 与 ngnix 的 IO 模型
    答：select 与 epoll

## 7. 分布式

1. 终极一致性协议（两种）

   答：Paxos 与 Raft 的原理。

2. 分布式锁的实现方式（三种）

   答：MySQL，Redis，Zookeeper。各自的优缺点

3. 分布式事物的实现方式（四种）

   答：2PC，3PC，TCC，消息队列

4. 分布式 Session 的实现方式

   答：反向代理使同一session请求同一服务器（单点失效）；服务器之间 Session 同步（同步消耗）；同一存储 Redis（多了一次网络请求）

5. CAP 与 BASE

6. 负载均衡的实现方式，优缺点。ngnix 用到了哪几种。

7. 数据分片方式

## 8. Redis 与 Memcached

1. redis 可以存储的类型
   答：五种
2. 为什么使用Redis
   答：性能；并发。
3. 使用缓存会存在的问题，如何解决
   答：双写一致性；缓存穿透，缓存击穿，缓存雪崩；并发竞争key
4. redis 单线程性能高的原因
   答：三点
5. redis 五种基本类型和底层实现
6. redis 与 memchached 区别
   答：类型；线程；持久化
7. redis 过期删除机制
   答：定期抽样删除 + 惰性删除。
8. redis 内存淘汰策略
   答：六种
9. 两种持久化机制，优缺点
   答：RDB（适合**备**份，恢复**快**；save**阻**塞，大备份**耗**时，**丢**失大）；AOF（**丢**失小；文件**大**，恢复**慢**）
10. AOF 重写步骤
       答：三步
11. 主从复制，创建命令，复制过程
    答： slaveof；三步
12. redis cluster
13. redis 分片的三种方式
14. redis 事物原理和使用

## 9. Kafka 与 RocketMQ

1. Kafka 的主从同步
2. Kafka leader 的选举策略与选举过程

## 10. Zookeeper

1. 层次命名空间
2. Znode 类型
3. Zookeeper Leader选举
4. 主从同步策略

## 11. Hadoop

## 12. HBase

## 13. Spark 

