<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跳转到主页</title>
<%-- <script type="text/javascript">
try{
    if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
        window.location.href="mindex.html";
    }else{
        window.location.href="cindex.html";
    }
}catch(e){}
</script> --%>
</head>
<body>
<jsp:forward page="${pageContext.request.contextPath}/teacherAction_loginPrepare.action"></jsp:forward>
<%-- <s:if test="#session.loginUser.phone!=null">
	<jsp:forward page="${pageContext.request.contextPath}/page_common_home.action"></jsp:forward>
</s:if><s:else>
	<jsp:forward page="${pageContext.request.contextPath}/teacherAction_loginPrepare.action"></jsp:forward>
</s:else> --%>
</body>
</html>