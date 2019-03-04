package com.example.boke_houtai.service.serviceImpl;

import com.example.boke_houtai.dao.ArticleMapper;
import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.service.ArticleService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Transactional
    @Override
    public void saveArticle(Article article) {
        articleMapper.saveArticle(article);
    }
}
