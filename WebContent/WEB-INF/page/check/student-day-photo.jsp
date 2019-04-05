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




<form id="ff" method="post" style="height:420px;" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 748px; height: 420px;">

        <div class="panel layout-panel layout-panel-north" style="width: 748px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 730px; height: 332px;" title="" class="panel-body panel-body-noheader layout-body">
            <input name="action" value="save" type="hidden">
            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td width="50%" align="center">
                                                        <a href="http://dbbimg.image.alimmdn.com/201702/ClockImg/IMG_20170211_032106" target="_blank">
                                    <img src="http://dbbimg.image.alimmdn.com/201702/ClockImg/IMG_20170211_032106" width="320">
                                </a>
                                <br><br>
                                <font color="green">到校时间：2017-02-11 15:21:05                                <br><br>
                                确认人：唐一诺的爸爸</font>
                                            </td>

                    <td width="50%" align="center">
                                            </td>
                </tr>
            </tbody></table>
        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 748px; left: 0px; top: 349px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 748px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">关闭</span><span class="l-btn-icon icon-no">&nbsp;</span></span></a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>



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