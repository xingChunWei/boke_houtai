package com.example.boke_houtai.utils;

import java.util.List;

/**
 * 分页Utils
 * @author XingChunWei
 * @date 2019-3-3 上午 11：33
 */
public class PageUtils<T> {
    private  int  currentPage=1; //当前页
    private  int  pageSize ;  //每页条数
    private  int  countSize; //总条数
    private  int countPage;  //总页数
    private List<T> objList;  //内容


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

    public int getCountSize() {
        return countSize;
    }

    public void setCountSize(int countSize) {
        this.countSize = countSize;
    }

    public int getCountPage() {
        return countPage;
    }

    public void setCountPage(int countPage) {
        this.countPage = countPage;
    }

    public List<T> getObjList() {
        return objList;
    }

    public void setObjList(List<T> objList) {
        this.objList = objList;
    }
}
