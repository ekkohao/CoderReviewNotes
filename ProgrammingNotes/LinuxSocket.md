# Linux Socket

## 1. API

```c
#include <sys/types.h>
#include <sys/socket.h>


/************************************************************************
 * 常用socket结构体
 ***********************************************************************/

// 通用函数类型：
struct sockaddr{
　　sa_family_t  sa_family;
　　char         sa_data[14];
}

//如ipv4对应的是：
struct sockaddr_in {
    sa_family_t    sin_family; /* address family: AF_INET */
    in_port_t      sin_port;   /* port in network byte order 2字节*/
    struct in_addr sin_addr;   /* internet address 4字节*/
　　unsigned char sin_zero[8];
};

//Internet address
struct in_addr {
    uint32_t       s_addr;     /* address in network byte order */
};

//ipv6对应的是： 
struct sockaddr_in6 { 
    sa_family_t     sin6_family;   /* AF_INET6 */ 
    in_port_t       sin6_port;     /* port number */ 
    uint32_t        sin6_flowinfo; /* IPv6 flow information */ 
    struct in6_addr sin6_addr;     /* IPv6 address */ 
    uint32_t        sin6_scope_id; /* Scope ID (new in 2.4) */ 
};
struct in6_addr { 
    unsigned char   s6_addr[16];   /* IPv6 address */ 
};

//Unix域对应的是： 
#define UNIX_PATH_MAX    108
struct sockaddr_un { 
    sa_family_t sun_family;               /* AF_UNIX */ 
    char        sun_path[UNIX_PATH_MAX];  /* pathname */ 
};

/************************************************************************
 * 工具方法
 ***********************************************************************/

//将字符串形式的IP地址转化为整数型的IP地址（网络字节序）
int_addr_t indet_addr(const char *cp);

//将整数形式的IP地址转化为字符串形式的IP地址
char *inet_ntoa(struct in_addr);
    
//网络字节序定义：收到的第一个字节被当作高位看待，这就要求发送端发送的第一个字节应当是高位。
//而在发送端发送数据时，发送的第一个字节是该数字在内存中起始地址对应的字节。
//可见多字节数值在发送前，在内存中数值应该以大端法存放。 
//网络字节序说是大端字节序。

//将32位的数据从主机字节序转换为网络字节序
uint32_t htonl(uint32_t hostlong);
　　
//将16位的数据从主机字节序转换为网络字节序
uint16_t htons(uint16_t hostshort);
　　
//将32位的数据从网络字节序转换为主机字节序
uint32_t ntohl(uint32_t netlong);
　　
//将16位的数据从网络字节序转换为主机字节序
uint16_t ntohs(uint16_t netshort);
　　
/************************************************************************
 * API
 ***********************************************************************/

/**
 * 创建socket
 *
 * @param domain IPv4直接填写AF_INET
 * @param type TCP使用SOCK_STEAM, UDP使用SOCK_DGRAM
 * @param protocol 填0即可
 * @return 成功返回socket句柄，失败返回-1
 **/
int socket(int domain,int type,int protocol);

/**
 * 一旦你有了一个套接口以后，下一步就是把套接口绑定到本地计算机的某一个端口上。
 * 但如果你只想使用connect()则无此必要。
 *
 * @param addrlen sizeof(struct sockaddr)
 * @return 失败返回-1
 **/
int bind(int sockfd, struct sockaddr *my_addr, int addrlen);

/**
 * 绑定端口后就可以开启监听了
 * @param backlog 进入队列中允许的连接的个数。
 * 		进入的连接请求在使用系统调用accept()应答之前要在进入队列中等待。
 * 		这个值是队列中最多可以拥有的请求的个数。大多数系统的缺省设置为20。你可以设置为5或者10。
 * @return 失败返回-1
 **/
int listen(int sockfd,int backlog);

/**
 * 如果你使用connect()系统调用，那么你不必知道你使用的端口号。
 * 当你调用connect()时，它检查套接口是否已经绑定，如果没有，它将会分配一个空闲的端口。
 *
 * @param addrlen sizeof(struct sockaddr)
 * @return 成功返回0，失败返回-1
 **/
int connect(int sockfd,struct sockaddr *serv_addr, int addrlen);

/**
 * 服务端阻塞监听客户端连接
 *
 * @return 成功返回连接句柄，出错返回-1
 **/
int accept(int sockfd,void *addr,int *addrlen);

/**
 * 发送数据，服务端发送接收数据使用accept()返回的句柄
 *
 * @param msg 发送数据的指针
 * @param len 发送数据长度
 * @param flags 设0
 * @return 返回实际发送的数据长度，如果没法送完要接着下次发送
 **/
int send(int sockfd,const void* msg,int len,int flags);

/**
 * 接收数据，服务端接收接收数据使用accept()返回的句柄
 *
 * @param len 接收最大长度
 * @return 返回实际接收长度，出错返回-1
 **/
int recv(int sockfd,void* buf,int len,unsigned int flags);

/**
 * 发送数据，除了两个参数以外，其他的参数和系统调用send()时相同。
 *
 * @param to 包含目的IP地址和端口号的数据结构sockaddr的指针
 * @return 同send()
 **/
int sendto(int sockfd, const void* msg, int len, unsigned int flags,
           const struct sockaddr *to, int tolen);

/**
 * 接收数据，除了两个参数以外，其他的参数和系统调用recv()时相同
 *
 * @param from 包含源IP地址和端口号的数据结构sockaddr的指针
 * @return 同recv()
 **/
int recvfrom(int sockfd,void* buf, int len, unsigned int flags，
		     struct sockaddr* from,int* fromlen);

/**
 * 关闭连接
 **/
int close(int sockfd);

/**
 * 使用系统调用shutdown()，可有更多的控制权。它允许你在某一个方向切断通信，或者切断双方的通信
 * 
 * @param how 0，1，2
 * @return 成功返回0，失败返回-1
 **/
int shutdown(int sockfd,int how);

/**
 * 返回对方ip
 **/
int getpeername(int sockfd,struct sockaddr *addr,int *addrlen);

/**
 * 返回当前计算机名字
 * 
 * @return 成功返回0，失败返回-1
 **/
int gethostname(char *hostname,size_t size);
```

## 2. 建立连接

**服务端**

服务器端先初始化socket，然后与端口绑定，对端口进行监听，调用accept阻塞，等待客户端连接。

```
socket() -> bind() -> listen() -> accept()
```

 **客户端**

客户端先初始化socket，然后与服务端连接，服务端监听成功则连接建立完成

```
socket() -> connect()
```

## 3. 示例

**服务端**

```c
/* File Name: server.c */  
#include<stdio.h>  
#include<stdlib.h>  
#include<cstring>  

#include<errno.h>  
#include<sys/types.h>  
#include<sys/socket.h>  

#define DEFAULT_PORT 8000  
#define MAXLINE 4096  
int main(int argc, char** argv)  
{  
    int socket_fd, connect_fd;  
    struct sockaddr_in servaddr;  
    char buff[4096];  
    int  n;  
    
    //初始化Socket  
    if( (socket_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1 ){  
    	printf("create socket error: %s(errno: %d)\n",strerror(errno),errno);  
    	exit(0);  
    }  
    
    //初始化本地地址参数  
    memset(&servaddr, 0, sizeof(servaddr));  
    servaddr.sin_family = AF_INET;  
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);//IP地址设置成INADDR_ANY,让系统自动获取本机的IP地址。  
    servaddr.sin_port = htons(DEFAULT_PORT);//设置的端口为DEFAULT_PORT  
  
    //将本地地址绑定到所创建的套接字上  
    if( bind(socket_fd, (struct sockaddr*)&servaddr, sizeof(servaddr)) == -1){  
   	 	printf("bind socket error: %s(errno: %d)\n",strerror(errno),errno);  
    	exit(0);  
    }  
    //开始监听是否有客户端连接  
    if( listen(socket_fd, 10) == -1){  
    	printf("listen socket error: %s(errno: %d)\n",strerror(errno),errno);  
    	exit(0);  
    }  
    
    printf("======waiting for client's request======\n");  
    while(1){  
		//阻塞直到有客户端连接，不然多浪费CPU资源。  
        if( (connect_fd = accept(socket_fd, (struct sockaddr*)NULL, NULL)) == -1){  
        	printf("accept socket error: %s(errno: %d)",strerror(errno),errno);  
        	continue;  
   		 }  
		//接受客户端传过来的数据  
    	n = recv(connect_fd, buff, MAXLINE, 0);  
		//向客户端发送回应数据  
    	if(!fork()){//子进程进入if 
        	if(send(connect_fd, "Hello,you are connected!\n", 26,0) == -1)  
        		perror("send error");  
        	close(connect_fd);  
        	exit(0);//退出子进程
    	}  
    	buff[n] = '\0';  
    	printf("recv msg from client: %s\n", buff);  
    	close(connect_fd);  
    }  
    
    close(socket_fd);  
}  
```

**客户端**

```c
/* File Name: client.c */  
  
#include<stdio.h>  
#include<stdlib.h>  
#include<string.h>  
#include<errno.h>  
#include<sys/types.h>  
#include<sys/socket.h>  
#include<netinet/in.h>  
  
#define MAXLINE 4096  
  
  
int main(int argc, char** argv)  
{  
    int    sockfd, n,rec_len;  
    char    recvline[4096], sendline[4096];  
    char    buf[MAXLINE];  
    struct sockaddr_in    servaddr;  
  
  
    if( argc != 2){  
    printf("usage: ./client <ipaddress>\n");  
    exit(0);  
    }  
  
  
    if( (sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0){  
    printf("create socket error: %s(errno: %d)\n", strerror(errno),errno);  
    exit(0);  
    }  
  
  
    memset(&servaddr, 0, sizeof(servaddr));  
    servaddr.sin_family = AF_INET;  
    servaddr.sin_port = htons(8000);  
    if( inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0){  
    printf("inet_pton error for %s\n",argv[1]);  
    exit(0);  
    }  
  
  
    if( connect(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0){  
    printf("connect error: %s(errno: %d)\n",strerror(errno),errno);  
    exit(0);  
    }  
  
  
    printf("send msg to server: \n");  
    fgets(sendline, 4096, stdin);  
    if( send(sockfd, sendline, strlen(sendline), 0) < 0)  
    {  
    printf("send msg error: %s(errno: %d)\n", strerror(errno), errno);  
    exit(0);  
    }  
    if((rec_len = recv(sockfd, buf, MAXLINE,0)) == -1) {  
       perror("recv error");  
       exit(1);  
    }  
    buf[rec_len]  = '\0';  
    printf("Received : %s ",buf);  
    close(sockfd);  
    exit(0);  
} 
```

