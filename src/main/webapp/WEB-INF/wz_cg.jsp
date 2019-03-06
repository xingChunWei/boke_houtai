<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>草稿</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/one.css">
    <link rel="stylesheet" href="/css/ht_index.css">
</head>
<body>
<div class="mai">
    <div>
        <table class="table table-hover">
            <caption>草稿箱</caption>


            <caption>
                <div class="btn-group col-lg-3 col-md-3">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        文章分类<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div>

                <%----------------------------搜索------------------------------%>
                <div class="col-lg-3 col-md-3">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="">
                        <span class="input-group-btn">
        <button class="btn btn-default" type="button">搜索</button>
      </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </caption>
            <thead>
            <tr>
                <th>序号</th>
                <th>文章分类</th>
                <th>文章标题</th>
                <th>保存时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Tanmay</td>
                <td>560001</td>
                <td>560001</td>
                <td><button type="button" class="btn btn-info">发布</button>
                    <button type="button" class="btn btn-primary">编辑</button>
                    <button type="button" class="btn btn-danger">删除</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <%------------------------- 分页 -----------------------%>
    <div>
        <nav aria-label="...">
            <ul class="pagination" style="display: table;margin: 40px auto">
                <li><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li class="disabled"><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>