package com.example.boke_houtai.Controller;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.service.ArticleService;
import com.example.boke_houtai.service.ArticleTypeService;
import com.example.boke_houtai.utils.PageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

/**
 * 博客后台页面相关跳转
 *
 * @author XingChunWei
 * @data 2019-2-26 18:29
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    private Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Autowired
    private ArticleTypeService articleTypeService;

    @Autowired
    private ArticleService articleService;

    /**
     * 登录
     *
     * @param
     * @return
     */
    @RequestMapping("/login")
    public String getlogin() {


        return "login";

    }

    /**
     * 后台
     *
     * @return
     */
    @RequestMapping("/Uindex")
    public String getIndex() {

        return "index";
    }

    /**
     * 编辑博客
     *
     * @return
     */
    @RequestMapping("/bjboKe")
    public String bjboKe(HttpServletRequest request,Article article) {
        return "bjboKe";
    }

    /**
     * 文章管理
     *
     * @return
     */
    @RequestMapping("/wzgl")
    public String wzgl(HttpServletRequest request, PageUtils pageUtils, Article article) {

        //发布文章状态
        article.setState(1);
        PageUtils pageUtils1 = articleService.findAllArticle(pageUtils,article);
        request.setAttribute("pageUtils1",pageUtils1);
        return "wz_gl";
    }

    /**
     * 留言管理
     *
     * @return
     */
    @RequestMapping("/wzly")
    public String wzly() {

        return "wz_ly";
    }

    /**
     * 文章评论
     *
     * @return
     */
    @RequestMapping("/wzpl")
    public String wzpl() {

        return "wz_pl";
    }

    /**
     * 文章分类
     *
     * @return
     */
    @RequestMapping("/wzfl")
    public String wzfl(HttpServletRequest request, PageUtils pageUtils) {
       /* List<ArticleTypes> articleTypes = articleService.findAll(new ArticleTypes());*/
      PageUtils pageUtils1 =   articleTypeService.findAll(pageUtils);
        logger.info("查处结果");
        request.setAttribute("pageUtils1", pageUtils1);
        return "wz_fl";
    }

    /**
     * 文件上传
     * @return
     */
    @RequestMapping("/file_manager_json")
    public String uplo(){

        return "file_manager_json";
    }

    @RequestMapping("/upload_json")
    public String uploHuiX(){

        return "upload_json";
    }

    /**
     * 草稿
     * @return
     */
    @RequestMapping("wzcg")
    public  String wzcg(){

        return "wz_cg";
    }
}
