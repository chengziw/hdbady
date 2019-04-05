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


<form id="fm" style="height:260px; " method="post" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 488px; height: 260px;">

        <div class="panel layout-panel layout-panel-north" style="width: 488px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 470px; height: 170px;" title="" class="panel-body panel-body-noheader layout-body">
            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td>角色名称：<s:property value="role.name"/></td>
                </tr>
                <tr>
                    <td>可管理数据范围：<s:property value="role.scope"/></td>
                </tr>
                <tr>
                    <td>备注说明：<s:property value="role.note"/></td>
                </tr>
                <tr>
                    <td style="color: red">角色被删除后，拥有该角色的用户会自动失去对应的功能权限</td>
                </tr>
                <tr><td><div id="show-error-message-box" style="color: red"></div></td></tr>
            </tbody></table>
        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 488px; left: 0px; top: 187px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 488px; height: 73px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="deleteRole()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
            </div>
            <input id="id" value="<s:property value="role.id"/>" type="hidden">
        </div></div>
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">

    /* 解散班级 */
    function deleteRole(url) {
        $('#show-error-message-box').html('');
        
        if (confirm('角色被删除后，拥有该角色的用户会自动失去对应的功能权限')) {
            if ($('#save-btn').hasClass('mylinkbtn-load')) {
                return false;
            }
			var id=$('#id').val();
			//alert(id);
            var url='${pageContext.request.contextPath}/roleAction_deleteRole.action?id='+id+'';
            $('#save-btn').addClass('mylinkbtn-load');

            $.ajax({
                type: 'POST',
                url: url,
                dataType: 'json',
                success: function(data) {
                    $('#save-btn').removeClass('mylinkbtn-load');
                    if (data.errMeg == '') {
                        parent.window.closeWinIsReloadData = 1;
                        parent.$('#openWindow').window('close');
                    } else {
                        $('#show-error-message-box').html(result.errMeg);
                    }
                }
            });
            return false;
        }
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