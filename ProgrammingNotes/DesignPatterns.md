# 设计模式

## 0. 六大设计原则

* 接口隔离（接口功能分离）
* 单一职责（高内聚低耦合的指导方针）
* 开闭原则（对扩展开放，对修改关闭）
* 依赖倒置（针对接口编程，实现依赖接口，而不是接口依赖实现）
* 里氏替换（所有父类出现的地方可以用子类替换）
* 迪米特法则（不要和陌生人说话）

## 1. 创建型

### 1.1 单例模式

即类只生成一个实例。有两种实现：懒汉式（需要时实例化）和饿汉式（类加载就实例化）。

**懒汉式实现-线程不安全**

```java
public class Singleton {

    private static Singleton uniqueInstance;

    private Singleton() {
    }

    public static Singleton getUniqueInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new Singleton();
        }
        return uniqueInstance;
    }
}
```

**懒汉式实现-线程安全**

```java
public class Singleton {

    private static Singleton uniqueInstance;

    private Singleton() {
    }

    public static Singleton getUniqueInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new Singleton();
        }
        return uniqueInstance;
    }
}
```

**饿汉式实现**

饿汉式实现就没有线程不安全的顾虑了。

```java
private static Singleton uniqueInstance = new Singleton()
```

### 1.2 工厂模式

#### 1.2.1 简单工厂模式

在创建一个对象时不向客户暴露内部细节。

简单工厂不是设计模式，更像是一种编程习惯。它把实例化的操作单独放到一个类中，这个类就成为简单工厂类，让简单工厂类来决定应该用哪个子类来实例化

```java
public class ProductFactory {
    
    public Product createProduct(int type){

        Product product;
        
        if (type == 1) {
            product = new ConcreteProduct1();
        } else if (type == 2) {
            product = new ConcreteProduct2();
        } else {
            product = new ConcreteProduct();
        }
        
        return product;
    }
}
```

#### 1.2.2 工厂方法模式

定义了一个创建对象的接口，但由子类决定要实例化哪个类。工厂方法把实例化推迟到子类。 实现工厂和对象创建的解耦。

```java
public abstract class Factory {
    abstract public Product factoryMethod();
    public void doSomethind() {
        Product product = factoryMethod();
        // do something with the product
    }
}

public class ConcreteFactory1 extends Factory {
    public Product factoryMethod() {
        return new ConcreteProduct1();
    }
}
public class ConcreteFactory2 extends Factory {
    public Product factoryMethod() {
        return new ConcreteProduct2();
    }
}
```

#### 1.2.3 抽象工厂模式

抽象工厂模式提供一个接口，用于创建相关的对象家族。 抽象工厂的每一个实现都可以看作是工厂方法模式，每个工厂方法模式产出一个对象，这样抽象工厂模式就可以产出来一系列对象了。

```java
public abstract class AbstractFactory {
    abstract AbstractProductA createProductA();
    abstract AbstractProductB createProductB();
}


public class ConcreteFactory1 extends AbstractFactory {
    AbstractProductA createProductA() {
        return new ProductA1();
    }

    AbstractProductB createProductB() {
        return new ProductB1();
    }
}

public class ConcreteFactory2 extends AbstractFactory {
    AbstractProductA createProductA() {
        return new ProductA2();
    }

    AbstractProductB createProductB() {
        return new ProductB2();
    }
}
```

## 2. 行为型

### 2.1 观察者模式

观察者定义了主题对象和观察者对象之间的一对多关系，当主题对象改变状态时，所有观察者都将收到通知。

典型接口：

```java
/* 主题 */
public interface Subject {
    void registerObserver(Observer o);
    void removeObserver(Observer o);
    void notifyObservers();
}
/* 观察者 */
public interface Observer {
    void update();
}
```

## 3. 结构性

### 3.1 装饰者模式

装饰者模式动态的将责任附加到对象上，遵守对扩展开放，对修改关闭的原则。装饰者和被装饰者拥有相同的超类，每个装饰者内部持有被装饰者的实例。

典型示例：

```java
public interface Component {
    void methodA();
    void methodB();
}

public class Decorator {
    Component wrappedObj;
    
    public void methodA() {
        //...
    }
    public void methodB() {
        //...
    }
    
    //其他扩展方法
    
} 
```

### 3.2 适配器模式

适配器模式将一个类的接口，转换成客户期望的另一个接口。即实现一个接口的转换。假设你需要一只鸭子，而现在只有一只火鸡，那么就可是实现一个鸭子接口，内含一个火鸡对象，然后实现相应方法的转换。

### 3.3 代理模式