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
            <div style="float: left;margin-top: 22px"><img style="width: 60%" src="parent/img/wode/aliwx_common_back_btn_normal.png" alt=""/></div>
        </a>
        <div style="float: left;font-size: 20px;color: white;line-height:80px ">常见问题</div>
    </div>
    <div>
        <p>1、教职工的注册个人信息安全吗？</p>
        <div>答：安全，华德宝贝不会泄露用户的任何安全信息给任何第三方，也不会随意打电话骚扰用户，请放心使用。</div>
    </div>
    <div>
        <p>2、华德宝贝这个软件是谁开发的？</p>
        <div>答：是由哈尔滨华德学院软件工程专业学生开发运营维护的。</div>
    </div>
    <div>
        <p>3、哪些人可以在班级圈发布帖子</p>
        <div>答：同一个班级的班主任、所有的任课教师、所有学生的家长。</div>
    </div>
</div>




</body>

</html>









