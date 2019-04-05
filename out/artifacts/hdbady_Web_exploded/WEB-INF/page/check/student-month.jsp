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
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>


<div class="easyui-layout" fit="true">

    <div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">

        <!--工具按钮和筛选栏目开始-->
        <div id="tb" class="easyui-layout" fit="true" border="false">
            <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:98px; padding-right:18px;" border="false">
                <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-daochu" plain="false" onclick="outExcel();">导出</a> -->
            </div>
            <!--工具栏结束-->

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;"><!-- <input id="school_id" name="school_id" value="" class="easyui-validatebox" data-options="novalidate:true, width: 140"> -->
                <input id="grade" name="grade" value="" class="easyui-validatebox" data-options="novalidate:true, width: 90,panelHeight:'auto'">
                <input id="class" name="class" value="" class="easyui-validatebox" data-options="novalidate:true, width: 150,panelHeight:'auto'"> 
				&nbsp;&nbsp;统计年月：
                <input id="start_year" name="start_year" class="easyui-validatebox" data-options="novalidate:true, width: 70,panelHeight:'auto'" value="2017-03-17">
                <input id="start_month" name="start_month" class="easyui-validatebox" data-options="novalidate:true, width: 70,panelHeight:'auto'" value="2017-03-17"> 至
                <input id="end_year" name="end_year" class="easyui-validatebox" data-options="novalidate:true, width: 70,panelHeight:'auto'" value="2017-03-17">
                <input id="end_month" name="end_month" class="easyui-validatebox" data-options="novalidate:true, width: 70,panelHeight:'auto'" value="2017-03-17">
                &nbsp;&nbsp;<input id="status" name="status" value="" class="easyui-validatebox" data-options="novalidate:true, width: 100,panelHeight:'auto'">
                <input id="student_name" name="student_name" value="" class="easyui-textbox easyui-validatebox" data-options="novalidate:true, width: 120, prompt:'请输入学生姓名'">
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="closeReload();return false;">查询</a>
            </div>
            <!--筛选条件结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->
    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
               data-options="fitColumns:true,fit:true,pagination:true,
               singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true,
               onLoadSuccess: dataLoadSuccess,
        url:'${pageContext.request.contextPath}/studentMonthCheckAction_pageQuery.action',method:'get'">
            <thead>
            <tr>
            	<th data-options="field:'school_name', width:0"></th>
                <th data-options="field:'grade_name', width:60, formatter:setGradeName">年级</th>
                <th data-options="field:'class_name', width:100, formatter:setClassName">班级</th>
                <th data-options="field:'student_name', width:80, formatter:setStudentName">姓名</th>
                <th data-options="field:'sex_label', width:60, formatter:setStudentSex">性别</th>
                <th data-options="field:'yearMonthDay', width:90, formatter:setYearMonthDay">生日</th>
                <th data-options="field:'parent_name', width:120, formatter:setParentName">家长姓名(关系)</th>
                <th data-options="field:'phone', width:100, formatter:setphone">家长手机</th>
                <th data-options="field:'month_label', width:80">考勤月份</th>
                <th data-options="field:'total_days', width:80">应出勤天数</th>
                <th data-options="field:'actual_clock_days', width:80">实际出勤天数</th>
                <th data-options="field:'edit',width:100, formatter: formatOper">操作</th>
            </tr>
            </thead>
        </table>
        <!--数据表结束-->

    </div>

</div>

<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"},{"id":62,"name":"fg(2016\u5e74\u5165\u5b66)"},{"id":63,"name":"454(2016\u5e74\u5165\u5b66)"},{"id":65,"name":"\u56db\u73ed(2016\u5e74\u5165\u5b66)"},{"id":72,"name":"\u516b\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"},{"id":58,"name":"\u5c0f\u73ed2(2015\u5e74\u5165\u5b66)"},{"id":59,"name":"10\u73ed\u7ea7(2015\u5e74\u5165\u5b66)"},{"id":131,"name":"3432(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u5927\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    var vacationStudentTypeJson = '[{"id":"","name":"\u6240\u6709\u4f11\u5047\u7c7b\u578b"},{"id":1,"name":"\u4e8b\u5047"},{"id":2,"name":"\u75c5\u5047"},{"id":3,"name":"\u5176\u4ed6\u5047"}]';
    vacationStudentTypeJson = eval('('+vacationStudentTypeJson+')');

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
    	var thLength = $('#tt tr:first').find('th').length;
        if (data.rows.length == 0) {
            $('#tt').datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: thLength })
        }
    }

    /**
     * 回调 函数
     */
    function closeReload(){
        $('#tt').datagrid('reload',{
            /* school_id: $('#school_id').combobox('getValue'), */
            grade_id: $('#grade').combobox('getValue'),
            class_id: $('#class').combobox('getValue'),
            start_year: $('#start_year').datebox('getValue'),
            start_month: $('#start_month').datebox('getValue'),
            end_year: $('#end_year').datebox('getValue'),
            end_month: $('#end_month').datebox('getValue'),
            student_name: $('#student_name').textbox('getValue'),
            status: $('#status').combobox('getValue'),
            tag:'1'
        });
    }

    /* 月考勤记录详情 */
    function detail(index) {
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        var id = row.id;
        var url = "${pageContext.request.contextPath}/studentMonthCheckAction_about.action?id="+id+"";
        if (row){
            openTopWindow(url, '月考勤详情', 1053, 730, 'closeReload');
        }
    }
    
    function setParentName(value, rec){ 
   	    return rec.student!= null ? rec.student.parent_name : ""; 
    }
    
    function setphone(value, rec){ 
   	    return rec.student!= null ? rec.student.phone : ""; 
    }
    
    function setYearMonthDay(value, rec){ 
   	    return rec.student!= null ? rec.student.yearMonthDay : ""; 
    }
    
    function setStudentName(value, rec){ 
   	    return rec.student!= null ? rec.student.name : ""; 
    }
    
    function setStudentSex(value, rec){ 
      	return rec.student!= null ? rec.student.sex : ""; 
    }
    
    function setClassName(value, rec) { 
    	if(rec.student != null){
    		if(rec.student.classes != null){
    			return rec.student.classes.class_name;
    		}
    	}
    	return "";
    	
    }
   
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
    

    /* 格式化操作列 */
    function formatOper(val,row,index){
        var detailBtn = '';
        detailBtn = '<a onclick="detail('+index+', 1, this)" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">详情</span>' +
                '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
                '</a>';

        var optionsStr = "{detailBtn}";

        optionsStr = optionsStr.replace('{detailBtn}', detailBtn);
        return optionsStr;
    }

    /* 导出excel表格 */
    function outExcel(){
        var schoolId = $('#school_id').combobox('getValue');
        var gradeId = $('#grade').combobox('getValue');
        var classId = $('#class').combobox('getValue');
        var startYear = $('#start_year').datebox('getValue');
        var startMonth = $('#start_month').datebox('getValue');
        var endYear = $('#end_year').datebox('getValue');
        var endMonth = $('#end_month').datebox('getValue');
        var studentName = $('#student_name').textbox('getValue');
        var status = $('#status').combobox('getValue');

        var form = $("<form>");
        form.attr('style', 'display:none');
        form.attr('target', '');
        form.attr('method', 'get');
        form.attr('action', '/clock-student/month-index-list-json.html');

        var input2 = $('<input>');        input2.attr('type', 'hidden');        input2.attr('name', 'school_id');        input2.attr('value', schoolId);

        var input3 = $('<input>');        input3.attr('type', 'hidden');        input3.attr('name', 'grade_id');        input3.attr('value', gradeId);

        var input4 = $('<input>');        input4.attr('type', 'hidden');        input4.attr('name', 'class_id');        input4.attr('value', classId);

        var input5 = $('<input>');        input5.attr('type', 'hidden');        input5.attr('name', 'start_year');        input5.attr('value', startYear);

        var input6 = $('<input>');        input6.attr('type', 'hidden');        input6.attr('name', 'start_month');        input6.attr('value', startMonth);

        var input7 = $('<input>');        input7.attr('type', 'hidden');        input7.attr('name', 'end_year');        input7.attr('value', endYear);

        var input8 = $('<input>');        input8.attr('type', 'hidden');        input8.attr('name', 'end_month');        input8.attr('value', endMonth);

        var input9 = $('<input>');        input9.attr('type', 'hidden');        input9.attr('name', 'student_name');        input9.attr('value', studentName);

        var input10 = $('<input>');        input10.attr('type', 'hidden');        input10.attr('name', 'status');        input10.attr('value', status);

        var input11 = $('<input>');        input11.attr('type', 'hidden');        input11.attr('name', 'is_download');        input11.attr('value', 1);

        $('body').append(form);
        form.append(input2);        form.append(input3);        form.append(input4);
        form.append(input5);        form.append(input6);        form.append(input7);
        form.append(input8);        form.append(input9);        form.append(input10);
        form.append(input11);
        form.submit();
        form.remove();
    }

    $(function () {
        /* 学校 */
        /* $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            value: '',
            onLoadSuccess:function(){
            },
            onSelect: function(record) {
                if (record.gradeList != undefined) {
                    $('#grade').combobox('loadData', record.gradeList);
                } else {
                    $('#grade').combobox('loadData',[{id: '', name: '全部年级'}]);
                }
            }
        }); */

      //年级
        $('#grade').combobox({
       		url:'${pageContext.request.contextPath}/gradeAction_findAllGradesToSearch.action',
       		//data:[{id:'',name:"全部年级"}],
       		valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                //$('#grade_id').combobox("setValue","全部年级");
            },
            onSelect:function(record){
            	$('#class').combobox({data:record.classList,value:'',disabled:false});
            	var id = record.id;
            	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeIdToSearch.action?id='+id+'';
            	$('#class').combobox('reload', url);
            }
        });

        //班级
        $('#class').combobox({
            data:[{id:'',name:"全部班级"}],
        	 valueField:'id',
            textField:'name',
            disabled:true,//不能编辑:true
            editable:false,
            onLoadSuccess:function(){
                //$('#class_id').combobox("setValue","全部班级");
            }
        });


        /* 审批状态 */
        $('#status').combobox({
            data: [{id: '', name: '所有出勤状态'}, {id: 1, name: '当月有请假'}, {id: 2, name: '当月有缺卡'}, {id: 3, name: '当月无缺勤'}],
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){

            }
        });

        var dateObj = new Date();
        var nowYear = dateObj.getFullYear(); // 当前年份

        var years = [{id: nowYear - 1, name: (nowYear - 1) + '年'}, {id: nowYear, name: nowYear + '年'}];

        var months = [{id: 1, name: '1月'}, {id: 2, name: '2月'}, {id: 3, name: '3月'}, {id: 4, name: '4月'}, {id: 5, name: '5月'},
            {id: 6, name: '6月'}, {id: 7, name: '7月'}, {id: 8, name: '8月'}, {id: 9, name: '9月'}, {id: 10, name: '10月'}, {id: 11, name: '11月'}, {id: 12, name: '12月'}];

        /* 开始日期年份 */
        $('#start_year').combobox({
            data: years,
            editable:false,
            valueField:'id',
            textField:'name',
            value: nowYear,
            onLoadSuccess:function(){

            }
        });

        /* 结束日期年份 */
        $('#end_year').combobox({
            data: years,
            editable:false,
            valueField:'id',
            textField:'name',
            value: nowYear,
            onLoadSuccess:function(){

            }
        });

        /* 开始日期月份 */
        $('#start_month').combobox({
            data: months,
            editable:false,
            valueField:'id',
            textField:'name',
            value: dateObj.getMonth()+1,
            onLoadSuccess:function(){

            }
        });

        /* 结束日期月份 */
        $('#end_month').combobox({
            data: months,
            editable:false,
            valueField:'id',
            textField:'name',
            value: dateObj.getMonth()+1,
            onLoadSuccess:function(){

            }
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