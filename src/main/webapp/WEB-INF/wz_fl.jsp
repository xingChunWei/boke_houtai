<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章分类</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/one.css">
    <link rel="stylesheet" href="/css/ht_index.css">
</head>
<body>
<div class="mai">
    <div>
        <table class="table table-bordered">
            <caption>文章分类</caption>
            <caption>

                <button type="button" class="btn btn-default" id="tjfl" data-toggle="modal" data-target="#myModal">添加分类</button>
                <button type="button" class="btn btn-default">批量删除</button>
            </caption>
            <thead>
            <tr>
                <th><div class="checkbox">
                    <label>
                        <input type="checkbox">
                    </label>
                </div></th>
                <th>ID</th>
                <th>名称</th>
                <th>父级分类</th>
                <th>描述</th>
                <th>可用</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach   var="type" items="${articleTypes}">
                <tr><td>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">
                        </label>
                    </div>
                </td>
                    <td>${type.ID}</td>
                    <td>${type.articleTypeName}</td>
                    <td>${type.parentCategory}</td>
                    <td>${type.describ}</td>
                    <c:if test="${type.state=='0'}">
                        <td>否</td>
                    </c:if>
                    <c:if test="${type.state=='1'}">
                        <td>是</td>
                    </c:if>

                    <td>
                        <button type="button" class="btn btn-success">激活</button>
                        <button type="button" class="btn btn-primary">编辑</button>
                        <button type="button" class="btn btn-danger">删除</button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加分类</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">分类名称：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="articleTypeName" id="firstname" placeholder="请输入名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="name"--%><label for="name" class="col-sm-3 control-label">父级分类：</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="parentCategory">
                                <option>--选择--</option>
                               <%-- <c:forEach items="articleTypes" var="typ">
                                <option value="${typ.ID}">${typ.articleTypeName}</option>
                                </c:forEach>--%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="lastname"--%><label for="lastname" class="col-sm-3 control-label">描述：</label>
                        <div class="col-sm-7">
                            <textarea class="form-control" name="describ" rows="3"></textarea>
                        </div>
                    </div>
                </form>


                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
<script>
    $(function () {

        $("#tjfl").click(function () {
            $.ajax({
                type:'GET',
                url :"/article/findArticleTypes",
                cache: false,
                contentType: "application/json",
                dataType:'json',
                success:function (datas) {
                    console.log(datas)
                    alert("1111");
                    alert(datas.obj[0].iD);
                },
                error:function (data) {
                    alert("2222")
                }
            });
        });

    });
</script>