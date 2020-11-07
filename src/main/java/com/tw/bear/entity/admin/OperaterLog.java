package com.tw.bear.entity.admin;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name="tw_operater_log")
@EntityListeners(AuditingEntityListener.class)
public class OperaterLog extends BaseEntity {

    private  static  final long serialVersionUID =1l;
    @Column(name = "operator",nullable=false,length = 18)
    private String operator; //操作者

    @Column(name = "content",nullable=false,length = 1024)
    private  String content;//操作内容


    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
