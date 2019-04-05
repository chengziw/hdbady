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


<form id="ff" style="height:138px; " method="post" data-href="${pageContext.request.contextPath}/teacherDutyAction_editTeacherDuty.action" class="panel-noscroll">

    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 476px; height: 138px;">

        <div class="panel layout-panel layout-panel-north" style="width: 476px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 458px; height: 50px;" title="" class="panel-body panel-body-noheader layout-body">


            <div class="fitem">
                <label class="lad_text" style="width:90px;"> 职务名称： </label>
                <input id="duty_name" name="duty_name" value="${teacherDuty.duty_name}" class="easyui-textbox textbox-f" required="true" data-options="prompt:'如：园长/教务主任等',validType:'MaxLength'" style="width: 200px; display: none;" textboxname="duty_name"><%-- <span class="textbox" style="width: 198px; height: 20px;"><input class="textbox-text validatebox-text" autocomplete="off" placeholder="如：园长/教务主任等" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 190px;" type="text"><input class="textbox-value" name="duty_name" value="董事长" type="hidden"></span> --%>
                <span style="color:red;font-size:12px;" id="show-error-message-box"></span>
            </div>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 476px; left: 0px; top: 67px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 476px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <input name="id" value="<s:property value="teacherDuty.id"/>" type="hidden">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>

</form>


<script type="text/javascript">
		$.extend($.fn.validatebox.defaults.rules,{
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
		    				/* return true; */
		    				return false;
		    		}
		    		return true;
		        },
		        message: '不能超过32个字母数字或16个汉字.'
		    }
		});

    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

        var url = $("#ff").attr('data-href');
        $('#ff').form('submit',{
            url:url,
            onSubmit:function(){
                var result = $(this).form('enableValidation').form('validate');
                if(!result){
                    $('#save-btn').removeClass('mylinkbtn-load');
                };
                return result;
            },
            success:function(result){
                var result = eval('('+result+')');
                if (result.status==1){
                    //window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }else {
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                }
            }
        });
    }

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