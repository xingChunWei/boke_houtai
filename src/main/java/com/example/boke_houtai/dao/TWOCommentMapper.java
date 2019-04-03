package com.example.boke_houtai.dao;

import com.example.boke_houtai.pojo.TWOComment;
import org.apache.ibatis.annotations.Mapper;

/**
 * 二级评论Dao
 * @author XingChunWei
 * @date 2019-3-28 13:34
 */
@Mapper
public interface TWOCommentMapper {

  void   saveTWOComment(TWOComment twoComment);
}
