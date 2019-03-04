package com.example.boke_houtai.service.serviceImpl;

import com.example.boke_houtai.dao.ArticleTypesMapper;
import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.service.ArticleTypeService;
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
public class ArticleTypeServiceImpl implements ArticleTypeService {

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

    @Transactional
    @Override
    public void delArray(Integer[] ids) {
        Map<String,Integer[]> map = new HashMap<>();
        map.put("ids",ids);
        artileMapper.delArray(map);
    }

    @Transactional
    @Override
    public void updataArticle(ArticleTypes articleTypes) {
        artileMapper.updataArticle(articleTypes);
    }


    @Override
    public PageUtils findAll(PageUtils pageUtils){

        //每页多少条数据
        pageUtils.setPageSize(1);
        //数据总条数
        pageUtils.setCountSize(artileMapper.findCount());
        //总页数
        double countPage = pageUtils.getCountSize()/pageUtils.getPageSize();
        pageUtils.setCountPage((int)Math.ceil(countPage));
        //起始位置
        int start = (pageUtils.getCurrentPage()-1)*pageUtils.getPageSize();
        //每页数据
        List<ArticleTypes> list = artileMapper.findAllPage(start,pageUtils.getPageSize());
        pageUtils.setObjList(list);
        return pageUtils;

    }
}
