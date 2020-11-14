package com.tw.bear.controller.admin;

import com.tw.bear.bean.CodeMsg;
import com.tw.bear.bean.Result;
import com.tw.bear.entity.admin.Menu;
import com.tw.bear.entity.admin.User;
import com.tw.bear.service.admin.MenuService;
import com.tw.bear.service.admin.OperaterLogService;
import com.tw.bear.util.MenuUtil;
import com.tw.bear.util.ValidateEntityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 后台菜单管理控制器
 */
@RequestMapping("/menu")
@Controller
public class MenuController {

    private Logger log = LoggerFactory.getLogger(MenuController.class);
    @Autowired
    private MenuService menuService;

    @Autowired
    private OperaterLogService operaterLogService;

//    @RequestMapping(value = "/list")
//    public String list(Model model){
//        return "admin/menu/list";
//    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(Model model){

//        model.addAttribute("title","菜单列表");
//        model.addAttribute("menus",menuService.findAll());
        List<Menu> allMenus = menuService.findAll();
        model.addAttribute("title","菜单列表");
        model.addAttribute("topMenus",MenuUtil.getTopMenus(allMenus));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(allMenus));
        model.addAttribute("thirdMenus",MenuUtil.getThirdMenus(allMenus));
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

    /**
     * 菜单列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(Model model){
        List<Menu> allMenus = menuService.findAll();
        model.addAttribute("title","菜单列表");
        model.addAttribute("topMenus",MenuUtil.getTopMenus(allMenus));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(allMenus));
        model.addAttribute("thirdMenus",MenuUtil.getThirdMenus(allMenus));

        return "/admin/menu/list";
    }

    /**
     * 菜单编辑
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String list(Model model, @RequestParam(name = "id",required = true) Long id){
        List<Menu> allMenus = menuService.findAll();
        model.addAttribute("title","菜单列表");
        model.addAttribute("topMenus",MenuUtil.getTopMenus(allMenus));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(allMenus));
        model.addAttribute("thirdMenus",MenuUtil.getThirdMenus(allMenus));
        model.addAttribute("menu",menuService.findOne(id));
        return "/admin/menu/edit";
    }



    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(HttpServletRequest request,Menu menu){
        if(menu == null){
            return  Result.error(CodeMsg.DATA_ERROR);
        }

        if(menu.getId() == null){
            return Result.error(CodeMsg.ADMIN_MENU_ID_EMPTY);
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

        Menu curMenu = menuService.findOne(menu.getId());
        if (curMenu == null){
            return Result.error(CodeMsg.ADMIN_MENU_ID_ERROR);
        }

        curMenu.setIcon(menu.getIcon());
        curMenu.setName(menu.getName());
        curMenu.setParent(menu.getParent());
        curMenu.setSort(menu.getSort());
        curMenu.setUrl(menu.getUrl());
//        curMenu.setButton(menu.isButton());
//        curMenu.setShow(menu.isShow());

        if(menuService.save(curMenu) == null)
            return Result.error(CodeMsg.ADMIN__MENU_ADD_ERROR);

        //保存操作成功,记录日志
        User user = (User) request.getSession().getAttribute("user");
        operaterLogService.add(user.getUsername(),"更新菜单信息【"+curMenu.toString()+"】");

        return Result.success(true);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(HttpServletRequest request,@RequestParam(name="id",required=true)Long id){

        try {
            menuService.delete(id);
        }catch (Exception e){
            log.error(""+e);
            return Result.error(CodeMsg.ADMIN_MENU_DELETE_ERROR);
        }

        //保存操作成功,记录日志
        User user = (User) request.getSession().getAttribute("user");
        operaterLogService.add(user.getUsername(),"删除菜单成功，菜单id为【"+id+"】");
        return  Result.success(true);
    }
}
