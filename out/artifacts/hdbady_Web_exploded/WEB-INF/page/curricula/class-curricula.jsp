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


<div class="easyui-layout" fit="true">
    
    <div region="north" border="false" style="padding:10px;height:100px; padding-top:16px; padding-bottom:0px; overflow:hidden;">    

        <!--工具按钮和筛选栏目开始-->
        <div id="tb" class="easyui-layout" fit="true" border="false">
                        <!--工具栏开始-->
                <!--<a href="#" onclick="javascript:openParentWindow();return false;" class="easyui-linkbutton" iconCls="icon-help">打开父类窗口</a>-->
			<shiro:hasPermission name="page_kebiao_class-curricula_add">
            	<div id="main_body_tool" region="west" style="width:108px; padding-right:18px;" border="false">
      	          	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="addClassCurricula();">新建课程表</a>
            	</div>
			</shiro:hasPermission>
            <!--工具栏结束-->
            
            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：
                <!-- <input id="school_id" name="school_id" value="" class="easyui-validatebox" data-options="novalidate:true" style="width:140px; cursor:pointer;"> -->
                <input id="grade_id" name="classes.grade.id" value="" class="easyui-validatebox" data-options="novalidate:true,panelHeight:'auto'" style="width:80px; cursor:pointer;">
                <input id="class_id" name="classes.id" value="" class="easyui-validatebox" data-options="novalidate:true,panelHeight:'auto'" style="width:150px; cursor:pointer;">
                <input id="table_year" name="table_year" value="" class="easyui-validatebox" data-options="novalidate:true,panelHeight:'auto'" style="width:80px; cursor:pointer;">
                <input id="status" name="sort_label" value="" class="easyui-validatebox" data-options="novalidate:true,panelHeight:'auto'" style="width:80px; cursor:pointer;">
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->

    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">
        
        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
        data-options="fitColumns:true,fit:true,pagination:true,
			   onLoadSuccess: dataLoadSuccess,
			   pageList:[15,20,25,30,40,50,100],pageSize:25,
			   rownumbers:true,checkOnSelect:true,singleSelect: true,
             url:'${pageContext.request.contextPath}/curriculaTableAction_pageQuery.action',method:'get'">
             
            <thead>
                <tr>
                    <th data-options="field:'school_name',width:0" sortable="true"></th>
                    <th data-options="field:'grade_name',width:60, formatter:setGradeName" sortable="true">年级</th>
                    <th data-options="field:'class_name',width:100, formatter:setClassName" sortable="true">班级名称(入学年)</th>
                    <th data-options="field:'table_year',width:100, formatter:setTextShow" sortable="true">课表学年(学期)</th>
                    <!--<th data-options="field:'term_type_label',width:60" sortable="true">学期</th>-->
                    <!-- <th data-options="field:'valid_time',width:100">有效时间</th> -->
                    <!--<th data-options="field:'version',width:100">版本</th>-->
                    <th data-options="field:'sort_label', width:60, formatter:setStatusColor" sortable="true">状态</th>
                    <th data-options="field:'publish_time_label',width:100" sortable="true">发布时间</th>
                    <th data-options="field:'edit',width:180, formatter: formatOper">操作</th>
                </tr>
            </thead>
        </table>
        <!--数据表结束-->
            
    </div>
</div>
<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"-1","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u3010\u5b9d\u5b89\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"-1","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"-1","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"-1","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"-1","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"-1","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"-1","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[{"id":"-1","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":28,"name":"\u5c0f\u73ed","sort":1,"classList":[{"id":"-1","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":29,"name":"\u4e2d\u73ed","sort":2,"classList":[{"id":"-1","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":30,"name":"\u5927\u73ed","sort":3,"classList":[{"id":"-1","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    var isDeleteIng = false; // 正在删除
    var isPublishIng = false; // 正在发布

    function setStatusColor(val,row,index){
        var color = '';
        if(row.sort_label == '已发布'){
            color += 'green';
        }else{
            color += 'red';
        }

        var rs = '<span style="color:'+color+';">'+row.sort_label+'</span>';

        return rs;
    }
    
    function setClassName(value, rec) 
    { 
   	 	return rec.classes!= null ? rec.classes.class_name : ""; 
    }
   
    function setGradeName(value, rec) 
    { 
   	 if(rec.classes != null){
    		if(rec.classes.grade != null){
    			return rec.classes.grade.name;
    		}
    		return "";
    	}
    	return "";
    }

    function setTextShow(val,row,index){
         var rs = row.table_year;
        if(row.isCurrentTerm){
            rs += '('+row.term_type_label+') <span style="color:red;">当前<span>';
        }else{
            rs += '<span style="">'+row.term_type_label+'<span>';
        }
        return rs; 
    }

    /* 格式化操作列 */
    function formatOper(val,row,index){
        var editBtn = '';
        var deleteBtn = '';
        var publishBtn = '';

        previewBtn = '<a onclick="previewClassCurricula('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查看</span>' +
            '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
            '</a>';

        //if (row.version == 0) {
        	<shiro:hasPermission name="page_kebiao_class-curricula_edit">
                editBtn = '<a onclick="editclassCurricula('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                     '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                     '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                     '</a>';
            </shiro:hasPermission>
            <shiro:hasPermission name="page_kebiao_class-curricula_delete">
                deleteBtn = '<a onclick="deleteClassCurricula('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
	                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">删除</span>' +
	                '<span class="l-btn-icon icon-cancel">&nbsp;</span></span>' +
	                '</a>';
	        </shiro:hasPermission>
	        <shiro:hasPermission name="page_kebiao_class-curricula_publish">
                        if(row.sort < 1){
                publishBtn = '<a onclick="publishClassCurricula('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">发布</span>' +
                    '<span class="l-btn-icon icon-redo">&nbsp;</span></span>' +
                    '</a>';
            		}
            </shiro:hasPermission>
        //} else {
                        /*if (row.children != undefined) {
                editBtn = '<a onclick="editclassCurricula('+row.id+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">修改课程表</span>' +
                    '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                    '</a>';
            }*/
                    //}

        var optionsStr = "{previewBtn}{editBtn}{deleteBtn}{publishBtn}";

        optionsStr = optionsStr.replace('{editBtn}', editBtn);
        optionsStr = optionsStr.replace('{previewBtn}', previewBtn);
        optionsStr = optionsStr.replace('{deleteBtn}', deleteBtn);
        optionsStr = optionsStr.replace('{publishBtn}', publishBtn);
        return optionsStr;
    }

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: 7 })
        }
    }

    /* 重新查询 */
    function doSearch(){
        $('#tt').datagrid('load',{
            //school_id: $('#school_id').combobox("getValue"),
            grade_id: $('#grade_id').combobox("getValue"),
            class_id: $('#class_id').combobox("getValue"),
            table_year: $('#table_year').combobox("getValue"),
            sort_label: $('#status').combobox("getValue"),
            tag:'1'
        });
    }
    /* 关闭后刷新列表 */
    function closeReload() {
        doSearch();
    }

    /* 新建班级课程表 */
    function addClassCurricula(index){
    
    	var url = '${pageContext.request.contextPath}/curriculaTableAction_add.action';
        openTopWindow(url, '新建班级课程表', 1200, 678, 'closeReload');
    }

    /* 编辑班级课程表 */
    function editclassCurricula(index) {
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        
		var id = row.id;
        var url ='${pageContext.request.contextPath}/curriculaTableAction_edit.action?id='+id+'';
 
        if (row){
            openTopWindow(url, '编辑班级课程表', 1200, 678, 'closeReload');
        }
    }

    /* 删除班级课程表 */
    function deleteClassCurricula(index) {
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        
		var id = row.id;
        var url ='${pageContext.request.contextPath}/curriculaTableAction_deleteCurriculaTable.action?id='+id+'';
        if (row){
            if (confirm("确认要删除吗？ 一经删除则无法恢复！")) {
                if (isDeleteIng == false) {
                    isDeleteIng = true;
                    $.ajax({
                        url:url,
                        type:'POST',
                        dataType:'JSON',
                        success:function(result){
                            isDeleteIng = false;
                            if (result.errMeg){
                                //window.parent.showMessage('操作失败', result.errMeg);
                                $.messager.alert('操作失败',result.errMeg,'error');
                            } else {
                                doSearch();
                            }
                        }
                    });
                }
            }
        }
    }

    /* 发布班级课程表 */
    function publishClassCurricula(index) {
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        
		var id = row.id;
        var url ='${pageContext.request.contextPath}/curriculaTableAction_publishCurriculaTable.action?id='+id+'';
        
        if (row){
            //if (confirm("确认要发布吗？ 一经删除则无法撤销！")) {
                if (isPublishIng == false) {
                    isPublishIng = true;
                    $.ajax({
                        url:url,
                        type:'POST',
                        dataType:'JSON',
                        success:function(result){
                            isPublishIng = false;
                            if (result.errMeg){
                                //window.parent.showMessage('操作失败', result.errMeg);
                                $.messager.alert('操作失败',result.errMeg,'error');
                            } else {
                                doSearch();
                            }
                        }
                    });
                }
           //}
        }
    }

    /* 查看班级课程表 */
    function previewClassCurricula(index) {
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        //console.log(node);
       	var id = row.id;
        
        var url ='${pageContext.request.contextPath}/curriculaTableAction_look.action?id='+id+'';
        if (row){
            openTopWindow(url, '查看班级课程表', 1000, 478, 'closeReload');
        }
    }    

    $(function(){
    	//年级
        $('#grade_id').combobox({
 			url:'${pageContext.request.contextPath}/gradeAction_findAllGradesToSearch.action',
 			//data:[{id:'',name:"全部年级"}],
 			valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                //$('#grade_id').combobox("setValue","全部年级");
            },
            onSelect:function(record){
            	$('#class_id').combobox({data:record.classList,value:'',disabled:false});
            	var id = record.id;
            	if(id==""){
            		$('#class_id').combobox({
                        disabled:true,//不能编辑:true
                        editable:false,
                    });
            		
            	}
            	else{
            	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeIdToSearch.action?id='+id+'';
            	$('#class_id').combobox('reload', url);
            	}
            	
            }
        });

        //班级
        $('#class_id').combobox({
            //data:[{id:'',name:"全部班级"}],
        	valueField:'id',
            textField:'name',
            disabled:true,//不能编辑:true
            editable:false,
            onLoadSuccess:function(){
                //$('#class_id').combobox("setValue","全部班级");
            }
        });

        /* 学校ID */
       /*  $('#school_id').combobox({
            data: schoolJson,
            valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                var data = $('#school_id').combobox('getData');
                if (data.length > 0) {
                    $('#school_id').combobox('select', data[0].id);
                }
            },
            onSelect: function(record) {
                if (record.gradeList != undefined) {
                    $('#grade_id').combobox('loadData',record.gradeList);
                } else {
                    $('#grade_id').combobox('loadData', [{id: '-1', name: '全部年级'}]);
                }
            }
        }); */

        /* 开学可选的年份 */
        var myDate = new Date();

        var currentYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)

        /* 开学年份 */
        var openClassYearItems = [{id: '全部学年', name: '全部学年'}];
        for (var i = 2015; i <= currentYear; i++) {
            var tempJson = {id: i, name: i+'学年'};
            openClassYearItems.push(tempJson);
        };

        /* 年份 */
        $('#table_year').combobox({
            data: openClassYearItems,
            valueField:'id',
            textField:'name',
            editable:false,
            value: '全部学年',
            onLoadSuccess:function(){
            },
            onSelect: function(record) {
            }
        });

        /* 状态 */
        $('#status').combobox({
            data: [{id: '全部状态', name: '全部状态'}, {id: '未发布', name: '未发布'}, {id: '已发布', name: '已发布'}],
            valueField:'id',
            textField:'name',
            value: '全部状态',
            editable:false,
            onLoadSuccess:function(){
            },
            onSelect: function(record) {
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