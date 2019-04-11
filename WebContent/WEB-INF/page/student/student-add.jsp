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

<style type="text/css">
    .fitem{ line-height: 30px; }
    .lad_text{ font-size: 12px; width: 70px; display: inline-block;}
    .span_text{ font-size: 12px; color: #999;}
    .span_text2{ font-size: 12px;}
	#inputtable input{
	width:130px;}
</style>


<form id="ff" method="post" style="height:688px;" data-href="url:'${pageContext.request.contextPath}/studentAction_addStudent.action'," class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 998px; height: 688px;">

        <div class="panel layout-panel layout-panel-north" style="width: 998px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 980px; height: 600px;" title="" class="panel-body panel-body-noheader layout-body">

            <table id="inputtable" width="980" cellspacing="0" cellpadding="8" border="0">
			
                <tbody><tr>
                    <td align="right">学校：</td>
                    <td>汤圆幼儿园<!-- <input id="school_id" required="true" value="" data-options="validType:'noNull'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="school_id" comboname="school_id"> --></td>
                    <td colspan="6" align="left">
                        <span id="schoolLastText"><font color="blue">该校当前学年：2016学年（2016年9月 - 2017年7月18号）</font>&nbsp;&nbsp;<span style="color:#555555; font-weight:bold;">.</span>&nbsp;&nbsp;</span>
                    </td>
                </tr>
				
                <tr>
                    <td align="right">年级：</td>
                    <td><input id="grade_id" required="true" name="grade_id" value="" data-options="validType:'noNull',panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="grade_id" comboname="grade_id"></td>
					<td align="right">班级：</td>
                    <td><input id="class_id" required="true" name="class_id" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="class_id" disabled="disabled" comboname="class_id"></td>
                    <td align="right">年龄：</td>
                    <td><input id="age" name="age" class="easyui-textbox textbox-f" data-options="validType:['age','agenumber']"style="display: none;"  textboxname="age"></td>
                    <td align="right">学号：</td>
                    <td><input id="student_no" data-options="validType:'MaxLength'" required="true"  name="student_no" value="" class="easyui-textbox textbox-f" style="display: none;" textboxname="student_no"></td>
               </tr>

                <tr>
                    <td align="right">姓名：</td>
                    
                    <td><input id="name" name="name" value="" required="true" class="easyui-textbox textbox-f" data-options="validType:['name','MaxLength']" style="display: none;" textboxname="name"></td>
                    <td align="right">性别：</td>
                    <td><input id="sex" value="" required="true" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="sex" comboname="sex"></td>
                    <td align="right">出生日期：</td>
                    <td><input id="yearMonthDay" value="" required="true" data-options="validType:['brither_name','dangqianriqi']" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="yearMonthDay" comboname="yearMonthDay"></td>
                	<td align="right">登录密码：</td>
                    <td><input id="password" name="password" value="" required="true" class="easyui-textbox" data-options="validType:['space','password','MaxLength']" style="display: none;"></td>
                </tr>
                

                <tr>
                    <td align="right">本地生源：</td>
                    <td><input id="is_local" value="" required="true" data-options="validType:'noNull',panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_local" comboname="is_local"></td>
                    <td align="right">教职子弟：</td>
                    <td><input id="is_teacherson" value="" required="true" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_teacherson" comboname="is_teacherson"></td>
                    <td align="right">户口类型：</td>
                    <td><input id="census_type" value="" required="true" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="census_type" comboname="census_type"></td>
                    <td align="right">入学日期：</td>
                    <td><input id="enter_date" value="0" required="true" data-options="" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="enter_date" comboname="enter_date"></td>
                </tr>

                <tr>
                    <td align="right">家长姓名: </td>
                    <td><input id="parent_name" name="parent_name" value="" required="true" class="easyui-textbox textbox-f" data-options="validType:['name','MaxLength[32]']" style="display: none;" textboxname="parent_name"></td>
                    <td align="right">关系：</td>
                    <td><input id="relationship" value="" required="true" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="relationship" comboname="relationship"></td>
                    <td align="right">手机号：</td>
                    <td><input id="phone" name="phone" value="" class="easyui-textbox textbox-f" required="true" data-options="validType:'mobile'" style="display: none;" textboxname="phone"></td>
                    <td align="right">家庭住址：</td>
                    <td><input id="address" name="address" value="" required="true" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;" textboxname="address"></td>
                </tr>

                <tr>
                  <td align="right">兴趣爱好：</td>
                    <td colspan="5">
                    <label><input style="width:15px;" name="interests" class="interests" value="0" type="checkbox"> 唱歌&nbsp;&nbsp;</label>
                    <label><input style="width:15px;" name="interests" class="interests" value="1" type="checkbox"> 跳舞&nbsp;&nbsp;</label>
                    <label><input style="width:15px;" name="interests" class="interests" value="2" type="checkbox"> 下棋&nbsp;&nbsp;</label>
                    <label><input style="width:15px;" name="interests" class="interests" value="3" type="checkbox"> 体育运动&nbsp;&nbsp;</label>
                    <label><input style="width:15px;" name="interests" class="interests" value="4" type="checkbox"> 游戏&nbsp;&nbsp;</label>
                    <label><input style="width:15px;" name="interests" class="interests" value="5" type="checkbox"> 其他&nbsp;&nbsp;</label>                    </td>
                </tr>

                <tr>
                    <td align="right">身体状况：</td>
                    <td><input id="health_status" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="health_status" comboname="health_status"></td>
                    <td align="right">有无过敏史：</td>
                    <td><input id="is_allergy" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_allergy" comboname="is_allergy"></td>
                    <td align="right">有无先天病：</td>
                    <td><input id="is_predisease" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_predisease" comboname="is_predisease"></td>
                    <td align="right">有无体检表：</td>
                    <td><input id="is_health_form" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_health_form" comboname="is_health_form"></td>
                </tr>

                <tr>
                    <td align="right">验证证明：</td>
                    <td><input id="is_health_verify" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_health_verify" comboname="is_health_verify"></td>
                    <td align="right">接种复印件：</td>
                    <td><input id="is_ccine" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_ccine" comboname="is_ccine"></td>
                    <td align="right">血型：</td>
                    <td><input id="blood_type" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="blood_type" comboname="blood_type"></td>
                    <td align="right">易患何病：</td>
                    <td><input id="commom_disease" name="commom_disease" value="" class="easyui-textbox textbox-f" style="display: none;" textboxname="commom_disease"></td>
                </tr>

                <tr>
                    <td align="right">就读方式：</td>
                    <td><input id="timetype_id" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="timetype_id" comboname="timetype_id"></td>
                    <td align="right">是否是独生子女：</td>
                    <td><input id="is_only_child" value="" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_only_child" comboname="is_only_child"></td>
                    <td align="right">出生地：</td>
                    <td><input id="birthplace" name="birthplace" data-options="validType:'MaxLength'" value="" class="easyui-textbox textbox-f" style="display: none;" textboxname="birthplace"></td>
                    <td align="right">身份证：</td>
                    <td><input id="identity_card" data-options="validType:'idcard'" name="identity_card" value="" class="easyui-textbox textbox-f" style="display: none;" textboxname="identity_card"></td>
                </tr>

                <tr>
                    <td align="right">学生要求：</td>
                    <td colspan="5"><input id="demand" name="demand" value="" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="width: 620px; display: none;" textboxname="demand"></td>
                </tr>

                <tr>
                    <td align="right">学校备注：</td>
                    <td colspan="5"><input id="note" name="note" value="" data-options="validType:'MaxLength'" class="easyui-textbox textbox-f" style="width: 620px; display: none;" textboxname="note"></td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="5"><span id="show-error-message-box" style="color: red;"></span></td>
                </tr>
				
                <tr>
                    
                    <td colspan="8" style="font-weight:bold; border-bottom:1px solid #cccccc; color:#555555; padding-top:18px;">以下为自定义资料项（若无请忽略）</td>
                </tr>
				
                <tr>
                    
                    <td colspan="8">
					
					<table width="100%" cellspacing="0" cellpadding="6" border="0">
  <tbody>
  <tr>
 <%--    <td width="100">是否深户：</td>
    <td>
                                                                                                                <span>
                                                                                                                <input style="width: 20px;" name="field1" value="1" type="radio"> 是                                                                    </span>
                                                            <span>
                                                                                                                <input checked="checked" style="width: 20px;" name="field1" value="2" type="radio"> 否                                                                    </span>
                                                    	</td>
	
	 --%>
    <td width="100">自定义资料项1：</td>
    <td>
    <input id="field1" name="field1" value="" style="width: 700px; display: none;" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;" textboxname="field2">
    </td>
  </tr>
  
  <tr>
    <td>自定义资料项2：</td>
    <td>
    <input id="field2" name="field2" value="" style="width: 700px; display: none;" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;" textboxname="field3">
    </td>
  </tr>
  <tr>
    <td>自定义资料项3：</td>
    <td>
    <input id="field3" name="field3" value="" style="width: 700px; display: none;" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;" textboxname="field4">
    </td>
  </tr>
</tbody></table>
					</td>
                </tr>
            </tbody></table>

        </div></div>
	
        <div class="panel layout-panel layout-panel-center" style="width: 998px; left: 0px; top: 617px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 998px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <input name="status_name" value="1" type="hidden">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
/* 转换PHPJSON为JS JSON格式 */
var schoolJson = '[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"laveDay":175},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"laveDay":175},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":40,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":42,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"laveDay":175}]';
schoolJson = eval('('+schoolJson+')');

    //验证扩展
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
        age:{
        	validator: function (value) {
                if(value>50){
                	return false;
                }
                /* return false; */
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
        space: {
        	//validator: function (value, param) { return $.trim(value) != '' },
            //message: '不能为空，全空格也不行'
        	validator: function (value) {
                if(value.indexOf(" ")>=0){
                	return false;
                }
                return true;
            },
            message: '不能存在空格！'
        },
        brither_name:{
        	validator: function (value) {
        		var reg=$('#enter_date').datebox("getValue");
        		if(value>reg){
        			return false;
        		}
        		return true;
            },
            message: '出生日期不能晚于入学日期.'
        },
        dangqianriqi:{
        	validator: function (value) {
        		var reg=$('#enter_date').val();
        		if(value>reg){
        			return false;
        		}
        		return true;
            },
            message: '出生日期不能晚于当前日期.'
        },
        password:{
        	validator: function (value) {
        		var reg=/[\u4E00-\u9FA5]/g;
        		var len=0;
        		if(value.match(reg)!=null){
        			   len=value.match(reg).length*2;
        		}
        		if (len>0) { //返回中文的个数
        				return false;
        		}
        		return true;
            },
            message: '请不要输入中文'
        },
        /* 
        //密码长度验证 
        passwordlength:{
        	validator: function (value) {
                var reg = /^.{6}$/; 
                return reg.test(value);
            },
            message: '请输入6位密码.'
        } */
    });

    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }

        $('#save-btn').addClass('mylinkbtn-load');
        var url = $("#ff").attr('data-href');

        $('#ff').form('submit',{
        	url:'${pageContext.request.contextPath}/studentAction_addStudent.action',
            onSubmit:function(){
                var result = $(this).form('enableValidation').form('validate');
                if(!result){
                    $('#save-btn').removeClass('mylinkbtn-load');
                }
                return result;
            },
            success:function(result){
                var result = eval('('+result+')');
                if (result.status==1){
                    window.parent.showMessage('提示信息', result.info);
                    parent.window.closeWinIsReloadData=1;
                    parent.$('#openWindow').window('close');
                }else{
                    $('#save-btn').removeClass('mylinkbtn-load');
                    $("#show-error-message-box").html(result.info);
                    $.messager.alert('提示',result.info);
                }
            }
        });
    }

    //设置 下拉框
    function setCombobox(obj,value){
        var data = [
            {id:'是',name:'是'},
            {id:'否',name:'否'}
        ];
        $(obj).combobox({
            data:data,
            valueField:'id',
            textField:'name',
            editable:false,
			value:value?value:'',
            onLoadSuccess:function(){
                //$(obj).combobox("setValue","请选择");
            }
        });
    }

    $(function(){
        //学校
        //var next_upgrade_year,first_term_month,first_termname;
        /* $('#school_id').combobox({
            data:schoolJson,
            valueField:'id',
            textField:'name',
            editable:false,
            //value:schoolJson.length==2?schoolJson[1]['id']:'',
            onLoadSuccess:function(){
                //$('#school_id').combobox("setValue","请选择");
            },
            onSelect:function(record){
                if(record.gradeList){
                    $('#grade_id').combobox({data:record.gradeList,disabled:false});
                    var html ='该校当前学年：';
                        html += '&lt;font color="blue"&gt;'+(record.next_upgrade_year-1)+'学年（';
                        html += (record.next_upgrade_year-1)+'年'+record.first_term_month+'月 - ';
                        html += record.next_upgrade_year+'年'+record.upgrade_month+'月'+record.upgrade_day+'号）&lt;/font&gt;&amp;nbsp;&amp;nbsp;';

                    if(record.laveDay > 15){
                        html += '&lt;span style="color:#555555; font-weight:bold;"&gt;'+record.laveDay+'天后自动升级&lt;/span&gt;&amp;nbsp;&amp;nbsp;'
                    }else{
                        html += '&lt;span style="color:red; font-weight:bold;"&gt;特别提醒：所注册的学生将在'+record.laveDay+'天后自动升级&lt;/span&gt;';
                    }
                    $("#schoolLastText").html(html);
                    $("#gradeLastText").html('');

                    //定义 全局学校数据，年级切换时使用
                    next_upgrade_year = record.next_upgrade_year;
                    first_term_month = record.first_term_month;
                    first_termname = record.first_termname;
                }else{
                    next_upgrade_year = 0;
                    first_term_month = 0;
                    first_termname = 0;
                    $("#schoolLastText").html('');
                    $("#gradeLastText").html('');

                    $('#grade_id').combobox({data:[{id:'',name:"请选择"}],disabled:true});

                }
                $('#class_id').combobox({disabled:true});
            }
        }) */

        

        /* if(schoolJson.length >= 2){
            $('#school_id').combobox('select',schoolJson[1]['id']);
            $('#grade_id').combobox({data:schoolJson[1]['gradeList'],disabled:false});
        } */

        //年级
        $('#grade_id').combobox({
 			url:'${pageContext.request.contextPath}/gradeAction_findAllGrades.action',
 			data:[{id:'',name:"请选择"}],
 			valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                //$('#grade_id').combobox("setValue","请选择");
            },
            onSelect:function(record){
            	$('#class_id').combobox({data:record.classList,value:'',disabled:false});
            	var id = record.id;
            	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeId.action?id='+id+'';
            	$('#class_id').combobox('reload', url);
            }
        });

        //班级
        $('#class_id').combobox({
            data:[{id:'',name:"请选择"}],
        	valueField:'id',
            textField:'name',
            disabled:true,//不能编辑:true
            editable:false,
            onLoadSuccess:function(){
                //$('#class_id').combobox("setValue","请选择");
            }
        });

        
        

        //性别
        var sex_data = [
            {id:'男',sex_name:'男'},
            {id:'女',sex_name:'女'}
        ];
        var sex = $('#sex').combobox({
            data:sex_data,
            valueField:'id',
            textField:'sex_name',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
        });
        

        var data = [
                    {id:'是',yes_no:'是'},
                    {id:'否',yes_no:'否'}
                ];
        //是否本地
        //setCombobox('#is_local',1);
        var is_local = $('#is_local').combobox({
            data:data,
            valueField:'id',
            textField:'yes_no',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
        });
        //有无过敏史
        //setCombobox('#is_allergy',2);
        var is_allergy = $('#is_allergy').combobox({
            data:data,
            valueField:'id',
            textField:'yes_no',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
		});
        //有无先天性疾病
        //setCombobox('#is_predisease',2);
        var is_predisease = $('#is_predisease').combobox({
            data:data,
            valueField:'id',
            textField:'yes_no',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
		});
        //体检表
        //setCombobox('#is_health_form');
        var is_health_form = $('#is_health_form').combobox({
            data:data,
            valueField:'id',
            textField:'yes_no',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
		});
        //验证证明
        //setCombobox('#is_health_verify');
        var is_health_verify = $('#is_health_verify').combobox({
            data:data,
            valueField:'id',
            textField:'yes_no',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
		});
        //接种复印件
        //setCombobox('#is_ccine');
        var is_ccine = $('#is_ccine').combobox({
            data:data,
            valueField:'id',
            textField:'yes_no',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
		});
        //是否教职工子女
        //setCombobox('#is_teacherson',2);
        var is_teacherson = $('#is_teacherson').combobox({
            data:data,
            valueField:'id',
            textField:'yes_no',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
		});
        //是否是独生子女
        //setCombobox('#is_only_child');
        var is_only_child = $('#is_only_child').combobox({
            data:data,
            valueField:'id',
            textField:'yes_no',
            editable:false,
            onLoadSuccess:function(){
                //$('#sex').combobox("setValue","请选择");
            }
		});
        
        
        
        

        //户口类型
        var census_type = [
            {id:'非农',name:"非农"},{id:'农村',name:"农村"}        ];
        $('#census_type').combobox({
            data:census_type,
            valueField:'id',
            textField:'name',
            editable:false,
			value:'未知',
            onLoadSuccess:function(){
                //$('#census_type').combobox("setValue","请选择");
            }
        });

        var relationshipData = [
            {id:"爸爸",name:"爸爸"},{id:"妈妈",name:"妈妈"},{id:"爷爷",name:"爷爷"},{id:"奶奶",name:"奶奶"},{id:"外公",name:"外公"},{id:"外婆",name:"外婆"},{id:"叔叔",name:"叔叔"},{id:"阿姨",name:"阿姨"},{id:"其他家长",name:"其他家长"}        ];
        $('#relationship').combobox({
            data:relationshipData,
            valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                //$('#relationship').combobox("setValue","请选择");
            }
        })

        //健康状况
        var health_data = [
            {id:"健康",name:"健康"},{id:"一般",name:"一般"},{id:"较差",name:"较差"}        ];
        $('#health_status').combobox({
            data:health_data,
            valueField:'id',
            textField:'name',
            editable:false,
			//value:'未知',
            onLoadSuccess:function(){
                //$('#health_status').combobox("setValue","请选择");
            }
        });

        //血型
        var blood_data = [
            {id:"未知",name:"未知"},{id:"A",name:"A"},{id:"B",name:"B"},{id:"O",name:"O"},{id:"AB",name:"AB"}];
        $('#blood_type').combobox({
            data:blood_data,
            valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                //$('#blood_type').combobox("setValue","请选择");
            }
        });

        //就读方式
        var timetype_id_data = [
            {id:"全日制",name:"全日制"},{id:"寄宿制",name:"寄宿制"},{id:"半日制",name:"半日制"}        ];
        $("#timetype_id").combobox({
            data: timetype_id_data,
            valueField:'id',
            textField:'name',
            editable:false,
            onLoadSuccess:function(){
                //$('#timetype_id').combobox("setValue","请选择");
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
        //出生日期
        $('#yearMonthDay').datebox({
            /* buttons: buttons,
            editable:false */
        	 onSelect : function(beginDate){ 
           	  $('#yearMonthDay').calendar({ 
           	   validator: function(date){ 
           	    return yearMonthDay<date;//<= 
           	   } 
           	  }); 
           	 } 
            
        }); 
        //入读日期
        $('#enter_date').datebox({
            buttons: buttons,
            editable:false
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">请选择</div><div id="_easyui_combobox_i1_1" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_2" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i1_3" class="combobox-item">司南学辅1</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i5_0" class="combobox-item">请选择</div><div id="_easyui_combobox_i5_1" class="combobox-item">托班</div><div id="_easyui_combobox_i5_2" class="combobox-item">小班</div><div id="_easyui_combobox_i5_3" class="combobox-item">中班</div><div id="_easyui_combobox_i5_4" class="combobox-item">大班</div><div id="_easyui_combobox_i5_5" class="combobox-item">学前班</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i6_0" class="combobox-item">请选择</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i7_0" class="combobox-item">男</div><div id="_easyui_combobox_i7_1" class="combobox-item">女</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i8_0" class="combobox-item combobox-item-selected">是</div><div id="_easyui_combobox_i8_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i9_0" class="combobox-item">是</div><div id="_easyui_combobox_i9_1" class="combobox-item combobox-item-selected">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i10_0" class="combobox-item">是</div><div id="_easyui_combobox_i10_1" class="combobox-item combobox-item-selected">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i11_0" class="combobox-item">是</div><div id="_easyui_combobox_i11_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i12_0" class="combobox-item">是</div><div id="_easyui_combobox_i12_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i13_0" class="combobox-item">是</div><div id="_easyui_combobox_i13_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i14_0" class="combobox-item">是</div><div id="_easyui_combobox_i14_1" class="combobox-item combobox-item-selected">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i15_0" class="combobox-item">是</div><div id="_easyui_combobox_i15_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i16_0" class="combobox-item combobox-item-selected">非农</div><div id="_easyui_combobox_i16_1" class="combobox-item">农村</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i17_0" class="combobox-item">爸爸</div><div id="_easyui_combobox_i17_1" class="combobox-item">妈妈</div><div id="_easyui_combobox_i17_2" class="combobox-item">爷爷</div><div id="_easyui_combobox_i17_3" class="combobox-item">奶奶</div><div id="_easyui_combobox_i17_4" class="combobox-item">外公</div><div id="_easyui_combobox_i17_5" class="combobox-item">外婆</div><div id="_easyui_combobox_i17_6" class="combobox-item">叔叔</div><div id="_easyui_combobox_i17_7" class="combobox-item">阿姨</div><div id="_easyui_combobox_i17_8" class="combobox-item">其他家长</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i18_0" class="combobox-item combobox-item-selected">健康</div><div id="_easyui_combobox_i18_1" class="combobox-item">一般</div><div id="_easyui_combobox_i18_2" class="combobox-item">较差</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i19_0" class="combobox-item">未知</div><div id="_easyui_combobox_i19_1" class="combobox-item">A</div><div id="_easyui_combobox_i19_2" class="combobox-item">B</div><div id="_easyui_combobox_i19_3" class="combobox-item">O</div><div id="_easyui_combobox_i19_4" class="combobox-item">AB</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i20_0" class="combobox-item">全日制</div><div id="_easyui_combobox_i20_1" class="combobox-item">寄宿制</div><div id="_easyui_combobox_i20_2" class="combobox-item">半日制</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,1,24" style="">24</td><td class="calendar-day " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,1,24" style="">24</td><td class="calendar-day " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div></body></html>