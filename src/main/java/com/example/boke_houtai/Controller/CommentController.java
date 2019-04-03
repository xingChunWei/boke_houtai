package com.example.boke_houtai.Controller;

import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.pojo.Comment;
import com.example.boke_houtai.service.CommentService;
import com.example.boke_houtai.utils.JsonResult;
import com.example.boke_houtai.utils.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * 评论Controller
 *
 * @author XingChunWei
 * @date 2019-3-25
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private CommentService commentService;

    /**
     * 查询所有文章评论
     *
     * @param page
     * @return
     */
    @RequestMapping("/findPageComment")
    @ResponseBody
    public JsonResult findComment(Page page) {
        JsonResult jsonResult = new JsonResult();
        jsonResult.setCount(commentService.findCount(page.getState()));
        List<Comment> articles = commentService.findComment(page);
        if (articles.size() != 0 && articles != null) {
            jsonResult.setData(articles);
        }
        logger.info("评论文章：{}篇", articles.size());

        return jsonResult;
    }

    /**
     * 刪除评论
     *
     * @return id
     */
    @RequestMapping("/delComment")
    @ResponseBody
    public JsonResult delComment(Integer id) {
        JsonResult jsonResult = new JsonResult();
        try {
            commentService.delComment(id);
        } catch (Exception e) {
            jsonResult.setCode(300);
            e.getStackTrace();
            logger.info("删除评论失败");
        }
        return jsonResult;
    }

    /**
     * 回复评论
     *
     * @param comment
     * @param id
     * @return
     */
    @RequestMapping(value = "/saveComment", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult saveComment(Comment comment, @RequestParam("oneId")String id) {
        JsonResult jsonResult = new JsonResult();
        comment.setUserName("青春");
        comment.setCommentTime(new Date());
        comment.setnId(Integer.parseInt(id));//添加评论上级Id
        comment.setState(1);
        try {
            commentService.saveComment(comment,id);
            //commentService.updateComment(id);//并修改回复评论的状态
        } catch (Exception e) {
            e.getStackTrace();
            logger.info("回复评论失败！！");
            jsonResult.setCode(300);
        }
        return jsonResult;
    }

}
