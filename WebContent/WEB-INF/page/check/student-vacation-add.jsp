<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>汤圆幼儿园</title>
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


    <form id="fm" style="height:380px; " method="post" class="panel-noscroll">
        <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 648px; height: 380px;">
            
            <div class="panel layout-panel layout-panel-north" style="width: 648px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 630px; height: 290px;" title="" class="panel-body panel-body-noheader layout-body">
                <table cellspacing="0" cellpadding="8" border="0">
                    <tbody><tr>
                        <td><!-- <label>所在学校：</label> --><div style="display:none" ><input id="school_id" value="" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="school_id" comboname="school_id" type="hidden"></div><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="school_id" value="1" type="hidden"></span> --%></td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                            	<input id="student_id" name="student.id" type="hidden">
                                <label>学生姓名：</label>
                                <input id="student_name" required="true" class="easyui-textbox textbox-f" value="" data-options="validType:['name','MaxLength[32]']" style="display: none;" textboxname="student_name" type="text"><%-- <span class="textbox" style="width: 145px; height: 20px;"><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 137px;" type="text"><input class="textbox-value" name="student_name" value="" type="hidden"></span> --%>
								<span>
                                    <span id="sex"></span>&nbsp;&nbsp;
                                    <span id="birthday_name"></span>&nbsp;&nbsp;
                                    <span id="class_name"></span>
                                </span>
                            </div>
            
                            
  <div id="student_table_box" style="position: relative; width: 568px; height: 0px; z-index: 1;"> 
   <div class="panel datagrid" style="width: 600px;">
    <div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 598px; height: 166px;">
     <div class="datagrid-view" style="width: 598px; height: 166px;">
  
     
      <table id="studentTable" class="easyui-datagrid datagrid-f" style="position: absolute; top: 0px; left: 0px; display: none;" 
      									   data-options="url:'${pageContext.request.contextPath}/studentVacationAction_findAllStudent.action',
                                           onLoadSuccess:studentDataLoadSuccess,onClickRow:studentClickRow,
                                           rownumbers:true,singleSelect:true"> 
       <thead> 
        <tr> 
         <th data-options="field:'student_name',width:80">学生姓名</th> 
         <th data-options="field:'sex_name',width:50">性别</th> 
         <th data-options="field:'birthday_name',width:100">出生日期</th> 
         <th data-options="field:'grade_name',width:80">年级</th> 
         <th data-options="field:'class_name',width:80">班级</th> 
         <th data-options="field:'parent_name',width:80">家长姓名</th> 
         <th data-options="field:'phone',width:120">家长手机</th> 
        </tr> 
       </thead>
      </table>
      <style type="text/css" easyui="true">
.datagrid-cell-c1-student_name{width:71px}
.datagrid-cell-c1-sex_name{width:41px}
.datagrid-cell-c1-birthday_name{width:91px}
.datagrid-cell-c1-grade_name{width:71px}
.datagrid-cell-c1-class_name{width:71px}
.datagrid-cell-c1-parent_name{width:71px}
.datagrid-cell-c1-phone{width:111px}
</style>
     </div>
    </div>
   </div> 
  </div> 
                            
                            
                        </td>
                    </tr>

                    <tr>
                        <td><label>请假类型：</label> <input id="type" name="typee" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" data-options="novalidate: true,validType:'vacationType',panelHeight:'auto'" value="" style="display: none;" textboxname="type" comboname="type" type="text"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="type" value="" type="hidden"></span> --%>
						
						&nbsp;&nbsp;<br><label>请假开始：</label> <input id="start_time" name="start_time" value="" data-options="editable: false, width:100" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="start_time" comboname="start_time" type="text"><%-- <span class="textbox combo datebox" style="width: 98px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 72px;" type="text"><input class="textbox-value" name="start_time" value="" type="hidden"></span> --%>
						&nbsp;&nbsp;<br><label>请假结束：</label> <input id="end_time" name="end_time" value="" data-options="editable: false, width:100" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="end_time" comboname="end_time" type="text"><%-- <span class="textbox combo datebox" style="width: 98px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 72px;" type="text"><input class="textbox-value" name="end_time" value="" type="hidden"></span> --%>
						
						</td>
                    </tr>

                    <tr>
                        <td><label>请假原因：</label> <input id="reason" name="reason" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="multiline:true, validType:'MaxLength',prompt:'', required:true, tipPosition: 'right', missingMessage: '请输入请假原因'" value="" style="width: 522px; height: 60px; display: none;" textboxname="reason"><%-- <span class="textbox" style="width: 520px; height: 23px;"><textarea class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; height: 15px; width: 512px;"></textarea><input class="textbox-value" name="reason" value="" type="hidden"></span> --%></td>
                    </tr>
                   <!--  height：25 -->
                    <tr>
                        <td><div id="show-error-message-box" style="color: red"></div></td>
                    </tr>
                </tbody></table>
            </div></div>
            <div class="panel layout-panel layout-panel-center" style="width: 648px; left: 0px; top: 307px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 648px; height: 73px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                    <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveVacation()" group="">保存</a>
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
                </div>
            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
    </form>

<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed"},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852"},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851"}]';
    schoolJson = eval('('+schoolJson+')');

    var vacationStudentTypeJson = '[{"id":"","name":"请选择请假类型"},{"id":1,"name":"病假"},{"id":2,"name":"事假"},{"id":3,"name":"其他假"}]';
    vacationStudentTypeJson = eval('('+vacationStudentTypeJson+')');

    var url =  "${pageContext.request.contextPath}/studentVacationAction_addStudentVacation.action"; // 保存地址

    $.extend($.fn.validatebox.defaults.rules, {
        vacationType: {
            validator: function(value, param){
                var tempVlaue = $('#type').combobox('getValue');

                return tempVlaue > 0? true : false;
            },
            message: '请选择请假类型'
        },
        name:{
        	validator: function (value) {
                var reg = /^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/; 
                return reg.test(value);
            },
            message: '名字格式不准确.'
        },
        studentId: {
            validator: function(value, param){
                var tempVlaue = $('#student_id').val();
                return tempVlaue > 0? true : false;
            },
        },
        MaxLength: {
        	validator: function (value) {
        		var reg=/[\u4E00-\u9FA5]/g;
        		var reg2=/[A-Za-z0-9]/g;
        		var len=0;
        		var len2=0;
        		/* value.match(reg).length  算长度*/
        		
        		if(value.match(reg)!=null){
        			   len=value.match(reg).length*2;
        			}
        			if(value.match(reg2)!=null){
        			   len2=value.match(reg2).length;
        			}
        		var sum=len+len2;
        		if (sum > 32) { //返回中文的个数
        				return false;
        		}
        		return true;
            },
            message: '不能超过32个字母数字或16个汉字.'
        }
    });


    /* 保存录入信息 */
    function saveVacation(){
        $('#show-error-message-box').html('');

        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }

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

    // 上下方向键移动
    var upDownKeySelectedStudentIndex = 0;
    var valueStudentData;

    function upDownKeySelected(target,index){
        $(target).datagrid('clearSelections').datagrid('selectRow',index);
    }

    function setStudentName(value, rec) 
    { 	
    	//alert("jinlailes");
   	 	return "待修改";
    }
    
    
    //学生名称 搜索下拉 表格数据加载完成
    function studentDataLoadSuccess(){
    	//alert("学生名称搜索下拉 表格数据加载完成");
        upDownKeySelected("#studentTable",upDownKeySelectedStudentIndex);
        //$('#student_table_box').hide();
    }

    //学生名称 搜索下拉 表格数据 行点击事件
    function studentClickRow(rowIndex,rowData){
        if(! rowData){
            $('#studentTable').datagrid('clearSelections').datagrid('selectRow', rowIndex);
            rowData = $('#studentTable').datagrid('getSelected');
        }

        if (rowData.id.length > 0) {
        	
            $('#student_name').textbox('setValue', rowData.student_name);
            $('#student_id').val(rowData.id);
            $('#birthday_name').text(rowData.birthday_name);
            $('#class_name').text(rowData.grade_name + '(' + rowData.class_name + ')');
            $('#sex').text(rowData.sex_name);
        } else {
            $('#student_name').textbox('setValue', '');
            $('#student_id').val(0);
            $('#birthday_name').text('');
            $('#class_name').text('');
            $('#sex').text('');
        }

        upDownKeySelectedStudentIndex = rowIndex;

        $('#student_table_box').hide(); //  下拉框隐藏
    }

    $(function () {
        /* 现在当前日期后的两个月内日期可以选择 */
        $('#start_time').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate()-30);
                return date>=d2;
            }
        });

        /* 现在当前日期后的两个月内日期可以选择 */
        $('#end_time').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate()+60);
                return date<=d2;
            }
        });

        /* 校验学生 */
        $('input[name="student_name"]').prev('input').validatebox({
            novalidate: true,
            required: true,
            validType: "studentId",
            missingMessage: '请输入学生姓名选择学生',
            invalidMessage: '请选择学生'
        });

        /* 学校 */
         $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            value: '',
            onLoadSuccess:function(){
                var data = $('#school_id').combobox('getData');

                if (data.length > 0) {
                    $('#school_id').combobox('select', data[0].id);
                }
            },
            onSelect: function() {
                $('#student_name').textbox('setValue', '');
                $('#birthday_name').text('');
                $('#class_name').text('');
                $('#sex').text('');
                $('#student_id').val(0);
            }
        }); 

        /* 请假类型 */
        $('#type').combobox({
            data: vacationStudentTypeJson,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){

            }
        });

        var change_time_end = $.extend([], $.fn.datebox.defaults.buttons);
        change_time_end.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#' + $(target).attr('id')).datebox("setValue", "").datebox("hidePanel");
            }
        });

        /* 休假开始日期 */
        $('#start_time').datebox({
            novalidate: true,
            required:true,
            missingMessage: '请选择请假开始日期',
            buttons: change_time_end
        });

        $('#end_time').datebox({
            novalidate: true,
            required:true,
            missingMessage: '请选择请假结束日期',
            buttons: change_time_end
        });

        //学生名称 触发下拉搜索
        $(document).on('keyup','.textbox-text:eq(1)',function(e){
        	
            var studentName = $(this).val();
	
    		//alert("学生名称 触发下拉搜索");
            //alert(studentName);
            if(e.keyCode == 13) return false;
            if (studentName.length > 0) {
                $('#student_table_box').show();
                if( studentName == valueStudentData || valueStudentData == '@@@@') return false;
                $('#student_id').val(0);
                $('#birthday_name').text('');
                $('#class_name').text('');
                $('#sex').text('');

                $('#studentTable').datagrid('reload',{
                    school_id: $('#school_id').combobox('getValue'),
                    student_name:studentName
                });
            } else {
                $('#student_table_box').hide();
            }
            valueStudentData = studentName;
        })

        $(document).on('keydown','.textbox-text:eq(1)',function(e){
            var target = "#studentTable";
            var data =$(target).datagrid('getData');
            if(! $('#student_table_box').is(':hidden')){
                if(e.keyCode == 40){ //下移
                    if(upDownKeySelectedStudentIndex >= data.total-1) return false;
                    upDownKeySelectedStudentIndex++;
                    upDownKeySelected(target,upDownKeySelectedStudentIndex);
                }else if(e.keyCode == 38){ // 上移
                    if(upDownKeySelectedStudentIndex == 0 ){
                        return false;
                    }
                    upDownKeySelectedStudentIndex--;
                    upDownKeySelected(target,upDownKeySelectedStudentIndex);
                }else if(e.keyCode == 13){
                    studentClickRow(upDownKeySelectedStudentIndex,'');
                }
            }
        });
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner panel-noscroll"><div class="calendar calendar-noborder easyui-fluid" style="width: 0px; height: 178px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">2月 2017</span></div></div><div class="calendar-body" style="height: 156px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2017,1,30" style="">30</td><td class="calendar-day calendar-other-month " abbr="2017,1,31" style="">31</td><td class="calendar-day " abbr="2017,2,1" style="">1</td><td class="calendar-day " abbr="2017,2,2" style="">2</td><td class="calendar-day " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,5" style="">5</td><td class="calendar-day " abbr="2017,2,6" style="">6</td><td class="calendar-day " abbr="2017,2,7" style="">7</td><td class="calendar-day " abbr="2017,2,8" style="">8</td><td class="calendar-day " abbr="2017,2,9" style="">9</td><td class="calendar-day " abbr="2017,2,10" style="">10</td><td class="calendar-day calendar-today calendar-selected calendar-saturday calendar-last " abbr="2017,2,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,12" style="">12</td><td class="calendar-day " abbr="2017,2,13" style="">13</td><td class="calendar-day " abbr="2017,2,14" style="">14</td><td class="calendar-day " abbr="2017,2,15" style="">15</td><td class="calendar-day " abbr="2017,2,16" style="">16</td><td class="calendar-day " abbr="2017,2,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,19" style="">19</td><td class="calendar-day " abbr="2017,2,20" style="">20</td><td class="calendar-day " abbr="2017,2,21" style="">21</td><td class="calendar-day " abbr="2017,2,22" style="">22</td><td class="calendar-day " abbr="2017,2,23" style="">23</td><td class="calendar-day " abbr="2017,2,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day " abbr="2017,2,27" style="">27</td><td class="calendar-day " abbr="2017,2,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2017,3,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,3,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,3,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,3,7" style="">7</td><td class="calendar-day calendar-other-month " abbr="2017,3,8" style="">8</td><td class="calendar-day calendar-other-month " abbr="2017,3,9" style="">9</td><td class="calendar-day calendar-other-month " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner panel-noscroll"><div class="calendar calendar-noborder easyui-fluid" style="width: 0px; height: 178px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">2月 2017</span></div></div><div class="calendar-body" style="height: 156px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2017,1,30" style="">30</td><td class="calendar-day calendar-other-month " abbr="2017,1,31" style="">31</td><td class="calendar-day " abbr="2017,2,1" style="">1</td><td class="calendar-day " abbr="2017,2,2" style="">2</td><td class="calendar-day " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,5" style="">5</td><td class="calendar-day " abbr="2017,2,6" style="">6</td><td class="calendar-day " abbr="2017,2,7" style="">7</td><td class="calendar-day " abbr="2017,2,8" style="">8</td><td class="calendar-day " abbr="2017,2,9" style="">9</td><td class="calendar-day " abbr="2017,2,10" style="">10</td><td class="calendar-day calendar-today calendar-selected calendar-saturday calendar-last " abbr="2017,2,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,12" style="">12</td><td class="calendar-day " abbr="2017,2,13" style="">13</td><td class="calendar-day " abbr="2017,2,14" style="">14</td><td class="calendar-day " abbr="2017,2,15" style="">15</td><td class="calendar-day " abbr="2017,2,16" style="">16</td><td class="calendar-day " abbr="2017,2,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,19" style="">19</td><td class="calendar-day " abbr="2017,2,20" style="">20</td><td class="calendar-day " abbr="2017,2,21" style="">21</td><td class="calendar-day " abbr="2017,2,22" style="">22</td><td class="calendar-day " abbr="2017,2,23" style="">23</td><td class="calendar-day " abbr="2017,2,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day " abbr="2017,2,27" style="">27</td><td class="calendar-day " abbr="2017,2,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2017,3,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,3,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,3,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,3,7" style="">7</td><td class="calendar-day calendar-other-month " abbr="2017,3,8" style="">8</td><td class="calendar-day calendar-other-month " abbr="2017,3,9" style="">9</td><td class="calendar-day calendar-other-month " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_1" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i1_2" class="combobox-item">司南学辅1</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item combobox-item-selected">请选择请假类型</div><div id="_easyui_combobox_i2_1" class="combobox-item">事假</div><div id="_easyui_combobox_i2_2" class="combobox-item">病假</div><div id="_easyui_combobox_i2_3" class="combobox-item">其他假</div></div></div></body></html>