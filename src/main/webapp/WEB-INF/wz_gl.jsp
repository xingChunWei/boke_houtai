<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章管理</title>
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
            <caption>博客文章管理</caption>


            <caption>
                <div class="btn-group col-lg-3 col-md-3">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        文章分类 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" id="articleTypes">
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
                <th>发布时间</th>
                <th>浏览量</th>
                <th>点赞</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach varStatus="i" var="article" items="${pageUtils1.objList}">
                <tr>
                    <td>${i.count}</td>
                    <td>${article.articleTypes.articleTypeName}</td>
                    <td>${article.title}</td>
                    <td><fmt:formatDate value="${article.creationTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                    </td>
                    <td>${article.readNumber}</td>
                    <td>${article.likes}</td>
                    <td>
                        <button type="button" class="btn btn-info"><a href="/article/wZText?id=${article.id}" target="_blank">查看</a></button>
                        <button type="button" class="btn btn-primary" onclick="tiaozhuan('${article.id}')">修改</button>
                        <button type="button" class="btn btn-danger" onclick="delArticle('${article.id}')">删除</button>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <%------------------------- 分页 -----------------------%>
    <div>
        <nav aria-label="...">
            <ul class="pagination" style="display: table;margin: 40px auto">
                <c:if test="${pageUtils1.currentPage==1}">
                    <li><a href="javascript:void(0)">&laquo;</a></li>
                </c:if>
                <c:if test="${pageUtils1.currentPage!=1}">
                    <li><a href="/index/wzgl?currentPage=${pageUtils1.currentPage-1}">&laquo;</a></li>
                </c:if>

                <c:forEach  var="i"  begin="1" end="${pageUtils1.countPage}">
                    <li><a href="/index/wzgl?currentPage=${i}">${i}</a></li>
                </c:forEach>


                <c:if test="${pageUtils1.currentPage==pageUtils1.countPage}">
                    <li><a href="javascript:void(0)">&raquo;</a></li>
                </c:if>
                <c:if test="${pageUtils1.currentPage!=pageUtils1.countPage}">
                    <li><a href="/index/wzgl?currentPage=${pageUtils1.currentPage+1}">&raquo;</a></li>
                </c:if>

            </ul>
        </nav>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        //文章分类
        flgl();


    });

    function flgl() {
        $.ajax({
            type: "GET",
            url: '/articleType/findAllArticle',
            dataType: 'json',
            success: function (data) {
                for (var i = 0; i < data.obj.length; i++) {
                    $("#articleTypes").append('<li><a href=/index/wzgl?aId=' + data.obj[i].id + '>' + data.obj[i].articleTypeName + '</a></li>')
                }
            }
        });
    }

    //删除
    function delArticle(id) {
        var bl = confirm("确定删除？")
        if(bl){
            $.ajax({
                type:'GET',
                url:'/article/updateArticle',
                data:{'id': id,'state': 2},
                dataType:'json',
                success:function (data) {
                    if (data.code=='200'){
                        location.href = location.href;
                    } else {
                        alert('删除失败');
                    }
                }
            })
        }

    }

    function tiaozhuan(id) {
        location.href='/index/bjboKe?id='+id
    }

</script>