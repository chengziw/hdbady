<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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


<form id="fm" style="height:300px; " method="post" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 288px; height: 300px;">

        <div class="panel layout-panel layout-panel-north" style="width: 288px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 270px; height: 210px;" title="" class="panel-body panel-body-noheader layout-body">
            <table cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td><input name="status" checked="checked" value="3" type="radio"><label>同意，批准该请假申请</label></td>
                </tr>
                <tr>
                    <td><input name="status" value="2" type="radio"><label>不同意，拒绝该请假申请</label></td>
                </tr>
                <tr style="display:none;">
                    <td style=" padding-left:18px;"><input id="check_note" name="check_note" class="easyui-textbox easyui-validatebox textbox-f validatebox-text validatebox-invalid" data-options="multiline:true, prompt:'', required:true, tipPosition: 'right', missingMessage: '请输入拒绝原因'" value="" style="width: 150px; height: 100px; display: none;" textboxname="check_note"></td>
                </tr>
                <tr><td><div id="show-error-message-box" style="color: red"></div></td></tr>
            </tbody></table>
        </div></div>
        <input id="id" name="id" value="<s:property value="teacherVacation.id"/>" type="hidden">
        <div class="panel layout-panel layout-panel-center" style="width: 288px; left: 0px; top: 227px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 288px; height: 73px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <%-- <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveApproval()" group=""><span class="l-btn-left "><span class="l-btn-text">保存</span><span class=" icon-save"></span></span></a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id=""><span class="l-btn-left "><span class="l-btn-text">取消</span><span class="l-btn-icon "></span></span></a> --%>
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveApproval()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
            </div>
        </div></div>
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>

<script type="text/javascript">


    /* 保存审核 */
    function saveApproval(){
        $('#show-error-message-box').html('');
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }

        $('#save-btn').addClass('mylinkbtn-load');

        var url = "${pageContext.request.contextPath}/teacherVacationAction_checkTeacherVacation.action";
        
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                var flag = true;
                if ($('#check_note').closest('tr').is(':hidden')) {
                    $('#check_note').validatebox('disableValidation');
                } else {
                    $('#check_note').validatebox('enableValidation');
                    flag = $('#check_note').validatebox('isValid');

                    if (flag == false) {
                        $('#save-btn').removeClass('mylinkbtn-load');
                    }
                }

                return flag;
            },
            success: function(result){
                $('#save-btn').removeClass('mylinkbtn-load');
                var result = eval('('+result+')');
                if (result.errMeg){
                    $('#show-error-message-box').html(result.errMeg);
                } else {
                    parent.window.closeWinIsReloadData = 1;
                    parent.$('#openWindow').window('close');
                }
            }
        });
    }

    $(function () {
        /* 监听状态的变化, 显示拒绝原因 */
        $(document).on('click', 'input[name="status"]', function(){
            if ($(this).val() == 3) {
                $('#check_note').closest('tr').hide();
            } else {
                $('#check_note').closest('tr').show();
            }
        })
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