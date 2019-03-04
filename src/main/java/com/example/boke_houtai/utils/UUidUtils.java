package com.example.boke_houtai.utils;

import java.util.UUID;

/**
 * UUID工具类
 * @author XingChunWei
 * @date 2019-3-4 下午17：14
 *
 */
public class UUidUtils {

    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }

}
