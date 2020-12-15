package com.tw.bear.controller.admin;

import com.alibaba.fastjson.JSONArray;
import com.tw.bear.bean.CodeMsg;
import com.tw.bear.bean.PageBean;
import com.tw.bear.bean.Result;
import com.tw.bear.entity.admin.Menu;
import com.tw.bear.entity.admin.OperaterLog;
import com.tw.bear.entity.admin.Role;
import com.tw.bear.entity.admin.User;
import com.tw.bear.service.admin.MenuService;
import com.tw.bear.service.admin.OperaterLogService;
import com.tw.bear.service.admin.RoleService;
import com.tw.bear.util.MenuUtil;
import com.tw.bear.util.ValidateEntityUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 后台角色管理控制器
 */
@RequestMapping("/role")
@Controller
public class RoleController {

    private Logger log = LoggerFactory.getLogger(RoleController.class);

    @Autowired
    private MenuService menuService;

    @Autowired
    private OperaterLogService operaterLogService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value="/list",method = RequestMethod.GET)
    public String list(Model model, Role role, PageBean<Role> pageBean){
        PageBean<Role> all = roleService.findByName(role,pageBean);
        model.addAttribute("pageBean",all);
        model.addAttribute("title","角色列表");
        model.addAttribute("name",role.getName());
        model.addAttribute("pageBean",pageBean);
        return"admin/role/list";
    }

    @RequestMapping(value="/add",method = RequestMethod.GET)
    public String add(Model model){
        model.addAttribute("title","添加角色");
        List<Menu> allMenus = menuService.findAll();
        model.addAttribute("topMenus", MenuUtil.getTopMenus(allMenus));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(allMenus));
        model.addAttribute("thirdMenus",MenuUtil.getThirdMenus(allMenus));
        return "admin/role/add";
    }

    @RequestMapping(value="/add",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> add(HttpServletRequest request,Role role){
        //数据校验
        CodeMsg codeMsg = ValidateEntityUtil.validate(role);
        if(codeMsg.getCode() !=CodeMsg.SUCCESS.getCode())
            return Result.error(codeMsg);

        if(roleService.save(role) == null){
            return Result.error(CodeMsg.ADMIN__ROLE_ADD_ERROR);
        }

        log.info("角色添加成功【"+role.toString()+"】");
        User user = (User) request.getSession().getAttribute("user");
        operaterLogService.add(user.getUsername(),"角色添加成功【"+role.getName()+"】");
        return Result.success(true);
    }

    /**
     * 根据id删除角色
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(HttpServletRequest request,@RequestParam(name="id",required=true)Long id){
        try {
            roleService.delete(id);
        }catch (Exception e){
            log.error(e.getStackTrace().toString());
            return Result.error(CodeMsg.ADMIN__ROLE_DELETE_ERROR);
        }
        //保存操作成功,记录日志
        User user = (User) request.getSession().getAttribute("user");
        operaterLogService.add(user.getUsername(),"删除角色成功，角色id为【"+id+"】");
        return  Result.success(true);
    }

    /**
     * 角色编辑
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String edit(Model model,@RequestParam(name = "id",required = true) Long id){
        Role role = roleService.find(id);
        model.addAttribute("role",role);
        List<Menu> allMenus = menuService.findAll();
        model.addAttribute("topMenus", MenuUtil.getTopMenus(allMenus));
        model.addAttribute("secondMenus", MenuUtil.getSecondMenus(allMenus));
        model.addAttribute("thirdMenus",MenuUtil.getThirdMenus(allMenus));
        model.addAttribute("authorities", JSONArray.toJSON(role.getAuthorities()).toString());
        return "admin/role/edit";
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> edit(HttpServletRequest request,Role role){
        //数据校验
        CodeMsg codeMsg = ValidateEntityUtil.validate(role);
        if(codeMsg.getCode() !=CodeMsg.SUCCESS.getCode())
            return Result.error(codeMsg);

        Role existRole = roleService.find(role.getId());
        if(existRole == null){
            return Result.error(CodeMsg.ADMIN_ROLE_NO_EXIST);
        }
        existRole.setName(role.getName());
        existRole.setRemark(role.getRemark());
        existRole.setStatus(role.getStatus());
        existRole.setAuthorities(role.getAuthorities());

        if(roleService.save(existRole) == null){
            return Result.error(CodeMsg.ADMIN__ROLE_EDIT_ERROR);
        }
        //保存操作成功,记录日志
        User user = (User) request.getSession().getAttribute("user");
        operaterLogService.add(user.getUsername(),"角色编辑成功，角色id为【"+existRole.getId()+"】");
        return  Result.success(true);
    }
}
