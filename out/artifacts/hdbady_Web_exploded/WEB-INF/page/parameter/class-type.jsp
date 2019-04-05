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
            <div id="main_body_tool" region="west" style="width:888px; padding-right:18px;" border="false">
                
                                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addClassType()">新建班级类型</a>
                
                                    <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-filter" onclick="orderClassType()">班级类型排序</a> -->
                
            </div>
            <!--工具栏结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->

    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
               data-options="url:'${pageContext.request.contextPath}/classTypeAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
               onLoadSuccess: dataLoadSuccess,
			   singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
            <thead>
            <tr>
                <th data-options="field:'type_name',width:160">班级类型名称</th>
                <th data-options="field:'status_name',width:80,formatter: setColor">状态</th>
                <th data-options="field:'edit',width:700,formatter:  rowformater">操作</th>
            </tr>
            </thead>
        </table>
        <!--数据表结束-->

    </div>

</div>

<script type="text/javascript">
    var hasEditPermission = 'true';
    hasEditPermission = eval('('+hasEditPermission+')');

    var hasChangeTypePermission = 'true';
    hasChangeTypePermission = eval('('+hasChangeTypePermission+')');


    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { type_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'type_name', colspan: 3 })
        }
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
        if (hasEditPermission) {
            rs = '<a onclick="editClassType(' + index + ');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                '</a>';
        }

        if (hasChangeTypePermission) {
            if(row.status==1){
                rs += '<a onclick="changeStatus('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">停用</span>' +
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
    	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id = row.id;
        var url = '${pageContext.request.contextPath}/classTypeAction_changeStatus.action?id='+id+'';
        
        $.ajax({
            url:url,
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

    function addClassType(){
    	var url = '${pageContext.request.contextPath}/page_parameter_class-type-add.action';
        var title = '新建班级类型';
        var callfun = 'callback';
        openTopWindow(url,title,508,138,callfun);
    }

    function editClassType(index){
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id = row.id;
        //var url = row.updateUrl;
        var url = '${pageContext.request.contextPath}/classTypeAction_edit.action?id='+id+'';
        var title = '编辑班级类型';
        var callfun = 'callback';
        openTopWindow(url,title,508,138,callfun);
    }

    function orderClassType(){
    	var url = '${pageContext.request.contextPath}/classTypeAction_sortClassType.action';
        var title = '班级类型排序';
        var callfun = 'callback';
        openTopWindow(url,title,280,498,callfun);
    }

    function callback(){
        $('#tt').datagrid('reload');
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