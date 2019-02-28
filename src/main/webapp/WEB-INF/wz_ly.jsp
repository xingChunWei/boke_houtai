<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章留言</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<%--富文本编辑器--%>
    <script src="/js/wangEditor.js"></script>
    <link rel="stylesheet" href="/css/one.css">
    <link rel="stylesheet" href="/css/ht_index.css">
</head>
<body>

<div class="mai">
    <div>
        <table class="table table-hover">
            <caption>留言管理</caption>
            <thead>
            <tr>
                <th>序号</th>
                <th>留言用户</th>
                <th>留言时间</th>
                <th>内容</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Bangalore</td>
                <td>560001</td>
                <td>560001</td>
                <td> <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal">回复</button>
                    <button type="button" class="btn btn-danger">删除</button></td>
            </tr>
            <tr>
                <td>1</td>
                <td>Bangalore</td>
                <td>560001</td>
                <td>560001</td>
                <td> <button type="button" class="btn btn-primary">回复</button>
                    <button type="button" class="btn btn-danger">删除</button></td>
            </tr>
            <tr>
                <td>1</td>
                <td>Bangalore</td>
                <td>560001</td>
                <td>560001</td>
                <td> <button type="button" class="btn btn-primary">回复</button>
                    <button type="button" class="btn btn-danger">删除</button></td>
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

<%--模态框--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">回复</h4>
            </div>
            <div class="modal-body" >
                <%--文本编辑框--%>
                <div id="editor" style="background-color: white;">
            </div></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create()

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html())
    }, false)
</script>