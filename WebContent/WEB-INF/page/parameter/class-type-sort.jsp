<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>truts-tags" %>
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
    ul{
        margin: 0px;
        padding: 0px;
        margin-top:18px; 
    }
    li{
        margin: 0px;
        padding: 0px;
    }   
    .sortable li{
        list-style: none;
        border-top: 1px dashed #aaaaaa;
        border-bottom: 0px dashed #aaaaaa;
        margin-top:0px;
        cursor: pointer; 
    }
    .sortable li{ font-size:12px; height: 26px; line-height: 26px; padding: 0 0 0 8px;}
    .sortable li:hover{ background: #ddd;        border-top: 1px solid #aaaaaa;}
</style>
<script src="/dear_assets/js/jquery-ui.min.js"></script>



<form id="ff" method="post" style="height:498px; " data-href="" class="panel-noscroll">

    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 268px; height: 498px;">

        <div class="panel layout-panel layout-panel-north" style="width: 268px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 250px; height: 410px;" title="" class="panel-body panel-body-noheader layout-body">

        <div class="fitem" id="dd">
            <ul class="sortable ui-sortable" id="sortable">
                <!--<li class=""  id="1">第1项</li>-->
                                            <li class="ui-sortable-handle" id="43">11</li>
                                            <li class="ui-sortable-handle" id="17">算术班</li>
                                            <li class="ui-sortable-handle" id="1">普通班</li>
                                            <li class="ui-sortable-handle" id="4">特长班</li>
                                            <li class="ui-sortable-handle" id="2">美术班</li>
                                            <li class="ui-sortable-handle" id="3">舞蹈班</li>
                                            <li class="ui-sortable-handle" id="42">舞蹈班2</li>
                            </ul>
        </div>
         <div id="show-error-message-box" style="color: red"></div>
    </div></div>


    <div class="panel layout-panel layout-panel-center" style="width: 268px; left: 0px; top: 427px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 268px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
       <div style="padding-top:12px; width:148px; float:left;">按住鼠标拖动即可重新排序</div> <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
            <input id="order_ids" value="" type="hidden">
            <div style="display: none;" id="sinKey">a034BEzP%B2%A5%F4%1E%F6%5C%84%16%05%FBa%83%92%98%3D%8F%CE.R%FA_%A3%3C%E8yp%F0%EC%9C%1EBT%14%86%25w%E0%FDL%A9C,4d92%AFv%3F%E3%8EkSN%83%A7%2Bmu%3A%BF%9F%7B%BB%83%C4F%3E%1C%D15%22%2BBO%FE%3B%19%FA%F4%B5%DE%E5%B6%9DR%D1%D6%28%D7%91,55a3%81%FD%9E%B2%0C%FB%28%ADs%28%96%B6%00%C2%E4%3E%F5%25%262%FD%13%D1%BDeA%E2%3A%82%10%93%E8%0C%EC%BB%D4%16%B8%B6%AC%CC%AB4%92,93ff5E%E0%5D%AE%11%EB%FA%7By%FB%ADP%82%A7%DC%CF%01%C2%5D%80%85%5D%04%D2%2Fu%DD%B83%13ck%FB%9A%12%2F%C8%19%A8%DA%5CK%E3,c722%E4%C9%FF%1C%E1e%F7%11%2A%97d%7B%3D%A9%0EGd%A5%07%B5%BE%2C%26%3EZ%BE%12%D7%A1%87j%9A%3F%A0%A1%9C%E83%7B%EE%DEZZA,080e%F7%1E%CDQ%F7%F3%07%B2%23%5Bg%E66%A9%AB%C9%2F%BF%F1WH%CC%D0Ng%D7%BC0%DBr%F4y%89F%FD%2C%D7K%A5E%DA%DF%DEA,7ff4%23%3C%E8%BF%255%7Dd%15%BF%09%E9x%FB%5E%EFXa%1D%97%99%95%B3%40%17%A61%DA%5EQ%F1%21K%25M%F1%10%82%CD%81%81%F5%28V%B8</div>
            <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveOrder()" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">保存</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a>
            <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">取消</span><span class="l-btn-icon icon-no">&nbsp;</span></span></a>
       </div>
    </div></div>

 <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>



<script type="text/javascript">
    $(function() {
        $( ".sortable" ).sortable({
            cursor: "move",
            items :"li",                        //只是li可以拖动
            opacity: 0.6,                       //拖动时，透明度为0.6
            revert: true,                       //释放时，增加动画
            update : function(event, ui){       //更新排序之后
               //alert($(this).sortable("toArray"));
                $("#order_ids").val($(this).sortable("toArray"));
            }
        });
    });

    function saveOrder(){
        $('#show-error-message-box').html('');
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

        if($("#order_ids").val()==''){
            return false;
        }
        $.ajax({
            url:'/class-type/save-order.html',
            data:{order:$("#order_ids").val(),sinKeys:$("#sinKey").html()},
            type:'POST',
            dataType:'JSON',
            success:function(result){
                $('#save-btn').removeClass('mylinkbtn-load');
                if(result.status == 1){
                    //window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                } else {
                    $('#show-error-message-box').html(result.info);
                }
            }
        })
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