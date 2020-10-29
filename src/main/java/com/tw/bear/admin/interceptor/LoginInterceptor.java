package com.tw.bear.admin.interceptor;

import com.tw.bear.controller.admin.SystemController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆拦截器
 */
@Component
public class LoginInterceptor implements HandlerInterceptor {

    private Logger log = LoggerFactory.getLogger(LoginInterceptor .class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        StringBuffer requestURL = request.getRequestURL();
        Object user = request.getSession().getAttribute("user");
        if(user == null){
            //用户未登陆或者session失效
            log.info("用户还未登陆或者session失效，重定向到登录页，当前url为"+request.getRequestURL());
            response.sendRedirect("/system/login");
            return false;
        }
        log.info("进入拦截器"+requestURL);
        return true;
    }
}
