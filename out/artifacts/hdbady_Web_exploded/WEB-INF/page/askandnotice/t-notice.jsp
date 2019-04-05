<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <title>通知公告</title>
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/tongzhigonggao.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <script src="teacher/lib/jquery/jquery.js"></script>
    <script src="teacher/js/shijianjuli/TimeDifference.js"></script>
    <script src="teacher/lib/bootstrap/js/bootstrap.js"></script>
    <script src="teacher/js/main.js"></script>
    <script src="teacher/js/kiner-swiper-panel.min.js" type="text/javascript"></script>
</head>

<body>
<div class="neirong" id="youeryuan">
    <header>
        <span class="glyphicon glyphicon-menu-left">通知公告</span>
    </header>



    <section>

        <div class="box">
            <div class="kinerContent">
                <div class="wrapper">
                    <div class="kinerItem">
                        <nav >
                            <ul class="kinerNav" id="tiaomu">
                                <li class="active diyi"></li>
                                <!--<li class="">-->
                                    <!--<span class="biaoti">这是对对对一个标我是你题</span>-->

                                    <!--<span class=" glyphicon glyphicon-menu-right "></span>-->
                                    <!--<span class="shijian">"14-12 12:12"</span>-->
                                <!--</li>-->


                            </ul>

                        </nav>


                    </div>

                    <div class="kinerItem">
                       <div id="contentbiaoti"></div>
                       <div id="content">

                       </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<input id="flag" value="<s:property value="flag"/>" type="hidden">
</div>


<script type="text/javascript">
    $(function () {

        //第一步:  实例化一个滑动面板,并绑定响应标签
        var ksp = $.kinerSwiperPanel({
            navSelector: "kinerNav", //导航栏选择器
            conSelector: "kinerContent" //显示面板选择器
        });
//        $('.btn').click(function () {
//            var index = $(this).attr("data-slideTo");
//            ksp.slideTo(index); //可通过此方法主动调用切换面板方法
//        });
        /**
         * 注册change函数,当面板切换时插件将自动调用所给函数,并将当前面板索引通过参数形式返回
         */
        ksp.on(ksp.handlerNameList.change, function (activeIndex, event) {
            $('.eventPanel').text("事件回调信息: 面板已切换至" + (activeIndex + 1) + "号面板");
        });
    });


</script>
<script src="teacher/js/tongzhigonggao.js"></script>

</body>

</html>


