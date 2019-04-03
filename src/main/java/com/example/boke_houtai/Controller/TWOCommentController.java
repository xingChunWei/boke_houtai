package com.example.boke_houtai.Controller;

import com.example.boke_houtai.pojo.Comment;
import com.example.boke_houtai.pojo.TWOComment;
import com.example.boke_houtai.service.CommentService;
import com.example.boke_houtai.service.TWOCommentService;
import com.example.boke_houtai.utils.JsonResult;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * 留言Controller
 *
 * @author XingChunWei
 * @date 2019-3-28 14:30
 */
@Controller
@RequestMapping("/TWOComment")
public class TWOCommentController {


    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private TWOCommentService twoCommentService;

    @Autowired
    private CommentService commentService;

    /**
     * 添加二级评论
     *
     * @param twoComment
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult saveTWOComment(TWOComment twoComment) {

        return null;
    }

}
