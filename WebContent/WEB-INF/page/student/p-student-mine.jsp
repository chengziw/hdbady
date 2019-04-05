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
    <!--<link rel="stylesheet" href="demo.css" type="text/css" />-->
    <title>我的</title>
    <link rel="stylesheet" href="parent/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="parent/css/main.css">
    <link rel="stylesheet" href="parent/css/wode.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <script src="parent/lib/jquery/jquery.js"></script>
    <script src="parent/lib/bootstrap/js/bootstrap.js"></script>
    <script src="parent/js/main.js"></script>
    <style>

    </style>


</head>

<body>

<div class="neirong" id="youeryuan">


    <div class="toubu">
        <!--<div style="line-height: 80px;color: white;text-align: center;font-size: 25px">我的</div>-->
        <a href="${pageContext.request.contextPath}/studentAction_p_home.action">
            <!--<div style="float: left;margin-top: 20px"><span style="font-size: 30px;margin-left: 10px;color: grey"><</span></div>-->
            <div style="float: left;margin-top: 22px;margin-left: 10px"><img style="width: 60%" src="parent/img/wode/aliwx_common_back_btn_normal.png" alt=""/></div>
        </a>
        <div style="float: left;font-size: 20px;color: white;line-height:80px ">我的</div>
    </div>


    <div class="yinying"></div>
    <a href="${pageContext.request.contextPath}/studentAction_p_img.action">
        <div class="header1">
            <a href="${pageContext.request.contextPath}/studentAction_p_aboutt.action">
                <div style="float: left"><img src="parent/img/wode/touxiang.png" alt=""></div>
                <div style="float: left;line-height: 60px">
                    <div><s:property value="#session.loginParent.parent_name"/></div>
                    <div>手机号:<s:property value="#session.loginParent.phone"/></div>
                </div>
                <div style="float: right;margin-top: 15px;margin-right: 10px" ><img src="parent/img/wode/personal_data_guide.png" alt=""></div>
        </div>
    </a>
    <div class="yinying"></div>
    <a href="${pageContext.request.contextPath}/studentAction_p_question.action">
        <div class="changjianwenti">
            <div style="float: left"><img style="width: 65%;height: 65%;margin-top: 4px;margin-left: 10px" src="parent/img/wode/help.png" alt=""></div>
            <div style="float: left;line-height: 60px">常见问题</div>
            <div style="float: right"><img style="width: 75%;height: 75%;margin-top: 15px" src="parent/img/wode/icon_dredge_arrow_r_n.png" alt=""></div>
        </div>
    </a>
    <a href="${pageContext.request.contextPath}/studentAction_p_aboutWe.action">
        <div class="guanyuwomen">
            <div style="float: left"><img style="width: 65%;height: 65%;margin-top: 4px;margin-left: 10px" src="parent/img/wode/about_us.png" alt=""></div>
            <div style="float: left;line-height: 60px">关于我们</div>
            <div style="float: right"><img style="width: 75%;height: 75%;margin-top: 15px" src="parent/img/wode/icon_dredge_arrow_r_n.png" alt=""></div>
        </div>
    </a>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <div>
    <a href="${pageContext.request.contextPath}/studentAction_p_logout.action">
        <input type="button" value="退出登录"style="font-size: 20px;color: white;background-color:  #219CE2;text-align: center;margin-left: 34px;height: 45px;width: 80%"/>
    </a>
    </div>
</div>


<script src="parent/js/meirishipu.js"></script>

</body>

</html>









