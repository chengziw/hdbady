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


<form id="fm" style="height:320px; " method="post" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 648px; height: 320px;">
        <input id="teacher_id" name="teacher_id" value="" type="hidden">
        <div class="panel layout-panel layout-panel-north" style="width: 648px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 630px; height: 230px;" title="" class="panel-body panel-body-noheader layout-body">
            <table cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td>
                        <div>
                            <label>姓名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input id="teacher_name" class="easyui-textbox textbox-f" value="" style="display: none;" textboxname="teacher_name" type="text"><span class="textbox" style="width: 145px; height: 20px;"><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 137px;" type="text"><input class="textbox-value" name="teacher_name" value="" type="hidden"></span>&nbsp;&nbsp;
                            <span id="sex"></span>
							&nbsp;&nbsp;<span id="school_name"></span>
							&nbsp;&nbsp;<span id="duty_name"></span>
                        </div>
                        <div id="teacher_table_box" style="position: relative; width: 568px; height: 0px;z-index:1; display: none;">
                            <div class="panel datagrid" style="width: 520px;"><div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 518px; height: 166px;"><div class="datagrid-view" style="width: 518px; height: 0px;"><div class="datagrid-view1" style="width: 0px;"><div class="datagrid-header" style="width: 0px; height: 0px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 0px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td rowspan="0"><div class="datagrid-header-rownumber"></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 0px; margin-top: 0px; height: 165px;"><div class="datagrid-body-inner"><table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody></tbody></table></div></div><div class="datagrid-footer" style="width: 0px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><div class="datagrid-view2" style="width: 518px;"><div class="datagrid-header" style="width: 518px; height: 0px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 0px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td field="teacher_name"><div class="datagrid-cell datagrid-cell-c1-teacher_name" style=""><span>老师姓名</span><span class="datagrid-sort-icon"></span></div></td><td field="sex_name"><div class="datagrid-cell datagrid-cell-c1-sex_name" style=""><span>性别</span><span class="datagrid-sort-icon"></span></div></td><td field="school_name"><div class="datagrid-cell datagrid-cell-c1-school_name" style=""><span>所在部门</span><span class="datagrid-sort-icon"></span></div></td><td field="duty_name"><div class="datagrid-cell datagrid-cell-c1-duty_name" style=""><span>职务</span><span class="datagrid-sort-icon"></span></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 518px; margin-top: 0px; height: 165px; overflow-x: hidden;"><table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r1-2-0" class="datagrid-row-checked datagrid-row-selected" style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;"><td field="teacher_name" style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;"><div style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;" class="datagrid-cell datagrid-cell-c1-teacher_name"></div></td><td field="sex_name" style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;"><div style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;" class="datagrid-cell datagrid-cell-c1-sex_name"></div></td><td field="school_name" style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;"><div style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;" class="datagrid-cell datagrid-cell-c1-school_name"></div></td><td field="duty_name" style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;"><div style="height: 1px; border-color: transparent; background: transparent none repeat scroll 0% 0%;" class="datagrid-cell datagrid-cell-c1-duty_name"></div></td></tr></tbody></table></div><div class="datagrid-footer" style="width: 518px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><table id="teacherTable" class="easyui-datagrid datagrid-f" style="position: absolute; top: 0px; left: 0px; display: none;" data-options="url:'/vacation-teacher/get-like-teacher-list-json.html',
                                           onLoadSuccess:teacherDataLoadSuccess,onClickRow:teacherClickRow,
                                           rownumbers:true,singleSelect:true">
                                <thead>
                                <tr>
                                    <th data-options="field:'teacher_name',width:100">老师姓名</th>
                                    <th data-options="field:'sex_name',width:60">性别</th>
                                    <th data-options="field:'school_name',width:220">所在部门</th>
                                    <th data-options="field:'duty_name',width:80">职务</th>
                                </tr>
                            </thead></table><style type="text/css" easyui="true">
.datagrid-cell-c1-teacher_name{width:91px}
.datagrid-cell-c1-sex_name{width:51px}
.datagrid-cell-c1-school_name{width:211px}
.datagrid-cell-c1-duty_name{width:71px}
</style></div></div></div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td><label>请假类型：</label> <input id="type" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" data-options="novalidate: true,validType:'vacationType',panelHeight:'auto'" value="" style="display: none;" textboxname="type" comboname="type" type="text"><span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="type" value="" type="hidden"></span>
					&nbsp;&nbsp;<label>请假开始：</label> <input id="start_time" value="" data-options="editable: false, width:100" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="start_time" comboname="start_time" type="text"><span class="textbox combo datebox" style="width: 98px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 72px;" type="text"><input class="textbox-value" name="start_time" value="" type="hidden"></span>
					&nbsp;&nbsp;<label>请假结束：</label> <input id="end_time" value="" data-options="editable: false, width:100" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="end_time" comboname="end_time" type="text"><span class="textbox combo datebox" style="width: 98px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 72px;" type="text"><input class="textbox-value" name="end_time" value="" type="hidden"></span></td>
                </tr>

                <tr>
                    <td><label>请假原因：</label> <input id="reason" class="easyui-textbox easyui-validatebox textbox-f validatebox-text" data-options="novalidate: true, multiline:true, prompt:'', required:true, tipPosition: 'right', missingMessage: '请输入请假原因'" value="" style="width: 522px; height: 25px; display: none;" textboxname="reason"><span class="textbox" style="width: 520px; height: 23px;"><textarea class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; height: 15px; width: 512px;"></textarea><input class="textbox-value" name="reason" value="" type="hidden"></span></td>
                </tr>
                <tr>
                    <td><div id="show-error-message-box" style="color: red"></div></td>
                </tr>
            </tbody></table>
        </div></div>
        <div class="panel layout-panel layout-panel-center" style="width: 648px; left: 0px; top: 247px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 648px; height: 73px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveVacation()" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">保存</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">取消</span><span class="l-btn-icon icon-no">&nbsp;</span></span></a>
            </div>
        </div></div>
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>

<script type="text/javascript">
    var vacationTeacherTypeJson = '[{"id":"","name":"\u8bf7\u9009\u62e9\u8bf7\u5047\u7c7b\u578b"},{"id":1,"name":"\u75c5\u5047"},{"id":2,"name":"\u4e8b\u5047"},{"id":3,"name":"\u5a5a\u5047"},{"id":4,"name":"\u4e27\u5047"},{"id":5,"name":"\u4ea7\u5047"},{"id":6,"name":"\u5176\u4ed6\u5047"}]';
    vacationTeacherTypeJson = eval('('+vacationTeacherTypeJson+')');

    var url =  "/vacation-teacher/save.html"; // 保存地址

    $.extend($.fn.validatebox.defaults.rules, {
        vacationType: {
            validator: function(value, param){
                var tempVlaue = $('#type').combobox('getValue');

                return tempVlaue &gt; 0? true : false;
            },
            message: '请选择请假类型'
        },
        teacherId: {
            validator: function(value, param){
                var tempVlaue = $('#teacher_id').val();
                return tempVlaue &gt; 0? true : false;
            },
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
    var upDownKeySelectedTeacherIndex = 0;
    var valueTeacherData;

    function upDownKeySelected(target,index){
        $(target).datagrid('clearSelections').datagrid('selectRow',index);
    }

    //老师名称 搜索下拉 表格数据加载完成
    function teacherDataLoadSuccess(){
        upDownKeySelected("#teacherTable",upDownKeySelectedTeacherIndex);
    }

    //老师名称 搜索下拉 表格数据 行点击事件
    function teacherClickRow(rowIndex,rowData){
        if(! rowData){
            $('#teacherTable').datagrid('clearSelections').datagrid('selectRow', rowIndex);
            rowData = $('#teacherTable').datagrid('getSelected');
        }

        $('#teacher_name').textbox('setValue', rowData.teacher_name);
        $('#teacher_id').val(rowData.id);
        $('#school_name').text(rowData.school_name);
        $('#duty_name').text(rowData.duty_name);
        $('#sex').text(rowData.sex_name);

        upDownKeySelectedTeacherIndex = rowIndex;

        $('#teacher_table_box').hide(); //  下拉框隐藏
    }

    $(function () {
        /* 现在当前日期后的两个月内日期可以选择 */
        $('#start_time').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate()-30);
                return date&gt;=d2;
            }
        });

        /* 现在当前日期后的两个月内日期可以选择 */
        $('#end_time').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate()+60);
                return date&lt;=d2;
            }
        });

        /* 校验老师 */
        $('input[name="teacher_name"]').prev('input').validatebox({
            novalidate: true,
            required: true,
            validType: "teacherId",
            missingMessage: '请输入老师姓名选择老师',
            invalidMessage: '请选择老师'
        });

        /* 请假类型 */
        $('#type').combobox({
            data: vacationTeacherTypeJson,
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

        //老师名称 触发下拉搜索
        $(document).on('keyup','.textbox-text:eq(0)',function(e){
            var teacherName = $(this).val();

            if(e.keyCode == 13) return false;
            if (teacherName.length &gt; 0) {
                $('#teacher_table_box').show();
                if( teacherName == valueTeacherData || valueTeacherData == '@@@@') return false;
                $('#teacher_id').val(0);
                $('#school_name').text('');
                $('#duty_name').text('');
                $('#sex').text('');

                $('#teacherTable').datagrid('reload',{
                    teacher_name:teacherName
                });
            } else {
                $('#teacher_table_box').hide();
            }
            valueTeacherData = teacherName;
        })

        $(document).on('keydown','.textbox-text:eq(0)',function(e){
            var target = "#teacherTable";
            var data =$(target).datagrid('getData');
            if(! $('#teacher_table_box').is(':hidden')){
                if(e.keyCode == 40){ //下移
                    if(upDownKeySelectedTeacherIndex &gt;= data.total-1) return false;
                    upDownKeySelectedTeacherIndex++;
                    upDownKeySelected(target,upDownKeySelectedTeacherIndex);
                }else if(e.keyCode == 38){ // 上移
                    if(upDownKeySelectedTeacherIndex == 0 ){
                        return false;
                    }
                    upDownKeySelectedTeacherIndex--;
                    upDownKeySelected(target,upDownKeySelectedTeacherIndex);
                }else if(e.keyCode == 13){
                    teacherClickRow(upDownKeySelectedTeacherIndex,'');
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner panel-noscroll"><div class="calendar calendar-noborder easyui-fluid" style="width: 0px; height: 178px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">2月 2017</span></div></div><div class="calendar-body" style="height: 156px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2017,1,30" style="">30</td><td class="calendar-day calendar-other-month " abbr="2017,1,31" style="">31</td><td class="calendar-day " abbr="2017,2,1" style="">1</td><td class="calendar-day " abbr="2017,2,2" style="">2</td><td class="calendar-day " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,5" style="">5</td><td class="calendar-day " abbr="2017,2,6" style="">6</td><td class="calendar-day " abbr="2017,2,7" style="">7</td><td class="calendar-day " abbr="2017,2,8" style="">8</td><td class="calendar-day " abbr="2017,2,9" style="">9</td><td class="calendar-day " abbr="2017,2,10" style="">10</td><td class="calendar-day calendar-today calendar-selected calendar-saturday calendar-last " abbr="2017,2,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,12" style="">12</td><td class="calendar-day " abbr="2017,2,13" style="">13</td><td class="calendar-day " abbr="2017,2,14" style="">14</td><td class="calendar-day " abbr="2017,2,15" style="">15</td><td class="calendar-day " abbr="2017,2,16" style="">16</td><td class="calendar-day " abbr="2017,2,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,19" style="">19</td><td class="calendar-day " abbr="2017,2,20" style="">20</td><td class="calendar-day " abbr="2017,2,21" style="">21</td><td class="calendar-day " abbr="2017,2,22" style="">22</td><td class="calendar-day " abbr="2017,2,23" style="">23</td><td class="calendar-day " abbr="2017,2,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day " abbr="2017,2,27" style="">27</td><td class="calendar-day " abbr="2017,2,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2017,3,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,3,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,3,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,3,7" style="">7</td><td class="calendar-day calendar-other-month " abbr="2017,3,8" style="">8</td><td class="calendar-day calendar-other-month " abbr="2017,3,9" style="">9</td><td class="calendar-day calendar-other-month " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner panel-noscroll"><div class="calendar calendar-noborder easyui-fluid" style="width: 0px; height: 178px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">2月 2017</span></div></div><div class="calendar-body" style="height: 156px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2017,1,30" style="">30</td><td class="calendar-day calendar-other-month " abbr="2017,1,31" style="">31</td><td class="calendar-day " abbr="2017,2,1" style="">1</td><td class="calendar-day " abbr="2017,2,2" style="">2</td><td class="calendar-day " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,5" style="">5</td><td class="calendar-day " abbr="2017,2,6" style="">6</td><td class="calendar-day " abbr="2017,2,7" style="">7</td><td class="calendar-day " abbr="2017,2,8" style="">8</td><td class="calendar-day " abbr="2017,2,9" style="">9</td><td class="calendar-day " abbr="2017,2,10" style="">10</td><td class="calendar-day calendar-today calendar-selected calendar-saturday calendar-last " abbr="2017,2,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,12" style="">12</td><td class="calendar-day " abbr="2017,2,13" style="">13</td><td class="calendar-day " abbr="2017,2,14" style="">14</td><td class="calendar-day " abbr="2017,2,15" style="">15</td><td class="calendar-day " abbr="2017,2,16" style="">16</td><td class="calendar-day " abbr="2017,2,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,19" style="">19</td><td class="calendar-day " abbr="2017,2,20" style="">20</td><td class="calendar-day " abbr="2017,2,21" style="">21</td><td class="calendar-day " abbr="2017,2,22" style="">22</td><td class="calendar-day " abbr="2017,2,23" style="">23</td><td class="calendar-day " abbr="2017,2,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day " abbr="2017,2,27" style="">27</td><td class="calendar-day " abbr="2017,2,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2017,3,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,3,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,3,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,3,7" style="">7</td><td class="calendar-day calendar-other-month " abbr="2017,3,8" style="">8</td><td class="calendar-day calendar-other-month " abbr="2017,3,9" style="">9</td><td class="calendar-day calendar-other-month " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">请选择请假类型</div><div id="_easyui_combobox_i1_1" class="combobox-item">病假</div><div id="_easyui_combobox_i1_2" class="combobox-item">事假</div><div id="_easyui_combobox_i1_3" class="combobox-item">婚假</div><div id="_easyui_combobox_i1_4" class="combobox-item">丧假</div><div id="_easyui_combobox_i1_5" class="combobox-item">产假</div><div id="_easyui_combobox_i1_6" class="combobox-item">其他假</div></div></div></body></html>