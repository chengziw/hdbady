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

  
<form id="fm" method="post" style="height:118px; " data-href="${pageContext.request.contextPath}/gradeAction_editGrade.action" class="panel-noscroll">

        <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 416px; height: 118px;">
            
            <div class="panel layout-panel layout-panel-north" style="width: 416px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 398px; height: 30px;" title="" class="panel-body panel-body-noheader layout-body">

                <input id="id" name="id" value="<s:property value="grade.id"/>" class="easyui-validatebox validatebox-text" type="hidden">
                <div class="fitem">
                	<label>年级名称：</label>
                <input name="name" value="<s:property value="grade.name"/>" required="true" class="easyui-textbox textbox-f" required="true" data-options="prompt:'如：小班/中班/大班等',validType:'MaxLength'" style="width: 165px; display: none;" textboxname="name"><%-- <span class="textbox" style="width: 163px; height: 20px;"><input class="textbox-text validatebox-text" autocomplete="off" placeholder="如：小班/中班/大班等" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 155px;" type="text"><input class="textbox-value" name="name" value="托管班1" type="hidden"></span> --%>
             <%--   		<input name="name" value="<s:property value="grade.name"/>" class="easyui-textbox textbox-f" data-options="" style="display: none;" textboxname="name">
              --%>   </div>
               <!-- <div class="fitem" style="display:none">
                	<label>学校名称:</label>
                	<input name="school_id" value="8" class="easyui-validatebox validatebox-text">
                </div> 
                <div class="fitem" style="display:none">
                	<label>排序:</label>
                	<input name="sort_name" value="<s:property value="grade."/>" class="easyui-validatebox validatebox-text">
                </div>
                <div class="fitem" style="display:none">
                	<label>状态:</label>
                	<input name="status" value="<s:property value="grade.status"/>" class="easyui-validatebox validatebox-text">
                </div> -->

            </div></div> 

            <div class="panel layout-panel layout-panel-center" style="width: 416px; left: 0px; top: 47px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 416px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                    <a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveUser()" group="" id="">保存</a>
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
                </div>

            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
    </form>

  

<script type="text/javascript">
	var id = $('#id').val();
    /* 保存学校信息 */
    function saveUser(){
   
        var url = $('#fm').attr('data-href'); // 保存学校地址
        var id = $('#id').val();

        $('#fm').form('submit',{
            //url: '${pageContext.request.contextPath}/gradeAction_editGrade.action',
           	url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');

                if (result.errorMsg){
                    setTooltop($('.textbox-text'),'show',result.errorMsg);
                } else {
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }
            }
        });
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
</script>


<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
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
        				return false;
        		}
        		return true;
            },
            message: '不能超过32个字母数字或16个汉字.'
        }
    });
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