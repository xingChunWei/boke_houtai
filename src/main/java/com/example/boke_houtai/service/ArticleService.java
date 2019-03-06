package com.example.boke_houtai.service;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.utils.PageUtils;

public interface ArticleService {

    void  saveArticle(Article article);


    PageUtils findAllArticle(PageUtils pageUtils,Article article);

    Article findOne(String id);


    void  updatetArticle(Article article);
}
