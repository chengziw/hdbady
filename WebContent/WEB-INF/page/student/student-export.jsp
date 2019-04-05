<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

<body style="padding:0px;margin:0px;">
    <form id="fm" style="height:378px; " method="post" data-href="${pageContext.request.contextPath}/studentAction_exportStudent.action">
        <div class="easyui-layout" fit="true" border="true">

            <div region="north" border="true" style="overflow:auto; padding:8px;height:308px; ">
                <table border="0" cellspacing="0" cellpadding="8">                   
                    <!-- <tr>
                        <td width="22%">所属学校：</td>
                        <td><input id="school_id" name="school_id" value="" validType="validateSchoolId" class="easyui-validatebox" style="width:260px;" data-options="novalidate:true"></td>
                    </tr> -->
                    <tr>
                        <td width="22%">所属班级：</td>
                        <td><input id="grade_id" name="current_grade_id" value="" class="easyui-validatebox" style="width:260px; " data-options="novalidate:true"></td>
                    </tr>
                    <!-- <tr>
                        <td width="22%">状态：</td>
                        <td><input id="status" name="status_name" value="" class="easyui-validatebox" style="width:260px; " data-options="novalidate:true"></td>
                    </tr> -->
                    <tr>
                        <td width="22%"><span><input type="checkbox" id="ckall" /> 全选资料项</span></td>
                        <td>
                              <span style="width:120px; display:block; float:left;"><input class="checkbox-default" type="checkbox" name="filed" value="name" onclick="return  false;" checked="checked"/> 学生姓名</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="student_no" /> 学号</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="sex" /> 性别</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="class_name" /> 班级</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="yearMonthDay" /> 生日</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="blood_type" /> 血型</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="interest" /> 兴趣爱好</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="phone" /> 家长手机</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="parent_name" /> 家长姓名</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="relationship" /> 家长关系</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="is_local" /> 本地生源</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="is_teacherson" /> 教职工子弟</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="enter_date" /> 入校日期</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="status_name_text" /> 状态</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="census_type" /> 户籍类型</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="address" /> 家庭住址</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="demand" /> 学生要求</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="health_status" /> 身体状况</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="is_allergy" /> 有无过敏史</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="commom_disease" /> 易患何种病</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="is_predisease" /> 有无先天病</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="is_health_form" /> 有无体检表</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="is_health_verify" /> 有无验证证明</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="is_ccine" /> 有否接种复印件</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="note" /> 学校备注</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="timetype_id" /> 就读方式</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="is_only_child" /> 独生子女</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="birthplace" /> 出生地</span>
                              <span style="width:120px; display:block; float:left;"><input type="checkbox" name="filed" value="identity_card" /> 身份证</span>
                        </td>
                    </tr>
                </table>
            </div>

            <div region="center" border="false" style="overflow:hidden;background-color:#E0ECFF; ">

                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                    <a id="save-btn" href="#" class="easyui-linkbutton" iconCls="icon-ok" onClick="saveImport()">导出</a>
                    <a href="#" class="easyui-linkbutton panel-tool-close" iconCls="icon-no" onClick="javascript:parent.$('#openWindow').window('close');">取消</a>
                </div>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821","gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[]}]},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed"},{"id":16,"name":"\u4e8c\u73ed"},{"id":27,"name":"\u4e09\u73ed"},{"id":62,"name":"fg"},{"id":63,"name":"454"},{"id":65,"name":"\u56db\u73ed"},{"id":72,"name":"\u516b\u73ed"},{"id":162,"name":"\u82d7\u82d7\u73ed"},{"id":208,"name":"23233"},{"id":235,"name":"\u591a\u798f\u591a\u5bff"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed"},{"id":18,"name":"\u4e8c\u73ed"},{"id":58,"name":"\u5c0f\u73ed2"},{"id":59,"name":"10\u73ed\u7ea7"},{"id":131,"name":"3432"},{"id":252,"name":"\u516b\u73ed"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed"},{"id":19,"name":"\u4e8c\u73ed"},{"id":24,"name":"\u4e09\u73ed"},{"id":178,"name":"\u4e94\u73ed"},{"id":206,"name":"\u56db\u73ed"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed"},{"id":20,"name":"\u4e8c\u73ed"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u5927\u73ed"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":1,"name":"\u6258\u73ed","pid":2,"children":[{"id":1,"name":"\u4e00\u73ed","pid":3},{"id":16,"name":"\u4e8c\u73ed","pid":3},{"id":27,"name":"\u4e09\u73ed","pid":3},{"id":62,"name":"fg","pid":3},{"id":63,"name":"454","pid":3},{"id":65,"name":"\u56db\u73ed","pid":3},{"id":72,"name":"\u516b\u73ed","pid":3},{"id":162,"name":"\u82d7\u82d7\u73ed","pid":3},{"id":208,"name":"23233","pid":3},{"id":235,"name":"\u591a\u798f\u591a\u5bff","pid":3}]},{"id":2,"name":"\u5c0f\u73ed","pid":2,"children":[{"id":2,"name":"\u4e00\u73ed","pid":3},{"id":18,"name":"\u4e8c\u73ed","pid":3},{"id":58,"name":"\u5c0f\u73ed2","pid":3},{"id":59,"name":"10\u73ed\u7ea7","pid":3},{"id":131,"name":"3432","pid":3},{"id":252,"name":"\u516b\u73ed","pid":3}]},{"id":3,"name":"\u4e2d\u73ed","pid":2,"children":[{"id":3,"name":"\u4e00\u73ed","pid":3},{"id":19,"name":"\u4e8c\u73ed","pid":3},{"id":24,"name":"\u4e09\u73ed","pid":3},{"id":178,"name":"\u4e94\u73ed","pid":3},{"id":206,"name":"\u56db\u73ed","pid":3}]},{"id":4,"name":"\u5927\u73ed","pid":2,"children":[{"id":4,"name":"\u4e00\u73ed","pid":3},{"id":20,"name":"\u4e8c\u73ed","pid":3}]},{"id":5,"name":"\u5b66\u524d\u73ed","pid":2,"children":[{"id":5,"name":"\u5927\u73ed","pid":3}]}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210"},{"id":7,"name":"1209"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208"},{"id":9,"name":"1207"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206"},{"id":11,"name":"1205"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204"},{"id":13,"name":"1203"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":6,"name":"\u6258\u7ba1\u73ed","pid":2,"children":[{"id":6,"name":"1210","pid":3},{"id":7,"name":"1209","pid":3}]},{"id":7,"name":"\u5c0f\u73ed","pid":2,"children":[{"id":8,"name":"1208","pid":3},{"id":9,"name":"1207","pid":3}]},{"id":8,"name":"\u4e2d\u73ed","pid":2,"children":[{"id":10,"name":"1206","pid":3},{"id":11,"name":"1205","pid":3}]},{"id":9,"name":"\u5927\u73ed","pid":2,"children":[{"id":12,"name":"1204","pid":3},{"id":13,"name":"1203","pid":3}]},{"id":10,"name":"\u5b66\u524d\u73ed","pid":2,"children":[{"id":14,"name":"1202","pid":3}]}]}]},{"id":6,"name":"\u9999\u683c\u91cc\u62c9\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":28,"name":"\u5c0f\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":29,"name":"\u4e2d\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":207,"name":"\u4e00\u73ed"}]},{"id":30,"name":"\u5927\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":28,"name":"\u5c0f\u73ed","pid":2,"children":[]},{"id":29,"name":"\u4e2d\u73ed","pid":2,"children":[{"id":207,"name":"\u4e00\u73ed","pid":3}]},{"id":30,"name":"\u5927\u73ed","pid":2,"children":[]}]}]},{"id":7,"name":"\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":35,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":36,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":37,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":38,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":39,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":35,"name":"\u6258\u73ed","pid":2,"children":[]},{"id":36,"name":"\u5c0f\u73ed","pid":2,"children":[]},{"id":37,"name":"\u4e2d\u73ed","pid":2,"children":[]},{"id":38,"name":"\u5927\u73ed","pid":2,"children":[]},{"id":39,"name":"\u5b66\u524d\u73ed","pid":2,"children":[]}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":54,"name":"\u4e00\u73ed"}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":40,"name":"\u6258\u7ba1\u73ed1","pid":2,"children":[{"id":54,"name":"\u4e00\u73ed","pid":3}]},{"id":41,"name":"456585684","pid":2,"children":[]},{"id":42,"name":"\u6258\u7ba1\u73ed3","pid":2,"children":[]},{"id":43,"name":"\u5927\u73ed","pid":2,"children":[]},{"id":44,"name":"\u5b66\u524d\u73ed","pid":2,"children":[]}]}]},{"id":9,"name":"\u53a6\u95e8\u9752\u82d7\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":45,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":46,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":47,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":48,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":49,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":45,"name":"\u6258\u73ed","pid":2,"children":[]},{"id":46,"name":"\u5c0f\u73ed","pid":2,"children":[]},{"id":47,"name":"\u4e2d\u73ed","pid":2,"children":[]},{"id":48,"name":"\u5927\u73ed","pid":2,"children":[]},{"id":49,"name":"\u5b66\u524d\u73ed","pid":2,"children":[]}]}]},{"id":10,"name":"\u4e34\u6c82\u5206\u6821","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":52,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":53,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":52,"name":"\u6258\u73ed","pid":2,"children":[]},{"id":53,"name":"\u5c0f\u73ed","pid":2,"children":[]}]}]},{"id":13,"name":"\u53f8\u5357\u5b66\u8f85","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":71,"name":"\u5c0f\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":72,"name":"\u4e2d\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":25,"name":"\u4e00\u73ed"}]}],"gradeComBoTreeData":[{"id":0,"name":"\u5168\u90e8\u5e74\u7ea7","children":[{"id":71,"name":"\u5c0f\u73ed","pid":2,"children":[]},{"id":72,"name":"\u4e2d\u73ed","pid":2,"children":[{"id":25,"name":"\u4e00\u73ed","pid":3}]}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    var url = $('#fm').attr('data-href'); // 导入地址

    /* 表单校验信息 */
    /* $.extend($.fn.validatebox.defaults.rules, {
        validateSchoolId: {
            validator: function(value){
                var schoolValue = $('#school_id').combobox("getValue");             
                return (isNaN(Number(schoolValue)) || Number(schoolValue) < 1? false: true);
            },
            message: '请选择一个学校'
        },
    }); */

    /* 导出信息 */
    function saveImport(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
		//alert("1");
        var gradeTree = $('#grade_id').combotree('tree'); //返回tree对象
        var gradeChecked = gradeTree.tree("getChecked"); // 年级id
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
        //alert("2");
        if(gradeIds =='' && classIds == ''){
            $.messager.alert('提示','请选择班级！','error');
            return false;
        }

        /* var statusTree = $('#status').combotree('tree');
        var statusChecked = statusTree.tree('getChecked');
        var statusIds = '';
        for(var i=0; i<statusChecked.length; i++){
            statusIds += (statusIds==''?'':',')+statusChecked[i]['id'];
        } */

        $('#save-btn').addClass('mylinkbtn-load');

        var url="${pageContext.request.contextPath}/studentAction_exportStudent.action";
        
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(params){
                params.grade_id = gradeIds;
                params.class_ids = classIds;
                params.statuss = "上面那个属性值";
                var flag = $(this).form('enableValidation').form('validate');
                if (flag == false) {
                    $('#save-btn').removeClass('mylinkbtn-load');
                } else {
                    loadWindow('show', '正在导出学生数据, 请稍后。。。');
                    //getExportStatus();
                    //$("#loading").remove();
                    setTimeout("parent.$('#openWindow').window('close')",1000)
                }
                return flag;
            },
            success: function(result){
            }
        });
    }

    /* 获取导出状态 */
/*     function getExportStatus() {
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
    } */

    $(function(){
        /* 全选事件 */
        $('#ckall').on('click', function(){
            if ($(this).prop('checked')) {
                $('input[name="filed"]').prop('checked', true);
            } else {
                $('input[name="filed"]').prop('checked', false);                
            }

            $('.checkbox-default').prop('checked', true);
        });

        /* 所属学校 */
       /*  $('#school_id').combobox({
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
        }); */

        /* 当前年级 */        
        $('#grade_id').combotree({
        	url:'${pageContext.request.contextPath}/studentAction_findGradeAndClass.action',
        	//url:'${pageContext.request.contextPath}/json/export.json',
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
        /* $('#status').combotree({
            data: [{id: 0, name: '全部状态', children:[{id: 1, name: '待分班'}, {id: 2, name: '待确认入学'}, {id: 3, name: '正常就读'}, {id: 4, name: '已休学'}, {id: 5, name: '已退学'}, {id: 6, name: '已毕业'}]}],
            valueField:'id',
            textField:'text',
            editable:false,
            animate:true,
            lines:true,
            panelHeight:200,
            multiple:true,
            value:0,
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            onLoadSuccess:function() {
                $('#status').combotree('setValue','全部状态');
            }
        }); */

        /* if(schoolJson.length > 1){
            $('#school_id').combobox('select', schoolJson[1]['id']);
        } */
    });
</script>
<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>
</body>
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
</html>