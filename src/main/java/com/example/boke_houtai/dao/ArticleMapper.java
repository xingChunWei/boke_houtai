package com.example.boke_houtai.dao;

import com.example.boke_houtai.pojo.Article;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ArticleMapper {

    void saveArticle(Article article);
}
