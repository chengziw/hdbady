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

    <title>我的</title>
   <!-- <link rel="stylesheet" href="css/wode.css"/>-->
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/wode.css">
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
    <div class="header1">
        <a href="${pageContext.request.contextPath}/teacherAction_t_home.action"><span class="span1"><</span></a>
        <span class="span2">我的</span>
    </div>
    <div class="blank"></div>
    <div class="centre" id="per">
        <a href="${pageContext.request.contextPath}/teacherAction_t_about.action">
            <div class="pic">
                <img src="teacher/images/01.jpg" alt=""/>
            </div>
            <div class="text">
        <div class="text-top">
            <s:property value="#session.loginTeacher.teacher_name"/>
        </div>
        <div class="text-bottom">
            登录手机：<s:property value="#session.loginTeacher.phone"/>
        </div>
            </div>
            <div class="sign">></div>
        </a>
    </div>
    <div class="blank"></div>
    <div class="middle">
        <div class="problem">
            <a href="${pageContext.request.contextPath}/teacherAction_t_question.action"><img src="teacher/images/help.png" alt=""/>
                <div>常见问题</div>
                <div class="div">></div></a>
        </div>
        <div class="about">
            <a href="${pageContext.request.contextPath}/teacherAction_t_aboutWe.action"><img src="teacher/images/about.png" alt=""/>
                <div>关于我们</div>
                <div class="div">></div></a>
        </div>
    </div>

        <a href="${pageContext.request.contextPath}/teacherAction_t_logout.action"><button>退出登录</button></a>


</div>



<script src="teacher/js/meirishipu.js"></script>

</body>

</html>


