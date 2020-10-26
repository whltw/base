package com.tw.bear.controller.common;

import com.tw.bear.controller.admin.SystemController;
import com.tw.bear.util.CpachaUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/cpacha")
public class CpachaController {

    private Logger log = LoggerFactory.getLogger(CpachaController.class);

    @RequestMapping(value ="/generate_cpacha",method = RequestMethod.GET)
    public void generateCpacha(
            @RequestParam(name = "vl",defaultValue = "4")Integer vcodeLength,
            @RequestParam(name = "fs",defaultValue = "21")Integer fontSize,
            @RequestParam(name = "w",defaultValue = "98")Integer width,
            @RequestParam(name = "h",defaultValue = "33")Integer height,
            @RequestParam(name = "method",defaultValue = "admin_login")String method,
            HttpServletRequest request , HttpServletResponse response){
        CpachaUtil cpachaUtil = new CpachaUtil(vcodeLength,fontSize,width,height);
        String generateVCode  = cpachaUtil.generatorVCode();
        request.getSession().setAttribute("admin_login",generateVCode);
        log.info("验证码成功生成,method为"+method+",值为"+generateVCode);
        try {
            ImageIO.write(cpachaUtil.generatorVCodeImage(generateVCode,true),"gif",response.getOutputStream());
        } catch (IOException e){
            e.printStackTrace();
        }

    }
}

