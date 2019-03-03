package com.example.boke_houtai;

import com.example.boke_houtai.dao.ArticleTypesMapper;
import com.example.boke_houtai.pojo.ArticleTypes;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BokeHoutaiApplicationTests {

    @Autowired
    private  ArticleTypesMapper articleTypesMapper;
@Test
public  void  testC(){
 List<ArticleTypes>  list= articleTypesMapper.findAllPage(0,2);
    System.out.println(list.size());
}
}
