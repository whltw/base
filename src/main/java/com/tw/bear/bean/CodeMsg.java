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


    //后台管理状态码
    public static final CodeMsg ADMIN_USERNAME_EMPTY = new CodeMsg(-2000,"用户名不能为空");

    public static final CodeMsg ADMIN_PASSWORD_EMPTY = new CodeMsg(-2001,"密码不能为空");

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
