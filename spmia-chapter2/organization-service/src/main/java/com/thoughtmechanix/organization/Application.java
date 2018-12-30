package com.thoughtmechanix.organization;

import com.thoughtmechanix.organization.config.ServiceConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;


@SpringBootApplication
@EnableEurekaClient
//@EnableFeignClients
@EnableResourceServer
public class Application {

    @Autowired
    private ServiceConfig serviceConfig;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}