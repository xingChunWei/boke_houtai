package com.example.boke_houtai.service;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.pojo.Comment;
import com.example.boke_houtai.utils.Page;

import java.util.List;

public interface CommentService {
    List<Comment> findComment(Page page);

    int findCount(Integer state);

    void  delComment(Integer id);

    void updateComment(String id);

    void saveComment(Comment comment,String id);
}
