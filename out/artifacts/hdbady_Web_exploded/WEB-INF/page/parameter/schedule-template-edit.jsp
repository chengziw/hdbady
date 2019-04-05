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

<style type="text/css">
    table.gridtable {
        font-family: verdana,arial,sans-serif;
        font-size:11px;
        color:#333333;
        border-width: 1px;
        border-color: #cccccc;
        border-collapse: collapse;
    }
    table.gridtable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #cccccc;
        background-color: #dedede;
    }
    table.gridtable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #cccccc;

    }
</style>
<form id="post-form" style="height:502px; " method="post" data-href="/schedule-template/save.html?sinKey=8ebe%2580%2599G%2585B%2597%257D%2512%2503LC%2583%25B0H%2512%2523%25D8%2585%259AO%25C3%253D%255E%25A5K%2522%2512X6%25BA3%258DYM%25B0%2504%25A7%25A3%25F2%25B9%25D2%25DF%25D8%253D%25ED" class="panel-noscroll">
    <!-- <input name="id" value="1" type="hidden"> -->
    
    <div class="easyui-layout layout easyui-fluid" border="true" fit="true" style="width: 828px; height: 502px;"> 
        <!--1.2 region="west",必须指明宽度-->
        <div class="panel layout-panel layout-panel-west" style="width: 338px; left: 0px; top: 0px;"><div region="west" title="" style="padding-left: 8px; padding-top: 8px; width: 328px; height: 455px;" border="true" class="panel-body panel-body-noheader layout-body panel-noscroll">
            <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 328px; height: 455px;">                
                <table cellspacing="0" cellpadding="8" border="0">
                    <tbody><tr>
                        <td>补课类型：</td>
                        <td><input id="week_type_label" name="week_type_label" value="<s:property value="schedule.week_type_label"/>" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" data-options="novalidate:true" style="display: none;" textboxname="week_type" comboname="week_type"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="week_type" value="1" type="hidden"></span> --%></td>
                    	<%-- <input id="week_type_name" name="week_type_name" value="<s:property value="schedule.week_type_name"/>" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" data-options="novalidate:true" style="display: none;" textboxname="week_type_name" comboname="week_type_name"> --%>
                    </tr>
                    <tr>
                        <td>上午有几节课：</td>
                        <td><input id="morning_has_num" name="morning_has_num" value="<s:property value="schedule.morning_has_num"/>" validtype="validateName" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" data-options="novalidate:true" style="display: none;" textboxname="morning_has_num" comboname="morning_has_num"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="morning_has_num" value="6" type="hidden"></span> --%></td>
                    </tr>
                    <tr>
                        <td>下午有几节课：</td>
                        <td><input id="afternoon_has_num" name="afternoon_has_num" value="<s:property value="schedule.afternoon_has_num"/>" validtype="validateName" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" data-options="novalidate:true" style="display: none;" textboxname="afternoon_has_num" comboname="afternoon_has_num"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="afternoon_has_num" value="5" type="hidden"></span> --%></td>
                    </tr>
                    <tr>
                        <td>上午开始上课时间：</td>
                        <td><input id="morning_start" name="morning_start" value="<s:property value="schedule.morning_start"/>" validtype="validateName" class="easyui-validatebox validatebox-text timespinner-f spinner-f textbox-f" data-options="novalidate:true" style="display: none;"><%-- <span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" value="09:30" type="hidden"></span> --%></td>
                    </tr>
                    <tr>
                        <td>下午开始上课时间：</td>
                        <td><input id="afternoon_start" name="afternoon_start" value="<s:property value="schedule.afternoon_start"/>" validtype="validateName" class="easyui-validatebox validatebox-text timespinner-f spinner-f textbox-f" data-options="novalidate:true" style="display: none;"><%-- <span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" value="14:00" type="hidden"></span> --%></td>
                    </tr>
                    <tr>
                        <td>一节课时长(分钟)：</td>
                        <td><input id="duration"  required="true" data-options="validType:'coursetime'" name="duration" value="<s:property value="schedule.duration"/>"  class="easyui-textbox textbox-f" style="display: none;" textboxname="duration"><%-- <span class="textbox" style="width: 145px; height: 20px;"><input class="textbox-text validatebox-text" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 137px;" type="text"><input class="textbox-value" name="duration" value="40" type="hidden"></span> --%></td>
                    </tr>
                    <tr>
                        <td>课间休息时长(分钟)：</td>
                        <td><input id="rest_duration" required="true" data-options="validType:'resttime'" name="rest_duration" value="<s:property value="schedule.rest_duration"/>" class="easyui-textbox textbox-f" style="display: none;" textboxname="rest_duration"><%-- <span class="textbox" style="width: 145px; height: 20px;"><input class="textbox-text validatebox-text" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 137px;" type="text"><input class="textbox-value" name="rest_duration" value="15" type="hidden"></span> --%></td>
                    </tr>
                    <tr><td colspan="2"><div id="show-error-message-box" style="color: red"></div></td></tr>
                </tbody></table>
            <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
        </div></div>
        <!--1.3region="center",这里的宽度和高度都是由周边决定，不用设置-->
        <div class="panel layout-panel layout-panel-center" style="width: 491px; left: 337px; top: 0px;"><div region="center" border="true" style="padding: 20px; width: 449px; height: 423px;" title="" class="panel-body panel-body-noheader layout-body">
            <table id="schedule-template-table" class="gridtable">
                <tbody><tr><td bgcolor="#f1f1f1">第几节</td><td bgcolor="#f1f1f1">上课时间</td><td bgcolor="#f1f1f1">下课时间</td></tr>
                
                		<s:iterator value="list" var="l" status="vs">
                			<tr>
	                            <td>第<s:property value="#vs.index+1"/>节</td>
	                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times"  value="<s:property value="#l.start_time"/>" style="display: none;" textboxname="start_times" spinnername="start_times"><%-- <span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="09:30" type="hidden"></span> --%></td>
	                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times"  value="<s:property value="#l.end_time"/>" style="display: none;" textboxname="end_times" spinnername="end_times"><%-- <span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="10:10" type="hidden"></span> --%></td>
	                      
	                       	</tr>
	                    <s:if test="#vs.index==schedule.morning_has_num-1">
	                       		 <tr><td colspan="3" align="center"> 中午休息时间 </td></tr>
	                       	</s:if> 
                		</s:iterator>
                		
                       <%--  <tr>
                            <td>第1节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times"  value="09:30" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="09:30" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times"  value="10:10" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="10:10" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第2节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="10:25" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="10:25" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="11:05" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="11:05" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第3节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="11:20" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="11:20" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="12:00" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="12:00" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第4节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="12:15" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="12:15" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="12:55" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="12:55" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第5节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="13:10" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="13:10" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="13:50" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="13:50" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第6节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="14:05" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="14:05" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="14:45" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="14:45" type="hidden"></span></td>
                        </tr>
                                                                                <tr><td colspan="3" align="center"> 中午休息时间 </td></tr>
                        <tr>
                            <td>第7节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="14:00" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="14:00" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="14:40" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="14:40" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第8节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="14:55" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="14:55" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="15:35" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="15:35" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第9节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="15:50" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="15:50" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="16:30" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="16:30" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第10节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="16:45" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="16:45" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="17:25" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="17:25" type="hidden"></span></td>
                        </tr>
                                                                                <tr>
                            <td>第11节</td>
                            <td><input class="start_times timespinner-f spinner-f textbox-f" name="start_times" value="17:40" style="display: none;" textboxname="start_times" spinnername="start_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="start_times" value="17:40" type="hidden"></span></td>
                            <td><input class="end_times timespinner-f spinner-f textbox-f" name="end_times" value="18:20" style="display: none;" textboxname="end_times" spinnername="end_times"><span class="textbox spinner" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="end_times" value="18:20" type="hidden"></span></td>
                        </tr> --%>
                        </tbody></table>  
                        <input name="id" value="<s:property value="schedule.id"/>" type="hidden"/></td>           
        </div></div>
        <div class="panel layout-panel layout-panel-south" style="width: 828px; left: 0px; top: 465px;"><div region="south" border="false" style="background-color: rgb(224, 236, 255); width: 828px; height: 37px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
             <!-- 保存按钮 -->
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:3px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveScheduleTemplate()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
            </div>
        </div></div>
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>   
    
</form>
<script type="text/javascript">
    var url = $('#post-form').attr('data-href'); // 保存学校地址
    $.extend($.fn.validatebox.defaults.rules, {
	//一节课时长
    	coursetime: {//value值为文本框中的值
            validator: function (value) {
            	if(value>0){
               	 var reg = /^\d{0,3}$/;
                    return reg.test(value);
               }
               return false;
           },
           message: '格式不对.'
        },
    //课间休息时长
        resttime: {//value值为文本框中的值
            validator: function (value) {
            	if(value>0){
                	 var reg = /^\d{0,3}$/;
                     return reg.test(value);
                }
                return false;
            },
            message: '格式不对.'
        },
        noNull: {
            validator: function(value, param){
                if(value=='请选择' || value==''){
                    return false;
                }
                return true;
            },
            message: '此输入项为必输项'
        },
    })
    // 格式化秒数到时间格式
    Number.prototype.formatTime = function() {
        // 计算
        var h = 0, i = 0, s = parseInt(this);
        if(s>60){
            i = parseInt(s / 60);
            s = parseInt( s % 60);
            if(i > 60) {
                h = parseInt( i / 60);
                i = parseInt( i % 60);
            }
        }
        // 补零
        var zero = function(v){
            return ( v >> 0) < 10 ? "0" + v : v;
        };
        return [zero(h),zero(i)].join(":");
    };

    /* 创建课程表模板 */
    function createScheduleTemplate() {
        var weekType = $('#week_type_label').combobox('getValue'); // 周末补课类型
        var morningHasNum = $('#morning_has_num').combobox('getValue'); // 上午有几节课
            morningHasNum = isNaN(parseInt(morningHasNum))? 0: parseInt(morningHasNum);

        var afternoonHasNum = $('#afternoon_has_num').combobox('getValue'); // 下午有几节课
            afternoonHasNum = isNaN(parseInt(afternoonHasNum))? 0: parseInt(afternoonHasNum);

        var morningStartTime = $('#morning_start').val(); // 上午开始时间
        var afternoonStartTime = $('#afternoon_start').val(); // 下午开始时间

        var duration = $('#duration').textbox('getValue'); // 一节课时长, 单位分钟
            duration = isNaN(parseInt(duration))? 0: parseInt(duration);
            //alert(duration);
        var restDuration = $('#rest_duration').textbox('getValue');
            restDuration = isNaN(parseInt(restDuration))? 0: parseInt(restDuration); // 课间休息时长

        var totalHasNum = parseInt(morningHasNum) + parseInt(afternoonHasNum);

        var contentTr = '<tr><td bgcolor="#f1f1f1">第几节</td><td bgcolor="#f1f1f1">上课时间</td><td bgcolor="#f1f1f1">下课时间</td></tr>';

        var tmpTdContent = '';

        var morningStartTimeArr = morningStartTime.split(':');
        var startTime = morningStartTimeArr[0] * 3600 + morningStartTimeArr[1] * 60;
        var endTime = startTime + duration * 60;

        var afternoonStartTimeArr = afternoonStartTime.split(':');

        var forIndex = 1;
        if (totalHasNum == 0) {
            contentTr += '<tr><td colspan="3" align="center"> 上午无课 </td></tr>';
            contentTr += '<tr><td colspan="3" align="center"> 中午 </td></tr>';
            contentTr += '<tr><td colspan="3" align="center"> 下午无课 </td></tr>';
        }

        for(var i = 1; i <= totalHasNum; i++) {

            if (morningHasNum == 0 && forIndex == 1) {
                contentTr += '<tr><td colspan="3" align="center"> 上午无课 </td></tr>';
                contentTr += '<tr><td colspan="3" align="center"> 中午 </td></tr>';
            }

            if (i - 1 == morningHasNum) {
                startTime = afternoonStartTimeArr[0] * 3600 + afternoonStartTimeArr[1] * 60;
                forIndex = 1;
            } 

            /* 如果不是第一节课, 每节课的开始时间加10分钟 */
            startTime += forIndex != 1 ? (duration * 60) + (restDuration * 60): 0;

            endTime = startTime + duration * 60;
            
            tmpTdContent = '';
            contentTr += '<tr>';

            tmpTdContent += '<td>' + i + '</td>';

            tmpTdContent = '';
            contentTr += '<tr>';

            tmpTdContent += '<td>' + i + '</td>';

            /* 拼接上课和下课时间 */
            tmpTdContent += '<td><input class="start_times" name="start_times" value="' + startTime.formatTime() + '" /></td><td><input class="end_times" name="end_times"  value="' + endTime.formatTime() + '" /></td>';
            contentTr +=  tmpTdContent;
            contentTr += '</tr>';
            
            /* 拼入中午休息 */
            if (morningHasNum == i) {
                contentTr += '<tr><td colspan="3" align="center"> 中午 </td></tr>';

                if (totalHasNum == morningHasNum) {
                    contentTr += '<tr><td colspan="3" align="center"> 下午无课 </td></tr>';
                }

            }

            forIndex++;
        }

        $('#schedule-template-table').html(contentTr);

        /* 开办日期 */
        $('.start_times').timespinner({
            editable: false,
            required:true
        });

        /* 开办日期 */
        $('.end_times').timespinner({
            editable: false,
            required:true
        });
    }

    /* 保存课程表模板 */
    function saveScheduleTemplate() {
        $('#show-error-message-box').html('');
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        var url = '${pageContext.request.contextPath}/scheduleAction_editSchedule.action';
        $('#save-btn').addClass('mylinkbtn-load');

        $('#post-form').form('submit',{
            url: url,
            onSubmit: function(){
                var flag = $(this).form('enableValidation').form('validate');
                if (flag == false) {
                    $('#save-btn').removeClass('mylinkbtn-load');
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

    $(function(){
        var gradeInputTemplate = '<span><input class="grade-inputs" name="grade_ids[]" type="checkbox" value="{gradeId}" /> {gradeName}</span>';
        
        /* 开办日期 */
        $('.start_times').timespinner({
            editable: false,
            required:true
        });

        /* 开办日期 */
        $('.end_times').timespinner({
            editable: false,
            required:true
        });

        /* 开办日期 */
        $('#morning_start').timespinner({
            editable: false,
            required:true,
            onSpinUp: function() {
                createScheduleTemplate();
            },
            onSpinDown: function() {
                createScheduleTemplate();
            },
        });

        /* 开办日期 */
        $('#afternoon_start').timespinner({
            editable: false,
            required:true,
            onSpinUp: function() {
                createScheduleTemplate();
            },
            onSpinDown: function() {
                createScheduleTemplate();
            },
        });

        /* 补课类型 */
        $('#week_type_label').combobox({
            data: [{id : 1, name: '周六和周日无补课'}, {id: 2, name: '仅周六补课'}, {id: 3, name: '仅周日补课'}, {id: 4, name: '周六和周日都补课'}],
            editable:false,
            valueField:'id',
            textField:'name',
            required: true, 
            onLoadSuccess:function() {
                $('#week_type_label').combobox("setValue", $('#week_type_label').val());
            },
            onSelect: function() {
            	//alert(record.id);
                createScheduleTemplate();
            },
        });

         /* 上午有多少节课 */
        $('#morning_has_num').combobox({
            data: [{id : 0, name: '无课'},{id : 1, name: '1节课'}, {id: 2, name: '2节课'}, {id: 3, name: '3节课'}, {id: 4, name: '4节课'}, {id: 5, name: '5节课'}, {id: 6, name: '6节课'}],
            editable:false,
            valueField:'id',
            textField:'name',
            required: true, 
            onLoadSuccess:function() {
            },
            onSelect: function() {
                createScheduleTemplate();
            },
        });

         /* 上午有多少节课 */
        $('#afternoon_has_num').combobox({
            data: [{id : 0, name: '无课'},{id : 1, name: '1节课'}, {id: 2, name: '2节课'}, {id: 3, name: '3节课'}, {id: 4, name: '4节课'}, {id: 5, name: '5节课'}, {id: 6, name: '6节课'}],
            editable:false,
            valueField:'id',
            textField:'name',
            required: true, 
            onLoadSuccess:function() {
            },
            onSelect: function() {
                createScheduleTemplate();
            },
        });

        $("#duration").textbox('textbox').bind("change", function () {
            setTimeout('createScheduleTemplate()', 1000);
        })

        $("#rest_duration").textbox('textbox').bind("change", function () {
            setTimeout('createScheduleTemplate()', 1000);
        })

        /* 监听表单里面元素值的变化 */
        $('body').on('change', '#week_type_label', function(){
            setTimeout('createScheduleTemplate()', 1000);
        });
    });

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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">周六和周日无补课</div><div id="_easyui_combobox_i1_1" class="combobox-item">仅周六补课</div><div id="_easyui_combobox_i1_2" class="combobox-item">仅周日补课</div><div id="_easyui_combobox_i1_3" class="combobox-item">周六和周日都补课</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item">无课</div><div id="_easyui_combobox_i2_1" class="combobox-item">1节课</div><div id="_easyui_combobox_i2_2" class="combobox-item">2节课</div><div id="_easyui_combobox_i2_3" class="combobox-item">3节课</div><div id="_easyui_combobox_i2_4" class="combobox-item">4节课</div><div id="_easyui_combobox_i2_5" class="combobox-item">5节课</div><div id="_easyui_combobox_i2_6" class="combobox-item combobox-item-selected">6节课</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i3_0" class="combobox-item">无课</div><div id="_easyui_combobox_i3_1" class="combobox-item">1节课</div><div id="_easyui_combobox_i3_2" class="combobox-item">2节课</div><div id="_easyui_combobox_i3_3" class="combobox-item">3节课</div><div id="_easyui_combobox_i3_4" class="combobox-item">4节课</div><div id="_easyui_combobox_i3_5" class="combobox-item combobox-item-selected">5节课</div><div id="_easyui_combobox_i3_6" class="combobox-item">6节课</div></div></div></body></html>