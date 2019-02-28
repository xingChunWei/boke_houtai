package com.example.boke_houtai.config;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.ArrayList;
import java.util.List;

/**
 * 整合FastJson
 */
@Configuration
public class FastConfig extends WebMvcConfigurerAdapter {
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters){
        //调用父类配置
        super.configureMessageConverters(converters);
        //需要先定义一个convert转换消息对象
        FastJsonHttpMessageConverter fastJsonHttpMessageConverter  = new FastJsonHttpMessageConverter();
        //添加fastjson的配置信息，比如：是否要返回json格式化数据
        FastJsonConfig fastJsonConfig  = new FastJsonConfig();
        //在convert中添加配置信息
        fastJsonConfig.setSerializerFeatures(
                SerializerFeature.PrettyFormat
        );
        fastJsonHttpMessageConverter.setFastJsonConfig(fastJsonConfig);
        //处理中文乱码问题
        List<MediaType> fastMediaType = new ArrayList<>();
        fastMediaType.add(MediaType.APPLICATION_JSON_UTF8);
        fastJsonHttpMessageConverter.setSupportedMediaTypes(fastMediaType);
        converters.add(fastJsonHttpMessageConverter);
    }


}
