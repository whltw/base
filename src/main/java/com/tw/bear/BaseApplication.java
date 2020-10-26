package com.tw.bear;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

//@Configuration
@SpringBootApplication
@EnableJpaAuditing
public class BaseApplication {


    public static void main(String[] args) {
        SpringApplication.run(BaseApplication.class, args);
    }

}
