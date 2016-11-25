[![JDK](http://img.shields.io/badge/JDK-v8.0-yellow.svg)](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
[![Build](http://img.shields.io/badge/Build-Maven_2-green.svg)](https://maven.apache.org/)
[![License](http://img.shields.io/badge/License-Apache_2-red.svg)](http://www.apache.org/licenses/LICENSE-2.0)

## 简介

本项目是一个演示项目，旨在演示`SpringCloud`框架的一些基本功能。本项目包含以下几个子模块`(module)`

* `common` - 通用代码
* `api-gateway` - 服务网关
* `discovery` - 服务注册与发现节点
* `config-service` - 配置中心
* `drama-service` - 电视剧查询服务
* `ui` - 服务的消费者
* `hystrix-dashboard` - 服务监控面板

为了方便起见，以上除`common`以外的模块，都将分别构建成`docker`镜像，并通过`docker-compose`工具启动。

本项目包含以下`feature`的演示

1. 服务发现与注册
2. 服务的消费
3. 服务熔断机制
4. 服务的负载均衡
5. 配置中心化
6. 服务网关
7. 服务安全
8. 服务监控

## 构建镜像

```bash
curl -X 'GET' -sSL 'https://raw.githubusercontent.com/yingzhuo/spring-cloud-microservice-example/master/build.sh' | bash
```

## 启动

```bash
curl -X 'GET' -sSL 'https://raw.githubusercontent.com/yingzhuo/spring-cloud-microservice-example/master/docker-compose.yml' > docker-compose.yml
docker-compose up -d
```

如果启动成功，

* 访问`http://HOST:8761/dashboard`可查看被注册的服务的详情。
* 访问`http://HOST:8866/ui?left=100&right=11`调用分布式服务并展示结果。

> 注意: HOST指`docker`宿主机名或IP地址

## 总览

服务名称           | 功能            | 默认占用端口号 | docker宿主机端口映射 | 权限验证 (Basic Authentication)
------------------|-----------------|-------------|-------------------|------------
discovery         | 服务发现与注册服务 | 8761        | 8761              | admin:admin
api-gateway       | 服务网关         | 5555        | 5555              | admin:admin
config-service    | 配置服务         | 8888        | 8888              | (none)
drama-service-a   | 电视剧查询服务(甲)| 7779        | 7779              | admin:admin
drama-service-b   | 电视剧查询服务(乙)| 7780        | 7780              | admin:admin
ui                | web页面服务      | 8866        | 8866              | (none)
hystrix-dashboard | 服务监控面板     | 8030        | 8030              | (none)

## 许可证

[Apache 2.0](LICENSE)

## 联系我

![QQ](http://img.shields.io/badge/QQ-23007067-blue.svg)
![WeChat](http://img.shields.io/badge/WeChat-yingzhor-blue.svg)
![Email](http://img.shields.io/badge/Email-yingzhor@gmail.com-blue.svg)
