package com.tw.bear.controller.admin;

import com.tw.bear.bean.CodeMsg;
import com.tw.bear.bean.PageBean;
import com.tw.bear.bean.Result;
import com.tw.bear.entity.admin.User;
import com.tw.bear.service.admin.RoleService;
import com.tw.bear.service.admin.UserService;
import com.tw.bear.util.ValidateEntityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        model.addAttribute("username",user.getUsername());

        model.addAttribute("pageBean", userService.findList(user,pageBean));

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

    /**
     * 用户添加处理
     * @param user
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(User user){

        CodeMsg codeMsg = ValidateEntityUtil.validate(user);
        if(codeMsg.getCode() !=CodeMsg.SUCCESS.getCode())
            return Result.error(codeMsg);

        if(user.getRole() == null || user.getRole().getId() == null){
            return Result.error(CodeMsg.ADMIN_USER_ROLE_EMPTY);
        }
        //用户名重复检验
        User byUsername = userService.findByUsername(user.getUsername());
        if(byUsername != null){
            return Result.error(CodeMsg.ADMIN_USER_EXIST);
        }

        if(userService.save(user) == null){
            return Result.error(CodeMsg.ADMIN_USER_ADD_FAIL);
        }

        return Result.success(true);
    }

    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String edit(Model model,@RequestParam(name = "id",required = true) Long id){
        model.addAttribute("title","用户编辑");

        User user = userService.findById(id);


        model.addAttribute("user",user);
        model.addAttribute("roles", roleService.findAll());
        return "admin/user/add";
    }
}
