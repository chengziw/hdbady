<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
<html lang="en-US"><head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dear宝贝-幼教云管理平台</title>
    <link rel="stylesheet" type="text/css" href="js/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/icon.css">

    <script type="text/javascript" src="js/jquery_002.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>    
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    
    <link rel="stylesheet" href="js/jquery.css">
    <script type="text/javascript" src="js/jquery_003.js"></script>
</head>
<body style="padding: 0;margin: 0">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>


<form id="ff" method="post" style="height:668px;" data-href="/student/save-allot-student.html" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 1349px; height: 668px;">

        <div class="panel layout-panel layout-panel-north" style="width: 1349px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 1331px; height: 580px;" title="" class="panel-body panel-body-noheader layout-body">
            <div style="padding: 0 0 15px 0;">
                筛选：
                <input id="grade_id" data-options="panelHeight:'auto'" style="width: 160px; display: none;" class="combobox-f combo-f textbox-f">
                <!-- <input id="class_id" data-options="panelHeight:'auto'" style="width: 160px; display: none;" class="combobox-f combo-f textbox-f">
                &nbsp;&nbsp;学生状态：
                <input id="status_name" data-options="panelHeight:'auto'" style="width: 100px; display: none;" class="combobox-f combo-f textbox-f"> -->
                <a id="mysearch_btn" href="#" class="easyui-linkbutton l-btn l-btn-small l-btn-plain" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="callback();return false;" group="">查询</a>
            </div>

            <!--数据表开始-->
            <div class="panel datagrid" style=""><div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 1329px; height: 466px;"><div class="datagrid-view" style="width: 1329px; height: 466px;"><div class="datagrid-view1" style="width: 31px;"><div class="datagrid-header" style="width: 31px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td rowspan="0"><div class="datagrid-header-rownumber"></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 31px; margin-top: 0px; height: 441px;"><div class="datagrid-body-inner"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r2-1-0" class="datagrid-row" datagrid-row-index="0" style="height: 25px;"><td class="datagrid-td-rownumber"><div class="datagrid-cell-rownumber">1</div></td></tr></tbody></table></div></div><div class="datagrid-footer" style="width: 31px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><div class="datagrid-view2" style="width: 1298px;"><div class="datagrid-header" style="width: 1298px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td field="ck"><div class="datagrid-header-check"><input type="checkbox"></div></td><td field="name"><div class="datagrid-cell datagrid-cell-c2-name" style=""><span>姓名（英文名）</span><span class="datagrid-sort-icon"></span></div></td><td field="sex"><div class="datagrid-cell datagrid-sort datagrid-cell-c2-sex" style=""><span>性别</span><span class="datagrid-sort-icon"></span></div></td><td field="yearMonthDay"><div class="datagrid-cell datagrid-sort datagrid-cell-c2-yearMonthDay" style=""><span>生日</span><span class="datagrid-sort-icon"></span></div></td><td field="is_local_name" class=""><div class="datagrid-cell datagrid-sort datagrid-cell-c2-is_local_name" style=""><span>本地生</span><span class="datagrid-sort-icon"></span></div></td><td field="is_teacherson_name"><div class="datagrid-cell datagrid-sort datagrid-cell-c2-is_teacherson_name" style=""><span>教职子弟</span><span class="datagrid-sort-icon"></span></div></td><td field="grade_name"><div class="datagrid-cell datagrid-sort datagrid-cell-c2-grade_name" style=""><span>年级</span><span class="datagrid-sort-icon"></span></div></td><td field="class_name"><div class="datagrid-cell datagrid-sort datagrid-cell-c2-class_name" style=""><span>班级（入学年份）</span><span class="datagrid-sort-icon"></span></div></td><td field="parent_name"><div class="datagrid-cell datagrid-cell-c2-parent_name" style=""><span>家长姓名（关系）</span><span class="datagrid-sort-icon"></span></div></td><td field="phone"><div class="datagrid-cell datagrid-cell-c2-phone" style=""><span>家长手机</span><span class="datagrid-sort-icon"></span></div></td><td field="status_name"><div class="datagrid-cell datagrid-sort datagrid-cell-c2-status_name" style=""><span>状态</span><span class="datagrid-sort-icon"></span></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 1298px; margin-top: 0px; height: 441px; overflow-x: hidden;"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r2-2--1" class="datagrid-row" datagrid-row-index="0" style="height: 25px;"><td field="ck"><div style="" class="datagrid-cell-check"><input name="ck" value="" type="checkbox"></div></td><td field="name" rowspan="1" colspan="10" class="datagrid-td-merged"><div style="height: auto; width: 1243px;" class="datagrid-cell datagrid-cell-c2-name"><div style="text-align:center;color:red">没有找到记录！</div></div></td><td field="sex" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-sex"></div></td><td field="yearMonthDay" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-yearMonthDay"></div></td><td field="is_local_name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-is_local_name"></div></td><td field="is_teacherson_name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-is_teacherson_name"></div></td><td field="grade_name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-grade_name"></div></td><td field="class_name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-class_name"></div></td><td field="parent_name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-parent_name"></div></td><td field="phone" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-phone"></div></td><td field="status_name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-status_name">undefined</div></td></tr></tbody></table></div><div class="datagrid-footer" style="width: 1298px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><table id="tt" class="easyui-datagrid datagrid-f" style="display: none;" data-options="fitColumns:true,
                   onLoadSuccess: dataLoadSuccess,
			   rownumbers:true,checkOnSelect:true">
                <thead>
                <tr>
                   <!--  <th data-options="field:'ck',checkbox:true"></th>
                    --> <th data-options="field:'name',width:60">姓名（英文名）</th>
                    <th data-options="field:'sex',width:40" sortable="true">性别</th>
                    <th data-options="field:'yearMonthDay',width:60" sortable="true">生日</th>
                    <th data-options="field:'grade_id',width:60, formatter:setGradeName" sortable="true">年级</th>
                    <th data-options="field:'class_id',width:60, formatter:setClassName" sortable="true">班级</th>
                    <th data-options="field:'parent_name',width:60">家长姓名（关系）</th>
                    <th data-options="field:'phone',width:60">家长手机</th>
                    <th data-options="field:'status_name',width:80,formatter:  statusCallFun" sortable="true">状态</th>
                </tr>
                </thead>
            </table><style type="text/css" easyui="true">
.datagrid-cell-c2-name{width:149px}
.datagrid-cell-c2-sex{width:61px}
.datagrid-cell-c2-yearMonthDay{width:96px}
.datagrid-cell-c2-grade_id{width:96px}
.datagrid-cell-c2-class_id{width:149px}
.datagrid-cell-c2-parent_name{width:149px}
.datagrid-cell-c2-phone{width:132px}
.datagrid-cell-c2-status_name{width:138px}
</style></div></div></div>
            <!--数据表结束-->

            <div style="padding: 15px 0 0 0;">
                入学日期：
                <input id="enter_date" value="2017-01-16" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="enter_date" comboname="enter_date"><%-- <span class="textbox combo datebox" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" value="2017-01-16" type="text"><input class="textbox-value" name="enter_date" value="2017-01-16" type="hidden"></span>
                &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;font-size:12px;" id="show-error-message-box"></span> --%>
                 
            </div>
        </div></div>
	           
		<input name="status_name" value="3" readonly="true" type="hidden" style："border:none"/></td>             
  
        <div class="panel layout-panel layout-panel-center" style="width: 1349px; left: 0px; top: 597px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 1349px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
           	    <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-ok" onclick="saveFrom()" group="">将选中的学生确认入学</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
               </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":2,"name":"Dear\u5b9d\u8d1d\u3010\u5357\u5c71\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}]},{"id":8,"name":"\u5317\u4eac\u52b1\u5fb7\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":41,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
    schoolJson = eval('('+schoolJson+')');

    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }

        $('#save-btn').addClass('mylinkbtn-load');

        var url = $("#ff").attr('data-href');
        var studentIds = getCheckedStudentIds();
        if(! studentIds){
            $.messager.alert('提示','请选择学生','warning');
            $('#save-btn').removeClass('mylinkbtn-load');
            return false;
        }
        $('#ff').form('submit',{
        	url:'${pageContext.request.contextPath}/studentAction_batchEnterStudent.action',
            onSubmit:function(params){
                params.studentIds = studentIds;
                var result = $(this).form('enableValidation').form('validate');
                if(!result){
                    $('#save-btn').removeClass('mylinkbtn-load');
                };
                return result;
            },
            success:function(result){
                var result = eval('('+result+')');
                if (result.status==1){
                    //window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }else {
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                    //$.messager.alert('提示',result.info);
                }
            }
        });
    }

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'name', colspan: 10 })
        }
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
    	}
    	return "";
    }

    //状态回调函数
    function statusCallFun(value,row,index){
   
    	zhuangtai = value;
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

    /**
     * 获取选中的 学生ID
     */
    function getCheckedStudentIds(){
        var t = $('#tt');
        var row = t.datagrid('getSelections');
        if(! row){
            return false;
        }
        var result = '';
        for(var i=0; i<row.length; i++){
            result += (result == '' ? '' : ',')+row[i]['id'];
        }
        return result;
    }

    /**
     * 回调 函数
     */
    function callback(){
        $('#tt').datagrid({
        	url:'${pageContext.request.contextPath}/studentAction_pageQuery2.action',
             queryParams: {
                grade_id: $('#grade_id').combotree("getValue"),
                status_name: '2'
            } 
        });
    }

    $(function(){

    	 $('#grade_id').combobox({
    		  url:'${pageContext.request.contextPath}/gradeAction_findAllGradesToSearch.action',
  			  data:[{id:'全部年级',name:'全部年级'}],
              valueField:'id',
              textField:'name',
              editable:false,
              onLoadSuccess:function(){
                  $('#grade_id').combobox("setText", '全部年级');
              },
              onSelect:function(record){
              	/* var url = '${pageContext.request.contextPath}/json/class.json';
                  $('#class_id').combobox('reload', url); */
              }
          })

         /*  $('#class_id').combobox({
              data: [{id:'',name:"全部班级"}],
              valueField:'id',
              textField:'name',
              editable:false,
              onLoadSuccess:function(){
                  $('class_id').combobox("setText",'全部班级');
              }
          })


        $("#status_name").combobox({
            data:[
                  {id:0,name:"全部状态"},
                  {id:1,name:"待分班"},
                  {id:2,name:"待确认入学"},
                  {id:3,name:"正常就读"},
                  {id:4,name:"已休学"},
                  {id:5,name:"已退学"},
                  {id:6,name:"已毕业"}
              ],
            valueField:'id',
            textField:'name',
            editable:false
        }) */

        
        //  清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });
        //入学日期
        $('#enter_date').datebox({
            buttons: buttons,
            editable:false
        });
        
        
        //默认选择第一个学校
        if(schoolJson.length > 1){
            $('#school_id').combobox('select',schoolJson[1]['id']);
            callback();
        }
    })

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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">全部学校</div><div id="_easyui_combobox_i1_1" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_2" class="combobox-item">Dear宝贝【南山】幼儿园</div><div id="_easyui_combobox_i1_3" class="combobox-item">北京励德幼儿园</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item">全部年级</div><div id="_easyui_combobox_i2_1" class="combobox-item">托班</div><div id="_easyui_combobox_i2_2" class="combobox-item">小班</div><div id="_easyui_combobox_i2_3" class="combobox-item">中班</div><div id="_easyui_combobox_i2_4" class="combobox-item">大班</div><div id="_easyui_combobox_i2_5" class="combobox-item">学前班</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i3_0" class="combobox-item">全部班级</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i4_0" class="combobox-item">全部年级</div><div id="_easyui_combobox_i4_1" class="combobox-item">托班</div><div id="_easyui_combobox_i4_2" class="combobox-item">小班</div><div id="_easyui_combobox_i4_3" class="combobox-item">中班</div><div id="_easyui_combobox_i4_4" class="combobox-item">大班</div><div id="_easyui_combobox_i4_5" class="combobox-item">学前班</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i5_0" class="combobox-item">全部班级</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i6_0" class="combobox-item combobox-item-selected">全部</div><div id="_easyui_combobox_i6_1" class="combobox-item">待分班</div><div id="_easyui_combobox_i6_2" class="combobox-item">待入学确认</div></div></div></body></html>