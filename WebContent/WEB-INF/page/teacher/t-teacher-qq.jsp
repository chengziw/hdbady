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
    <link rel="stylesheet" href="teacher/css/main-QQ.css"/>
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
    <div class="header1">
        <a href="${pageContext.request.contextPath}/teacherAction_t_about.action"><span><</span></a>
        <span>QQ</span>
        <input type="button" value="保存" style="line-height:0;" onclick="javascript:tj()">
    </div>
    <form id="ff" action="${pageContext.request.contextPath}/teacherAction_t_changeInfo.action">
    <div class="qq">
        <input name="qq" type="text" data-options="validType:['number','MaxLength']" value="<s:property value="#session.loginTeacher.qq"/>"/>
        <input name="type" value="qq" type="hidden"/>
    </div>
	</form>
</div>


<script type="text/javascript">
    $.extend($.fn.validatebox.defaults.rules, {
        noNull: {
            validator: function(value, param){
                if(value=='请选择' || value==''){
                    return false;
                }
                return true;
            },
            message: '此输入项为必输项'
        },
        number: {
        	validator: function (value) {
                var reg = /^[0-9]*$/;
                return reg.test(value);
            },
            message: '请输入正确数字！'
        },
        //验证空格
        space: {
        	//validator: function (value, param) { return $.trim(value) != '' },
            //message: '不能为空，全空格也不行'
        	validator: function (value) {
                if(value.indexOf(" ")>=0){
                	return false;
                }
                return true;
            },
            message: '不能存在空格！'
        },
        MaxLength: {
        	validator: function (value) {
        		var reg=/[\u4E00-\u9FA5]/g;
        		var reg2=/[A-Za-z0-9]/g;
        		var len=0;
        		var len2=0;
        		/* value.match(reg).length  算长度*/
        		
        		if(value.match(reg)!=null){
        			   len=value.match(reg).length*2;
        			}
        			if(value.match(reg2)!=null){
        			   len2=value.match(reg2).length;
        			}
        		var sum=len+len2;
        		if (sum > 32) { //返回中文的个数
        				return false;
        		}
        		return true;
            },
            message: '不能超过32个字母数字或16个汉字'
        },
        

<script src="teacher/js/meirishipu.js"></script>

</body>
<script type="text/javascript">

		function tj(){
			$("#ff").submit();
		}
</script>
</html>


