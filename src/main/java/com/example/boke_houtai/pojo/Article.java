package com.example.boke_houtai.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 文章实体
 */
public class Article {

    private String id;
    private String title;//标题
    private String content;//内容
    private String founder;//创建人
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date creationTime;//创建时间
    private Date alterTime;//修改时间
    private String readNumber;//文章阅读量
    private String likes;   //文章点赞量
    private Integer aId; //外键文章类型
    private Integer state;  //状态:2 回收站，1 已发布 ，0：草稿s

    private ArticleTypes articleTypes;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFounder() {
        return founder;
    }

    public void setFounder(String founder) {
        this.founder = founder;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public Date getAlterTime() {
        return alterTime;
    }

    public void setAlterTime(Date alterTime) {
        this.alterTime = alterTime;
    }

    public String getReadNumber() {
        return readNumber;
    }

    public void setReadNumber(String readNumber) {
        this.readNumber = readNumber;
    }

    public String getLikes() {
        return likes;
    }

    public void setLikes(String likes) {
        this.likes = likes;
    }

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public ArticleTypes getArticleTypes() {
        return articleTypes;
    }

    public void setArticleTypes(ArticleTypes articleTypes) {
        this.articleTypes = articleTypes;
    }
}
