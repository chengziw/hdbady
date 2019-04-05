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

    <div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom
:0px; overflow:hidden; padding-left:12px;">
		<a iconCls="icon-tj_kemu" class="easyui-linkbutton" href="/class-curricula-count/index.html">老师-科目
 课程数量统计</a>
		<a iconCls="icon-tj_fangwei2" class="easyui-linkbutton" plain="true" style="background-color:#EAF2FF
; border:1px solid #95B8E7; padding:0px;" href="/class-curricula-count/teacher-class-count.html">老师-
班级 课程数量统计</a>
		<a iconCls="icon-tj_fangshi" class="easyui-linkbutton" href="/class-curricula-count/subject-class-count
.html">科目-班级 课程数量统计</a>
    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px
; padding-top:6px;">
        <div id="tabbox_1">
            <div class="tab_header">
                <input editable="false" id="month_type" value="" style="width:100px;" class="easyui-textbox"
 data-options="panelHeight:'auto'"/>&nbsp;统计范围：
                <input editable="false" id="school_id" value="" style="width:130px;" class="easyui-textbox"
 />
                <input editable="false" id="grade_id" value="" style="width:100px;" class="easyui-textbox"
 data-options="panelHeight:'auto'"/>
                <input editable="false" id="subject_id" value="" style="width:100px;" class="easyui-textbox"
 data-options="panelHeight:'auto'"/>
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls
:'icon-search'" style="margin-left:8px;" onclick="getPayintemList();return false;">查询</a><a href="#"
 class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-daochu'" style="margin-left:8px;"
 onclick="exportExcel();return false;">导出</a>
            </div>
            <div class="tab_content" style="padding-top:12px;">

            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[
{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id"
:"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16
,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66
)"},{"id":62,"name":"fg(2016\u5e74\u5165\u5b66)"},{"id":63,"name":"454(2016\u5e74\u5165\u5b66)"},{"id"
:65,"name":"\u56db\u73ed(2016\u5e74\u5165\u5b66)"},{"id":72,"name":"\u516b\u73ed(2016\u5e74\u5165\u5b66
)"},{"id":162,"name":"\u82d7\u82d7\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort"
:2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165
\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"},{"id":58,"name":"\u5c0f\u73ed2(2015
\u5e74\u5165\u5b66)"},{"id":59,"name":"10\u73ed\u7ea7(2015\u5e74\u5165\u5b66)"},{"id":131,"name":"3432
(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168
\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed
(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"
\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00
\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name"
:"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name"
:"\u5927\u73ed(2012\u5e74\u5165\u5b66)"}]}],"subjectList":[{"id":"-1","name":"\u5168\u90e8\u79d1\u76ee"
},{"id":1,"name":"\u97f3\u4e50"},{"id":2,"name":"\u8ba1\u7b97"},{"id":3,"name":"\u8bed\u8a00"},{"id"
:4,"name":"\u5065\u5eb7"},{"id":5,"name":"\u793e\u4f1a"},{"id":6,"name":"\u79d1\u5b66"},{"id":7,"name"
:"\u7f8e\u672f"}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u5168\u90e8
\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8
\u73ed\u7ea7"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66
)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"
},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id"
:8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name"
:"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927
\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204(2013
\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d
\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202(2012
\u5e74\u5165\u5b66)"}]}],"subjectList":[{"id":"-1","name":"\u5168\u90e8\u79d1\u76ee"},{"id":8,"name"
:"\u97f3\u4e50"},{"id":9,"name":"\u8ba1\u7b97"}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList"
:[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList"
:[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"
}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},
{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"
}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}
]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"
}]}],"subjectList":[{"id":"-1","name":"\u5168\u90e8\u79d1\u76ee"}]}]';
    schoolJson = eval('('+schoolJson+')');

    /* 导出Excel文件 */
    function exportExcel() {
        var schoolId = $('#school_id').combobox('getValue');
        var gradeId = $('#grade_id').combobox('getValue');
        var subjectId = $('#subject_id').combobox('getValue');
        var monthType = $('#month_type').combobox('getValue');

        var form = $("<form>");
        form.attr('style', 'display:none');
        form.attr('target', '');
        form.attr('method', 'post');
        form.attr('action', '/class-curricula-count/teacher-class-count-table-content.html');

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
        input3.attr('name', 'subject_id');
        input3.attr('value', subjectId);

        var input4 = $('<input>');
        input4.attr('type', 'hidden');
        input4.attr('name', 'month_type');
        input4.attr('value', monthType);

        var input5 = $('<input>');
        input5.attr('type', 'hidden');
        input5.attr('name', 'is_download');
        input5.attr('value', true);

        $('body').append(form);
        form.append(input1);
        form.append(input2);
        form.append(input3);
        form.append(input4);
        form.append(input5);
        form.submit();
        form.remove();
    }

    /* 获取收费项报表 */
    function getPayintemList() {
        var schoolId = $('#school_id').combobox('getValue');
        var gradeId = $('#grade_id').combobox('getValue');
        var subjectId = $('#subject_id').combobox('getValue');
        var monthType = $('#month_type').combobox('getValue');
        $.ajax({
            url:'/class-curricula-count/teacher-class-count-table-content.html',
            data:{school_id: schoolId, grade_id:gradeId, month_type: monthType, subject_id: subjectId
},
            type:'POST',
            dataType:'html',
            success:function(html){
                $('#tabbox_1 .tab_content').html(html);
            }
        });
    }

    $(function () {
        /* 学期类型 */
        $('#month_type').combobox({
            data: [{id: 1, name: '当å­¦æ'}, {id: 2, name: 'ä¸ä¸å­¦æ'}],
            valueField:'id',
            textField:'name',
            value: 1,
            onLoadSuccess:function(){

            },
            onSelect: function(record) {

            }
        });

        /* å­¦ç§ */
        $('#subject_id').combobox({
            data: [{id: '-1', name: 'å¨é¨ç§ç®'}],
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                var data = $('#subject_id').combobox('getData');
                if (data.length > 0) {
                    $('#subject_id').combobox('select', data[0].id);
                }
            },
            onSelect: function(record) {
            }
        });

        /* å¹´çº§ */
        $('#grade_id').combobox({
            data: [{id: '-1', name: 'å¨é¨å¹´çº§'}],
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                var data = $('#grade_id').combobox('getData');
                if (data.length > 0) {
                    $('#grade_id').combobox('select', data[0].id);
                }
            },
            onSelect: function(record) {
            }
        });

        /* å­¦æ ¡ID */
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
                $('#subject_id').combobox('loadData', record.subjectList);
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
            /* å¤æ­åç´ æ¯å¦å­å¨ */
            if ($(helpTutorials[i].wrapper).length > 0) {
                tempData =  {wrapper: helpTutorials[i].wrapper ,popup: {content: '#' + helpTutorials
[i].contentWrapper,type: 'tooltip',position: helpTutorials[i].postion}};
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