package com.example.boke_houtai.pojo;

import java.io.Serializable;

/**
 * 文章类型
 */
public class ArticleTypes implements Serializable {

    private  Integer ID;

    private  String ArticleTypeName; //文章分类名称

    private  String describ; //描述

    private  Integer  parentCategory ;  //父级分类

    private  Integer state;  //状态  1：可用 /0不可用

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getArticleTypeName() {
        return ArticleTypeName;
    }

    public void setArticleTypeName(String articleTypeName) {
        ArticleTypeName = articleTypeName;
    }

    public String getDescrib() {
        return describ;
    }

    public void setDescrib(String describ) {
        this.describ = describ;
    }

    public Integer getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(Integer parentCategory) {
        this.parentCategory = parentCategory;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
