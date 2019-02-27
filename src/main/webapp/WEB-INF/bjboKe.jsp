<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>KindEditor JSP</title>
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
                <select name="cars" class="wz_fl_xz">
                <option value="#">文章分类</option>
                <option value="saab">Spring</option>
                <option value="fiat">mybatis</option>
                <option value="audi">tomcat</option>
                </select>
            </td>
        </tr>

        <tr>
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
        </tr>
        <tr>
            <td>
                文章标题：
            </td>
            <td>
                <input type="text" class="wz_fl_input">
            </td>
        </tr>
        <tr>
            <td>
                文章内容:
            </td>
            <td>
                <%-------------------富文本编辑器----------------------------%>
                <textarea id="editor_id" name="content" cols="100" rows="8"
                          style="width:800px;height:500px;visibility:hidden;font-size: 14px"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="margin-left: 400px">

                    <button  >保存</button>
                </div>
            </td>
        </tr>
    </table>
<%--<div class="wz_fl_bt" >


</div>
<div class="wz_fl_bt">

</div>

    <div class="wz_fl_bt">

    </div>



<div style="padding: 20px">
    <div></div>

</div>--%>

</div>
</body>
<script>
    KindEditor.ready(function (K) {
        window.editor = K.create('#editor_id');
    });
</script>
</html>
