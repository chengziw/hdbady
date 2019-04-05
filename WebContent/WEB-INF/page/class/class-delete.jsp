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
    
    <script type="text/javascript" src="js/outOfBounds.js"></script>
    <link rel="stylesheet" href="js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>


    <form id="fm" style="height:270px; " method="post" class="panel-noscroll">
        <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 568px; height: 270px;">

            <div class="panel layout-panel layout-panel-north" style="width: 568px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 550px; height: 180px;" title="" class="panel-body panel-body-noheader layout-body">
                <table width="100%" cellspacing="0" cellpadding="8" border="0">
                    <tbody><tr>
                        <td>类型：&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="classes.classType.type_name"/></td>
                        <td>班主任：&nbsp;&nbsp;&nbsp;<s:property value="classes.teacher.teacher_name"/></td>
                    </tr>
                    <tr style="font-weight:bold;">
                        <td>当前年级：<s:property value="classes.grade.name"/></td>
                        <td>班级名称： <s:property value="classes.class_name"/></td>
                    </tr>

                    <tr>
                        <td colspan="3">该班下次升级时间： <s:property value="classes.next_upgrade_time"/></td>
                    </tr>
                    <tr>
                        <td colspan="3">该班学生入学时间： <s:property value="classes.start_label"/></td>
                    </tr>
                    <tr>
                    <input name="id" value="<s:property value="classes.id"/>" type="hidden">
                        <td colspan="3">删除原因： <input id="note" name="note" style="width: 430px; display: none;" class="easyui-textbox textbox-f" textboxname="note" type="text"></td>
                    </tr>
                    <tr><td><div id="show-error-message-box" style="color: red"></div></td></tr>
              </tbody></table>
            </div></div>

            <div class="panel layout-panel layout-panel-center" style="width: 568px; left: 0px; top: 197px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 568px; height: 73px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                    <a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="dismissClass()" group="" id="">删除</a>
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
                </div>
                <input id="id" name="id" value="<s:property value="classes.id"/>" type="hidden">
            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
    </form>


<script type="text/javascript">
 
 	var id = $('#id').val();
 	
    //变动日期 开始 结束 清空按钮
    var change_time_end = $.extend([], $.fn.datebox.defaults.buttons);
    change_time_end.splice(1, 0, {
        text: '清空',
        handler: function(target){
            $('#' + $(target).attr('id')).datebox("setValue", "").datebox("hidePanel");
        }
    });

    /* 异动开始时间 */
    $('#change_date').datebox({
        editable: false,
        required:true,
        buttons: change_time_end
    });

    /* 解散班级 */
    function dismissClass(url) {
        $('#show-error-message-box').html('');
        var url = '${pageContext.request.contextPath}/classesAction_deleteClass.action?id='+id+'';
        if (confirm('您确定删除吗？班级删除后无法恢复')) {
            var note = $('#note').val();

            $.ajax({
                type: 'POST',
                url: url,
                dataType: 'json',
                data: {note: note},
                success: function(data) {
                    if (data.errMeg == '') {
                        parent.window.closeWinIsReloadData = 1;
                        parent.$('#openWindow').window('close');
                    } else {
                        $('#show-error-message-box').html(data.errMeg);
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