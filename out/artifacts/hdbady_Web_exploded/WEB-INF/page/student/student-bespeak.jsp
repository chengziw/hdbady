<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
<html>
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
	
	<div region="north" border="false" style="padding:10px;height:100px; padding-top:16px; padding-bottom:0px; overflow:hidden;">	

	    <!--工具按钮和筛选栏目开始-->
		<div class="easyui-layout" fit="true" border="false">

            <!--工具栏开始-->
             <shiro:hasPermission name="page_student_student-bespeak_add">
                <div id="main_body_tool" region="west" style="width:128px; padding-right:0px;" border="false">
                	<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addStudentBespeak()">录入预约学生</a>
                </div>
             </shiro:hasPermission>   
            <!--工具栏结束-->


            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：

    			<input id="grade_id" name="grade_id" value="" data-options="panelHeight:'auto'" style="width:80px; cursor:pointer;">

                <input id="class_id" name="classes_id" value="" data-options="panelHeight:'auto'" style="width:150px; cursor:pointer;">

                <input id="age" style="cursor:pointer;width:80px;" data-options="panelHeight:'auto'">

                <!-- <input id="bespeak_type_name" style="width:105px; cursor:pointer;" data-options="panelHeight:'auto'"> -->

    			<input id="status_name" style="width:90px; cursor:pointer;" data-options="panelHeight:'auto'">

                <!-- <input id="attend_shool_time_name" style="width:130px; cursor:pointer;" data-options="panelHeight:'auto'"> -->

                &nbsp;&nbsp;学生姓名：<input id="name" class="easyui-textbox" style="cursor:pointer;width:80px;" value=""data-options="prompt:''">

                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->

        </div>
		<!--工具按钮和筛选栏目结束-->

	</div>

	<div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
		<table id="tt" class="easyui-datagrid"
			   data-options="url:'${pageContext.request.contextPath}/studentBespeakAction_pageQuery.action',fitColumns:true,pagination:true,
			   onClickRow: setBespeakMemo,
			   onLoadSuccess: dataLoadSuccess,
			   pageList:[15,20,25,30,40,50,100],pageSize:15,rownumbers:true,checkOnSelect:true,singleSelect:true">
			<thead>
			<tr>
				<th data-options="field:'name',width:60"><span id =name>姓名</span></th>
				<th data-options="field:'sex',width:50" sortable="true">性别</th>
				<th data-options="field:'yearMonthDay',width:80" sortable="true">生日</th>
                <th data-options="field:'age',width:50" sortable="true">年龄</th>
                <th data-options="field:'is_local',width:50" sortable="true">本地生</th>
                <th data-options="field:'is_teacherson',width:60" sortable="true">教职子弟</th>
                <th data-options="field:'health_status',width:60" sortable="true">身体状况</th>
                <th data-options="field:'grade_id',width:60, formatter:setGradeName" sortable="true">年级</th>
                <th data-options="field:'class_id',width:100, formatter:setClassName" sortable="true">班级</th>
                <th data-options="field:'parent_name',width:100">家长姓名（关系）</th>
                <th data-options="field:'phone',width:80">家长手机</th>
                <th data-options="field:'teacher_name',width:120" sortable="true">接待老师</th>
                <th data-options="field:'create_time_name',width:120" sortable="true">预约时间</th>
                <th data-options="field:'attend_shool_time_name',width:120" sortable="true">预期到校报名时间</th>
                <th data-options="field:'status_name',width:80,formatter:  statusCallFun" sortable="true">状态</th>
				<th data-options="field:'edit',width:130,formatter:  rowformater">操作</th>
			</tr>
			</thead>
		</table>
        <!--数据表结束-->
        <table cellpadding="0" cellspacing="0" style="width:100%; margin: auto; border: 0px solid #dedede; margin-top:10px;">
            <tr>
                <td valign="top" width="6">

                </td>
                <td valign="top" width="300" id="bespeakInfo" style="line-height:22px;">
                    <p>家庭住址：</p>
                    <p>学生要求：</p>
                    <p>学校备注：</p>
                </td>
				
                <td valign="top" width="12">

                </td>
				
                <td valign="top"><!-- to do -->
                    <table id="tb" class="easyui-datagrid" data-options="method:'get',
                    pagination:true,fitColumns:true,onLoadSuccess:dataLoadSuccessTb,
                    pageList:[5,10,20],pageSize:5,rownumbers:true,singleSelect:true">
                    
                       <thead>
                        <th data-options="field:'desctext',width:120">跟进内容</th>
                        <th data-options="field:'create_time_name',width:40">跟进时间</th>
                        <th data-options="field:'teacher_name',width:40">跟进人</th>
                        </thead>
                    </table><!-- to do studentBespeakDescAction_* -->
                    <form style="margin-top:10px;" id="ff" method="post" data-href="${pageContext.request.contextPath}/studentBespeakDescAction_addDesc.action">
                        <input id="desctext" name="desctext" value="" class="easyui-textbox" required="true" data-options="novalidate:true,multiline:true,validType:'noNull',prompt:'在此填写跟进内容'" style="width:658px;height:96px;">
                        <p>
                        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveFrom()">提交</a>
                        <a href="#" class="easyui-linkbutton panel-tool-close" iconCls="icon-cancel" onclick="clearFrom()">清空</a>
                        </p>
                    </form>
                </td>
            </tr>
        </table>
	</div>

</div>

<script type="text/javascript">
	/**
	 * 行点击事件
	 * @param rowIndex
	 * @param rowData
	 */
	var setBespeakMemoLocked,setBespeakMemoId; //定义 数据锁，避免重复加载
	function setBespeakMemo(rowIndex,rowData){
	    if(setBespeakMemoId == rowData.id) return;
	    setBespeakMemoId = rowData.id;
	    setBespeakMemoLocked = rowIndex;
	    
		var url = '${pageContext.request.contextPath}/studentBespeakDescAction_PageQuery.action?id='+setBespeakMemoId+'';
	    var html = '';
	    html += '<p>家庭住址：'+rowData.address+'</p>';
	    html += '<p>学生要求：<br>&nbsp;&nbsp;&nbsp;&nbsp;'+rowData.demand+'</p>';
	    html += '<p>学校备注：<br>&nbsp;&nbsp;&nbsp;&nbsp;'+rowData.note+'</p>';
	    $("#bespeakInfo").html(html);
	    $("#tb").datagrid('load',url);
	}



    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u3010\u5b9d\u5b89\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":28,"name":"\u5c0f\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":29,"name":"\u4e2d\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":30,"name":"\u5927\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'name', colspan: 16 })
        }
    }
    
    /* function selectData(rowIndex, rowData){
    	alert("select");
    } */
    


    function dataLoadSuccessTb(data){
    	//alert("点击一行");
    	/* $('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	id = row.id; */
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { desctext: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'desctext', colspan: 13 })
        }
    }
    

    function saveFrom(){
    	
        if(setBespeakMemoLocked == undefined){
            $.messager.alert('提示','请选择一条数据','error')
            return false;
        }
        $("#tt").datagrid('selectRow',setBespeakMemoLocked);
        var row = $('#tt').datagrid('getSelected');
        if(! row || setBespeakMemoId != row.id){
            $.messager.alert('提示','请选择一条数据','error')
            return false;
        }
        var url = $("#ff").attr('data-href');
        $('#ff').form('submit',{
            url:url,
            onSubmit:function(params){
                params.id = row.id;
                params.sinKeyMemo = row.sinKeyMemo;
                return $(this).form('enableValidation').form('validate');
            },
            success:function(result){
                var result = eval('('+result+')');
                if (result.status==1){
                    clearFrom();
                    $("#tb").datagrid('load',row.memoUrl);
                        //validatebox('disableValidation');
                    $("#ff").form('disableValidation');
                }else {
                    $.messager.alert('提示',result.info,'error')
                }
            }
        });
    }

    function clearFrom(){
        $('#ff').form('clear');
    }

    $(function(){
        /*搜索  学校年级联动*/
       /*  $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            onLoadSuccess:function(){
                $('#school_id').combobox("setValue","全部学校");
            },
            onSelect:function(record){
                if (record.gradeList != undefined) {
                    $('#grade_id').combobox("loadData", record.gradeList);
                } else {
                    $('#grade_id').combobox("loadData", [{id: 0, name: '全部年级'}]);
                }
            }
        }); */

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
            {id:"年龄",name:'年龄'},
            {id:"1",name:'1岁'},
            {id:"2",name:'2岁'},
            {id:"3",name:'3岁'},
            {id:"4",name:'4岁'},
            {id:"5",name:'5岁'},
            {id:"6",name:'6岁'},
            {id:"7",name:'7岁以上'}
        ];
        $("#age").combobox({
            data: ageData,
            valueField:'id',
            textField:'name',
            value:'年龄',
            editable:false,
            panelHeight:'auto'
        });

       /*  $('#bespeak_type_name').combobox({
            data:[{id:"",name:"全部预约方式",selected:true},{id:"手机APP预约",name:"手机APP预约"},{id:"到校现场预约",name:"到校现场预约"}],
            valueField:'id',
            textField:'name',
            editable:false,
            onSelect:function(record){
            }
        }) */

        var statusData = [
            {id:'',name:"全部状态"}
            ,{id:'1',name:'待去电核实'},{id:'2',name:'待到校报名'},{id:'3',name:'已注册入学'},{id:'4',name:'未入学'}        ];
        $("#status_name").combobox({
            data:statusData,
            valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(record){
               // $("#status_name").combobox("setValue","全部状态");
            },
            onSelect:function(record){
                if(record.id == '已注册入学'){
                    $('#attend_shool_time_name').combobox("setText","选择预期到校报名时间").combobox({ disabled: true });
                }else{
                    $('#attend_shool_time_name').combobox({ disabled: false });
                }
            }
        })

       /*  $('#attend_shool_time_name').combobox({
            data:[{id:"",name:"预期到校报名时间",selected:true},{id:"今天到校报名",name:"今天到校报名"},{id:"明天到校报名",name:"明天到校报名"},{id:"后天到校报名",name:"后天到校报名"}],
            valueField:'id',
            textField:'name',
            editable:false
        })  */
      
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
        
        /*         rs += '<a onclick="editStudentBespeak('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
            '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
            '</a>';

        if(row.status==2 || row.status==1){
            rs += '<a onclick="changeStudentBespeak('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">审核</span>' +
                '<span class="l-btn-icon icon-shenhe">&nbsp;</span></span>' +
                '</a>'
        }
        
        if(row.status == 3 || row.status == 4){
            rs = '';
        }  */
        var rs1='';
        var rs2='';
        
        
        <shiro:hasPermission name="page_student_student-bespeak_edit">
	        rs1 = '<a onclick="editStudentBespeak('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
	        '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
	        '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
	        '</a>';
        </shiro:hasPermission>
        <shiro:hasPermission name="page_student_student-bespeak_check">
	        rs2 = '<a onclick="changeStudentBespeak('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
	        '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">审核</span>' +
	        '<span class="l-btn-icon icon-shenhe">&nbsp;</span></span>' +
	        '</a>';
        </shiro:hasPermission>
        
        if(state == 1){
            rs = rs1 + rs2; 
        }else if(state == 2){
        	rs = rs1 + rs2;
        } 
        
        return rs;
    }
	
    //状态回调函数
    function statusCallFun(value,row,index){
    	//{id:1,name:'待去电核实'},{id:2,name:'待到校报名'},{id:3,name:'已注册入学'},{id:4,name:'未入学'} 
       /*  var rs = '';
        if(row.status == 1 ){
            rs += '<span style="color:red;">'+row.status_name+'</span>';
        }else if(row.status == 2){
            rs += '<span style="color:blue;">'+row.status_name+'</span>';
        }else if(row.status == 3){
            rs += '<span style="color:green;">'+row.status_name+'</span>';
        }else{
            rs += row.status_name;
        } */
         state = value;
    	 var rs = '';
         if(value == 1 ){
             rs += '<span style="color:red;">待去电核实</span>';
         }else if(value == 2){
             rs += '<span style="color:blue;">待到校报名</span>';
         }else if(value == 3){
             rs += '<span style="color:green;">已注册入学</span>';
         }else if(value == 4){
             rs += '<span style="color:green;">未入学</span>';
         }

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
   	 //return rec.classes.grade != null ? rec.classes.grade.name : ""; 
    }

    //预约方式 回调方法
    function typeCallFun(value,row,index){
        var color = '';
        if(row.bespeak_type_name == 1 ){
            color += 'red';
        }
        var rs = '<span style="color:'+color+';">'+value+'</span>';
        return rs;
    }

    
    function addStudentBespeak(){
    	
        var url = '${pageContext.request.contextPath}/page_student_student-bespeak-add.action';
        var title = '现场预约学生信息录入';
        var callfun = 'callback';
        openTopWindow(url,title,1040,588,callfun);
    }

    function editStudentBespeak(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
    	
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/studentBespeakAction_edit.action?id='+id+'';
        var title = '编辑预约学生';
        var callfun = 'callback';
        openTopWindow(url,title,1040,588,callfun);
    }

    function changeStudentBespeak(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	var id = row.id;
    	
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/studentBespeakAction_check.action?id='+id+'';
        var title = '学生预约审核';
        var callfun = 'callback';
        openTopWindow(url,title,718,300,callfun);
    }
    /**
     * 回调 函数
     */
    function callback(){
        $('#tt').datagrid('load',{
            grade_id: $('#grade_id').combotree("getValue"),
            class_id: $('#class_id').combobox("getValue"),
            age: $('#age').combobox("getValue"),
            /* bespeak_type_name: $('#bespeak_type_name').combobox("getValue"), */
            status_name: $('#status_name').combobox("getValue"),
            /* attend_shool_time_name: $('#attend_shool_time_name').combobox("getValue"), */
            name: $('#name').textbox("getValue"),
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