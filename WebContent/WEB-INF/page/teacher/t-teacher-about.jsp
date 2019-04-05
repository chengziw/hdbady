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
    <link rel="stylesheet" href="teacher/css/main-personal.css"/>
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
        <a href="${pageContext.request.contextPath}/teacherAction_t_mine.action"><span><</span></a>
        <span>个人信息</span>
    </div>
    <div class="blank-1"></div>
    <div class="centre">
        <a href="${pageContext.request.contextPath}/teacherAction_t_img.action"><span>头像</span>
            <span class="tou">></span>
            <img src="teacher/images/01.jpg" alt=""/></a>
    </div>
    <div class="blank-2"></div>
    <div class="middle">
        <a href="${pageContext.request.contextPath}/teacherAction_t_phone.action"><div class="phone1">手机号
            <span class="phone2"><s:property value="#session.loginTeacher.phone"/></span>
            <span class="phone3">></span>
        </div></a>
        <a href="${pageContext.request.contextPath}/teacherAction_t_qq.action"><div class="phone1"> QQ号&nbsp;
            <span class="phone2"><s:property value="#session.loginTeacher.qq"/></span>
            <span class="phone3">></span>
        </div></a>
        <a href="${pageContext.request.contextPath}/teacherAction_t_wechat.action"><div class="phone1">微信号&nbsp;
            <span class="phone2"><s:property value="#session.loginTeacher.weixin"/></span>
            <span class="phone3">></span>
        </div></a>
        <a href="${pageContext.request.contextPath}/teacherAction_t_email.action"><div class="phone1">Email&nbsp;&nbsp;
            <span class="phone2"><s:property value="#session.loginTeacher.email"/></span>
            <span class="phone3">></span>
        </div></a>
    </div
    <div class="blank-2"></div>
    <div class="name">
        <ul class="ul">
            <li class="li1">姓名<span><s:property value="#session.loginTeacher.teacher_name"/></span></li>
            <li class="li1">性别<span><s:property value="#session.loginTeacher.sex_name"/></span></li>
            <li class="li1">生日<span><s:property value="#session.loginTeacher.brither_name"/></span></li>
            <li class="li1">部门<span><s:property value="#session.loginTeacher.structure.name"/></span></li>
            <li class="li1">职务<span><s:property value="#session.loginTeacher.teacherDuty.duty_name"/></span></li>
            <li class="li1">所教班级<span class="span"></span></li>
        </ul>
    </div>

</div>



<script src="teacher/js/meirishipu.js"></script>

</body>

</html>


