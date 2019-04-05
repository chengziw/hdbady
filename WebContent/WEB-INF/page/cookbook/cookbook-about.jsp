<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
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
	<script src="/js/amrPlayer/pcmdata-2.0.0.min.js"></script>
	<script src="/js/amrPlayer/libamr-2.0.1.min.js"></script>
	<script src="/js/amrPlayer/voice-2.0.js"></script>
</head>


<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<style type="text/css">
.tableBox{}
.tableBox tr{line-height: 40px;}
</style>


<form id="ff" style="height:568px; " method="post" data-href="" class="panel-noscroll">

    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 876px; height: 568px;">

        <div class="panel layout-panel layout-panel-north" style="width: 876px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 858px; height: 480px;" title="" class="panel-body panel-body-noheader layout-body">

            <table class="tableBox" width="100%">
                <tbody><tr><s:property value="cookBook."/>
                    <td style="border-bottom:1px solid #ddd;">
                        食谱日期：<s:property value="cookBook.year_month_day"/>                        &nbsp;&nbsp; &nbsp;&nbsp;
                        类型：<s:property value="cookBook.type_name"/>                       &nbsp;&nbsp; &nbsp;&nbsp;
                        年级：<s:property value="cookBook.classes.class_name"/>                       &nbsp;&nbsp; &nbsp;&nbsp;
                        班级：<s:property value="cookBook.classes.grade.name"/>                    </td>
                </tr>
                <tr>
                    <td>
                        食谱内容：
                        <div style="border: 1px solid #ddd; padding: 0 10px;">
                            <s:property value="cookBook.descs"/>                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        食谱图片：
                        <div>
                                            <s:if test="cookBook.image_url1!=null">
                                                                <a href="image/cookbook/${homeWork.image_url1}" target="_blank"><img src="image/cookbook/<s:property value="cookBook.image_url1"/>" height="80"></a>
                        					</s:if>
                        					<s:if test="cookBook.image_url2!=null">
                                                   				<a href="image/cookbook/${homeWork.image_url1}" target="_blank"><img src="image/cookbook/<s:property value="cookBook.image_url2"/>" height="80"></a>
                        					</s:if>
                        					<s:if test="cookBook.image_url3!=null">
                                                   				<a href="image/cookbook/${homeWork.image_url1}" target="_blank"><img src="image/cookbook/<s:property value="cookBook.image_url3"/>" height="80"></a>
                        					</s:if>
                                                           
                                                           
                                                           
                                                           
                                                           
                                                           
                                                            </div>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom:1px solid #ddd;">
                        食谱音频：
                                            </td>
                </tr>
                <tr>
                    <td>
                        发布老师：<s:property value="cookBook.teacher_info"/>                        &nbsp;&nbsp; &nbsp;&nbsp;
                        发布时间：1970-01-01 08:00:00                        &nbsp;&nbsp; &nbsp;&nbsp;
                        创建时间：2017-03-11 11:49:54                    </td>
                </tr>
                <tr>
                    <td>
                        家长APP推送状态：没推送                    </td>
                </tr>
                <tr>
                    <td>
                        家长APP拟推送的学生：                    </td>
                </tr>
                <tr>
                    <td>
                        家长APP端已读的学生：                    </td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 876px; left: 0px; top: 497px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 876px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">关闭</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>

</form>


<script type="text/javascript">
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