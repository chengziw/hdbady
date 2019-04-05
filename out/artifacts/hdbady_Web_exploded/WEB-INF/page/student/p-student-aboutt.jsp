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
    <title>每日食谱</title>
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

</head>

<body>

<div class="neirong" id="youeryuan">


    <div class="toubu">
        <a href="${pageContext.request.contextPath}/studentAction_p_mine.action">
            <!--<div style="float: left;margin-top: 20px"><span style="font-size: 30px;margin-left: 10px"><</span></div>-->
            <div style="float: left;margin-top: 22px;margin-left: 10px"><img style="width: 60%" src="parent/img/wode/aliwx_common_back_btn_normal.png" alt=""/></div>
        </a>
        <div style="float: left;font-size: 20px;color: white;line-height:80px ">个人信息</div>
    </div>
    <div class="yinying"></div>
    <a href="${pageContext.request.contextPath}/studentAction_p_img.action">
        <div style="height: 74px">
            <div style="float: left;font-size: 15px;line-height: 69px;margin-left: 10px">头像</div>
            <div style="float: left;margin-left: 110px"><img style="width: 50%;height: 50%;margin-top: 5px; border-radius:50%" src="parent/img/wode/wodeuserimg.png" alt=""/></div>
            <div style="float: right"><img style="margin-top: 20px" src="parent/img/wode/icon_dredge_arrow_r_n.png" alt=""/></div>
        </div>
    </a>
    <div class="yinying"></div>
    <div class="jiazhanggaunxi" style="height: 50px">
        <a href="${pageContext.request.contextPath}/studentAction_p_setParent.action">
            <div style="font-size: 15px;float: left;line-height: 50px;margin-left: 10px">家长关系</div>
            <div style="font-size: 15px;float: left;line-height: 50px">&nbsp;&nbsp;<s:property value="#session.loginParent.parent_name"/></div>
            <div style="float: right"><img style="margin-top: 10px" src="parent/img/wode/icon_dredge_arrow_r_n.png" alt=""/></div>
        </a>
    </div>
    <div class="yinying"></div>
    <div style="border-bottom: 1px solid gray;height: 60px">
        <a href="${pageContext.request.contextPath}/studentAction_p_phone.action">
            <div style="float: left;font-size: 15px;margin-top: 15px;margin-left: 10px">手机号</div>
            <div style="float: left;font-size: 15px;margin-top: 15px">&nbsp;<s:property value="#session.loginParent.phone"/></div>
            <div style="float: right"><img style="margin-top: 12px" src="parent/img/wode/icon_dredge_arrow_r_n.png" alt=""/></div>
        </a>
    </div>
    <div style="border-bottom: 1px solid gray;height: 60px">
        <a href="${pageContext.request.contextPath}/studentAction_p_qq.action">
            <div style="float: left;font-size: 15px;margin-top: 15px;margin-left: 10px">QQ号</div>
            <div style="float: left;font-size: 15px;;margin-top: 15px">&nbsp;&nbsp;<s:property value="#session.loginParent.qq"/></div>
            <div style="float: right"><img style="margin-top: 12px" src="parent/img/wode/icon_dredge_arrow_r_n.png" alt=""/></div>
        </a>
    </div>
    <div style="border-bottom: 1px solid gray;height: 60px">
        <a href="${pageContext.request.contextPath}/studentAction_p_wechat.action">
            <div style="float: left;font-size: 15px;;margin-top: 15px;margin-left: 10px">微信</div>
            <div style="float: left;font-size: 15px;;margin-top: 15px">&nbsp;&nbsp;<s:property value="#session.loginParent.weixin"/></div>
            <div style="float: right"><img style="margin-top: 12px" src="parent/img/wode/icon_dredge_arrow_r_n.png" alt=""/></div>
        </a>
    </div>
    <div style="border-bottom: 1px solid gray;height: 60px">
        <a href="${pageContext.request.contextPath}/studentAction_p_email.action">
            <div style="float: left;font-size: 15px;;margin-top: 15px;margin-left: 10px">Email</div>
            <div style="float: left;font-size: 15px;;margin-top: 15px">&nbsp;&nbsp;<s:property value="#session.loginParent.email"/></div>
            <div style="float: right"><img style="margin-top: 12px" src="parent/img/wode/icon_dredge_arrow_r_n.png" alt=""/></div>
        </a>
    </div>

</div>




</body>

</html>









