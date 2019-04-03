package com.example.boke_houtai.Controller;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.utils.JsonResult;
import com.example.boke_houtai.service.ArticleService;
import com.example.boke_houtai.utils.Page;
import com.example.boke_houtai.utils.UUidUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ArticleService articleService;

    /**
     * 添加博客文章
     *
     * @param article
     * @return
     */
    @RequestMapping("/saveArticle")
    @ResponseBody
    public JsonResult saveArticle(Article article) {
        JsonResult jsonResult = new JsonResult();
        article.setId(UUidUtils.getUUID());
        article.setCreationTime(new Date());
        article.setReadNumber("0");
        article.setLikes("0");
        article.setFounder("邢小白的青春");
        try {
            articleService.saveArticle(article);
        } catch (Exception e) {
            e.getStackTrace();
            logger.info("添加博客失败");
            jsonResult.setCode(300);
        }

        return jsonResult;
    }

    /**
     * 查看博客文章
     *
     * @return
     */
    @RequestMapping("/wzck")
    public String findOne(Model model, String id) {
        Article article = articleService.findOne(id);
        model.addAttribute("article", article);
        return "wz_ck";
    }

    /**
     * 查詢所有文章
     *
     * @param page
     * @return
     */
    @RequestMapping("/wzglList")
    @ResponseBody
    public JsonResult findAll(Page page) {
        JsonResult jsonResult = new JsonResult();
        jsonResult.setCount(articleService.findCount(page));
        List<Article> list = articleService.findAllArticle(page);
        jsonResult.setData(list);
        return jsonResult;
    }

    /**
     * 修改博客
     *
     * @return
     */
    @RequestMapping("/updateArticle")
    @ResponseBody
    public JsonResult updateArticle(Article article) {
        JsonResult jsonResult = new JsonResult();
        try {
            articleService.updatetArticle(article);
        } catch (Exception e) {
            e.getStackTrace();
            jsonResult.setCode(300);
            logger.info("修改博客失败！");
        }

        return jsonResult;
    }

    /**
     * 查询文章
     *
     * @param article
     * @return
     */
    @RequestMapping("/findOne")
    @ResponseBody
    public JsonResult findOne1(Article article) {
        JsonResult jsonResult = new JsonResult();
        Article article1 = articleService.findOne(article.getId());
        List<Article> articles;
        if (article1 != null) {
            articles = new ArrayList<>();
            articles.add(article1);
            jsonResult.setData(articles);
        }
        return jsonResult;
    }

    /**
     * 删除文章
     *
     * @param article
     * @return
     */
    @RequestMapping(value = "/delArticle", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult delArticle(Article article) {
        JsonResult jsonResult = new JsonResult();
        try {
            article.setState(2);//删除状态
            articleService.updatetArticle(article);
        } catch (Exception e) {
            e.getStackTrace();
            jsonResult.setCode(300);
            logger.info("删除失败");
        }


        return jsonResult;
    }
}
