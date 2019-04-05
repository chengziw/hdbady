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
    <link rel="stylesheet" href="teacher/css/main-problem.css"/>
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
        <span>常见问题</span>
    </div>
    <div class="message">
        <h2>1、教职工的注册个人信息安全吗？</h2>
        <div>答：安全，华德宝贝不会泄露用户的任何安全信息给任何第三方，也不会随意打电话骚扰用户，请放心使用。</div>
    </div>
    <div class="message">
        <h2>2、华德宝贝这个软件是谁开发的？</h2>
        <div>答：是由哈尔滨华德学院软件工程专业学生开发运营维护的。</div>
    </div>
    <div class="message">
        <h2>3、哪些人可以在班级圈发布帖子</h2>
        <div>答：同一个班级的班主任、所有的任课教师、所有学生的家长。</div>
    </div>

</div>



<script src="teacher/js/meirishipu.js"></script>

</body>

</html>


