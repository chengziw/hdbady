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


<form id="fm" style="height:570px; " method="post" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 648px; height: 570px;">


        <div class="panel layout-panel layout-panel-north" style="width: 648px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: hidden; padding: 8px; width: 630px; height: 484px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="600" cellspacing="0" cellpadding="0" border="0">
                <tbody><tr>
                    <td width="240" valign="top"><table style="border:1px solid #E3E3E3;" width="180" cellspacing="0" cellpadding="5" border="0">
                            <tbody><tr style="font-weight:bold; font-family:'微软雅黑'; color:#333333; font-size:14px;" height="36" bgcolor="#f0f0f0">
                                <td>月份</td>
                                <td>当月学生应出勤天数</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            
                       
                       
                       		<s:iterator value="months" var="m" status="vs"> 
                            	<tr>
                            		 <td><s:property value="#vs.index+1"/>月</td>
                               		 <td><input name="months" value="<s:property value="#m"/>"  class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" style="display: none;" textboxname="months" type="text"></td>
                                </tr>
                            </s:iterator>
                       
                            
                            
                           <!--  <tr>
                                <td>1月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="22" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            
                            <tr>
                                <td>2月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="16" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>3月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="22" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>4月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="22" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>5月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="22" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>6月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="22" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>7月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="0" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>8月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="0" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>9月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="21" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>10月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="18" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>11月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="22" style="display: none;" textboxname="months" type="text"></td>
                            </tr>
                            <tr>
                                <td>12月</td>
                                <td><input name="months" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="required:true,validType:'months',width:108" value="22" style="display: none;" textboxname="months" type="text"></td>
                            </tr> -->
                            
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody></table></td>
                    <td width="290" valign="top">

                        <table width="275" cellspacing="0" cellpadding="6" border="0">
                            <tbody><tr>
                                <td colspan="2" style="font-weight:bold; font-family:'微软雅黑'; color:#333333; font-size:14px;" height="30">●教职工考勤设置</td>
								
                            </tr>
                            <tr>
                                 <td width="60"><label>上班时间：</label></td>
								<td align="left"><input id="teacher_arrive_time" value="<s:property value="clockConfig.teacher_arrive_time"/>" name="teacher_arrive_time" class="easyui-textbox textbox-f timespinner-f spinner-f" style="width: 80px; display: none;" textboxname="teacher_arrive_time" spinnername="teacher_arrive_time" type="text"><%-- <span class="textbox spinner" style="width: 78px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; p-adding-top: 2px; p-adding-bottom: 2px; width: 52px;" type="text"><input class="textbox-value" name="teacher_arrive_time" value="09:08" type="hidden"></span> --%></td>
                            </tr>
                            <tr>
                                <td><label>下班时间：</label></td>
                            	<td align="left"><input id="teacher_leave_time" data-options="validType:'teacher_leave_time'" value="<s:property value="clockConfig.teacher_leave_time"/>" name="teacher_leave_time" class="easyui-textbox textbox-f timespinner-f spinner-f" style="width: 80px; display: none;" textboxname="teacher_leave_time" spinnername="teacher_leave_time" type="text"><%-- <span class="textbox spinner" style="width: 78px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; p-adding-top: 2px; p-adding-bottom: 2px; width: 52px;" type="text"><input class="textbox-value" name="teacher_leave_time" value="19:18" type="hidden"></span> --%></td>
								</tr>
                            <tr>
                                <td><label>考勤方式：</label></td>
								<td align="left">
									
									<s:if test="clockConfig.teacher_clock_type==1">
                                    	<label><input name="teacher_clock_type" value="1" checked="checked" type="radio">仅支持手机APP打卡</label>	<br>
                                    </s:if><s:else>
                                    	<label><input name="teacher_clock_type" value="1" type="radio">仅支持手机APP打卡</label>	<br>
                                    </s:else>
                                    
                                    <s:if test="clockConfig.teacher_clock_type==2">
                                    	<label><input name="teacher_clock_type" value="2" checked="checked" type="radio">仅支持考勤机打卡</label><br>
                                    </s:if><s:else>
										<label><input name="teacher_clock_type" value="2" type="radio">仅支持考勤机打卡</label><br>
                                    </s:else>
                                    
                                    <s:if test="clockConfig.teacher_clock_type==3">
                                    	<label><input name="teacher_clock_type" value="3" checked="checked" type="radio">支持手机APP和考勤机打卡</label>
                                    </s:if><s:else>
                                    	<label><input name="teacher_clock_type" value="3" type="radio">支持手机APP和考勤机打卡</label>
                                    </s:else>
								
								</td>
                            </tr>


                            <tr>
                                <td colspan="2" style="font-weight:bold; font-family:'微软雅黑'; color:#333333; font-size:14px;" height="30">●学生考勤设置</td>
                            </tr>
                            <tr>
                                <td><label>上学时间：</label></td>
								<td><input id="student_arrive_time" value="<s:property value="clockConfig.student_arrive_time"/>" name="student_arrive_time" class="easyui-textbox textbox-f timespinner-f spinner-f" style="width: 80px; display: none;" textboxname="student_arrive_time" spinnername="student_arrive_time" type="text"><%-- <span class="textbox spinner" style="width: 78px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 52px;" type="text"><input class="textbox-value" name="student_arrive_time" value="09:30" type="hidden"></span> --%></td>
                            </tr>
                            <tr>
                                <td><label>放学时间：</label></td>
								<td><input id="student_leave_time" value="<s:property value="clockConfig.student_leave_time"/>" name="student_leave_time" class="easyui-textbox textbox-f timespinner-f spinner-f" style="width: 80px; display: none;" textboxname="student_leave_time" spinnername="student_leave_time" type="text"><%-- <span class="textbox spinner" style="width: 78px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon spinner-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"><a href="javascript:void(0)" class="spinner-arrow-up" tabindex="-1"></a><a href="javascript:void(0)" class="spinner-arrow-down" tabindex="-1"></a></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 52px;" type="text"><input class="textbox-value" name="student_leave_time" value="17:30" type="hidden"></span> --%></td>
                            </tr>
                            <tr>
                                <td><label>考勤方式：</label></td>
								<td>
									<s:if test="clockConfig.student_clock_type==1">
                                    	<label><input name="student_clock_type" value="1" checked="checked" type="radio">仅支持手机APP打卡</label><br>
                                    </s:if><s:else>
                                    	<label><input name="student_clock_type" value="1" type="radio">仅支持手机APP打卡</label><br>
                                    </s:else>
                                    <s:if test="clockConfig.student_clock_type==2">
                                   		 <label><input name="student_clock_type" value="2" checked="checked" type="radio">仅支持考勤机打卡</label><br>
									</s:if><s:else>
									  	 <label><input name="student_clock_type" value="2" type="radio">仅支持考勤机打卡</label><br>
									</s:else>
									<s:if test="clockConfig.student_clock_type==3">
                                    	<label><input name="student_clock_type" value="3" checked="checked" type="radio">支持手机APP和考勤机打卡</label>
                                    </s:if><s:else>
                                      	<label><input name="student_clock_type" value="3" type="radio">支持手机APP和考勤机打卡</label>
                                  	</s:else>
                                    </td>
                            </tr>


                            <tr>
                                <td><label>短信通知：</label></td>
                                <td>
                                	<s:if test="clockConfig.is_send_sms==1">
                                		<label><input name="is_send_sms" value="1" checked="checked" type="radio">是，到校和离校时给家长发短信</label><br>
                                 	    <label><input name="is_send_sms" value="0" type="radio">否，不通知家长 &nbsp;</label>
                                   	</s:if><s:else>
                                   		<label><input name="is_send_sms" value="1" type="radio">是，到校和离校时给家长发短信</label><br>
                                   	    <label><input name="is_send_sms" value="0" checked="checked" type="radio">否，不通知家长 &nbsp;</label>
                                	</s:else>
                                </td>
                            </tr>

                            <tr>
                                <td><label>微信通知：</label></td>
                                <td>
                                	<s:if test="clockConfig.is_send_wx==1">
                              	  	    <label><input name="is_send_wx" value="1" checked="checked" type="radio">是，学生考勤刷卡时通知家长</label><br>
                                        <label><input name="is_send_wx" value="0" type="radio">否，不通知家长 &nbsp;</label>
                                   	</s:if><s:else>
                                   	    <label><input name="is_send_wx" value="1" type="radio">是，学生考勤刷卡时通知家长</label><br>
                                        <label><input name="is_send_wx" value="0" checked="checked" type="radio">否，不通知家长 &nbsp;</label>
                              		</s:else>
                                </td>
                            </tr>
							
                            <tr>
                                <td><div id="show-error-message-box" style="color: red"></div></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>

                        </tbody></table>


                    </td>
                    <td width="260" valign="top">

                        <table width="100%" cellspacing="0" cellpadding="6" border="0">
                            <tbody>
                            
                            <tr>
                                <td style="font-weight:bold; font-family:'微软雅黑'; color:#333333; font-size:14px;" height="30">●指定休息日</td>
                            </tr>
                            
                            <%-- <s:iterator value="clock_days" var="c"  status="vs">
                            	<tr>
                            		   <td><input name="clock_days" name="clock_days" value="<s:property value="#c"/>" checked="checked" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"><label>&nbsp;星期<s:property value="#vs.index+1"/></label></td>
                            	</tr>
                            </s:iterator> --%> 
                            
                       <tr>
       							<td><input id="clock_day" name="clock_day1" onclick="cli(this)" value="<s:property value="clockConfig.clock_day1"/>" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"><label>&nbsp;星期一</label></td>
                       </tr>
                       <tr> 
                        		<td><input id="clock_day" name="clock_day2" onclick="cli(this)" value="<s:property value="clockConfig.clock_day2"/>" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"><label>&nbsp;星期二</label></td>
                       </tr> 
                       <tr> 
                        		<td><input id="clock_day" name="clock_day3" onclick="cli(this)" value="<s:property value="clockConfig.clock_day3"/>" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"><label>&nbsp;星期三</label></td>
                       </tr>
                       <tr> 
                        		<td><input id="clock_day" name="clock_day4" onclick="cli(this)" value="<s:property value="clockConfig.clock_day4"/>" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"><label>&nbsp;星期四</label></td>
                       </tr>
                       <tr> 
                        		<td><input id="clock_day" name="clock_day5" onclick="cli(this)" value="<s:property value="clockConfig.clock_day5"/>" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"><label>&nbsp;星期五</label></td>
                       </tr>
                       <tr> 
                        		<td><input id="clock_day" name="clock_day6" onclick="cli(this)" value="<s:property value="clockConfig.clock_day6"/>" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"><label>&nbsp;星期六</label></td>
                       </tr>
                       <tr> 
                        		<td><input id="clock_day" name="clock_day7" onclick="cli(this)" value="<s:property value="clockConfig.clock_day7"/>" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"><label>&nbsp;星期日</label></td>
                       </tr> 
                        </tbody></table>

                    </td>
                </tr>
            </tbody></table>

		<input name="id" value="<s:property value="clockConfig.id"/>" type="hidden"/></td> 
		<input id="clock_days" value="<s:property value="clockConfig.clock_day"/>" type="hidden"/></td> 
		
        </div></div>
        <div class="panel layout-panel layout-panel-center" style="width: 648px; left: 0px; top: 501px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 648px; height: 69px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveClockConfig()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
            </div>
        </div></div>
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>

<script type="text/javascript">
    var url =  "/clock-config/save.html?id=1&amp;sinKey=ab77%25A7b5%25DC8B6%25B6%25226%25C3%25F1%25C2q4%25F8%251De%2590%2522%2517%25D3%259C%2599%2513%25C9%25B6G%251E9%25AA%25DF%252F%2505q%251BS%25C9%2517%250E"; // 保存地址

    $.extend($.fn.validatebox.defaults.rules, {
        months: {
            validator: function(value, param){
                var reg = new RegExp(/^([0-9]|[1-2]\d{0,1}|3[0-1])$/ );
                return reg.test(value);
            },
            message: '月考勤天数只能在0至31之间'
        }
    });
    
	
    
     $(function(){
    	         
          //当页面加载完成的时候，自动调用该方法
          window.onload=function(){
        	 
        	  var clock_day1 = $("input[name='clock_day1']");
        	  var clock_day2 = $("input[name='clock_day2']");
        	  var clock_day3 = $("input[name='clock_day3']");
        	  var clock_day4 = $("input[name='clock_day4']");
        	  var clock_day5 = $("input[name='clock_day5']");
        	  var clock_day6 = $("input[name='clock_day6']");
        	  var clock_day7 = $("input[name='clock_day7']");
        	  
        	  if(clock_day1.val()==1){
        		  clock_day1.attr("checked",true);
        	  }
        	  if(clock_day2.val()==1){
        		  clock_day2.attr("checked",true);
        	  }
        	  if(clock_day3.val()==1){
        		  clock_day3.attr("checked",true);
        	  }
        	  if(clock_day4.val()==1){
        		  clock_day4.attr("checked",true);
        	  }
        	  if(clock_day5.val()==1){
        		  clock_day5.attr("checked",true);
        	  }
        	  if(clock_day6.val()==1){
        		  clock_day6.attr("checked",true);
        	  }
        	  if(clock_day7.val()==1){
        		  clock_day7.attr("checked",true);
        	  }
        	
          };
    	});
    
     
    /*  $('#clock_day').change(function(){
    	 alert("111");
 		 if($('#clock_day').prop('checked')){
 			 //当前为选中状态
 			  $('#clock_day').val()
 			 alert("选中");
 			 }else{
 				 //当前为不选中状态 
 			 alert("不选中");
 			}
 	}); */
     
     function cli(dui){
 		if($(dui).val()==1){
 			$(dui).attr("value","0");
 		}else{
 			$(dui).attr("value","1");
 		}
     }
     
    
    
    /* 保存配置 */
    function saveClockConfig(){
        $('#show-error-message-box').html('');

        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        var url = '${pageContext.request.contextPath}/clockConfigAction_editClockConfig.action';
        $('#save-btn').addClass('mylinkbtn-load');

        $('#fm').form('submit',{
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
        /* 老师上班时间 */
        $('#teacher_arrive_time').timespinner({
            editable: false,
            required:true
        });

        /* 老师下班时间 */
        $('#teacher_leave_time').timespinner({
            editable: false,
            required:true
        });

        /* 学生上学时间 */
        $('#student_arrive_time').timespinner({
            editable: false,
            required:true
        });

        /* 学生放学时间 */
        $('#student_leave_time').timespinner({
            editable: false,
            required:true
        });

        /* 月份 */
        $('.months').datebox({
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
</body></html>