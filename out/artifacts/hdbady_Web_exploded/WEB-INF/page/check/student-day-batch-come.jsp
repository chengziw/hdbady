<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<body style="padding: 0;margin: 0" class="panel-noscroll">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<link rel="stylesheet" type="text/css" href="css/default.css">

<div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 788px; height: 467px;">
    <div class="panel layout-panel layout-panel-north" style="width: 788px; left: 0px; top: 0px;"><div region="north" border="false" style="padding: 12px 10px 0px; width: 768px; height: 36px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body panel-noscroll">

        <!--工具按钮和筛选栏目开始-->
        <div class="easyui-layout layout easyui-fluid" fit="true" border="false" style="width: 768px; height: 36px;">

            
            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px; padding-bottom:8px;">
            	<%-- <span><label>学校名称：</label><input id="school_id" class="easyui-validatebox" name="school_id" value="" data-options="novalidate:true, width: 140 "/></span> --%>
                <span>&nbsp;&nbsp;<label>年级：</label><input id="grade_id" class="easyui-validatebox" name="grade_id" value="" data-options="novalidate:true, width: 80 ,panelHeight:'auto'"/></span>
                <span>&nbsp;&nbsp;<label>班级：</label><input id="class_id" class="easyui-validatebox" name="class_id" value="" data-options="novalidate:true, width: 150 ,panelHeight:'auto'"/></span>
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onClick="doSearch();return false;">查询</a>
            </div>
            <!--筛选条件结束-->
            

        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
        <!--工具按钮和筛选栏目结束-->

    </div></div>

    <div class="panel layout-panel layout-panel-center" style="width: 788px; left: 0px; top: 48px;"><div region="center" border="false" id="main_body_datagrid" style="padding: 0px; overflow: hidden; width: 788px; height: 382px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <div style="height:336px; " class="panel-noscroll">
            <!--数据表开始-->
         
             
             
             <table id="tt" class="easyui-datagrid"
                   data-options="fitColumns:true,fit:true,pagination:true, url:'${pageContext.request.contextPath}/studentCheckAction_comeSchoolStudent.action',
               onLoadSuccess: dataLoadSuccess,
                   pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
                <thead>
                <tr>
				
                    <th data-options="field:'ck',checkbox:true"></th>
                    
                    <!-- <th data-options="field:'grade_name',width:60" sortable="true">年级</th>
                    <th data-options="field:'class_name',width:60" sortable="true">班级</th>
                    <th data-options="field:'name',width:100">姓名(英文名)</th>
                    <th data-options="field:'sex_name',width:50" sortable="true">性别</th>
                    <th data-options="field:'yearMonthDay',width:80" sortable="true">生日</th>
                    <th data-options="field:'family_name',width:110">家长姓名（关系）</th>
                    <th data-options="field:'phone',width:80">家长手机</th>
                    <th data-options="field:'status',width:60" sortable="true">状态</th> -->
                    
                    
                <th data-options="field:'grade_name', width:60, formatter: setGradeName" sortable="true">年级</th>
                <th data-options="field:'class_name', width:60, formatter: setClassName" sortable="true">班级</th>
                <th data-options="field:'student_name', width:60, formatter: setStudentName" sortable="true">姓名</th>
                <th data-options="field:'sex_label', width:50, formatter: setSex" sortable="true">性别</th>
                <th data-options="field:'yearMonthDay', width:80, formatter: setYearMonthDay" sortable="true">生日</th>
                <th data-options="field:'parent_name', width:100, formatter: setParentName">家长姓名(关系)</th>
                <th data-options="field:'phone', width:90, formatter: setphone">手机</th>
                <th data-options="field:'status_label',width:70,formatter:setStatusColor">状态</th>
                </tr>
                </thead>
            </table>  
             
             
             
             
             <!--数据表结束-->
        </div>
        <div style="padding-top:0px; padding-bottom:0px; padding-left:12px;">
            <p>确认到校时间：今天 <input type="text" id="leave_time" value="15:26" style="width:80px;"/>
                <span id="show-error-message-box" style="color: red"></span>
            </p>

        </div>
    </div></div>

    <div class="panel layout-panel layout-panel-south" style="width: 788px; left: 0px; top: 430px;"><div region="south" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 788px; height: 37px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:3px; float:right;">
            <a id="save-btn" href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-ok" onclick="approval()" group="">将选中的学生确认到校</a>
            <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
        </div>
    </div></div>
<div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>

<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"},{"id":55,"name":"81112(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]},{"id":50,"name":"111","sort":6,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":51,"name":"11112","sort":7,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":64,"name":"\u5c0f\u6258","sort":8,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":93,"name":"\u5218\u73ed","sort":9,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":94,"name":"455","sort":10,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolJson = eval('('+schoolJson+')');
   
    
    
    function setGradeName(value, rec) { 
    	if(rec.student != null){
    		if(rec.student.classes != null){
    			if(rec.student.classes.grade!=null){
    				return rec.student.classes.grade.name;
    			}
    		}
    	}
    	return "";
    	
    }
    function setClassName(value, rec) { 
    	if(rec.student != null){
    		if(rec.student.classes != null){
    			return rec.student.classes.class_name;
    		}
    	}
    	return "";
    	
    }
    function setStudentName(value, rec){ 
   	    return rec.student!= null ? rec.student.name : ""; 
    }
    function setSex(value, rec){ 
   	    return rec.student!= null ? rec.student.sex : ""; 
    }
    function setYearMonthDay(value, rec){ 
   	    return rec.student!= null ? rec.student.yearMonthDay : ""; 
    }    
    function setParentName(value, rec){ 
   	    return rec.student!= null ? rec.student.parent_name : ""; 
    }
    function setphone(value, rec){ 
   	    return rec.student!= null ? rec.student.phone : ""; 
    }

    /* 设置状态文字颜色 */
    function setStatusColor(value,row,index){
        var color = '';

        if(row.status == 3){
            color = 'blue';
        }else if(row.status == 4){
            color = 'green';
        } else {
            color = 'red';
        }

        var rs = '<span style="color:'+color+';">'+row.status_label+'</span>';
        return rs;
    }

    
    
    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: 8 })
            $('input[type="checkbox"]').eq(1).hide();
        }
    }

    /* 到校确认 */
    function approval(){
        $('#show-error-message-box').html('');

        var rows = $("#tt").datagrid('getSelections'); //将选中的一行记录赋值给一个对象
        if (rows.length > 0){
            if ($('#save-btn').hasClass('mylinkbtn-load')) {
                return false;
            }

            $('#save-btn').addClass('mylinkbtn-load');
            var leaveTime = $('#leave_time').val();

            /* var entities = "[";

            for (var i in rows) {
                entities += (i == 0? '': ',') + JSON.stringify(rows[i]);
            }
            entities += ']'; */
            
            var entities = "";

            for (var i in rows) {
                entities += (i == 0? '': ',') + rows[i].id;
            }
            entities += '';

            /* 异步提交表单 */
            $.ajax({
                type: 'POST',
                url:  '${pageContext.request.contextPath}/studentCheckAction_comeSchoolStudentEnter.action',
                dataType: 'json',
                data: {'ids': entities, 'leave_time': leaveTime},
                success: function(data) {
                    $('#save-btn').removeClass('mylinkbtn-load');
                    if (data.errMeg == '') {
                        parent.window.closeWinIsReloadData = 1;
                        parent.$('#openWindow').window('close');
                    } else {
                        $('#show-error-message-box').html(data.errMeg);
                        return false;
                    }
                }
            });
        }
    }

    /**
     * 回调 函数
     */
    function doSearch(){
        $('#tt').datagrid('reload',{
            /* school_id: $('#school_id').combobox("getValue"), */
            grade_id: $('#grade_id').combotree("getValue"),
            class_id: $('#class_id').combobox("getValue"),
            tag:'1'
        });
    }

    $(function(){
        /*搜索  学校年级联动*/
        /* $('#school_id').combobox({
            data:schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                $('#school_id').combobox("setValue", '');
            },
            onSelect:function(record){
                //刷新数据，重新读取，并清空当前输入的值
                if (record.gradeList) {
                    $('#grade_id').combobox("loadData", record.gradeList);
                } else {
                    $('#grade_id').combobox("loadData", [{id: '', name: '全部年级'}]);
                }
                $('#class_id').combobox('clear').combobox("setValue", '');
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
            	$('#class_id').combobox({data:record.classList,value:'',disabled:false});
            	var id = record.id;
            	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeIdToSearch.action?id='+id+'';
            	$('#class_id').combobox('reload', url);
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

        /* 离校时间 */
        $('#leave_time').timespinner({
            editable: false,
            required:true,
        });
    });
</script>
<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>

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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">全部学校</div><div id="_easyui_combobox_i1_1" class="combobox-item">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_2" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i1_3" class="combobox-item">司南学辅1</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item combobox-item-selected">全部年级</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i3_0" class="combobox-item combobox-item-selected">全部班级</div></div></div></body></html>