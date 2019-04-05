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


    <form id="fm" style="height:378px; " method="post" data-href="${pageContext.request.contextPath}/studentAction_exportStudent.action" class="panel-noscroll">
        <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 1366px; height: 378px;">

            <div class="panel layout-panel layout-panel-north" style="width: 1366px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 1348px; height: 290px;" title="" class="panel-body panel-body-noheader layout-body">
                <table cellspacing="0" cellpadding="8" border="0">                   
                    <tbody>
                   <tr>
                   <td width="22%">所属学校：</td>
                        <td><input id="school_id" validtype="validateSchoolId" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" style="width: 260px; display: none;" data-options="novalidate:true" textboxname="school_id" comboname="school_id"><span class="textbox combo" style="width: 258px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 232px;" value="Dear宝贝示范幼儿园" type="text"><input class="textbox-value" name="school_id" value="1" type="hidden"></span></td>
                  </tr>
                    <tr>
                        <td width="22%">所属班级：</td>
                        <td><input id="grade_id" class="easyui-validatebox validatebox-text combotree-f combo-f textbox-f" style="width: 260px; display: none;" data-options="novalidate:true" textboxname="current_grade_id" comboname="current_grade_id"><%-- <span class="textbox combo" style="width: 258px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 232px;" value="全部年级" type="text"><input class="textbox-value" name="current_grade_id" value="全部年级" type="hidden"></span> --%></td>
                    </tr>
                    <tr>
                        <td width="22%">状态：</td>
                        <td><input id="status" value="0" class="easyui-validatebox validatebox-text combotree-f combo-f textbox-f" style="width: 260px; display: none;" data-options="novalidate:true" textboxname="status_name" comboname="status_name"><%-- <span class="textbox combo" style="width: 258px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 232px;" value="全部状态" type="text"><input class="textbox-value" name="status_name" value="全部状态" type="hidden"></span> --%></td>
                    </tr>
                    <tr>
                        <td width="22%"><span><input id="ckall" type="checkbox"> 全选资料项</span></td>
                        <td>
                          <span style="width:120px; display:block; float:left;"><input class="checkbox-default" name="filed[]" value="name" disabled="disabled" checked="checked" type="checkbox"> 姓名</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="english_name" type="checkbox"> 英文名</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="student_no" type="checkbox"> 学号</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="sex" type="checkbox"> 性别</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="school_name" type="checkbox"> 学校</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="class_name" type="checkbox"> 班级</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="birthday" type="checkbox"> 生日</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="blood_type" type="checkbox"> 血型</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="interest" type="checkbox"> 兴趣爱好</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="phone" type="checkbox"> 家长手机</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="parent_name" type="checkbox"> 家长姓名</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="is_local" type="checkbox"> 本地生源</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="is_teacherson" type="checkbox"> 教职子弟</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="enter_date" type="checkbox"> 入校日期</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="end_date" type="checkbox"> 离校日期</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="status" type="checkbox"> 状态</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="census_type" type="checkbox"> 户籍类型</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="address" type="checkbox"> 家庭住址</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="demand" type="checkbox"> 学生要求</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="health_status" type="checkbox"> 身体状况</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="is_allergy" type="checkbox"> 有无过敏史</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="commom_disease" type="checkbox"> 易患何种病</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="is_predisease" type="checkbox"> 有无先天病</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="is_health_form" type="checkbox"> 有无体检表</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="is_health_verify" type="checkbox"> 有无验证证明</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="is_ccine" type="checkbox"> 有否接种复印件</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="note" type="checkbox"> 学校备注</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="timetype_id" type="checkbox"> 就读方式</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="is_only_child" type="checkbox"> 是否是独生子女</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="birthplace" type="checkbox"> 出生地</span>
                          <span style="width:120px; display:block; float:left;"><input name="filed[]" value="identity_card" type="checkbox"> 身份证</span>
                                      </td>
         </tr>
                </tbody></table>
            </div></div>

            <div class="panel layout-panel layout-panel-center" style="width: 1366px; left: 0px; top: 307px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 1366px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                    <a id="save-btn" href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-ok" onclick="saveImport()" group="">导出</a>
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
                </div>
            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
    </form>

<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821","gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[]}]},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":1,"name":"\u6258\u73ed","pid":2,"children":[{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)","pid":3},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)","pid":3},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)","pid":3}]},{"id":2,"name":"\u5c0f\u73ed","pid":2,"children":[{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)","pid":3},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)","pid":3}]},{"id":3,"name":"\u4e2d\u73ed","pid":2,"children":[{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)","pid":3},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)","pid":3},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)","pid":3}]},{"id":4,"name":"\u5927\u73ed","pid":2,"children":[{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)","pid":3},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)","pid":3}]},{"id":5,"name":"\u5b66\u524d\u73ed","pid":2,"children":[{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)","pid":3}]}]}]},{"id":2,"name":"Dear\u5b9d\u8d1d\u3010\u5357\u5c71\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":6,"name":"\u6258\u73ed","pid":2,"children":[{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)","pid":3},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)","pid":3}]},{"id":7,"name":"\u5c0f\u73ed","pid":2,"children":[{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)","pid":3},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)","pid":3}]},{"id":8,"name":"\u4e2d\u73ed","pid":2,"children":[{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)","pid":3},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)","pid":3}]},{"id":9,"name":"\u5927\u73ed","pid":2,"children":[{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)","pid":3},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)","pid":3}]},{"id":10,"name":"\u5b66\u524d\u73ed","pid":2,"children":[{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)","pid":3},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)","pid":3}]}]}]},{"id":8,"name":"\u5317\u4eac\u52b1\u5fb7\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":41,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":40,"name":"\u6258\u73ed","pid":2,"children":[]},{"id":41,"name":"\u5c0f\u73ed","pid":2,"children":[]},{"id":42,"name":"\u4e2d\u73ed","pid":2,"children":[]},{"id":43,"name":"\u5927\u73ed","pid":2,"children":[]},{"id":44,"name":"\u5b66\u524d\u73ed","pid":2,"children":[]}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    var url = $('#fm').attr('data-href'); // 导入地址

    /* 表单校验信息 */
    $.extend($.fn.validatebox.defaults.rules, {
        validateSchoolId: {
            validator: function(value){
            	var schoolValue = $('#school_id').combobox("getValue");             
                return (isNaN(Number(schoolValue)) || Number(schoolValue) < 1? false: true); 
                var gradeValue = $('#grade_id').combobox("getValue");             
                return (isNaN(Number(gradeValue)) || Number(gradeValue) < 1? false: true);
            },
            message: '请选择班级'
        },
    });

    /* 导出信息 */
    function saveImport(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
	
        var gradeTree = $('#grade_id').combotree('tree'); //返回tree对象
        var gradeChecked = gradeTree.tree("getChecked"); //年级id
        if(! gradeChecked){
            $.messager.alert('提示','请选择班级！','error');
            return false;
        }
 
        var gradeIds = '';
        var classIds = '';
        for(var i=0; i<gradeChecked.length; i++){
            if(gradeChecked[i]['pid'] == 2){//年级
                gradeIds += (gradeIds==''?'':',')+gradeChecked[i]['id'];
            }else if(gradeChecked[i]['pid'] == 3){//班级
                classIds += (classIds==''?'':',')+gradeChecked[i]['id'];
            }
        }
        if(gradeIds =='' && classIds == ''){
            $.messager.alert('提示','请选择班级！','error');
            return false;
        }
	
        var statusTree = $('#status').combotree('tree');
        var statusChecked = statusTree.tree('getChecked');
        var statusIds = '';
        for(var i=0; i<statusChecked.length; i++){
            statusIds += (statusIds==''?'':',')+statusChecked[i]['id'];
        }

        $('#save-btn').addClass('mylinkbtn-load');
        
        var url="${pageContext.request.contextPath}/studentAction_exportStudent.action";
	
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(params){
                params.grade_id = gradeIds;
                params.class_id = classIds;
                params.status = statusIds;
                var flag = $(this).form('enableValidation').form('validate');
                if (flag == false) {
                    $('#save-btn').removeClass('mylinkbtn-load');
                } else {
                    loadWindow('show', '正在导出学生数据, 请稍后。。。');
                    getExportStatus();                    
                }
                return flag;
            },
            success: function(result){
            }
        });
    }

    /* 获取导出状态 */
    function getExportStatus() {
        $.ajax({
            url: "${pageContext.request.contextPath}/studentAction_getExportStatus.action",
            type: 'POST',
            dataType: 'json',
            data: {},
            success: function(data){
                if (data.status == true){
                    loadWindow('close');
                    $('#save-btn').removeClass('mylinkbtn-load');
                    parent.$('#openWindow').window('close');
                    parent.window.closeWinIsReloadData = 1;
                } else {
                    getExportStatus();
                }
            }
        });        
    }

    $(function(){
        /* 全选事件 */
        $('#ckall').on('click', function(){
            if ($(this).prop('checked')) {
                $('input[name="filed[]"]').prop('checked', true);
            } else {
                $('input[name="filed[]"]').prop('checked', false);                
            }

            $('.checkbox-default').prop('checked', true);
        });

        /* 所属学校 */
          $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            value: '',
            onLoadSuccess:function(){
            },
            onSelect: function(record) {
                if(record.gradeComBoTreeData){
                    $('#grade_id').combotree('loadData', record.gradeComBoTreeData);
                }else{
                    $('#grade_id').combotree('loadData', [{id: 0, name: '全部年级'}]);
                }
            }           
        });

        /* 当前年级 */        
        $('#grade_id').combotree({
        	url:'${pageContext.request.contextPath}/gradeAction_findAllGradesToSearch.action',
        	data: [{id: 0, name: '全部年级'}],
            valueField:'id',
            textField:'name',
            editable:false,
            animate:true,
            lines:true,
            panelHeight:200,
            multiple:true,
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            onLoadSuccess:function() {
                $('#grade_id').combotree('setValue','全部年级');
            }
        });

        /* 状态 */
        $('#status').combotree({
            data: [{id: 0, name: '全部状态', children:[{id: 1, name: '待分班'}, {id: 2, name: '待确认入学'}, {id: 3, name: '正常就读'}, {id: 4, name: '已休学'}, {id: 5, name: '已退学'}, {id: 6, name: '已毕业'}]}],
            valueField:'id',
            textField:'text',
            editable:false,
            animate:true,
            lines:true,
            panelHeight:200,
            multiple:true,
            value:'全部状态',
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            onLoadSuccess:function() {
                $('#status').combotree('setValue','全部状态');
            }
        });

         if(schoolJson.length > 1){
            $('#school_id').combobox('select', schoolJson[1]['id']);
        } 
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">全部学校</div><div id="_easyui_combobox_i1_1" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_2" class="combobox-item">Dear宝贝【南山】幼儿园</div><div id="_easyui_combobox_i1_3" class="combobox-item">北京励德幼儿园</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id=""><ul class="tree tree-lines"><li><div id="_easyui_tree_9" class="tree-node tree-root-one tree-node-last"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">全部年级</span></div><ul style="display:block"><li><div id="_easyui_tree_10" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">托班</span></div><ul style="display:block"><li><div id="_easyui_tree_11" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">一班(2016年入学)</span></div></li><li><div id="_easyui_tree_12" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">二班(2016年入学)</span></div></li><li><div id="_easyui_tree_13" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">三班(2016年入学)</span></div></li></ul></li><li><div id="_easyui_tree_14" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">小班</span></div><ul style="display:block"><li><div id="_easyui_tree_15" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">一班(2015年入学)</span></div></li><li><div id="_easyui_tree_16" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">二班(2015年入学)</span></div></li></ul></li><li><div id="_easyui_tree_17" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">中班</span></div><ul style="display:block"><li><div id="_easyui_tree_18" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">一班(2014年入学)</span></div></li><li><div id="_easyui_tree_19" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">二班(2014年入学)</span></div></li><li><div id="_easyui_tree_20" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">三班(2014年入学)</span></div></li></ul></li><li><div id="_easyui_tree_21" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">大班</span></div><ul style="display:block"><li><div id="_easyui_tree_22" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">一班(2013年入学)</span></div></li><li><div id="_easyui_tree_23" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">二班(2013年入学)</span></div></li></ul></li><li><div id="_easyui_tree_24" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">学前班</span></div><ul style="display:block"><li><div id="_easyui_tree_25" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">一班(2012年入学)</span></div></li></ul></li></ul></li></ul></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id=""><ul class="tree tree-lines"><li><div id="_easyui_tree_2" class="tree-node tree-root-one tree-node-last"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">全部状态</span></div><ul style="display:block"><li><div id="_easyui_tree_3" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">待分班</span></div></li><li><div id="_easyui_tree_4" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">待确认入学</span></div></li><li><div id="_easyui_tree_5" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">正常就读</span></div></li><li><div id="_easyui_tree_6" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">已休学</span></div></li><li><div id="_easyui_tree_7" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">已退学</span></div></li><li><div id="_easyui_tree_8" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">已毕业</span></div></li></ul></li></ul></div></div></body></html>