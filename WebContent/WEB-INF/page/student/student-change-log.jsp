<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
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

                <input id="grade_id"  data-options="panelHeight:'auto'" style="cursor:pointer; width:90px;">

                <input id="class_id" data-options="panelHeight:'auto'" style="cursor:pointer; width:130px;">

    			<input id="type_name" data-options="panelHeight:'auto'" style="cursor:pointer; width:110px;">


                &nbsp;&nbsp;变动日期：
                <input id="change_time_start" class="easyui-datebox" data-options="editable:false" style="cursor:pointer; width:95px;">
                至
                <input id="change_time_end" class="easyui-datebox" data-options="editable:false" style="cursor:pointer; width:95px;">

                &nbsp;&nbsp;学生姓名：
                <input id="student_name" class="easyui-textbox" value="" style="width:80px;">

                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div>
            <!--筛选条件结束-->

        </div>
		<!--工具按钮和筛选栏目结束-->

	</div>

	<div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
		<table id="tt" class="easyui-datagrid"
			   data-options="url:'${pageContext.request.contextPath}/studentChangeLogAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
			   onLoadSuccess: dataLoadSuccess,
			   singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
			<thead>
			<tr>
                <th data-options="field:'student_name',width:100"><span id =student_name>姓名（英文名)</span></th>
                <th data-options="field:'sex_name',width:50" sortable="true">性别</th>
                <th data-options="field:'yearMonthDay',width:70" sortable="true">生日</th>
                <th data-options="field:'grade_name',width:70" sortable="true">当前年级</th>
                <th data-options="field:'class_name',width:60" sortable="true">班级</th>
				<th data-options="field:'type_name',width:70,formatter:  statusCallFun" sortable="true" >变动类型</th>
                <th data-options="field:'change_date_name',width:70" sortable="true">变动日期</th>
                <th data-options="field:'note',width:140">备注</th>
                <th data-options="field:'teacher_name',width:130" sortable="true">操作老师</th>
                <th data-options="field:'create_name',width:120" sortable="true">记录时间</th>
			</tr>
			</thead>
			
		</table>
        <!--数据表结束-->

	</div>

</div>

<script type="text/javascript">
    var schoolJson = eval('([{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u3010\u5b9d\u5b89\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":28,"name":"\u5c0f\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":29,"name":"\u4e2d\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":30,"name":"\u5927\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}])');

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
                $(this).datagrid('appendRow', { student_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                    .datagrid('mergeCells', { index: 0, field: 'student_name', colspan: 10 })
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
        

        var type_name_data = [
			{id:"全部状态",name:"全部状态"},
			{id:1,name:"入学"},
			{id:2,name:"分班"},
			{id:3,name:"调班"},
			{id:4,name:"编辑"},
			{id:5,name:"休退"},
			{id:6,name:"复学"},
			{id:7,name:"删除"}
            /* {id:0,name:"全部变动类型"},
            {id:1,name:"分班入学"},
            {id:2,name:"复学"},
            {id:3,name:"休学"},
            {id:4,name:"退学"},
            {id:20,name:"调班"},
            {id:5,name:"&nbsp;&nbsp;平级调班"},
            {id:6,name:"&nbsp;&nbsp;留级调班"},
            {id:7,name:"&nbsp;&nbsp;跳级调班"},
            {id:8,name:"正常升级"},
            {id:9,name:"毕业"} */

        ];
        $("#type_name").combobox({
            data:type_name_data,
            valueField:'id',
            textField:'name',
            editable:false,
            value:'全部状态',
            onSelect:function(recode){
                var val = recode.name.replace(/&nbsp;&nbsp;/,"");
                $("#type_name").combobox("setValue",recode.id).combobox('setText',val);
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
    

      function setStudentName(value, rec) 
      { 
     	 return rec.student!= null ? rec.student.name : ""; 
      }
      function setSexName(value, rec) 
      { 
     	 return rec.student!= null ? rec.student.sex : ""; 
      }
      function setYearMonthDay(value, rec) 
      { 
     	 return rec.student!= null ? rec.student.yearMonthDay : ""; 
      }
                
      function setClassName(value, rec) 
      { 
     	if(rec.student != null){
      		if(rec.student.classes != null){
      			return rec.student.classes.class_name;
      		}
      	}
      	return "";
      }
     
      function setGradeName(value, rec) 
      { 
     	 if(rec.student != null){
      		if(rec.student.classes != null){
      			if(rec.student.classes.grade!=null){
      				return rec.student.classes.grade.name;
      			}
      		}
      	}
      	return "";
      }

     function statusCallFun(value,row,index){
    	 var rs = '';
	        if(value == 1 ){
	            rs += '<span style="color:red;">入学</span>';
	        }else if(value == 2){
	            rs += '<span style="color:blue;">分班</span>';
	        }else if(value == 3){
	            rs += '<span style="color:green;">调班</span>';
	        }else if(value == 4){
	            rs += '<span style="color:green;">编辑</span>';
	        }else if(value == 5){
	            rs += '<span style="color:green;">休退</span>';
	        }else if(value == 6){
	            rs += '<span style="color:green;">复学</span>';
	        }else if(value == 7){
	            rs += '<span style="color:green;">删除</span>';
	        }
  	
  		 /*  var rs = '';
  	        if(value == 1 ){
  	            rs += '<span style="color:red;">分班入学</span>';
  	        }else if(value == 2){
  	            rs += '<span style="color:blue;">复学</span>';
  	        }else if(value == 3){
  	            rs += '<span style="color:green;">休学</span>';
  	        }else if(value == 4){
  	            rs += '<span style="color:green;">退学</span>';
  	        }else if(value == 5){
  	            rs += '<span style="color:green;">平级调班</span>';
  	        }else if(value == 6){
  	            rs += '<span style="color:green;">留级调班</span>';
  	        }else if(value == 7){
  	            rs += '<span style="color:green;">跳级调班</span>';
  	        }else if(value == 8){
  	            rs += '<span style="color:green;">正常升级</span>';
  	        }else if(value == 9){
  	            rs += '<span style="color:green;">毕业</span>';
  	        }else if(value == 20){
  	            rs += '<span style="color:green;">调班</span>';
  	        } */
  	     return rs;
  	     
     }
        
    
    
    /**
     * 回调 函数
     */
    function callback(){
        $('#tt').datagrid('load',{
            /* school_id: $('#school_id').combobox("getValue"), */
            grade_name:$('#grade_id').combobox('getText'),
            class_name:$('#class_id').combobox('getText'),
            type_name: $('#type_name').combobox("getValue"),
            student_name:$('#student_name').textbox("getValue"),
            change_time_start:$('#change_time_start').datebox("getValue"),
            change_time_end:$('#change_time_end').datebox("getValue"),
            tag:'1'
        });
    }

    /**
     * 搜索
     */
    function doSearch(){
    	
        callback();
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