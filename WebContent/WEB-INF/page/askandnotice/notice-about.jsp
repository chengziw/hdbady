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
    .pushRange0{}
    .pushRange1{padding: 0 0 0 15px;}
    .pushRange2{padding: 0 0 0 15px;}

</style>

<body style="padding:0px;margin:0px;">
<form id="ff" method="post" style="height:598px;" data-href="/notice/save.html?id=30&sinKey=e49a%25E6%25A89%2515U%2510%2525%2596%25BA%25DCqX%258B%25B1%2525%255Dj%2502%25E3%25C9%2507z.A%25A3%2589f%253D%25BFj%253E%25FA%25BA%25EB_%2526%25EAKa">
    <div class="easyui-layout" fit="true" border="true">

        <div region="north" border="true" style="overflow:auto; padding:8px;height:528px; ">
            <input type="hidden" name="id" value="" class="easyui-validatebox">
            <table width="100%" border="0" cellspacing="0" cellpadding="8">
                <tr>
                    <td>
                        <div style="display: inline">
                            通知级别：<input id="notice_type" name="notice_type" readonly="true" value="" class="easyui-combobox" data-options="panelHeight:'auto',novalidate:true">
                        </div>
                        <div id="school_box" style="display: inline">
                            &nbsp;&nbsp;所属学校：<input id="school_id" name="school_id" readonly="true"  value="" class="easyui-combobox" data-options="panelHeight:'auto',novalidate:true">
                        </div>
                        <div id="targetman_box" style="display: inline">
                            &nbsp;&nbsp;推送对象：<input id="targetman_type" name="targetman_type" readonly="true"  value="" class="easyui-combobox" data-options="panelHeight:'auto',novalidate:true">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="60" align="left" valign="top">手机推送：</td>
                                <td width="200" valign="top" style="position: relative">
                                    <div id="push_range" style="border-radius:5px;padding:8px;border:1px solid #95B8E7; height:160px; overflow:auto;"></div>
                                    <div style="height: 176px; position: absolute; top: 0px; left: 0px; width:180px;"></div>
                                </td>
                                <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通知标题：<input id="title" name="title" readonly="true"  value="<s:property value="notice.title"/>" required="true" style="width: 80%;" class="easyui-textbox" data-options="novalidate:true"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通知内容：<input id="desc" name="desc" readonly="true"  value="<s:property value="notice.descs"/>" required="true" style="height: 140px;width: 80%;" class="easyui-textbox" data-options="multiline:true,novalidate:true"></p>
                                </td>
                            </tr>    
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-top:1px solid #CCCCCC;">
                            <tr>
                                <td width="50%" valign="top">
                                    <p>已阅读人员(共<span id="user_view_num"></span>人)</p>
                                    <!--数据表开始-->
                                    <table id="user_view" class="easyui-datagrid" style="height:200px; width:96%;"
                                           data-options="
                                           url:'${pageContext.request.contextPath}/noticeAction_findCheck.action?id=<s:property value="notice.id"/>',
                                           fitColumns:true,onLoadSuccess: userViewSuccess,
                                           singleSelect:true,checkOnSelect:true">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'show_name',width:150">用户</th>
                                            <th data-options="field:'view_time_name',width:120">阅读时间</th>
                                        </tr>
                                        </thead>
                                    </table>
                                    <!--数据表结束-->
                                </td>
                                <td width="50%" valign="top">
                                    <p>未阅读人员(共<span id="user_noview_num"></span>人)</p>
                                    <!--数据表开始-->	
                                    <table id="user_noview" class="easyui-datagrid" style="height:200px;"
                                           data-options="
                                           url:'${pageContext.request.contextPath}/noticeAction_findNoCheck.action?id=<s:property value="notice.id"/>',
                                           fitColumns:true,onLoadSuccess: userNoviewSuccess,
                                           singleSelect:true,checkOnSelect:true">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'show_name',width:150">用户</th>
                                            <th data-options="field:'view_time_name',width:120">阅读时间</th>
                                        </tr>
                                        </thead>
                                    </table>
                                    <!--数据表结束-->
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>

        <div region="center" border="false" style="overflow:hidden;background-color:#E0ECFF; ">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <!--<a href="#" id="save-btn" class="easyui-linkbutton" iconCls="icon-save" onclick="saveFrom()">保存</a>-->
                <a href="#" class="easyui-linkbutton panel-tool-close" iconCls="icon-no" onClick="javascript:parent.$('#openWindow').window('close',true);">关闭</a>
            </div>
        </div>

    </div>
</form>
</body>

<script type="text/javascript">

var schoolJson = eval('([{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[]},{"id":7,"name":"\u5e7c\u513f\u56ed","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]},{"id":9,"name":"\u53a6\u95e8\u9752\u82d7\u5e7c\u513f\u56ed","gradeList":[]},{"id":10,"name":"\u4e34\u6c82\u5206\u6821","gradeList":[]},{"id":13,"name":"\u53f8\u5357\u5b66\u8f85","gradeList":[]}])');


var noticeAllowClassJson = eval('([16,27,62,63,65,72,162,2,18,58,131,3,19,24,178,4,20])');

var noticeAllowSchoolJson = eval('([1])');

function userViewSuccess(data){
    $('#user_view_num').html(data.total);
}

function userNoviewSuccess(data){
    $('#user_noview_num').html(data.total);
}
/**
 * 通知级别 切换 获取推送范围
 */
var getPushRangeStatus = 1;
function getPushRange(id,schoolId){
    var schoolId = schoolId == undefined ? 0 : schoolId;
    $('#push_range').html('');
    var url = '/notice/get-push-range.html';
    var data = {id:id,school_id:schoolId};
    $.ajax({
        url:url,
        data:data,
        type:'POST',
        dataType:'JSON',
        success:function(result){
            var html = '';
            if(result.status == 1){
                var data = result.info;
                //html += setFamilyInput(data);
                html = '<ul id="pushRangeTree"></ul>';
                var setEasyUiTree = 1;
            }else{
                html += '没有相关信息，请联系客服人员！';
                var setEasyUiTree = 0;
            }
            $('#push_range').html(html);
            if(setEasyUiTree){
                $('#pushRangeTree').tree({
                    data:data,
                    idField:'id',
                    textField: 'text',
                    animate:true,
                    checkbox:true,
                    lines:true,
                    formatter:function(node){
                        node.text = node.name;
                                if(noticeAllowSchoolJson.length>0&&node.pid == 0&&(node.id == -1 || node.id == 0)){
                                    node.checked = true;
                                }
                                if(noticeAllowClassJson.indexOf(parseInt(node.id)) != -1&&node.pid == 2){
                                    node.checked = true;
                                }
                                                return node.text;
                    }
                });
            }
        }
    });
}

/**
 * 递归构造 推送范围 input
 */
function setFamilyInput(data,pid,children){

    var pid = pid == undefined ? 0 : pid;
    var children = children == undefined ? 'children' : children;
    var html = '';
    var num = data.length;
    for(var i=0;i<num;i++){
        html += pid != 2 ? '<div class="pushRange'+pid+'" pid="'+pid+'">' : (pid == 2 && i == 0 ? '<div class="pushRange'+pid+'" pid="'+pid+'">' : '');
        html += '<label>';
        html += '<input type="checkbox" class="push_range" name="push_range'+pid+'['+data[i]['id']+']" value="'+data[i]['id']+'">';
        html += data[i]['name'];
        html += '</label>';
        html += data[i][children] ? setFamilyInput(data[i][children],pid+1) : '';
        html += (pid == 2 && i == num-1) ? '</div>' : '';   //三级，
        html += pid <= 1 ? '</div>' : '';   //一级，二级
    }
    
    return html;
}

$(function(){
    $('#school_id').combobox({
        data:schoolJson,
        editable:false,
        valueField:'id',
        textField:'name',
        required: true,
        novalidate:true,
        value:'1',
        onLoadSuccess:function(){
            //school_Id.combobox("setValue",'请选择学校');
        },
        onSelect:function(record){
            $('#targetman_box').hide();
            notice_type.combobox('setValue',2);
            getPushRange(2,record.id)
        }
    });

    /* 通知级别 */
    var noticeTypeData = [
        {id:1,name:"集团级通知"},{id:2,name:"学校级通知",selected:true}    ];
    var notice_type = $('#notice_type').combobox({
        data: noticeTypeData,
        editable:false,
        valueField:'id',
        textField:'name',
        value:'请选择通知级别',
        onSelect:function(record){
            if(record.id == 1){
                $('#school_box').hide();
                $('#targetman_box').show();
                getPushRange(record.id);
            }else if(record.id == 2){
                $('#school_box').show();
                $('#targetman_box').hide();
                $('#push_range').html('');
                if(parseInt(school_Id.combobox("getValue")) > 0){
                    getPushRange(2,school_Id.combobox("getValue"));
                }
            }
        }
    })

    /* 推送对象 */
    var targetmanTypeData = [
        {id:1,name:"仅家长"},{id:2,name:"仅教职工"},{id:3,name:"教职工和家长",selected:true}    ];
    var targetman_type = $('#targetman_type').combobox({
        data: targetmanTypeData,
        editable:false,
        valueField:'id',
        textField:'name',
        value:'请选择推送对象'
    })


    $(document).on('click','input.push_range',function(){
        var pid = $(this).closest('div').attr('pid');
        var objDiv = $(this).closest('div.pushRange'+pid);
        var checked = $(this).prop('checked');
        switch(pid){
            case '0':    //一级 推送范围
                if(checked){
                    objDiv.find('input.push_range').prop('checked',true);
                }else{
                    objDiv.find('input.push_range').prop('checked',false);
                }
                break;
            case '1':    //二级 推送范围
                if(checked){
                    objDiv.find('input.push_range').prop('checked',true);//所有班级选中
                    //如果全部年级选中了， 勾选学校
                    var is_all1_check = true;
                    objDiv.closest('div.pushRange0').find('div.pushRange1').each(function(){
                        if(!$(this).find('input.push_range:eq(0)').prop('checked')){
                            is_all1_check = false;
                        }
                    })
                    if(is_all1_check){//勾选学校
                        objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',true);
                    }
                }else{
                    objDiv.find('input.push_range').prop('checked',false);  //所有班级取消选中
                    objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',false);//取消学校选中
                }
                break;
            case '2':    //三级 推送范围
                //如果全部班级都选中了， 勾选年级
                if(checked){
                    var is_all2_check = true;
                    objDiv.find('input.push_range').each(function(){
                        if(!$(this).prop('checked')){
                            is_all2_check = false;
                        }
                    })
                    if(is_all2_check){ //勾选年级
                        objDiv.closest('div.pushRange1').find('input.push_range:eq(0)').prop('checked',true);
                        //如果全部年级选中了， 勾选学校
                        var is_all1_check = true;
                        objDiv.closest('div.pushRange0').find('div.pushRange1').each(function(){
                            if(!$(this).find('input.push_range:eq(0)').prop('checked')){
                                is_all1_check = false;
                            }
                        })
                        if(is_all1_check){//勾选学校
                            objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',true);
                        }
                    }
                }else{
                    objDiv.closest('div.pushRange1').find('input.push_range:eq(0)').prop('checked',false);//取消年级选中
                    objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',false);//取消学校选中
                }
                break;
            default :
                break;
        }
    })

    /** 编辑默认 **/
            $('#targetman_box').hide();
        getPushRange(2,1);
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i5_0" class="combobox-item">集团级通知</div><div id="_easyui_combobox_i5_1" class="combobox-item combobox-item-selected">学校级通知</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i4_0" class="combobox-item">全部学校</div><div id="_easyui_combobox_i4_1" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i4_2" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i4_3" class="combobox-item">红太阳幼儿园</div><div id="_easyui_combobox_i4_4" class="combobox-item">幼儿园</div><div id="_easyui_combobox_i4_5" class="combobox-item">司南学辅1</div><div id="_easyui_combobox_i4_6" class="combobox-item">厦门青苗幼儿园</div><div id="_easyui_combobox_i4_7" class="combobox-item">临沂分校</div><div id="_easyui_combobox_i4_8" class="combobox-item">司南学辅</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i6_0" class="combobox-item">仅家长</div><div id="_easyui_combobox_i6_1" class="combobox-item">仅教职工</div><div id="_easyui_combobox_i6_2" class="combobox-item combobox-item-selected">教职工和家长</div></div></div></body></html>