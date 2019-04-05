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

    .clear{clear: both; line-height: 0; margin: 0; padding: 0;}

    #clockTeacherTitle{height: 25px; line-height: 25px; text-align: center; float: left;}
    #clockTeacherTitleRight{height: 25px; line-height: 25px; float: right;}
    .spanInlineBlock01 { background: #d9f7db; padding: 0 10px;}
    .spanInlineBlock02 { background: #FAE1D6; padding: 0 10px;}
    .spanInlineBlock03 { background: #E8E8E8; padding: 0 10px;}

    #clockTeacherBox{}
    .clockTeacherBoxTh{ height: 40px; line-height: 40px;width: 1022px;border-left:1px solid #ddd;}
    .clockTeacherBoxTh .clockTeacherBoxThText{float: left;width:145px;padding:10px 0; margin: 0;text-indent: 10px; border-top:1px solid #3F8DB8; border-right:1px solid #ddd; }
    .clockTeacherBoxInfo{border-left:1px solid #ddd;border-bottom:1px solid #ddd; width: 1022px;}
    .clockTeacherBoxInfo .clockTeacherBoxInfo_base{float: left;width:145px; height:60px; padding:10px 0; margin: 0; border-top:1px solid #ddd; border-right:1px solid #ddd; }
    .clockTeacherBoxInfo .clockTeacherBoxInfo_base p{text-indent: 10px;}
    .clockTeacherBoxInfo .preBgColor{background: #E8E8E8;}
    .clockTeacherBoxInfo .preText{margin: 0; padding: 0; color: #666;}
    .clockTeacherBoxInfo .currentBgColor{background: #D9F7DB;}
    .clockTeacherBoxInfo .currentText{margin: 0; padding: 0; color: #000;}
    .clockTeacherBoxInfo .currentText .currentTextDay{font-size: 18px; font-family:"微软雅黑";}
    .clockTeacherBoxInfo .offBgColor{background: #FAE1D6;}
    .clockTeacherBoxInfo .offBgColor2{background: #FAE1D6;}
	.arriveText , .leaveText{
		margin:0px;
		padding:0px;
		display:block;
		padding-top:6px;
	}
</style>  
  <div class="easyui-layout" fit="true" border="true"> 
   <div region="north" border="true" style="overflow:auto; padding:8px;height:658px; "> 
    <div> 
     <div> 
      <!-- 考勤年月日
                <div><span>2017年</span><span>4月</span></div> --> 
      <!-- 考勤学生汇总信息 --> 
      <div style="padding-top:0px;"> 
       <table width="1023" border="0" cellspacing="0" cellpadding="0" bgcolor="#D8D8D8"> 
       <input id="id" value="<s:property value="studentMonthCheck.id"/>" type="hidden">
        <tbody>
         <tr bgcolor="#FFFFFF"> 
          <td align="left" width="660"><s:property value="studentMonthCheck.student.name"/> ， <s:property value="studentMonthCheck.student.sex"/> ， <s:property value="studentMonthCheck.student.classes.class_name"/>:<s:property value="studentMonthCheck.student.grade.name"/></td> 
          <!--<td align="left" width="230">Dear宝贝示范幼儿园</td>--> 
          <td align="right" bgcolor="#ffffff"> 
           <div id="clockTeacherTitleRight"> 
            <span class="spanInlineBlock01">&nbsp;&nbsp;</span> 已打卡 
            <span class="spanInlineBlock02">&nbsp;&nbsp;</span> 已请假 
            <span class="spanInlineBlock03">&nbsp;&nbsp;</span> 休息日 
           </div> </td> 
         </tr> 
        </tbody>
       </table> 
      </div> 
      <div style="margin-top:8px; margin-bottom:12px;"> 
       <table width="1023" border="0" cellspacing="1" cellpadding="6" bgcolor="#D8D8D8"> 
        <tbody>
         <tr bgcolor="#FFFFFF"> 
          <td align="left" bgcolor="#FFFFFF"> 
           <div id="clockTeacherTitle"> 
            <input id="year" style="width:80px;" /> 
            <a href="javascript:;" class="easyui-linkbutton" plain="true" onclick="preMonth();" style="text-decoration: none; font-weight:bold;" id="preMonth">&lt;&lt;</a> 
            <input id="month" style="width:80px;" /> 
            <a href="javascript:;" class="easyui-linkbutton" plain="true" onclick="nextMonth();" style="text-decoration: none;font-weight:bold;" id="nextMonth">&gt;&gt;</a> 
           </div> </td> 
          <td align="right" width="60" bgcolor="#f0f0f0">当月应出勤</td> 
          <td align="left" width="40"><s:property value="monthMustCome"/>天</td> 
          <td align="right" width="60" bgcolor="#f0f0f0">实际出勤</td> 
          <td align="left" width="40"><s:property value="status0"/></td> 
         </tr> 
        </tbody>
       </table> 
      </div> 
      <div id="clockTeacherBox"> 
       <div class="clockTeacherBoxTh"> 
        <div class="clockTeacherBoxThText">
         周一
        </div> 
        <div class="clockTeacherBoxThText">
         周二
        </div> 
        <div class="clockTeacherBoxThText">
         周三
        </div> 
        <div class="clockTeacherBoxThText">
         周四
        </div> 
        <div class="clockTeacherBoxThText">
         周五
        </div> 
        <div class="clockTeacherBoxThText">
         周六
        </div> 
        <div class="clockTeacherBoxThText">
         周日
        </div> 
       </div> 
       <div class="clockTeacherBoxInfo"> 
       </div> 
      </div> 
      <div style="height:2px;"> 
      </div> 
     </div> 
    </div> 
   </div> 
   <div region="center" border="false" style="overflow:hidden;background-color:#E0ECFF; "> 
    <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;"> 
     <a href="#" class="easyui-linkbutton panel-tool-close" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');">关闭</a> 
    </div> 
   </div> 
  </div> 
  <script type="text/javascript">
    var clockStudentDatas = eval('([{"dateTime":1488124800,"dateMonth":"2","dateDay":"27","showStstus":"pre"},{"dateTime":1488211200,"dateMonth":"2","dateDay":"28","showStstus":"pre"},{"day_label":"2017-3-1","week_label":"\u4e09","dateMonth":"3","dateDay":"1","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-2","week_label":"\u56db","dateMonth":"3","dateDay":"2","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-3","week_label":"\u4e94","dateMonth":"3","dateDay":"3","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-4","week_label":"\u516d","dateMonth":"3","dateDay":"4","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-5","week_label":"\u65e5","dateMonth":"3","dateDay":"5","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-6","week_label":"\u4e00","dateMonth":"3","dateDay":"6","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-7","week_label":"\u4e8c","dateMonth":"3","dateDay":"7","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-8","week_label":"\u4e09","dateMonth":"3","dateDay":"8","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-9","week_label":"\u56db","dateMonth":"3","dateDay":"9","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-10","week_label":"\u4e94","dateMonth":"3","dateDay":"10","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-11","week_label":"\u516d","dateMonth":"3","dateDay":"11","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-12","week_label":"\u65e5","dateMonth":"3","dateDay":"12","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-13","week_label":"\u4e00","dateMonth":"3","dateDay":"13","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-14","week_label":"\u4e8c","dateMonth":"3","dateDay":"14","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-15","week_label":"\u4e09","dateMonth":"3","dateDay":"15","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-16","week_label":"\u56db","dateMonth":"3","dateDay":"16","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-17","week_label":"\u4e94","dateMonth":"3","dateDay":"17","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-18","week_label":"\u516d","dateMonth":"3","dateDay":"18","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-19","week_label":"\u65e5","dateMonth":"3","dateDay":"19","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-20","week_label":"\u4e00","dateMonth":"3","dateDay":"20","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-21","week_label":"\u4e8c","dateMonth":"3","dateDay":"21","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-22","week_label":"\u4e09","dateMonth":"3","dateDay":"22","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-23","week_label":"\u56db","dateMonth":"3","dateDay":"23","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-24","week_label":"\u4e94","dateMonth":"3","dateDay":"24","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-25","week_label":"\u516d","dateMonth":"3","dateDay":"25","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-26","week_label":"\u65e5","dateMonth":"3","dateDay":"26","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-27","week_label":"\u4e00","dateMonth":"3","dateDay":"27","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-28","week_label":"\u4e8c","dateMonth":"3","dateDay":"28","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-29","week_label":"\u4e09","dateMonth":"3","dateDay":"29","status":0,"up_status":"0","down_status":false,"arrive_time":"-","arrive_status":"\u4f11\u606f","leave_time":"-","leave_status":"\u4f11\u606f"},{"day_label":"2017-3-30","week_label":"\u56db","dateMonth":"3","dateDay":"30","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"day_label":"2017-3-31","week_label":"\u4e94","dateMonth":"3","dateDay":"31","status":11,"up_status":"1","down_status":"1","arrive_time":"-","arrive_status":"\u4e0a\u73ed\u7f3a\u5361","leave_time":"-","leave_status":"\u4e0b\u73ed\u7f3a\u5361"},{"dateTime":1490976000,"dateMonth":"4","dateDay":"1","showStstus":"next"},{"dateTime":1491062400,"dateMonth":"4","dateDay":"2","showStstus":"next"}])');
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
                    var bgColorClass = '';
                    var clockStatus = clockStudentDatas[i]['status'];console.log(clockStatus);
                    var tempHtml = '';
                    tempHtml += '<p class="currentText"><span class="currentTextDay">'+clockStudentDatas[i]['dateDay']+' </span>'
                    if(clockStatus == 0){
                        tempHtml += '休息日';
                        bgColorClass = 'preBgColor';
                    }else if(clockStatus == 1){
                        tempHtml += '请假';
                        bgColorClass = 'offBgColor';
                    }else if(clockStatus == 2){
                        tempHtml += '缺卡';
                        bgColorClass = 'missBgColor';
                    }
                    else if(clockStatus>0){
                        tempHtml += clockStatus.toString()[0] == 2? '上午未到校': '';
                        tempHtml += clockStatus.toString()[1] == 2? '下午未到校': '';
                        if(clockStatus.toString()[0] == 2 || clockStatus.toString()[1] == 2){
                            bgColorClass = 'offBgColor2';
                        }else{
                            bgColorClass = 'currentBgColor';
                        }
                    }
                    //tempHtml += clockStudentDatas[i]['status'];
                    tempHtml += '';

                    if(bgColorClass!='missBgColor' && bgColorClass!='preBgColor' && bgColorClass != 'offBgColor'){
                        tempHtml += '<p class="arriveText">到校：'+clockStudentDatas[i]['arrive_time']+'</p>';
                        tempHtml += '<p class="leaveText">离校：'+clockStudentDatas[i]['leave_time']+'</p>';
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
        //var url = '${pageContext.request.contextPath}/json/student-month-check.json';
        var url = '${pageContext.request.contextPath}/studentMonthCheckAction_aboutStudentMonthCheck.action';
        $.ajax({
            url: url,
            data: {syear:year, smonth:month, id:id, action:'json'}, 
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
            value: '4',
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
                tempData =  {wrapper: helpTutorials[i].wrapper ,popup: {content: '#' + helpTutorials
[i].contentWrapper,type: 'tooltip',position: helpTutorials[i].postion}};
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
 </body>
</html>