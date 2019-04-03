package com.example.boke_houtai.dao;

import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.utils.Page;
import com.example.boke_houtai.utils.PageUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 文章类型Mappper
 * @author  XingChunWei
 * @date   2019-2-28 下午13:50
 */
@Mapper
public interface ArticleTypesMapper {
    /**
     * 添加文章类型
     */
 public  void saveArtileTypl(ArticleTypes types);

 public List<ArticleTypes> findAll(ArticleTypes types);

 /**
  * 分页
  * @param page
  * @return
  */
 public List<ArticleTypes> findAllPage(Page page);

 void updataState(ArticleTypes types);

 /**
  * 单挑删除
  * @param id
  */
 void delArticleType(int id);

 /**
  * 多条删除
  * @param map
  */
 void delArray(Map<String,Integer[]> map);

 void  updataArticle(ArticleTypes articleTypes);

 int findCount();


}
