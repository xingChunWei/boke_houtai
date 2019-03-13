package com.example.boke_houtai.Controller;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.pojo.JsonResult;
import com.example.boke_houtai.service.ArticleService;
import com.example.boke_houtai.utils.UUidUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

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
    @RequestMapping("/wZText")
    public String findOne(HttpServletRequest request, String id) {
        Article article = articleService.findOne(id);
        request.setAttribute("article", article);
        return "wZText";
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
        }

        return jsonResult;
    }

    @RequestMapping("/findOne")
    public JsonResult findOne1(Article article) {
        JsonResult jsonResult = new JsonResult();
        Article article1 = articleService.findOne(article.getId());


        return jsonResult;

    }
}
