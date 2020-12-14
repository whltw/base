package com.tw.bear.bean;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PageBean<T> {
    private int currentPage = 1; //当前页码

    private int pageSize = 10; //每页显示数量

    private long total = 0;  //总页数

    private List<T> content; //查询的数据

    private int showPageSize = 5; //显示在页面可快速跳转的页码个数

    private List<Integer> currentShowPage; //当前显示在页面快速跳转的页码

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getContent() {
        return content;
    }

    public void setContent(List<T> content) {
        this.content = content;
    }

    public int getShowPageSize() {
        return showPageSize;
    }

    public void setShowPageSize(int showPageSize) {
        this.showPageSize = showPageSize;
    }

    public List<Integer> getCurrentShowPage() {
        //总数不超过每页显示数，公有一页
        if(total<=pageSize){
            return currentShowPage;
        }
        //向后显示页面
        for(int i=currentPage;i<total;i++){
            currentShowPage.add(i);
            if(i>total)
                break;
            if(i>=(showPageSize+currentPage)){
                break;
            }


        }

        //向前显示页面
        for(int i=currentPage-1;i > 0;i--){
            currentShowPage.add(i);
            if(i < 1)
                break;
            if(i<=(showPageSize-currentPage)){
                break;
            }


        }

        return currentShowPage;
    }

    public void setCurrentShowPage(List<Integer> currentShowPage) {
        this.currentShowPage = currentShowPage;
    }
}