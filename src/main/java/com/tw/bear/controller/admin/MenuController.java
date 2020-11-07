package com.tw.bear.controller.admin;

import com.tw.bear.bean.CodeMsg;
import com.tw.bear.bean.Result;
import com.tw.bear.entity.admin.Menu;
import com.tw.bear.entity.admin.User;
import com.tw.bear.service.admin.MenuService;
import com.tw.bear.service.admin.OperaterLogService;
import com.tw.bear.util.ValidateEntityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 后台菜单管理控制器
 */
@RequestMapping("/menu")
@Controller
public class MenuController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private OperaterLogService operaterLogService;

    @RequestMapping(value = "/list")
    public String list(Model model){
        return "admin/menu/list";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(Model model){

        model.addAttribute("title","菜单列表");
        model.addAttribute("menus",menuService.findAll());
        return "admin/menu/add";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(HttpServletRequest request,Menu menu){
        if(menu == null){
            return  Result.error(CodeMsg.DATA_ERROR);
        }
        //用统一验证实体方法验证是否合法
        CodeMsg codeMsg = ValidateEntityUtil.validate(menu);
        if(codeMsg.getCode() !=CodeMsg.SUCCESS.getCode())
            return Result.error(codeMsg);

        //表示校验通过，进行保存操作
        if(menu.getParent() != null){
            if(menu.getParent().getId() == null){
                menu.setParent(null);
            }
        }
        if(menuService.save(menu) == null)
            return Result.error(CodeMsg.ADMIN__MENU_ADD_ERROR);

        //保存操作成功,记录日志
        User user = (User) request.getSession().getAttribute("user");
        operaterLogService.add(user.getUsername(),"添加菜单信息【"+menu.toString()+"】");

        return Result.success(true);
    }
}
