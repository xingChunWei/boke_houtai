package com.example.boke_houtai.pojo;

import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * 文章类型
 */
@Component
public class ArticleTypes implements Serializable {

    private  Integer id;
    private  String articleTypeName; //文章分类名称
    private  String describ; //描述
    private  Integer state;  //状态  1：可用 /0不可用

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArticleTypeName() {
        return articleTypeName;
    }

    public void setArticleTypeName(String articleTypeName) {
        this.articleTypeName = articleTypeName;
    }

    public String getDescrib() {
        return describ;
    }

    public void setDescrib(String describ) {
        this.describ = describ;
    }


    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
