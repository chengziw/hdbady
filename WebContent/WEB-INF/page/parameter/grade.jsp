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
        <!-- <div id="bar" class="datagrid-toolbar"> -->
        <div class="easyui-layout" fit="true" border="false">

            <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:108px; padding-right:18px;" border="false">
            <!--<a href="#" onclick="javascript:openParentWindow();return false;" class="easyui-linkbutton" iconCls="icon-help">打开父类窗口</a>-->
                                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addGrade();">新建年级</a>
                                                    <!--<a href="#" class="easyui-linkbutton" iconCls="icon-filter" onclick="orderGrade()">年级排序</a>-->
                            <!--工具栏结束-->
            </div>

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:8px;">筛选：

               <!--  <input id="school_id"  style="cursor:pointer;" class="easyui-combobox" data-options="panelHeight:'auto', novalidate:true" value=""/>
 -->
                <input id="status"     style="cursor:pointer;" class="easyui-combobox" data-options="panelHeight:'auto', novalidate:true" value=""/>
                <a href="javascript:;" class="easyui-linkbutton" style="margin-left:8px;" plain="true" data-options="iconCls:'icon-search'" onclick="doSearch();return false;">查询</a>       
            </div>
            <!--筛选条件结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->

    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">
    
        <!--数据表开始-->
                <table id="dg" class="easyui-datagrid" title=""
                 data-options="fitColumns:true,fit:true,pagination:true,
               singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true,
               onLoadSuccess: dataLoadSuccess,
                url:'${pageContext.request.contextPath}/gradeAction_pageQuery.action'">
                	<thead>
                		<tr>
                			<th data-options="field:'name',width:100"><span id =name>年级名称</span></th>
                			<th data-options="field:'sort_name',width:100">升级顺序</th>
                			<th data-options="field:'statusLabel',width:60,formatter: setColor">状态</th>
                			<th data-options="field:'test',width:550,formatter: formatOper">操作</th>
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

    var schoolListJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]}]';
    schoolListJson = eval('('+schoolListJson+')');

    //按钮函数
    function formatOper(value,row,index){
        var editBtn = '';
        if (hasEditPermission) {
             editBtn = '<a onclick="editGrade('+index+')" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">重命名</span>' +
                '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                '</a>';
        }

        if (hasChangeStatusPermission) {
            if(row.status == 1 /* && row.is_end_grade > 0 */)
            {
                editBtn += '<a onclick="changeStatus('+index+')" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">停用</span>' +
                    '<span class="l-btn-icon icon-stop">&nbsp;</span></span>' +
                    '</a>';
            }

            if(row.status == 2 /* && row.is_use_sort > 0 */){
                editBtn += '<a onclick="changeStatus('+index+')" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">启用</span>' +
                    '<span class="l-btn-icon icon-start">&nbsp;</span></span>' +
                    '</a>'
            }
        }

        var optionsStr = "{editBtn}";
        optionsStr = optionsStr.replace('{editBtn}', editBtn);

        return optionsStr;
    }
	
	//改变状态字符颜色
	function setColor(value,row,index){
		var color = '';
		if(row.status == 1){
			color = 'green';
		}else{
			color = 'red';
		}
		var rs = '<span style="color:'+color+';">'+row.statusLabel+'</span>';
		return rs;
	}

    //改变当前年级的状态
    function changeStatus(index)
    {
    	$('#dg').datagrid('selectRow', index);
       	var row = $('#dg').datagrid('getSelected');
       	var id = row.id;
        var url = '${pageContext.request.contextPath}/gradeAction_changeStatus.action?id='+id+'';
       
        //$('#dg').datagrid('selectRow', index); // 关键在这里
        //var row = $("#dg").datagrid('getSelected'); // 将选中的一行记录赋值给一个对象
        if( ! row) return false;
        $.ajax({
            url:url,
            dataType: 'JSON',
            success:function(data){
                if(data.status == 1){
                    doSearch();
                }else{
                    $.messager.alert('提示',data.info,'warning');
                }
            }
        })
    }

    //编辑年级数据
    function editGrade(index){
    	$('#dg').datagrid('selectRow', index);
       	var row = $('#dg').datagrid('getSelected');
       	id = row.id;
    	var url = '${pageContext.request.contextPath}/gradeAction_edit.action?id='+id+'';
       
    	$('#dg').datagrid('selectRow', index);// 关键在这里
        var row = $("#dg").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if (row){
            openTopWindow(url, '年级重命名', 428, 118, 'closeEdit');
        }
    }

    //弹出顺序更换框
    function orderGrade(){
        var url = '/grade/order.html';
        var title = '年级排序';
        var callfun = 'closeEdit';
        openTopWindow(url,title,288,428, callfun);
    }

    //更换年级顺序后保存数据，刷新
    function addGrade(){
    	var url = '${pageContext.request.contextPath}/page_parameter_grade-add.action';
    	  	
        var callfun = 'closeEdit';
        openTopWindow(url, '新建年级', 428, 178, callfun);
    }

    //更换年级顺序，关闭弹窗, 重新刷新数据
    function closeEdit(){
        doSearch();
    }

    //根据学校查询对应年级
    function doSearch(){
        $("#dg").datagrid('reload',{
            //school_id: $("#school_id").combobox("getValue"),
            status: $("#status").combobox("getValue"),
            tag:'1'
        });
    }
    $(function(){
        /*搜索  学校状态联查*/
        $('#school_id').combobox({
            data: schoolListJson,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){

            }
        });

        $('#status').combobox({
            data: [{'id': '全部状态', 'name' : '全部状态','selected':true},
                {'id': 2, 'name' : '已停用'},
                {'id': 1, 'name' : '正常'}
            ],
            editable:false,
            valueField:'id',
            textField:'name',
            required: true
        });
    })

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
    	var thLength = $('#tt tr:first').find('th').length;
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'name', colspan: 4 })
        }
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