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

  
<form id="fm" method="post" style="height:328px; " data-href="${pageContext.request.contextPath}/roleAction_addRole.action" class="panel-noscroll">
        <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 488px; height: 328px;">            
            <div class="panel layout-panel layout-panel-north" style="width: 488px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 470px; height: 240px;" title="" class="panel-body panel-body-noheader layout-body">
                <input name="id" value="" class="easyui-validatebox validatebox-text" type="hidden">

                <div class="fitem" style=" margin-top:16px;">
                    <span style="width:110px; display:block; float:left; margin-left:10px;">
                        角色名称：
                    </span>
                    <input value="" name="name" class="easyui-textbox textbox-f" validtype="validateName" data-options="validType:'MaxLength'" required="true" style="width: 160px; display: none;" data-options="novalidate:true" textboxname="name"><%-- <span class="textbox" style="width: 158px; height: 20px;"><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 150px;" type="text"><input class="textbox-value" name="name" value="" type="hidden"></span> --%>
                </div>
	               <%--  <div class="fitem" style=" margin-top:18px;">
                    <span style="width:110px; display:block; float:left; margin-left:10px;">
                        可管理数据范围：
                    </span>
                    <input id="school_id" value="" style="cursor: pointer; display: none;" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'200',novalidate:true" textboxname="school_id" comboname="school_id"><span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="school_id" value="0" type="hidden"></span>                                
                </div> --%>
                <div class="fitem" style=" margin-top:18px;">
                    <span style="width:110px; display:block; float:left; margin-left:10px;">
                        备注说明：
                    </span>
                    <textarea  value="" name="note"  style="height: 80px; class="easyui-textbox textbox-f" required="true" data-options="validType:'MaxLength'"   maxlength="100" style="display: none;" textboxname="note" ></textarea ><%-- <span class="textbox" style="width: 145px; height: 20px;"><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 137px;" type="text"><input class="textbox-value" name="note" value="" type="hidden"></span> --%>
                </div>
                <div id="show-error-message-box" style="color: red"></div>
            </div></div> 

            <div class="panel layout-panel layout-panel-center" style="width: 488px; left: 0px; top: 257px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 488px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                    <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveUserRoleName()" group="">保存</a>
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
                </div>
    
            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
    </form>
        
  

<script type="text/javascript">
/* 转换PHPJSON为JS JSON格式 */
var schoolJson = '[{"id":"0","name":"\u6240\u6709\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]}]';
schoolJson = eval('('+schoolJson+')');

for(var i =0; i< schoolJson.length; i++) {
	if (schoolJson[i].id > 0) {
		schoolJson[i].name = '仅限 ' + schoolJson[i].name;
	}
}

/* 表单校验信息 */
$.extend($.fn.validatebox.defaults.rules, {
    validateName: {
        validator: function(value) {
            /* var schoolId = $('#school_id').combobox("getValue"); */
            var flag;
            $.ajax({
                type: 'POST',
                url: "${pageContext.request.contextPath}/roleAction_addRole.action",
                data: {name: value},
                dataType: 'json',
                async:false,
                success: function(result) {

                    flag = result.flag? true: false;
                }
            });
            return flag;
        },
        message: '角色名称已存在, 请重新输入'
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
    }
});

var url = $('#fm').attr('data-href'); // 保存学校地址

/* 重命名角色名称 */
function saveUserRoleName(){
    $('#show-error-message-box').html('');
    if ($('#save-btn').hasClass('mylinkbtn-load')) {
        return false;
    }
    $('#save-btn').addClass('mylinkbtn-load');

    $('#fm').form('submit',{
    	url: "${pageContext.request.contextPath}/roleAction_addRole.action?flag=1",
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
                $('#show-error-message-box').html(result.errMeg);
            } else {
                parent.window.closeWinIsReloadData = 1;
                parent.$('#openWindow').window('close');
            }
        }
    });
}

$(function(){
    /* 状态学校列表数据 */
    $('#school_id').combobox({
        data: schoolJson,
        editable:false,
       /*  editable:true, */
        valueField:'id',
        textField:'name',
        required: true,
        onLoadSuccess:function(){
            //$('#school_id').combobox("setValue", '');
        }     
    });

    if(schoolJson.length > 0){
        $('#school_id').combobox('select', schoolJson[0]['id'])
    }
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item combobox-item-selected">所有学校</div><div id="_easyui_combobox_i2_1" class="combobox-item">仅限 Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i2_2" class="combobox-item">仅限 司南学辅2</div><div id="_easyui_combobox_i2_3" class="combobox-item">仅限 司南学辅1</div></div></div></body></html>