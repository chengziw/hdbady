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
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>


<form id="ff" method="post" style="height:348px;" data-href="/teacher/save-rehab-teacher.html?id=35&amp;sinKey=515d%25EDy%2512k%25F0%253E%25B2%2590%25ABx%259F%7E%258AO-%2501%25CFz%25C3%25FD%25C0%2580%25F2t%2514%25B0%259D%2583%25B1%255E%257C%2581%25FDNG%25D1%25B0%250F%259E%251Bf%2560" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 776px; height: 348px;">

        <div class="panel layout-panel layout-panel-north" style="width: 776px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 758px; height: 260px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td>教职工姓名：</td>
                    <td><s:property value="teacher.teacher_name"/></td>
                    <td>性别：</td>
                    <td><s:property value="teacher.teacher_name"/></td>
                    <td>出生日期：</td>
                    <td><s:property value="teacher.brither_name"/></td>
                    <td>工号：</td>
                    <td><s:property value="teacher.worknumber"/></td>
               </tr>

                <tr>
                    <td>当前所属部门：</td>
                    <td colspan="3"><s:property value="teacher.structure_name"/></td>
                    <td>职务：</td>
                    <td><s:property value="teacher.duty_name"/></td>
                    <td>入职日期：</td>
                    <td><s:property value="teacher.entry_time_name"/></td>
               </tr>

                <tr>
                    <td>当前状态：</td>
                    <td><s:property value="teacher.status_name"/></td>
                    <td>退休日期：</td>
                    <td><s:property value="teacher.left_time_name"/></td>
                    <td colspan="4"></td>
                </tr>

                <tr>
                    <td>复职日期：</td>
                    <td><input id="change_date" name="change_date" value="0" required="true" data-options="" style="width: 100px; display: none;" class="datebox-f combo-f textbox-f" textboxname="change_date" comboname="change_date"></td>
                    <td>复职备注：</td>
                    <td colspan="5"><input id="note" name="note" class="easyui-textbox textbox-f" style="width: 400px; display: none;" data-options="" textboxname="note"></td>
                </tr>

                <tr>
                    <td colspan="8"><span style="color:red;font-size:12px;" id="show-error-message-box"></span></td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 776px; left: 0px; top: 277px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 776px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <!-- <input name="action" value="edit" type="hidden"> -->
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">复职</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">取消</span><span class="l-btn-icon icon-no">&nbsp;</span></span></a>
            </div>
        </div></div>
        	<input name="id" value="<s:property value="teacher.id"/>" readonly="true" type="hidden" style："border:none"/></td>             
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
        	url:'${pageContext.request.contextPath}/teacherAction_resumeTeacher.action',
            onSubmit:function(params){
                var result = $(this).form('enableValidation').form('validate');
                if(!result){
                    $('#save-btn').removeClass('mylinkbtn-load');
                };
                return result;
            },
            success:function(result){
                var result = eval('('+result+')');
                if (result.status==1){
                    window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }else{
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                }
            }
        });
    }


    $(function(){
        //  清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });

        //变动日期
        $('#change_date').datebox({
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">2月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2017,1,30" style="">30</td><td class="calendar-day calendar-other-month " abbr="2017,1,31" style="">31</td><td class="calendar-day " abbr="2017,2,1" style="">1</td><td class="calendar-day " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,5" style="">5</td><td class="calendar-day " abbr="2017,2,6" style="">6</td><td class="calendar-day " abbr="2017,2,7" style="">7</td><td class="calendar-day " abbr="2017,2,8" style="">8</td><td class="calendar-day " abbr="2017,2,9" style="">9</td><td class="calendar-day " abbr="2017,2,10" style="">10</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,12" style="">12</td><td class="calendar-day " abbr="2017,2,13" style="">13</td><td class="calendar-day " abbr="2017,2,14" style="">14</td><td class="calendar-day " abbr="2017,2,15" style="">15</td><td class="calendar-day " abbr="2017,2,16" style="">16</td><td class="calendar-day " abbr="2017,2,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,19" style="">19</td><td class="calendar-day " abbr="2017,2,20" style="">20</td><td class="calendar-day " abbr="2017,2,21" style="">21</td><td class="calendar-day " abbr="2017,2,22" style="">22</td><td class="calendar-day " abbr="2017,2,23" style="">23</td><td class="calendar-day " abbr="2017,2,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day " abbr="2017,2,27" style="">27</td><td class="calendar-day " abbr="2017,2,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2017,3,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,3,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,3,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,3,7" style="">7</td><td class="calendar-day calendar-other-month " abbr="2017,3,8" style="">8</td><td class="calendar-day calendar-other-month " abbr="2017,3,9" style="">9</td><td class="calendar-day calendar-other-month " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div></body></html>