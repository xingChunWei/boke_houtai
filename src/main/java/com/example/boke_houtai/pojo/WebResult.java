package com.example.boke_houtai.pojo;

import java.util.HashMap;

/**
 * @Auther: XingChunWei
 * @Date: 2019-2-28 下午14:01
 * @Description:
 */

public class WebResult extends HashMap<String, Object> {

    private static final long serialVersionUID = 1L;

    /**
     * 初始化一个新创建的 Message 对象
     */
    public WebResult() {
    }

    /**
     * 返回错误消息
     *
     * @return 错误消息
     */
    public static WebResult error() {
        return error(1, "操作失败");
    }

    /**
     * 返回错误消息
     *
     * @param msg 内容
     * @return 错误消息
     */
    public static WebResult error(String msg) {
        return error(500, msg);
    }

    /**
     * 返回错误消息
     *
     * @param code 错误码
     * @param msg  内容
     * @return 错误消息
     */
    public static WebResult error(int code, String msg) {
        WebResult json = new WebResult();
        json.put("code", code);
        json.put("msg", msg);
        return json;
    }

    /**
     * 返回成功消息
     *
     * @param msg 内容
     * @return 成功消息
     */
    public static WebResult success(String msg) {
        WebResult json = new WebResult();
        json.put("code", 200);
        json.put("msg", msg);
        return json;
    }

    public static WebResult success(Object obj) {
        WebResult json = new WebResult();
        json.put("code", 200);
        json.put("msg", "操作成功");
        json.put("obj", obj);
        return json;
    }

    /**
     * 返回成功消息
     *
     * @return 成功消息
     */
    public static WebResult success() {
        return WebResult.success("操作成功");
    }

    /**
     * 返回成功消息
     *
     * @param key   键值
     * @param value 内容
     * @return 成功消息
     */
    @Override
    public WebResult put(String key, Object value) {
        super.put(key, value);
        return this;
    }

}
