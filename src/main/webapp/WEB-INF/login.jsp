<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录页面</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/one.css">
    <link rel="stylesheet" href="/css/use.css">
    <style>
        body {
            background: url(/img/timg.png) no-repeat;
            width: 100%;
            height: 100%;
            background-size: 100% 100%;
            filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='/img/veer-104218671.png');
        }
    </style>
</head>
<body>
<div class="main">
    <div class="hi">
        <div class="hi-text">
            <h1>
                博客后台管理系统
            </h1>
        </div>
    </div>
    <div style="margin-top: 30px">
        <form class="form-horizontal">
            <div class="form-group" style="margin-left:auto ">
                <label for="inputEmail3" class="col-sm-2 control-label">账号:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" style="width: 300px" id="inputEmail3" placeholder="账号">
                </div>
            </div>
            <div class="form-group" style="margin-left:auto ">
                <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" style="width: 300px" id="inputPassword3" name="password"
                           placeholder="密码">
                </div>
            </div>
            <div class="form-group" style="margin-left:auto ">
                <label for="inputPassword3" class="col-sm-2 control-label">验证码:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" style="width: 100px;display: inline-block" id="printR"
                           name="password" placeholder="验证码">
                    <img id="img" style="display: inline-block;width: 100px;margin-left: 20px"
                         src="/user/userInfo/verification">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> 记住密码
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="margin-left: 150px">
                    <button type="submit" style="width: 150px" class="btn btn-primary btn-sm">登录</button>
                </div>
            </div>
        </form>
        <div class="zhuC">
            <div>
                <a href="#">忘记密码？</a>
            </div>
            <div><a href="#">注册</a></div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function () {
        $("#img").click(function () {
            $(this).attr("src", "/user/userInfo/verification?"+Math.random());
        });
    });

</script>