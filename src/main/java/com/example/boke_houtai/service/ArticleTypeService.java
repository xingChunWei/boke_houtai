package com.example.boke_houtai.service;

import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.utils.Page;
import com.example.boke_houtai.utils.PageUtils;

import java.util.List;

public interface ArticleTypeService {

    void  saveArticleTypl(ArticleTypes types);

    List<ArticleTypes> findAll(ArticleTypes types);

    List<ArticleTypes> findAllPage(Page page);
    void  updataState(ArticleTypes articleTypes);

    void  delArticleType(int id);

    void  delArray(Integer[] ids);

    void  updataArticle(ArticleTypes articleTypes);

    int findCount();
}
