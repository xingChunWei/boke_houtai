package com.example.boke_houtai.service;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.utils.PageUtils;

import java.util.List;

public interface ArticleService {

    void  saveArticle(Article article);


    List<Article> findAllArticle(Integer state, Integer page, Integer limit);

    Article findOne(String id);


    void  updatetArticle(Article article);
}
