# JAVA Mybatis

## 注解

### @ConstructorArgs @Arg @AutoConstructor  

使用指定构造函数来初始化返回结果

```
@ConstructorArgs({
    @Arg(column="column_name1", javaType=xxx1.class)
    @Arg(column="column_name2", javaType=xxx2.class)
})
```

|                             注解                             | 使用对象 |                        相对应的 XML                        | 描述                                                         |
| :----------------------------------------------------------: | :------: | :--------------------------------------------------------: | :----------------------------------------------------------- |
|                       @CacheNamespace                        |    类    |                         \<cache\>                          | 为给定的命名空间（比如类）配置缓存。属性有：`implemetation`, `eviction`, `flushInterval`, `size`, `readWrite`, `blocking` 和`properties`。 |
|                      @CacheNamespaceRef                      |    类    |                        \<cacheRef\>                        | 参照另外一个命名空间的缓存来使用。属性有：`value`, `name`。如果你使用了这个注解，你应设置 `value` 或者 `name` 属性的其中一个。`value` 属性用于指定 Java 类型而指定命名空间（命名空间名就是指定的 Java 类型的全限定名），`name` 属性（这个属性仅在MyBatis 3.4.2以上版本生效）直接指定了命名空间的名字。 |
|                          @Property                           |   N/A    |                        \<property\>                        | 指定参数值或占位值（placeholder）（能被 `mybatis-config.xml`内的配置属性覆盖）。属性有：`name`, `value`。（仅在MyBatis 3.4.2以上版本生效） |
|                       @ConstructorArgs                       |   方法   |                      \<constructor\>                       | 收集一组结果传递给一个结果对象的构造方法。属性有：`value`，它是形式参数数组。 |
|                             @Arg                             |   N/A    |                   \<arg\><br />\<idArg\>                   | 单参数构造方法，是 ConstructorArgs 集合的一部分。属性有：`id`, `column`, `javaType`, `jdbcType`, `typeHandler`, `select` 和 `resultMap`。id 属性是布尔值，来标识用于比较的属性，和`<idArg>` XML 元素相似。 |
|                      @TypeDiscriminator                      |   方法   |                     \<discriminator\>                      | 鉴别器，指定某个列的值为条件选择`@Results`。属性有：`column`, `javaType`, `jdbcType`, `typeHandler` 和 `cases`。cases 属性是实例数组。 |
|                            @Case                             |   N/A    |                          \<case\>                          | 鉴别器的分支判断语句。属性有：`value`, `type`, `results`。results 属性是结果数组，因此这个注解和实际的 `ResultMap` 很相似，由下面的 `Results` 注解指定。 |
|                           @Results                           |   方法   |                       \<resultMap\>                        | 查询结果映射。属性有：`value`, `id`。value 属性是 `Result` 注解的数组。这个 id 的属性是结果映射的名称。 |
|                           @Result                            |   N/A    |                   \<result\><br />\<id\>                   | 在列和属性或字段之间的单独结果映射。属性有：`id`, `column`, `javaType`, `jdbcType`, `typeHandler`, `one`, `many`。id 属性是一个布尔值，来标识应该被用于比较（和在 XML 映射中的`<id>`相似）的属性。one 属性是单独的联系，和 `<association>` 相似，而 many 属性是对集合而言的，和`<collection>`相似。它们这样命名是为了避免名称冲突。 |
|                             @One                             |   N/A    |                      \<association\>                       | 多对一或一对一属性值映射。属性有：`select`，已映射语句（也就是映射器方法）的全限定名，它可以加载合适类型的实例。`fetchType`会覆盖全局的配置参数 `lazyLoadingEnabled`。注意 联合映射在注解 API中是不支持的。这是因为 Java 注解的限制,不允许循环引用。 |
|                            @Many                             |   N/A    |                      \<collection\>`                       | 多对多哟或一对多集合属性。属性有：`select`，已映射语句（也就是映射器方法）的全限定名，它可以加载合适类型的实例的集合，`fetchType` 会覆盖全局的配置参数 `lazyLoadingEnabled`。注意 联合映射在注解 API中是不支持的。这是因为 Java 注解的限制，不允许循环引用 |
|                           @MapKey                            |  `方法`  |                                                            | 这是一个用在返回值为 Map 的方法上的注解。它能够将存放对象的 List 转化为 key 值为对象的某一属性的 Map。属性有： `value`，填入的是对象的属性名，作为 Map 的 key 值。 |
|                           @Options                           |   方法   |                       映射语句的属性                       | 这个注解提供访问大范围的交换和配置选项的入口，它们通常在映射语句上作为属性出现。`Options` 注解提供了通俗易懂的方式来访问它们，而不是让每条语句注解变复杂。属性有：`useCache=true`, `flushCache=FlushCachePolicy.DEFAULT`, `resultSetType=FORWARD_ONLY`, `statementType=PREPARED`, `fetchSize=-1`, `timeout=-1`, `useGeneratedKeys=false`, `keyProperty="id"`, `keyColumn=""`, `resultSets=""`。值得一提的是， Java 注解无法指定 `null` 值。因此，一旦你使用了 `Options` 注解，你的语句就会被上述属性的默认值所影响。要注意避免默认值带来的预期以外的行为。       注意： `keyColumn` 属性只在某些数据库中有效（如 Oracle、PostgreSQL等）。请在插入语句一节查看更多关于 `keyColumn` 和 `keyProperty` 两者的有效值详情。 |
|        @Insert<br />@Update<br />@Delete<br />@Select        |   方法   | \<insert\><br />\<update\><br />\<delete\><br />\<select\> | 这四个注解分别代表将会被执行的 SQL 语句。它们用字符串数组（或单个字符串）作为参数。如果传递的是字符串数组，字符串之间先会被填充一个空格再连接成单个完整的字符串。这有效避免了以 Java 代码构建 SQL 语句时的“丢失空格”的问题。然而，你也可以提前手动连接好字符串。属性有：`value`，填入的值是用来组成单个 SQL 语句的字符串数组。 |
| @InsertProvider<br />@UpdateProvider<br />@DeleteProvider<br />@SelectProvider |   方法   | \<insert\><br />\<update\><br />\<delete\><br />\<select\> | 允许构建动态 SQL。这些备选的 SQL 注解允许你指定类名和返回在运行时执行的 SQL 语句的方法。（自从MyBatis 3.4.6开始，你可以用 `CharSequence` 代替 `String` 来返回类型返回值了。）当执行映射语句的时候，MyBatis 会实例化类并执行方法，类和方法就是填入了注解的值。你可以把已经传递给映射方法了的对象作为参数，"Mapper interface type" 和 "Mapper method" 会经过 `ProviderContext` （仅在MyBatis 3.4.5及以上支持）作为参数值。（MyBatis 3.4及以上的版本，支持多参数传入）属性有： `type`, `method`。`type` 属性需填入类。`method` 需填入该类定义了的方法名。注意 接下来的小节将会讨论类，能帮助你更轻松地构建动态 SQL。 |
|                            @Param                            |   参数   |                            N/A                             | 如果你的映射方法的形参有多个，这个注解使用在映射方法的参数上就能为它们取自定义名字。若不给出自定义名字，多参数（不包括 `RowBounds` 参数）则先以 "param" 作前缀，再加上它们的参数位置作为参数别名。例如 `#{param1}`, `#{param2}`，这个是默认值。如果注解是 `@Param("person")`，那么参数就会被命名为 `#{person}`。 |
|                          @SelectKey                          |   方法   |                       \<selectKey\>                        | 这个注解的功能与 `<selectKey>` 标签完全一致，用在已经被 `@Insert` 或 `@InsertProvider` 或 `@Update` 或 `@UpdateProvider` 注解了的方法上。若在未被上述四个注解的方法上作 `@SelectKey` 注解则视为无效。如果你指定了 `@SelectKey` 注解，那么 MyBatis 就会忽略掉由 `@Options` 注解所设置的生成主键或设置（configuration）属性。属性有：`statement` 填入将会被执行的 SQL 字符串数组，`keyProperty` 填入将会被更新的参数对象的属性的值，`before` 填入 `true`或 `false` 以指明 SQL 语句应被在插入语句的之前还是之后执行。`resultType` 填入 `keyProperty` 的 Java 类型和用 `Statement`、 `PreparedStatement` 和 `CallableStatement` 中的 `STATEMENT`、 `PREPARED` 或 `CALLABLE` 中任一值填入 `statementType`。默认值是 `PREPARED`。 |
|                          @ResultMap                          |   方法   |                            N/A                             | 这个注解给 `@Select` 或者 `@SelectProvider` 提供在 XML 映射中的 `<resultMap>` 的id。这使得注解的 select 可以复用那些定义在 XML 中的 ResultMap。如果同一 select 注解中还存在 `@Results` 或者 `@ConstructorArgs`，那么这两个注解将被此注解覆盖。 |
|                         @ResultType                          |   方法   |                            N/A                             | 此注解在使用了结果处理器的情况下使用。在这种情况下，返回类型为 void，所以 Mybatis 必须有一种方式决定对象的类型，用于构造每行数据。如果有 XML 的结果映射，请使用 `@ResultMap` 注解。如果结果类型在 XML 的 `<select>` 节点中指定了，就不需要其他的注解了。其他情况下则使用此注解。比如，如果 @Select 注解在一个将使用结果处理器的方法上，那么返回类型必须是 void 并且这个注解（或者@ResultMap）必选。这个注解仅在方法返回类型是 void 的情况下生效。 |
|                            @Flush                            |   方法   |                            N/A                             | 如果使用了这个注解，定义在 Mapper 接口中的方法能够调用 `SqlSession#flushStatements()` 方法。（Mybatis 3.3及以上） |