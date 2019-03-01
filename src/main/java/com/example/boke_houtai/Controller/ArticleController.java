package com.example.boke_houtai.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.pojo.JsonResult;
import com.example.boke_houtai.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import java.util.List;

/**
 * 文章
 *
 * @author XingChunWei
 * @ddata 2019-2-28 下午13:45
 */
@RestController
@RequestMapping("/article")
public class ArticleController {

    private Logger logger = LoggerFactory.getLogger(ArticleController.class);

    @Autowired
    private ArticleService articleService;

    /**
     * 添加文章分类
     *
     * @param types
     * @return
     */
    @RequestMapping("/saveTypes")
    public JsonResult saveArtileTypes(ArticleTypes types) {
        JsonResult jsonResult = new JsonResult();
        try {
            types.setState(0);//默认状态为0
            articleService.saveArticleTypl(types);
            logger.info("文章分类添加成功");
            return jsonResult;
        } catch (Exception e) {
            e.getStackTrace();
            logger.info("添加文章分类出现异常");
            jsonResult.setCode(404);
            return jsonResult;
        }

    }

   /**
     * 查询文章类型唯一
     *
     * @param
     */
    @RequestMapping("/findArticleTypes")
    public JsonResult findArticleTypes(ArticleTypes articleTypes) {
        JsonResult jsonResult = new JsonResult();
        List<ArticleTypes> articleTypeslist = articleService.findAll(articleTypes);
        if (articleTypeslist.size()!=0){
            jsonResult.setCode(300);
        }

        return jsonResult;
    }

    /**
     * 修改文章分类状态
     * @param articleTypes
     */
    @RequestMapping("/updateState")
    public void updateState(ArticleTypes articleTypes) {

        try {
            articleService.updataState(articleTypes);
            logger.info("文章分类修改状态成功");
        } catch (Exception e) {
            e.getStackTrace();
            logger.info("文章分类修改状态失败");
        }

    }

    /**
     * 删除文章分类
     * @param id
     */
    @RequestMapping("/delArticleType")
    public  void  delArticleType(int id){
        try{
            articleService.delArticleType(id);
            logger.info("刪除分类成功");
        }catch (Exception e){
            e.getStackTrace();
            logger.info("刪除分类失败");
        }

    }

}
