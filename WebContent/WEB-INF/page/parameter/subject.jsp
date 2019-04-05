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

<link rel="stylesheet" type="text/css" href="css/default.css">

<div class="easyui-layout" fit="true">
	
	<div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">	

	    <!--工具按钮和筛选栏目开始-->
		<div class="easyui-layout" fit="true" border="false">

            <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:108px; padding-right:18px;" border="false">

                                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addSubject()">新建科目</a>
                                                    <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-filter" onclick="orderSubject()">科目排序</a> -->
                            </div>
            <!--工具栏结束-->

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:6px;">筛选：

    			<!-- <input id="school_id" value="" style="cursor:pointer;" class="easyui-combobox" data-options="panelHeight:'auto', novalidate:true" > -->
    		
    			<!-- <input id="grade_name" value="" style="cursor:pointer;"  class="easyui-combobox" data-options="panelHeight:'auto', novalidate:true"> -->

    			<select id="status" class="easyui-combobox"  data-options="panelHeight:'auto'">
    				<option value="0">全部状态</option>
    				<option value="1">正常</option>
    				<option value="2">已停开</option>
    			</select>

                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->

        </div>
		<!--工具按钮和筛选栏目结束-->

	</div>

	<div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
		<table id="tt" class="easyui-datagrid"
			   data-options="url:'${pageContext.request.contextPath}/subjectAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
			   onLoadSuccess: dataLoadSuccess,
			   singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
			<thead>
			<tr>
				<th data-options="field:'name',width:80"><span id =name>学科名称</span></th>
				<!-- <th data-options="field:'grade_name',width:220">适用年级</th> -->
				<th data-options="field:'status_name',width:80,formatter: setColor">状态</th>
				<th data-options="field:'edit',width:500,formatter:  rowformater">操作</th>
			</tr>
			</thead>
		</table>
        <!--数据表结束-->

	</div>

</div>


<script type="text/javascript">
    var hasChangeStatusPermission = 'true';
    hasChangeStatusPermission = eval('('+hasChangeStatusPermission+')');

    var hasEditPermission = 'true';
    hasEditPermission = eval('('+hasEditPermission+')');

    var schoolListJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":41,"name":"\u6258\u7ba1\u73ed2","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolListJson = eval('('+schoolListJson+')');

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){

        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'name', colspan: 3 })
        }
    }

    function doSearch(){
        $('#tt').datagrid('reload',{
            status:$('#status').combobox("getValue"),
         	tag:'1'
        });
    }

    $(function(){
           /*  $('#grade_name').combobox({
            url:'${pageContext.request.contextPath}/gradeAction_findAllGrades.action',
            //disabled:false,
            data: [{id: '', name: '全部年级'}],
            valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                //$('#grade_name').combobox('setValue','');
            }
        }) */
        /*搜索  学校年级联动*/
       /*  var school_Id = $('#school_id').combobox({
            data: schoolListJson,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                $('#school_id').combobox("setValue", '');
                var data = $('#school_id').combobox('getData');

                if (data.length == 2) {
                    $('#school_id').combobox('select', data[1].id);                    
                } else if(data.length < 3) {
                    $('#tt').datagrid({'pagination': false});
                    $('#tt').datagrid('hideColumn','school_name');
                    $('#main_body_search').hide();
                } else {
                    $('#school_id').combobox('select', data[0].id);
                }
            },
            onSelect:function(record){
                if (record.gradeList != undefined) {
                    $('#grade_name').combobox('loadData', record.gradeList);
                } else {
                    $('#grade_name').combobox('loadData', [{id: '', name: '全部年级'}]);
                }
            }
        }); */
        $("#status").combobox({
            editable:false
        })
        
    })

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

        if (hasEditPermission) {
            rs = '<a onclick="editSubject('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                '</a>';

        }

        if (hasChangeStatusPermission) {
            if(row.status==1){
                rs += '<a onclick="changeStatus('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">停开</span>' +
                    '<span class="l-btn-icon icon-stop">&nbsp;</span></span>' +
                    '</a>'
            }else{
                rs += '<a onclick="changeStatus('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">启用</span>' +
                    '<span class="l-btn-icon icon-start">&nbsp;</span></span>' +
                    '</a>'
            }
        }
        return rs;
    }
	
	
	//改变状态字符颜色
	function setColor(value,row,index){
		var color = '';
		if(row.status == 1){
			color = 'green';
		}else{
			color = 'red';
		}
		var rs = '<span style="color:'+color+';">'+row.status_name+'</span>';
		return rs;
	}


    function changeStatus(index){
        /* alert(id+' '+status); return false;*/
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id = row.id;
        $.ajax({
            url:'${pageContext.request.contextPath}/subjectAction_changeStatus.action?id='+id+'',
            dataType: 'JSON',
            success:function(data){
                if(data.status==1){
                    callback();
                }else{
                    $.messager.alert('提示',data.info);
                }
            }
        })
    }

    function addSubject(){
        var url = '${pageContext.request.contextPath}/subjectAction_add.action';
        var title = '新建教学科目';
        var callfun = 'callback';
        openTopWindow(url,title,508,148,callfun);
    }

    function editSubject(index){
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id = row.id;
        
        var url = '${pageContext.request.contextPath}/subjectAction_edit.action?id='+id+'';
        var title = '编辑教学科目';
        var callfun = 'callback';
        openTopWindow(url,title,488,148,callfun);
    }

    function orderSubject(){
        var s_id = '';
        var url = '/subject/order.html?s_id='+s_id;
        var title = '教学科目排序';
        var callfun = 'callback';
        openTopWindow(url,title,280,498,callfun);
    }

    function callback(){
        $('#tt').datagrid('load',{
            status:$('#status').combobox("getValue")
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