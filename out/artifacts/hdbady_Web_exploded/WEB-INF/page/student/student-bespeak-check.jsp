<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<script type="text/javascript">

</script>
<style type="text/css">
    .fitem{ line-height: 30px; }
    .lad_text{ font-size: 12px; width: 70px; display: inline-block;}
    .span_text{ font-size: 12px; color: #999;}
    .span_text2{ font-size: 12px;}
</style>


<form id="ff" method="post" style="height:298px;" data-href="/student-bespeak/save-change-bespeak.html" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 706px; height: 298px;">

        <div class="panel layout-panel layout-panel-north" style="width: 706px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 688px; height: 210px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="680" cellspacing="0" cellpadding="8" border="0">
				<input name="id" id="id" value="<s:property value="studentBespeak.id"/>" readonly="true" type="hidden" style："border:none"/></td>             
                <tbody><tr>
                    <td colspan="2" style="border-bottom:1px solid #dedede;" valign="top" height="30">
                  <label><input name="status_name" checked="true" value="3" type="radio"> 同意，学生注册入学</label></td>
                    <td colspan="4" style="border-bottom:1px solid #dedede;" valign="top">
                        <label><input name="status_name" value="4" type="radio"> 不同意</label>
                  </td>
                </tr>

                <tr>
                    <td valign="bottom" height="30">学生姓名：</td>
                    <td valign="bottom"><s:property value="studentBespeak.name"/></td>
                    <td valign="bottom" align="right">性别：</td>
                    <td valign="bottom"><s:property value="studentBespeak.sex"/></td>
                    <td valign="bottom" align="right">学生生日：</td>
                    <td valign="bottom"><s:property value="studentBespeak.yearMonthDay"/></td>
                </tr>

                <tr>
                    <td valign="bottom">预约学校：</td>
                    <td valign="bottom"><span id="school_name">Dear宝贝示范幼儿园</span></td>
                    <td valign="bottom" align="right">年级：</td>
                    <td valign="bottom"><input id="grade_id" name="grade_id"  value="<s:property value="studentBespeak.classes.grade.name"/>" data-options="panelHeight:'120'" style="width: 100px; display: none;" class="combobox-f combo-f textbox-f" textboxname="grade_id" comboname="grade_id"></td>
                    <td valign="bottom" align="right">就读班级：</td>
                  <td valign="bottom"><input id="class_id" name="class_id" value="<s:property value="studentBespeak.classes.class_name"/>" data-options="panelHeight:'120'" style="width: 168px; display: none;" class="combobox-f combo-f textbox-f" textboxname="class_id" comboname="class_id"></td>
                </tr>

                <tr>
                    <td valign="middle" height="30">学校备注：</td>
                    <td colspan="5" valign="bottom">
                        <input id="note" value="<s:property value="studentBespeak.note"/>" class="easyui-textbox textbox-f" data-options="" style="width: 552px; display: none;" textboxname="note">
                  </td>
                </tr>

                <tr>
                    <td colspan="6">
                        <span style="color:red;font-size:12px;" id="show-error-message-box"></span>
                    </td>
                </tr>
          </tbody></table>
        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 706px; left: 0px; top: 227px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 706px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
    $(function(){
        var schoolJson = eval('([{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"\u6258\u7ba1\u73ed2","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]}]}])');
        var schoolId = 1;
        var gradeId = 2;
        var classId = "";
        var gradeJson = [];
        var classJson = [];

        for(var i=0; i > schoolJson.length; i++){
            if(schoolJson[i]['id'] == schoolId){
                $('#school_name').html(schoolJson[i]['name']);
                gradeJson = schoolJson[i]['gradeList'];
                for(var j=0; j < gradeJson.length; j++){
                    if(gradeJson[j]['id'] == gradeId){
                        $('#grade_name').html(gradeJson[j]['name']);
                        classJson = gradeJson[j]['classList'];
                    }
                }
            }
        }

        //年级
        $('#grade_id').combobox({
        	data:[{id:'',name:"请选择"}],
        	url:'${pageContext.request.contextPath}/gradeAction_findAllGrades.action',
 			valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
            },
            onSelect:function(record){
            	$('#class_id').combobox({data:record.classList,value:'',disabled:false});
            	var id = record.id;
            	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeId.action?id='+id+'';
            	$('#class_id').combobox('reload', url);
            }
        });

        //班级
        $('#class_id').combobox({
        	data:[{id:'',name:"请选择"}],
        	valueField:'id',
            textField:'name',
            disabled:false,//不能编辑:true
            editable:false,
            onLoadSuccess:function(){
            }
        });

    })

    function saveFrom(){
    	
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

        var url = $("#ff").attr('data-href');

        $('#ff').form('submit',{
        	url:'${pageContext.request.contextPath}/studentBespeakAction_checkBespeakStudent.action',
            onSubmit:function(){
                var result = $(this).form('enableValidation').form('validate');
                if(!result){
                    $('#save-btn').removeClass('mylinkbtn-load');
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
                    //window.parent.showMessage('提示信息', result.info);
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                }
            }
        });
    }
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">请选择</div><div id="_easyui_combobox_i1_1" class="combobox-item">托班</div><div id="_easyui_combobox_i1_2" class="combobox-item combobox-item-selected">小班</div><div id="_easyui_combobox_i1_3" class="combobox-item">中班</div><div id="_easyui_combobox_i1_4" class="combobox-item">大班</div><div id="_easyui_combobox_i1_5" class="combobox-item">学前班</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item combobox-item-selected">请选择</div><div id="_easyui_combobox_i2_1" class="combobox-item">一班(2015年入学)</div><div id="_easyui_combobox_i2_2" class="combobox-item">二班(2015年入学)</div></div></div></body></html>