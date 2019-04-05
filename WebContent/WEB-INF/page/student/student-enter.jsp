﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
<html>
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

	<style type="text/css">
		#student_no{
			border:none;
		}
	</style>

</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>


<form id="ff" method="post" style="height:328px;" data-href="${pageContext.request.contextPath}/studentAction_enterStudent.action"  class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 756px; height: 328px;">

        <div class="panel layout-panel layout-panel-north" style="width: 756px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 738px; height: 240px;" title="" class="panel-body panel-body-noheader layout-body">

          		 <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td width="160">当前状态：</td>
                    <td width="220">待确认入学                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td width="100">入学日期：</td>
                    <td width="160"><input id="enter_date" value="2017-01-20" required="true" data-options="novalidate:true" style="width: 100px; display: none;" class="datebox-f combo-f textbox-f" textboxname="enter_date" comboname="enter_date"></td>
                    <td width="100">学号：</td>
                    <td width="100"><input id="student_no" name="student_no" value="<s:property value="student.student_no"/>" readonly="true" type="text" style："border:none"/></td>
                    <td colspan="2">&nbsp;</td>
                </tr>
					<input name="status_name" value="3" readonly="true" type="hidden" style："border:none"/></td>
               		<input name="id" value="<s:property value="student.id"/>" readonly="true" type="hidden" style："border:none"/></td>
                <tr>
                	<%-- <s:debug></s:debug> --%>
                    <td>姓名（英文名）：</td>
                    <td><s:property value="student.name"/></td>
                    <td>性别：</td>
                    <td><s:property value="student.sex"/></td>
                    <td width="60">生日：</td>
                    <td width="200"><s:property value="student.yearMonthDay"/></td>
                </tr>
                <tr>
                    <td>年级：</td>
                    <td><input id="grade_id" value="<s:property value="student.classes.grade.name"/>" required="true" style="width: 100px; display: none;" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f"></td>
                    <input name="grade_id" value="<s:property value="student.grade.id"/>"type="hidden">
                    <td>班级：</td>
                    <td><input id="class_id" value="<s:property value="student.classes.class_name"/>" required="true" style="width: 130px; display: none;" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f" disabled="disabled"></td>
                   	<input name="class_id" value="<s:property value="student.classes.id"/>"type="hidden">
                    </tr><tr>
                    <td colspan="6"></td>
                </tr>

                <tr>
                    <td colspan="6">
                        <span style="color:red;font-size:12px;" id="show-error-message-box"></span>                    </td>
                </tr>
            </tbody></table>
               

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 756px; left: 0px; top: 257px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 756px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
               <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-ok" onclick="saveFrom()" group="">确认</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
   function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }

        $('#save-btn').addClass('mylinkbtn-load');
        var url = $("#ff").attr('data-href');

        $('#ff').form('submit',{
            url:url,
            onSubmit:function(){
                var result = $(this).form('enableValidation').form('validate');
                if(!result){
                    $('#save-btn').removeClass('mylinkbtn-load');
                }
                return result;
            },
            success:function(result){
                var result = eval('('+result+')');
                if (result.status==1){
                    //window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }else{
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                    //$.messager.alert('提示',result.info);
                }
            }
        });
    }

   //验证扩展
   $.extend($.fn.validatebox.defaults.rules,{
       noNull: {
           validator: function(value, param){
               if(value=='请选择' || value==''){
                   return false;
               }
               return true;
           },
           message: '此输入项为必输项'
       }
   });

    $(function(){
        /* 转换PHPJSON为JS JSON格式 */
        var schoolJson = '[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":2,"name":"Dear\u5b9d\u8d1d\u3010\u5357\u5c71\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":6,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}]},{"id":8,"name":"\u5317\u4eac\u52b1\u5fb7\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":40,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":41,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":42,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]}]}]';
        schoolJson = eval('('+schoolJson+')');

        var schoolId = 1;
        var gradeId = 3;
        var classId = 19;
        var gradeJson = [];
        var classJson = [];

        for(var i=0; i<schoolJson.length; i++){
            if(schoolJson[i]['id'] == schoolId){
                gradeJson = schoolJson[i]['gradeList'];
                for(var j=0; j<gradeJson.length; j++){
                    if(gradeJson[j]['id'] == gradeId){
                        classJson = gradeJson[j]['classList'];
                    }
                }
            }
        }

        //年级
        $('#grade_id').combobox({
 			//url:'${pageContext.request.contextPath}/gradeAction_findAllGrades.action',
 			//data:[{id:'',name:"请选择"}],
 			valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                //$('#grade_id').combobox("setValue","请选择");
            },
            onSelect:function(record){
            	/* $('#class_id').combobox({data:record.classList,value:'',disabled:false});
            	var id = record.id;
            	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeId.action?id='+id+'';
            	$('#class_id').combobox('reload', url); */
            }
        });

        //班级
        $('#class_id').combobox({
            //data:[{id:'',name:"请选择"}],
        	valueField:'id',
            textField:'name',
            disabled:false,//不能编辑:true
            editable:false,
            onLoadSuccess:function(){
                //$('#class_id').combobox("setValue","请选择");
            }
        });
        
        //  清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });
        //入读日期
        $('#enter_date').datebox({
            buttons: buttons,
            editable:false
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">请选择</div><div id="_easyui_combobox_i1_1" class="combobox-item">托班</div><div id="_easyui_combobox_i1_2" class="combobox-item">小班</div><div id="_easyui_combobox_i1_3" class="combobox-item combobox-item-selected">中班</div><div id="_easyui_combobox_i1_4" class="combobox-item">大班</div><div id="_easyui_combobox_i1_5" class="combobox-item">学前班</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item">请选择</div><div id="_easyui_combobox_i2_1" class="combobox-item">一班(2014年入学)</div><div id="_easyui_combobox_i2_2" class="combobox-item combobox-item-selected">二班(2014年入学)</div><div id="_easyui_combobox_i2_3" class="combobox-item">三班(2014年入学)</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-today calendar-selected calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day " abbr="2017,1,24" style="">24</td><td class="calendar-day " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div></body></html>