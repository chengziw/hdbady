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


<form id="ff" method="post" style="height:130px;" data-href="${pageContext.request.contextPath}/askAction_deleteAsk.action" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 286px; height: 130px;">

        <div class="panel layout-panel layout-panel-north" style="width: 286px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: hidden; padding: 8px; width: 268px; height: 42px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td width="1" align="right"></td>
                    <td>
                        <!--<label>
                            <input type="radio" class="is_check" checked name="is_check" value="1"> 确认删除
                        </label>
                        <label>
                            <input type="radio" class="is_check" name="is_check" value="0"> 取消删除
                        </label>-->
<input name="is_check" value="1" type="hidden">

<input name="id" value="<s:property value="ask.id"/>" type="hidden">

问卷调查删除后，不可恢复！<br>
<div style="color: red;" id="error_html_text">&nbsp;</div>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td><div style="color: red;" id="error_html_text">&nbsp;</div></td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 286px; left: 0px; top: 59px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 286px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-ok" onclick="saveFrom()" group="">删除</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">

    function saveFrom(){

        if($("input[name='is_check']:checked").val() == 0){
            parent.$('#openWindow').window('close');
            return false;
        };

        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $("#error_html_text").html('');
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
                    $("#error_html_text").html(result.info);
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