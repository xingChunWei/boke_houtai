package com.example.boke_houtai.service.serviceImpl;

import com.example.boke_houtai.dao.ArticleMapper;
import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.service.ArticleService;
import com.example.boke_houtai.utils.Page;
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

    /**
     * 分页
     *
     * @param page
     * @return
     */
    @Override
    public List<Article> findAllArticle(Page page) {
        page.setStart((page.getPage()-1)*page.getLimit());
        return articleMapper.findAllArticle(page);
    }

    /**
     * 查看博客文章
     *
     * @param id
     * @return
     */
    @Override
    public Article findOne(String id) {
        return articleMapper.findOne(id);
    }

    /**
     * 修改博客文章
     *
     * @param article
     */
    @Override
    @Transactional
    public void updatetArticle(Article article) {
        articleMapper.updatetArticle(article);
    }


    /**
     * 统计个数
     * @param page
     * @return
     */
    @Override
    public int findCount(Page page) {


        return articleMapper.findCount(page);
    }
}
