package com.tw.bear.util;

import com.tw.bear.annotion.ValidateEntity;
import com.tw.bear.bean.CodeMsg;

import java.lang.reflect.Field;

/**
 * 验证实体工具类
 */
public class ValidateEntityUtil {

    public static CodeMsg validate(Object object) {
        Field[] fields = object.getClass().getDeclaredFields();
        for (Field field : fields) {
            ValidateEntity annotation = field.getAnnotation(ValidateEntity.class);
            if(annotation != null){
                if(annotation.required()){
                    field.setAccessible(true);

                    try {
                        Object o = field.get(object);
                        //判断是否为null
                        if(o == null){
                            CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                            codeMsg.setMsg(annotation.errorRequiredMsg());
                            return codeMsg;
                        }

                        //变量不为null，检查是否是字符串
                        if(o instanceof String){
                            //校验长度
                            if(annotation.requiredLength()){
                                if(annotation.minLength() > o.toString().length()){
                                    CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                                    codeMsg.setMsg(annotation.errorMinLengthMsg());
                                    return codeMsg;
                                }

                                if(o.toString().length()>annotation.maxLength()){
                                    CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                                    codeMsg.setMsg(annotation.errorMaxLengthMsg());
                                    return codeMsg;
                                }
                            }
                        }
                        //是否为数字
                        if(isNumberObject(o)){
                            //检查最小值
                            if(annotation.requiredMinValue()){
                                if(Double.valueOf(o.toString())<annotation.minValue()){
                                    CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                                    codeMsg.setMsg(annotation.errorMinValueMsg());
                                }
                            }
                            //检查最大值
                            if(annotation.requiredMaxValue()){
                                if(Double.valueOf(o.toString()) > annotation.maxValue()){
                                    CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
                                    codeMsg.setMsg(annotation.errorMaxValueMsg());
                                }
                            }

                        }

                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return CodeMsg.SUCCESS;
    }

    /**
     * 检查对象是否为数字类型
     * @param object
     * @return
     */
    public static boolean isNumberObject(Object object){
        if(object instanceof Integer) return true;
        if(object instanceof Long) return true;
        if(object instanceof Float) return true;
        if(object instanceof Double) return true;
        return  false;
    }
}
