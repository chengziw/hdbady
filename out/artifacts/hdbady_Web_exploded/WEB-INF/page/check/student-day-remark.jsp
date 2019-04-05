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

<style type="text/css">
    .fitem{ line-height: 30px; }
    .lad_text{ font-size: 12px; width: 70px; display: inline-block;}
    .span_text{ font-size: 12px; color: #999;}
    .span_text2{ font-size: 12px;}
</style>


<form id="ff" method="post" style="height:260px;" data-href="/clock-student/add-note.html?id=9&amp;date=2017-2-11&amp;sinKey=bc6f%25F0%2524%25C0z%25ABe%25FF%25BC%25DF%2590%2516w%25B6O%25E8%2512z%25E1J%2588%25E0%253A0%25C9%253D%253A%25256%25F8%2512%2508%25B5%259C" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 406px; height: 260px;">

        <div class="panel layout-panel layout-panel-north" style="width: 406px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 388px; height: 110px;" title="" class="panel-body panel-body-noheader layout-body">
            <input name="action" value="save" type="hidden">
            <table width="100%" cellspacing="0" cellpadding="8" border="0">
              <tbody><tr>
                <td colspan="3">Dear宝贝示范幼儿园 ， 托班（一班） ， 陈小二 ， 男</td>
              </tr>
              <tr>
                  			    <td width="22%">考勤日期：</td>
                <td colspan="2">2017-02-11 （周六）</td>
              </tr>
              <tr>
                <td width="22%">考勤备注：</td>
                <td><input id="note" value="" class="easyui-textbox textbox-f" required="true" data-options="novalidate:true," style="width: 180px; display: none;" textboxname="note"><span class="textbox" style="width: 178px; height: 20px;"><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 170px;" type="text"><input class="textbox-value" name="note" value="" type="hidden"></span></td>
                <td><span style="color:red;font-size:12px;" id="show-error-message-box"></span></td>
              </tr>
            </tbody></table>
        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 406px; left: 0px; top: 127px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 406px; height: 133px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">保存</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">取消</span><span class="l-btn-icon icon-no">&nbsp;</span></span></a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">

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
                }{
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