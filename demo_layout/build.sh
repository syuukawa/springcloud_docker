#!/usr/bin/env bash

# 删除旧镜像
docker rmi yingzhuo/microservice-discovery:latest 2> /dev/null

    # 重新下载源代码
rm -rf spring-cloud-microservice-example/
git clone https://github.com/syuukawa/thymeleaf_layout.git

# 重新构建镜像
mvn -f spring-cloud-microservice-example/pom.xml clean package -U
mvn -f spring-cloud-microservice-example/discovery/pom.xml docker:build
mvn -f spring-cloud-microservice-example/drama-service/pom.xml docker:build
mvn -f spring-cloud-microservice-example/ui/pom.xml docker:build
mvn -f spring-cloud-microservice-example/config-service/pom.xml docker:build
mvn -f spring-cloud-microservice-example/api-gateway/pom.xml docker:build
mvn -f spring-cloud-microservice-example/hystrix-dashboard/pom.xml docker:build
mvn -f spring-cloud-microservice-example/pom.xml clean -q

# 压缩源代码目录
if [ -f src.zip ]; then
    rm -rf src.zip
fi
zip -r src.zip spring-cloud-microservice-example/ -q
rm -rf spring-cloud-microservice-example/ 2> /dev/null

exit 0
