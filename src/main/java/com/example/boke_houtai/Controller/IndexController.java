package com.example.boke_houtai.Controller;

import com.example.boke_houtai.pojo.ArticleTypes;
import com.example.boke_houtai.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 博客后台页面相关跳转
 * @author XingChunWei
 * @data 2019-2-26 18:29
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    private Logger logger = LoggerFactory.getLogger(IndexController.class);
    @Autowired
    private ArticleService articleService;

    /**
     * 登录
     * @param
     * @return
     */
    @RequestMapping("/login")
    public String getlogin() {


        return "login";

    }

    /**
     * 后台
     * @return
     */
    @RequestMapping("/Uindex")
    public  String getIndex( ){

        return "index";
    }

    /**
     * 编辑博客
     * @return
     */
    @RequestMapping("/bjboKe")
    public String bjboKe(){

        return "bjboKe";
    }

    /**
     * 文章管理
     * @return
     */
    @RequestMapping("/wzgl")
    public String wzgl(){

        return "wz_gl";
    }

    /**
     * 留言管理
     * @return
     */
    @RequestMapping("/wzly")
    public String wzly(){

        return "wz_ly";
    }

    /**
     * 文章评论
     * @return
     */
    @RequestMapping("/wzpl")
    public String wzpl(){

        return "wz_pl";
    }

    /**
     * 文章分类
     * @return
     */
    @RequestMapping("/wzfl")
    public String wzfl(HttpServletRequest request){
        List<ArticleTypes> articleTypes =  articleService.findAll();
        logger.info("查处结果");
        request.setAttribute("articleTypes",articleTypes);
        return "wz_fl";
    }

}
