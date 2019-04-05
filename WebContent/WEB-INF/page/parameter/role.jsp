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
    
    <div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">    

        <!--工具按钮和筛选栏目开始-->
        <div class="easyui-layout" fit="true" border="false">
            <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:148px; padding-right:0px;" border="false">
                                                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addUserRole()">创建自定义角色</a>
                            </div>
            <!--工具栏结束-->

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：

                <!-- <input id="school_id" value="" style="cursor:pointer;" class="easyui-combobox" data-options="panelHeight:'auto',novalidate:true"> -->                                
                <input id="type" value="" style="cursor:pointer;" class="easyui-combobox" data-options="panelHeight:'auto',novalidate:true">                                
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->

    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">        
        
        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
        					 
               data-options="url:'${pageContext.request.contextPath}/roleAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
               singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
            <thead>
            <tr>
                <th data-options="field:'name',width:80"><span id =name>角色名称</span></th>
                <th data-options="field:'type_label',width:80">角色类型</th>
                <th data-options="field:'scope',width:140, formatter: setRole">可管理的数据范围</th>
                <th data-options="field:'user_names',width:140, formatter: setUser">成员列表</th>
                <th data-options="field:'teacher_name',width:80">创建者</th>
                <th data-options="field:'create_time',width:120">创建时间</th>
                <th data-options="field:'edit',width:180, formatter: formatOper">操作</th>
            </tr>
            </thead>
        </table>
        <!--数据表结束-->
            
    </div>

</div>
<script type="text/javascript">

/* 转换PHPJSON为JS JSON格式 */
var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]}]';
schoolJson = eval('('+schoolJson+')');

var hasEditPermission = 'true';
hasEditPermission = eval('('+hasEditPermission+')');

var hasDeletePermission = 'true';
hasDeletePermission = eval('('+hasDeletePermission+')');


/* 重新查询 */
function doSearch(){
    $('#tt').datagrid('load',{
        //school_id: $('#school_id').combobox("getValue"),
        type: $('#type').combobox("getValue"),
        tag:'1'
    });
}

function setRole(val,row,index){
	
	return "请在“设置权限”中查看";
}

function setUser(val,row,index){
	
	return "请在“成员管理”中查看";
}

/* 格式化操作列 */
function formatOper(val,row,index){
    var editBtn = '';
    var editModuleBtn = '';
    var listBtn = '';
    var deleteBtn = '';

    if (hasEditPermission) {
        editBtn = '<a onclick="editUserRole('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
            '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
            '</a>';

        editModuleBtn = '<a onclick="editUserRoleModules('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">设置权限</span>' +
            '<span class="l-btn-icon icon-quanxian">&nbsp;</span></span>' +
            '</a>';

        listBtn = '<a onclick="userList('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">成员管理</span>' +
            '<span class="l-btn-icon icon-chengyuan">&nbsp;</span></span>' +
            '</a>';
    }

    if (hasDeletePermission) {

        deleteBtn = '<a onclick="deleteUserRole('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">删除</span>' +
            '<span class="l-btn-icon icon-cancel">&nbsp;</span></span>' +
            '</a>';
    }

    var optionsStr = "{listBtn}{editModuleBtn}{editBtn}{deleteBtn}";

    if (row.type == 88) {
        optionsStr = optionsStr.replace('{editBtn}', editBtn);
    } else {
        optionsStr = optionsStr.replace('{editBtn}', '');
        optionsStr = optionsStr.replace('{deleteBtn}', '');
        if (row.type == 0) {
            editModuleBtn = '';
            deleteBtn = '';
        }
    }    
    
    optionsStr = optionsStr.replace('{editModuleBtn}', editModuleBtn);            
    optionsStr = optionsStr.replace('{deleteBtn}', deleteBtn);
    optionsStr = optionsStr.replace('{listBtn}', listBtn);

    return optionsStr;
}

/* 添加角色 */
function addUserRole(addUrl) {
	
	 var url = '${pageContext.request.contextPath}/roleAction_add.action';
    openTopWindow(url, '创建自定义角色', 500, 328, 'closeReload');
}

/* 删除一个角色 */
function deleteUserRole(index) {
	
    $('#tt').datagrid('selectRow', index);// 关键在这里  
    var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
    var id = row.id;
    var url = '${pageContext.request.contextPath}/roleAction_delete.action?id='+id+'';
    if (row && row.type == 88){
        openTopWindow(url, '删除自定义角色', 500, 278, 'closeReload');
    }
}

/* 编辑角色的权限 */
function editUserRoleModules(index) {
	
    $('#tt').datagrid('selectRow', index);// 关键在这里  
    var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
    var id = row.id;
    var url = '${pageContext.request.contextPath}/roleAction_editPower.action?id='+id+'';
    if (row){
        if (row.type != 0) {
            openTopWindow(url, '编辑角色权限', 528, 478, 'closeNoReload');
        }
    }
}

/* 编辑自定义角色 */
function editUserRole(index) {

    $('#tt').datagrid('selectRow', index);// 关键在这里  
    var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
    var id = row.id;
    var url = '${pageContext.request.contextPath}/roleAction_editName.action?id='+id+'';
    if (row){
        openTopWindow(url, '编辑自定义角色', 500, 328, 'closeReload');
    }
}

/* 编辑成员列表 */
function userList(index) {

	$('#tt').datagrid('selectRow', index);// 关键在这里  
    var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
    var id = row.id;
    var url = '${pageContext.request.contextPath}/roleAction_editMember.action?id='+id+'';
    if (row){
        var actionUrl = row.type == 2? row.user_list: row.edit_admins_url;
        var title = row.type == 2? '班级管理员-成员管理': (row.type == 1 ? '学校管理员-成员管理' : (row.type == 88 ? '自定义角色-成员管理' : '全局管理员-成员管理'));
        openTopWindow(url, title, 800, 478, 'closeReload');
    }
}

/* 关闭弹窗时, 不重新刷新数据 */
function closeNoReload() {
    // $('#tt').datagrid('load',{});
}

/* 关闭弹窗时, 重新刷新数据 */
function closeReload() {
    $('#tt').datagrid('load',{});
}

$(function(){
    /*// 状态学校列表数据 
    $('#school_id').combobox({
        data: schoolJson,
        editable:false,
        valueField:'id',
        textField:'name',
        required: true,
        onLoadSuccess:function(){
            $('#school_id').combobox("setValue", '');
            var data = $('#school_id').combobox('getData');

            if (data.length == 2) {
                $('#school_id').combobox('select', data[1].id);                    
            }
        }
    }); */

    $('#type').combobox({
        data: [{'id': '', 'name' : '全部角色类型'}, {'id': 12306, 'name' : '系统内置'}, {'id': 88, 'name' : '用户自定义'}],
        editable:false,
        valueField:'id',
        textField:'name',
        required: true, 
        onLoadSuccess:function(){           
          //$('#type').combobox("setValue", '全部角色类型');
        },                   
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