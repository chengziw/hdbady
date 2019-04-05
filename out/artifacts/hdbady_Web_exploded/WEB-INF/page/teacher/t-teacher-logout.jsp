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

    <title></title>
    <link rel="stylesheet" href="teacher/css/main-tuichu.css"/>
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/meirishipu.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <script src="teacher/lib/jquery/jquery.js"></script>
    <script src="teacher/lib/bootstrap/js/bootstrap.js"></script>
    <script src="teacher/js/shijianjuli/TimeDifference.js"></script>
    <script src="teacher/js/main.js"></script>
</head>

<body>
<div class="neirong" id="youeryuan">
    <div class="header">
        <img src="images/01.jpg" alt=""/>
    </div>
    <div class="sign">
        <input type="text"value="手机 " name="" id=""/>
        <input type="text" value="密码 "/>
    </div>
    <div class="middle">
        <a href="${pageContext.request.contextPath}/teacherAction_t_mine.action"><button class="btn">登录</button></a>
    </div>
    <div class="footer">
    <span class="span1">
      没有账号？
    </span>
    <span class="span2">
    忘记密码？
    </span>
    </div>

</div>



<script src="teacher/js/meirishipu.js"></script>

</body>

</html>


