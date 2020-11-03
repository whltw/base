package com.tw.bear.entity.admin;

import com.tw.bear.annotion.ValidateEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 菜单实体类
 */
@Entity
@Table(name = "tw_menu")
@EntityListeners(AuditingEntityListener.class)
public class Menu extends BaseEntity{
    private static final long serialVersionUID = 1L;

    @ValidateEntity(required = true,requiredLength =true,minLength = 4,maxLength = 18,errorRequiredMsg = "菜单名称不能为空",
            errorMaxLengthMsg = "菜单名称长度最大不能超过18",errorMinLengthMsg = "菜单名称长度最小不能小于1")
    @Column(name = "name",nullable = false,length = 18)
    private String name;

    @ValidateEntity(required = false)
    @Column(name="url",length = 128)
    private String url;

    @ManyToOne
    @JoinColumn(name="parent_id")
    private Menu parent;

    @ValidateEntity(required = false)
    @Column(name="icon",length = 32)
    private String icon; //菜单图标

    @Column(name = "sort",nullable = false,length = 4)
    private Integer sort = 0;//菜单顺序，

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Menu getParent() {
        return parent;
    }

    public void setParent(Menu parent) {
        this.parent = parent;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", parent=" + parent +
                ", icon='" + icon + '\'' +
                ", sort=" + sort +
                '}';
    }
}
