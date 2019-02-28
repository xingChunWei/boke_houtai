package com.example.boke_houtai.Controller;

import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.pojo.WebResult;
import com.example.boke_houtai.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
     * @param types
     * @return
     */
    @RequestMapping("/saveTypes")
    @ResponseBody
    public WebResult saveArtileTypes(ArticleTypes types) {
        WebResult webResult = new WebResult();
        try {
            articleService.saveArticleTypl(types);
            logger.info("文章分类添加成功");
            return webResult;
        } catch (Exception e) {
            e.getStackTrace();
            logger.info("添加文章分类出现异常");
            return webResult.put("code", 404);
        }

    }

    /**
     * 查询文章类型
     * @param request
     */
    @RequestMapping("/findArticleTypes")
    public ModelAndView  findArticleTypes(HttpServletRequest request){
        ModelAndView md= new ModelAndView();
        md.setViewName("wz_fl");

        logger.info("进入查询文章类型");
       List<ArticleTypes> articleTypes =  articleService.findAll();
       logger.info("查处结果");
       /*request.setAttribute("ArticleTypes",articleTypes);*/
        md.addObject("ArticleTypes",articleTypes);
       return md;
    }

}
