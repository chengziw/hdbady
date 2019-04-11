<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>汤圆幼儿园</title>
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

<body style="padding:0px;margin:0px;">
<form id="ff" method="post" style="height:398px;" data-href="/ask/save.html">
    <div class="easyui-layout" fit="true" border="true">
        <div region="north" border="true" style="overflow:auto; padding:8px;height:328px;">
            <p>已投票人员(共<span id="user_view_num"></span><%-- <s:property value="size"/> --%>人)</p>
            <!--数据表开始-->
            <table id="user_view" class="easyui-datagrid"
                   data-options="
                   url:'${pageContext.request.contextPath}/askAction_aboutAboutAsk.action?id=<s:property value="id"/>&askItemsId=<s:property value="askItemsId"/>',
                   fitColumns:true,onLoadSuccess: userViewSuccess,
                   singleSelect:true,checkOnSelect:true">
                <thead>
	                <tr>
	                    <th data-options="field:'show_name',width:140">提交人</th>
	                    <th data-options="field:'submit_time_name',width:120">提交时间</th>
	                </tr>
                	<%-- <s:iterator value="list" var="v" status="s">
                		<tr>
                			<th data-options="field:'show_name',width:140"><s:property value="v"/></th>
                			<th data-options="field:'submit_time_name',width:120"><s:property value="clist[#s.index]"/></th>
                		</tr>
                	</s:iterator> --%>
                </thead>
            </table>
            <!--数据表结束-->
        </div>
        <div region="center" border="false" style="overflow:hidden;background-color:#E0ECFF; ">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <!--<a href="#" id="save-btn" class="easyui-linkbutton" iconCls="icon-save" onclick="saveFrom()">保存</a>-->
                <a href="#" class="easyui-linkbutton panel-tool-close" iconCls="icon-no" onClick="javascript:parent.$('#openDialog').window('close',true);">关闭</a>
            </div>
        </div>

    </div>
</form>
</body>

<script type="text/javascript">
    function userViewSuccess(data){
        if(data.total == 0){
            $(this).datagrid('appendRow', { show_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'show_name', colspan: 2 })
        }
        $('#user_view_num').html(data.total);
    }
</script>

<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>
</body>
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
</html>