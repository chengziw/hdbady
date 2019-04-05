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


<form id="fm" style="height:428px; " method="post" data-href="${pageContext.request.contextPath}/classesAction_editClass.action" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 538px; height: 428px;">

        <div class="panel layout-panel layout-panel-north" style="width: 538px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 520px; height: 340px;" title="" class="panel-body panel-body-noheader layout-body">
            <input id="id" name="id" value="<s:property value="classes.id"/>" type="hidden">
            <input id="teacher_id" name="teacher_id" value="<s:property value="teacher.id"/>" type="hidden">
            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <!--<tr>
                    <td width="110">
                        班级编号：                    </td>
                    <td>
                        27 （由系统自动生成的唯一编号）
                    </td>
                </tr>-->
               <%--  <tbody><tr>
                    <td width="110">所属学校：</td>
                    <td>Dear宝贝示范幼儿园</td>
                </tr>
                <tr>
                    <td width="110">当前年级：</td>
                    <td>托班</td>
                </tr>
                <tr>
                </tr><tr>
                    <td width="110">班级名称：</td>
                    <td>
                        <input value="三班" validtype="validateName" class="easyui-textbox textbox-f" style="width: 120px; display: none;" required="true" data-options="prompt:'如：一班、舞蹈班等'" maxlength="10" textboxname="name"><span class="textbox" style="width: 118px; height: 20px;"><input class="textbox-text validatebox-text" autocomplete="off" placeholder="如：一班、舞蹈班等" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 110px;" type="text"><input class="textbox-value" name="name" value="三班" type="hidden"></span>
                                                    <input id="type_id" value="" validtype="validateSchoolId" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" style="width: 120px; display: none;" data-options="panelHeight:'auto',novalidate:true" textboxname="type_id" comboname="type_id"><span class="textbox combo" style="width: 118px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 92px;" type="text"><input class="textbox-value" name="type_id" value="1" type="hidden"></span>
                                            </td>
                </tr>

				
                <tr>
                    <td>班主任：</td> --%>
                
                <tbody>
                <!-- <tr>
                    <td width="110">所属学校：</td>
                    <td>Dear宝贝示范幼儿园</td>
                </tr> -->
                <tr>
                    <td width="110">当前年级：</td>
                    <td><s:property value="classes.grade.name"/></td>
               		<input id="grade_id" value="<s:property value="classes.grade.id"/>" type="hidden"/></td> 
                </tr>
                <tr>
                </tr><tr>
                    <td width="110">班级名称：</td>
                    <td>
                        <input name="class_name" value="<s:property value="classes.class_name"/>" validtype="validateName" class="easyui-textbox textbox-f" style="width: 120px; display: none;" required="true" data-options="validType:['MaxLength'],prompt:'如：一班、舞蹈班等'" maxlength="10" textboxname="name"><%-- <span class="textbox" style="width: 118px; height: 20px;"><input class="textbox-text validatebox-text" autocomplete="off" placeholder="如：一班、舞蹈班等" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 110px;" type="text"><input class="textbox-value" name="name" value="三班" type="hidden"></span> --%>
                                                    <input id="type_label" value="<s:property value="classes.classType.type_name"/>" validtype="validateSchoolId" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" style="width: 120px; display: none;" data-options="panelHeight:'auto',novalidate:true" textboxname="type_label" comboname="type_label"><%-- <span class="textbox combo" style="width: 118px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 92px;" type="text"><input class="textbox-value" name="type_label" value="1" type="hidden"></span> --%>
                                            		<input id="type_label_id" type="hidden" value="<s:property value="classes.classType.id"/>">
                                            </td>
                </tr>

				
             <tr>
                        <td>班主任：</td>
                        <td>
                            <div>
                                <input id="teacher_name"  required="true" name="teacher_name" value="<s:property value="teacher.teacher_name"/>" class="easyui-textbox"style="width:140px;" type="text" value="" data-options="validType:'noNull'"/>
                            </div>
                            <div id="teacher_table_box" style="position: relative; width: 250px; height: 0px;z-index:1; display: none;" >
                                <table id="teacherTable" class="easyui-datagrid" style="height: 168px;width:330px; position: absolute;top: 0px; left: 0px;"
                                       data-options="url:'${pageContext.request.contextPath}/teacherAction_findAllTeacherToClassAdd.action',
                                           onLoadSuccess:teacherDataLoadSuccess,onClickRow:teacherClickRow,
                                           rownumbers:true,singleSelect:true">
                                    <thead>
                                    <tr>
                                        <th data-options="field:'teacher_name',width:80">姓名</th>
                                        <th data-options="field:'sex',width:40">性别</th>
                                        <th data-options="field:'structure_name',width:80">部门</th>
                                        <th data-options="field:'duty_name',width:80">职务</th>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                <tr>
                    <td>该班学生入学时间：</td>
                    <td>2016年 秋学期开学</td>
                </tr>
                <tr>
                    <td>该班下次升级时间：</td>
                    <td>2017-7-18 (今年)  春学期结束</td>
                </tr>

          </tbody></table>
            <div id="error-help-message-box" style="color: red">

            </div>
        </div></div>
        <div class="panel layout-panel layout-panel-center" style="width: 538px; left: 0px; top: 357px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 538px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a id="save-btn" href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveClass()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
            </div>
        </div></div>
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
$.extend($.fn.validatebox.defaults.rules,{
    noNull: {
        validator: function(value, param){
            if(value=='请选择' || value==''){
                return false;
            }
            return true;
        },
        message: '此输入项为必输项'
    },
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|7|8|9]\d{9}$/;
            return reg.test(value);
        },
        message: '输入手机号码格式不准确.'
    },
    idcard:{
    	validator: function (value) {
            var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
            return reg.test(value);
        },
        message: '身份证号格式不准确.'
    },
    name:{
    	validator: function (value) {
            var reg = /^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/; 
            return reg.test(value);
        },
        message: '名字格式不准确.'
    },
    student_no:{
    	validator: function (value) {
            var reg = /^\d{0,32}$/; 
            return reg.test(value);
        },
        message: '学号应为少于32位的数字.'
    },
    MaxLength: {
    	validator: function (value) {
    		var reg=/[\u4E00-\u9FA5]/g;
    		var reg2=/[A-Za-z0-9]/g;
    		var len=0;
    		var len2=0;
    		/* value.match(reg).length  算长度*/
    		
    		if(value.match(reg)!=null){
    			   len=value.match(reg).length*2;
    			}
    			if(value.match(reg2)!=null){
    			   len2=value.match(reg2).length;
    			}
    		var sum=len+len2;
    		if (sum > 32) { //返回中文的个数
    				return false;
    		}
    		return true;
        },
        message: '不能超过32个字母数字或16个汉字'
    },
	age:{
    	validator: function (value) {
            if(value>50){
            	return false;
            }
            return true;
        },
        message: '年龄过大.'
    },
    agenumber:{
    	validator: function (value) {
            var reg = /^\d{0,32}$/; 
            return reg.test(value);
        },
        message: '年龄格式不正确.'
    }
});

    /* 转换PHPJSON为JS JSON格式 */
    var classTypeJson = '[{"id":"","name":"\u8bf7\u9009\u62e9\u73ed\u7ea7\u7c7b\u578b"},{"id":1,"name":"\u666e\u901a\u73ed"},{"id":2,"name":"\u7f8e\u672f\u73ed"},{"id":3,"name":"\u821e\u8e48\u73ed"},{"id":4,"name":"\u7279\u957f\u73ed"},{"id":17,"name":"\u7b97\u672f\u73ed"}]';
    classTypeJson = eval('('+classTypeJson+')');
    
    var schoolId = '1';
    schoolId = eval('('+schoolId+')');

    var typeId = '1';
    typeId = eval('('+typeId+')');

    var url = $('#fm').attr('data-href'); // 保存学校地址

    // 上下方向键移动
    var upDownKeySelectedTeacherIndex = 0;
    var valueTeacherData;

    function upDownKeySelected(target,index){
        $(target).datagrid('clearSelections').datagrid('selectRow',index);
    }

  	//老子后加的
	var i = 1;
    //老师名称 搜索下拉 表格数据加载完成
    function teacherDataLoadSuccess(data){
    	//老子后加的
    	if(i==1){
    		$('#teacher_table_box').hide();
    		i++;
    	}
    	
        if(data.total == 0 && !$("#teacher_table_box").is(':hidden')){
            $('#teacherTable').datagrid('appendRow', { teacher_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'teacher_name', colspan: 3 })
        }else{
            upDownKeySelected("#teacherTable",upDownKeySelectedTeacherIndex);
        }
    }

    //老师名称 搜索下拉 表格数据 行点击事件
    function teacherClickRow(rowIndex,rowData){
        if(! rowData){
            $('#teacherTable').datagrid('clearSelections').datagrid('selectRow', rowIndex);
            rowData = $('#teacherTable').datagrid('getSelected');
        }
       	//alert(rowData+"====="+rowIndex);

        //if (rowData.id > 0) {
            $('#teacher_name').textbox('setValue', rowData.teacher_name);
            $('#teacher_id').val(rowData.id);
        /*} else {
            $('#teacher_name').textbox('setValue', '');
            $('#teacher_id').val(0);
        }*/

        upDownKeySelectedTeacherIndex = rowIndex;

        $('#teacher_table_box').hide(); //  下拉框隐藏
    }

    /* 保存班级信息 */
    function saveClass(){
        var teacherId = $('#teacher_id').val();
        if (teacherId < 1) {
            $('#error-help-message-box').html('请选择相应的班主任');
            return false;
        }

        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#error-help-message-box').html('');
        $('#save-btn').addClass('mylinkbtn-load');

        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                var flag = $(this).form('enableValidation').form('validate');
                if (flag == false) {
                    $('#save-btn').removeClass('mylinkbtn-load');
                }
                return flag;
            },
            success: function(result){
                $('#save-btn').removeClass('mylinkbtn-load');

                var result = eval('('+result+')');
                if (result.errMeg){
                    $('#error-help-message-box').html(result.errMeg);
                } else {
                    parent.window.closeWinIsReloadData = 1;
                    parent.$('#openWindow').window('close');
                }
            }
        });
    }
  	var id = $('#id').val();
    /* 表单校验信息 */
    $.extend($.fn.validatebox.defaults.rules, {
    	
        validateName: {
            validator: function(value) {
                var flag;
                var classId = $('input[name="id"]').val();
                var grade_id = $('#grade_id').val();
                //alert(grade);
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/classesAction_findClassByClassNameAndGradeId.action?id='+id+'',
                    data: {class_name: value , grade_id: grade_id},
                    dataType: 'json',
                    async:false,
                    success: function(result) {

                        flag = result.flag? true: false;
                    }
                });
                return flag;
            },
            message: '您输入的班级名称已存在，请更换。'
        },
    });

    $(function(){
        /* 班级类型 */
        if (classTypeJson.length > 1) {
            $('#type_label').combobox({
                //data: classTypeJson,
                url: '${pageContext.request.contextPath}/classTypeAction_findAllClassType.action',
                editable:false,
                valueField:'id',
                textField:'name',
                required: true,
                //value: typeId,
                onLoadSuccess:function(){
                	/* var data = $('#type_label').combobox('getData');
                    if (data.length > 0 && typeId < 1) { */
                        $('#type_label').combobox('select',$('#type_label').val());
                    	$('#type_label').combobox('setValue',$('#type_label_id').val());
                    /* } */
                }
            });
        }

        // 老师名称 触发下拉搜索
        $(document).on('focus keyup','#teacher_name + .textbox .textbox-text',function(e){
            var teacherName = $(this).val();

            if(e.keyCode == 13) return false;
            $('#teacher_id').val(0);
            if (1) {
                $('#teacher_table_box').show();
                if( teacherName == valueTeacherData || valueTeacherData == '@@@@') return false;

                $('#teacherTable').datagrid('load',{
                    //school_id: schoolId,
                    teacher_name:teacherName
                });
            } else {
                $('#teacher_table_box').hide();
            }
            valueTeacherData = teacherName;
        })

        $(document).on('keydown','.textbox-text:eq(1)',function(e){
            var target = "#teacherTable";
            var data =$(target).datagrid('getData');
            if(! $('#teacher_table_box').is(':hidden')){
                if(e.keyCode == 40){ //下移
                    if(upDownKeySelectedTeacherIndex >= data.total-1) return false;
                    upDownKeySelectedTeacherIndex++;
                    upDownKeySelected(target,upDownKeySelectedTeacherIndex);
                }else if(e.keyCode == 38){ // 上移
                    if(upDownKeySelectedTeacherIndex == 0 ){
                        return false;
                    }
                    upDownKeySelectedTeacherIndex--;
                    upDownKeySelected(target,upDownKeySelectedTeacherIndex);
                }else if(e.keyCode == 13){
                    teacherClickRow(upDownKeySelectedTeacherIndex,'');
                }
            }
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">请选择班级类型</div><div id="_easyui_combobox_i1_1" class="combobox-item combobox-item-selected">普通班</div><div id="_easyui_combobox_i1_2" class="combobox-item">美术班</div><div id="_easyui_combobox_i1_3" class="combobox-item">舞蹈班</div><div id="_easyui_combobox_i1_4" class="combobox-item">特长班</div><div id="_easyui_combobox_i1_5" class="combobox-item">算术班</div></div></div></body></html>