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


import java.util.List;

/**
 * 文章
 *
 * @author XingChunWei
 * @ddata 2019-2-28 下午13:45
 */
@Controller
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
    @ResponseBody
    public JsonResult saveArtileTypes(ArticleTypes types) {
        JsonResult jsonResult = new JsonResult();
        try {
            articleService.saveArticleTypl(types);
            logger.info("文章分类添加成功");
            jsonResult.setCode(200);
            return jsonResult;
        } catch (Exception e) {
            e.getStackTrace();
            logger.info("添加文章分类出现异常");
            jsonResult.setCode(404);
            return jsonResult;
        }

    }

    /**
     * 查询文章类型
     *
     * @param
     */
    @RequestMapping("/findArticleTypes")
    @ResponseBody
    public JsonResult findArticleTypes() {
        JsonResult jsonResult = new JsonResult();
        List<ArticleTypes> articleTypeslist = articleService.findAll();
        jsonResult.setObj(articleTypeslist);
        return jsonResult;
    }

}
