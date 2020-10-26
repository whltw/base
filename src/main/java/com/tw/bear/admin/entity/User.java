package com.tw.bear.admin.entity;

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

    @Column(name = "username",nullable = false,length = 18)
    private String username;

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