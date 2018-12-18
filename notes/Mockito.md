# Mockito

```java
// 创建模拟对象
MockTarget mockTarget = Mockito.mock(MockTarget.class);

// 验证方法执行
//
// 验证执行了模拟对象的 method 方法，且参数为 arg
// arg 可以是具体的对象，也可以用 Mockito.any*() 方法指定某一类对象
// verify() 可以重载第2参数指定方法需要验证执行的次数，默认为1次
Mockito.verify(mockTarget).method(arg...);

// 指定方法返回值
//
// 当模拟对象执行指定方法时返回 returnObj
Mockito.when(mockTarger.method(arg...)).thenReturn(returnObj);

// 指定方法行为
//
// 当模拟对象执行指定方法 method() 时，执行 answer() 方法
Mockito.doAnswer(new Answer() {
    @Override
    public Object answer(InvocationOnMock invocation) throws Throwable {
        Object[] arguments = invocation.getArguments();
		//do sth
        return null;
    }
}).when(mockTarget).method(arg...);
```

