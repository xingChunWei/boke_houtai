package com.example.boke_houtai.service.serviceImpl;

import com.example.boke_houtai.dao.ArticleTypesMapper;
import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 文章Service
 *
 * @author XingChunWei
 * @date 2019-2-28 下午13:49
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleTypesMapper artileMapper;

    @Transactional
    @Override
    public void saveArticleTypl(ArticleTypes types) {
        artileMapper.saveArtileTypl(types);
    }

    @Override
    public List<ArticleTypes> findAll(ArticleTypes types) {
        return artileMapper.findAll(types);
    }

    @Transactional
    @Override
    public void updataState(ArticleTypes articleTypes) {
        artileMapper.updataState(articleTypes);

    }

    @Transactional
    @Override
    public void delArticleType(int id) {
        artileMapper.delArticleType(id);
    }
}
