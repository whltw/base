package com.tw.bear.entity.admin;

import com.tw.bear.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 后台用户实体类
 */
@Entity
@Table(name = "tw_user")
@EntityListeners(AuditingEntityListener.class)
public class User extends BaseEntity{
    private static final long serialVersionUID = 1L;

    private static final int USER_SEX_MAN =1; //性别为男

    private static final int USER_SEX_WOMAN =2; //性别为女

    private static final int USER_SEX_UNKNOW =0; //性别未知

    private static final  int ADMIN_USER_STATUS_ENABLE = 1; //用户状态可用

    private static final  int ADMIN_USER_STATUS_DISABLE = 0; //用户状态不可用
    @ValidateEntity(required = true,requiredLength =true,minLength = 4,maxLength = 18,errorRequiredMsg = "用户名不能为空",
            errorMaxLengthMsg = "用户名长度最大不能超过18",errorMinLengthMsg = "用户名长度最小不能小于4")
    @Column(name = "username",nullable = false,length = 18)
    private String username;

    @ValidateEntity(required = true,requiredLength =true,minLength = 6,maxLength = 18,errorRequiredMsg = "密码不能为空",
            errorMaxLengthMsg = "密码长度最大不能超过18",errorMinLengthMsg = "密码长度最小不能小于6")
    @Column(name="password",nullable = false,length = 18)
    private String password;

    @ValidateEntity(required = false)
    @Column(name="head_pic",length = 128)
    private String headPic;

    @ValidateEntity(required = false)
    @Column(name="mobile",length = 12)
    private String mobile;

    @ValidateEntity(required = false)
    @Column(name="email",length = 18)
    private String email;

    @ValidateEntity(required = false)
    @Column(name="sex",length = 1)
    private int sex;

    @ValidateEntity(required = false)
    @Column(name="status",length = 1)
    private int status = ADMIN_USER_STATUS_ENABLE;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

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

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", headPic='" + headPic + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", sex=" + sex +
                ", status=" + status +
                ", role=" + role +
                '}';
    }
}
