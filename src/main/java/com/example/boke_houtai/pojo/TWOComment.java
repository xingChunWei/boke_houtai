package com.example.boke_houtai.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TWOComment {
    private String id;

    private String commentText;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date commentTime;

    private String userName;

    private String twoUserName; //被评论者
    private String OneCommentID;//上级评论ID

    private Integer state;//状态  1审核通过  2 未通过


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTwoUserName() {
        return twoUserName;
    }

    public void setTwoUserName(String twoUserName) {
        this.twoUserName = twoUserName;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOneCommentID() {
        return OneCommentID;
    }

    public void setOneCommentID(String oneCommentID) {
        OneCommentID = oneCommentID;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
