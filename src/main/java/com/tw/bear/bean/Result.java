package com.tw.bear.bean;

/**
 * ajax提交统一返回类
 */
public class Result<T> {
    private int code;

    private String msg;

    private T data;

    private Result(){};

    private Result(CodeMsg codeMsg){
        if(codeMsg != null){
            this.code = codeMsg.getCode();
            this.msg = codeMsg.getMsg();
        }

    }

    private Result(CodeMsg codeMsg,T data){
        if(codeMsg != null){
            this.code = codeMsg.getCode();
            this.msg = codeMsg.getMsg();
        }
        this.data = data;
    }

    public static <T>Result<T> success(T data){
         return new Result<T>(CodeMsg.SUCCESS,data);
    }

    public static <T>Result<T> error(CodeMsg codeMsg){
        return new Result<T>(codeMsg);
    }

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

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
