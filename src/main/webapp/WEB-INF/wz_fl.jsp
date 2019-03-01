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
                <th>序号</th>
                <th>名称</th>
                <th>描述</th>
                <th>可用</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach   var="type" items="${articleTypes}" varStatus="inst">
                <tr><td>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">
                        </label>
                    </div>
                </td>
                    <td>${inst.count}</td>
                    <td>${type.articleTypeName}</td>
                    <td>${type.describ}</td>
                    <c:if test="${type.state=='0'}">
                        <td>否</td>
                    </c:if>
                    <c:if test="${type.state=='1'}">
                        <td>是</td>
                    </c:if>

                    <td>
                        <c:if test="${type.state =='0'}">
                            <button type="button" class="btn btn-success" onclick="updateState(${type.id},1)">激活</button>
                        </c:if>
                        <c:if test="${type.state =='1'}">
                            <button type="button" class="btn btn-warning" onclick="updateState(${type.id},0)">取消</button>
                        </c:if>
                        <button type="button" class="btn btn-primary">编辑</button>
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModa2">删除</button>
                       <%-- --%>
                    </td>
                </tr>

                <%--删除消息弹窗--%>
                <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabe2">
                                    确认删除
                                </h4>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="del(${type.id})">确定
                                </button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                </button>

                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">添加分类</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal"  role="form" >
                    <div class="form-group" >
                        <label  class="col-sm-3 control-label">分类名称：</label>
                        <div class="col-sm-7" id="er" >
                            <input type="text" class="form-control" name="articleTypeName" onblur="findOne()" onfocus="$(this).popover('destroy')"  value="" id="articleTypeName"   data-toggle="popover" data-placement="top" data-content="内容不为空">
                        </div>
                    </div>
                    <div class="form-group">
                        <%--@declare id="lastname"--%><label for="lastname" class="col-sm-3 control-label">描述：</label>
                        <div class="col-sm-7">
                            <textarea class="form-control" name="describ"  id="describ" rows="3"></textarea>
                        </div>
                    </div>
                </form>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="delOp()" >关闭</button>
                <button type="button" class="btn btn-primary" onclick="sub()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
</html>
<script>
    var bolon = true;
    $(function () {
    });

    //提交添加文章分类
    function sub(){
        var articleTypeName=$("#articleTypeName").val().trim(); //分类名称
        var describ=$("#describ").val().trim();//描述
        if(articleTypeName ==null|| articleTypeName==""){
            $("#articleTypeName").popover('show'); //开启消息弹窗
            /*$("#articleTypeName").focus();*///获得焦点
            return;
        }
        if(bolon){
            $.ajax({
                type:'POST',
                url:'/article/saveTypes',
                data:{'articleTypeName':articleTypeName,'describ':describ},
                success:function (data) {
                    if (data.code ==200){
                        location.href=location.href;
                    }
                },
            });
        }
    }
    //修改文章分类状态
    function  updateState(id,state) {
        $.ajax({
            type:'GET',
            url:'/article/updateState',
            data:{'id':id,'state':state},
            success:function () {
                location.href=location.href;
            }
        });
    }
    //删除文章分类
    function del(id) {
        $.ajax({
            type:'GET',
            url:'/article/delArticleType',
            data:{'id':id},
            success:function () {
                location.href=location.href;
            }

        })

    }

    //删除点击按钮
    function delOp() {
        location.href=location.href;
    }


    //查询文章分类唯一
    function findOne() {
       var articleTypeName = $("#articleTypeName").val().trim()
        if ($("#articleTypeName").val().trim()!=null || $("#articleTypeName").val().trim()!=""){
            $.ajax({
                type:'GET',
                url:'/article/findArticleTypes',
                data:{'articleTypeName':articleTypeName},
                datatype:'json',
                success:function (data) {
                    if (data.code!='200'){
                        $("#articleTypeName").attr('data-content','类型已存在')
                        $("#articleTypeName").popover('show');
                        bolon=false;
                    }else{
                        bolon=true;
                    }
                }

            })
        }
    }


</script>