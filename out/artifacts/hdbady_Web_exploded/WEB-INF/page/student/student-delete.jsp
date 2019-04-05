<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
<html>
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


<form id="ff" method="post" style="height:238px;" data-href="/student/save-del.html?id=1040&amp;sinKey=c37es%25A98x%25D7%25BC%25AC.%25A8w%259B%2594%2504%25FE7%2590%253Br%255C%25DA%25AC%253E%258C%25BC%2525%251F%2581%25C3%2540%250E%25E2%2526y%255EM%2527%25A5%25E7p%2500n%250F" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 566px; height: 238px;">

        <div class="panel layout-panel layout-panel-north" style="width: 566px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 548px; height: 150px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td id="status_name" colspan="3" style="font-weight:bold">当前状态：待确认入学<s:property value="student.status_name"/></td>
                </tr>
				<input name="id" value="<s:property value="student.id"/>" readonly="true" type="hidden" style："border:none"/></td>
                <tr>
                    <td>姓名：<s:property value="student.name"/></td>
                    <td>性别：<s:property value="student.sex"/></td>
                    <td>生日：<s:property value="student.yearMonthDay"/></td>
                </tr>

                <tr height="40">
                    <td colspan="3" valign="bottom"><span style="color: red;">温馨提示：学生信息删除后，不可恢复！</span></td>
                </tr>

                <tr>
                    <td colspan="3">
                        <span style="color:red;font-size:12px;" id="show-error-message-box"></span>
                    </td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 566px; left: 0px; top: 167px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 566px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">删除</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">

	function dataLoadSuccess(data){
		
		$("#status_name").innerHTML="状态";
	    /* var thLength = $('#tt tr:first').find('th').length;
	    if(data.total == 0){ //没有记录
	
	        $(this).datagrid('appendRow', { student_no: '<div style="text-align:center;color:red">没有找到记录！</div>' })
	            .datagrid('mergeCells', { index: 0, field: 'student_no', colspan: thLength })
	    } */
	}
	
   function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
      
        $('#save-btn').addClass('mylinkbtn-load');
        //var url = $("#ff").attr('data-href');

        $('#ff').form('submit',{
            url:'${pageContext.request.contextPath}/studentAction_deleteStudent.action',
            onSubmit:function(){
                var result = $(this).form('enableValidation').form('validate');
                if(!result){
                    $('#save-btn').removeClass('mylinkbtn-load');
                }
                return result;
            },
            success:function(result){
                var result = eval('('+result+')');
                if (result.status==1){
                    window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }else{
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                    $.messager.alert('提示',result.info);
                }
            }
        });
        
        $('#ff').form('submit',{
            url:'${pageContext.request.contextPath}/studentAction_deleteStudent.action',
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

         for (i = 0; i < helpTutorials.length; i++) {
            	// 判断元素是否存在 
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