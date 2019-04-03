package com.example.boke_houtai.service.serviceImpl;

import com.example.boke_houtai.dao.ArticleTypesMapper;
import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.service.ArticleTypeService;
import com.example.boke_houtai.utils.Page;
import com.example.boke_houtai.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章Service
 *
 * @author XingChunWei
 * @date 2019-2-28 下午13:49
 */
@Service
@Transactional
public class ArticleTypeServiceImpl implements ArticleTypeService {

    @Autowired
    private ArticleTypesMapper artileMapper;

    @Override
    public void saveArticleTypl(ArticleTypes types) {
        artileMapper.saveArtileTypl(types);
    }

    @Override
    public List<ArticleTypes> findAll(ArticleTypes types) {
        return artileMapper.findAll(types);
    }

    /**
     * 分页
     * @param page
     * @return
     */
    @Override
    public List<ArticleTypes> findAllPage(Page page) {
        page.setStart((page.getPage()-1)*page.getLimit());
        return artileMapper.findAllPage(page);
    }

    @Transactional
    @Override
    public void updataState(ArticleTypes articleTypes) {
        artileMapper.updataState(articleTypes);

    }

    @Override
    public void delArticleType(int id) {
        artileMapper.delArticleType(id);
    }

    @Override
    public void delArray(Integer[] ids) {
        Map<String,Integer[]> map = new HashMap<>();
        map.put("ids",ids);
        artileMapper.delArray(map);
    }

    @Override
    public void updataArticle(ArticleTypes articleTypes) {
        artileMapper.updataArticle(articleTypes);
    }


    @Override
    public int findCount() {
        return artileMapper.findCount();
    }


}
