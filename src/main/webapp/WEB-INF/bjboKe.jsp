<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>编写博客</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="/kindeditor/plugins/code/prettify.css"/>
    <script charset="utf-8" src="/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="/kindeditor/plugins/code/prettify.js"></script>
    <link rel="stylesheet" href="/css/one.css">
    <link rel="stylesheet" href="/css/ht_index.css">

</head>
<body>
<div>

    <table border="0" class="tabl">
        <tr>
            <td>文章分类：</td>
            <td>
                <select name="a_id" class="wz_fl_xz"  id="articleType" >
                <option value="#">文章分类</option>
                    <c:forEach var=" " items="">
                        <option value="#">文章分类</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

       <%-- <tr>
            <td>
                文章类型：
            </td>
            <td>
                <select name="cars" class="wz_fl_xz">
                    <option value="#">文章类型</option>
                    <option value="saab">转载</option>
                    <option value="fiat">原创</option>
                    <option value="audi">翻译</option>
                </select>
            </td>
        </tr>--%>
        <tr>
            <td>
                文章标题：
            </td>
            <td>
                <input type="text" class="wz_fl_input" name="title" id="title">
            </td>
        </tr>
        <tr>
            <td>
                文章内容:
            </td>
            <td>
                <%-------------------富文本编辑器----------------------------%>
                <textarea id="editor_id" name="content" cols="100" rows="8"
                          style="width:800px;height:800px;visibility:hidden;font-size: 14px"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="margin-left: 400px">
                    <button  class="btn btn-primary" onclick="submi(1)">发布</button>
                    <button  class="btn btn-primary" onclick="submi(0)">草稿</button>
                </div>
            </td>
        </tr>
    </table>
</div>
<input type="hidden" name="flt" value="${id}" id="flt">
</body>
<script type="text/javascript" defer="defer">


    KindEditor.ready(function(K){

        window.editor=K.create('#editor_id', {
            uploadJson : '/upload/fileUpload',  //图片上传路径
            fileManagerJson : '/index/jsp/file_manager_json',
            allowFileManager : true,
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
            }
        });

    });



</script>

<script>
    $(function () {
        /**
         * 追加文章分类
         */
        $.ajax({
            type:'POST',
            url:'/articleType/findAllArticle',
            dataType:'json',
            data:{'state':1},
            success:function (data) {
                var str=''

                for (var i = 0;i<data.obj.length;i++){
                    str+='<option value='+data.obj[i].id+'>'+data.obj[i].articleTypeName+'</option>'
                }
                $("#articleType").append(str);
            }
        })

        //获得传进来的文章Id
        hx();
    })

    function submi(state) {
        var $state = state;
        $.ajax({
            type:'POST',
            url:'/article/saveArticle',
            data:{'title':$("#title").val().trim(),'content':editor.html(),'aId':$("#articleType").val(),'state':$state},
            success:function (data) {
                if (data.code == '200'){
                    if ($state=='1'){
                        alert("发布成功")
                    } else {
                        alert("保存草稿成功")
                    }

                    location.href = location.href;
                }
            }
        });
    }

    function hx() {
      var id =  $("#flt").val();
      debugger
        $.ajax({
            type:'GET',
            url:'/article/findOne',
            data:{'id':id},
            dataType:'json',
            success:function (data) {
                $("#title").val(data.obj.title);
                $("articleType").val(data.obj.aId);
                editor.text("editor_id",data.obj.content);
            }
        })
    }

</script>
</html>
