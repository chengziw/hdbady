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

<div class="easyui-layout" fit="true">
	
	<div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">	

	    <!--工具按钮和筛选栏目开始-->
		<div class="easyui-layout" fit="true" border="false">

                        <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:238px; padding-right:18px;" border="false">
            					<shiro:hasPermission name="page_teacher_teacher_add">
                                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addTeacher()">录入教职工</a>
                                </shiro:hasPermission>    
                                                    <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-daoru" onclick="addExcelTeacher()">导入</a>
                    <a href="#" class="easyui-linkbutton" iconCls="icon-daochu" onclick="outExcelTeacher()">导出</a> -->
                            </div>
            <!--工具栏结束-->
            
            <!--筛选条件开始-->
            
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：

    			<!--<input id="bloc_school_id" value="" style="cursor:pointer;width:140px;" class="easyui-combobox" data-options="panelHeight:'auto'">-->
    		
    			<input id="structure_name" name="structure.id" value="" style="cursor:pointer;width:180px;" class="easyui-combotree" data-options="panelHeight:'320'">

                <input id="duty_name" name="teacherDuty.id" value="" style="cursor:pointer;width:100px;" class="easyui-combobox" data-options="panelHeight:'auto'">

    			<select id="status" name="status" class="easyui-combobox"  data-options="panelHeight:'auto'" style="cursor:pointer;width:80px;">
    				<option value="-1">全部状态</option>
                                                <option value="1">正常在校</option>
                                                <option value="2">休假中</option>
                                                <option value="3">已离职</option>
                                                <option value="4">已退休</option>
                    
    			</select>

                &nbsp;&nbsp;姓名：<input id="teacher_name" name="teacher_name" class="easyui-textbox" value="" style="width:80px;">

                &nbsp;&nbsp;入职日期：<input id="entry_time_start" class="easyui-datebox" data-options="editable:false" style="width:100px;"> 至 <input id="entry_time_end" class="easyui-datebox" data-options="editable:false" style="width:100px;">

                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->

        </div>
		<!--工具按钮和筛选栏目结束-->

	</div>

	<div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
		<table id="tt" class="easyui-datagrid"
		<%-- ${pageContext.request.contextPath}/teacherAction_pageQuery.action --%>
			   data-options="url:'${pageContext.request.contextPath}/teacherAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
			   onLoadSuccess: dataLoadSuccess,
			   singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
			<thead>
			<tr>
                <th data-options="field:'worknumber',width:50" sortable="true"><span id =worknumber>工号</span></th>
                <th data-options="field:'teacher_name',width:50" sortable="true">姓名</th>
                <th data-options="field:'sex_name',width:40" sortable="true">性别</th>
                <th data-options="field:'brither_name',width:65" sortable="true">出生日期</th>
               <!--  <th data-options="field:'age_name',width:50" sortable="true">年龄</th> -->
                <th data-options="field:'phone',width:80">手机（登录名）</th>
                <th data-options="field:'weixin',width:60">微信</th>
                <th data-options="field:'qq',width:60">QQ号</th>
                <!--<th data-options="field:'school_name',width:120" sortable="true">学校</th>-->
                <th data-options="field:'structure_name',width:160, formatter:setStructureName" sortable="true">所属部门</th>
                <th data-options="field:'teacherDuty.duty_name',width:60, formatter:setDutyName" sortable="true ">职务</th>
                <th data-options="field:'entry_time_name',width:60" sortable="true">入职日期</th>
                <th data-options="field:'left_time_name',width:60" sortable="true">离职日期</th>
                <th data-options="field:'status_name',width:60, formatter:setStatusColor" sortable="true">状态</th>
                <th data-options="field:'last_login_time_name',width:100" sortable="true">最近登录时间</th>
                <th data-options="field:'create_time_name',width:100" sortable="true">录入时间</th>
                                                    <th data-options="field:'note',width:60" sortable="true">备注</th>
   					                                <th data-options="field:'field1',width:60" sortable="true">自定义资料项1</th>
                                                    <th data-options="field:'field2',width:60" sortable="true">自定义资料项2</th>
                                                    <th data-options="field:'field3',width:60" sortable="true">自定义资料项3</th>
                                <th data-options="field:'edit',width:220,formatter:  rowformater">操作</th>
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

        $.parser.parse($('.datagrid-row td[field="edit"] span.parse-easyui'));
    }


    $(function(){

        $('#structure_name').combotree({
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
                $('#structure_name').combotree("setValue","全部部门");
            },
            editable:false
        })

        $('#duty_name').combobox({
        	url:'${pageContext.request.contextPath}/teacherDutyAction_findAllTeacherDutyToSelect.action',
            valueField:'id',
            textField:'duty_id',
            editable:false,
            onLoadSuccess:function(){
            	$('#duty_name').combobox("setValue","全部职务");
            }
        })

        $("#status").combobox({
            editable:false
        })

        //  清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });
        //入职日期 开始
        $('#entry_time_start').datebox({
            buttons: buttons
        });
        $("#entry_time_start").datebox({ 
          	 onSelect : function(beginDate){ 
          	  $('#entry_time_end').datebox().datebox('calendar').calendar({ 
          	   validator: function(date){ 
          	    return beginDate<=date;//<= 
          	   } 
          	  }); 
          	 } 
          	});
        //入职日期 结束
        $('#entry_time_end').datebox({
            buttons: buttons
        });
    })

    /**
     * 添加按钮函数
     * @param value
     * @param row
     * @param index
     * @returns {*}
     */
  /*   function rowformater(value,row,index)
    {
        var rs = '';
                    var rs_a = '<a onclick="editTeacher('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                '</a>';

            var rs_b = '<option value="1-'+index+'">调动</option>';

            var rs_c = '<option value="2-'+index+'">休假</option>';

            var rs_d = '<option value="3-'+index+'">离退</option>';

            var rs_f = '<option value="4-'+index+'">复工</option>';

            var rs_g = '<a onclick="moreTeacher('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">详情</span>' +
                '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
                '</a>';

            var rs_h = '<option value="5-'+index+'">复职</option>';

            if(row.status_name == 1 || row.status_name == 2){
                rs += rs_a;
            }
            if(row.status_name == 3 || row.status_name == 4){
                rs += rs_g ;
            }

            rs += '<span class="parse-easyui">';
            rs += '<select class="easyui-combobox" data-options="editable:false, panelHeight:100, onSelect: orderSelect">';
            rs += '<option value="0-'+index+'">变动</option>';
            if(row.status_name == 1){
                rs += rs_b + rs_c + rs_d;
            }else if(row.status_name == 2){
                rs += rs_f;
            }else if(row.status_name == 3 || row.status_name == 4){
                rs += rs_h;
            }
            rs += '</select>'
            rs += '</span>';

        
                var rs_i = '<a onclick="roleTeacher('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">权限</span>' +
            '<span class="l-btn-icon icon-quanxian">&nbsp;</span></span>' +
            '</a>';
        rs += rs_i;
        
        return rs;
    }

      	// 设置状态文字颜色 
     function setStatusColor(value,row,index){
         var color = '';
 		var text = '';
         if(row.status_name == 1){
             color = 'green';
             text = '正常在校';
         }else if(row.status_name == 2){
             color = 'blue';
             text = '休假中';
         }else if(row.status_name == 3){
             color = 'red';
             text = '已离职';
         }else if(row.status_name == 4){
             color = 'red';
             text = '已退休';
         }

         var rs = '<span style="color:'+color+';">'+text+'</span>';
         return rs;
     } */
     
     function setStructureName(value, rec) 
     { 
    	 return rec.structure != null ? rec.structure.name : ""; 
     }
     
     function setDutyName(value, rec) 
     { 
    	 return rec.teacherDuty != null ? rec.teacherDuty.duty_name : ""; 
     }
     
     function rowformater(value,row,index)
     {
         var rs = '';
         var rs_a = '';
         <shiro:hasPermission name="page_teacher_teacher_edit">
                     rs_a = '<a onclick="editTeacher('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                 '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                 '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                 '</a>';
         </shiro:hasPermission>

             var rs_b = '<option value="1-'+index+'">调动</option>';

             var rs_c = '<option value="2-'+index+'">休假</option>';

             var rs_d = '<option value="3-'+index+'">离退</option>';

             var rs_f = '<option value="4-'+index+'">复工</option>';

             var rs_g = '<a onclick="moreTeacher('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                 '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">详情</span>' +
                 '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
                 '</a>';

             var rs_h = '<option value="5-'+index+'">复职</option>';

             if(row.status == 1 || row.status == 2){
                 rs += rs_a;
             }
             if(row.status == 3 || row.status == 4){
                 rs += rs_g ;
             }

             rs += '<span class="parse-easyui">';
             rs += '<select class="easyui-combobox" data-options="editable:false, panelHeight:100, onSelect: orderSelect">';
             rs += '<option value="0-'+index+'">变动</option>';
             if(row.status == 1){
                 rs += rs_b + rs_c + rs_d;
             }else if(row.status == 2){
                 rs += rs_f;
             }else if(row.status == 3 || row.status == 4){
                 rs += rs_h;
             }
             rs += '</select>'
             rs += '</span>';

         
                 /* var rs_i = '<a onclick="roleTeacher('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
             '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">权限</span>' +
             '<span class="l-btn-icon icon-quanxian">&nbsp;</span></span>' +
             '</a>';
         rs += rs_i; */
         
         return rs;
     }

     //设置状态文字颜色 
     function setStatusColor(value,row,index){
         var color = '';

         if(row.status == 1){
             color = 'green';
         }else if(row.status == 2){
             color = 'blue';
         }else if(row.status == 3){
             color = 'red';
         }else if(row.status == 4){
             color = 'red';
         }

         var rs = '<span style="color:'+color+';">'+row.status_name+'</span>';
         return rs;
     } 
     
   	/* // 设置状态文字颜色 
     function setStatusColor(value,row,index){
         var color = '';
 		var text = '';
         if(row.status_name == 1){
             color = 'green';
             text = '正常在校';
         }else if(row.status_name == 2){
             color = 'blue';
             text = '休假中';
         }else if(row.status_name == 3){
             color = 'red';
             text = '已离职';
         }else if(row.status_name == 4){
             color = 'red';
             text = '已退休';
         }

         var rs = '<span style="color:'+color+';">'+text+'</span>';
         return rs;
     }  */
     
     
     
     
     
     


    /**
     * 教职工录入
     */
        function addTeacher(){
        var url = '${pageContext.request.contextPath}/page_teacher_teacher-add.action';
        var title = '教职工录入';
        var callfun = 'callback';
        openTopWindow(url,title,868,438,callfun);
    }
        /**
     * 导入教职工
     */
        function addExcelTeacher(){
        var url = '${pageContext.request.contextPath}/page_teacher_teacher-import.action';
        var title = '批量导入教职工';
        var callfun = 'callback';
        openTopWindow(url,title,1088,568,callfun);
    }

    /**
     * 导出教职工
     */
    function outExcelTeacher(){
    	var url = '${pageContext.request.contextPath}/page_teacher_teacher-export.action';
        var title = '教职工导出';
        var callfun = 'callback';
        openTopWindow(url,title,568,368,callfun);
    }

    function editTeacher(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	id = row.id;
    	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/teacherAction_edit.action?id='+id+'';
        var title = '教职工编辑';
        var callfun = 'callback';
        openTopWindow(url,title,868,438,callfun);
    }

    function shiftTeacher(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	id = row.id;
    
    	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/teacherAction_shift.action?id='+id+'';
        var title = '教职工调动';
        var callfun = 'callback';
        openTopWindow(url,title,808,308,callfun);
    }

    function holidayTeacher(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	id = row.id;
    
    	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/teacherAction_vacation.action?id='+id+'';
        var title = '教职工休假';
        var callfun = 'callback';
        openTopWindow(url,title,788,348,callfun);
    }

    function turnoverTeacher(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	id = row.id;
    
    	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/teacherAction_retireOrLeave.action?id='+id+'';
        var title = '教职工离职或退休';
        var callfun = 'callback';
        openTopWindow(url,title,788,348,callfun);
    }

    function retirementTeacher(index){
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = row.retirementUrl;
        var title = '教职工退休信息录入';
        var callfun = 'callback';
        openTopWindow(url,title,1068,468,callfun);
    }

    function returnTeacher(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	id = row.id;
       	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/teacherAction_multiplex.action?id='+id+'';
        var title = '复工（结束休假）';
        var callfun = 'callback';
        openTopWindow(url,title,788,348,callfun);
    }

    function rehabTeacher(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	id = row.id;
       	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/teacherAction_resume.action?id='+id+'';
        var title = '复职（返校工作）';
        var callfun = 'callback';
        openTopWindow(url,title,788,348,callfun);
    }

        function moreTeacher(index){
       	$('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
       	id = row.id;
        	
        	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/teacherAction_about.action?id='+id+'';
        var title = '教职工详情';
        var callfun = 'callback';
        openTopWindow(url,title,868,438,callfun);
    }

    function roleTeacher(index){
    	$('#tt').datagrid('selectRow', index);
       	var row = $('#tt').datagrid('getSelected');
       	id = row.id;
    
    	
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var url = '${pageContext.request.contextPath}/teacherAction_power.action?id='+id+'';
        var title = '教职工权限';
        var callfun = 'callback';
        openTopWindow(url,title,768,468,callfun);
    }

    /* select动作 */
    function orderSelect(record){
        var value = record.value;
        var val = Number(value.split('-')[0]);
        var index = Number(value.split('-')[1]);

        switch (val){
            case 1: //调动
                shiftTeacher(index);
                break;
            case 2: //休假
                holidayTeacher(index);
                break;
            case 3: //离退
                turnoverTeacher(index);
                break;
            case 4: //复工
                returnTeacher(index);
                break;
            case 5: //复职
                rehabTeacher(index);
                break;
            default :
                break;
        }
    }

    /**
     * 回调 函数
     *
     */
    function callback(){
        $('#tt').datagrid('reload',{
            structure_name: $('#structure_name').combotree("getValue"),
            duty_name: $('#duty_name').combobox("getValue"),
            teacher_name:$('#teacher_name').textbox("getValue"),
            status:$('#status').combobox("getValue"),
            entry_time_start:$('#entry_time_start').datebox("getValue"),
            entry_time_end:$('#entry_time_end').datebox("getValue"),
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