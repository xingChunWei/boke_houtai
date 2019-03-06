package com.example.boke_houtai.service.serviceImpl;

import com.example.boke_houtai.dao.ArticleMapper;
import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.service.ArticleService;
import com.example.boke_houtai.utils.PageUtils;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;


    @Override
    public void saveArticle(Article article) {
        articleMapper.saveArticle(article);
    }

    @Override
    public PageUtils findAllArticle(PageUtils pageUtils, Article article) {
        //数据总条数
        pageUtils.setCountSize(articleMapper.findCount(article));
        //数据总页数
        double countPage = (double) pageUtils.getCountSize() / pageUtils.getPageSize();
        pageUtils.setCountPage((int) Math.ceil(countPage));
        //文章状态
        int state = article.getState();
        //分页开始
        int start = (pageUtils.getCurrentPage() - 1) * pageUtils.getPageSize();
        //结束
        int end = pageUtils.getPageSize();

        List<Article> list=null;
        if (article.getaId() != null) {
            list = articleMapper.findAllArticleAid(article.getaId(),state, start, end);
        } else {
            list = articleMapper.findAllArticle(state, start, end);
        }

        pageUtils.setObjList(list);


        return pageUtils;
    }

    /**
     * 查看博客文章
     * @param id
     * @return
     */
    @Override
    public Article findOne(String id) {
        return articleMapper.findOne(id);
    }

    /**
     * 修改博客文章
     * @param article
     */
    @Override
    public void updatetArticle(Article article) {
        articleMapper.updatetArticle(article);
    }
}
