<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>华德幼儿园</title>
    <link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/icon.css">

    <script type="text/javascript" src="js/easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/easyui-1.4.4/jquery.easyui.min.js"></script>    
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    
    <link rel="stylesheet" href="js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>
</head>
	<style type="text/css">
        *{outline: none}
		a,a:link,a:visited{
		color:#0099FF;
		text-decoration:none;}
		.textbox{
		border:1px solid #0099FF;}
		/* IE浏览器禁用明文密码和快速清除按钮 */
		input::-ms-clear{display:none;}
		input::-ms-reveal{display:none;}
	</style>
	
<s:if test="#session.loginUser.phone!=null">
	<jsp:forward page="${pageContext.request.contextPath}/page_common_home.action"></jsp:forward>
</s:if><s:else>
    <body>
        <div style="width:358px; margin-left:auto;margin-right:auto; border:0px solid #aaaaaa; font-family:'微软雅黑'; font-size:16px; margin-top:58px;" >
            <div style="text-decoration:none;" >
   
			<form id="login-form" class="form-horizontal" action="${pageContext.request.contextPath}/teacherAction_login.action" method="post">
                                <table width="358" cellpadding="8" cellspacing="0">
                    <tr>
                        <td width="30" align="center">&nbsp;</td>
                        <td width="258" align="center"><img src="${pageContext.request.contextPath}/images/login_logo.png"></td>
                        <td align="center">&nbsp;</td>
                    </tr>
                                        <tr>
                        <td align="right"><img src="${pageContext.request.contextPath}/images/login_usericon.png"></td>
                        <td><input class="easyui-textbox" type="text" id="username" name="phone"
                                   value="<s:property value="phone"/>"
                                   data-options="prompt:'请输入手机号 或 用户名'" style="padding:6px; padding-left:8px; height:38px; width:258px;font-size:16px; font-family:'微软雅黑';"></td>
                        <td><span id="username_tiptext" style="color:#FF0000;"></span></td>
                        <!--validType="checkUsername"  required="true" novalidate:true,-->
                    </tr>
                    <tr>
                        <td align="right"><img src="${pageContext.request.contextPath}/images/login_pass.png"></td>
                        <td>
                            <div id="passwordStyle" style="position: relative;">
                            <input id="password" type="password" name="password" value="" placeholder="请输入登录密码" name="password" style="padding:6px; padding-left:8px; height:23px; width:242px; border-radius:5px; border:1px solid #0099FF;">
                             <div id="passwordText" style="display: none;position:absolute; top:10px;left:10px;color:#aaa;font-size:12px;">请输入密码</div>
                            </div>
                        </td>
                        <td><span id="password_tiptext" style="color:#FF0000;"></span></td>
                    </tr>
                    <tr id="verifyCodeShow" style="display: none">
                        <td align="right"></td>
                        <td><div style=" float: left; padding: 0 10px 0 0"><input class="easyui-textbox" id="verifyCode" type="text" name="verifyCode"
                                   data-options="prompt:'请输入右侧验证码'" style="padding:6px; padding-left:8px; height:36px; width:118px;">
                            </div>
                            <div style="height:36px; cursor:pointer; overflow:hidden;">
                                <img id="validateCode" title="验证码" src="/site/get-validate-code.html" align="absbottom"
                                      onclick="this.src='/site/get-validate-code.html?'+Math.random();">
                            </div>

                        </td>
                        <td><span id="password_tiptext" style="color:#FF0000;"></span></td>
                    </tr>
					
                    <tr>
                        <td align="left"></td>
                        <td align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td style="font-size:13px;"><input name="rememberMe" id="rememberMe" type="checkbox" value="1" checked style="cursor:pointer;">记住用户名
                            <input name="mingwenmima" id="mingwenmima" type="checkbox" onclick="hideShowPsw()"style="cursor:pointer;">显示密码</td></td>
                            <td align="right"><a href="javascript:;" style="font-size:13px;" title="<br>&nbsp;&nbsp;方法1、联系您所在学校的管理员重设密码&nbsp;&nbsp;<br><br>&nbsp;&nbsp;方法2、自己通过手机APP端重设密码<br><br>" class="easyui-tooltip">忘记密码？</a></td>
                          </tr>
                        </table></td>
                        <td align="left" style="font-size:14px;">&nbsp;</td>
                    </tr>
					
                    <tr>
                        <td align="center">											  </td>
                        <td align="center"><a href="javascript:;" id="submitForm"
                                              style=" display:block; line-height:38px;height:38px; width:258px; cursor:pointer; border:1px solid #0099FF; font-family:'微软雅黑'; font-size:18px;border-radius: 5px 5px 5px 5px; color:#FFFFFF; background-color:#359AE7; "
                                              onClick="submitForm();return false;">登录</a></td>
                        <td align="center">&nbsp;</td>
                    </tr>
					
                    <!-- <tr>
                        <td align="center">&nbsp;</td>
                        <td align="center"><a href="/site/bloc-bespeak.html">幼儿园免费注册！</a></td>
                        <td align="center">&nbsp;</td>
                    </tr> -->
              </table>
            </form>
                				<div style="text-align:center;padding:5px">
					
	
				</div>
            </div>
            </div>

        <!--[if IE]>
        <script type="text/javascript">
            $(function(){
                $('#passwordText').show();

                $('#passwordText').click(function(){
                    $('#passwordText').hide();
                    $('#password').focus();
                })

                $('#password').focus(function(){
                    $('#passwordText').hide();
                    /*if($(this).val() == $(this).attr('placeholder')){
                     $(this).val('');
                     }*/
                })

                $('#password').blur(function(){
                    if($(this).val() == ''){
                        $('#passwordText').show();
                    }
                })
            })
        </script>
        <![endif]-->
        
</s:else>
        <script type="text/javascript">
            $(function(){
                //回车事件绑定
                $('#username').textbox('textbox').keydown(function (e) {
                    if (e.keyCode == 13) {
                        submitForm()
                    }
                });
                $('#verifyCode').textbox('textbox').keydown(function (e) {
                    if (e.keyCode == 13) {
                        submitForm()
                    }
                });
                $('#password').keydown(function (e) {
                    if (e.keyCode == 13) {
                        submitForm()
                    }
                })
            })

            var ajax_lock=0; //ajax 锁
			function submitForm(){
                if(ajax_lock == 1) return false;
                    ajax_lock = 1;
                setLoginStatus(1);
                /*$('#username_tiptext').html('');
                 $('#password_tiptext').html('');*/
                var usernameObj = $('.textbox').eq(0);
                var passwordObj = $('#password');
                var validatecodeObj = $('.textbox').eq(1);

                setTooltop(usernameObj,'destroy');
                setTooltop(passwordObj,'destroy');
                setTooltop(validatecodeObj,'destroy');
                var url = $("#login-form").attr('action');

				$("#login-form").form('submit',{
                    url:url,
                    onSubmit:function(){
                        if(!$('#verifyCodeShow').is(':hidden') && $('#verifyCode').val()==''){
                            setTooltop(validatecodeObj,'show');ajax_lock = 0;setLoginStatus();
                            return false;
                        }
                        if($('#username').val()==''){
                            setTooltop(usernameObj,'show');ajax_lock = 0;setLoginStatus();
                            return false;
                        }
                        if($('#password').val()==''){
                            setTooltop(passwordObj,'show');ajax_lock = 0;setLoginStatus();
                            return false;
                        }
                        return true;
                    },
					success:function(data){
                        var data = eval('('+data+')');
                        if(data.status==1){
                            location.href = data.info;
                            return false;
                        }else if(data.status==2){ //用户
                            //$('#username_tiptext').html(data.info);
                            $("#validateCode").click();
                            setTooltop(usernameObj,'show',data.info);
                        }else if(data.status==3){
                            //$('#password_tiptext').html(data.info);
                            $("#validateCode").click();
                            setTooltop(passwordObj,'show',data.info);
                        }else if(data.status==4){
                            $("#validateCode").click();
                            setTooltop(validatecodeObj,'show',data.info);
                        }

                        if(data.verifyCode >= 3){
                            $('#verifyCodeShow').show();
                        }
                        setLoginStatus();
                        ajax_lock = 0;
                    }
				});
                return false;
			}
            //提示框
            /**
             *
             * @param obj
             * @param type show=>显示  close=>关闭
             * @param text
             */
            function setTooltop(obj,type,text){
                text = text==undefined ? '该输入项为必输项': text;
                if(type == 'show'){
                    obj.tooltip({
                        position: 'right',
                        showEvent:'',
                        content: '<span style="color:#000">'+text+'</span>',
                        onShow: function(){
                            $(this).tooltip('tip').css({
                                backgroundColor: '#FFFFCC',
                                borderColor: '#CC9933'
                            });
                        }
                    }).tooltip(type);
                }else{
                    obj.tooltip(type);
                }
            }

            function setLoginStatus(status){
                var status = status == 1 ? 1 : 0;
                if(status){
                    $('#submitForm').html('登录中...');
                    $('#submitForm').css('background-color','#B0B0B0');
                    $('#submitForm').css('border','1px solid #B0B0B0');
                }else{
                    $('#submitForm').html('登录');
                    $('#submitForm').css('background-color','#359AE7');
                    $('#submitForm').css('border','1px solid #0099FF');
                }
            }
            
             
            var password = document.getElementById("password");  
            //隐藏text block，显示password block  
            function hideShowPsw(){  
                if (password.type == "password") {  
                	password.type = "text";  
                     
                }else {  
                	password.type = "password";  
                    
                }  
            }  
           
		</script>
    </body>
</html>
 
               
    
