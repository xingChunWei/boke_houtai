package com.example.boke_houtai.dao;

import com.example.boke_houtai.pojo.Comment;
import com.example.boke_houtai.utils.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {

    List<Comment> findComment(Page page);

    int findCount(Integer state);

    void delComment(Integer id);

    void updateComment(Comment comment);

   void saveComment(Comment comment);
}
