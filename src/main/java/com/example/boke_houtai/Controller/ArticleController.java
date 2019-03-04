package com.example.boke_houtai.Controller;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.pojo.JsonResult;
import com.example.boke_houtai.service.ArticleService;
import com.example.boke_houtai.utils.UUidUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@RequestMapping("/article")
public class ArticleController {


    @Autowired
    private ArticleService articleService;

    /**
     * 添加博客文章
     * @param article
     * @return
     */
    @RequestMapping("/saveArticle")
    public JsonResult saveArticle(Article article){
        JsonResult jsonResult = new JsonResult();
        article.setId(UUidUtils.getUUID());
        article.setCreationTime(new Date());

        try {
            articleService.saveArticle(article);
        }catch (Exception e){
            e.getStackTrace();
            jsonResult.setCode(300);
        }

        return jsonResult;
    }
}
