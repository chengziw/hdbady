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
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/main-QQ.css">
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
        <span>微信</span>
        <input type="button" value="保存" style="line-height:0;" onclick="javascript:tj()">
    </div>
    <form id="ff" action="${pageContext.request.contextPath}/teacherAction_t_changeInfo.action">
    <div class="qq">
        <input name="weixin" type="text" value="<s:property value="#session.loginTeacher.weixin"/>"/>
        <input name="type" value="weixin" type="hidden"/>
    </div>
    </form>

</div>



<script src="teacher/js/meirishipu.js"></script>

</body>
<script type="text/javascript">
		function tj(){
			$("#ff").submit();
		}
</script>
</html>


