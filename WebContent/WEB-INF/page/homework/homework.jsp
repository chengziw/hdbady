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
            <div id="tutorial-content1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在这里可以选择年级<br><br><br></div>
            <div id="tutorial-content2">在这里可以选择班级<br><br><br></div>
            <div id="tutorial-content3">在这里可以选择科目<br><br><br></div>
            <div id="tutorial-content4">在这里可以输入发布作业的老师<br><br><br></div>
            <div id="tutorial-content5">在这里可以输入作业发布开始日期范围<br><br><br></div>
            <div id="tutorial-content6">在这里可以输入作业发布结束日期范围<br><br><br></div>
           <!--  <div id="tutorial-content7">点这里可以查看作业的详情<br><br><br></div> -->
            <div id="tutorial-content8">点这里可以查看作业的详情<br><br><br></div> 
    </div>

<link rel="stylesheet" type="text/css" href="css/default.css">

<div class="easyui-layout" fit="true">
	
    <div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">

        <!--工具按钮和筛选栏目开始-->
        <div class="easyui-layout" fit="true" border="false">

            <!--工具栏开始-->
            <!--<div id="main_body_tool" region="west" style="width:188px; padding-right:18px;" border="false">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addSubject()">软件订购升级</a>
            </div>-->
            <!--工具栏结束-->

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：

                <!-- <input id="school_id" style="width:140px; cursor:pointer;"> -->

                <input id="grade_id" style="width:90px; cursor:pointer;" data-options="panelHeight:'auto'">

                <input id="class_id" style="width:150px; cursor:pointer;" data-options="panelHeight:'auto'">

                <input id="subject_id" style="width:90px; cursor:pointer;" data-options="panelHeight:'auto'">

                &nbsp;&nbsp;发布老师：
                <input id="teacher_name" class="easyui-textbox" style="width:80px; cursor:pointer;">

                &nbsp;&nbsp;作业日期：
                <input id="start_time" style="width:100px; cursor:pointer;">
                至
                <input id="end_time" style="width:100px; cursor:pointer;">

                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
				<a class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-help'" onclick="showRightHelp()" href="#">帮助</a><!--js代码在layouts/base文件下-->  
            </div>
            <!--筛选条件结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->

    </div>

	<div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
		<table id="tt" class="easyui-datagrid"
			   data-options="url:'${pageContext.request.contextPath}/homeWorkAction_pageQuery.action',fitColumns:true,fit:true,pagination:true,
			   onLoadSuccess: dataLoadSuccess,
			   singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true">
			<thead>
			<tr>
				<th data-options="field:'school_name',width:0" sortable="true"></th>
				<th data-options="field:'grade_name',width:80, formatter:setGradeName" sortable="true">年级</th>
				<th data-options="field:'class_name',width:80, formatter:setClassName" sortable="true">班级</th>
				<th data-options="field:'subject_name',width:80, formatter:setSubjectName" sortable="true">科目</th>
                <th data-options="field:'year_month_day',width:80" sortable="true">作业日期</th>
                <th data-options="field:'descs',width:260">作业说明</th>
                <th data-options="field:'teacher_info',width:130" sortable="true">发布老师</th>
                <th data-options="field:'publish_time_name',width:120" sortable="true">发布时间</th>
                <th data-options="field:'is_pushed_name',width:80" sortable="true">APP推送家长</th>
                <th data-options="field:'edit',width:80,formatter:  rowformater">操作</th>
			</tr>
			</thead>
		</table>
        <!--数据表结束-->
			
	</div>

</div>

<script type="text/javascript">
    var schoolListJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821","subjectList":[{"id":"","name":"\u5168\u90e8\u79d1\u76ee"}]},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"},{"id":62,"name":"fg(2016\u5e74\u5165\u5b66)"},{"id":63,"name":"454(2016\u5e74\u5165\u5b66)"},{"id":65,"name":"\u56db\u73ed(2016\u5e74\u5165\u5b66)"},{"id":72,"name":"\u516b\u73ed(2016\u5e74\u5165\u5b66)"},{"id":77,"name":"9\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"},{"id":58,"name":"\u5c0f\u73ed2(2015\u5e74\u5165\u5b66)"},{"id":59,"name":"10\u73ed\u7ea7(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u5927\u73ed(2012\u5e74\u5165\u5b66)"}]},{"id":50,"name":"111","sort":6,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":51,"name":"11112","sort":7,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":64,"name":"\u5c0f\u6258","sort":8,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":93,"name":"\u5218\u73ed","sort":9,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":94,"name":"455","sort":10,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":114,"name":"11111","sort":11,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":115,"name":"12222","sort":12,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":73,"name":"\u4e00\u73ed(2005\u5e74\u5165\u5b66)"}]}],"subjectList":[{"id":"","name":"\u5168\u90e8\u79d1\u76ee"}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"}]}],"subjectList":[{"id":"","name":"\u5168\u90e8\u79d1\u76ee"},{"id":8,"name":"\u97f3\u4e50"},{"id":9,"name":"\u8ba1\u7b97"},{"id":152,"name":"111"}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}],"subjectList":[{"id":"","name":"\u5168\u90e8\u79d1\u76ee"},{"id":54,"name":"\u793e\u4f1a"}]}]';
    schoolListJson = eval('('+schoolListJson+')');

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: 10 })
        }
		
    }
    
    function setClassName(value, rec) { 
   	 return rec.classes!= null ? rec.classes.class_name : ""; 
    }
   
    function setGradeName(value, rec) { 
   	 if(rec.classes != null){
    		if(rec.classes.grade != null){
    			return rec.classes.grade.name;
    		}
    	}
    	return "";
    }

    function setSubjectName(value, rec){
    	return rec.subject!= null ? rec.subject.name : ""; 
    }
    
    /**
     * 添加按钮函数
     * @param value
     * @param row
     * @param index
     * @returns {*}
     */
    function rowformater(value,row,index)
    {
        var rs = '<a onclick="more('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">详情</span>' +
            '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
            '</a>';

        return rs;
    }

    /* 详情 */
    function more(index){
        $('#tt').datagrid('selectRow', index);
        var row = $('#tt').datagrid('getSelected');
        var id = row.id;
        var url = "${pageContext.request.contextPath}/homeWorkAction_about.action?id="+id+"";
        var title = '查看作业详情';
        var callfun = 'doSearch';
        openTopWindow(url,title,888,568,callfun);
    }

    /**
     * 搜索
     */
    function doSearch(){
        $('#tt').datagrid('reload',{
            /* school_id : $('#school_id').combobox("getValue"), */
            grade_id : $('#grade_id').combobox("getValue"),
            class_id : $('#class_id').combobox("getValue"),
            subject_id : $('#subject_id').combobox("getValue"),
            teacher_name : $('#teacher_name').textbox("getValue"),
            start_time : $('#start_time').datebox("getValue"),
            end_time : $('#end_time').datebox("getValue"),
            tag:'1'
        })
    }

    $(function(){

        /*搜索  学校年级联动*/
        /* $('#school_id').combobox({
            data: schoolListJson,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                $('#school_id').combobox("setValue", '');
            },
            onSelect:function(record){
                //刷新数据，重新读取，并清空当前输入的值
                if (record.gradeList != undefined) {
                    $('#grade_id').combobox('loadData', record.gradeList);
                } else {
                    $('#grade_id').combobox('loadData',[{id: '', name: '全部年级'}]);
                }

                if (record.subjectList != undefined) {
                    $('#subject_id').combobox('loadData', record.subjectList);
                } else {
                    $('#subject_id').combobox('loadData',[{id: '', name: '全部科目'}]);
                }
            }
        }); */

      //年级
       /*  $('#grade_id').combobox({
 			url:'${pageContext.request.contextPath}/gradeAction_findAllGradesToSearch.action',
 			//data:[{id:'',name:"全部年级"}],
 			valueField:'id',
            textField:'name',
            editable:false,
            value:'全部年级',
            onLoadSuccess:function(){
                //$('#grade_id').combobox("setValue","全部年级");
            },
            onSelect:function(record){
            	$('#class_id').combobox({data:record.classList,value:'',disabled:false});
            	var id = record.id;
            	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeIdToSearch.action?id='+id+'';
            	$('#class_id').combobox('reload', url);
            }
        }); */
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
            value:'全部班级',
            onLoadSuccess:function(){
                //$('#class_id').combobox("setValue","全部班级");
            }
        });

         $('#subject_id').combobox({
        	url:'${pageContext.request.contextPath}/subjectAction_findAllSubjectToSearch.action',
            //data: [{id: '', name: '全部科目'}],
            valueField:'id',
            textField:'name',
            editable:false,
            value:'全部科目',
            onLoadSuccess:function(){
                $('#subject_id').combobox("setValue","全部科目");
            }
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
        $('#start_time').datebox({
            buttons: buttons,
            editable:false
        });
        //入职日期 结束
        $('#end_time').datebox({
            buttons: buttons,
            editable:false
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
    var helpTutorials = [{"wrapper":".textbox-text:eq(0)","contentWrapper":"tutorial-content1","content":"\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u5728\u8fd9\u91cc\u53ef\u4ee5\u9009\u62e9\u8981\u67e5\u627e\u7684\u5b66\u6821<br><br><br>","postion":"bottom"},{"wrapper":".textbox-text:eq(1)","contentWrapper":"tutorial-content2","content":"\u5728\u8fd9\u91cc\u53ef\u4ee5\u9009\u62e9\u5e74\u7ea7<br><br><br>","postion":"bottom"},{"wrapper":".textbox-text:eq(2)","contentWrapper":"tutorial-content3","content":"\u5728\u8fd9\u91cc\u53ef\u4ee5\u9009\u62e9\u73ed\u7ea7<br><br><br>","postion":"bottom"},{"wrapper":".textbox-text:eq(3)","contentWrapper":"tutorial-content4","content":"\u5728\u8fd9\u91cc\u53ef\u4ee5\u9009\u62e9\u79d1\u76ee<br><br><br>","postion":"bottom"},{"wrapper":".textbox-text:eq(4)","contentWrapper":"tutorial-content5","content":"\u5728\u8fd9\u91cc\u53ef\u4ee5\u8f93\u5165\u53d1\u5e03\u4f5c\u4e1a\u7684\u8001\u5e08<br><br><br>","postion":"bottom"},{"wrapper":".textbox-text:eq(5)","contentWrapper":"tutorial-content6","content":"\u5728\u8fd9\u91cc\u53ef\u4ee5\u8f93\u5165\u4f5c\u4e1a\u53d1\u5e03\u5f00\u59cb\u65e5\u671f\u8303\u56f4<br><br><br>","postion":"bottom"},{"wrapper":".textbox-text:eq(6)","contentWrapper":"tutorial-content7","content":"\u5728\u8fd9\u91cc\u53ef\u4ee5\u8f93\u5165\u4f5c\u4e1a\u53d1\u5e03\u7ed3\u675f\u65e5\u671f\u8303\u56f4<br><br><br>","postion":"bottom"},{"wrapper":".icon-edit:eq(0)","contentWrapper":"tutorial-content8","content":"\u70b9\u8fd9\u91cc\u53ef\u4ee5\u67e5\u770b\u4f5c\u4e1a\u7684\u8be6\u60c5<br><br><br>","postion":"left"}];

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