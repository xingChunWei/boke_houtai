package com.example.boke_houtai.service;

import com.example.boke_houtai.pojo.ArticleTypes;

import java.util.List;

public interface ArticleService {

    void  saveArticleTypl(ArticleTypes types);

    List<ArticleTypes> findAll();
}
