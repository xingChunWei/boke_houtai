package com.example.boke_houtai.dao;

import com.example.boke_houtai.pojo.ArticleTypes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 文章Mappper
 * @author  XingChunWei
 * @date   2019-2-28 下午13:50
 */
@Mapper
public interface ArticleTypesMapper {
    /**
     * 添加文章类型
     */
 public  void saveArtileTypl(ArticleTypes types);

 public List<ArticleTypes> findAll();


}
