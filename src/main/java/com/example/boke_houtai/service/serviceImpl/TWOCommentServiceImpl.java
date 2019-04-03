package com.example.boke_houtai.service.serviceImpl;

import com.example.boke_houtai.dao.TWOCommentMapper;
import com.example.boke_houtai.pojo.TWOComment;
import com.example.boke_houtai.service.TWOCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 二级评论Service
 *
 * @author XingChunWei
 * @date 2019-3-28 13:40
 */
@Service
@Transactional
public class TWOCommentServiceImpl implements TWOCommentService {

    @Autowired
    private TWOCommentMapper twoCommentMapper;

    @Override
    public void saveTWOComment(TWOComment twoComment) {
        twoCommentMapper.saveTWOComment(twoComment);
    }
}
