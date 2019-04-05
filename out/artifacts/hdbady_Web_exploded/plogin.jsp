<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>家长端登录</title>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
</style>

<link rel="stylesheet" type="text/css" href="parent/css/denglu.css" />

<script type="text/javascript" src="parent/js/jquery.min.js"></script>
<script type="text/javascript" src="parent/js/denglu.js"></script>

</head>
<s:if test="#session.loginParent.phone!=null">
	<jsp:forward page="${pageContext.request.contextPath}/studentAction_p_home.action"></jsp:forward>
</s:if><s:else>
<body>


	<div class="demo">
		<nav class="main_nav">
			<!--<ul>-->
				<!--<li><a class="cd-signin" href="#0">登录</a></li>-->
				<!--<li><a class="cd-signup" href="#0">注册</a></li>-->
			<!--</ul>-->
		</nav>
	</div>
	
	<div class="cd-user-modal"> 
		<div class="cd-user-modal-container">
			<ul class="cd-switcher">
				<li><a href="#0">用户登录</a></li>
				<!-- <li><a href="#0">注册新用户</a></li> -->
			</ul>

			<div id="cd-login"> <!-- 登录表单 -->
				<form class="cd-form" action="${pageContext.request.contextPath}/studentAction_parentLogin.action" id="fm">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signin-username">用户名</label>
						<input class="full-width has-padding has-border" name="phone" id="signin-username" type="text" placeholder="输入用户名">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">密码</label>
						<input class="full-width has-padding has-border" name="password" id="signin-password" type="password"  placeholder="输入密码">
					</p>

					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">记住登录状态</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="tishi" style="color:red;font-size:15px"></span>
					</p>

					<p class="fieldset">
						<input class="full-width2" style="border: 5px;height: 50px;background-color: #219CE2" type="button"  id="denglude" value="登 录">
					</p>
				</form>
			</div>

			<!-- <div id="cd-signup"> 注册表单
				<form class="cd-form" action="index.html">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">用户名</label>
						<input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="输入用户名">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">邮箱</label>
						<input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="输入mail">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">密码</label>
						<input class="full-width has-padding has-border" id="signup-password" type="text"  placeholder="输入密码">
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">我已阅读并同意 <a href="#0">用户协议</a></label>
					</p>

					<p class="fieldset">
						<input class="full-width2" type="button" style="border: 5px;height: 50px;background-color: #219CE2" value="注册新用户">
					</p>
				</form>
			</div> -->

			<!--<a href="#0" class="cd-close-form">关闭</a>-->
		</div>
	</div> 


	<script src="parent/webdemo/3rd/jquery-1.11.3.min.js"></script>
	<%-- <script src="parent/webdemo/im/js/config.js"></script>
	<script src="parent/webdemo/im/js/md5.js"></script>
	<script src="parent/webdemo/im/js/register.js"></script> --%>

<script type="text/javascript" src="js/jquery.js"></script> 
<script type="text/javascript" src="js/common.js"></script>
	<script>
	$("#denglude").click(function () {

		var username = $("#signin-username").val();
		var password = $("#signin-password").val();

		localStorage.username = username;
		localStorage.password = password;
		
		var  url="studentAction_parentLogin.action";
		$('#fm').form('submit',{
	        url: url,
	        onSubmit: function(params){
/* 		            params.username = username;
	            params.password = password; */
	            var flag=true;
//	            alert("  用户名  "+username+"  密码   "+password);
	            if (username==null || password==null) {
	            	alert("请将信息填写完全");
	            	flag=false;
	            }
	            return flag;
	        },
	        success: function(result){
	        	
	        	var result = eval('('+result+')');
	        	if(result.status!="1"){
	        	//alert(result.status);
		        $("#tishi").html(result.info);
	        	}
	        	else{tiaoye();}	
	        }
	    });
		
		//$("#fm").submit();


	})
	
	function tiaoye(){
		location.href = "studentAction_p_home.action";
	}
	</script>
</body>
</s:else>
</html>
