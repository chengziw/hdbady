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
        <a href="${pageContext.request.contextPath}/studentAction_p_aboutt.action">
            <!--<div style="float: left;margin-top: 20px"><span style="font-size: 30px;margin-left: 10px"><</span></div>-->
            <div style="float: left;margin-top: 22px;margin-left: 10px"><img style="width: 60%" src="parent/img/wode/aliwx_common_back_btn_normal.png" alt=""/></div>
        </a>
        <div style="float: left;font-size: 20px;color: white;line-height:80px ">设置QQ</div>
        <div style="float: right;margin-right: 15px;margin-top: 24px"><input type="button" style="font-size: 22px" value="保存"/></div>
    </div>
    <form id="ff" action="${pageContext.request.contextPath}/studentAction_p_changeInfo.action">
    <div class="guanxi">
        <div style="line-height: 60px;font-size: 20px;margin-left: 10px">QQ&nbsp;<input name="qq" type="text" style="font-size: 15px;height: 40px" value="2550378943"></div>
   		<input type="type" value="qq" type="hidden"/>
    </div>
	</form>

</div>

<script type="text/javascript">
function tj(){
	$("#ff").submit();
}
</script>

</body>

</html>









