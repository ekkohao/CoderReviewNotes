# Kafka

## 1. 概述

### 1.1 什么是Kafka

Kafka 是最初由 Linkedin 公司开发，用 scala 语言编写，是一个分布式、支持分区的（partition）、多副本的（replica），基于zookeeper 协调的分布式消息系统。

它的最大的特性就是可以实时的处理大量数据以满足各种需求场景：比如基于 hadoop 的批处理系统、低延迟的实时系统、storm/Spark 流式处理引擎，web/nginx 日志、访问日志，消息服务等等，Linkedin 于 2010年贡献给了Apache基金会并成为顶级开源 项目。 

### 1.2 Kafka 的特性

* 高吞吐，低延迟，每秒可处理几十万条消息
* 可扩展性，支持集群热扩展
* 持久性，消息被持久化到本地磁盘，并且支持数据备份防止数据丢失
* 容错性，允许n - 1个结点失败，n 为副本结点数量
* 高并发，支持数千个客户端同时读写
* 有序性，Kafka 很好的保证的消息按照到达的顺序消费

### 1.3 Kafka 的使用场景

**日志收集**

一个公司可以用Kafka可以收集各种服务的log，通过kafka以统一接口服务的方式开放给各种consumer，例如hadoop、Hbase、Solr等。

**消息系统**

解耦和生产者和消费者、缓存消息等。

**用户活动跟踪**

Kafka经常被用来记录web用户或者app用户的各种活动，如浏览网页、搜索、点击等活动，这些活动信息被各个服务器发布到kafka的topic中，然后订阅者通过订阅这些topic来做实时的监控分析，或者装载到hadoop、数据仓库中做离线分析和挖掘。

**运营指标**

Kafka也经常用来记录运营监控数据。包括收集各种分布式应用的数据，生产各种操作的集中反馈，比如报警和报告。

**流式处理**

比如spark streaming和storm

### 1.4 常用名词

**topic**

每条消息都属于一个 topic，使用 topic 归纳消息。Kafka 对每个 topic 的日志都进行了 partition，每个 partition 使用连续的 offset 存储消息，这些消息都是只读的。集群保留所有的发布消息直到设置的过期时间（一般为2天），无论是否被消费。

**producer**

生产者，生产消息到指定的 topic 中，并决定发布到哪个分区中。可以负载均衡选择分区，也可以使用分区函数。

**consumer**

消费者，接收消息的程序。根据 offset 判断当前需要消费的消息位置。offset 值一般使用存储在 zookeeper 结点中。

消费有队列模式和发布-订阅两种模式。

* 队列模式，多个消费者可以同时从服务端读取消息，但每个消息只会被一个消费者读到。
* 发布-订阅，消息被广播到所有的消费者中，每个消费者可以选择加入一个组，同一组内的消费者竞争消息，每条消息只会被一个组员读到。如果所有的消费的消费者都在一个组内就相当于是队列模式。

**broker**

代理人或中间人，kafka以集群方式运行，可以由一个或多个服务组成，每个服务叫做一个broker。每个 broker 管理着一些 partition。

**partition，leader && follower**

每个 partition 都有一个 leader 和若干 follower 副本，一般 follower 保存在主leader所在 broker 的后面几个 broker 中。当 leader 挂掉后，会在 follower 中选举出新的 broker 成为 leader。leader 负责它所属 partition 的读和写。

### 1.5 Leader 的副本同步

所有的 follower 会开启一个线程消费者线程消费 leader 的日志来达到同步，日志中的消息和顺序都和 leader 中的一致。

许多分布式的消息系统自动的处理失败的请求，它们对一个节点是否着（alive）”有着清晰的定义。Kafka判断一个节点是否活着有两个条件：

1. 节点必须可以维护和ZooKeeper的连接，Zookeeper通过心跳机制检查每个节点的连接。
2. 如果节点是个follower,他必须能及时的同步leader的写操作，延时不能太久。

符合以上条件的节点准确的说应该是”同步中的（in sync）“，而不是模糊的说是“活着的”或是“失败的”。Leader 会追踪所有“同步中”的节点，一旦一个 down 掉了，或是卡住了，或是延时太久，leader就会把它移除。至于延时多久算是“太久”，是由参数 replica.lag.max.messages 决定的，怎样算是卡住了，怎是由参数replica.lag.time.max.ms 决定的。

只有当消息被所有的副本加入到日志中时，才算是“committed”，只有 committed 的消息才会发送给 consumer，这样就不用担心一旦 leader down 掉了消息会丢失。Producer 也可以选择是否等待消息被提交的通知，这个是由参数 acks 决定的。

所以，Kafka保证只要有一个“同步中”的节点，“committed”的消息就不会丢失。

### 1.6 Leader 的选择

Kafka的核心是日志文件，日志文件在集群中的同步是分布式数据系统最基础的要素。

**传统方法**

一旦leader down掉了，需要在followers中选择一个新的leader.但是followers本身有可能延时太久或者crash，所以必须选择高质量的follower作为leader.必须保证，一旦一个消息被提交了，但是leader down掉了，新选出的leader必须可以提供这条消息。大部分的分布式系统采用了多数投票法则选择新的leader,对于多数投票法则，就是根据所有副本节点的状况动态的选择最适合的作为leader.Kafka并不是使用这种方法。

**Kafka的方法**

Kafka动态维护了一个同步状态的副本的集合（a set of in-sync replicas），简称ISR，在这个集合中的节点都是和leader保持高度一致的，任何一条消息必须被这个集合中的每个节点读取并追加到日志中了，才会通知外部这个消息已经被提交了。因此这个集合中的**任何一个节点随时都可以被选为 leader**。ISR 在 ZooKeeper 中维护。ISR中有f+1个节点，就可以允许在f个节点down掉的情况下不会丢失消息并正常提供服。ISR的成员是动态的，如果一个节点被淘汰了，当它重新达到“同步中”的状态时，他可以重新加入ISR。这种leader的选择方式是非常快速的，适合kafka的应用场景。

一个邪恶的想法：如果所有节点都down掉了怎么办？Kafka对于数据不会丢失的保证，是基于至少一个节点是存活的，一旦所有节点都down了，这个就不能保证了。

实际应用中，当所有的副本都down掉时，必须及时作出反应。可以有以下两种选择:

1. 等待ISR中的任何一个节点恢复并担任leader。
2. 选择所有节点中（不只是ISR）第一个恢复的节点作为leader.

这是一个在可用性和连续性之间的权衡。如果等待ISR中的节点恢复，一旦ISR中的节点起不起来或者数据丢失了，那集群就永远恢复不了了。如果等待 ISR 以外的节点恢复，这个节点的数据就会被作为线上数据，有可能和真实的数据有所出入，因为有些数据它可能还没同步到。Kafka目前选择了第二种策略，在未来的版本中将使这个策略的选择可配置，可以根据场景灵活的选择。

这种窘境不只Kafka会遇到，几乎所有的分布式数据系统都会遇到。

**leader 选择过程**

leader 的选择过程决定了系统发生故障时的空窗期有多久。Kafka 选择一个节点作为“controller”,当发现有节点down掉的时候它负责在 follower 分区的所有节点中选择新的 leader，这使得 Kafka 可以批量的高效的管理所有分区节点的主从关系。如果controller down掉了，活着的节点中的一个会被切换为新的 controller。 

### 1.7 分布式

kafka使用zookeeper来存储一些meta信息,并使用了zookeeper watch机制来发现meta信息的变更并作出相应的动作(比如consumer失效,触发负载均衡等)

Broker node registry: 当一个kafka broker启动后,首先会向zookeeper注册自己的节点信息(临时znode),同时当broker和zookeeper断开连接时,此znode也会被删除.

Broker Topic Registry: 当一个broker启动时,会向zookeeper注册自己持有的topic和partitions信息,仍然是一个临时znode.

Consumer and Consumer group: 每个consumer客户端被创建时,会向zookeeper注册自己的信息;此作用主要是为了"负载均衡".一个group中的多个consumer可以交错的消费一个topic的所有partitions;简而言之,保证此topic的所有partitions都能被此group所消费,且消费时为了性能考虑,让partition相对均衡的分散到每个consumer上.

Consumer id Registry: 每个consumer都有一个唯一的ID(host:uuid,可以通过配置文件指定,也可以由系统生成),此id用来标记消费者信息.

Consumer offset Tracking: 用来跟踪每个consumer目前所消费的partition中最大的offset.此znode为持久节点,可以看出offset跟group_id有关,以表明当group中一个消费者失效,其他consumer可以继续消费.

Partition Owner registry: 用来标记partition正在被哪个consumer消费.临时znode。此节点表达了"一个partition"只能被group下一个consumer消费,同时当group下某个consumer失效,那么将会触发负载均衡(即:让partitions在多个consumer间均衡消费,接管那些"游离"的partitions)

当consumer启动时,所触发的操作:

A) 首先进行"Consumer id Registry";

B) 然后在"Consumer id Registry"节点下注册一个watch用来监听当前group中其他consumer的"leave"和"join";只要此znode path下节点列表变更,都会触发此group下consumer的负载均衡.(比如一个consumer失效,那么其他consumer接管partitions).

C) 在"Broker id registry"节点下,注册一个watch用来监听broker的存活情况;如果broker列表变更,将会触发所有的groups下的consumer重新balance.

总结:

1) Producer端使用zookeeper用来"发现"broker列表,以及和Topic下每个partition leader建立socket连接并发送消息.

2) Broker端使用zookeeper用来注册broker信息,已经监测partition leader存活性.

3) Consumer端使用zookeeper用来注册consumer信息,其中包括consumer消费的partition列表等,同时也用来发现broker列表,并和partition leader建立socket连接,并获取消息

### 1.8 log

每个log entry格式为"4个字节的数字N表示消息的长度" + "N个字节的消息内容";每个日志都有一个offset来唯一的标记一条消息,offset的值为8个字节的数字,表示此消息在此partition中所处的起始位置..每个partition在物理存储层面,有多个log file组成(称为segment).segment file的命名为"最小offset".kafka.例如"00000000000.kafka";其中"最小offset"表示此segment中起始消息的offset.

获取消息时,需要指定offset和最大chunk尺寸,offset用来表示消息的起始位置,chunk size用来表示最大获取消息的总长度(间接的表示消息的条数).根据offset,可以找到此消息所在segment文件,然后根据segment的最小offset取差值,得到它在file中的相对位置,直接读取输出即可.

![20170107211730692](KafKa.assets/20170107211730692-1531844848243.png)

### 1.9 消息传输一致

Kafka提供3种消息传输一致性语义：最多1次，最少1次，恰好1次。

最少1次：可能会重传数据，有可能出现数据被重复处理的情况;

最多1次：可能会出现数据丢失情况;

恰好1次：并不是指真正只传输1次，只不过有一个机制。确保不会出现“数据被重复处理”和“数据丢失”的情况。

at most once: 消费者fetch消息,然后保存offset,然后处理消息;当client保存offset之后,但是在消息处理过程中consumer进程失效(crash),导致部分消息未能继续处理.那么此后可能其他consumer会接管,但是因为offset已经提前保存,那么新的consumer将不能fetch到offset之前的消息(尽管它们尚没有被处理),这就是"at most once".

at least once: 消费者fetch消息,然后处理消息,然后保存offset.如果消息处理成功之后,但是在保存offset阶段zookeeper异常或者consumer失效,导致保存offset操作未能执行成功,这就导致接下来再次fetch时可能获得上次已经处理过的消息,这就是"at least once".

"Kafka Cluster"到消费者的场景中可以采取以下方案来得到“恰好1次”的一致性语义：

最少1次＋消费者的输出中额外增加已处理消息最大编号：由于已处理消息最大编号的存在，不会出现重复处理消息的情况。

### 1.10 持久化

kafka使用文件存储消息(append only log),这就直接决定kafka在性能上严重依赖文件系统的本身特性.且无论任何OS下,对文件系统本身的优化是非常艰难的.文件缓存/直接内存映射等是常用的手段.因为kafka是对日志文件进行append操作,因此磁盘检索的开支是较小的;同时为了减少磁盘写入的次数,broker会将消息暂时buffer起来,当消息的个数(或尺寸)达到一定阀值时,再flush到磁盘,这样减少了磁盘IO调用的次数.对于kafka而言,较高性能的磁盘,将会带来更加直接的性能提升。

### 1.11 Topic模型

其他JMS实现,消息消费的位置是有prodiver保留,以便避免重复发送消息或者将没有消费成功的消息重发等,同时还要控制消息的状态.这就要求JMS broker需要太多额外的工作.在kafka中,partition中的消息只有一个consumer在消费,且不存在消息状态的控制,也没有复杂的消息确认机制,可见kafka broker端是相当轻量级的.当消息被consumer接收之后,consumer可以在本地保存最后消息的offset,并间歇性的向zookeeper注册offset.由此可见,consumer客户端也很轻量级。

kafka中consumer负责维护消息的消费记录,而broker则不关心这些,这种设计不仅提高了consumer端的灵活性,也适度的减轻了broker端设计的复杂度;这是和众多JMS prodiver的区别.此外,kafka中消息ACK的设计也和JMS有很大不同,kafka中的消息是批量(通常以消息的条数或者chunk的尺寸为单位)发送给consumer,当消息消费成功后,向zookeeper提交消息的offset,而不会向broker交付ACK.或许你已经意识到,这种"宽松"的设计,将会有"丢失"消息/"消息重发"的危险.

### 1.12 Kafka 与 Zookeeper

 **Zookeeper 协调控制**

1. 管理broker与consumer的动态加入与离开。(Producer不需要管理，随便一台计算机都可以作为Producer向Kakfa Broker发消息)
2. 触发负载均衡，当broker或consumer加入或离开时会触发负载均衡算法，使得一个consumer group内的多个consumer的消费负载平衡。（因为一个comsumer消费一个或多个partition，一个partition只能被一个consumer消费）
3. 维护消费关系及每个partition的消费信息。

**Zookeeper上的细节**

1. 每个broker启动后会在zookeeper上注册一个临时的broker registry，包含broker的ip地址和端口号，所存储的topics和partitions信息。
2. 每个consumer启动后会在zookeeper上注册一个临时的consumer registry：包含consumer所属的consumer group以及订阅的topics。
3. 每个consumer group关联一个临时的owner registry和一个持久的offset registry。对于被订阅的每个partition包含一个owner registry，内容为订阅这个partition的consumer id；同时包含一个offset registry，内容为上一次订阅的offset。

## 2. Kafka拓扑结构

![img](https://img-blog.csdn.net/20170107211822608?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU3MzEzMw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

​       一个典型的Kafka集群中包含若干Producer（可以是web前端FET，或者是服务器日志等），若干broker（Kafka支持水平扩展，一般broker数量越多，集群吞吐率越高），若干ConsumerGroup，以及一个Zookeeper集群。Kafka通过Zookeeper管理Kafka集群配置：选举Kafka broker的leader，以及在Consumer Group发生变化时进行rebalance，因为consumer消费kafka topic的partition的offsite信息是存在Zookeeper的。Producer使用push模式将消息发布到broker，Consumer使用pull模式从broker订阅并消费消息。

分析过程分为以下4个步骤：

- topic中partition存储分布
- partiton中文件存储方式 (partition在linux服务器上就是一个目录（文件夹）)
- partiton中segment文件存储结构
- 在partition中如何通过offset查找message

通过上述4过程详细分析，我们就可以清楚认识到kafka文件存储机制的奥秘。

### 2.1 topic中partition存储分布

假设实验环境中Kafka集群只有一个broker，xxx/message-folder为数据文件存储根目录，在Kafka broker中server.properties文件配置(参数log.dirs=xxx/message-folder)，例如创建2个topic名 称分别为report_push、launch_info, partitions数量都为partitions=4

存储路径和目录规则为：

xxx/message-folder

  |--report_push-0
  |--report_push-1
  |--report_push-2
  |--report_push-3
  |--launch_info-0
  |--launch_info-1
  |--launch_info-2
  |--launch_info-3

在Kafka文件存储中，同一个topic下有多个不同partition，每个partition为一个目录，partiton命名规则为topic名称+有序序号，第一个partiton序号从0开始，序号最大值为partitions数量减1。

消息发送时都被发送到一个topic，其本质就是一个目录，而topic由是由一些Partition组成,其组织结构如下图所示：

我们可以看到，Partition是一个Queue的结构，每个Partition中的消息都是有序的，生产的消息被不断追加到Partition上，其中的每一个消息都被赋予了一个唯一的offset值。

Kafka集群会保存所有的消息，不管消息有没有被消费；**我们可以设定消息的过期时间，只有过期的数据才会被自动清除以释放磁盘空间。**比如我们设置消息过期时间为2天，那么这2天内的所有消息都会被保存到集群中，数据只有超过了两天才会被清除。

Kafka只维护在Partition中的offset值，因为这个offsite标识着这个partition的message消费到哪条了。Consumer每消费一个消息，offset就会加1。其实消息的状态完全是由Consumer控制的，Consumer可以跟踪和重设这个offset值，这样的话Consumer就可以读取任意位置的消息。

把消息日志以Partition的形式存放有多重考虑，第一，方便在集群中扩展，每个Partition可以通过调整以适应它所在的机器，而一个topic又可以有多个Partition组成，因此整个集群就可以适应任意大小的数据了；第二就是可以提高并发，因为可以以Partition为单位读写了。

通过上面介绍的我们可以知道，kafka中的数据是持久化的并且能够容错的。Kafka允许用户为每个topic设置副本数量，副本数量决定了有几个broker来存放写入的数据。如果你的副本数量设置为3，那么一份数据就会被存放在3台不同的机器上，那么就允许有2个机器失败。一般推荐副本数量至少为2，这样就可以保证增减、重启机器时不会影响到数据消费。如果对数据持久化有更高的要求，可以把副本数量设置为3或者更多。

Kafka中的topic是以partition的形式存放的，每一个topic都可以设置它的partition数量，Partition的数量决定了组成topic的message的数量。Producer在生产数据时，会按照一定规则（这个规则是可以自定义的）把消息发布到topic的各个partition中。上面将的副本都是以partition为单位的，不过只有一个partition的副本会被选举成leader作为读写用。

关于如何设置partition值需要考虑的因素。**一个partition只能被一个消费者消费（一个消费者可以同时消费多个partition）**，因此，如果设置的partition的数量小于consumer的数量，就会有消费者消费不到数据。所以，推荐partition的数量一定要大于同时运行的consumer的数量。另外一方面，建议partition的数量大于集群broker的数量，这样leader partition就可以均匀的分布在各个broker中，最终使得集群负载均衡。在Cloudera,每个topic都有上百个partition。需要注意的是，kafka需要为每个partition分配一些内存来缓存消息数据，如果partition数量越大，就要为kafka分配更大的heap space。

### 2.2 partiton中文件存储方式

- 每个partion(目录)相当于一个巨型文件被平均分配到多个大小相等segment(段)数据文件中。但每个段segment file消息数量不一定相等，这种特性方便old segment file快速被删除。
- 每个partiton只需要支持顺序读写就行了，segment文件生命周期由服务端配置参数决定。

这样做的好处就是能快速删除无用文件，有效提高磁盘利用率。

![img](https://img-blog.csdn.net/20170107212036116?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU3MzEzMw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

### 2.3 partiton中segment文件存储结构

producer发message到某个topic，message会被均匀的分布到多个partition上（随机或根据用户指定的回调函数进行分布），kafka broker收到message往对应partition的最后一个segment上添加该消息，当某个segment上的消息条数达到配置值或消息发布时间超过阈值时，segment上的消息会被flush到磁盘，只有flush到磁盘上的消息consumer才能消费，segment达到一定的大小后将不会再往该segment写数据，broker会创建新的segment。

每个part在内存中对应一个index，记录每个segment中的第一条消息偏移。

- segment file组成：由2大部分组成，分别为index file和data file，此2个文件一一对应，成对出现，后缀".index"和“.log”分别表示为segment索引文件、数据文件.
- segment文件命名规则：partion全局的第一个segment从0开始，后续每个segment文件名为上一个全局partion的最大offset(偏移message数)。数值最大为64位long大小，19位数字字符长度，没有数字用0填充。

每个segment中存储很多条消息，消息id由其逻辑位置决定，即从消息id可直接定位到消息的存储位置，避免id到位置的额外映射。

下面文件列表是笔者在Kafka broker上做的一个实验，创建一个topicXXX包含1 partition，设置每个segment大小为500MB,并启动producer向Kafka broker写入大量数据,如下图2所示segment文件列表形象说明了上述2个规则：

![img](https://img-blog.csdn.net/20170107212205785?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU3MzEzMw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

以上述图2中一对segment file文件为例，说明segment中index<—->data file对应关系物理结构如下：

![img](https://img-blog.csdn.net/20170107212224538?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU3MzEzMw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

上述图3中索引文件存储大量元数据，数据文件存储大量消息，索引文件中元数据指向对应数据文件中message的物理偏移地址。其中以索引文件中 元数据3,497为例，依次在数据文件中表示第3个message(在全局partiton表示第368772个message)、以及该消息的物理偏移 地址为497。

从上述图3了解到segment data file由许多message组成，下面详细说明message物理结构如下：

![img](https://img-blog.csdn.net/20170107212325100?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU3MzEzMw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

参数说明：

| 关键字              | 解释说明                                                     |
| ------------------- | ------------------------------------------------------------ |
| 8 byte offset       | 在parition(分区)内的每条消息都有一个有序的id号，这个id号被称为偏移(offset),它可以唯一确定每条消息在parition(分区)内的位置。即**offset表示partiion的第多少message** |
| 4 byte message size | message大小                                                  |
| 4 byte CRC32        | 用crc32校验message                                           |
| 1 byte “magic"      | 表示本次发布Kafka服务程序协议版本号                          |
| 1 byte “attributes" | 表示为独立版本、或标识压缩类型、或编码类型。                 |
| 4 byte key length   | 表示key的长度,当key为-1时，K byte key字段不填                |
| K byte key          | 可选                                                         |
| value bytes payload | 表示实际消息数据。                                           |

### 2.4 在partition中如何通过offset查找message

例如读取offset=368776的message，需要通过下面2个步骤查找。

- 第一步查找segment file

  上述图2为例，其中00000000000000000000.index表示最开始的文件，起始偏移量(offset)为0.第二个文件 00000000000000368769.index的消息量起始偏移量为368770 = 368769 + 1.同样，第三个文件00000000000000737337.index的起始偏移量为737338=737337 + 1，其他后续文件依次类推，以起始偏移量命名并排序这些文件，只要根据offset **二分查找**文件列表，就可以快速定位到具体文件。

  当offset=368776时定位到00000000000000368769.index|log

- 第二步通过segment file查找message通过第一步定位到segment file，当offset=368776时，依次定位到00000000000000368769.index的元数据物理位置和 00000000000000368769.log的物理偏移地址，然后再通过00000000000000368769.log顺序查找直到 offset=368776为止。

segment index file采取稀疏索引存储方式，它减少索引文件大小，通过mmap可以直接内存操作，稀疏索引为数据文件的每个对应message设置一个元数据指针,它 比稠密索引节省了更多的存储空间，但查找起来需要消耗更多的时间。

kafka会记录offset到zk中。但是，zk client api对zk的频繁写入是一个低效的操作。0.8.2 kafka引入了native offset storage，将offset管理从zk移出，并且可以做到水平扩展。其原理就是利用了kafka的compacted topic，offset以consumer group,topic与partion的组合作为key直接提交到compacted topic中。同时Kafka又在内存中维护了的三元组来维护最新的offset信息，consumer来取最新offset信息的时候直接内存里拿即可。当然，kafka允许你快速的checkpoint最新的offset信息到磁盘上。

