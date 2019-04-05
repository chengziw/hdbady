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

<style type="text/css">
    .pushRange0{}
    .pushRange1{padding: 0 0 0 15px;}
    .pushRange2{padding: 0 0 0 15px;}
    ul,li{ list-style: none;}
    #add_ask_answer_input{}
    #ask_answer{  padding: 0; width: 410px; margin: -10px 0 0 38px; overflow-y:auto; height: 182px;}
    #ask_answer ul{ padding: 0; margin: 0;}
    #ask_answer ul li{ padding: 0 0 0 10px; height: 30px; line-height: 30px;}
    #ask_answer ul li input{padding: 2px 3px; width:292px; margin-left:25px;}
	a{
		text-decoration:none;
	}
</style>


<form id="ff" method="post" style="height:558px;" data-href="${pageContext.request.contextPath}/askAction_addAsk.action" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 768px; height: 558px;">

        <div class="panel layout-panel layout-panel-north" style="width: 768px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 750px; height: 470px;" title="" class="panel-body panel-body-noheader layout-body">
            <input name="id" value="" class="easyui-validatebox validatebox-text" type="hidden">
            <table cellspacing="0" cellpadding="8" border="0" width="100%">
                <tbody><tr>
                    <td>
                        
                                                <div style="display: inline">
                            问卷级别：<input id="ask_type" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none;" textboxname="ask_type" comboname="ask_type"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="ask_type" value="请选择通知级别" type="hidden"></span> --%>
                         </div>
                                                                        <div id="school_box" style="display: inline">
                            &nbsp;&nbsp;<!-- 所属学校： --><input id="school_id" type="hidden" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none;" textboxname="school_id" comboname="school_id"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="school_id" value="" type="hidden"></span> --%>
                        </div>
                                                                        <div id="targetman_box" style="display: inline">
                            &nbsp;&nbsp;<!-- 推送对象： --><input id="targetman_type" type="hidden" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none;" textboxname="targetman_type" comboname="targetman_type"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="targetman_type" value="请选择推送对象" type="hidden"></span> --%>
                        </div>
                                            </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tbody><tr>
                                <td valign="top" align="left" width="60">手机推送：</td>
                                <td valign="top" width="200"><div id="push_ranges" style="border-radius:5px;padding:8px;border:1px solid #95B8E7; height: 328px; overflow:auto;">

                                        
                                </div></td>
                                <td style=" padding:0px;padding-left:20px;line-height:22px;" valign="top">
                                    <p style="padding:0px; margin:0px;"><label>
                                        <input name="is_repeatsubmit" value="0" type="checkbox">
                                        同一学生的家长只允许其中一个家长代表投票</label>
                                    </p>
                                    <p>
                                        <label>
                                            <input name="is_anonymous" value="0" type="checkbox">
                                            记录每个投票者的所选投票项</label>
                                    </p>
                                    <p>
                                        问卷类型：<label><input name="is_singlesubmit" checked="checked" value="0" type="radio">多选
                                        </label>
                                        <label><input name="is_singlesubmit" value="1" type="radio">单选
                                        </label><span style="margin-left:88px;">查看结果：<label><input name="is_showresult" checked="checked" value="1" type="radio">允许
                                        </label>
                                        <label><input name="is_showresult" value="0" type="radio">不允许
                                        </label></span>
                                    </p>

                                    <p>问卷标题：<span style="margin-left:12px; margin-right:18px;">
                                    <input id="title" name="title" value="" required="true" style="width: 180px; display: none;" class="easyui-textbox textbox-f" data-options="validType:['MaxLength'] " textboxname="title">
                                    </span>
                                   	截止时间：<input id="end_time" value="" style="cursor: pointer; width: 100px; display: none;" class="easyui-datebox datebox-f combo-f textbox-f" data-options="novalidate:true" textboxname="end_time" comboname="end_time">
                                    </p>

                                    <p>问卷选项：<span style=" margin-left:12px;"><a id="add_ask_answer_input" href="javascript:;" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" group="">添加问卷选项</a></span></p>
                                    <div id="ask_answer">
                                        <ul>

                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
                <tr>
                    <td><div id="show-error-message-box" style="color: red;"></div>
                        <div id="hiddenInput" style="display: none"></div>
                    </td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 768px; left: 0px; top: 487px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 768px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
    var schoolListJson = '[{"id":"","name":"\u8bf7\u9009\u62e9\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]}]';
    schoolListJson = eval('('+schoolListJson+')');
    window.onload = function() { 
		$('#school_box').hide();
	   	$('#targetman_box').hide();
	}; 
    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

        //渲染 推送范围的input
        //获取选中的
        var nodes = $('#pushRangeTree').tree('getChecked');
        var html = '';
        if(nodes){
            for(var i=0; i<nodes.length; i++){
                html += '<input type="checkbox" class="push_ranges" checked name="push_ranges" value="'+nodes[i]['id']+'">';
            }
            $("#hiddenInput").html(html);
        }

        if(html == '' && 0 != 2){
            $.messager.alert('提示','请选择推送范围！','error');
            $('#save-btn').removeClass('mylinkbtn-load');
            return false;
        }

        var url = $("#ff").attr('data-href');
        $('#ff').form('submit',{
            url:url,
            onSubmit:function(){
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
                }
            }
        });
    }

    /**
     * 通知级别 切换 获取推送范围
     */
    function getPushRange(id,schoolId){
        var schoolId = schoolId == undefined ? 0 : schoolId;

        $('#push_ranges').html('');

        var url = '${pageContext.request.contextPath}/askAction_findGradeAndClass.action';
        //var url = 'http://192.168.54.1:8080/habady/json/homework-list.json';
        var data = {id:id,school_id:schoolId};
        $.ajax({
            url:url,
            data:data,
            type:'POST',
            dataType:'JSON',
            success:function(result){
                var html = '';
                if(result.status == 1){
                    var data = result.info;
                    //html += setFamilyInput(data);
                    html = '<ul id="pushRangeTree"></ul>';
                    var setEasyUiTree = 1;
                }else{
                    html += '没有相关信息，请联系客服人员！';
                    var setEasyUiTree = 0;
                }
                $('#push_ranges').html(html);
                if(setEasyUiTree){
                    $('#pushRangeTree').tree({
                        data:data,
                        idField:'id',
                        textField: 'text',
                        animate:true,
                        checkbox:true,
                        lines:true,
                        formatter:function(node){
                            //node.text = node.name
                            return node.name;
                        }
                    });
                }
            }
        });
    }

    /**
     * 递归构造 推送范围 input
     */
    function setFamilyInput(data,pid,children){
        var pid = pid == undefined ? 0 : pid;
        var children = children == undefined ? 'children' : children;
        var html = '';
        var num = data.length;
        for(var i=0;i<num;i++){
            html += pid != 2 ? '<div class="pushRange'+pid+'" pid="'+pid+'">' : (pid == 2 && i == 0 ? '<div class="pushRange'+pid+'" pid="'+pid+'">' : '');
            html += '<label>';
            html += '<input type="checkbox" class="push_ranges" name="push_ranges" value="'+data[i]['id']+'">';
            html += data[i]['name'];
            html += '</label>';
            html += data[i][children] ? setFamilyInput(data[i][children],pid+1) : '';
            html += (pid == 2 && i == num-1) ? '</div>' : '';   //三级，
            html += pid <= 1 ? '</div>' : '';   //一级，二级
        }
        return html;
    }

    /**
     * 删除 选项
     */
    function del(obj){
        $(obj).closest('li').remove();
    }

    $(function(){
        $('#school_id').combobox({
            data: schoolListJson,
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            novalidate:true,
            onLoadSuccess:function(){
                $('#school_id').combobox("setValue", '');
            },
            onSelect:function(record){
                $('#targetman_box').hide();
                ask_type.combobox('setValue',2);
                $('#push_ranges').html('');
                if(!record.id) return false;
                getPushRange(2,record.id)
            }
        });

        /* 通知级别 */
        var askTypeData = [
            {id:1,name:"集团级通知"},{id:2,name:"学校级通知"}        ];
        var ask_type = $('#ask_type').combobox({
            data: askTypeData,
            editable:false,
            valueField:'id',
            textField:'name',
            value:'请选择通知级别',
            onSelect:function(record){
                if(record.id == 1){
                    $('#school_box').hide();
                    $('#targetman_box').hide();
                    getPushRange(record.id);
                }else if(record.id == 2){
                	$('#school_box').hide();
                    $('#targetman_box').hide();
                    $('#push_ranges').html('');
                    if(parseInt($('#school_id').combobox("getValue")) > 0){
                        getPushRange(2,$('#school_id').combobox("getValue"));
                    }
                    $('#school_id').combobox("setValue",0);
                    $('#targetman_box').hide();
                    ask_type.combobox('setValue',2);
                    $('#push_ranges').html('');
                    if(!record.id) return false;
                    getPushRange(2,record.id)
                }
            }
        })

        /* 推送对象 */
        var targetmanTypeData = [
            {id:1,name:"仅家长"},{id:2,name:"仅教职工"},{id:3,name:"教职工和家长"}        ];
        var targetman_type = $('#targetman_type').combobox({
            data: targetmanTypeData,
            editable:false,
            valueField:'id',
            textField:'name',
            value:'请选择推送对象'
        })

        //  清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });
        //入职日期 结束
        $('#end_time').datebox({
            editable:false,
            required:true,
            buttons: buttons
        });


        $(document).on('click','input.push_ranges',function(){
            var pid = $(this).closest('div').attr('pid');
            var objDiv = $(this).closest('div.pushRange'+pid);
            var checked = $(this).prop('checked');
            switch(pid){
                case '0':    //一级 推送范围
                    if(checked){
                        objDiv.find('input.push_ranges').prop('checked',true);
                    }else{
                        objDiv.find('input.push_ranges').prop('checked',false);
                    }
                    break;
                case '1':    //二级 推送范围
                    if(checked){
                        objDiv.find('input.push_ranges').prop('checked',true);//所有班级选中
                        //如果全部年级选中了， 勾选学校
                        var is_all1_check = true;
                        objDiv.closest('div.pushRange0').find('div.pushRange1').each(function(){
                            if(!$(this).find('input.push_ranges:eq(0)').prop('checked')){
                                is_all1_check = false;
                            }
                        })
                        if(is_all1_check){//勾选学校
                            objDiv.closest('div.pushRange0').find('input.push_ranges:eq(0)').prop('checked',true);
                        }
                    }else{
                        objDiv.find('input.push_ranges').prop('checked',false);  //所有班级取消选中
                        objDiv.closest('div.pushRange0').find('input.push_ranges:eq(0)').prop('checked',false);//取消学校选中
                    }
                    break;
                case '2':    //三级 推送范围
                    //如果全部班级都选中了， 勾选年级
                    if(checked){
                        var is_all2_check = true;
                        objDiv.find('input.push_ranges').each(function(){
                            if(!$(this).prop('checked')){
                                is_all2_check = false;
                            }
                        })
                        if(is_all2_check){ //勾选年级
                            objDiv.closest('div.pushRange1').find('input.push_ranges:eq(0)').prop('checked',true);
                            //如果全部年级选中了， 勾选学校
                            var is_all1_check = true;
                            objDiv.closest('div.pushRange0').find('div.pushRange1').each(function(){
                                if(!$(this).find('input.push_ranges:eq(0)').prop('checked')){
                                    is_all1_check = false;
                                }
                            })
                            if(is_all1_check){//勾选学校
                                objDiv.closest('div.pushRange0').find('input.push_ranges:eq(0)').prop('checked',true);
                            }
                        }
                    }else{
                        objDiv.closest('div.pushRange1').find('input.push_ranges:eq(0)').prop('checked',false);//取消年级选中
                        objDiv.closest('div.pushRange0').find('input.push_ranges:eq(0)').prop('checked',false);//取消学校选中
                    }
                    break;
                default :
                    break;
            }
        })


        $(document).on('click','#add_ask_answer_input',function(){
            var html = '<li><input class="ask_answer_input textbox" name="ask_answer_input" value="">' +
                '<a href="javascript:;" onclick="del(this);"> &mdash; 移除</a></li>';

            $('#ask_answer ul').append(html);
            var len = $('#ask_answer ul li').length;
            var height = $('#ask_answer ul li').height();
            $('#ask_answer').scrollTop(len > 6 ? height*(len-6): 0);
        })

    })
</script>


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
        message: '不能超过32个字母数字或16个汉字.'
    },
    
});
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i5_0" class="combobox-item">集团级通知</div><div id="_easyui_combobox_i5_1" class="combobox-item">学校级通知</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i4_0" class="combobox-item combobox-item-selected">请选择学校</div><div id="_easyui_combobox_i4_1" class="combobox-item">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i4_2" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i4_3" class="combobox-item">司南学辅1</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i6_0" class="combobox-item">仅家长</div><div id="_easyui_combobox_i6_1" class="combobox-item">仅教职工</div><div id="_easyui_combobox_i6_2" class="combobox-item">教职工和家长</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">3月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2017,2,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2017,2,28" style="">28</td><td class="calendar-day " abbr="2017,3,1" style="">1</td><td class="calendar-day " abbr="2017,3,2" style="">2</td><td class="calendar-day " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day " abbr="2017,3,6" style="">6</td><td class="calendar-day " abbr="2017,3,7" style="">7</td><td class="calendar-day " abbr="2017,3,8" style="">8</td><td class="calendar-day " abbr="2017,3,9" style="">9</td><td class="calendar-day " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,3,12" style="">12</td><td class="calendar-day " abbr="2017,3,13" style="">13</td><td class="calendar-day " abbr="2017,3,14" style="">14</td><td class="calendar-day " abbr="2017,3,15" style="">15</td><td class="calendar-day " abbr="2017,3,16" style="">16</td><td class="calendar-day " abbr="2017,3,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,3,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,3,19" style="">19</td><td class="calendar-day " abbr="2017,3,20" style="">20</td><td class="calendar-day " abbr="2017,3,21" style="">21</td><td class="calendar-day " abbr="2017,3,22" style="">22</td><td class="calendar-day " abbr="2017,3,23" style="">23</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,3,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,3,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,3,26" style="">26</td><td class="calendar-day " abbr="2017,3,27" style="">27</td><td class="calendar-day " abbr="2017,3,28" style="">28</td><td class="calendar-day " abbr="2017,3,29" style="">29</td><td class="calendar-day " abbr="2017,3,30" style="">30</td><td class="calendar-day " abbr="2017,3,31" style="">31</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,4,1" style="">1</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,4,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,4,3" style="">3</td><td class="calendar-day calendar-other-month " abbr="2017,4,4" style="">4</td><td class="calendar-day calendar-other-month " abbr="2017,4,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,4,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,4,7" style="">7</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,4,8" style="">8</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div></body></html>