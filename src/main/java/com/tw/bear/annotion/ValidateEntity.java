package com.tw.bear.annotion;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 实体检验自定义注解类
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidateEntity {
    public  boolean required() default false;

    public  boolean requiredLength() default  false;

    public  boolean requiredMaxValue() default  false;

    public  boolean requiredMinValue() default  false;

    public int maxLength() default -1;  //最大长度

    public int minLength() default -1; //最小长度

    public long maxValue() default -1; //最大值

    public long minValue() default -1; //最小值

    public String errorRequiredMsg() default ""; //空的错误提示信息

    public String errorMinLengthMsg() default ""; //最小长度不满足时的错误提示

    public String errorMaxLengthMsg() default ""; //最大长度不满足时的错误提示

    public String errorMinValueMsg() default ""; //最小值不满足时的错误提示

    public String errorMaxValueMsg() default ""; //最大值不满足时的错误提示

 }
