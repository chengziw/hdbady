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

</style>


<form id="ff" method="post" style="height:388px;" data-href="${pageContext.request.contextPath}/noticeAction_addNotice.action" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 768px; height: 388px;">
                <div class="panel layout-panel layout-panel-north" style="width: 768px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 750px; height: 300px;" title="" class="panel-body panel-body-noheader layout-body">
            <input name="id" value="" class="easyui-validatebox validatebox-text" type="hidden">
            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td>
                                                <div style="display: inline">
                            通知级别：<input id="notice_type" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none;" textboxname="notice_type" comboname="notice_type"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="notice_type" value="请选择通知级别" type="hidden"></span> --%>
                         </div>
                        
                        <div id="school_box" style="display: inline; padding-left:28px;">
                          <!-- 所属学校： --><input id="school_id"  type="hidden" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none;" textboxname="school_id" comboname="school_id"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="school_id" value="" type="hidden"></span> --%>
                        </div>
                        <div id="targetman_box" style="display: inline; padding-left:28px;">
                            <!-- 推送对象： --><input id="targetman_type"  type="hidden" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none" textboxname="targetman_type" comboname="targetman_type"><%-- <span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="targetman_type" value="请选择推送对象" type="hidden"></span> --%>
                        </div>
                                            </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                            <tbody><tr>
                                <td width="60" valign="top" align="left">手机推送：</td>
                                <td width="200" valign="top" align="left"><div id="push_ranges" style="border-radius:5px;padding:8px;border:1px solid #95B8E7; height:160px; overflow:auto;">

                                        
                                </div></td>
                                <td style="padding-left:48px;" valign="top">通知标题：<input id="title" name="title" value="" required="true" style="width: 80%; display: none;" class="easyui-textbox textbox-f" data-options="validType:'title'" textboxname="title"><%-- <span class="textbox easyui-fluid" style="width: 338px; height: 20px;"><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 330px;" type="text"><input class="textbox-value" name="title" value="" type="hidden"></span> --%>
                                    <br><br>通知内容：<input id="descs" name="descs" value="" required="true" style="height: 143px; width: 80%; line-height: 23px; display: none;" class="easyui-textbox textbox-f" data-options="multiline:true,validType:'descs'" textboxname="descs"><%-- <span class="textbox easyui-fluid" style="width: 338px; height: 141px;"><textarea class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; height: 133px; width: 330px;"></textarea><input class="textbox-value" name="descs" value="" type="hidden"></span> --%>
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

        <div class="panel layout-panel layout-panel-center" style="width: 768px; left: 0px; top: 317px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 768px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
	
	window.onload = function() { 
		$('#school_box').hide();
	   	$('#targetman_box').hide();
	}; 
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
	    title: {
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
	    		if (sum > 50) { //返回中文的个数
	    				return false;
	    		}
	    		return true;
	        },
	        message: '标题过长.'
	    },
	    descs: {
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
	    		if (sum > 5000) { //返回中文的个数
	    				return false;
	    		}
	    		return true;
	        },
	        message: '通知内容过长.'
	    },
	    
	});
	
    var schoolListJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]}]';
    schoolListJson = eval('('+schoolListJson+')');
    function saveFrom(){
		
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $("#show-error-message-box").html('');
        $('#save-btn').addClass('mylinkbtn-load');

        //渲染 推送范围的input
        //获取选中的
        var nodes = $('#pushRangeTree').tree('getChecked');
        var html = '';
        if(nodes){
            for(var i=0; i<nodes.length; i++){
                /* html += '<input type="checkbox" class="push_ranges" checked name="push_ranges'+nodes[i]['pid']+'['+nodes[i]['id']+']" value="'+nodes[i]['id']+'">'; */
            	html += '<input type="checkbox" class="push_ranges" checked name="push_ranges" value="'+nodes[i]['id']+'">';
            }
            $("#hiddenInput").html(html);
        }

        if(html == '' && 0 != 2){
            $.messager.alert('提示','请选择手机推送范围！','error');
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
        var url = '${pageContext.request.contextPath}/noticeAction_findGradeAndClass.action';
        //var url = '${pageContext.request.contextPath}/noticeAction_findStructure.action';
        //var url = '${pageContext.request.contextPath}/json/kebiao.json';
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

    $(function(){
        var school_Id = 0;
        /* $('#school_id').combobox({
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
                notice_type.combobox('setValue',2);
                $('#push_ranges').html('');
                if(!record.id) return false;
                getPushRange(2,record.id)
            }
        });
 */
        /* 通知级别 */
        var noticeTypeData = [
            {id:1,name:"集团级通知"},{id:2,name:"学校级通知"}        ];
        var notice_type = $('#notice_type').combobox({
            data: noticeTypeData,
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
                    $('#school_id').combobox("setValue", 0);
                    $('#targetman_box').hide();
                    notice_type.combobox('setValue',2);
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i5_0" class="combobox-item">集团级通知</div><div id="_easyui_combobox_i5_1" class="combobox-item">学校级通知</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i4_0" class="combobox-item combobox-item-selected">请选择学校</div><div id="_easyui_combobox_i4_1" class="combobox-item">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i4_2" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i4_3" class="combobox-item">司南学辅1</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i6_0" class="combobox-item">仅家长</div><div id="_easyui_combobox_i6_1" class="combobox-item">仅教职工</div><div id="_easyui_combobox_i6_2" class="combobox-item">教职工和家长</div></div></div></body></html>