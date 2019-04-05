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

    <title>电话号码</title>
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/main-telphone.css">
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
        <a href="${pageContext.request.contextPath}/teacherAction_t_about.action"><span><</span></a>
        <span>手机号</span>
    </div>
    <form id="ff" action="${pageContext.request.contextPath}/teacherAction_t_changeInfo.action">
    <div class="tel">
        <input name="phone" type="text" value="<s:property value="#session.loginTeacher.phone"/>"/>
        <input name="type" value="phone" type="hidden"/>
        <button id="button">更换手机号</button>
    </div>
	</form>
</div>



<script src="teacher/js/meirishipu.js"></script>

<script type="text/javascript">
function tj(){
	$("#ff").submit();
}
</script>

</body>

</html>


