var bolon = true;
var bl ;
var articleName='';
$(function () {
    $("#bigCheck").click(function () {
        if ( $(this).prop('checked')==true){
            $(".checkbox input[type='checkbox']").prop('checked',true)
        }else{
            $(".checkbox input[type='checkbox']").prop('checked',false);
        }
    });
    $('#myModa3').on('show.bs.modal',
        function() {
            findArticle(bl);
        })
});

function findA(id) {
    bl=id;
}

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
            url:'/articleType/saveTypes',
            data:{'articleTypeName':articleTypeName,'describ':describ},
            success:function (data) {
                if (data.code ==200){
                    location.href=location.href;
                }
            },
        });
    }
}
//修改文章类型
function updataArticle() {
    var articleTypeName=$("#articleTypeName1").val().trim(); //分类名称
    var describ=$("#describ1").val().trim();//描述
    if(articleTypeName ==null|| articleTypeName==""){
        $("#articleTypeName").popover('show'); //开启消息弹窗
        /*$("#articleTypeName").focus();*///获得焦点
        return;
    }
    if(bolon){
        $.ajax({
            type:'POST',
            url:'/articleType/updataArticle',
            data:{'id':bl,'articleTypeName':articleTypeName,'describ':describ},
            success:function (data) {
                if (data.code =='200'){
                    location.href=location.href;
                }else {
                    alert("修改失败")
                }
            },
        });
    }
}
//修改文章分类状态
function  updateState(id,state) {
    $.ajax({
        type:'GET',
        url:'/articleType/updateState',
        data:{'id':id,'state':state},
        success:function () {
            location.href=location.href;
        }
    });
}
//删除文章分类
function del(id) {
    layer.confirm('确定删除吗？', {
        btn: ['确定','取消'] //按钮
    }, function(){
        $.ajax({
            type:'GET',
            url:'/articleType/delArticleType',
            data:{'id':id},
            success:function () {
                location.href=location.href;
            }
        })
    });
}

//修改回显文章类型
function  findArticle(id){
    $.ajax({
        type:'GET',
        url:'/articleType/findArticle',
        data:{'id':id},
        dataType:'json',
        success:function (data) {
            if (data.obj!=undefined){

                $("#articleTypeName1").val(data.obj.articleTypeName);
                $("#describ1").val(data.obj.describ);
                articleName=data.obj.articleTypeName;
            }
        }
    })
}

//删除点击按钮
function delOp() {
    $("#articleTypeName1").val('');
    $("#describ1").val('');
    location.href=location.href;
}


//查询文章分类唯一
function findOne() {
    var articleTypeName = $("#articleTypeName").val();
    if (articleTypeName!=null || articleTypeName!=""){
        $.ajax({
            type:'GET',
            url:'/articleType/findArticleTypes',
            data:{'articleTypeName':articleTypeName},
            dataType:'json',
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

//查询文章分类唯一
function findOne1() {
    var articleTypeName = $("#articleTypeName1").val().trim()
    if ((articleTypeName!=null || articleTypeName!="")&& articleName !=articleTypeName){
        $.ajax({
            type:'GET',
            url:'/articleType/findArticleTypes',
            data:{'articleTypeName':articleTypeName},
            dataType:'json',
            success:function (data) {
                if (data.code!='200'){
                    $("#articleTypeName1").attr('data-content','类型已存在')
                    $("#articleTypeName1").popover('show');
                    bolon=false;
                }else{
                    bolon=true;
                }
            }
        })
    }else{
        alert("名称相同")
    }
}

/*批量删除*/
function delAll() {
layer.confirm("确定删除吗？",{
    btn:['确定','取消']
},function(){

    var arr = new Array();
    $(".checkbox input[type='checkbox']:checked").each(function (i) {
        arr[i]=$(this).val();
    })
    $.ajax({
        type:'POST',
        url:'/articleType/delArray',
        data:{"ids":arr},
        success:function (data) {
            if (data.code=='200'){
                location.href=location.href;
            }
        }
    });
    });


}