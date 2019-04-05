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
<body style="padding: 0;margin: 0" class="panel-noscroll">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<style type="text/css">

    .clear{clear: both; line-height: 0; margin: 0; padding: 0;}

    #clockTeacherTitle{height: 25px; line-height: 25px; text-align: center; float: left;}
    #clockTeacherTitleRight{height: 25px; line-height: 25px; float: right;}
    .spanInlineBlock01 { background: #d9f7db; padding: 0 10px;}
    .spanInlineBlock02 { background: #FAE1D6; padding: 0 10px;}
    .spanInlineBlock03 { background: #E8E8E8; padding: 0 10px;}
    #clockTeacherBox{}
    .clockTeacherBoxTh{ height: 40px; line-height: 40px;width: 1022px;border-left:1px solid #ddd;}
    .clockTeacherBoxTh .clockTeacherBoxThText{float: left;width:145px;padding:10px 0 10px 0; margin: 0; text-indent: 10px; border-top:1px solid #3F8DB8; border-right:1px solid #ddd; }
    .clockTeacherBoxInfo{border-left:1px solid #ddd;border-bottom:1px solid #ddd; width: 1022px;}
    .clockTeacherBoxInfo .clockTeacherBoxInfo_base{float: left;width:145px; height:60px; padding:10px 0; margin: 0; border-top:1px solid #ddd; border-right:1px solid #ddd; }
    .clockTeacherBoxInfo .clockTeacherBoxInfo_base p{text-indent: 10px;}
    .clockTeacherBoxInfo .preBgColor{background: #E8E8E8;}
    .clockTeacherBoxInfo .preText{margin: 0; padding: 0; color: #666;}
    .clockTeacherBoxInfo .currentBgColor{background: #D9F7DB;}
    .clockTeacherBoxInfo .currentText{margin: 0; padding: 0; color: #000;}
    .clockTeacherBoxInfo .currentText .currentTextDay{font-size: 18px;}
    .clockTeacherBoxInfo .offBgColor{background: #FAE1D6;}
    .clockTeacherBoxInfo .offBgColor2{background: #FAE1D6;}
    .clockTeacherBoxInfo .redColor{color: red;}
	.arriveText , .leaveText{
		margin:0px;
		padding:0px;
		display:block;
		padding-top:6px;
	}
</style>

<div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 1041px; height: 695px;">

    <div class="panel layout-panel layout-panel-north" style="width: 1041px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 1023px; height: 640px;" title="" class="panel-body panel-body-noheader layout-body">
        <div>
            <div>
                <!-- 考勤年月日
                <div><span>2017年</span><span>2月</span></div> -->
                <!-- 考勤学生汇总信息 -->
                <div style="padding-top:0px;">
				
					<table width="1020" cellspacing="0" cellpadding="0" border="0" bgcolor="#D8D8D8">
					<input id="id" value="<s:property value="teacherMonthCheck.id"/>" type="hidden">
					<input id="teacher_id" value="<s:property value="teacherMonthCheck.teacher.id"/>" type="hidden">
					  <tbody><tr bgcolor="#FFFFFF">

						
						<!--<td align="right" width="30" bgcolor="#f0f0f0">部门</td>-->
						<td width="300" align="left"><s:property value="teacherMonthCheck.teacher.teacherDuty.duty_name"/></td>
						
						<!--<td align="right" width="40" bgcolor="#f0f0f0">教职工</td>-->
						<td width="100" align="left"><s:property value="teacherMonthCheck.teacher.teacher_name"/> ， <s:property value="teacherMonthCheck.teacher.sex_name"/><!-- ， 18565689925--></td>
						
						<td bgcolor="#ffffff" align="right">
						
                <div id="clockTeacherTitleRight">
                    <span class="spanInlineBlock01">&nbsp;&nbsp;</span> 已打卡
                    <span class="spanInlineBlock02">&nbsp;&nbsp;</span> 已请假
                    <span class="spanInlineBlock03">&nbsp;&nbsp;</span> 休息日
                </div>
						
						</td>
					  </tr>
					</tbody></table>

                </div>
				
                <div style="margin-top:8px; margin-bottom:12px;">
				
					<table width="1023" cellspacing="1" cellpadding="6" border="0" bgcolor="#D8D8D8">
					  <tbody><tr bgcolor="#FFFFFF">

						
						<!--<td align="right" width="30" bgcolor="#f0f0f0">部门</td>-->
						<td width="208" align="left">
						
							<div id="clockTeacherTitle">
								<input id="year" style="width: 80px; display: none;" class="combobox-f combo-f textbox-f">
			
								<a href="javascript:;" class="easyui-linkbutton l-btn l-btn-small l-btn-plain" plain="true" onclick="preMonth();" style="text-decoration: none; font-weight:bold;" id="preMonth" group=""><span class="l-btn-left"><span class="l-btn-text"><<</span></span></a>
								<input id="month" style="width: 80px; display: none;" class="combobox-f combo-f textbox-f">
								<a href="javascript:;" class="easyui-linkbutton l-btn l-btn-small l-btn-plain" plain="true" onclick="nextMonth();" style="text-decoration: none; font-weight:bold;" id="nextMonth" group=""><span class="l-btn-left"><span class="l-btn-text">>></span></span></a>
							</div>
						
						</td>
						
						<td width="70" bgcolor="#f0f0f0" align="right">当月应出勤</td>
						<td width="40" align="left"><s:property value="monthMustCome"/> 天</td>	
											
						<td width="60" bgcolor="#f0f0f0" align="right">实际出勤</td>
						<td width="40" align="left"><s:property value="status0"/> 天</td>					

						<td width="30" bgcolor="#f0f0f0" align="right">正常</td>
						<td width="40" align="left"><s:property value="status0"/> 天</td>	
						
						<td width="30" bgcolor="#f0f0f0" align="right">迟到</td>
						<td width="40" align="left"><s:property value="status0"/> 天</td>	
						
						<td width="30" bgcolor="#f0f0f0" align="right">早退</td>
						<td width="40" align="left"><s:property value="status0"/> 天</td>	

					  </tr>

					</tbody></table>

                </div>




                <div id="clockTeacherBox">
                    <div class="clockTeacherBoxTh">
                        <div class="clockTeacherBoxThText">周一</div>
                        <div class="clockTeacherBoxThText">周二</div>
                        <div class="clockTeacherBoxThText">周三</div>
                        <div class="clockTeacherBoxThText">周四</div>
                        <div class="clockTeacherBoxThText">周五</div>
                        <div class="clockTeacherBoxThText">周六</div>
                        <div class="clockTeacherBoxThText">周日</div>
                    </div>
                    <div class="clockTeacherBoxInfo"><div class="clockTeacherBoxInfo_base preBgColor"><p class="preText">1月30</p><p></p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="preText">1月31</p><p></p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">1 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">2 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">3 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="currentText"><span class="currentTextDay">4 </span>休息日</p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="currentText"><span class="currentTextDay">5 </span>休息日</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">6 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">7 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">8 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base currentBgColor"><p class="currentText"><span class="currentTextDay">9 </span></p><p class="arriveText redColor">上班：18:37(迟到)</p><p class="leaveText ">下班：21:53</p></div><div class="clockTeacherBoxInfo_base currentBgColor"><p class="currentText"><span class="currentTextDay">10 </span></p><p class="arriveText ">上班：08:54</p><p class="leaveText redColor">下班：18:43(早退)</p></div><div class="clockTeacherBoxInfo_base currentBgColor"><p class="currentText"><span class="currentTextDay">11 </span></p><p class="arriveText redColor">上班：15:20(迟到)</p><p class="leaveText redColor">下班：17:39(早退)</p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="currentText"><span class="currentTextDay">12 </span>休息日</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">13 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">14 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">15 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">16 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">17 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="currentText"><span class="currentTextDay">18 </span>休息日</p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="currentText"><span class="currentTextDay">19 </span>休息日</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">20 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">21 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">22 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">23 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">24 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="currentText"><span class="currentTextDay">25 </span>休息日</p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="currentText"><span class="currentTextDay">26 </span>休息日</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">27 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base "><p class="currentText"><span class="currentTextDay">28 </span>缺卡</p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="preText">3月1</p><p></p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="preText">3月2</p><p></p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="preText">3月3</p><p></p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="preText">3月4</p><p></p></div><div class="clockTeacherBoxInfo_base preBgColor"><p class="preText">3月5</p><p></p></div><div class="clear"></div></div>
                </div>

                <div style="height:2px;">

                </div>
            </div>
        </div>
    </div></div>
    <div class="panel layout-panel layout-panel-center" style="width: 1041px; left: 0px; top: 657px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 1041px; height: 38px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
            <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">关闭</a>
        </div>
    </div></div>
<div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>

<script type="text/javascript">
var clockStudentDatas = eval('([{"dateTime":1485705600,"dateMonth":"1","dateDay":"30","showStstus":"pre"},{"dateTime":1485792000,"dateMonth":"1","dateDay":"31","showStstus":"pre"},{"day_label":"2017-2-1","week_label":"\u4e09","dateMonth":"2","dateDay":"1","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-2","week_label":"\u56db","dateMonth":"2","dateDay":"2","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-3","week_label":"\u4e94","dateMonth":"2","dateDay":"3","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-4","week_label":"\u516d","dateMonth":"2","dateDay":"4","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-2-5","week_label":"\u65e5","dateMonth":"2","dateDay":"5","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-2-6","week_label":"\u4e00","dateMonth":"2","dateDay":"6","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-7","week_label":"\u4e8c","dateMonth":"2","dateDay":"7","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-8","week_label":"\u4e09","dateMonth":"2","dateDay":"8","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-9","week_label":"\u56db","dateMonth":"2","dateDay":"9","status":43,"up_status":"4","down_status":"3","arrive_time":"18:37","arrive_status":"\u8fdf\u5230","leave_time":"21:53","leave_status":"-"},{"day_label":"2017-2-10","week_label":"\u4e94","dateMonth":"2","dateDay":"10","status":34,"up_status":"3","down_status":"4","arrive_time":"08:54","arrive_status":"-","leave_time":"18:43","leave_status":"\u65e9\u9000"},{"day_label":"2017-2-11","week_label":"\u516d","dateMonth":"2","dateDay":"11","status":44,"up_status":"4","down_status":"4","arrive_time":"15:20","arrive_status":"\u8fdf\u5230","leave_time":"17:39","leave_status":"\u65e9\u9000"},{"day_label":"2017-2-12","week_label":"\u65e5","dateMonth":"2","dateDay":"12","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-2-13","week_label":"\u4e00","dateMonth":"2","dateDay":"13","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-14","week_label":"\u4e8c","dateMonth":"2","dateDay":"14","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-15","week_label":"\u4e09","dateMonth":"2","dateDay":"15","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-16","week_label":"\u56db","dateMonth":"2","dateDay":"16","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-17","week_label":"\u4e94","dateMonth":"2","dateDay":"17","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-18","week_label":"\u516d","dateMonth":"2","dateDay":"18","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-2-19","week_label":"\u65e5","dateMonth":"2","dateDay":"19","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-2-20","week_label":"\u4e00","dateMonth":"2","dateDay":"20","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-21","week_label":"\u4e8c","dateMonth":"2","dateDay":"21","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-22","week_label":"\u4e09","dateMonth":"2","dateDay":"22","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-23","week_label":"\u56db","dateMonth":"2","dateDay":"23","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-24","week_label":"\u4e94","dateMonth":"2","dateDay":"24","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-25","week_label":"\u516d","dateMonth":"2","dateDay":"25","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-2-26","week_label":"\u65e5","dateMonth":"2","dateDay":"26","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-2-27","week_label":"\u4e00","dateMonth":"2","dateDay":"27","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-2-28","week_label":"\u4e8c","dateMonth":"2","dateDay":"28","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"dateTime":1488297600,"dateMonth":"3","dateDay":"1","showStstus":"next"},{"dateTime":1488384000,"dateMonth":"3","dateDay":"2","showStstus":"next"},{"dateTime":1488470400,"dateMonth":"3","dateDay":"3","showStstus":"next"},{"dateTime":1488556800,"dateMonth":"3","dateDay":"4","showStstus":"next"},{"dateTime":1488643200,"dateMonth":"3","dateDay":"5","showStstus":"next"}])');
var nowYear = '2017';

/* 日期信息 */
function setClockTeacherBoxInfo(clockStudentDatas){

    var html = '';
    if(clockStudentDatas.length > 0){
        for(var i=0; i<clockStudentDatas.length; i++){
            if(clockStudentDatas[i]['showStstus']){
                html += '<div class="clockTeacherBoxInfo_base preBgColor">';
                html += '<p class="preText">'+clockStudentDatas[i]['dateMonth']+'月'+clockStudentDatas[i]['dateDay']+'<p>';
                html += '</div>';
            }else{
                var redClass01 = '';
                var redClass02 = '';
                var bgColorClass = '';
                var clockStatus = clockStudentDatas[i]['status'];
                var tempHtml = '';
                tempHtml += '<p class="currentText"><span class="currentTextDay">'+clockStudentDatas[i]['dateDay']+' </span>'
                if(clockStatus == 0){
                    tempHtml += '休息日';
                    bgColorClass = 'preBgColor';
                }else if(clockStatus == 11){
                    tempHtml += '缺卡';
                    bgColorClass = '';
                }else if(clockStatus == 22){
                    tempHtml += '请假';
                    bgColorClass = 'offBgColor';
                }else if(clockStatus > 0){
                    tempHtml += clockStatus.toString()[0] == 2? '上午请假': '';
                    tempHtml += clockStatus.toString()[1] == 2? '下午请假': '';
                    if(clockStatus.toString()[0] == 2 || clockStatus.toString()[1] == 2){
                        bgColorClass = 'offBgColor2';
                    }else{
                        bgColorClass = 'currentBgColor';
                    }
                }

                tempHtml += '';

                if(bgColorClass!='' && bgColorClass!='preBgColor' && bgColorClass != 'offBgColor'){

                    if(clockStudentDatas[i]['arrive_status'].indexOf('迟到') != -1 && clockStatus.toString()[0] != 2){
                        redClass01 = 'redColor';
                    }
                    if(clockStudentDatas[i]['leave_status'].indexOf('早退') != -1 && clockStatus.toString()[1] != 2){
                        redClass02 = 'redColor';
                    }
                    tempHtml += '<p class="arriveText '+redClass01+'">上班：'+clockStudentDatas[i]['arrive_time']+
                        (clockStudentDatas[i]['arrive_status'].indexOf('迟到') == -1 ? '': '('+clockStudentDatas[i]['arrive_status']+')')+'</p>';
                    tempHtml += '<p class="leaveText '+redClass02+'">下班：'+clockStudentDatas[i]['leave_time']+
                        (clockStudentDatas[i]['leave_status'].indexOf('早退') == -1 ? '': '('+clockStudentDatas[i]['leave_status']+')')+'</p>';
                }
                html += '<div class="clockTeacherBoxInfo_base '+bgColorClass+'">'+tempHtml+'</div>';
            }
        }
        html += '<div class="clear"></div>';
    }
    $(".clockTeacherBoxInfo").html(html);

}

setClockTeacherBoxInfo(clockStudentDatas);

function ajaxGetJsonData(){
    var year = $("#year").combobox('getValue');
    var month = $("#month").combobox('getValue');
    var id = $("#id").val();
    var teacher_id = $("#teacher_id").val();
    //var url = '${pageContext.request.contextPath}/json/teacher-month-check2.json';
   	var url = '${pageContext.request.contextPath}/teacherMonthCheckAction_aboutTeacherMonthCheck.action';
    $.ajax({
        url: url,
        data: {syear:year, smonth:month, id:id, teacher_id:teacher_id},
        type: 'GET',
        dataType: 'JSON',
        success: function(result){
            if(result.status){
                setClockTeacherBoxInfo(result.info);
            }else{
                $(".clockTeacherBoxInfo").html(result.info);
            }
        }
    });
}

function preMonth(){
    var year = Number($("#year").combobox('getValue'));
    var month = Number($("#month").combobox('getValue'));
    year = month - 1? year: year - 1;
    month = month - 1? month-1: 12;

    if(year < nowYear-1){
        return false;
    }
    $("#month").combobox('select',Number(month));
    $("#year").combobox('select',Number(year));
}

function nextMonth(){
    var year = Number($("#year").combobox('getValue'));
    var month = Number($("#month").combobox('getValue'));
    year = month == 12? year+1: year;
    month = month == 12? 1: month+1;

    if(year > nowYear){
        return false;
    }
    $("#month").combobox('select',Number(month));
    $("#year").combobox('select',Number(year));
}

$(function(){

    var yearData = [
        {id:(nowYear-1), name:(nowYear-1)+"年"},
        {id:nowYear, name:nowYear+"年"}
    ];
    $("#year").combobox({
        data: yearData,
        valueField: 'id',
        textField: 'name',
        editable: false,
        panelHeight: 'auto',
        value: '2017',
        onLoadSuccess: function(record){
        },
        onSelect: function(record){
            ajaxGetJsonData();
        }
    })

    var monthData = [
        {id:1, name:"1月"},
        {id:2, name:"2月"},
        {id:3, name:"3月"},
        {id:4, name:"4月"},
        {id:5, name:"5月"},
        {id:6, name:"6月"},
        {id:7, name:"7月"},
        {id:8, name:"8月"},
        {id:9, name:"9月"},
        {id:10, name:"10月"},
        {id:11, name:"11月"},
        {id:12, name:"12月"}
    ];
    $("#month").combobox({
        data: monthData,
        valueField: 'id',
        textField: 'name',
        editable: false,
        panelHeight: 'auto',
        value: '2',
        onLoadSuccess: function(record){
        },
        onSelect: function(record){
            ajaxGetJsonData();
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">2016年</div><div id="_easyui_combobox_i1_1" class="combobox-item combobox-item-selected">2017年</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item">1月</div><div id="_easyui_combobox_i2_1" class="combobox-item combobox-item-selected">2月</div><div id="_easyui_combobox_i2_2" class="combobox-item">3月</div><div id="_easyui_combobox_i2_3" class="combobox-item">4月</div><div id="_easyui_combobox_i2_4" class="combobox-item">5月</div><div id="_easyui_combobox_i2_5" class="combobox-item">6月</div><div id="_easyui_combobox_i2_6" class="combobox-item">7月</div><div id="_easyui_combobox_i2_7" class="combobox-item">8月</div><div id="_easyui_combobox_i2_8" class="combobox-item">9月</div><div id="_easyui_combobox_i2_9" class="combobox-item">10月</div><div id="_easyui_combobox_i2_10" class="combobox-item">11月</div><div id="_easyui_combobox_i2_11" class="combobox-item">12月</div></div></div></body></html>