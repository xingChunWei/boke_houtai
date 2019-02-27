/**
 * 自适应宽高JS
 */
jQuery(function($){

    // 头部高度：自行修改即可
    var headerHeight = 60;
    // 目录树宽度：自行修改即可
    var menuWidth = 250;
    // 显示区域宽度
    var windowWidth = 0;
    // 显示区域高度
    var windowHeight = 0;

    // 定义页面最小宽度和高度：可自行修改
    var windowMinWidth = 1024;
    var windowMinHeight = 768;

    // 初始化页面框架元素高度和宽度
    (function(){
        initSize();
        initFrame();
    })();

    /**
     * 绑定窗体大小变化事件
     */
    $(window).on("resize",function(){
        initSize();
        initFrame();
    });

    /**
     * 获取页面大小
     */
    function initSize(){
        if (self.innerHeight) { // all except Explorer
            if (document.documentElement.clientWidth) {
                windowWidth = document.documentElement.clientWidth;
            } else {
                windowWidth = self.innerWidth;
            }
            windowHeight = self.innerHeight;
        } else {
            if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
                windowWidth = document.documentElement.clientWidth;
                windowHeight = document.documentElement.clientHeight;
            } else {
                if (document.body) { // other Explorers
                    windowWidth = document.body.clientWidth;
                    windowHeight = document.body.clientHeight;
                }
            }
        }
        // 控制页面最小宽度和高度
        windowWidth = windowWidth<windowMinWidth?windowMinWidth:windowWidth;
        windowHeight = windowHeight<windowMinHeight?windowMinHeight:windowHeight;
        // 窗体高度和宽度放入jquery扩展中
        $.fn.windowWidth = windowWidth;
        $.fn.windowHeight = windowHeight;
    }

    /**
     * 初始化页面结构各模块宽度和高度
     */
    function initFrame(){
        // 设置外部大容器
        $("#contrainerFrame").css("width","100%")
            .css("height","100%")
            .css("margin","0 auto")
            .css("text-algin","center");
        // 头部容器
        $("#headerFrame").css("width",windowWidth + "px")
            .css("height",headerHeight + "px");
        // 主体内容容器
        $("#contentFrame").css("width",windowWidth + "px")
            .css("height",(windowHeight-headerHeight) + "px")
            .css("clear","both");
        // 左侧导航
        $("#menuFrame").css("width",menuWidth + "px")
            .css("height",(windowHeight-headerHeight) + "px")
            .css("float","left");
        // 右侧主体
        $("#mainFrame").css("width",(windowWidth-menuWidth)  + "px")
            .css("height",(windowHeight-headerHeight) + "px")
            .css("float","right");
    }
});
