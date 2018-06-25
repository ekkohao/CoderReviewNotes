# Java 多线程与并发 #

## 1. 线程安全 ##

### 1.1 常见的线程安全的类 ###

1. 通过`synchronized` 关键字给方法加上内置锁来实现线程安全 
   **Timer，TimerTask，Vector，Stack，HashTable，StringBuffer**
2. 原子类`Atomicxxx`—包装类的线程安全类 
   如**AtomicLong，AtomicInteger等等** 
   **Atomicxxx 是通过Unsafe 类的native方法实现线程安全的**
3. **BlockingQueue** 和`BlockingDeque` 
   `BlockingDeque`接口继承了`BlockingQueue`接口， 
   `BlockingQueue` 接口的实现类有**ArrayBlockingQueue** ，**LinkedBlockingQueue** ，**PriorityBlockingQueue** 而`BlockingDeque`接口的实现类有`LinkedBlockingDeque` 
   **BlockingQueue和BlockingDeque 都是通过使用定义为final的ReentrantLock作为类属性显式加锁实现同步的**
4. **CopyOnWriteArrayList**和 **CopyOnWriteArraySet** 
   `CopyOnWriteArraySet`的内部实现是在其类内部声明一个final的`CopyOnWriteArrayList`属性，并在调用其构造函数时实例化该`CopyOnWriteArrayList`，`CopyOnWriteArrayList`采用的是显式地加上`ReentrantLock`实现同步，而`CopyOnWriteArrayList`容器的线程安全性在于在每次修改时都会创建并重新发布一个新的容器副本，从而实现可变性。
5. `Concurrentxxx` 
   最常用的就是**ConcurrentHashMap**，当然还有`ConcurrentSkipListSet`和`ConcurrentSkipListMap`等等。 
   `ConcurrentHashMap`使用了一种完全不同的加锁策略来提供更高的并发性和伸缩性。`ConcurrentHashMap`并不是将每个方法都在同一个锁上同步并使得每次只能有一个线程访问容器，而是使用一种粒度更细的加锁机制——**分段锁**来实现更大程度的共享
   在这种机制中，任意数量的读取线程可以并发访问Map，执行读取操作的线程和执行写入操作的线程可以并发地访问Map，并且一定数量的写入线程可以并发地修改Map，这使得在并发环境下吞吐量更高，而在单线程环境中只损失非常小的性能
6. **ThreadPoolExecutor** 
   `ThreadPoolExecutor`也是使用了`ReentrantLock`显式加锁同步
7. `Collections`中的`synchronizedCollection(Collection c)`方法可将一个集合变为线程安全，其内部通过`synchronized`关键字加锁同步

