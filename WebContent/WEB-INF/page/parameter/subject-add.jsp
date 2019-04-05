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
    .fitem{ line-height: 30px; }
    .lad_text{ font-size: 12px; width: 70px; display: inline-block;}
    .span_text{ font-size: 12px; color: #999;}
    .span_text2{ font-size: 12px;}
</style>


<form id="ff" method="post" style="height:328px;" data-href="${pageContext.request.contextPath}/subjectAction_addSubject.action" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 496px; height: 328px;">

        <div class="panel layout-panel layout-panel-north" style="width: 496px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 478px; height: 60px;" title="" class="panel-body panel-body-noheader layout-body">
            <!-- <input name="id" value="" class="easyui-validatebox validatebox-text" type="hidden"> -->
            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody>
                <%-- <tr>
                    <td width="20%">学&nbsp;&nbsp;校：</td>
                    <td><input id="school_id" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto'" style="width: 165px; display: none;" textboxname="school_id" comboname="school_id"><span class="textbox combo" style="width: 163px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 137px;" type="text"><input class="textbox-value" name="school_id" value="1" type="hidden"></span></td>
                    <td width="36%">&nbsp;</td>
                </tr> --%>
                <tr>
                    <td>学科名称：</td>
                    <td><input id="name" name="name" value="" class="easyui-textbox textbox-f" data-options="prompt:'如：音乐/舞蹈/美术等',validType:'MaxLength'" style="width: 165px; display: none;" required="true" textboxname="name"><%-- <span class="textbox" style="width: 163px; height: 20px;"><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="如：音乐/舞蹈/美术等" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 155px;" type="text"><input class="textbox-value" name="name" value="" type="hidden"></span> --%>
                    </td>
                    <td><div style="color:red;font-size:12px;" id="name_text"></div></td>
                </tr>
                
                <%-- <tr>
                    <td valign="top">适用年级：</td>
                   <td><div id="gradecheck" style="display: inline-block;line-height: 16px;"><label><input class="all_grade_id" type="checkbox"><span class="span_text2">全部年级</span></label><br><label><input class="grade_id" name="grade_id[1]" value="1" type="checkbox"><span class="span_text2">托班</span></label><br><label><input class="grade_id" name="grade_id[2]" value="2" type="checkbox"><span class="span_text2">小班</span></label><br><label><input class="grade_id" name="grade_id[3]" value="3" type="checkbox"><span class="span_text2">中班</span></label><br><label><input class="grade_id" name="grade_id[4]" value="4" type="checkbox"><span class="span_text2">大班</span></label><br><label><input class="grade_id" name="grade_id[5]" value="5" type="checkbox"><span class="span_text2">学前班</span></label><br><label><input class="grade_id" name="grade_id[6]" value="50" type="checkbox"><span class="span_text2">111</span></label><br><label><input class="grade_id" name="grade_id[7]" value="51" type="checkbox"><span class="span_text2">11112</span></label><br><label><input class="grade_id" name="grade_id[8]" value="64" type="checkbox"><span class="span_text2">小托</span></label><br><label><input class="grade_id" name="grade_id[9]" value="94" type="checkbox"><span class="span_text2">455</span></label><br></div>
                    </td>
                    
                    
					<td>
					  <div id="gradecheck" style="display: inline-block;line-height: 16px;">
					   <label><input class="all_grade_id" type="checkbox" /><span class="span_text2">全部年级</span></label>
					  
							<s:iterator value="classType" status="vs">
							   <br />
							   <label><input class="grade_id" name="grade_id[<s:property value="#vs.index+1"/>]" value="" type="checkbox" /><span class="span_text2"><s:property value="type_name"/></span></label>
							</s:iterator>
							  
					  </div> 
					<td>
                   
                    <td valign="top"><span style="color:red;font-size:12px;" id="subject_gradecheck_text"></span></td>
                </tr> --%>
               <%--  <tr>
                	 <td valign="top">适用年级：</td>
               		 <td>
					  <div id="gradecheck" style="display: inline-block;line-height: 16px;">
					   <label><input class="all_grade_id" type="checkbox" /><span class="span_text2">全部年级</span></label>
					  
							<s:iterator value="grade" status="vs">
							   <br />									<!-- [<s:property value="#vs.index"/>] -->
							   <label><input class="grade_id" name="grade_id" value="<s:property value="name"/>" type="checkbox" /><span class="span_text2"><s:property value="name"/></span></label>
							</s:iterator>
							  
					  </div> 
					<td>
					<td valign="top"><span style="color:red;font-size:12px;" id="subject_gradecheck_text"></span></td>
                </tr> --%>
            </tbody></table>
        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 496px; left: 0px; top: 77px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 496px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
  /*   var schoolListJson = '[{"id":"","name":"\u8bf7\u9009\u62e9\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":50,"name":"111","sort":6,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":51,"name":"11112","sort":7,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":64,"name":"\u5c0f\u6258","sort":8,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":94,"name":"455","sort":9,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
   */  
   var schoolListJson ='[{"id":"","name":"\u8bf7\u9009\u62e9\u5b66\u6821"}]';
   schoolListJson = eval('('+schoolListJson+')');
    
    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

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
                }else if(result.status==2){ // 学科无选择
                    $('#save-btn').removeClass('mylinkbtn-load');
                    setTooltop($("#subject_gradecheck_text"),'show',result.info);
                }else {
                    $('#save-btn').removeClass('mylinkbtn-load');
                    setTooltop($("#name + .textbox .textbox-text"),'show',result.info);
                }
            }
        });
    }





    function sc_gr_list(gradeList){
        var html = '';

        if(gradeList.length > 0){
            html += '<label><input class="all_grade_id" type="checkbox" /><span class="span_text2">全部年级</span></label></br>';
            for(var i = 0; i < gradeList.length; i++){
                if (gradeList[i].id < 1) {
                    continue;
                }
                html += '<label>';
                html += '<input class="grade_id" type="checkbox"  name="grade_id['+i+']" value="'+gradeList[i].id+'" class="easyui-validatebox">';
                html += '<span class="span_text2">'+gradeList[i].name+'</span>';
                html += '</label></br>';
            }

            $("#gradecheck").html(html);
        } else {
            $("#gradecheck").html('<span class="span_text2">该学校的年级信息尚未设置，请先去“年级管理”页进行设置！</span>');
        }

    }

    //提示框
    /**
     *
     * @param obj
     * @param type show=>显示  close=>关闭
     * @param text
     */
    function setTooltop(obj,type,text){
        text = text==undefined ? '该输入项为必输项': text;
        if(type == 'show'){
            obj.tooltip({
                position: 'right',
                showEvent:'',
                content: '<span style="color:#000">'+text+'</span>',
                onShow: function(){
                    $(this).tooltip('tip').css({
                        backgroundColor: '#FFFFCC',
                        borderColor: '#CC9933'
                    });
                }
            }).tooltip(type);
        }else{
            obj.tooltip(type);
        }
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
                //刷新数据，重新读取，并清空当前输入的值
                if (record.gradeList != undefined) {
                    sc_gr_list(record.gradeList);
                } else {
                    sc_gr_list([]);
                }
            }
        })

        if(schoolListJson.length > 1){
            $('#school_id').combobox('select',schoolListJson[1]['id']);
        }

        $(document).on('click','.grade_id',function(){
            var checked = true;
            $('.grade_id').each(function(){
                if(! $(this).prop('checked')){
                    checked = false;
                }
            })
            if(checked){
                $('.all_grade_id').prop('checked',true);
            }else{
                $('.all_grade_id').prop('checked',false);
            }
        })

        $(document).on('click','.all_grade_id',function(){
            if($(this).prop('checked')){
                $('.grade_id').prop('checked',true);
            }else{
                $('.grade_id').prop('checked',false);
            }
        });
    })
</script>


<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>

<script type="text/javascript">

$.extend($.fn.validatebox.defaults.rules,{
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item">请选择学校</div><div id="_easyui_combobox_i2_1" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i2_2" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i2_3" class="combobox-item">司南学辅1</div></div></div></body></html>