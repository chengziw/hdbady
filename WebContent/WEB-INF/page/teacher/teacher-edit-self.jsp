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


<form id="ff" method="post" style="height:252px;" data-href="${pageContext.request.contextPath}/teacherAction_editSelf.action" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 588px; height: 252px;">

        <div class="panel layout-panel layout-panel-north" style="width: 588px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 570px; height: 162px;" title="" class="panel-body panel-body-noheader layout-body">

            <table cellspacing="0" cellpadding="8" border="0" width="100%">
                                <tbody><tr>
                    <td>姓名：${session.loginUser.teacher_name}</td>
                    <td>性别：${session.loginUser.sex_name}</td>
                    <td>出生日期：${session.loginUser.brither_name}</td>
                </tr>

                <tr>
                    <td>当前状态：
                    ${session.loginUser.status_name}</td>
                    <td>职务：
                     ${session.loginUser.teacherDuty.duty_name}</td>
                    <td>入职日期：
                    ${session.loginUser.entry_time_name}</td>
                </tr>

                <tr>
                    <td colspan="3">所属部门：${session.loginUser.structure.name}</td>
                </tr>
                
                <tr>
                    <td>手机：<input name="phone" style="width: 120px; display: none;" value="${session.loginUser.phone}" validtype="mobile" class="easyui-textbox textbox-f" textboxname="phone" type="text"></td>
                    <td>微信：<input name="weixin" style="width: 120px; display: none;" value="${session.loginUser.weixin}" validtype="MaxLength" class="easyui-textbox textbox-f" textboxname="email" type="text"></td>
              		<input name="id" value="${session.loginUser.id}" type="hidden">
                </tr>

                <tr>
                    <td colspan="3"><span style="color:red;" id="show-error-message-box"></span></td>
                </tr>
            </tbody></table>

        </div></div>


        <div class="panel layout-panel layout-panel-center" style="width: 588px; left: 0px; top: 179px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 588px; height: 73px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
    $.extend($.fn.validatebox.defaults.rules, {
        mobile: {//value值为文本框中的值
            validator: function (value) {
                var reg = /^1[3|4|5|7|8|9]\d{9}$/;
                return reg.test(value);
            },
            message: '输入手机号码格式不准确.'
        },
        email:{
            validator: function (value) {
                var reg = /^[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$/;
                return reg.test(value);
            },
            message: '输入email格式不准确.'
        },
        username:{
            validator: function (value) {
                var reg = /^1[3|4|5|7|8|9]\d{9}$/;
                if(reg.test(value)) return false;
                var reg = /^[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$/;
                if(reg.test(value)) return false;
                return true;
            },
            message: 'username格式不允许为手机和email格式.'
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
            message: '不能超过32个字母数字或16个汉字.'
        }
    })

    function saveFrom(){

        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');
       // $.messager.prompt('提示','请输入密码：','password',function(r){
           // if (r){
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
            //}
            $('#save-btn').removeClass('mylinkbtn-load');
        //});
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

        for (i = 0; i < helpTutorials.length; i++) {
            /* 判断元素是否存在 */
            if ($(helpTutorials[i].wrapper).length > 0) {
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