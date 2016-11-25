#!/usr/bin/env bash

# 删除旧镜像
docker rmi syuukawa/microservice-discovery:latest 2> /dev/null

    # 重新下载源代码
rm -rf springcloud_docker/
git clone https://github.com/syuukawa/springcloud_docker.git

# 重新构建镜像
#编译整个项目工程
mvn -f springcloud_docker/demo_layout/pom.xml clean package -U
#docker buid子项目
mvn -f springcloud_docker/demo_layout/discovery/pom.xml docker:build
#mvn -f spring-cloud-microservice-example/drama-service/pom.xml docker:build
#mvn -f spring-cloud-microservice-example/ui/pom.xml docker:build
#mvn -f spring-cloud-microservice-example/config-service/pom.xml docker:build
#mvn -f spring-cloud-microservice-example/api-gateway/pom.xml docker:build
#mvn -f spring-cloud-microservice-example/hystrix-dashboard/pom.xml docker:build
#mvn -f springcloud_docker/demo_layout/discovery/pom.xml clean -q

# 镜像编译完成删除源代码记录，先压缩，后删除
# 压缩源代码目录
if [ -f src.zip ]; then
    rm -rf src.zip
fi
zip -r src.zip spring-cloud-microservice-example/ -q
rm -rf spring-cloud-microservice-example/ 2> /dev/null

exit 0
