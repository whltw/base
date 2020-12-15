package com.tw.bear.controller.admin;

import com.tw.bear.bean.PageBean;
import com.tw.bear.entity.admin.User;
import com.tw.bear.service.admin.RoleService;
import com.tw.bear.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    /**
     * 用户遍历
     * @param model
     * @param user
     * @param pageBean
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(Model model, User user, PageBean<User> pageBean){

        model.addAttribute("title","用户列表");
        model.addAttribute("pageBean",pageBean);
        return "admin/user/list";
    }

    /**
     * 新增用户界面
     * @param model
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(Model model){
        model.addAttribute("title","用户添加");
        model.addAttribute("roles", roleService.findAll());
        return "admin/user/add";
    }
}
