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
    
    <script type="text/javascript" src="js/easyui-1.4.4/outOfBounds.js"></script>
    <link rel="stylesheet" href="js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>

<style>

	.tab_content .gridtable td{
		border:1px solid #cccccc;
	}
	.tab_content .gridtable tr:first-child td
	{
		background:#eeeeee;
	}
	
	#main_body_datagrid{
		margin-left:5px;
	}	
			
</style>

<div class="easyui-layout" fit="true">

    <div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden; padding-left:12px;">
		<a iconCls="icon-tj_shipu2" class="easyui-linkbutton" plain="true" style="background-color:#EAF2FF; border:1px solid #95B8E7; padding:0px;" href="/cookbook-count/index.html">按食谱统计</a>
		<a iconCls="icon-tj_yuefen" class="easyui-linkbutton" href="/cookbook-count/date-count.html">按月份统计</a>

    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px; padding-top:6px;">
        <div id="tabbox_1">
            <div class="tab_header">
                <input editable="false" id="school_id" value="" style="width:140px;" class="easyui-textbox" />
                <input editable="false" id="grade_id" value="" style="width:100px;" class="easyui-textbox" data-options="panelHeight:'auto'"/>
                <input editable="false" id="class_id" value="" style="width:120px;" class="easyui-textbox" data-options="panelHeight:'auto'"/>
                &nbsp;食谱日期：<input editable="false" id="month_type" value="" style="width:130px;" class="easyui-textbox" data-options="panelHeight:'auto'"/>
                <input id="start_month" value="" style="width:100px;" class="easyui-textbox" />
                至 <input id="end_month" value="" style="width:100px;" class="easyui-textbox" />
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="getPayintemList();return false;">查询</a><a href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-daochu'" style="margin-left:8px;" onclick="exportExcel();return false;">导出</a>
            </div>
            <div class="tab_content" style="padding-top:12px;">

            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","monthType":[{"id":1,"name":"\u5f53\u524d\u5b66\u671f","start_date":"2017-2-1","end_date":"2017-08-31"},{"id":2,"name":"2017\u5e7402\u6708(\u672c\u6708)","start_date":"2017-02-1","end_date":"2017-02-28"},{"id":3,"name":"2017\u5e7401\u6708(\u4e0a\u6708)","start_date":"2017-01-1","end_date":"2017-01-31"},{"id":4,"name":"2016\u5e7412\u6708","start_date":"2016-12-1","end_date":"2016-12-31"}],"gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed"},{"id":16,"name":"\u4e8c\u73ed"},{"id":27,"name":"\u4e09\u73ed"},{"id":62,"name":"fg"},{"id":63,"name":"454"},{"id":65,"name":"\u56db\u73ed"},{"id":72,"name":"\u516b\u73ed"},{"id":77,"name":"9\u73ed"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed"},{"id":18,"name":"\u4e8c\u73ed"},{"id":58,"name":"\u5c0f\u73ed2"},{"id":59,"name":"10\u73ed\u7ea7"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed"},{"id":19,"name":"\u4e8c\u73ed"},{"id":24,"name":"\u4e09\u73ed"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed"},{"id":20,"name":"\u4e8c\u73ed"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u5927\u73ed"}]},{"id":50,"name":"111","sort":6,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":51,"name":"11112","sort":7,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":64,"name":"\u5c0f\u6258","sort":8,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":93,"name":"\u5218\u73ed","sort":9,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":94,"name":"455","sort":10,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":114,"name":"11111","sort":11,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":115,"name":"12222","sort":12,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":73,"name":"\u4e00\u73ed"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","monthType":[{"id":1,"name":"\u5f53\u524d\u5b66\u671f","start_date":"2017-2-1","end_date":"2017-08-31"},{"id":2,"name":"2017\u5e7402\u6708(\u672c\u6708)","start_date":"2017-02-1","end_date":"2017-02-28"},{"id":3,"name":"2017\u5e7401\u6708(\u4e0a\u6708)","start_date":"2017-01-1","end_date":"2017-01-31"},{"id":4,"name":"2016\u5e7412\u6708","start_date":"2016-12-1","end_date":"2016-12-31"}],"gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210"},{"id":7,"name":"1209"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208"},{"id":9,"name":"1207"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206"},{"id":11,"name":"1205"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204"},{"id":13,"name":"1203"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","monthType":[{"id":1,"name":"\u5f53\u524d\u5b66\u671f","start_date":"2017-2-1","end_date":"2017-08-31"},{"id":2,"name":"2017\u5e7402\u6708(\u672c\u6708)","start_date":"2017-02-1","end_date":"2017-02-28"},{"id":3,"name":"2017\u5e7401\u6708(\u4e0a\u6708)","start_date":"2017-01-1","end_date":"2017-01-31"},{"id":4,"name":"2016\u5e7412\u6708","start_date":"2016-12-1","end_date":"2016-12-31"}],"gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7","classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":54,"name":"\u4e00\u73ed"}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    /* 导出Excel文件 */
    function exportExcel() {
        var schoolId = $('#school_id').combobox('getValue');
        var gradeId = $('#grade_id').combobox('getValue');
        var classId = $('#class_id').combobox('getValue');
        var startMonth = $('#start_month').datebox('getValue');
        var endMonth = $('#end_month').datebox('getValue');

        var form = $("<form>");
        form.attr('style', 'display:none');
        form.attr('target', '');
        form.attr('method', 'post');
        form.attr('action', '/cookbook-count/index-table-content.html');

        var input1 = $('<input>');
        input1.attr('type', 'hidden');
        input1.attr('name', 'school_id');
        input1.attr('value', schoolId);

        var input2 = $('<input>');
        input2.attr('type', 'hidden');
        input2.attr('name', 'grade_id');
        input2.attr('value', gradeId);

        var input3 = $('<input>');
        input3.attr('type', 'hidden');
        input3.attr('name', 'class_id');
        input3.attr('value', classId);

        var input4 = $('<input>');
        input4.attr('type', 'hidden');
        input4.attr('name', 'start_date');
        input4.attr('value', startMonth);

        var input5 = $('<input>');
        input5.attr('type', 'hidden');
        input5.attr('name', 'end_date');
        input5.attr('value', endMonth);

        var input6 = $('<input>');
        input6.attr('type', 'hidden');
        input6.attr('name', 'is_download');
        input6.attr('value', true);

        $('body').append(form);
        form.append(input1);
        form.append(input2);
        form.append(input3);
        form.append(input4);
        form.append(input5);
        form.append(input6);
        form.submit();
        form.remove();
    }

    /* 第一个内容块的信息 */

    /* 获取收费项报表 */
    function getPayintemList() {
        var schoolId = $('#school_id').combobox('getValue');
        var gradeId = $('#grade_id').combobox('getValue');
        var classId = $('#class_id').combobox('getValue');
        var startMonth = $('#start_month').datebox('getValue');
        var endMonth = $('#end_month').datebox('getValue');
        $.ajax({
            url:'/cookbook-count/index-table-content.html',
            data:{school_id: schoolId, grade_id: gradeId, class_id: classId, start_date: startMonth, end_date: endMonth},
            type:'POST',
            dataType:'html',
            success:function(html){
                $('#tabbox_1 .tab_content').html(html);
            }
        });
    }

    $(function () {
        /* 开始月份 */
        $('#start_month').datebox({
            editable: false
        });

        /* 结束月份 */
        $('#end_month').datebox({
            editable: false
        });

        /* 月份类型 */
        $('#month_type').combobox({
            data: [],
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                var data = $('#month_type').combobox('getData');
                if (data.length > 0) {
                    $('#month_type').combobox('select', data[0].id);
                }
            },
            onSelect: function(record) {
                $('#start_month').datebox('setValue', record.start_date);
                $('#end_month').datebox('setValue', record.end_date);
            }
        });

        /* 班级 */
        $('#class_id').combobox({
            data: [],
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                var data = $('#class_id').combobox('getData');
                if (data.length > 0) {
                    $('#class_id').combobox('select', data[0].id);
                }
            },
            onSelect: function(record) {
            }
        });

        /* 年级 */
        $('#grade_id').combobox({
            data: [],
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                var data = $('#grade_id').combobox('getData');
                if (data.length > 0) {
                    $('#grade_id').combobox('select', data[0].id);
                    $('#class_id').combobox('loadData', data[0].classList);
                }
            },
            onSelect: function(record) {
                $('#class_id').combobox('loadData', record.classList);
            }
        });

        /* 学校ID */
        $('#school_id').combobox({
            data: schoolJson,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                var data = $('#school_id').combobox('getData');
                if (data.length > 0) {

                    $('#school_id').combobox('select', data[0].id);
                }
            },
            onSelect: function(record) {
                $('#month_type').combobox('loadData', record.monthType);
                $('#grade_id').combobox('loadData', record.gradeList);
            }
        });
        getPayintemList();
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