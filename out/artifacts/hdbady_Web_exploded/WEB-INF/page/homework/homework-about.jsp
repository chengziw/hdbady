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
                <tbody><tr>
                    <td style="border-bottom:1px solid #ddd;">
                        作业日期：<s:property value="homeWork.year_month_day"/>                        &nbsp;&nbsp; &nbsp;&nbsp;
                        科目：<s:property value="homeWork.subject.name"/>                      &nbsp;&nbsp; &nbsp;&nbsp;
                        年级：<s:property value="homeWork.classes.class_name"/>                                               &nbsp;&nbsp; &nbsp;&nbsp;
                        班级：<s:property value="homeWork.classes.grade.name"/>                   </td>
                </tr>
                <tr>
                    <td>
                        作业内容：
                        <div style="border: 1px solid #ddd; padding: 0 10px;">
                             <s:property value="homeWork.descs"/>                          </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        作业图片：
                        <div>
                        					<s:if test="homeWork.image_url1!=null">
                                                                <a href="image/homework/${homeWork.image_url1}" target="_blank"><img src="image/homework/<s:property value="homeWork.image_url1"/>" height="80"></a>
                        					</s:if>
                        					<s:if test="homeWork.image_url2!=null">
                                                   				<a href="image/homework/${homeWork.image_url1}" target="_blank"><img src="image/homework/<s:property value="homeWork.image_url2"/>" height="80"></a>
                        					</s:if>
                        					<s:if test="homeWork.image_url3!=null">
                                                   				<a href="image/homework/${homeWork.image_url1}" target="_blank"><img src="image/homework/<s:property value="homeWork.image_url3"/>" height="80"></a>
                        					</s:if>
                                                   			
                                                    </div>
                    </td>
                </tr>
                <%-- <tr>
                    <td style="border-bottom:1px solid #ddd; ">
                        作业音频：
                                                    <a class="easyui-linkbutton l-btn l-btn-small" id="playId" group=""><span class="l-btn-left"><span class="l-btn-text">播放音频文件</span></span></a>
                                            </td>
                </tr> --%>
                <tr>
                    <td>
                        发布老师：<s:property value="homeWork.teacher_info"/>                 &nbsp;&nbsp; &nbsp;&nbsp;
                        发布时间：<s:property value="homeWork.publish_time_name"/>                        &nbsp;&nbsp; &nbsp;&nbsp;
                        创建时间：<s:property value="homeWork.publish_time_name"/>                    </td>
                </tr>
                <tr>
                    <td>
                        家长APP推送状态：已推送                    </td>
                </tr>
                <tr>
                    <td>
                        家长APP拟推送的学生：陈小二,龙小花,唐一诺,曾小星,韦玲珑,杨继萍,李艳琴                   </td>
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
                RongIMLib.RongIMVoice.init();
            document.getElementById("playId").onclick = function(){
            	alert("播放音频");
                RongIMLib.RongIMVoice.play("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")
            };
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