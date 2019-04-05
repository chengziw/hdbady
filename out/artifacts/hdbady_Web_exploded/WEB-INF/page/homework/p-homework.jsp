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

    <title>每日作业</title>
    <link rel="stylesheet" href="parent/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="parent/css/main.css">
    <link rel="stylesheet" href="parent/css/meirizuoye.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <script src="parent/lib/jquery/jquery.js"></script>
    <script src="parent/lib/bootstrap/js/bootstrap.js"></script>
    <script src="parent/js/shijianjuli/TimeDifference.js"></script>
    <script src="parent/js/main.js"></script>

    <style>

    </style>
</head>

<body>
<div class="neirong" id="youeryuan">
    <header>
        <span class="glyphicon glyphicon-menu-left">每日作业</span>


    </header>



    <section>
        <ul id="ul-list">
            <!--<li>-->
                <!--<div>-->
                    <!--<span>社会</span>-->
                    <!--<span>昨天</span>-->
                <!--</div>-->
                <!--<div class="tuisongbanji">-->
                    <!--<span>推送班级：</span>-->
                    <!--<span>一班，二班</span>-->
                <!--</div>-->
                <!--<div class="xiaoxineirong">-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                <!--</div>-->
                <!--<div class="tupian">-->
                    <!--<img src="img/jietu/捕获.PNG" alt=""/>-->
                    <!--<img src="img/jietu/捕获.PNG" alt=""/>-->
                    <!--<img src="img/jietu/捕获.PNG" alt=""/>-->
                <!--</div>-->
                <!--<div></div>-->
            <!--</li>-->

            <!--<li>-->
                <!--<div>-->
                    <!--<span>社会</span>-->
                    <!--<span>昨天</span>-->
                <!--</div>-->
                <!--<div class="tuisongbanji">-->
                    <!--<span>推送班级：</span>-->
                    <!--<span>一班，二班</span>-->
                <!--</div>-->
                <!--<div class="xiaoxineirong">-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                <!--</div>-->
                <!--<div class="tupian">-->
                    <!--<img src="img/jietu/捕获.PNG" alt=""/>-->

                <!--</div>-->
                <!--<div></div>-->
            <!--</li>-->
            <!--<li>-->
                <!--<div>-->
                    <!--<span>社会</span>-->
                    <!--<span>昨天</span>-->
                <!--</div>-->
                <!--<div class="tuisongbanji">-->
                    <!--<span>推送班级：</span>-->
                    <!--<span>一班，二班</span>-->
                <!--</div>-->
                <!--<div class="xiaoxineirong">-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                    <!--把课本第二课，ABC抄一遍-->
                <!--</div>-->
                <!--<div class="tupian">-->
                    <!--<img src="img/jietu/捕获.PNG" alt=""/>-->

                <!--</div>-->
                <!--<div></div>-->
            <!--</li>-->
        </ul>
    </section>
<input name="flag" value="<s:property value="flag"/>" type="hidden">
</div>



<script src="parent/js/meirizuoye.js"></script>

</body>

</html>


