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
    
    <script type="text/javascript" src="js/easyui-1.4.4/outOfBounds.js"></script>
    <link rel="stylesheet" href="js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<link rel="stylesheet" type="text/css" href="css/default.css">

<div class="easyui-layout" fit="true">
	
	<div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">	

	    <!--工具按钮和筛选栏目开始-->
		<div class="easyui-layout" fit="true" border="false">

                        <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:138px; padding-right:0px;" border="false">

                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="add()">起草新问卷调查</a>

            </div>
            <!--工具栏结束-->
            
            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：
                <input id="ask_type" value="" style="cursor:pointer; width: 110px;"  class="easyui-combobox" data-options="panelHeight:'auto', novalidate:true">

    			<!-- <input id="school_id" value="" style="cursor:pointer;width: 140px;" class="easyui-combobox" data-options="novalidate:true" > -->

                <!-- <input id="targetman_type" value="" style="cursor:pointer;width: 110px;" class="easyui-combobox" data-options="panelHeight:'auto', novalidate:true" > -->

                &nbsp;&nbsp;起草者：<input id="create_name" value="" style="cursor:pointer;width:80px;" class="easyui-textbox" data-options="novalidate:true" >

                &nbsp;&nbsp;标题：<input id="title" value="" style="cursor:pointer;width: 120px;" class="easyui-textbox" data-options="novalidate:true" >

                &nbsp;&nbsp;发布日期：<input id="start_time" value="" style="cursor:pointer;width: 100px;" class="easyui-datebox" data-options="novalidate:true" >
                至 <input id="end_time" value="" style="cursor:pointer;width: 100px;" class="easyui-datebox" data-options="novalidate:true" >

                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->

        </div>
		<!--工具按钮和筛选栏目结束-->

	</div>

	<div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
		<table id="tt" class="easyui-datagrid"
			   data-options="url:'${pageContext.request.contextPath}/askAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
			   onLoadSuccess: dataLoadSuccess,
			   singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
			<thead>
			<tr>
				<th data-options="field:'title',width:140">问卷标题</th>
				<th data-options="field:'push_range',width:260 ,formatter: setRange">手机推送范围</th>
				<th data-options="field:'push_object',width:80 ,formatter: setObject" sortable="true">推送对象</th>
                <th data-options="field:'create_teacher_name',width:110" sortable="true">起草者</th>
                <th data-options="field:'create_time_name',width:120" sortable="true">起草时间</th>
                <th data-options="field:'check_teacher_name',width:110" sortable="true">发布者</th>
                <th data-options="field:'check_time_name',width:120,formatter: setTextColor" sortable="true">发布时间</th>
				<th data-options="field:'edit',width:150,formatter:  rowformater">操作</th>
			</tr>
			</thead>
		</table>
        <!--数据表结束-->

	</div>

</div>
<script type="text/javascript">
    var hasEditPermission = 'true';
    hasEditPermission = eval('('+hasEditPermission+')');

    var hasPutOutPermission = 'true';
    hasPutOutPermission = eval('('+hasPutOutPermission+')');

    var hasDeletePermission = 'true';
    hasDeletePermission = eval('('+hasDeletePermission+')');

    var schoolListJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]}]';
    schoolListJson = eval('('+schoolListJson+')');


    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { title: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'title', colspan: 8 })
        }
    }

    function setTextColor(value,row,index){
        var rs = '';
        if(row.check_time > 0){
             rs += row.check_time_name
        }else{
            rs += '<span style="color:red;">'+row.check_time_name+'</span>'
        }
        return rs;
    }

    $(function(){
        /*搜索  学校年级联动*/
       /*  $('#school_id').combobox({
            data: schoolListJson,
            editable:false,
            valueField:'id',
            textField:'name',
            value:'',
            onLoadSuccess:function(){

            },
            onSelect:function(record){
                //刷新数据，重新读取，并清空当前输入的值

            }
        }); */

        /* 通知级别 */
        var askTypeData = [
            {id:0,name:"全部问卷级别",selected:true},{id:1,name:"集团级通知"},{id:2,name:"学校级通知"}        ];
        var ask_type = $('#ask_type').combobox({
            data: askTypeData,
            editable:false,
            valueField:'id',
            textField:'name'
        })

        /* 推送对象 */
        /* var targetmanTypeData = [
            {id:0,name:"全部推送对象",selected:true},{id:1,name:"仅家长"},{id:2,name:"仅教职工"},{id:3,name:"教职工和家长"}        ];
        var targetman_type = $('#targetman_type').combobox({
            data: targetmanTypeData,
            editable:false,
            valueField:'id',
            textField:'name'
        }) */

        //  清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });
        //入职日期 开始
        $('#start_time').datebox({
            editable:false,
            buttons: buttons
        });
        //入职日期 结束
        $('#end_time').datebox({
            editable:false,
            buttons: buttons
        });

    })
    
    function setObject(value,row,index){
    	if("1"==row.ask_type){
    		return "集团级通知";
    	}else{
    		return "学校级通知";
    	}
    }
    
  	function setRange(){
    	
    	return "请在“编辑”中查看";
    }

    /**
     * 添加按钮函数
     * @param value
     * @param row
     * @param index
     * @returns {*}
     */
    function rowformater(value,row,index)
    {
        var rs = '';
        var rs_a = '';
        var rs_c = '';
        var rs_b = '';

        if (hasEditPermission) {
            rs_a = '<a onclick="edit('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                '</a>';
        }

        if (hasDeletePermission) {
            rs_b = '<a onclick="del('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">删除</span>' +
                '<span class="l-btn-icon icon-cancel">&nbsp;</span></span>' +
                '</a>';
        }

        if (hasPutOutPermission) {
            rs_c = '<a onclick="putOut('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">发布</span>' +
                '<span class="l-btn-icon icon-redo">&nbsp;</span></span>' +
                '</a>';
        }


        var rs_d = '<a onclick="more('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">详情</span>' +
                '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
                '</a>';

        var rs_e = '<a onclick="javascript:;" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">已删除</span>' +
                '<span class="l-btn-icon icon-cancel">&nbsp;</span></span>' +
                '</a>';

        if(row.is_delete == 1){
            rs_b = rs_e;
        }

        if(row.check_teacher_id > 0){
            rs += rs_a + rs_b + rs_d;
        }else{
            rs += rs_a + rs_b + rs_c;
        }

        return rs;
    }

    function add(){
    	var url = '${pageContext.request.contextPath}/page_askandnotice_ask-add.action';
    	var title = '起草新问卷调查';
        var callfun = 'callback';
        openTopWindow(url,title,780,558,callfun);
    }

    function edit(index){
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id =row.id;
        var url = '${pageContext.request.contextPath}/askAction_edit.action?id='+id+'';
        var title = '编辑问卷调查';
        var callfun = 'callback';
        openTopWindow(url,title,780,558,callfun);
    }

    function del(index){
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id =row.id;
        var url = '${pageContext.request.contextPath}/askAction_delete.action?id='+id+'';
        var title = '删除问卷调查';
        var callfun = 'callback';
        openTopWindow(url,title,298,130,callfun);
    }

    function more(index){
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id =row.id;
        var url = '${pageContext.request.contextPath}/askAction_about.action?id='+id+'';
        var title = '问卷调查详情';
        var callfun = 'callback';
        openTopWindow(url,title,780,628,callfun);
    }

    function putOut(index){
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id =row.id;
        var url = '${pageContext.request.contextPath}/askAction_putOut.action?id='+id+'';
        var title = '发布问卷调查';
        var callfun = 'callback';
        openTopWindow(url,title,298,130,callfun);
    }

    function doSearch(){
        callback();
    }

    function callback(){
        $('#tt').datagrid('reload',{
            ask_type: $('#ask_type').combobox("getValue"),
            create_teacher_name: $('#create_name').textbox("getValue"),
            title: $('#title').textbox("getValue"),
            start_time: $('#start_time').datebox("getValue"),
            end_time: $('#end_time').datebox("getValue"),
            flag:'1'
        });
    }

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