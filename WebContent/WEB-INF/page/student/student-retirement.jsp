<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
<html lang="en-US"><head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dear宝贝-幼教云管理平台</title>
    <link rel="stylesheet" type="text/css" href="js/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/icon.css">

    <script type="text/javascript" src="js/jquery_002.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>    
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    
    <link rel="stylesheet" href="js/jquery.css">
    <script type="text/javascript" src="js/jquery_003.js"></script>
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>


<form id="ff" method="post" style="height:358px;" data-href="/student/save-change-status.html?id=1028&amp;sinKey=b0c5%2598%25DCn%25ED%25A7%25EFW%251D%7E%2589%25B8%25A3%2507%2588E%25F0%25C2%2519%2521%25B6%250Bo5%2519%259A%25A91%2584%25B4%25FB%25BF%257C%2586%2590%25B7%2595%2525nn%2507b%25E1%25ABE%2589" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 738px; height: 358px;">

        <div class="panel layout-panel layout-panel-north" style="width: 738px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 720px; height: 270px;" title="" class="panel-body panel-body-noheader layout-body">

            
                .
                <table width="700" cellspacing="0" cellpadding="8" border="0">


                <tbody><tr>
                  <td width="100">姓名：</td>
                    <td width="140"><s:property value="student.name"/></td>
                    <td width="50">性别：</td>
                    <td width="140"><s:property value="student.sex"/></td>
                    <td>生日：</td>
                    <td><s:property value="student.yearMonthDay"/></td>
                </tr>
				<input name="id" value="<s:property value="student.id"/>" readonly="true" type="hidden" style："border:none"/></td>             
  
                <tr>
                    <td>年级：</td>
                    <td><s:property value="student.grade.name"/></td>
                    <td>班级：</td>
                    <td><s:property value="student.classes.class_name"/></td>
                </tr><tr>
						  
                    <td> 休退日期： </td>
                    <td><input id="change_date" value="0" required="true" data-options="novalidate:true" style="width: 100px; display: none;" class="datebox-f combo-f textbox-f" textboxname="change_date" comboname="change_date"></td>
                    <td>休或退：</td>
                    <td><label>
                      <input name="status_name" checked="true" value="4" type="radio">
                      休学 </label>
                        <label>
                        <input name="status_name" value="5" type="radio">
                          退学 </label>                    </td>
						  
                  <td>当前状态：</td>
                <td>正常就读</td>

                </tr>

                <tr>
                    <td>
                        休退备注：<br>
<br></td>
                    <td colspan="5"><input id="note" name="note" class="easyui-textbox textbox-f" data-options="" style="width: 568px; display: none;" textboxname="note">
                </tr>

                <tr>
                    <td colspan="6">
                        <span style="color:red;font-size:12px;" id="show-error-message-box"></span>                    </td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 738px; left: 0px; top: 287px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 738px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
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
        	url:'${pageContext.request.contextPath}/studentAction_leaveSchool.action',
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
                    window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }else{
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                    $.messager.alert('提示',result.info);
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-today calendar-selected calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day " abbr="2017,1,24" style="">24</td><td class="calendar-day " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div></body></html>