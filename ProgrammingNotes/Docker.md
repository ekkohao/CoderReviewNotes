# Docker #

## 1. 安装docker ##

### 1.1 安装 ###

安装docker参考以下两个文档

> 1. [docker官方文档](https://docs.docker.com/)
> 2. [菜鸟教程](http://www.runoob.com/docker/docker-tutorial.html)

### 1.2 镜像加速 ###

鉴于国内网络问题，后续拉取 Docker 镜像十分缓慢，我们可以需要配置加速器来解决，我使用的是网易的镜像地址：http://hub-mirror.c.163.com。

新版的 docker 使用 /etc/docker/daemon.json（Linux）或者 %programdata%\docker\config\daemon.json（Windows）来配置 Daemon。

请在该配置文件中加入（没有该文件的话，请先建一个）：

```
{
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}
```

## 2. 使用docker ##

### 2.1 docker命令 ###

我们可以直接输入 docker 命令来查看到 Docker 客户端的所有命令选项。

```
# docker
```

可以通过命令 `docker {docker命令名} --help` 更深入的了解指定的 Docker 命令使用方法。例如我们要查看 **docker stats** 指令的具体使用方法：

```
# docker stats --help
```

> 参考：
>
> 1. [官方命令 - docker 命令](https://docs.docker.com/engine/reference/commandline/docker/)
> 2. [菜鸟教程 - docker 命令大全](http://www.runoob.com/docker/docker-command-manual.html)

#### 2.1.1 容器镜像仓库 ####

* **搜索可用docker镜像：**`docker search {镜像名}`
* **拉取镜像：** `docker pull {完整镜像名}`，eg：`docker pull learn/tutorial `
* **上传镜像：** `docker push {镜像名}`
* **登陆一个镜像仓库：** `docker login [-u 用户名] [-p 密码] [仓库地址]`，如果未指定镜像仓库地址，默认为官方仓库 Docker Hub
* **登出一个镜像仓库：** `docker logout`

#### 2.1.2 本地镜像管理 ####

* **列出所有镜像：**  `docker images`
* **重新标记镜像名（Tag）：** `docker tag {源镜像名} {目标镜像名}`
* **使用Dockerfile构建镜像：** `docker build [-t {设置镜像名}] {Dockerfile所在目录}`

#### 2.1.3 容器生命周期管理 ####

* **启动镜像到容器：** `docker run {完整镜像名} {要在镜像种运行的命令}`，eg：`docker run learn/tutorial echo "hello word"`
    - `docker run -i -t`  进入容器内的终端进行交互，参数 -t 指定容器内的终端
    	 `docker run -d`  后台运行容器，并返回容器ID	
    - `docker run -P`  将容器内部使用的网络端口映射到我们使用的主机上
    - `docker run -p {本地端口}:{容器内端口}` 指定端口映射
    - `docker run -rm`  容器退出时自动删除
    - `docker run -name` 设置容器名，作用同容器ID
* **停止/启动/重启/删除/杀死容器：** `docker stop/start/restart/rm/kill {容器ID}`
* **暂停/恢复容器中的所有线程：** `docker pause/unpause {容器ID}`

#### 2.1.4 容器操作 ####

* **保存对容器的修改：** `docker commit {容器ID} {新完整镜像名}`
* **容器与主机之间的数据拷贝：** `docker cp {源目录} {目标目录}`，若目标目录以`/`结尾则为拷贝到目标目录下，否则重命名拷贝目录
* **查看所有运行中的容器：** `docker ps`
* **查看某个运行容器的信息：** `docker inspect {容器ID}`
* **查看某个运行容器的标准输出：** `docker logs {容器ID}`
* **查看某个运行容器的端口映射：** `docker port {容器ID}`


### 2.2 Dockerfile ###

```
# 必须以FROM开始
FROM <基于的镜像名>

# 维护者信息
MAINTAINER <作者名> <作者email>

# 设置环境变量
ENV <key> <value>
ENV <key>=<value> <key2>=<value2> ...

# 设置构建参数，用户可以在构建期间通过docker build --build-arg <varname>=<value>将其传递给构建器
ARG <key>=<default value> ...

# 在容器内运行命令，用于安装软件或配置信息
RUN <command>
RUN <["executable", "param1", "param2"]>

# 容器启动时执行的指令，多条CMD时执行最后一条
CMD <command>
CMD <["executable","param1","param2"]>
ENTRYPOINT <command>
ENTRYPOINT <["executable", "param1", "param2"]>

# 设置容器暴露的端口号
EXPOSE <22> <80> ...

# 复制本地文件到镜像中，ADD指令的 src 可以时一个URL 相当于先wget在拷贝到容器中
COPY <src>... <dest>
ADD <src>... <dest>

# 设置容器当前工作目录
WORKDIR <dir>

# 挂在本地目录
VOLUME <dir>

# 设置容器用户
USER <user name>
USER <UID>
```



