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


<form id="ff" method="post" style="height:438px;" data-href="/teacher/save.html?id=60&amp;sinKey=7ce5%25C8%7E%258B%258E%25C8%25EF%2584%259C%25D4%25B0%2518%2510%2504Dt%25BF%2512%25C7Y%25D7%2598%2525%259A%258BV%25F8c%25A5V%25DE%250A%250C%7ED%25A7%25083X%2591%25AE%25D2" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 856px; height: 438px;">

        <div class="panel layout-panel layout-panel-north" style="width: 856px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 838px; height: 350px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td>教职工姓名：</td>
                    <td><s:property value="teacher.teacher_name"/></td>
                    <td>性别：</td>
                    <td><s:property value="teacher.sex_name"/></td>
                    <td>出生日期：</td>
                    <td><s:property value="teacher.brither_name"/></td>
                    <td>工号：</td>
                    <td><s:property value="teacher.worknumber"/></td>
                </tr>

                <tr>
                    <td>当前所属部门：</td>
                    <td colspan="3"><s:property value="teacher.structure_name"/> </td>
                    <td>职务：</td>
                    <td><s:property value="teacher.duty_name"/></td>
                    <td>入职日期：</td>
                    <td><s:property value="teacher.entry_time_name"/></td>
                </tr>

                <tr>
                    <td>手机（登录名）：</td>
                    <td><s:property value="teacher.phone"/></td>
                    <td>E-mail：</td>
                    <td><s:property value="teacher."/></td>
                    <td>微信：</td>
                    <td><s:property value="teacher.weixin"/></td>
                    <td>QQ号：</td>
                    <td><s:property value="teacher.qq"/></td>
                </tr>

                <tr>
                    <td>当前状态：</td>
                    <td><s:property value="teacher.status_name"/></td>
                    <td>离职日期：</td>
                    <td><s:property value="teacher.left_time_name"/></td>
                    <td>最近登录：</td>
                    <td><s:property value="teacher.last_login_time_name"/></td>
                    <td>IP地址：</td>
                    <td><s:property value="teacher."/></td>
                </tr>

                <tr>
                    <td>所教科目：</td>
                    <td colspan="7">
                        <div id="teacherSubject">
                        <s:property value="teacher."/>
                                                    </div>                    </td>
                </tr>

                <tr>
                    <td colspan="8"><span style="color:red;font-size:12px;" id="error_text_name"></span></td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 856px; left: 0px; top: 367px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 856px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true)" group="" id=""><span class="l-btn-left"><span class="">关闭</span><span class="l-btn-icon "></span></span></a>
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