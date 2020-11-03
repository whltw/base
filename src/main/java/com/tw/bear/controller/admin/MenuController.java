package com.tw.bear.controller.admin;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 后台菜单管理控制器
 */
@RequestMapping("/menu")
@Controller
public class MenuController {
    @RequestMapping(value = "/list")
    public String list(Model model){
        return "admin/menu/list";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(Model model){

        model.addAttribute("title","菜单列表");
        return "admin/menu/add";
    }
}
