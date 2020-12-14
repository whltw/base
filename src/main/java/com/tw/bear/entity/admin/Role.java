package com.tw.bear.entity.admin;

import com.tw.bear.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.List;
    /**
     * 后台角色实体类
     */
    @Entity
    @Table(name = "tw_role")
    @EntityListeners(AuditingEntityListener.class)
    public class Role extends BaseEntity{
        private static final long serialVersionUID = 1L;

        private static final int ADMIN_ROLE_STATUS_ENABLE=1;

        private static final int ADMIN_ROLE_STATUS_DISABLE=0;

        @ValidateEntity(required = true,requiredLength =true,minLength = 2,maxLength = 18,errorRequiredMsg = "角色名称不能为空",
                errorMaxLengthMsg = "角色名称长度最大不能超过18",errorMinLengthMsg = "角色名称长度最小不能小于1")
        @Column(name = "name",nullable = false,length = 18)
        private String name;

        @ValidateEntity(required = false)
        @ManyToMany
        @Column(name="authorities",length = 128)
        private List<Menu> authorities;


        @ValidateEntity(required = false)
        @Column(name="status",length = 1)
        private int status = ADMIN_ROLE_STATUS_ENABLE;

        @ValidateEntity(required = false)
        @Column(name="remark",length = 128)
        private String remark;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public List<Menu> getAuthorities() {
            return authorities;
        }

        public void setAuthorities(List<Menu> authorities) {
            this.authorities = authorities;
        }

        public int getStatus() {
            return status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

        public String getRemark() {
            return remark;
        }

        public void setRemark(String remark) {
            this.remark = remark;
        }

        @Override
        public String toString() {
            return "Role{" +
                    "name='" + name + '\'' +
                    ", authorities=" + authorities +
                    ", status=" + status +
                    ", remark='" + remark + '\'' +
                    '}';
        }
    }
