<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en"
      xmlns:th="http://www.thymeleaf.org"
>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>邢小白的个人博客</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <!---------------wangEditor富文本编辑器--------->
    <script src="/js/wangEditor.js"></script>

    <link rel="stylesheet" href="/css/one.css">
    <link rel="stylesheet" href="/css/ht_index.css">

</head>
<body>
<!--博客文章字体-->
<div class="wZText_mai" style="background-color: white">
    <!--标题-->
    <h2 class="wz_text_bt">
        ${article.title}</h2>
    <div class="wz_text_xx">
        <span>发布时间：</span><span><fmt:formatDate value="${article.creationTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span>
       <span class="wz_text_xx_kg"></span>
        <span>作者：</span><span>${article.founder}</span>
        <span class="wz_text_xx_kg"></span>
        <span>阅读：</span><span>${article.readNumber}</span>
        <span class="wz_text_xx_kg"></span>
        <span>评论：</span><span>525</span>
    </div>

    <!--文字-->
    <div class="wz_text_font">
        　${article.content}
    </div>
    <div>
        <p style="padding: 10px;font-size: 16px;color: red">
            版权声明：本文版权归作者（<span>邢小白的春天</span>）所有，欢迎转载。但未经作者同意必须保留此段声明，且在文章页面明显位置给出原文连接，否则保留追究法律责任的权利。
        </p>
    </div>
</div>
</body>
</html>