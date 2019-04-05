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
<style type="text/css">
    /*.datagrid-cell, .datagrid-cell-group, .datagrid-header-rownumber, .datagrid-cell-rownumber{white-space: normal !important;}*/
</style>
<div class="easyui-layout" fit="true">


	<div region="north" border="false" style="padding:10px;height:100px; padding-top:16px; padding-bottom:0px; overflow:hidden;">
	    <!--工具按钮和筛选栏目开始-->
		<div class="easyui-layout" fit="true" border="false">
            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：

    			<input id="structure_id" value="" style="cursor:pointer;width:200px;" class="easyui-combobox" data-options="panelHeight:'280'">

    			<input id="change_type" class="easyui-combobox"  data-options="panelHeight:'auto'" style="width:120px;">

                &nbsp;&nbsp;变动日期：
                <input id="change_time_start" class="easyui-datebox" data-options="editable:false" style="width:100px;">
                至
                <input id="change_time_end" class="easyui-datebox" data-options="editable:false" style="width:100px;">


                &nbsp;&nbsp;姓名：
                <input id="teacher_name" class="easyui-textbox" value="" data-options="validType:['name','MaxLength[32]']" style="width:80px;">


                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->

        </div>
		<!--工具按钮和筛选栏目结束-->
	</div>


	<div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
		<table id="tt" class="easyui-datagrid"
			   data-options="url:'${pageContext.request.contextPath}/teacherChangeLogAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
			   onLoadSuccess: dataLoadSuccess,
			   singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
			<thead>
			<tr>
				<th data-options="field:'worknumber',width:60" sortable="true"><span id =worknumber>工号</span></th>
                <th data-options="field:'teacher_name',width:60" sortable="true">姓名</th>
                <th data-options="field:'yearMonthDay',width:90" sortable="true">出生日期</th>
                <th data-options="field:'phone',width:90">手机（登录名）</th>
                <!--<th data-options="field:'school_name',width:110" sortable="true">学校</th>-->
                <th data-options="field:'structure_name',width:180" sortable="true">变动后的部门</th>
                <th data-options="field:'duty_name',width:70" sortable="true">变动后的职务</th>
                <th data-options="field:'status_name',width:70" sortable="true">变动后的状态</th>
				<th data-options="field:'type_name',width:80" sortable="true">变动类型</th>
                <th data-options="field:'change_time_name',width:60" sortable="true">变动日期</th>
                <th data-options="field:'note',width:120">备注</th>
                <th data-options="field:'operation_name',width:110" sortable="true">操作人</th>
                <th data-options="field:'create_name',width:120" sortable="true">操作时间</th>
			</tr>
			</thead>
		</table>
        <!--数据表结束-->
			
	</div>

</div>

<script type="text/javascript">
    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
    	var thLength = $('#tt tr:first').find('th').length;
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { worknumber: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'worknumber', colspan: thLength })
        }
    }

    /**
     * 回调 函数
     */
    function callback(){
        $('#tt').datagrid('load',{
            structure_name: $('#structure_id').combotree("getText"),
            type_name: $('#change_type').combobox("getValue"),
            teacher_name:$('#teacher_name').textbox("getValue"),
            change_time_start:$('#change_time_start').datebox("getValue"),
            change_time_end:$('#change_time_end').datebox("getValue"),
            tag:'1'
        });
    }
    
    function statusCallFun(value,row,index){
   	 var rs = '';
	        if(value == 1 ){
	            rs += '<span style="color:red;">入职</span>';
	        }else if(value == 2){
	            rs += '<span style="color:blue;">休假</span>';
	        }else if(value == 3){
	            rs += '<span style="color:green;">离职</span>';
	        }else if(value == 4){
	            rs += '<span style="color:green;">退休</span>';
	        }else if(value == 5){
	            rs += '<span style="color:green;">复职</span>';
	        }else if(value == 6){
	            rs += '<span style="color:green;">调动</span>';
	        }
	     return rs;
	}
 
    function setWorkNumber(value, rec) { 
   	 return rec.teacher!= null ? rec.teacher.worknumber : ""; 
    }
    function setTeacherName(value, rec) { 
      	 return rec.teacher!= null ? rec.teacher.teacher_name : ""; 
    }
    function setYearMonthDay(value, rec) { 
      	 return rec.teacher!= null ? rec.teacher.brither_name : ""; 
    }
    function setphone(value, rec) { 
      	 return rec.teacher!= null ? rec.teacher.phone : ""; 
    }
    function setStructureName(value, rec) { 
   	 if(rec.teacher != null){
    		if(rec.teacher.structure != null){
    			return rec.teacher.structure.name;
    		}
    	}
    	return "";
    }
    function setDutyName(value, rec) { 
      	 if(rec.teacher != null){
       		if(rec.teacher.teacherDuty != null){
       			return rec.teacher.teacherDuty.duty_name;
       		}
       	}
       	return "";
    }

    /**
     * 搜索
     */
    function doSearch(){
        callback();
    }

    $(function(){
    /*搜索  学校年级联动*/
        $('#structure_id').combotree({
        	url:'${pageContext.request.contextPath}/structureAction_findAll.action',
            valueField:'id',
            textField:'text',
            lines:true,
            animate:true,
            formatter:function(node){
               	node.text = node.name;
                return node.text; 
            },
            onLoadSuccess:function(){
                $('#structure_id').combotree("setValue","全部部门");
            },
            editable:false
        })

        var changeTypeData = [
            {id:'全部类型',name:"全部类型"},
            {id:1,name:"入职"},
            {id:2,name:"休假"},
            {id:3,name:"离职"},
            {id:4,name:"退休"},
            {id:5,name:"复职"},
            {id:6,name:"调动"}
        ];
        $("#change_type").combobox({
            data:changeTypeData,
            editable:false,
            valueField:'id',
            textField:'name',
            onSelect:function(record){
                var val = record.name.replace(/&nbsp;&nbsp;/,"");
                $("#change_type").combobox("setValue",record.id).combobox('setText',val);
            }
        })

        //清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });
        //变动日期 开始
        $('#change_time_start').datebox({
            buttons: buttons
        });
        //变动日期 结束
         $("#change_time_start").datebox({ 
       	 onSelect : function(beginDate){ 
       	  $('#change_time_end').datebox().datebox('calendar').calendar({ 
       	   validator: function(date){ 
       	    return beginDate<=date;//<= 
       	   } 
       	  }); 
       	 } 
       	});

        $('#change_time_end').datebox({
            buttons: buttons
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