<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>邢小白的后台博客</title>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>

    <script src="/js/ZSY.js"></script>

    <link rel="stylesheet" href="/css/one.css">
    <link rel="stylesheet" href="/css/ht_index.css">

</head>
<body>

<div id="contrainerFrame">
    <!--头部-->
    <div id="headerFrame" style="background-color: #363a47">

    </div>

    <div id="contentFrame">
        <!--左边导航目录-->
        <div id="menuFrame" class="left-ml">
            <ul>
                <li>
                    <h2>主页</h2>
                </li>
                <li>
                    <h2 onclick="tz('/index/bjboKe')">编辑博客</h2>
                </li>
                <li>
                    <h2 onclick="tz('/index/wzgl')">文章管理</h2>
                </li>
                <li>
                    <h2>留言</h2>
                </li>
                <li>
                    <h2>评论</h2>
                </li>
            </ul>
        </div>
        <%--<div style="position: absolute;width: 100%;height: 50px;top: 60px; left: 250px;border-bottom: 2px solid #000000;background-color: white">

        </div>--%>
        <div id="mainFrame" style="background-color: #dff0d8;" >
            <iframe width="100%" height="100%" id="ifrom" src="" frameborder="0">

            </iframe>
        </div>
    </div>
</div>

<script>
    function tz(url) {
        $("#ifrom").attr('src',url);
    }
</script>
</body>
</html>