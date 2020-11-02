package com.tw.bear.admin.interceptor;

import com.alibaba.fastjson.JSON;
import com.tw.bear.bean.CodeMsg;
import com.tw.bear.controller.admin.SystemController;
import netscape.javascript.JSObject;
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
            String header = request.getHeader("X-Requested-With");
            if("XMLHttpRequest".equals(header)){
                //判断是ajax请求
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(JSON.toJSONString(CodeMsg.USER_SESSION_EXPIRED));
                return  false;
            }


            response.sendRedirect("/system/login");
            return false;
        }
        log.info("进入拦截器"+requestURL);
        return true;
    }
}
