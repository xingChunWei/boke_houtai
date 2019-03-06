package com.example.boke_houtai.dao;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.utils.PageUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ArticleMapper {
    /**
     * 添加博客文章
     * @param article
     */
    void saveArticle(Article article);

    /**
     * 分页查询
     * @param state 文章状态
     * @param start 开始
     * @param end   结束
     * @return
     */
    List<Article> findAllArticle(int state,int start ,int end);
    //单一文章类型
    List<Article> findAllArticleAid(int aId,int state,int start ,int end);

    /**
     * 统计数量
     * @param article
     * @return
     */
    int findCount(Article article);

    /**
     * 查看博客
     * @param id
     * @return
     */
    Article findOne(String id);

    /**
     * 删除博客
     * @param article
     */
    void  updatetArticle(Article article);
}
