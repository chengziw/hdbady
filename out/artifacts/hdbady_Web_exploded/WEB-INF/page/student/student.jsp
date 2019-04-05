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
	
	<div region="north" border="false" style="padding:10px;height:100px; padding-top:16px; padding-bottom:0px;overflow: hidden">

	    <!--工具按钮和筛选栏目开始-->
		<div class="easyui-layout" fit="true" border="false" >

                        <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:368px; padding-right:8px;" border="false">
            				<shiro:hasPermission name="page_student_student_add">
                                <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addStudent()">学生注册</a>
                            </shiro:hasPermission>  
                            
                            <shiro:hasPermission name="page_student_student_add">
                                <a href="#" class="easyui-linkbutton" iconCls="icon-diaodong" onclick="allotStudent()">分班</a>
                            </shiro:hasPermission>  
                            
                            <shiro:hasPermission name="page_student_student_add">
                                <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="bulkEnrollmentConfirmation()">确认入学</a>
                            </shiro:hasPermission>   
                <a href="#" class="easyui-linkbutton" iconCls="icon-daoru" onclick="importStudent()">导入</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-daochu" onclick="exportStudent()">导出</a>
                            </div>
            <!--工具栏结束-->
           
            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：
				<form id="searchForm">
                <input id="status_name" style="width:80px;">

    			<!-- <input id="school_id" style="width:140px;"> -->
    		
    			<input id="grade_id" style="width:80px;">

                <input id="class_id" style="width:120px;">

                <input id="age" style="width:55px;">

                &nbsp;&nbsp;入校：
                <input id="start_date" style="width:90px;">
              	  至
                <input id="end_date" style="width:90px;">


                <input id="name" class="easyui-textbox" value="" data-options="prompt:'姓名'"  style="width:80px;">

                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
				 </form>
            </div> 
            <!--筛选条件结束-->
        </div>
		<!--工具按钮和筛选栏目结束-->

	</div>
	<div region="center" border="false"  id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
		<table id="tt" class="easyui-datagrid"
			   data-options="url:'${pageContext.request.contextPath}/studentAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
			   onLoadSuccess: dataLoadSuccess,
			   pageList:[5,10,15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
			<thead>
			<tr>
				<th id data-options="field:'student_no',width:40" sortable="true"><span id =student_no>学号</span></th>
				<th data-options="field:'name',width:90">姓名</th>
				<th data-options="field:'sex',width:40" sortable="true">性别</th>
				<th data-options="field:'yearMonthDay',width:55" sortable="true">生日</th>
                <th data-options="field:'age',width:40" sortable="true">年龄</th>
                <th data-options="field:'grade_id',width:60, formatter:setGradeName" sortable="true">年级</th>
                <th data-options="field:'class_id',width:100, formatter:setClassName" sortable="true">班级</th>
                <th data-options="field:'parent_name',width:85">家长姓名（关系）</th>
                <th data-options="field:'phone',width:70">家长手机</th>
                <th data-options="field:'enter_date',width:60" sortable="true">入学日期</th>
                <th data-options="field:'address',width:60" sortable="true">地址</th>
                <th data-options="field:'status_name',width:60,formatter:  statusCallFun" sortable="true">状态</th>
                <th data-options="field:'edit',width:180,formatter:  rowformater">操作</th>
			</tr>
			</thead>
		</table>
        <!--数据表结束-->
			
	</div>

</div>

<script type="text/javascript">
/* 转换PHPJSON为JS JSON格式 */
var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u3010\u5b9d\u5b89\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":28,"name":"\u5c0f\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":29,"name":"\u4e2d\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":30,"name":"\u5927\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
schoolJson = eval('('+schoolJson+')');

var schoolYearJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u3010\u5b9d\u5b89\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u73ed\u7ea7\u5165\u5b66\u5e74\u4efd"},{"id":"2016","name":"2016\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed"},{"id":16,"name":"\u4e8c\u73ed"}]},{"id":2015,"name":"2015\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed"},{"id":18,"name":"\u4e8c\u73ed"}]},{"id":2014,"name":"2014\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed"},{"id":19,"name":"\u4e8c\u73ed"},{"id":24,"name":"\u4e09\u73ed"}]},{"id":2013,"name":"2013\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed"},{"id":20,"name":"\u4e8c\u73ed"}]},{"id":2012,"name":"2012\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed"}]},{"id":2011,"name":"2011\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u73ed\u7ea7\u5165\u5b66\u5e74\u4efd"},{"id":"2016","name":"2016\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":2015,"name":"2015\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":2014,"name":"2014\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":2013,"name":"2013\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":2012,"name":"2012\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":2011,"name":"2011\u5e74\u5165\u5b66","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
schoolYearJson = eval('('+schoolYearJson+')');

var isSchoolYear = 0;
/**
 * 表格加载完成
 * @param data
 */
function dataLoadSuccess(data){
    var thLength = $('#tt tr:first').find('th').length;
    if(data.total == 0){ //没有记录

        $(this).datagrid('appendRow', { student_no: '<div style="text-align:center;color:red">没有找到记录！</div>' })
            .datagrid('mergeCells', { index: 0, field: 'student_no', colspan: thLength })
    }
}

/**
 *这是筛选条件的方法 
 *
 *
 */
    $(function(){
            var statusData = [
            {id:0,name:"全部状态"},
            {id:1,name:"&nbsp;&nbsp;待分班"},
            {id:2,name:"&nbsp;&nbsp;待确认入学"},
            {id:3,name:"&nbsp;&nbsp;正常就读"},
            {id:4,name:"&nbsp;&nbsp;已休学"},
            {id:5,name:"&nbsp;&nbsp;已退学"},
            {id:6,name:"&nbsp;&nbsp;已毕业"}
        ];
            
        $('#status_name').combobox({
            data:statusData,
            editable:false,
            valueField:'id',
            textField:'name',
            panelHeight:'auto',
            onSelect:function(record){
                var val = record.name.replace(/&nbsp;&nbsp;/,"");
                $("#status_name").combobox("setValue",record.id).combobox('setText',val);
                if(record.id >=5 && record.id != 10){
                    $('#school_id').combobox("loadData",schoolYearJson);
                    isSchoolYear = 1;
                }else if((record.id >0 && record.id < 5) || record.id == 10){
                    $('#school_id').combobox("loadData",schoolJson);
                    isSchoolYear = 0;
                }else{
                    isSchoolYear = 0;
                    $('#school_id').combobox("loadData",schoolJson);
                } 
                //$('#grade_id').combobox("loadData", [{id: '', name: '全部年级'}]);
                //$('#class_id').combobox("loadData", [{id: '', name: '全部班级'}]); 
                //var url = '${pageContext.request.contextPath}/json/grades.json';
                //$('#grade_id').combobox('reload', url);
            },
          
        })
 
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
            	
            	var id = record.id;
            	if(id!=""){
            	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeIdToSearch.action?id='+id+'';
            	$('#class_id').combobox({disabled:false,url:url});
            	}
            	else
            		$('#class_id').combobox({disabled:true});
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

        var ageData = [
            {id:'年龄',name:'年龄'},
            {id:1,name:'1岁'},
            {id:2,name:'2岁'},
            {id:3,name:'3岁'},
            {id:4,name:'4岁'},
            {id:5,name:'5岁'},
            {id:6,name:'6岁'},
            {id:7,name:'7岁'},
            {id:8,name:'8岁'},
            {id:9,name:'9岁'},
            {id:10,name:'10岁'},
            {id:11,name:'11岁'},
            {id:12,name:'12岁'},
            {id:13,name:'13岁'},
            {id:14,name:'14岁'}
        ];
        $("#age").combobox({
            data: ageData,
            valueField:'id',
            textField:'name',
            editable:false,
            value:'年龄',
            panelHeight:'auto'
        });

        //  清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });
        //入校日期 开始
        $('#start_date').datebox({
            buttons: buttons,
            editable:false
        });
        $("#start_date").datebox({ 
       	 onSelect : function(beginDate){ 
       	  $('#end_date').datebox().datebox('calendar').calendar({ 
       	   validator: function(date){ 
       	    return beginDate<=date;//<= 
       	   } 
       	  }); 
       	 } 
       	});
        //入校日期 结束
        $('#end_date').datebox({
            buttons: buttons,
            editable:false
        });
    })

    /**
     * 添加按钮函数
     * @param value
     * @param row
     * @param index
     * @returns {*}
     * 根据学生状态动态添加对应的操作.
     */
    
    function rowformater(value,row,index)
    {
    	/*  alert("rowforamter:value"+value);
    	 alert("rowforamter:row"+row);
    	 alert("rowforamter:value"+index);   */
        var rs = '';
    	 var rs_a='';
    	  //<shiro:hasPermission name="page_student_student_edit"> 
          //</shiro:hasPermission> 
             rs_a = '<a onclick="editStudent('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
            '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
            '</a>';
            var rs_b='';
        	rs_b = '<a onclick="delStudent('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">删除</span>' +
            '<span class="l-btn-icon icon-cancel">&nbsp;</span></span>' +
            '</a>';
       
        var rs_c = '';
		<shiro:hasPermission name="page_student_student_check"> 
        rs_c = '<a onclick="entryStudent('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">确认入学</span>' +
            '<span class="l-btn-icon icon-ok">&nbsp;</span></span>' +
            '</a>';
        </shiro:hasPermission> 
        var rs_d = '<a onclick="changeStatusStudent('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">休退</span>' +
            '<span class="l-btn-icon icon-lizhi">&nbsp;</span></span>' +
            '</a>';

        var rs_e = '<a onclick="changeClassStudent('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">调班</span>' +
            '<span class="l-btn-icon icon-diaodong">&nbsp;</span></span>' +
            '</a>';
            
        var rs_f = '<a onclick="moreStudent('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">详情</span>' +
            '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
            '</a>';

        var rs_g = '<a onclick="backStudent('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">复学</span>' +
            '<span class="l-btn-icon icon-fuzhi">&nbsp;</span></span>' +
            '</a>';

        //状态( 1待分班，2待确认入学，3正常就读，4已休学，5已退学，6已毕业)
        //alert(state);
        if(state == 1){
            rs = rs_a + rs_b; 
        }else if(state == 2){
            rs = rs_a + rs_b + rs_c;
        }else if(state == 3){
            rs = rs_a + rs_e + rs_d + rs_f;
        }else if(state == 4 || state == 5 || state == 6){
            rs = rs_g + rs_f;
        }
        
        return rs;
    }

     
    //状态回调函数
    //待分班     =  1;
    //待确认入学   = 2;
    //正常就读     =  3;
    
    //状态( 1待分班，2待确认入学，3正常就读，4已休学，5已退学，6已毕业)
    
     function setClassName(value, rec) 
     { 
    	 return rec.classes!= null ? rec.classes.class_name : ""; 
     }
    
     function setGradeName(value, rec) 
     { 
    	 if(rec.classes!= null){
    		 if(rec.classes.grade!=null){
    			 return rec.classes.grade.name;
    		 }
    	 }
    	 return ""; 
     }
    
    var state;
    
    function statusCallFun(value,row,index){
    	
    	//alert("index"+index);
    	//alert("value"+value); 
    	//alert(row.status);
    	//row.status=3;
    	/* alert(row.status);
    	alert("rowforamter:value"+value);
   	 alert("rowforamter:row"+row);
   	 alert("rowforamter:value"+index); */
   		state = value;
        var rs = '';
        if(value == 1 ){
            rs += '<span style="color:red;">待分班</span>';
        }else if(value == 2){
            rs += '<span style="color:blue;">待确认入学</span>';
        }else if(value == 3){
            rs += '<span style="color:green;">正常就读</span>';
        }else if(value == 4){
            rs += '<span style="color:green;">已休学</span>';
        }else if(value == 5){
            rs += '<span style="color:green;">已退学</span>';
        }else if(value == 6){
            rs += '<span style="color:green;">已毕业</span>';
        }
        return rs;
    }

    function addStudent(){
        var url = '${pageContext.request.contextPath}/page_student_student-add.action';
        var title = '学生注册';
        var callfun = 'callback';
        openTopWindow(url,title,1010,700,callfun);
    }

    function allotStudent(){
        var url = '${pageContext.request.contextPath}/page_student_student-batch-allot.action';
        var title = '批量分班';
        var callfun = 'callback';
        openTopWindow(url,title,1366,670,callfun);
    }
	
    function bulkEnrollmentConfirmation(){
        var url = '${pageContext.request.contextPath}/page_student_student-batch-enter.action';
        var title = '批量确认入学';
        var callfun = 'callback';
        openTopWindow(url,title,1366,668,callfun);
    }

    /* 导入学生 */
    function importStudent(){
        var url = '${pageContext.request.contextPath}/page_student_student-import.action';
        var title = '批量导入学生';
        var callfun = 'callback';
        openTopWindow(url,title,1381,588,callfun);
    }

    /* 导出学生 */
    function exportStudent(){
        var url = '${pageContext.request.contextPath}/page_student_student-export.action';
        var title = '导出学生';
        var callfun = 'callback';
        openTopWindow(url,title,1381,378,callfun);
    }    

    function editStudent(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
    	
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var url = '${pageContext.request.contextPath}/studentAction_edit.action?id='+id+'';
             var title = '编辑学生信息';
        var callfun = 'callback';
        openTopWindow(url,title,1010,688,callfun);
       
    }

    function delStudent(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
    	
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var url = '${pageContext.request.contextPath}/studentAction_delete.action?id='+id+'';
        var title = '删除学生';
        var callfun = 'callback';
        openTopWindow(url,title,578,238,callfun);
    }

    function entryStudent(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
 
       	$('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var url = '${pageContext.request.contextPath}/studentAction_enter.action?id='+id+'&status_name=3';
        var title = '学生入学确认';
        var callfun = 'callback';
        openTopWindow(url,title,768,328,callfun);
    }

    function changeStatusStudent(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;

        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var url = '${pageContext.request.contextPath}/studentAction_retirement.action?id='+id+'&status_name=3';
        var title = '学生休学或退学';
        var callfun = 'callback';
        openTopWindow(url,title,750,358,callfun);
    }

    function changeClassStudent(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
    	
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var url = '${pageContext.request.contextPath}/studentAction_regulate.action?id='+id+'';
        var title = '学生调班';
        var callfun = 'callback';
        openTopWindow(url,title,750,328,callfun);
    }

    function moreStudent(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
    	
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var url = '${pageContext.request.contextPath}/studentAction_about.action?id='+id+'';
        var title = '学生详情';
        var callfun = 'callback';
        openTopWindow(url,title,988,628,callfun);
    }

    function backStudent(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
    	
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var url = '${pageContext.request.contextPath}/studentAction_toschool.action?id='+id+'&status_name=3';
        var title = '学生复学';
        var callfun = 'callback';
        openTopWindow(url,title,728,398,callfun);
    }
    
    
    
    
	$(function(){
		//工具方法，可以将指定的表单中的输入项目序列号为json数据
		$.fn.serializeJson=function(){  
            var serializeObj={};  
            var array=this.serializeArray();
            $(array).each(function(){  
                if(serializeObj[this.name]){  
                    if($.isArray(serializeObj[this.name])){  
                        serializeObj[this.name].push(this.value);  
                    }else{  
                        serializeObj[this.name]=[serializeObj[this.name],this.value];  
                    }  
                }else{  
                    serializeObj[this.name]=this.value;   
                }  
            });  
            return serializeObj;  
        }
	}   
	);
    
    
    
    
    
    /**
     * 回调 函数
     */
    function callback(){
    
    	  $('#tt').datagrid('load',{
    		  tag:'1'
    	   /*    name: $('#name').combobox("getValue"),
    		  sex: $('#sex').combobox("getValue"), 
    		  yearMonthDay: $('#yearMonthDay').combobox("getValue"),
    		  */
    		 /*  age: $('#age').combobox("getValue"), 
    		  grade_id: $('#grade_id').combobox("getValue"),
    		   *//*   class_id: $('#class_id').combobox("getValue"),
                		  parent_name: $('#parent_name').combobox("getValue"),
    		  
    		  phone: $('#phone').combobox("getValue"),
    		  enter_date: $('#enter_date').combobox("getValue"),
    		  
    		  address: $('#address').combobox("getValue"),
    		  status_name: $('#status_name').combobox("getValue"),
    		  edit: $('#edit').combobox("getValue"), */            
        });  
    }

    /**
     * 搜索
     */
    function doSearch(){
    	
			//var p = $("#searchForm").serializeJson();//{id:xx,name:yy,age:zz}
			/* 
			var array;
			$("#tt").datagrid("load",array);
			 */
			 
			//alert($('#status_name').combobox("getValue"));
			//重新发起ajax请求，提交参数
			$("#tt").datagrid("load",{ 
				status_name:$('#status_name').combobox("getValue"),
	            grade_id: $('#grade_id').combobox('getValue'),
	            class_id: $('#class_id').combobox("getValue"),
	            age: $('#age').combobox("getValue"),
	            start_date:$('#start_date').datebox("getText"),
	            end_date:$('#end_date').datebox("getText"),
	            name:$('#name').textbox("getText"),
	            tag:'1'
	        });
		
	    	/* alert($('#grade_id').combobox('getText'));
	     	alert($('#class_id').combobox('getText'));
	    	alert($('#age').combobox('getText'));
	    	alert($('#start_date').combobox('getText'));
	    	alert($('#end_date').combobox('getText'));
	    	alert($('#number_name').combobox('getText'));  */
	
	//alert($('#grade_id').combotree("getValue"));
	//alert($('#grade_id').textField);
	//alert($('#grade_id').combobox('getText')); 
	//var row = $("#edit").datagrid("getSelected");
    
        //callback();
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