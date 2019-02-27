package com.example.boke_houtai.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 博客后台页面相关跳转
 * @author XingChunWei
 * @data 2019-2-26 18:29
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    /**
     * 登录
     * @param request
     * @return
     */
    @RequestMapping("/login")
    public String getIndex(HttpServletRequest request) {


        return "login";

    }

    /**
     * 后台
     * @return
     */
    @RequestMapping("/Uindex")
    public  String getIndex(){

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


}