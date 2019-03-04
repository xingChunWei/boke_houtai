package com.example.boke_houtai.service;

import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.utils.PageUtils;

import java.util.List;

public interface ArticleTypeService {

    void  saveArticleTypl(ArticleTypes types);

    List<ArticleTypes> findAll(ArticleTypes types);

    PageUtils findAll(PageUtils types);

    void  updataState(ArticleTypes articleTypes);

    void  delArticleType(int id);

    void  delArray(Integer[] ids);

    void  updataArticle(ArticleTypes articleTypes);
}
