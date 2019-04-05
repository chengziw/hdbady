<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Dear宝贝-幼教云管理平台</title>
    <link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/easyui-1.4.4/themes/icon.css">

    <script type="text/javascript" src="js/easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/easyui-1.4.4/jquery.easyui.min.js"></script>    
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    
    <link rel="stylesheet" href="js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<style type="text/css">
    .fitem{ line-height: 30px; }
    .lad_text{ font-size: 12px; width: 70px; display: inline-block;}
    .span_text{ font-size: 12px; color: #999;}
    .span_text2{ font-size: 12px;}
</style>


<form id="ff" method="post" style="height:198px;" data-href="${pageContext.request.contextPath}/teacherAction_editPassword.action" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 386px; height: 198px;">

        <div class="panel layout-panel layout-panel-north" style="width: 386px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 368px; height: 140px;" title="" class="panel-body panel-body-noheader layout-body">

            <table cellspacing="0" cellpadding="8" border="0" width="100%">

                <tbody><tr>
                    <td>旧密码：<input name="password" value="" class="easyui-textbox textbox-f" required="true" data-options="validType:['space','password']" style="display: none;" textboxname="old_password" type="password"></td>
                </tr>

                <tr>
                    <td>新密码：<input name="new_password" value="" class="easyui-textbox textbox-f" required="true" data-options="validType:['space','password']" style="display: none;" textboxname="new_password" type="password"></td>
                </tr>
                
                <tr>
                    <td>再次输入：<input name="new_password_copy" value="" class="easyui-textbox textbox-f" required="true" data-options="validType:['space','password']" style="display: none;" textboxname="new_password" type="password"></td>
                </tr>

                <tr>
                	<input name="id" value="${session.loginUser.id}" type="hidden">
                    <td><span style="color:red;" id="show-error-message-box"></span></td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 386px; left: 0px; top: 157px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 386px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
	
$.extend($.fn.validatebox.defaults.rules, {
    password: {//value值为文本框中的值
        validator: function (value) {
            if(value.length < 6 ||value.length>32) return false;
            else return true;
        },
        message: '密码长度最少6位最多32位.'
    },
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
    }
})
    function saveFrom(){

        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

                var url = $("#ff").attr('data-href');
                $('#ff').form('submit',{
                    url:url,
                    onSubmit:function(params){
                        var result = $(this).form('enableValidation').form('validate');
                        if(!result){
                            $('#save-btn').removeClass('mylinkbtn-load');
                        };
                        return result;
                    },
                    success:function(result){
                        var result = eval('('+result+')');
                        if (result.status==1){
                            parent.$('#openWindow').window('close');
                        }else{
                            $('#save-btn').removeClass('mylinkbtn-load');
                            $("#show-error-message-box").html(result.info);
                        }
                    }
                });
    }

    $(function(){

    })


</script>


<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>

<script type="text/javascript">
    var helpTutorials = [];

    function showRightHelp() {
        // Set up tour

        var pagewalkthrough = [];
        var tempData = null;

        for (i = 0; i &lt; helpTutorials.length; i++) {
            /* 判断元素是否存在 */
            if ($(helpTutorials[i].wrapper).length &gt; 0) {
                tempData =  {wrapper: helpTutorials[i].wrapper ,popup: {content: '#' + helpTutorials[i].contentWrapper,type: 'tooltip',position: helpTutorials[i].postion}};
                pagewalkthrough.push(tempData);
            }
        }

        $('body').pagewalkthrough({
            name: 'introduction',
            steps: pagewalkthrough
        });

        // Show the tour
        $('body').pagewalkthrough('show');
    }
</script>
</body></html>