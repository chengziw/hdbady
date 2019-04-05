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


<div class="easyui-layout" fit="true">

    <div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">

        <!--工具按钮和筛选栏目开始-->
        <div id="tb" class="easyui-layout" fit="true" border="false">

            <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:148px; padding-right:0px;" border="false">
                <!--<a href="#" onclick="javascript:openParentWindow();return false;" class="easyui-linkbutton" iconCls="icon-help">打开父类窗口</a>-->
                					<shiro:hasPermission name="page_check_teacher-vacation-add">
                                    	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="addVacation();">录入教职工请假</a>
                                    </shiro:hasPermission>
                            </div>
            <!--工具栏结束-->

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：

                <!-- <input id="school_id" name="school_id" value="" class="easyui-validatebox" data-options="novalidate:true"> -->
				&nbsp;&nbsp;请假日期：
                <input id="start_time" name="start_time" value="" class="easyui-validatebox" data-options="novalidate:true, width: 100,editable: false"> 至
                <input id="end_time" name="end_time" value="" class="easyui-validatebox" data-options="novalidate:true, width: 100,editable: false">
                &nbsp;&nbsp;<input id="type" name="type" value="" class="easyui-validatebox" data-options="novalidate:true, width: 100,panelHeight:'auto'">
                <!-- <input id="vacation_status" name="vacation_status" value="" class="easyui-validatebox" data-options="novalidate:true, width: 100,panelHeight:'auto'"> -->
                <input id="check_status" name="check_status" value="" class="easyui-validatebox" data-options="novalidate:true, width: 100,panelHeight:'auto'">
                <input id="teacher_name" name="teacher_name" value="" class="easyui-textbox easyui-validatebox" data-options="novalidate:true, width: 120, prompt:'请输入教职工姓名'">
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="closeReload();return false;">查询</a>
            </div>
            <!--筛选条件结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->
    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
               data-options="fitColumns:true,fit:true,pagination:true,
               singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true,
               onLoadSuccess: dataLoadSuccess,
        	   url:'${pageContext.request.contextPath}/teacherVacationAction_pageQuery.action',method:'get'">
            <thead>
            <tr>
            	<th data-options="field:'school_name', width:0"></th>
                <th data-options="field:'teacher_name',width:80, formatter:setTeacherName">姓名</th>
                <th data-options="field:'sex_label',width:50, formatter:setSexName">性别</th>
                <th data-options="field:'duty_name',width:80, formatter:setStructureName">职务</th>
                <th data-options="field:'type',width:80, formatter:setTypeLabel">类型</th>
                <th data-options="field:'reason',width:120">请假说明</th>
                <th data-options="field:'start_time',width:120">请假开始时间</th>
                <th data-options="field:'end_time',width:120">请假结束时间</th>
                <th data-options="field:'apply_name',width:60">申请人</th>
                <th data-options="field:'apply_phone',width:80">申请人手机号</th>
                <th data-options="field:'apply_time',width:120">申请时间</th>
                <th data-options="field:'check_techer_name',width:60">审核人</th>
                <th data-options="field:'check_time',width:120">审核时间</th>
                <th data-options="field:'status_label',width:110,formatter:setStatusColor">审核状态</th>
                <th data-options="field:'check_note',width:100">备注</th>
                <th data-options="field:'edit',width:80, formatter: formatOper">操作</th>
            </tr>
            </thead>
        </table>
        <!--数据表结束-->

    </div>

</div>
<script type="text/javascript">
    var hasDestroyPermission = 'true';
    hasDestroyPermission = eval('('+hasDestroyPermission+')');

    var hasApprovalPermission = 'true';
    hasApprovalPermission = eval('('+hasApprovalPermission+')');

    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"},{"id":62,"name":"fg(2016\u5e74\u5165\u5b66)"},{"id":63,"name":"454(2016\u5e74\u5165\u5b66)"},{"id":65,"name":"\u56db\u73ed(2016\u5e74\u5165\u5b66)"},{"id":72,"name":"\u516b\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"},{"id":58,"name":"\u5c0f\u73ed2(2015\u5e74\u5165\u5b66)"},{"id":59,"name":"10\u73ed\u7ea7(2015\u5e74\u5165\u5b66)"},{"id":131,"name":"3432(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u5927\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    var vacationTeacherTypeJson = '[{"id":"","name":"\u5168\u90e8\u8bf7\u5047\u7c7b\u578b"},{"id":1,"name":"\u75c5\u5047"},{"id":2,"name":"\u4e8b\u5047"},{"id":3,"name":"\u5a5a\u5047"},{"id":4,"name":"\u4e27\u5047"},{"id":5,"name":"\u4ea7\u5047"},{"id":6,"name":"\u5176\u4ed6\u5047"}]';
    vacationTeacherTypeJson = eval('('+vacationTeacherTypeJson+')');

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
    	var thLength = $('#tt tr:first').find('th').length;
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: thLength })

            $(this).closest('div.datagrid-wrap').find('div.datagrid-pager').hide();
        }
    }

    /**
     * 回调 函数
     */
    function closeReload(){
        $('#tt').datagrid('reload',{
            /* school_id: $('#school_id').combobox('getValue'), */
            start_time: $('#start_time').datebox('getValue'),
            end_time: $('#end_time').datebox('getValue'),
            type: $('#type').combobox('getValue'),
            /* status: $('#vacation_status').combobox('getValue'), */
            status: $('#check_status').combobox('getValue'),
            teacher_name: $('#teacher_name').val(),
            tag:'1'
        });
    }

    /* 录入老师请假申请 */
    function addVacation(){
    	var url = '${pageContext.request.contextPath}/teacherVacationAction_add.action';
        openTopWindow(url, '录入教职工请假申请', 660, 320, 'closeReload');
    }

    /* 请假审批 */
    function approvalVacation(index){
        $('#tt').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if (row){
        	var id = row.id;
        	var url = "${pageContext.request.contextPath}/teacherVacationAction_check.action?id="+id+"";
            openTopWindow(url, '教职工请假审核', 300, 300, 'closeReload');
        }
    }

    /* 销假审批 */
    function destroyVacation(index){

        $('#tt').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象

        if (row){
        	var id = row.id;
        	var url = "${pageContext.request.contextPath}/teacherVacationAction_destroy.action?id="+id+"";
            openTopWindow(url, '教职工销假审核', 300, 300, 'closeReload');
        }
    }
    
    function setTeacherName(value, rec) 
    { 
   		 return rec.teacher!= null ? rec.teacher.teacher_name : ""; 
    }
    function setSexName(value, rec) 
    { 
    	return rec.teacher!= null ? rec.teacher.sex_name : ""; 
    }
    function setStructureName(value, rec) 
    { 
   	 if(rec.teacher != null){
    		if(rec.teacher.structure != null){
    			return rec.teacher.structure.name;
    		}
    	}
    	return "";
    }
    function setTypeLabel(value, rec) 
    {
    	state = value;
        var rs = '';
        if(value == 1 ){
            rs += '<span style="color:red;">病假</span>';
        }else if(value == 2){
            rs += '<span style="color:blue;">事假</span>';
        }else if(value == 3){
            rs += '<span style="color:green;">婚假</span>';
        }else if(value == 4){
            rs += '<span style="color:green;">丧假</span>';
        }else if(value == 5){
            rs += '<span style="color:green;">产假</span>';
        }else if(value == 6){
            rs += '<span style="color:green;">其他假</span>';
        }
        return rs;
    }
    
    /* 设置状态文字颜色 */
    function setStatusColor(value,row,index){
        var color = '';
		var text = '';
        if(row.status == 1){
            color = 'red';
            text = '待审核';
        }else if(row.status == 2){
            color = 'blue';
            text = '未通过';
        }else if(row.status == 3){
            color = 'green';
            text = '已批准';
        }else if(row.status == 4){
            color = 'blue';
            text = '未销假';
        }else if(row.status == 5){
            color = 'green';
            text = '已销假';
        }

        var rs = '<span style="color:'+color+';">'+text+'</span>';
        return rs;
    }
    

    /* 格式化操作列 */
    function formatOper(val,row,index){
        var approvalBtn = '';
        var destroyBtn = '';

        if (row.check_status == 1) {
            if (hasApprovalPermission) {
               <shiro:hasPermission name="page_check_teacher-vacation-check">
                approvalBtn = '<a onclick="approvalVacation('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">审核</span>' +
                    '<span class="l-btn-icon icon-shenhe">&nbsp;</span></span>' +
                    '</a>';
          	   </shiro:hasPermission>
            	
            }

        } else if(row.check_status == 2) {
            if (hasDestroyPermission) {
            	<shiro:hasPermission name="page_check_teacher-vacation-destroy">
                destroyBtn = '<a onclick="destroyVacation('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">销假审核</span>' +
                    '<span class="l-btn-icon icon-shenhe">&nbsp;</span></span>' +
                    '</a>';
           	   </shiro:hasPermission>
            	
            }
        }

        var optionsStr = "{editBtn}{destroyBtn}";

        optionsStr = optionsStr.replace('{editBtn}', approvalBtn);
        optionsStr = optionsStr.replace('{destroyBtn}', destroyBtn);
        return optionsStr;
    }

    $(function () {
        /* 学校 */
        /* $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            value: '',
            onLoadSuccess:function(){
            },
            onSelect: function(record) {
            }
        }); */

        /* 请假类型 */
        $('#type').combobox({
            data: vacationTeacherTypeJson,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){

            }
        });

        /* 休假状态 */
        /* $('#vacation_status').combobox({
            data: [{id: '全部请假状态', name: '全部请假状态'}, {id: 1, name: '休假未开始'}, {id: 2, name: '休假中'}, {id: 3, name: '休假完成'}],
            editable:false,
            valueField:'id',
            textField:'name',
            value:'全部请假状态',
            onLoadSuccess:function(){

            }
        }); */

        /* 审批状态 */
        $('#check_status').combobox({
            data: [{id: '全部审核状态', name: '全部审核状态'}, {id: 1, name: '待审核'}, {id: 2, name: '未通过'}, {id: 3, name: '已批准'}, {id: 4, name: '未销假'}, {id: 5, name: '已销假'}],
            editable:false,
            valueField:'id',
            textField:'name',
            value:'全部审核状态',
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
            buttons: change_time_end
        });

        $('#end_time').datebox({
            buttons: change_time_end
        });
    })
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