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
    
    <script type="text/javascript" src="js/outOfBounds.js"></script>
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
    
    <div region="north" border="false" style="padding:10px;height:100px; padding-top:16px; padding-bottom:0px; overflow:hidden;">    

        <!--工具按钮和筛选栏目开始-->
        <div id="tb" class="easyui-layout" fit="true" border="false">
                        <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:188px; padding-right:18px;" border="false">
				<shiro:hasPermission name="page_class_class_add">
               		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="addClass();">新建班级</a>
                </shiro:hasPermission>
                <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-tj_fangwei2" plain="false" onclick="batchAddClass();">批量建班</a> -->

            </div> 
		
            <!--工具栏结束-->
            
            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：

                <!-- <input id="school_id" name="school_id" value="" class="easyui-validatebox" data-options="panelHeight:'auto',novalidate:true" style="cursor:pointer; width:140px;"> -->
                <input id="grade" name="grade_id" value="" class="easyui-validatebox" data-options="panelHeight:'auto',novalidate:true" style="cursor:pointer; width:80px;">
                <input id="status" name="status_label" value="" class="easyui-validatebox" data-options="panelHeight:'auto',novalidate:true" style="cursor:pointer; width:80px;">
                <input id="start_date" name="start_label" value="" class="easyui-validatebox" data-options="panelHeight:'auto',novalidate:true" style="cursor:pointer; width:100px;">
                <input id="class_type" name="type_label" value="" class="easyui-validatebox" data-options="panelHeight:'auto',novalidate:true" style="cursor:pointer; width:100px;">
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->            
        </div>
        <!--工具按钮和筛选栏目结束-->

    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">
        
        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
        data-options="url:'${pageContext.request.contextPath}/classesAction_pageQuery.action',singleSelect:true,checkOnSelect:false,
        fitColumns:true,fit:true,pagination:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:false,method:'get', onLoadSuccess: dataLoadSuccess">
            <thead>
                <tr>
                    <th data-options="field:'school_name',width:0" sortable="true"></th>
                    <th data-options="field:'grade_name',width:60, formatter:setGrade" sortable="true">当前年级</th>
                    <th data-options="field:'class_name',width:60" sortable="true">班级</th>                    
                    <th data-options="field:'class_type',width:60, formatter:setClassType" sortable="true">类型</th>
                    <th data-options="field:'start_label',width:80" sortable="true">入学年份(学期)</th>
                    <th data-options="field:'end_label',width:80" sortable="true">毕业年份(学期)</th>
                    <th data-options="field:'next_upgrade_time',width:80" sortable="true">下次升级日期</th>
                    <th data-options="field:'status_label',width:60, formatter: setStatusColor" sortable="true">状态</th>
                    <th data-options="field:'teacher_name',width:100, formatter:setTeacher" sortable="true">班主任</th>
                    <th data-options="field:'create_time',width:120" sortable="true">录入时间</th>
                    <th data-options="field:'test',width:120, formatter: rowformater">操作</th>
                    
                    
                </tr>
            </thead>
        </table>
        <!--数据表结束-->
            
    </div>
</div>

<script type="text/javascript">

    var isEdit  = false; // 选择行的时候是否是要编辑, 解决跟checkbox冲突的问题

    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u3010\u5b9d\u5b89\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":28,"name":"\u5c0f\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":29,"name":"\u4e2d\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":30,"name":"\u5927\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    var classTypeJson = '[{"id":"","name":"\u5168\u90e8\u7c7b\u578b"},{"id":1,"name":"\u666e\u901a\u73ed"},{"id":2,"name":"\u7f8e\u672f\u73ed"},{"id":3,"name":"\u821e\u8e48\u73ed"},{"id":4,"name":"\u7279\u957f\u73ed"},{"id":17,"name":"\u7b97\u672f\u73ed"}]';
    classTypeJson = eval('('+classTypeJson+')');

    /* 开学可选的年份 */
    var myDate = new Date();

    var currentYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
    
    /* 开学年份 */
    var openClassYearItems = [{id: '全部入学年份', value: '全部入学年份'}];
    for (var i = currentYear ; i >= 2010; i--) {
        var tempJson = {id: i, value: i + '年'};
        openClassYearItems.push(tempJson);
    };

    /* 重新查询 */
    function doSearch(){
        $('#tt').datagrid('load',{
            //school_id: $('#school_id').combobox("getValue"),
            grade_id: $('#grade').combobox("getValue"),
            status_label: $('#status').combobox("getValue"),
            start_label: $('#start_date').combobox("getValue"),
            type_label: $('#class_type').combobox("getValue"),
            tag:'1'
        });
    }

    /* 关闭弹窗时, 重新刷新数据 */
    function closeReload() {
        doSearch();
    }
        
    /* 初始化管理 */
    function dataLoadSuccess(data) {
        if (data.rows.length == 0) {
            $('#tt').datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: 11 })
        }
    }
    
    function setGradeName(value, rec) 
    { 
   		 return rec.grade != null ? rec.grade.name : ""; 
    }

    function setTeacher(value, rec) 
    { 
   		 return rec.teacher != null ? rec.teacher.teacher_name : ""; 
    }
    
    function setClassTypeName(value, rec) 
    { 
   		 return rec.classType != null ? rec.classType.type_name : ""; 
    }

    /* 设置状态文字颜色 */
    function setStatusColor(value,row,index){
        var color = '';
        if(row.status == 1 ){
            color += 'green';
        }else if(row.status == 2){
            color += 'blue';
        }else if(row.status == 3){
            color += 'red';
        }
        var rs = '<span style="color:'+color+';">'+row.status_label+'</span>';
        return rs;
    }
    
    function setGrade(value, rec) 
    { 
   	 	return rec.grade!= null ? rec.grade.name : ""; 
    }
   
    function setClassType(value, rec) 
    { 
   	 	return rec.classType!= null ? rec.classType.type_name : ""; 
    }

    /* 格式化操作列 */
    function rowformater(value,row,index){
        var editBtn = '';
        var dismissBtn = '';
            //if (row.status == 1) {
        <shiro:hasPermission name="page_class_class_edit">  	
            editBtn = '<a onclick="editClass('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                        '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                        '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                        '</a>';
        </shiro:hasPermission> 
                        
        //}

        /* 根据解散班级的url是否为空来确定是否有解散班级的按钮 */
        //if (row.dismiss_url != undefined && row.dismiss_url.length > 0) {
            dismissBtn = '<a onclick="dismissClass('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">删除</span>' +
                    '<span class="l-btn-icon icon-cancel">&nbsp;</span></span>' +
                    '</a>';
        //}
        //alert(editBtn);
        var optionsStr = editBtn+dismissBtn;
        
        /* var optionsStr = "{editBtn}{dismissBtn}";

        optionsStr = optionsStr.replace('{editBtn}', editBtn);
        optionsStr = optionsStr.replace('{dismissBtn}', dismissBtn); */
        return optionsStr;
    }

    /* 新建班级 */
    function addClass(){
    	var url = '${pageContext.request.contextPath}/page_class_class-add.action';
        openTopWindow(url, '新建班级', 550, 488, 'closeReload');
    }

    function batchAddClass(){
    	var url = '${pageContext.request.contextPath}/page_class_class-batch-add.action';
        openTopWindow(url, '批量建班', 800, 588, 'closeReload');
    }

    /* 编辑班级 */
    function editClass(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
       	var url = '${pageContext.request.contextPath}/classesAction_edit.action?id='+id+'';
       	
        isEdit = true;
        $('#tt').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if (row){
            openTopWindow(url, '编辑班级', 550, 428, 'closeReload');
        }
        isEdit = false;
    }


    /* 解散班级 */
    function dismissClass(index) {
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
       	var url = '${pageContext.request.contextPath}/classesAction_delete.action?id='+id+'';
    	
        isEdit = true;
        $('#tt').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if (row){
            if (row.studentNumber > 0) {
                alert('该班还有' + row.studentNumber + '个学生，调走所有学生后，才能删除');
            } else {
                openTopWindow(url, '删除班级', 580, 270, 'closeReload');
            }
        }
        isEdit = false;
    }

    $(function(){
        /* $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            required: true, 
            onLoadSuccess:function(){
                $('#school_id').combobox("setValue", '');
                var data = $('#school_id').combobox('getData');
            },
            onSelect: function(record) {
                if (record.gradeList != undefined) {
                    $('#grade').combobox("loadData", record.gradeList);
                } else {
                    $('#grade').combobox("loadData", [{id: '', name: '全部年级'}]);
                }
            }           
        }); */
  
        $('#grade').combobox({
        	url:'${pageContext.request.contextPath}/gradeAction_findAllGradesToSearch.action',
            //data: [{id: '全部年级', name: '全部年级'}],
            editable:false,
            valueField:'id',
            textField:'name',
            required: true, 
            onLoadSuccess:function(){           
                $('#grade').combobox("setValue", '');
            }              
        });

        $('#status').combobox({
            data: [{id: '全部状态', name: '全部状态'}, {id: '正常在校', name: '正常在校'}, {id: '已毕业', name: '已毕业'}],
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            onLoadSuccess:function(){           
                $('#status').combobox("setValue", '全部状态');
            }                 
        });

        $('#start_date').combobox({
            data: openClassYearItems,
            editable:false,
            valueField:'id',
            textField:'value',
            required: true, 
            onLoadSuccess:function(){           
                $('#start_date').combobox("setValue", '全部入学年份');
            }                 
        });

        $('#class_type').combobox({
           	url :'${pageContext.request.contextPath}/classTypeAction_findAllClassTypeToSelect.action',
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                $('#class_type').combobox("setValue", '全部类型');
            }
        });
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