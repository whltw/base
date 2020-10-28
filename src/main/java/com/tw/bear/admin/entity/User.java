package com.tw.bear.admin.entity;

import com.tw.bear.annotion.ValidateEntity;
import com.tw.bear.bean.CodeMsg;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

/**
 * 后台用户实体类
 */
@Entity
@Table(name = "tw_user")
@EntityListeners(AuditingEntityListener.class)
public class User extends BaseEntity{
    private static final long serialVersionUID = 1L;

    @ValidateEntity(required = true,requiredLength =true,minLength = 4,maxLength = 18,errorRequiredMsg = "用户名不能为空",
            errorMaxLengthMsg = "用户名长度最大不能超过18",errorMinLengthMsg = "用户名长度最小不能小于4")
    @Column(name = "username",nullable = false,length = 18)
    private String username;

    @ValidateEntity(required = true,requiredLength =true,minLength = 6,maxLength = 18,errorRequiredMsg = "密码不能为空",
            errorMaxLengthMsg = "密码长度最大不能超过18",errorMinLengthMsg = "密码长度最小不能小于6")
    @Column(name="password",nullable = false,length = 18)
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
