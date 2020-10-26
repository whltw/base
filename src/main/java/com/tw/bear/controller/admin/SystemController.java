package com.tw.bear.controller.admin;

import com.tw.bear.admin.entity.OperaterLog;
import com.tw.bear.admin.entity.User;
import com.tw.bear.bean.CodeMsg;
import com.tw.bear.bean.Result;
import com.tw.bear.config.SiteConfig;
import com.tw.bear.service.admin.OperaterLogService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@RequestMapping("/system")
@Controller
@Configurable
public class SystemController {

    @Autowired
    private OperaterLogService operaterLogService;

    @Autowired
    private SiteConfig siteConfig;

    private Logger log = LoggerFactory.getLogger(SystemController.class);

    @Value("${spring.datasource.test-while-idle}")
    private String dataSourceUrl ;


    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String index(String name, Model model){
        model.addAttribute("siteName",siteConfig.getSiteName());
        return "admin/system/login";
    }

    @RequestMapping(value="/login",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> login(User user, String cpacha){
        if(user == null){
           return Result.error(CodeMsg.DATA_ERROR);
        }
        if(StringUtils.isEmpty(user.getUsername())) {
            return  Result.error((CodeMsg.ADMIN_USERNAME_EMPTY));
        }
        if(StringUtils.isEmpty(user.getPassword())) {
            return  Result.error((CodeMsg.ADMIN_PASSWORD_EMPTY));
        }

        if(StringUtils.isEmpty(cpacha)) {
            return  Result.error((CodeMsg.ADMIN_PASSWORD_EMPTY));
        }

        return Result.success(true);
    }

    @RequestMapping(value="/getLogById")
    @ResponseBody
    public OperaterLog index(Long id){
       return operaterLogService.findById(id);
    }

    @RequestMapping(value="/getAllLog")
    @ResponseBody
    public List<OperaterLog> getAllLog(Long id){
        OperaterLog op1 = operaterLogService.findById(1l);
        op1.setOperator("张三2");
        op1.setContent("test insert database");
        operaterLogService.save(op1);
        return operaterLogService.findAll();
    }

    public Boolean deleteById(Long id){
        operaterLogService.deleteById(id);
        return  true;
    }

    public Boolean deleteAll(){
        operaterLogService.deleteAll();
        return  true;
    }
}
