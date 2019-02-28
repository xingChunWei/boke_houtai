package com.example.boke_houtai;

import com.example.boke_houtai.dao.ArticleTypesMapper;
import com.example.boke_houtai.pojo.ArticleTypes;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BokeHoutaiApplicationTests {

    @Autowired
    private ArticleTypesMapper artileMapper;

    @Test
    public void contextLoads() {
        ArticleTypes articleTypes = new ArticleTypes();
        articleTypes.setArticleTypeName("Spring");
        articleTypes.setDescrib("框架");
        articleTypes.setState(0);
        articleTypes.setParentCategory(0);
        artileMapper.saveArtileTypl(articleTypes);
    }

}
