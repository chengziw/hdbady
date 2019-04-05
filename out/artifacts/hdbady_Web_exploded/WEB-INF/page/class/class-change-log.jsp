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
    
    <script type="text/javascript" src="js/outOfBounds.js"></script>
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
    
    <div region="north" border="false" style="padding:10px;height:100px; padding-top:16px; padding-bottom:0px; overflow:hidden;">    

        <!--工具按钮和筛选栏目开始-->
        <div id="tb" class="easyui-layout" fit="true" border="false">

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：

                <input id="start_year" name="start_year" value="" class="easyui-validatebox" style="width:110px; cursor:pointer;" data-options="panelHeight:'auto',novalidate:true">
                <input id="class_id" name="grade" value="" class="easyui-validatebox" style="width:90px; cursor:pointer;" data-options="panelHeight:'auto',novalidate:true">
                <input id="type" name="type" value="" class="easyui-validatebox" style="width:90px; cursor:pointer;" data-options="panelHeight:'auto',novalidate:true">
                &nbsp;&nbsp;记录时间：
                <input id="start_date" name="start_date" value="" style="width:100px;" class="easyui-validatebox" data-options="novalidate:true">
                至
				<input id="end_date" name="end_date" value="" style="width:100px;" class="easyui-validatebox" data-options="novalidate:true">
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
            </div> 
            <!--筛选条件结束--> 

        </div>
        <!--工具按钮和筛选栏目结束-->

    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">
        
        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
        data-options="fitColumns:true,fit:true,pagination:true,
               singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true, onLoadSuccess: dataLoadSuccess,
        url:'${pageContext.request.contextPath}/classesChangeLogAction_pageQuery.action',method:'get'">
            <thead>
                <tr>
                    <th data-options="field:'grade_name',width:60" sortable="true">所在年级</th>
                    <th data-options="field:'class_name',width:60" sortable="true">班级</th>
                    <th data-options="field:'class_type',width:60" sortable="true">类型</th>
                    <th data-options="field:'start_label',width:80" sortable="true">入学年份(学期)</th>
                    <th data-options="field:'type_label',width:80" sortable="true">变动类型</th>
                    <th data-options="field:'note',width:140">备注</th>
                    <th data-options="field:'teacher_name',width:100" sortable="true">操作老师</th>
                    <th data-options="field:'create_time',width:120" sortable="true">记录时间</th>
                </tr>
            </thead>
        </table>
        <!--数据表结束-->
            
    </div>
</div>

<script type="text/javascript">
    
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u3010\u5b9d\u5b89\u3011\u5e7c\u513f\u56ed","classList":[{"id":1,"name":"\u4e00\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2016},{"id":16,"name":"\u4e8c\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2016},{"id":2,"name":"\u4e00\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2015},{"id":18,"name":"\u4e8c\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2015},{"id":3,"name":"\u4e00\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2014},{"id":19,"name":"\u4e8c\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2014},{"id":24,"name":"\u4e09\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2014},{"id":4,"name":"\u4e00\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2013},{"id":20,"name":"\u4e8c\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2013},{"id":5,"name":"\u4e00\u73ed(\u6b63\u5e38\u5728\u6821)","startYear":2012}]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","classList":[]}]';
    schoolJson = eval('('+schoolJson+')');

        /* 重新查询 */
    function doSearch(){

        $('#tt').datagrid('load',{
            class_name: $('#class_id').combobox("getValue"),
            start_label: $('#start_year').combobox("getValue"),
            type_label: $('#type').combobox("getValue"),
            start_date: $('#start_date').combobox("getValue"),
            end_date: $('#end_date').combobox("getValue"),
            tag:'1'
        });
    }

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){

        if(data.total == 0){ //没有记录

            $(this).datagrid('appendRow', { grade_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'grade_name', colspan: 8 })

        }
    }
    
    function setGradeName(value, rec) { 
      	 if(rec.classes != null){
       		if(rec.classes.grade != null){
       			return rec.classes.grade.name;
       		}
       	}
       	return "";
     }
     function setClassName(value, rec) { 
       	 return rec.classes!= null ? rec.classes.class_name : ""; 
     }
     function setClassType(value, rec) { 
       	 if(rec.classes != null){
        		if(rec.classes.classType != null){
        			return rec.classes.classType.type_name;
        		}
        	}
        	return "";
     }
    	function setStartLabel(value, rec) { 
         return rec.classes!= null ? rec.classes.start_label : ""; 
     }


    $(function(){

        var currentSchoolClassJson = [];

        /*  学校下拉框 
        $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            required: true, 
            onLoadSuccess:function(){                
                $('#school_id').combobox("setValue", '');
                var data = $('#school_id').combobox('getData');
            },
            onSelect: function(record) {
                if (record.classList != undefined) {
                    currentSchoolClassJson = record.classList;
                } else {
                    currentSchoolClassJson = [{id:'',name:"全部班级"}];
                }

                var tempClassJson = [{id: '', name: '全部班级'}];
                var currentYear = $('#start_year').combobox('getValue');
                for (var i=0; i < currentSchoolClassJson.length; i++) {
                    if (currentSchoolClassJson[i].startYear == currentYear) {
                        tempClassJson.push(currentSchoolClassJson[i]);
                    }
                }

                $('#class_id').combobox('loadData', tempClassJson);
            }           
        }); */
   
        
        /* 获取当前的年份 */
        var date = new Date(),
            currentYear = date.getFullYear();

        /* 开学年份数据 */
        var startYearJson = [{id: '全部学年', name: '全部学年'}];
        for (var i = currentYear ; i >= 2008; i--) {
            var tempJson = {id: i, name: i + '年'};
            startYearJson.push(tempJson);
        };

        /* 开学年份下拉框 */
        $('#start_year').combobox({
            data: startYearJson,
            editable:false,
            valueField:'id',
            textField:'name',
            value: '全部学年',
            onLoadSuccess:function(){

            },
            onSelect: function(record) {
                /* var tempClassJson = [{id: '全部班级', name: '全部班级'}];
                for (var i=0; i < currentSchoolClassJson.length; i++) {
                    if (currentSchoolClassJson[i].startYear == record.id) {
                        tempClassJson.push(currentSchoolClassJson[i]);
                    }
                }

                $('#class_id').combobox('loadData', tempClassJson); */
            }
        });

        /* 班级下拉框 */
        $('#class_id').combobox({
            //data: [{id:'',name:"全部班级"}],
            url:'${pageContext.request.contextPath}/classesAction_findAllClassToLogSearch.action',
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){           
                $('#class_id').combobox("setValue", '全部班级');
            }              
        });

        /* 异动类型 */
        $('#type').combobox({
            data: [{id: '全部类型', name: '全部类型'}, {id: '创建', name: '创建'}, {id: '升级', name: '升级'}, {id: '毕业', name: '毕业'}, {id: '删除', name: '删除'}],
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            onLoadSuccess:function(){           
                $('#type').combobox("setValue", '全部类型');
            }                 
        });

        //变动日期 开始 结束 清空按钮
        var change_time_end = $.extend([], $.fn.datebox.defaults.buttons);
        change_time_end.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#' + $(target).attr('id')).datebox("setValue", "").datebox("hidePanel");
            }
        });

        /* 异动开始时间 */
        $('#start_date').datebox({
            editable: false,
            required:true,
            buttons: change_time_end
        });

        /* 异动结束时间 */
        $('#end_date').datebox({
            editable: false,
            required:true,
            buttons: change_time_end
        });
    });
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