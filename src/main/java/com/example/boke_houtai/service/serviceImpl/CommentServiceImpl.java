package com.example.boke_houtai.service.serviceImpl;

import com.example.boke_houtai.dao.CommentMapper;
import com.example.boke_houtai.pojo.Article;
import com.example.boke_houtai.pojo.Comment;
import com.example.boke_houtai.service.CommentService;
import com.example.boke_houtai.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 评论Service
 *
 * @author XingChunWei
 * @date 2019-3-25 16:25
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> findComment(Page page) {
        page.setStart((page.getPage() - 1) * page.getLimit());
        return commentMapper.findComment(page);
    }

    @Override
    public int findCount(Integer state) {
        return commentMapper.findCount(state);
    }

    @Override
    public void delComment(Integer id) {
        commentMapper.delComment(id);
    }

    @Override
    public void updateComment(String id) {

    }

    @Override
    public void saveComment(Comment comment,String id) {


        commentMapper.saveComment(comment);//回复评论

        Comment comment1 = new Comment();
        comment1.setId(id);
        comment1.setState(1);
        commentMapper.updateComment(comment1);//修改上级评论的状态
    }
}
