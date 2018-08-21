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

**（15）BIO - NIO - AIO**

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

**（27）静态代理与动态代理**

**（28）哪个类可以用作LRU**

**（29）有哪几种异常，分别举例**

**（30）四种引用，它们的作用**

**（31）并发情况下 HashMap 的问题**

**（32）JVM 内存布局，堆的内存布局**

**（33）虚拟机方法区的演变**

**（34）-Xmx，-Xms，-Xmn（-XX: NewSIze, -XX:MaxNewSize），-Xss，-XX:SurvivorRatio, -XX:NewRatio N**

（35）JVM 调优

**（36）对象内存布局，OOP-KLASS**

**（37）对象存活判断，finalize() 方法处理**

**（38）垃圾回收算法**

**（39）内存分配与回收策略**

**（40）分带或分区回收的可达性分析过程**

**（41）并发标记过程（三色标记法）**

**（42）垃圾回收器（所有），回收过程**

**（43）类加载过程**

**（44）类加载器和类加载机制，优点**

OSGI 类加载机制

**（45）java 内存模型**

**（46）volatile 两层语义**

（47）Spring IOC 实现，优点

（48）Spring AOP 实现，AOP 思想

（49）BeanFactory 和 ApplicationContext

**（50）Bean 的配置方式，生命周期**

（51）Spring 中用到的设计模式

（52）Spring 循环依赖的解决

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

**（12）MySQL主从复制过程，及读写分离的好处**

**（13）数据的连接方式，如何查看当前数据库的连接数量**

**（14）MVCC**

（15）sql 分析方法（慢查询日志，explain，profile）

（16）表数据量过大引起查询慢的解决方法

（17）数据库设计范式

## 3. 网络

**（1）OSI网络模型，数据包传递过程**

**（2）TCP/IP模型，各层典型协议**

**（3）HTTP 1.0 与 1.1 与 2**

**（4）HTTP 工作流程**

**（5）HTTP 请求和应答报文**

**（6）HTTP 请求类型**

**（7）HTTP 强制缓存与协商缓存**

**（8）TCP 三次握手，两次可以吗**

**（9）TCP 四次挥手，TIME_WAIT 存在的原因**

**（10）TCP 流量控制和拥塞控制**

**（11）TCP 的四种计时器**

**（12）TCP 的粘包与拆包**

**（13）TCP 与 UDP 的区别，哪些协议使用了它们**

**（14）视频直播和视频应该用 TCP 还是 UDP**

（15）DNS 工作过程

**（16）IP 子网的字段，网络地址与广播地址**

**（17）单播，组播，广播**

**（18）ARP 工作过程**

**（19）ICMP 工作过程**

**（20）IP数据包传输过程**

**（21）路由器与交换机**

（22）socket 每个方法对应 TCP 的状态

## 4. Linux

1. 管道

## 5. 分布式

**（1）分布式锁的实现方式**

**（2）分布式事物的实现方式**

**（3）分布式 Session 的实现方式**

**（4）负载均衡的实现方式，ngnix 用到了哪几种**

**（5）CAP 与 BASE**

## 6. Redis 与 Memcached

1. 为什么使用内存数据库
2. 使用缓存会存在的问题
3. redis 与 memchached 区别
4. redis 单线程性能高的原因
5. redis 过期删除机制
6. redis 内存淘汰策略
7. 两种持久化机制，优缺点
8. 主从复制 
9. redis 事物

## 7. Kafka 与 RocketMQ

1. Kafka 的主从同步
2. Kafka leader 的选举策略与选举过程

## 8. Zookeeper

1. 层次命名空间
2. Znode 类型
3. Zookeeper Leader选举
4. 主从同步策略