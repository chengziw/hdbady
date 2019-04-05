<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>%>
<!DOCTYPE html>
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

<style type="text/css">
    .fitem{ line-height: 30px; }
    .lad_text{ font-size: 12px; width: 70px; display: inline-block;}
    .span_text{ font-size: 12px; color: #999;}
    .span_text2{ font-size: 12px;}
</style>


<form id="ff" method="post" style="height:368px;" enctype="multipart/form-data" data-href="/teacher/out-excel-teacher.html" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 1366px; height: 368px;">

        <div class="panel layout-panel layout-panel-north" style="width: 1366px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 1348px; height: 280px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="100%" cellspacing="0" cellpadding="8" border="0">

                <tbody><tr>
                    <td width="20%">部门：</td>
                    <td>
                        <input id="structure_id" style="width: 260px; display: none;" class="combotree-f combo-f textbox-f" textboxname="structure_id[]" comboname="structure_id[]"><span class="textbox combo" style="width: 258px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 232px;" value="全部部门" type="text"><input class="textbox-value" name="structure_id[]" value="全部部门" type="hidden"></span>
                    </td>
                </tr>

                <tr>
                    <td>职务：</td>
                    <td>
                        <input id="duty_id" style="width: 260px; display: none;" class="combotree-f combo-f textbox-f" textboxname="duty_id[]" comboname="duty_id[]"><span class="textbox combo" style="width: 258px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 232px;" value="全部职务" type="text"><input class="textbox-value" name="duty_id[]" value="全部职务" type="hidden"></span>
                    </td>
                </tr>

                <tr>
                    <td>入职日期：</td>
                    <td>
                        <input id="entry_time_start" class="easyui-datebox datebox-f combo-f textbox-f" data-options="editable:false" style="width: 112px; display: none;" textboxname="entry_time_start" comboname="entry_time_start"><span class="textbox combo datebox" style="width: 110px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 84px;" type="text"><input class="textbox-value" name="entry_time_start" value="" type="hidden"></span>
&nbsp;至&nbsp;
                        <input id="entry_time_end" class="easyui-datebox datebox-f combo-f textbox-f" data-options="editable:false" style="width: 112px; display: none;" textboxname="entry_time_end" comboname="entry_time_end"><span class="textbox combo datebox" style="width: 110px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 84px;" type="text"><input class="textbox-value" name="entry_time_end" value="" type="hidden"></span>
                    </td>
                </tr>

                <tr>
                    <td>状态：</td>
                    <td>
                        <input id="status" style="width: 260px; display: none;" class="combotree-f combo-f textbox-f" textboxname="status[]" comboname="status[]"><span class="textbox combo" style="width: 258px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 232px;" value="全部状态" type="text"><input class="textbox-value" name="status[]" value="全部状态" type="hidden"></span>
                    </td>
                </tr>

                <tr>
                    <td width="20%"><label>
                            <input class="chooseNameAll" value="" type="checkbox"> 全选资料项
                        </label></td>
                    <td>

                                                    <label style="width:80px; display: inline-block;">
                                <input name="chooseName[teacher_name]" value="姓名" class="chooseNameNo" checked="checked" disabled="disabled" type="checkbox"> 姓名                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[sex]" value="性别" class="chooseName" type="checkbox"> 性别                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[phone]" value="手机号" class="chooseName" type="checkbox"> 手机号                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[weixin]" value="微信" class="chooseName" type="checkbox"> 微信                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[qq]" value="QQ号" class="chooseName" type="checkbox"> QQ号                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[email]" value="Email" class="chooseName" type="checkbox"> Email                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[bloc_name]" value="所属集团" class="chooseName" type="checkbox"> 所属集团                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[school_name]" value="所属学校" class="chooseName" type="checkbox"> 所属学校                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[structure_name]" value="部门" class="chooseName" type="checkbox"> 部门                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[duty_name]" value="职务" class="chooseName" type="checkbox"> 职务                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[birthday]" value="生日" class="chooseName" type="checkbox"> 生日                            </label>
                                                        <label style="width:80px; display: inline-block;">
                                <input name="chooseName[entry_time]" value="入职日期" class="chooseName" type="checkbox"> 入职日期                            </label>
                                                </td>
                </tr>

                <tr>
                    <td width="20%"></td>
                    <td>
                        <span style="color:red;font-size:12px;" id="show-error-message-box"></span>
                    </td>
                </tr>

            </tbody></table>

        </div></div>


        <div class="panel layout-panel layout-panel-center" style="width: 1366px; left: 0px; top: 297px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 1366px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-ok" onclick="saveFrom()" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导出</span><span class="l-btn-icon icon-ok">&nbsp;</span></span></a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">取消</span><span class="l-btn-icon icon-no">&nbsp;</span></span></a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
    var teacherIntterval;
    function checkOutExcelTeacher(){
        $.ajax({
            url:'/teacher/check-out-excel-teacher.html',
            dataType:'JSON',
            success:function(result){
                if (result.status==1){
                    //window.parent.showMessage('提示信息', result.info);
                    clearInterval(teacherIntterval);
                    loadWindow('close');
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }
            }
        })
    }

    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        loadWindow('show','数据处理中！请稍等...');
        $('#save-btn').addClass('mylinkbtn-load');
        $("#show-error-message-box").html('');

        var url = $("#ff").attr('data-href');
        $('#ff').form('submit',{
            url:url,
            onSubmit:function(params){
                var result = checkChooseName();
                if(!result){
                    loadWindow('close');
                    $('#save-btn').removeClass('mylinkbtn-load');
                }else{
                    teacherIntterval = setInterval(checkOutExcelTeacher,1000);
                };
                return result;
            },
            success:function(result){
                var result = eval('('+result+')');
                if (result.status==1){
                    //window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }else{
                    loadWindow('close');
                    clearInterval(teacherIntterval);
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                }
            }
        });
    }


    /*
     * 检查 chooseName
     */
    function checkChooseName(){
        var result = '';
        $(".chooseName").each(function(){
            if($(this).prop('checked')){
                result += $(this).val()+',';
            }
        })

        if(result == ''){
            $("#show-error-message-box").html('请选择需要导出的信息！');
            return false;
        }
        return true;
    }

    function returnFalse(){
        return false;
    }

    $(function(){
        $('#structure_id').combotree({
            url:'/teacher/bor-s-children.html',
            valueField:'id',
            textField:'text',
            editable:false,
            animate:true,
            lines:true,
            panelHeight:200,
            multiple:true,
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            onLoadSuccess:function(){
                $('#structure_id').combotree("setValue","全部部门");
            }
        })

        var dutyJson = eval('([{"id":0,"duty_name":"\u5168\u90e8\u804c\u52a1","children":[{"id":"17","duty_name":"\u8463\u4e8b\u957f","bloc_id":"1","sort":"17","status":"1","create_time":"1471097276","children":[]},{"id":"15","duty_name":"\u56ed\u957f","bloc_id":"1","sort":"15","status":"1","create_time":"1471097276","children":[]},{"id":"14","duty_name":"\u526f\u56ed\u957f","bloc_id":"1","sort":"14","status":"1","create_time":"1471097276","children":[]},{"id":"13","duty_name":"\u6559\u52a1\u4e3b\u4efb","bloc_id":"1","sort":"13","status":"1","create_time":"1471097276","children":[]},{"id":"12","duty_name":"\u540e\u52e4\u4e3b\u4efb","bloc_id":"1","sort":"12","status":"1","create_time":"1471097276","children":[]},{"id":"11","duty_name":"\u529e\u516c\u5ba4\u4e3b\u4efb","bloc_id":"1","sort":"11","status":"1","create_time":"1471097276","children":[]},{"id":"10","duty_name":"\u8d22\u52a1\u4e3b\u4efb","bloc_id":"1","sort":"10","status":"1","create_time":"1471097276","children":[]},{"id":"9","duty_name":"\u5e74\u7ea7\u7ec4\u957f","bloc_id":"1","sort":"9","status":"1","create_time":"1471097276","children":[]},{"id":"8","duty_name":"\u73ed\u4e3b\u4efb","bloc_id":"1","sort":"8","status":"1","create_time":"1471097276","children":[]},{"id":"7","duty_name":"\u6559\u5e08","bloc_id":"1","sort":"7","status":"1","create_time":"1471097276","children":[]},{"id":"6","duty_name":"\u4fdd\u5065\u533b\u751f","bloc_id":"1","sort":"6","status":"1","create_time":"1471097276","children":[]},{"id":"5","duty_name":"\u4f1a\u8ba1","bloc_id":"1","sort":"5","status":"1","create_time":"1471097276","children":[]},{"id":"4","duty_name":"\u51fa\u7eb3","bloc_id":"1","sort":"4","status":"1","create_time":"1471097276","children":[]},{"id":"3","duty_name":"\u91c7\u8d2d","bloc_id":"1","sort":"3","status":"1","create_time":"1471097276","children":[]},{"id":"2","duty_name":"\u4fdd\u5b89","bloc_id":"1","sort":"2","status":"1","create_time":"1471097276","children":[]},{"id":"1","duty_name":"\u666e\u901a\u804c\u5de5","bloc_id":"1","sort":"1","status":"1","create_time":"1471097276","children":[]}]}])');
        $('#duty_id').combotree({
            data:dutyJson,
            valueField:'id',
            textField:'text',
            editable:false,
            animate:true,
            lines:true,
            panelHeight:200,
            multiple:true,
            formatter:function(node){
                node.text = node.duty_name;
                return node.text;
            },
            onLoadSuccess:function(data){
                $('#duty_id').combotree("setValue","全部职务");
            }
        })

        var teacherStatusData = eval('([{"id":0,"name":"\u5168\u90e8\u72b6\u6001","children":[{"id":1,"name":"\u6b63\u5e38\u5728\u6821"},{"id":2,"name":"\u4f11\u5047\u4e2d"},{"id":3,"name":"\u5df2\u79bb\u804c"},{"id":4,"name":"\u5df2\u9000\u4f11"}]}])');
        $("#status").combotree({
            data:teacherStatusData,
            valueField:'id',
            textField:'text',
            editable:false,
            animate:true,
            lines:true,
            panelHeight:'auto',
            multiple:true,
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            onLoadSuccess:function(data){
                $('#status').combotree("setValue","全部状态");
            }
        })

        $(".chooseNameAll").click(function(){
            if($(this).prop('checked')){
                $(".chooseName").prop('checked',true);
            }else{
                $(".chooseName").prop('checked',false);
            }
        })

        $(".chooseName").click(function(){
            if(!$(this).prop('checked')){
                $(".chooseNameAll").prop('checked',false);
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day " abbr="2017,1,24" style="">24</td><td class="calendar-day " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day " abbr="2017,1,24" style="">24</td><td class="calendar-day " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id=""><ul class="tree tree-lines"><li><div id="_easyui_tree_23" class="tree-node tree-root-one tree-node-last"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">全部部门</span></div><ul style="display:block"><li><div id="_easyui_tree_24" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">集团总部</span></div><ul style="display:block"><li><div id="_easyui_tree_25" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">行政部</span></div></li><li><div id="_easyui_tree_26" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">市场部</span></div></li><li><div id="_easyui_tree_27" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">财务部</span></div></li></ul></li><li><div id="_easyui_tree_28" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">Dear宝贝示范幼儿园</span></div><ul style="display:block"><li><div id="_easyui_tree_29" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_30" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_31" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_32" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">家长中心</span></div></li></ul></li><li><div id="_easyui_tree_33" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">Dear宝贝【南山】幼儿园</span></div><ul style="display:block"><li><div id="_easyui_tree_34" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_35" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_36" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_37" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">家长中心</span></div></li></ul></li><li><div id="_easyui_tree_38" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">北京励德幼儿园</span></div><ul style="display:block"><li><div id="_easyui_tree_39" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_40" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_41" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_42" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">家长中心</span></div></li></ul></li></ul></li></ul></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id=""><ul class="tree tree-lines"><li><div id="_easyui_tree_1" class="tree-node tree-root-one tree-node-last"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">全部职务</span></div><ul style="display:block"><li><div id="_easyui_tree_2" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">董事长</span></div></li><li><div id="_easyui_tree_3" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">园长</span></div></li><li><div id="_easyui_tree_4" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">副园长</span></div></li><li><div id="_easyui_tree_5" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">教务主任</span></div></li><li><div id="_easyui_tree_6" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">后勤主任</span></div></li><li><div id="_easyui_tree_7" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">办公室主任</span></div></li><li><div id="_easyui_tree_8" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">财务主任</span></div></li><li><div id="_easyui_tree_9" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">年级组长</span></div></li><li><div id="_easyui_tree_10" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">班主任</span></div></li><li><div id="_easyui_tree_11" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">教师</span></div></li><li><div id="_easyui_tree_12" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">保健医生</span></div></li><li><div id="_easyui_tree_13" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">会计</span></div></li><li><div id="_easyui_tree_14" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">出纳</span></div></li><li><div id="_easyui_tree_15" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">采购</span></div></li><li><div id="_easyui_tree_16" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">保安</span></div></li><li><div id="_easyui_tree_17" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">普通职工</span></div></li></ul></li></ul></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id=""><ul class="tree tree-lines"><li><div id="_easyui_tree_18" class="tree-node tree-root-one tree-node-last"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">全部状态</span></div><ul style="display:block"><li><div id="_easyui_tree_19" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">正常在校</span></div></li><li><div id="_easyui_tree_20" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">休假中</span></div></li><li><div id="_easyui_tree_21" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">已离职</span></div></li><li><div id="_easyui_tree_22" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">已退休</span></div></li></ul></li></ul></div></div></body></html>