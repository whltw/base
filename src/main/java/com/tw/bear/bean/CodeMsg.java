package com.tw.bear.bean;

public class CodeMsg {
    private int code;

    private String msg;

    private CodeMsg(int code ,String msg){
        this.code = code;
        this.msg = msg;
    }

    public static CodeMsg getInstance(int code,String msg){
        return new CodeMsg(code,msg);
    }

    public static final CodeMsg SUCCESS = new CodeMsg(0,"success");



    public static final CodeMsg DATA_ERROR = new CodeMsg(-1,"非法数据");
    public static final CodeMsg CPACHA_EMPTY = new CodeMsg(-2,"验证码不能为空");
    public static final CodeMsg VALIDATE_ENTITY_ERROR = new CodeMsg(-3,"");
    public static final CodeMsg SESSION_EXPIRED = new CodeMsg(-4,"会话失效，请重新登陆！");
    public static final CodeMsg CPACHA_ERROR = new CodeMsg(-5,"验证码错误");
    public static final CodeMsg USER_SESSION_EXPIRED = new CodeMsg(-6,"还未登陆或会话失效，请重新登陆");

    //后台管理状态码
    public static final CodeMsg ADMIN_USERNAME_EMPTY = new CodeMsg(-2000,"用户名不能为空");

    public static final CodeMsg ADMIN_PASSWORD_EMPTY = new CodeMsg(-2001,"密码不能为空");


    //登陆类错误码
    public static final CodeMsg ADMIN_USER_NOT_EXIST = new CodeMsg(-3001,"该用户名不存在");
    public static final CodeMsg ADMIN_PASSWORD_NOT_EXIST = new CodeMsg(-3001,"该密码错误");

    //菜单管理错误
    public static final CodeMsg ADMIN__MENU_ADD_ERROR = new CodeMsg(-4000,"菜单添加失败,请联系管理员!");
    public static final CodeMsg ADMIN_MENU_EDIT_ERROR = new CodeMsg(-4001,"菜单编辑失败,请联系管理员!");
    public static final CodeMsg ADMIN_MENU_ID_EMPTY  = new CodeMsg(-4002,"菜单id不能为空,请联系管理员!");
    public static final CodeMsg ADMIN_MENU_ID_ERROR  = new CodeMsg(-4003,"菜单id不能为空,请联系管理员!");
    public static final CodeMsg ADMIN_MENU_DELETE_ERROR  = new CodeMsg(-4004,"菜单有子菜单,请先删除子菜单!");


    //后台角色管理错误
    public static final CodeMsg ADMIN__ROLE_ADD_ERROR = new CodeMsg(-5000,"角色添加失败,请联系管理员!");
    public static final CodeMsg ADMIN_ROLE_NO_EXIST = new CodeMsg(-5001,"角色不存在,请联系管理员!");
    public static final CodeMsg ADMIN__ROLE_EDIT_ERROR = new CodeMsg(-5002,"角色编辑失败,请联系管理员!");
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
