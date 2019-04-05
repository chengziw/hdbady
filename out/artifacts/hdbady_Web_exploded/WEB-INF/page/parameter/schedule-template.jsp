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
        <div id="tb" class="easyui-layout" fit="true" border="false">
            <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:148px; padding-right:0px; display:none;" border="false">
                                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="addScheduleTemplate('/schedule-template/add.html')">新建课程表参数设置</a>
                            </div>
            <!--工具栏结束-->

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">
                <!--<input id="school_id" name="school_id" value="" class="easyui-validatebox" data-options="novalidate:true">               
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>-->提示：课程表设置参数更改后，对应学校的当前学期课程表会统一应用新的设置参数
            </div> 
            <!--筛选条件结束-->   
        </div>
        <!--工具按钮和筛选栏目结束-->
    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">
        
        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
        data-options="fitColumns:true,fit:true,pagination:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,
       onLoadSuccess: dataLoadSuccess,singleSelect:true,
        url:'${pageContext.request.contextPath}/scheduleAction_pageQuery.action',method:'get'">
            <thead>
                <tr>
                    <th data-options="field:'morning_has_num',width:60">上午课数</th>
                    <th data-options="field:'morning_start',width:80">上午开课时间</th>
                    <th data-options="field:'afternoon_has_num',width:60">下午课数</th>
                    <th data-options="field:'afternoon_start',width:80">下午开课时间</th>
                    <th data-options="field:'duration',width:60">课时长</th>
                    <th data-options="field:'rest_duration',width:60">课间休息</th>
                    <th data-options="field:'week_type_label',width:100,formatter: setweek_type_label">补课类型</th>
                    <th data-options="field:'edit',width:120, formatter: formatOper">操作</th>
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

    var hasChangeStatusPermission = 'true';
    hasChangeStatusPermission = eval('('+hasChangeStatusPermission+')');

    var hasEditPermission = 'true';
    hasEditPermission = eval('('+hasEditPermission+')');

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录

            if ($("td[field='school_name']:eq(0)").is(":visible") == false) {
                $(this).datagrid('appendRow', { grade: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                    .datagrid('mergeCells', { index: 0, field: 'grade', colspan: 3 })
            } else {
                $(this).datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                    .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: 4 })
            }

            $(this).closest('div.datagrid-wrap').find('div.datagrid-pager').hide();
        }
    }
    
    /* 格式化操作列 */
    function formatOper(val,row,index){
        var editBtn = '';
        var statusBtn = '';

        if (hasEditPermission) {
            editBtn = '<a onclick="editScheduleTemplate('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                '</a>';
        }

        if (hasChangeStatusPermission) {
            if (row.type == 1) {
                if (row.status == 0) {
                    statusBtn = '<a onclick="enableCheduleTemplate('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                        '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">启用</span>' +
                        '<span class="l-btn-icon icon-start">&nbsp;</span></span>' +
                        '</a>';
                } else {
                    statusBtn = '<a onclick="enableCheduleTemplate('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                        '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">禁用</span>' +
                        '<span class="l-btn-icon icon-stop">&nbsp;</span></span>' +
                        '</a>';
                }
            }
        }

        var optionsStr = "{editBtn}{statusBtn}";

        optionsStr = optionsStr.replace('{editBtn}', editBtn);
        optionsStr = optionsStr.replace('{statusBtn}', statusBtn);

        return optionsStr;
    }
    
    function setweek_type_label(value, rec) 
    { 
   	 if(rec.week_type_label == 1){
   		
   		 return "周六和周日无补课";
   	 }
   	if(rec.week_type_label == 2){
   		
  		 return "仅周六补课";
  	 }
   	if(rec.week_type_label == 3){
   		
 		 return "仅周日补课";
 	 }
   	if(rec.week_type_label == 4){
   		
 		 return "周六和周日都补课";
 	 }
    }

    /* 关闭弹窗时, 重新刷新数据 */
    function closeReload() {
        $('#tt').datagrid('load');
    }

    /* 编辑课程表模板 */
    function editScheduleTemplate(index) {
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
    	var url = '${pageContext.request.contextPath}/scheduleAction_edit.action?id='+id+'';
    	
        if (row){
            openTopWindow(url, '课程表参数设置', 840, 538, 'closeReload');
        }
    }

    /* 启用或者禁用课程表模板 */
    function enableCheduleTemplate(index) {
        $('#tt').datagrid('selectRow', index);// 关键在这里  
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if (row){            
            $.ajax({
                type: 'POST',
                url: row.enable_url ,
                dataType: 'json',
                success: function(data) {
                    if (data.errMeg != '') {
                        window.parent.showAlert('操作失败', data.errMeg);
                    }

                    $("#tt").datagrid('load');
                }
            });
        }
        return false;
    }

    /* 新建课程表模板 */
    function addScheduleTemplate(addUrl){
        openTopWindow(addUrl, '新建课程表参数设置', 800, 538, 'closeReload');
    }

    /* 重新查询 */
    function doSearch(){

        $('#tt').datagrid('reload',{
            school_id: $('#school_id').combobox("getValue")
        });
    }

    $(function(){
        $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                $('#school_id').combobox("setValue", '');

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