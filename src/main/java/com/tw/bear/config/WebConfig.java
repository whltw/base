package com.tw.bear.config;

import com.tw.bear.admin.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import sun.rmi.server.LoaderHandler;

import java.util.Arrays;
import java.util.List;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private LoginInterceptor loginInterceptor;

    List<String> exclude = Arrays.asList("/system/login","/admin/css/**","/admin/fonts/**",
            "/admin/js/**","/admin/images/**","/error","/cpacha/generate_cpacha","/admin/fonts/**");
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
       registry.addInterceptor(loginInterceptor).addPathPatterns("/**").excludePathPatterns(exclude);
    }
}
