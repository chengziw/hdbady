<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
<html>
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
	#inputtable input{
	width:130px;}
</style>


<form id="ff" method="post" style="height:688px;" data-href="/student/save.html?id=1052&amp;sinKey=1c24%2580%2500%25D7%2503n%253E%25D9S%2513%2528%259D%2591%257Cky%253F%258B%2523%25C2%25A5I%251D%7E%253C%25F7L%25B4%250B%2503%25ECq%25B5%2513%2598%259A%25FE%25FA%25BE%257D%259B7f0" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 998px; height: 688px;">

        <div class="panel layout-panel layout-panel-north" style="width: 998px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 980px; height: 600px;" title="" class="panel-body panel-body-noheader layout-body">

            <table id="inputtable" width="980" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                	<td align="right">学号：</td>
                    <td><input id="student_no" name="student_no" value="<s:property value="student.student_no"/>" required="true" class="easyui-textbox textbox-f" data-options="validType:['MaxLength']" style="display: none;" textboxname="student_no"></td>
                    <td align="right">学校：</td>
                    <td><input id="school_name" required="true" value="汤圆幼儿园" disabled="disabled" class="easyui-textbox textbox-f" style="display: none;" textboxname="school_name"></td>
               	 	<td align="right">年级：</td>
                    <td><input id="grade_id" value="<s:property value="student.classes.grade.name"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" disabled="disabled" ></td>
              		<%-- <input name="grade_id" value="<s:property value="student.grade.id"/>" type="hidden"> --%>
              		<td align="right">班级：</td> 		
              		<td><input id="class_id" required="true" name="class_id" value="<s:property value="student.classes.class_name"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="class_id" disabled="disabled" comboname="class_id"></td>
              		<%-- <input name="class_id" value="<s:property value="student.classes.id"/>" type="hidden"> --%>
                </tr>
                 <input name="id" value="<s:property value="student.id"/>" readonly="true" type="hidden" style："border:none"/></td>             
            
                <tr>
                    <td align="right">姓名：</td>
                    <td><input id="name" name="name" value="<s:property value="student.name"/>" required="true" class="easyui-textbox textbox-f" data-options="validType:['name','MaxLength']" style="display: none;" textboxname="name"></td>
             	    <td align="right">性别：</td>
                    <td><input id="sex" name="sex" value="<s:property value="student.sex"/>" required="true" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="sex" comboname="sex"></td>
                    <td align="right">出生日期：</td>
                    <td><input id="yearMonthDay" name="yearMonthDay" value="<s:property value="student.yearMonthDay"/>" required="true" data-options="" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="yearMonthDay" comboname="yearMonthDay"></td>
                	<td align="right">登录密码：</td>
                    <td><input id="password" type="password" name="password" value="<s:property value="student.password"/>" required="true" class="easyui-textbox" data-options="validType:['space','password','MaxLength']" style="display: none;"></td>
                </tr>

                <tr>
                    <td align="right">本地生源：</td>
                    <td><input id="is_local" name="is_local" value="<s:property value="student.is_local"/>" required="true" data-options="validType:'noNull',panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_local" comboname="is_local"></td>
                    <td align="right">教职子弟：</td>
                    <td><input id="is_teacherson" name="is_teacherson" value="<s:property value="student.is_teacherson"/>" required="true" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_teacherson" comboname="is_teacherson"></td>
                    <td align="right">户口类型：</td>
                    <td><input id="census_type" name="census_type" value="<s:property value="student.census_type"/>" required="true" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="census_type" comboname="census_type"></td>
                    <td align="right">入学日期：</td>
                    <td><input id="enter_date" name="enter_date" value="<s:property value="student.enter_date"/>" required="true" data-options="" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="enter_date" comboname="enter_date"></td>
                </tr>

                <tr>
               	    <td align="right">家长姓名：</td>
                    <td><input id="parent_name" name="parent_name" value="<s:property value="student.parent_name"/>" required="true" class="easyui-textbox textbox-f" data-options="validType:['name','MaxLength']" style="display: none;" textboxname="parent_name"></td>
                    <td align="right">关系：</td>
                    <td><input id="relationship" name="relationship" value="<s:property value="student.relationship"/>" required="true" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="relationship" comboname="relationship"></td>
             	    <td align="right">手机号：</td>
                    <td><input id="phone" name="phone" value="<s:property value="student.phone"/>" class="easyui-textbox textbox-f" required="true" data-options="validType:'mobile'" style="display: none;" textboxname="phone"></td>
        			<td align="right">家庭住址：</td>
                    <td><input id="address" name="address" value="<s:property value="student.address"/>" required="true" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;" textboxname="address"></td>
				        </tr>

                <tr>
                	
                    <td align="right">兴趣爱好：</td>
                    <td colspan="5">
                    <s:iterator value="{'唱歌','跳舞','下棋 ','体育运动','游戏','其他'}"  var="i" status="vs">
                    	<s:if test="#interests[#vs.index]!=''">
	                   		 <label><input style="width:15px;" name="interests" checked="checked" class="interests" value="<s:property value="#vs.index"/>" type="checkbox"> <s:property value="i"/>&nbsp;&nbsp;</label>
	                    </s:if><s:else>
	                   		 <label><input style="width:15px;" name="interests" class="interests" value="<s:property value="#vs.index"/>" type="checkbox"> <s:property value="i"/>&nbsp;&nbsp;</label>
						</s:else>                    
                    </s:iterator>
            
                    </td>
                 </tr>

                <tr>
                    <td align="right">身体状况：</td>
                    <td><input id="health_status" name="health_status" value="<s:property value="student.health_status"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="health_status" comboname="health_status"></td>
                    <td align="right">有无过敏史：</td>
                    <td><input id="is_allergy" name="is_allergy" value="<s:property value="student.is_allergy"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_allergy" comboname="is_allergy"></td>
                    <td align="right">有无先天病：</td>
                    <td><input id="is_predisease" name="is_predisease" value="<s:property value="student.is_predisease"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_predisease" comboname="is_predisease"></td>
                    <td align="right">有无体检表：</td>
                    <td><input id="is_health_form" name="is_health_form" value="<s:property value="student.is_health_form"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_health_form" comboname="is_health_form"></td>
                </tr>

                <tr>
                    <td align="right">验证证明：</td>
                    <td><input id="is_health_verify" name="is_health_verify" value="<s:property value="student.is_health_verify"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_health_verify" comboname="is_health_verify"></td>
                    <td align="right">接种复印件：</td>
                    <td><input id="is_ccine" name="is_ccine" value="<s:property value="student.is_ccine"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_ccine" comboname="is_ccine"></td>
                    <td align="right">血型：</td>
                    <td><input id="blood_type" name="blood_type" value="<s:property value="student.blood_type"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="blood_type" comboname="blood_type"></td>
                    <td align="right">易患何病：</td>
                    <td><input id="commom_disease" name="commom_disease" data-options="validType:'MaxLength'" value="<s:property value="student.commom_disease"/>" class="easyui-textbox textbox-f" style="display: none;" textboxname="commom_disease"></td>
                </tr>

                <tr>
                    <td align="right">就读方式：</td>
                    <td><input id="timetype_id" name="timetype_id" value="<s:property value="student.timetype_id"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="timetype_id" comboname="timetype_id"></td>
                    <td align="right">是否是独生子女：</td>
                    <td><input id="is_only_child" name="is_only_child" value="<s:property value="student.is_only_child"/>" data-options="panelHeight:'auto'" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="is_only_child" comboname="is_only_child"></td>
                    <td align="right">出生地：</td>
                    <td><input id="birthplace" name="birthplace" data-options="validType:'MaxLength'" value="<s:property value="student.birthplace"/>" class="easyui-textbox textbox-f" style="display: none;" textboxname="birthplace"></td>
                    <td align="right">身份证：</td>
                    <td><input id="identity_card" data-options="validType:'idcard'" name="identity_card" value="<s:property value="student.identity_card"/>" class="easyui-textbox textbox-f" style="display: none;" textboxname="identity_card"></td>
                </tr>

                <tr>
                    <td align="right">学生要求：</td>
                    <td colspan="5"><input id="demand" name="demand" value="<s:property value="student.demand"/>" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="width: 620px; display: none;" textboxname="demand"></td>
                </tr>

                <tr>
                    <td align="right">学校备注：</td>
                    <td colspan="5"><input id="note" name="note" data-options="validType:'MaxLength'" value="<s:property value="student.note"/>" class="easyui-textbox textbox-f" style="width: 620px; display: none;" textboxname="note"></td>
                </tr>
				
                <tr>
                    
                    <td colspan="8" style="font-weight:bold; border-bottom:1px solid #cccccc; color:#555555; padding-top:18px;">以下为自定义资料项（若无请忽略）</td>
                </tr>
				
                <tr>
                    
                    <td colspan="8">
					
<table width="100%" cellspacing="0" cellpadding="6" border="0">
  <tbody><tr>
   
    <td width="100">自定义资料项1：</td>
    <td>
                                                    <input id="field1" name="field1"  value="<s:property value="student.field1"/>" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;width: 700px;" textboxname="field2">
                        	</td>
  </tr>
  <tr>
    <td width="100">自定义资料项2：</td>
    <td>
                                                    <input id="field2" name="field2"  value="<s:property value="student.field2"/>" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;width: 700px;" textboxname="field3">
                        	</td>
  </tr>
  <tr>
    <td width="100">自定义资料项3：</td>
    <td>
                                                    <input id="field3" name="field3"  value="<s:property value="student.field3"/>" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;width: 700px;" textboxname="field4">
                        	</td>
  </tr>
</tbody></table>

					
					
					</td>
                </tr>

                <tr>
                    <td colspan="6">
                        <span style="color:red;font-size:12px;" id="show-error-message-box"></span>
                    </td>
                </tr>

            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 998px; left: 0px; top: 617px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 998px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
/* 转换PHPJSON为JS JSON格式 */
var schoolJson = '[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":40,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":42,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u8bf7\u9009\u62e9"}]}]}]';
schoolJson = eval('('+schoolJson+')');

var schoolId = 1;
var gradeId = 2;
var classId = 18;
var gradeJson = [{id:0,name:"请选择"}];
var classJson = [{id:0,name:"请选择"}];

for(var i=0; i < schoolJson.length; i++){
    if(schoolJson[i]['id'] == schoolId){
        gradeJson = schoolJson[i]['gradeList'];
        for(var j=0; j > gradeJson.length; j++){
            if(gradeJson[j]['id'] == gradeId){
                classJson = gradeJson[j]['classList'];
            }
        }
    }
}

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
        },/* 判断时名字出错 */
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
        		if (sum > 32) { //返回中文的个数并提示
        				return false;
        		}
        		return true;
            },
            message: '不能超过32个字母数字或16个汉字.'
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
        }
    });

function saveFrom(){
    if ($('#save-btn').hasClass('mylinkbtn-load')) {
        return false;
    }

    $('#save-btn').addClass('mylinkbtn-load');
    var url = $("#ff").attr('data-href');

    $('#ff').form('submit',{
    	url:'${pageContext.request.contextPath}/studentAction_editStudent.action',
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
function setCombobox(obj,selected){
    var data = [
        {id:1,name:'是',selected:selected==1?true:""},
        {id:2,name:'否',selected:selected==2?true:""}
    ];
    $(obj).combobox({
        data:data,
        valueField:'id',
        textField:'name',
        editable:false,
        onLoadSuccess:function(){
            //$(obj).combobox("setValue","请选择");
        }
    });
}

$(function(){
	var grade;
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
        	var class_name = $('#class_id').val();
        	//alert(class_name);
            $('#class_id').combobox("setValue",class_name);
        }
    });



    if(2 == 3){
        $('#grade_id').combobox({disabled:true});
        $('#class_id').combobox({disabled:true});
    }

    //性别
    var sex_data = [
        {id:'',sex_name:'请选择' },
        {id:'男',sex_name:'男'},
        {id:'女',sex_name:'女',selected:true}
    ];
    var sex = $('#sex').combobox({
        data:sex_data,
        valueField:'id',
        textField:'sex_name',
        editable:false,
        onLoadSuccess:function(){

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
        onLoadSuccess:function(){
            //$('#census_type').combobox("setValue",a.name);
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
        buttons: buttons,
        editable:false
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">请选择</div><div id="_easyui_combobox_i1_1" class="combobox-item">托班</div><div id="_easyui_combobox_i1_2" class="combobox-item combobox-item-selected">小班</div><div id="_easyui_combobox_i1_3" class="combobox-item">中班</div><div id="_easyui_combobox_i1_4" class="combobox-item">大班</div><div id="_easyui_combobox_i1_5" class="combobox-item">学前班</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item">请选择</div><div id="_easyui_combobox_i2_1" class="combobox-item">一班(2015年入学)</div><div id="_easyui_combobox_i2_2" class="combobox-item combobox-item-selected">二班(2015年入学)</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i3_0" class="combobox-item">请选择</div><div id="_easyui_combobox_i3_1" class="combobox-item">男</div><div id="_easyui_combobox_i3_2" class="combobox-item combobox-item-selected">女</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i4_0" class="combobox-item combobox-item-selected">是</div><div id="_easyui_combobox_i4_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i5_0" class="combobox-item">是</div><div id="_easyui_combobox_i5_1" class="combobox-item combobox-item-selected">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i6_0" class="combobox-item">是</div><div id="_easyui_combobox_i6_1" class="combobox-item combobox-item-selected">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i7_0" class="combobox-item">是</div><div id="_easyui_combobox_i7_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i8_0" class="combobox-item">是</div><div id="_easyui_combobox_i8_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i9_0" class="combobox-item">是</div><div id="_easyui_combobox_i9_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i10_0" class="combobox-item">是</div><div id="_easyui_combobox_i10_1" class="combobox-item combobox-item-selected">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i11_0" class="combobox-item">是</div><div id="_easyui_combobox_i11_1" class="combobox-item">否</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i12_0" class="combobox-item combobox-item-selected">非农</div><div id="_easyui_combobox_i12_1" class="combobox-item">农村</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i13_0" class="combobox-item">爸爸</div><div id="_easyui_combobox_i13_1" class="combobox-item combobox-item-selected">妈妈</div><div id="_easyui_combobox_i13_2" class="combobox-item">爷爷</div><div id="_easyui_combobox_i13_3" class="combobox-item">奶奶</div><div id="_easyui_combobox_i13_4" class="combobox-item">外公</div><div id="_easyui_combobox_i13_5" class="combobox-item">外婆</div><div id="_easyui_combobox_i13_6" class="combobox-item">叔叔</div><div id="_easyui_combobox_i13_7" class="combobox-item">阿姨</div><div id="_easyui_combobox_i13_8" class="combobox-item">其他家长</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i14_0" class="combobox-item combobox-item-selected">健康</div><div id="_easyui_combobox_i14_1" class="combobox-item">一般</div><div id="_easyui_combobox_i14_2" class="combobox-item">较差</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i15_0" class="combobox-item combobox-item-selected">未知</div><div id="_easyui_combobox_i15_1" class="combobox-item">A</div><div id="_easyui_combobox_i15_2" class="combobox-item">B</div><div id="_easyui_combobox_i15_3" class="combobox-item">O</div><div id="_easyui_combobox_i15_4" class="combobox-item">AB</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i16_0" class="combobox-item">全日制</div><div id="_easyui_combobox_i16_1" class="combobox-item">寄宿制</div><div id="_easyui_combobox_i16_2" class="combobox-item">半日制</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day " abbr="2017,1,24" style="">24</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day " abbr="2017,1,24" style="">24</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div></body></html>