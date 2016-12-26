package com.syuukawa.cloud;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class DisApplication {
    private static final Logger log = LoggerFactory.getLogger(DisApplication.class);
    public static void main(String[] args) {
        log.debug("main");
        SpringApplication.run(DisApplication.class, args);
    }
}
