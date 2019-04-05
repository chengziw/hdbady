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


    <form id="fm" style="height:488px; " method="post" data-href="/class/save.html" class="panel-noscroll">
        <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 538px; height: 488px;">

            <div class="panel layout-panel layout-panel-north" style="width: 538px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 520px; height: 400px;" title="" class="panel-body panel-body-noheader layout-body">
                <input id="teacher_id" name="teacher_id" value="0" type="hidden">
                <table width="100%" cellspacing="0" cellpadding="8" border="0">
                    <tbody><tr>
                        <!-- <td><input id="school_id" required="true" value="" validtype="validateSchoolId" class="easyui-validate combobox-f combo-f textbox-f" style="width: 140px; display: none;" data-options="" textboxname="school_id" comboname="school_id"> --><%-- <span class="textbox combo" style="width: 138px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 112px;" type="text"><input class="textbox-value" name="school_id" value="1" type="hidden"></span> --%></td>
                    </tr>
					
					<tr>
                        <td>当前学年：</td>
                        <td id="school_year">2016学年（2016年9月 - 2017年7月18日)</td>
                    </tr>
					
                    <tr>
                        <td>所属年级：</td>
                        <td><input id="grade" name="grade_id" required="true" value="" validtype="validateGradeId" class="easyui-validate combobox-f combo-f textbox-f" style="width: 140px; display: none;" data-options="panelHeight:'auto'" textboxname="grade" comboname="grade"></td>
                    </tr>
                    <tr>
                        <td>该年级学生入学时间：</td>
                        <td id="start-year"></td>
                    </tr>
                    <tr>
                        <td>该年级已有班级：</td>
                        <td id="class-box"></td>
                    </tr>
                    <tr>
                        <td>班级名称：</td>
                        <td>
                            <input id="class_name"  value="" required="true" validtype="validateName" style="width: 140px; display: none;" data-options="prompt:'如：一班、舞蹈班等',panelHeight:'auto',validType:['name','MaxLength']" maxlength="10" class="combobox-f combo-f textbox-f"  comboname="class_name"></span>
                                 <input id="type_label" name="type_id" value="" validtype="validateSchoolId" class="easyui-validate combobox-f combo-f textbox-f" required="true" style="width: 120px; display: none;" data-options="panelHeight:'auto',novalidate:true" textboxname="classType.id" comboname="classType.id">
                                                    </td>
                    </tr>

					
					 <tr>
                        <td>班主任：</td>
                        <td>
                            <div>
                                <input id="teacher_name"  required="true" name="teacher_name" class="easyui-textbox"style="width:140px;" type="text" value="" data-options="validType:'noNull'"/>
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
                        <td>该班下次升级时间：</td>
                        <td id="next_update_date">2017年7月18号 (今年) 春学期结束</td>
                    </tr>

              </tbody></table>
                <div id="error-help-message-box" style="color: red">

                </div>
            </div></div>
            <div class="panel layout-panel layout-panel-center" style="width: 538px; left: 0px; top: 417px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 538px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                    <a id="save-btn" href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveClass()" group="">保存</a>
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
                </div>
            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
    </form>


<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":""},{"id":1,"name":"\u4e00\u73ed"},{"id":16,"name":"\u4e8c\u73ed"},{"id":27,"name":"\u4e09\u73ed"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":""},{"id":2,"name":"\u4e00\u73ed"},{"id":18,"name":"\u4e8c\u73ed"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":""},{"id":3,"name":"\u4e00\u73ed"},{"id":19,"name":"\u4e8c\u73ed"},{"id":24,"name":"\u4e09\u73ed"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":""},{"id":4,"name":"\u4e00\u73ed"},{"id":20,"name":"\u4e8c\u73ed"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":""},{"id":5,"name":"\u4e00\u73ed"}]}],"schoolYear":"2016\u5b66\u5e74\uff082016\u5e749\u6708 - 2017\u5e747\u670818\u65e5)","nextUpdateYear":2017,"nextUpdateData":"2017\u5e747\u670818\u53f7 (\u4eca\u5e74) \u6625\u5b66\u671f\u7ed3\u675f"},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":""},{"id":6,"name":"1210"},{"id":7,"name":"1209"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":""},{"id":8,"name":"1208"},{"id":9,"name":"1207"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":""},{"id":10,"name":"1206"},{"id":11,"name":"1205"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":""},{"id":12,"name":"1204"},{"id":13,"name":"1203"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":""},{"id":14,"name":"1202"},{"id":15,"name":"1201"}]}],"schoolYear":"2016\u5b66\u5e74\uff082016\u5e749\u6708 - 2017\u5e747\u670818\u65e5)","nextUpdateYear":2017,"nextUpdateData":"2017\u5e747\u670818\u53f7 (\u4eca\u5e74) \u6625\u5b66\u671f\u7ed3\u675f"},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":""},{"id":54,"name":"\u4e00\u73ed"}]},{"id":41,"name":"\u6258\u7ba1\u73ed2","sort":2,"classList":[{"id":"","name":""}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":""}]}],"schoolYear":"2016\u5b66\u5e74\uff082016\u5e749\u6708 - 2017\u5e747\u670818\u65e5)","nextUpdateYear":2017,"nextUpdateData":"2017\u5e747\u670818\u53f7 (\u4eca\u5e74) \u6625\u5b66\u671f\u7ed3\u675f"}]';
    schoolJson = eval('('+schoolJson+')');

    var classTypeJson = '[{"id":"","name":"\u8bf7\u9009\u62e9\u73ed\u7ea7\u7c7b\u578b"},{"id":1,"name":"\u666e\u901a\u73ed"},{"id":2,"name":"\u7f8e\u672f\u73ed"},{"id":3,"name":"\u821e\u8e48\u73ed"},{"id":4,"name":"\u7279\u957f\u73ed"},{"id":17,"name":"\u7b97\u672f\u73ed"}]';
    classTypeJson = eval('('+classTypeJson+')');

    var nextUpdateYear = 0;

    var dateObj = new Date(),
        nowYear = dateObj.getFullYear(); // 当前年份

    var url = $('#fm').attr('data-href'); // 保存学校地址

    // 上下方向键移动
    var upDownKeySelectedTeacherIndex = 0;
    var valueTeacherData;

    var startYear = 0;

    function upDownKeySelected(target,index){
        $(target).datagrid('clearSelections').datagrid('selectRow',index);
    }

    //学生名称 搜索下拉 表格数据加载完成
    function teacherDataLoadSuccess(data){
        if(data.total == 0 && !$("#teacher_table_box").is(':hidden')){
            $('#teacherTable').datagrid('appendRow', { teacher_name: '<div style="text-align:center;color:red"<没有找到记录！</div<' })
                .datagrid('mergeCells', { index: 0, field: 'teacher_name', colspan: 4 })
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
        //if (rowData.id > 0) {
            $('#teacher_name').textbox('setValue', rowData.teacher_name);
            $('#teacher_id').val(rowData.id);
        /* } else {
            $('#teacher_name').textbox('setValue', '');
            $('#teacher_id').val(0);
        } */


        upDownKeySelectedTeacherIndex = rowIndex;

        $('#teacher_table_box').hide(); //  下拉框隐藏
    }
    
    var grade;

    /* 保存班级信息 */
    function saveClass(){
        var teacherId = $('#teacher_id').val();
        if (teacherId < 1) {
            $('#save-btn').removeClass('mylinkbtn-load');
            $('#error-help-message-box').html('请选择班主任');
            return false;
            /* return true; */
        }

        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#error-help-message-box').html('');
        $('#save-btn').addClass('mylinkbtn-load');

        $('#fm').form('submit',{
        	url: '${pageContext.request.contextPath}/classesAction_addClass.action',
            onSubmit: function(params){
                params.class_name = $("#class_name").combobox('getText');
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

    /* 表单校验信息 */
    $.extend($.fn.validatebox.defaults.rules, {
        validateSchoolId: {
            validator: function(value, param){
                if(value=='' || value == '请选择一个学校'){
                    return false;
                }
                return true;
            },
            message: '请选择一个学校'
        },
        validateGradeId: {
            validator: function(value, param){
                if(value=='' || value == '请选择年级'){
                    return false;
                }
                return true;
            },
            message: '请选择年级'
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
            message: '不能超过32个字母数字或16个汉字.'
        },
        noNull: {
            validator: function(value, param){
                if(value=='请选择' || value==''){
                    return false;
                }
                return true;
            },
            message: '此输入项为必输项'
        },
        validateName: {  
            validator: function(value) {
                var grade_id = $('#grade').combobox("getValue");
                var flag;
                $.ajax({
                    type: 'POST', 
                    url: '${pageContext.request.contextPath}/classesAction_findClassByClassNameAndGradeId',
                    data: {class_name: value, grade_id: grade_id/* name: value, grade: gradeId, start_year: startYear */},
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

    /* 改变学校时候发生的事件 */
    function changeSchoolEven(record) {
        $('#teacher_name').textbox('setValue', '');
        $('#teacher_id').val(0);

        $('#class-box').html('');
        if (record.gradeList != undefined) {
           // $('#grade').combobox("loadData", record.gradeList);
        } else {
            //$('#grade').combobox("loadData", [{id: '', name: '全部年级'}]);
        }

        if (record.schoolYear != undefined) {
            $('#school_year').text(record.schoolYear);
        } else {
            $('#school_year').text('');
        }

        /* 班级下次升级日期 */
        if (record.nextUpdateData != undefined) {
            $('#next_update_date').text(record.nextUpdateData);
        } else {
            $('#next_update_date').text('');
        }

        /* 下次升级的年份 */
        if (record.nextUpdateYear != undefined) {
            nextUpdateYear = record.nextUpdateYear;
        } else {
            nextUpdateYear = 0;
        }
    }

    $(function(){
        /* 班级类型 */
        if (classTypeJson.length > 1) {
            $('#type_label').combobox({
                //data: classTypeJson,
                url:'${pageContext.request.contextPath}/classTypeAction_findAllClassType.action',
                editable:false,
                valueField:'id',
                textField:'name',
                required: true, 
                onLoadSuccess:function(){           
                    var data = $('#type_label').combobox('getData');
                    if (data.length > 0) {
                        $('#type_label').combobox('select', data[0].id);
                    }
                }              
            });
        }
        
        /* 当前年级 */
        $('#grade').combobox({
            //data: [{id: '', name: '请选择年级'}],
            url:'${pageContext.request.contextPath}/gradeAction_findAllGradesToAdd.action',
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            onLoadSuccess:function(){
                $('#grade').combobox("setValue", '');
                
            },
            onSelect: function(record) {
            	
            	grade = $('#grade').combobox('getText');
            	
                if (record.classList != undefined) {
                    var classNames = [];

                    for (var i=0; i<record.classList.length; i++) {
                        if (record.classList[i].id != '') {
                            classNames.push(record.classList[i].name);
                        }
                    }
                    $('#class-box').html(classNames.join(','));
                } else {
                    $('#class-box').html('');
                }

                if (record.sort != undefined && nextUpdateYear > 0) {
                    startYear = nextUpdateYear - record.sort;
                    var nowLabel = '';
                    if (startYear == nowYear) {
                        nowLabel = '（今年）';
                    }

                    $('#start-year').text(startYear + '年' + nowLabel +' 秋学期开学');
                } else {
                    $('#start-year').text('');
                }
            }
        });

        /* 所属学校 */
        /* $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            onLoadSuccess:function(){
                var rows = $('#school_id').combobox('getData');
                if (rows.length) {
                    $('#school_id').combobox('select', rows[0].id);
                }
            },
            onSelect: function(record) {
                changeSchoolEven(record);
            }           
        }); */

        var nameData = [
            {id:1,name:"一班"},
            {id:2,name:"二班"},
            {id:3,name:"三班"},
            {id:4,name:"四班"},
            {id:5,name:"五班"},
            {id:6,name:"六班"},
            {id:7,name:"七班"},
            {id:8,name:"八班"}
        ];
        $('#class_name').combobox({
            //data: nameData,
            valueField:'id',
            textField:'name',
            required: true
        })

        // 老师名称 触发下拉搜索
        $(document).on('focus keyup','#teacher_name + .textbox .textbox-text',function(e){
        	var teacherName = $(this).val();
            if(e.keyCode == 13) return false;
            $('#teacher_id').val(0);
            //if (teacherName.length < 0) {
            if (1) {
                $('#teacher_table_box').show();
                if( teacherName == valueTeacherData || valueTeacherData == '@@@@') return false;

                $('#teacherTable').datagrid('load',{
                    //school_id: $('#school_id').combobox('getValue'),
                    teacher_name:teacherName
                });
            } else {
                $('#teacher_table_box').hide();
            
            valueTeacherData = teacherName;
           }
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">请选择班级类型</div><div id="_easyui_combobox_i1_1" class="combobox-item">普通班</div><div id="_easyui_combobox_i1_2" class="combobox-item">美术班</div><div id="_easyui_combobox_i1_3" class="combobox-item">舞蹈班</div><div id="_easyui_combobox_i1_4" class="combobox-item">特长班</div><div id="_easyui_combobox_i1_5" class="combobox-item">算术班</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item combobox-item-selected">请选择年级</div><div id="_easyui_combobox_i2_1" class="combobox-item">托班</div><div id="_easyui_combobox_i2_2" class="combobox-item">小班</div><div id="_easyui_combobox_i2_3" class="combobox-item">中班</div><div id="_easyui_combobox_i2_4" class="combobox-item">大班</div><div id="_easyui_combobox_i2_5" class="combobox-item">学前班</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i3_0" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i3_1" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i3_2" class="combobox-item">司南学辅1</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i4_0" class="combobox-item">一班</div><div id="_easyui_combobox_i4_1" class="combobox-item">二班</div><div id="_easyui_combobox_i4_2" class="combobox-item">三班</div><div id="_easyui_combobox_i4_3" class="combobox-item">四班</div><div id="_easyui_combobox_i4_4" class="combobox-item">五班</div><div id="_easyui_combobox_i4_5" class="combobox-item">六班</div><div id="_easyui_combobox_i4_6" class="combobox-item">七班</div><div id="_easyui_combobox_i4_7" class="combobox-item">八班</div></div></div></body></html>