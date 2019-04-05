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
    .subject-box{
        width:120px;
        float:left;
    }
    .subject-box table{
        background:#E0ECFF;
    }
    .subject-box td{
        background:#eee;
    }
    .right table{
        background:#E0ECFF;
        width:100%;
    }
    .right td{
        background:#fafafa;
        text-align:center;
        padding:8px;
		padding-bottom:0px;
    }
    .right td{
        background:#fafafa;
    }
    .right td .subject-drop {
        border-bottom:0px solid #cccccc;
		margin-bottom:0px;      
    }
    .right td .subject-drop, .right td .teacher-drop{
        display: block;
        height: 30px;
        width:100px;
    }
    .right td .subject-drop.over, .right td .teacher-drop.over{
        background:#FBEC88;
    }
    .item{
        text-align:center;
        border:1px solid #499B33;
        background:#fafafa;
        width:100px;
    }
    .assigned{
        border:1px solid #BC2A4D;
    }
    .subject-drop input{
        width: 80px;
    }  
    .teacher-drop input{
        width: 80px;
		padding-bottom:0px;
		margin-bottom:0px;
    }    
	td.title{
		font-weight:bold;
		font-size:13px;
		font-family:"微软雅黑";
		padding-bottom:8px;

	}
	td.time{
		font-weight:bold;
		font-size:13px;
		font-family:"微软雅黑";

	}
	td.lunch{
		font-weight:bold;
		font-size:13px;
		font-family:"微软雅黑";
		padding-bottom:8px;

	}	
	
</style>
<form id="post-form" style="height:643px; " method="post" data-href="${pageContext.request.contextPath}/curriculaTableAction_editCurriculaTable.action" class="panel-noscroll">
    
        <div class="easyui-layout layout easyui-fluid" border="true" fit="true" style="width: 1188px; height: 643px;">
            <!--1.2 region="west",必须指明宽度-->
            <div class="panel layout-panel layout-panel-west" style="width: 238px; left: 0px; top: 0px;"><div region="west" title="" style="width: 236px; height: 604px;" border="true" class="panel-body panel-body-noheader layout-body panel-noscroll">

                <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 236px; height: 604px;">                
                    <table cellspacing="0" cellpadding="8" border="0">
                        <tbody>
                        <!-- <tr>
                            <td>学校：</td>
                            <td id="school_name">哈尔滨华德幼儿园</td>
                        </tr> -->
                       
                        <tr>
                            <td>年级：</td>
                            <td id="grade_name"><s:property value="curriculaTable.classes.class_name"/></td>
                        </tr>
                        <tr id="class_box">
                            <td>班级：</td>
                            <td id="class_name"><s:property value="curriculaTable.classes.grade.name"/></td>
                        </tr>
                        <!-- <tr>
                            <td align="right"><input name="is_validate" value="true" class="easyui-validatebox validatebox-text" data-options="novalidate:true" type="checkbox"></td>
                            <td>允许老师同时给多个班上课</td>
                        </tr> -->

                        <tr>
                            <td colspan="2"><div id="errorText" style="color:red;"></div></td>
                        </tr>
                       <input id="id" name="id" value="<s:property value="curriculaTable.id"/>" type="hidden"/> 
                    </tbody></table>
                <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
            </div></div>
            
            
            
                     <input id="subject_model" value="<s:property value="#teacherJson"/>">
              		 <input id="teacher_model" value="<s:property value="#subjectJson"/>">
            
            
            
            <!--1.3region="center",这里的宽度和高度都是由周边决定，不用设置-->
            <div class="panel layout-panel layout-panel-center" style="width: 951px; left: 237px; top: 0px;"><div region="center" border="true" title="" class="panel-body panel-body-noheader layout-body" style="width: 949px; height: 604px;">
                <div class="right">            
                    <table id="class-curricula-table" cellspacing="1">
                        <tbody>
                        
                        			
                        					
                             <tr>
                             	<td></td>
		                             <s:if test="2==#week_type_label">
		                             <s:iterator begin="0" end="#dayNum-1" id="w" value="{'星期一','星期二','星期三','星期四','星期五','星期六'}">                       
		   									<td class="title"><s:property value="#w"/></td>        
		                             </s:iterator>     
			                        </s:if>
			                        <s:elseif test="3==#week_type_label">
			                        	 <s:iterator begin="0" end="#dayNum-1" id="w" value="{'星期一','星期二','星期三','星期四','星期五','星期日'}">                       
			   									<td class="title"><s:property value="#w"/></td>  
			                             </s:iterator>  
			                        </s:elseif> 
			                        <s:else>
			                        	 <s:iterator begin="0" end="#dayNum-1" id="w" value="{'星期一','星期二','星期三','星期四','星期五','星期六','星期日'}">                       
			   									<td class="title"><s:property value="#w"/></td>                      
			                             </s:iterator>  
			                        </s:else>                     
                             </tr>                                   
                                                                            
                             <s:iterator begin="1" end="#morning_has_num+#afternoon_has_num" status="vs">
                             	<s:if test="#vs.index==#morning_has_num">
                             		<tr><td class="lunch" colspan="9">中午休息时间</td></tr>
                             	</s:if>
                            	<tr>
                            		<td class="time"><s:property value="#start_end_times[#vs.index]"/></td>
                          	 	  	 	<s:iterator begin="1" end="#dayNum" status="v">
                          	 	  	 		 <td class="drop">
			                          	  	 	    <span class="subject-drop">
			                                            <input id="subjectinput" class="subject-input combobox-f combo-f textbox-f" value="<s:property value="#subject_names[#vs.index][#v.index]"/>" data-options="novalidate:true" style="display: none;" textboxname="subject_names" comboname="subject_names" type="text">
			                                        </span>
			                                        <span class="teacher-drop">
                                        			    <input id="<s:property value="#teacherinputs[#vs.index][#v.index]"/>" value="<s:property value="#teacher_names[#vs.index][#v.index]"/>" validtype="checkDatas" class="teacher-input combobox-f combo-f textbox-f" data-teacherids="" data-options="novalidate:true" style="display: none;" textboxname="teacher_ids" comboname="teacher_ids" type="text">
                                      				</span>
                                      				<input id="teacher_names" name="teacher_names" value="" type="hidden"/>
			                                        <span>
			                                            <input name="ids" value="<s:property value="#ids[#vs.index][#v.index]"/>" type="hidden">
			                                        </span>
		                                       </td>
   									  	 </s:iterator>
   								</tr>
                           	 </s:iterator>
                           	 
                                                                            
                                                                            
                            <%-- <s:iterator begin="1" end="#morning_has_num" status="vs">
                            	<tr>
                            		<td class="time"><s:property value="#start_end_times[#vs.index]"/></td>
                          	 	  	 	<s:iterator begin="1" end="#dayNum">
                          	 	  	 		 <td class="drop">
			                          	  	 	    <span class="subject-drop">
			                                            <input id="subjectinput8766" class="subject-input combobox-f combo-f textbox-f" value="0" data-options="novalidate:true" style="display: none;" textboxname="subject_ids[]" comboname="subject_ids[]" type="text">
			                                        </span>
			                                        <span class="teacher-drop">
                                        			    <input id="techeriput8776" validtype="checkDatas" class="teacher-input combobox-f combo-f textbox-f" value="" data-teacherids="[]" data-options="novalidate:true" style="display: none;" textboxname="teacher_ids[8776][]" comboname="teacher_ids[8776][]" type="text">
                                      				</span>
			                                        <span>
			                                            <input name="ids[]" value="8766" type="hidden">
			                                        </span>
		                                       </td>
   									  	 </s:iterator>
   								</tr>
                            </s:iterator>
                            
                            <tr><td class="lunch" colspan="9">中午休息时间</td></tr>
                            
                            <s:iterator begin="1" end="#afternoon_has_num" status="vs">
                            <s:property value="#vs.index+#morning_has_num"/>
                            	<tr>
                            	<td class="time"><s:property value="#start_end_times[#vs.index+#morning_has_num]"/></td>
	                            	<s:iterator begin="1" end="#dayNum">
	                                		 <td class="drop">
			                          	  	 	  <span class="subject-drop">
			                                            <input id="subjectinput" class="subject-input combobox-f combo-f textbox-f" value="0" data-options="novalidate:true" style="display: none;" textboxname="subject_names" comboname="subject_names" type="text">
			                                        </span>
			                                        <span class="teacher-drop">
			                                            <input id="techeriput" class="teacher-input combobox-f combo-f textbox-f" value="0"  data-options="novalidate:true" style="display: none;" textboxname="teacher_names" comboname="teacher_names" type="text">
			                                        </span>
			                                        <span>
			                                            <input name="ids" value="8766" type="hidden">
			                                        </span>
		                                      </td>
	                           	    </s:iterator>
                           	    </tr>
                            </s:iterator> --%> 
                            
                                              
                          
                                            </tbody></table>            
                </div>
            </div></div>
            <div class="panel layout-panel layout-panel-south" style="width: 1188px; left: 0px; top: 606px;"><div region="south" border="false" style="background-color: rgb(224, 236, 255); width: 1188px; height: 37px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
                 <!-- 保存按钮 -->
                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:3px; float:right;">
                    <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveClassCurricula()" group="">保存</a>
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
                </div>
            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>   
    
</form>
<script type="text/javascript">
loadWindow('show');

/* 转换PHPJSON为JS JSON格式 */
var subjectJson = '[{"id":0,"name":"\u9009\u62e9\u79d1\u76ee"},{"id":5,"name":"\u793e\u4f1a","teacherList":[{"id":"1","text":"\u5510\u56fd\u8f89","iconCls":"icon-space"},{"id":"5","text":"\u66fe\u6587\u5c1d","iconCls":"icon-space"},{"id":"3","text":"\u9648\u9707","iconCls":"icon-space"},{"id":"21","text":"\u9648\u5b50\u6e90","iconCls":"icon-space"},{"id":"22","text":"\u4f0d\u6587\u535a","iconCls":"icon-space"},{"id":"6","text":"\u674e\u5fb7\u80dc","iconCls":"icon-space"},{"id":"23","text":"\u9a6c\u71d5\u7ea2","iconCls":"icon-space"},{"id":"24","text":"\u5510\u534e\u6797","iconCls":"icon-space"},{"id":"19","text":"\u5510\u52c7\u8f89","iconCls":"icon-space"},{"id":"2","text":"\u5218\u4e9a\u771f","iconCls":"icon-space"},{"id":"28","text":"\u738b\u5d07\u5f66","iconCls":"icon-space"},{"id":"33","text":"\u9ec4\u6d9b","iconCls":"icon-space"},{"id":"35","text":"\u7f57\u4e66\u8bb0","iconCls":"icon-space"},{"id":"36","text":"\u5510\u4e50\u4e50","iconCls":"icon-space"},{"id":"37","text":"\u9a6c\u5c71\u65b0","iconCls":"icon-space"},{"id":"43","text":"\u674e\u5c0f\u5170","iconCls":"icon-space"}]},{"id":6,"name":"\u79d1\u5b66","teacherList":[{"id":"1","text":"\u5510\u56fd\u8f89","iconCls":"icon-space"},{"id":"5","text":"\u66fe\u6587\u5c1d","iconCls":"icon-space"},{"id":"3","text":"\u9648\u9707","iconCls":"icon-space"},{"id":"21","text":"\u9648\u5b50\u6e90","iconCls":"icon-space"},{"id":"6","text":"\u674e\u5fb7\u80dc","iconCls":"icon-space"},{"id":"23","text":"\u9a6c\u71d5\u7ea2","iconCls":"icon-space"},{"id":"4","text":"\u9f99\u90b5\u534e","iconCls":"icon-space"},{"id":"24","text":"\u5510\u534e\u6797","iconCls":"icon-space"},{"id":"19","text":"\u5510\u52c7\u8f89","iconCls":"icon-space"},{"id":"2","text":"\u5218\u4e9a\u771f","iconCls":"icon-space"},{"id":"28","text":"\u738b\u5d07\u5f66","iconCls":"icon-space"},{"id":"33","text":"\u9ec4\u6d9b","iconCls":"icon-space"},{"id":"35","text":"\u7f57\u4e66\u8bb0","iconCls":"icon-space"},{"id":"36","text":"\u5510\u4e50\u4e50","iconCls":"icon-space"},{"id":"37","text":"\u9a6c\u5c71\u65b0","iconCls":"icon-space"},{"id":"43","text":"\u674e\u5c0f\u5170","iconCls":"icon-space"}]},{"id":7,"name":"\u7f8e\u672f","teacherList":[{"id":"1","text":"\u5510\u56fd\u8f89","iconCls":"icon-space"},{"id":"5","text":"\u66fe\u6587\u5c1d","iconCls":"icon-space"},{"id":"3","text":"\u9648\u9707","iconCls":"icon-space"},{"id":"21","text":"\u9648\u5b50\u6e90","iconCls":"icon-space"},{"id":"22","text":"\u4f0d\u6587\u535a","iconCls":"icon-space"},{"id":"6","text":"\u674e\u5fb7\u80dc","iconCls":"icon-space"},{"id":"23","text":"\u9a6c\u71d5\u7ea2","iconCls":"icon-space"},{"id":"4","text":"\u9f99\u90b5\u534e","iconCls":"icon-space"},{"id":"24","text":"\u5510\u534e\u6797","iconCls":"icon-space"},{"id":"19","text":"\u5510\u52c7\u8f89","iconCls":"icon-space"},{"id":"28","text":"\u738b\u5d07\u5f66","iconCls":"icon-space"},{"id":"33","text":"\u9ec4\u6d9b","iconCls":"icon-space"},{"id":"36","text":"\u5510\u4e50\u4e50","iconCls":"icon-space"},{"id":"37","text":"\u9a6c\u5c71\u65b0","iconCls":"icon-space"},{"id":"43","text":"\u674e\u5c0f\u5170","iconCls":"icon-space"}]},{"id":114,"name":"","teacherList":[]},{"id":122,"name":"\u53d1\u7684","teacherList":[]}]';
subjectJson = eval('('+subjectJson+')');

var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","termLabel":"2016\u5b66\u5e74 \u6625\u5b66\u671f","validTime":"2017-02-01 \u81f3 2017-08-31","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"},{"id":55,"name":"81112(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]},{"id":50,"name":"111","sort":6,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":51,"name":"11112","sort":7,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":64,"name":"\u5c0f\u6258","sort":8,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":93,"name":"\u5218\u73ed","sort":9,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":94,"name":"455","sort":10,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","termLabel":"2016\u5b66\u5e74 \u6625\u5b66\u671f","validTime":"2017-02-01 \u81f3 2017-08-31","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","termLabel":"2016\u5b66\u5e74 \u6625\u5b66\u671f","validTime":"2017-02-01 \u81f3 2017-08-31","gradeList":[{"id":"","name":"\u5168\u90e8\u5e74\u7ea7"},{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"},{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"456585684","sort":2,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":"","name":"\u5168\u90e8\u73ed\u7ea7"}]}]}]';
schoolJson = eval('('+schoolJson+')');

var teacherJson = $('#subject_model').val();
teacherJson = eval('('+teacherJson+')');

var subjectJson = $('#teacher_model').val();
subjectJson = eval('('+subjectJson+')');

var url = $('#post-form').attr('data-href'); // 保存班级课程表地址
var id = $('#id');
/* 表单校验信息 */
$.extend($.fn.validatebox.defaults.rules, {
    checkDatas: {
        validator: function(value, params){

            var subjectValue = $(this).closest('.drop').find('.subject-input').val();

            var teacherValue = $(this).closest('.drop').find('.teacher-input').combotree('getValues');
            if (subjectValue > 0 && teacherValue.length == 0) {
                return false;
            } else {
                return true;
            }
        },
        message: '请选择任课老师'
    }
});

var lastTipTitle = '';
//提示框
/**
 *
 * @param obj
 * @param type show=>显示  close=>关闭
 * @param text
 */
function setTooltop(obj){
    obj.tooltip({
        position: 'right',
        content: lastTipTitle,
        showEvent:'',
        hideEvent: '',
        onShow: function(){
            $(this).tooltip("tip").css({color:"#000",borderColor:"#CC9933",backgroundColor:"#FFFFCC"});
            $(this).attr('title', lastTipTitle);
        },
        onHide:function(){
            $(this).tooltip("destroy");
        }
    });
}

/* 保存班级课程班 */
function saveClassCurricula() {
    if ($('#save-btn').hasClass('mylinkbtn-load')) {
        return false;
    }
        
    $('#save-btn').addClass('mylinkbtn-load');

    $('#post-form').form('submit',{
        url: url,
        onSubmit: function(){
            var datas = $('.teacher-input');

            var newFlag = true;

            $.each(datas, function (k, v) {
                var teacherValue = $(v).closest('.drop').find('.teacher-input').combotree('getText');
                var subjectValue = $(v).closest('.drop').find('.subject-input').combobox('getText');

                if (subjectValue != '选择科目' && teacherValue.length < 1) {
                    lastTipTitle = '请选择任课老师';
                    var tempId = $(v).attr('id');
                    setTooltop($('#' + tempId + ' + .textbox .textbox-text'));
                    $('#' + tempId + ' + .textbox .textbox-text').tooltip('show');
                    $('#' + tempId + ' + .textbox .textbox-text').addClass('validatebox-invalid').closest('span').addClass('textbox-invalid');
                    $('#save-btn').removeClass('mylinkbtn-load');
                    newFlag = false;
                    return false;
                }
            });

            if (newFlag == false) {
                $('#save-btn').removeClass('mylinkbtn-load');
                return false;
            }

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
                //window.parent.showMessage('操作失败', result.errMeg);
                $("#errorText").html(result.errMeg);
            } else {
                parent.window.closeWinIsReloadData = 1;
                parent.$('#openWindow').window('close');
            }
        }
    });
}




/* var teacher_data;

 $(function(){
	
 	$('#teacher_model').combobox({
        url:'${pageContext.request.contextPath}/teacherAction_findAllTeacher.action',
        valueField:'id',
        textField:'text',
        panelHeight:'auto',
        editable: false,
     
        onLoadSuccess: function (record) {
           teacher_data = record;
        } 
    }) 
	
}); 
 
 
 
 
var subject_data;

 $(function(){
	
 	$('#subject_model').combobox({
 		url:'${pageContext.request.contextPath}/subjectAction_findAllSubject.action',
        //data: subjectJson,
        editable:false,
        valueField:'id',
        textField:'name',
        panelHeight: 'auto',
     
        onLoadSuccess: function (record) {
        	subject_data = record;
        } 
    }) 
	
}); */
    
    


$(function(){
    /* 循环声明老师下拉框 */
    $.each( $('.teacher-input'), function(k, v){
        var tempId = '#' + $(v).attr('id');
		
        $(tempId).combobox({
            //data: [{id: '选择老师', 'text': '选择老师', iconCls: 'icon-space', selected: true}],
            //url:'${pageContext.request.contextPath}/teacherAction_findAllTeacherByStatus.action',
            data : teacherJson,
            valueField:'id',
            textField:'text',
            panelHeight:'auto',
            editable: false,
            
            onSelect:function(record){
            	//url:'${pageContext.request.contextPath}/classesAction_findAllClass.action',
                $('#class_id').combobox(record.text);
            	
                var text = record.text;
            	//$(this).parent().next().attr("value",text);
            	$(this).parent().next().val(text);
            }
            
            //readonly: true,
            //multiple:true,
            /* formatter: function (row) {
                var opts = $(this).combobox('options');
                if (row.id == 0) {
                    return row[opts.textField]
                }
                
                return '<input type="checkbox" class="combobox-checkbox">' + row[opts.textField]
            },
            onLoadSuccess: function () {
                var opts = $(this).combobox('options');
                var target = this;
                var values = $(target).combobox('getValues');
                $.map(values, function (value) {
                    var el = opts.finder.getEl(target, value);
                    el.find('input.combobox-checkbox')._propAttr('checked', true);
                })
            },
            onSelect: function (row) {
                //console.log(row);
                var opts = $(this).combobox('options');
                var el = opts.finder.getEl(this, row[opts.valueField]);
                el.find('input.combobox-checkbox')._propAttr('checked', true);

                var tempValues = $(this).combobox('getValues');

                if (tempValues.length >= 4) {
                    alert('每节课最多只能三个老师同时上课');
                    $(this).combobox('unselect', row.id);
                }

            },
            onUnselect: function (row) {
                var opts = $(this).combobox('options');
                var el = opts.finder.getEl(this, row[opts.valueField]);
                el.find('input.combobox-checkbox')._propAttr('checked', false);
            } */
        });
    });

    
    
    /* $.each( $('.subject-input'), function(k, v){
        if ($(v).val() > 0) {
             for (var i=0; i < subjectJson.length; i ++) {
                if (subjectJson[i].id == $(v).val()) {
                    var tempTehacherInputId = '#' + $(v).closest('.drop').find('.teacher-input').attr('id');

                    $(tempTehacherInputId).combo('readonly', false);

                    var tempValues = $(v).closest('.drop').find('.teacher-input').attr('data-teacherids');

                    tempValues = eval('('+tempValues+')');

                    if (tempValues.length > 0) {
                        $(tempTehacherInputId).combobox('setValues', tempValues);

                        $(tempTehacherInputId).attr('data-teacherids', '');
                    }
                    var url='${pageContext.request.contextPath}/teacherAction_findAllTeacher.action';
                    $(tempTehacherInputId).combobox('loadData', url);
                    //$(tempTehacherInputId).combobox('loadData', subjectJson[i].teacherList);
                    break;
                }
            } 
        }
    }); */
    
    

    /* 科目下拉框 */
    $('.subject-input').combobox({
    	//url:'${pageContext.request.contextPath}/subjectAction_findAllSubject.action',
    	data: subjectJson,
        editable:false,
        valueField:'id',
        textField:'name',
        panelHeight: 'auto',
        onSelect: function(record) {
            /* var tempId = $(this).closest('.drop').find('.teacher-input').attr('id');
            $('#' + tempId + ' + .textbox .textbox-text').tooltip('hide');
            $('#' + tempId + ' + .textbox .textbox-text').removeClass('validatebox-invalid').closest('span').removeClass('textbox-invalid');

            if (record.id > 0 && record.teacherList != undefined && record.teacherList.length > 0) {
                $('#' + tempId).combo('readonly', false);
                $('#' + tempId).combobox('clear');
                var url='${pageContext.request.contextPath}/teacherAction_findAllTeacher.action';
                alert(record.teacherList);
                $('#' + tempId).combobox('loadData', url);
                //$('#' + tempId).combobox('loadData', record.teacherList);

            } else {
                $('#' + tempId).combo('readonly', true);
                $('#' + tempId).combobox('loadData',  [{id: 0, 'text': '选择老师', iconCls: 'icon-space'}]);
                $('#' + tempId).combobox('clear');
                $('#' + tempId).combobox('setValue', 0);
            } */
        }
    });

    //设置学校，年级，班级信息
    var schoolId = 1;
    var classId = 55;
     for(var i=0; i<schoolJson.length; i++){
        if(! schoolJson[i]['gradeList']){
            continue;
        }
        var gradeList = schoolJson[i]['gradeList'];
        /* if(schoolId == schoolJson[i]['id']){
            $("#school_name").html(schoolJson[i]['name']);
            $("#term_label").html(schoolJson[i]['termLabel']);
            $("#valid_time").html(schoolJson[i]['validTime']);
        } */
        /* for(var j=0; j<gradeList.length; j++){
            if(! gradeList[j]['classList']){
                continue;
            }
            var classList = gradeList[j]['classList'];
            for(var y=0; y<classList.length; y++){
                if(classId == classList[y]['id']){
                    $("#grade_name").html(gradeList[j]['name']);
                    $("#class_name").html(classList[y]['name']);
                }
            }
        } */
    }

    loadWindow('close');
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i3_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i4_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i5_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i6_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i7_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i8_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i9_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i10_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i11_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i12_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i13_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i14_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i15_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i16_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i17_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i18_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i19_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i20_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i21_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i22_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i23_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i24_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i25_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i26_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i27_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i28_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i29_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i30_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i31_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i32_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i33_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i34_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i35_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i36_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i37_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i38_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i39_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i40_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i41_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i42_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i43_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i44_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i45_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i46_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i47_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i48_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i49_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i50_0" class="combobox-item combobox-item-selected">选择老师</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i51_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i51_1" class="combobox-item">社会</div><div id="_easyui_combobox_i51_2" class="combobox-item">科学</div><div id="_easyui_combobox_i51_3" class="combobox-item">美术</div><div id="_easyui_combobox_i51_4" class="combobox-item"></div><div id="_easyui_combobox_i51_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i52_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i52_1" class="combobox-item">社会</div><div id="_easyui_combobox_i52_2" class="combobox-item">科学</div><div id="_easyui_combobox_i52_3" class="combobox-item">美术</div><div id="_easyui_combobox_i52_4" class="combobox-item"></div><div id="_easyui_combobox_i52_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i53_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i53_1" class="combobox-item">社会</div><div id="_easyui_combobox_i53_2" class="combobox-item">科学</div><div id="_easyui_combobox_i53_3" class="combobox-item">美术</div><div id="_easyui_combobox_i53_4" class="combobox-item"></div><div id="_easyui_combobox_i53_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i54_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i54_1" class="combobox-item">社会</div><div id="_easyui_combobox_i54_2" class="combobox-item">科学</div><div id="_easyui_combobox_i54_3" class="combobox-item">美术</div><div id="_easyui_combobox_i54_4" class="combobox-item"></div><div id="_easyui_combobox_i54_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i55_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i55_1" class="combobox-item">社会</div><div id="_easyui_combobox_i55_2" class="combobox-item">科学</div><div id="_easyui_combobox_i55_3" class="combobox-item">美术</div><div id="_easyui_combobox_i55_4" class="combobox-item"></div><div id="_easyui_combobox_i55_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i56_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i56_1" class="combobox-item">社会</div><div id="_easyui_combobox_i56_2" class="combobox-item">科学</div><div id="_easyui_combobox_i56_3" class="combobox-item">美术</div><div id="_easyui_combobox_i56_4" class="combobox-item"></div><div id="_easyui_combobox_i56_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i57_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i57_1" class="combobox-item">社会</div><div id="_easyui_combobox_i57_2" class="combobox-item">科学</div><div id="_easyui_combobox_i57_3" class="combobox-item">美术</div><div id="_easyui_combobox_i57_4" class="combobox-item"></div><div id="_easyui_combobox_i57_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i58_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i58_1" class="combobox-item">社会</div><div id="_easyui_combobox_i58_2" class="combobox-item">科学</div><div id="_easyui_combobox_i58_3" class="combobox-item">美术</div><div id="_easyui_combobox_i58_4" class="combobox-item"></div><div id="_easyui_combobox_i58_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i59_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i59_1" class="combobox-item">社会</div><div id="_easyui_combobox_i59_2" class="combobox-item">科学</div><div id="_easyui_combobox_i59_3" class="combobox-item">美术</div><div id="_easyui_combobox_i59_4" class="combobox-item"></div><div id="_easyui_combobox_i59_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i60_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i60_1" class="combobox-item">社会</div><div id="_easyui_combobox_i60_2" class="combobox-item">科学</div><div id="_easyui_combobox_i60_3" class="combobox-item">美术</div><div id="_easyui_combobox_i60_4" class="combobox-item"></div><div id="_easyui_combobox_i60_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i61_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i61_1" class="combobox-item">社会</div><div id="_easyui_combobox_i61_2" class="combobox-item">科学</div><div id="_easyui_combobox_i61_3" class="combobox-item">美术</div><div id="_easyui_combobox_i61_4" class="combobox-item"></div><div id="_easyui_combobox_i61_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i62_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i62_1" class="combobox-item">社会</div><div id="_easyui_combobox_i62_2" class="combobox-item">科学</div><div id="_easyui_combobox_i62_3" class="combobox-item">美术</div><div id="_easyui_combobox_i62_4" class="combobox-item"></div><div id="_easyui_combobox_i62_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i63_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i63_1" class="combobox-item">社会</div><div id="_easyui_combobox_i63_2" class="combobox-item">科学</div><div id="_easyui_combobox_i63_3" class="combobox-item">美术</div><div id="_easyui_combobox_i63_4" class="combobox-item"></div><div id="_easyui_combobox_i63_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i64_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i64_1" class="combobox-item">社会</div><div id="_easyui_combobox_i64_2" class="combobox-item">科学</div><div id="_easyui_combobox_i64_3" class="combobox-item">美术</div><div id="_easyui_combobox_i64_4" class="combobox-item"></div><div id="_easyui_combobox_i64_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i65_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i65_1" class="combobox-item">社会</div><div id="_easyui_combobox_i65_2" class="combobox-item">科学</div><div id="_easyui_combobox_i65_3" class="combobox-item">美术</div><div id="_easyui_combobox_i65_4" class="combobox-item"></div><div id="_easyui_combobox_i65_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i66_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i66_1" class="combobox-item">社会</div><div id="_easyui_combobox_i66_2" class="combobox-item">科学</div><div id="_easyui_combobox_i66_3" class="combobox-item">美术</div><div id="_easyui_combobox_i66_4" class="combobox-item"></div><div id="_easyui_combobox_i66_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i67_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i67_1" class="combobox-item">社会</div><div id="_easyui_combobox_i67_2" class="combobox-item">科学</div><div id="_easyui_combobox_i67_3" class="combobox-item">美术</div><div id="_easyui_combobox_i67_4" class="combobox-item"></div><div id="_easyui_combobox_i67_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i68_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i68_1" class="combobox-item">社会</div><div id="_easyui_combobox_i68_2" class="combobox-item">科学</div><div id="_easyui_combobox_i68_3" class="combobox-item">美术</div><div id="_easyui_combobox_i68_4" class="combobox-item"></div><div id="_easyui_combobox_i68_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i69_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i69_1" class="combobox-item">社会</div><div id="_easyui_combobox_i69_2" class="combobox-item">科学</div><div id="_easyui_combobox_i69_3" class="combobox-item">美术</div><div id="_easyui_combobox_i69_4" class="combobox-item"></div><div id="_easyui_combobox_i69_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i70_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i70_1" class="combobox-item">社会</div><div id="_easyui_combobox_i70_2" class="combobox-item">科学</div><div id="_easyui_combobox_i70_3" class="combobox-item">美术</div><div id="_easyui_combobox_i70_4" class="combobox-item"></div><div id="_easyui_combobox_i70_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i71_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i71_1" class="combobox-item">社会</div><div id="_easyui_combobox_i71_2" class="combobox-item">科学</div><div id="_easyui_combobox_i71_3" class="combobox-item">美术</div><div id="_easyui_combobox_i71_4" class="combobox-item"></div><div id="_easyui_combobox_i71_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i72_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i72_1" class="combobox-item">社会</div><div id="_easyui_combobox_i72_2" class="combobox-item">科学</div><div id="_easyui_combobox_i72_3" class="combobox-item">美术</div><div id="_easyui_combobox_i72_4" class="combobox-item"></div><div id="_easyui_combobox_i72_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i73_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i73_1" class="combobox-item">社会</div><div id="_easyui_combobox_i73_2" class="combobox-item">科学</div><div id="_easyui_combobox_i73_3" class="combobox-item">美术</div><div id="_easyui_combobox_i73_4" class="combobox-item"></div><div id="_easyui_combobox_i73_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i74_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i74_1" class="combobox-item">社会</div><div id="_easyui_combobox_i74_2" class="combobox-item">科学</div><div id="_easyui_combobox_i74_3" class="combobox-item">美术</div><div id="_easyui_combobox_i74_4" class="combobox-item"></div><div id="_easyui_combobox_i74_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i75_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i75_1" class="combobox-item">社会</div><div id="_easyui_combobox_i75_2" class="combobox-item">科学</div><div id="_easyui_combobox_i75_3" class="combobox-item">美术</div><div id="_easyui_combobox_i75_4" class="combobox-item"></div><div id="_easyui_combobox_i75_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i76_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i76_1" class="combobox-item">社会</div><div id="_easyui_combobox_i76_2" class="combobox-item">科学</div><div id="_easyui_combobox_i76_3" class="combobox-item">美术</div><div id="_easyui_combobox_i76_4" class="combobox-item"></div><div id="_easyui_combobox_i76_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i77_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i77_1" class="combobox-item">社会</div><div id="_easyui_combobox_i77_2" class="combobox-item">科学</div><div id="_easyui_combobox_i77_3" class="combobox-item">美术</div><div id="_easyui_combobox_i77_4" class="combobox-item"></div><div id="_easyui_combobox_i77_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i78_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i78_1" class="combobox-item">社会</div><div id="_easyui_combobox_i78_2" class="combobox-item">科学</div><div id="_easyui_combobox_i78_3" class="combobox-item">美术</div><div id="_easyui_combobox_i78_4" class="combobox-item"></div><div id="_easyui_combobox_i78_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i79_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i79_1" class="combobox-item">社会</div><div id="_easyui_combobox_i79_2" class="combobox-item">科学</div><div id="_easyui_combobox_i79_3" class="combobox-item">美术</div><div id="_easyui_combobox_i79_4" class="combobox-item"></div><div id="_easyui_combobox_i79_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i80_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i80_1" class="combobox-item">社会</div><div id="_easyui_combobox_i80_2" class="combobox-item">科学</div><div id="_easyui_combobox_i80_3" class="combobox-item">美术</div><div id="_easyui_combobox_i80_4" class="combobox-item"></div><div id="_easyui_combobox_i80_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i81_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i81_1" class="combobox-item">社会</div><div id="_easyui_combobox_i81_2" class="combobox-item">科学</div><div id="_easyui_combobox_i81_3" class="combobox-item">美术</div><div id="_easyui_combobox_i81_4" class="combobox-item"></div><div id="_easyui_combobox_i81_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i82_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i82_1" class="combobox-item">社会</div><div id="_easyui_combobox_i82_2" class="combobox-item">科学</div><div id="_easyui_combobox_i82_3" class="combobox-item">美术</div><div id="_easyui_combobox_i82_4" class="combobox-item"></div><div id="_easyui_combobox_i82_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i83_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i83_1" class="combobox-item">社会</div><div id="_easyui_combobox_i83_2" class="combobox-item">科学</div><div id="_easyui_combobox_i83_3" class="combobox-item">美术</div><div id="_easyui_combobox_i83_4" class="combobox-item"></div><div id="_easyui_combobox_i83_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i84_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i84_1" class="combobox-item">社会</div><div id="_easyui_combobox_i84_2" class="combobox-item">科学</div><div id="_easyui_combobox_i84_3" class="combobox-item">美术</div><div id="_easyui_combobox_i84_4" class="combobox-item"></div><div id="_easyui_combobox_i84_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i85_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i85_1" class="combobox-item">社会</div><div id="_easyui_combobox_i85_2" class="combobox-item">科学</div><div id="_easyui_combobox_i85_3" class="combobox-item">美术</div><div id="_easyui_combobox_i85_4" class="combobox-item"></div><div id="_easyui_combobox_i85_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i86_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i86_1" class="combobox-item">社会</div><div id="_easyui_combobox_i86_2" class="combobox-item">科学</div><div id="_easyui_combobox_i86_3" class="combobox-item">美术</div><div id="_easyui_combobox_i86_4" class="combobox-item"></div><div id="_easyui_combobox_i86_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i87_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i87_1" class="combobox-item">社会</div><div id="_easyui_combobox_i87_2" class="combobox-item">科学</div><div id="_easyui_combobox_i87_3" class="combobox-item">美术</div><div id="_easyui_combobox_i87_4" class="combobox-item"></div><div id="_easyui_combobox_i87_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i88_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i88_1" class="combobox-item">社会</div><div id="_easyui_combobox_i88_2" class="combobox-item">科学</div><div id="_easyui_combobox_i88_3" class="combobox-item">美术</div><div id="_easyui_combobox_i88_4" class="combobox-item"></div><div id="_easyui_combobox_i88_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i89_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i89_1" class="combobox-item">社会</div><div id="_easyui_combobox_i89_2" class="combobox-item">科学</div><div id="_easyui_combobox_i89_3" class="combobox-item">美术</div><div id="_easyui_combobox_i89_4" class="combobox-item"></div><div id="_easyui_combobox_i89_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i90_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i90_1" class="combobox-item">社会</div><div id="_easyui_combobox_i90_2" class="combobox-item">科学</div><div id="_easyui_combobox_i90_3" class="combobox-item">美术</div><div id="_easyui_combobox_i90_4" class="combobox-item"></div><div id="_easyui_combobox_i90_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i91_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i91_1" class="combobox-item">社会</div><div id="_easyui_combobox_i91_2" class="combobox-item">科学</div><div id="_easyui_combobox_i91_3" class="combobox-item">美术</div><div id="_easyui_combobox_i91_4" class="combobox-item"></div><div id="_easyui_combobox_i91_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i92_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i92_1" class="combobox-item">社会</div><div id="_easyui_combobox_i92_2" class="combobox-item">科学</div><div id="_easyui_combobox_i92_3" class="combobox-item">美术</div><div id="_easyui_combobox_i92_4" class="combobox-item"></div><div id="_easyui_combobox_i92_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i93_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i93_1" class="combobox-item">社会</div><div id="_easyui_combobox_i93_2" class="combobox-item">科学</div><div id="_easyui_combobox_i93_3" class="combobox-item">美术</div><div id="_easyui_combobox_i93_4" class="combobox-item"></div><div id="_easyui_combobox_i93_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i94_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i94_1" class="combobox-item">社会</div><div id="_easyui_combobox_i94_2" class="combobox-item">科学</div><div id="_easyui_combobox_i94_3" class="combobox-item">美术</div><div id="_easyui_combobox_i94_4" class="combobox-item"></div><div id="_easyui_combobox_i94_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i95_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i95_1" class="combobox-item">社会</div><div id="_easyui_combobox_i95_2" class="combobox-item">科学</div><div id="_easyui_combobox_i95_3" class="combobox-item">美术</div><div id="_easyui_combobox_i95_4" class="combobox-item"></div><div id="_easyui_combobox_i95_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i96_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i96_1" class="combobox-item">社会</div><div id="_easyui_combobox_i96_2" class="combobox-item">科学</div><div id="_easyui_combobox_i96_3" class="combobox-item">美术</div><div id="_easyui_combobox_i96_4" class="combobox-item"></div><div id="_easyui_combobox_i96_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i97_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i97_1" class="combobox-item">社会</div><div id="_easyui_combobox_i97_2" class="combobox-item">科学</div><div id="_easyui_combobox_i97_3" class="combobox-item">美术</div><div id="_easyui_combobox_i97_4" class="combobox-item"></div><div id="_easyui_combobox_i97_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i98_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i98_1" class="combobox-item">社会</div><div id="_easyui_combobox_i98_2" class="combobox-item">科学</div><div id="_easyui_combobox_i98_3" class="combobox-item">美术</div><div id="_easyui_combobox_i98_4" class="combobox-item"></div><div id="_easyui_combobox_i98_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i99_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i99_1" class="combobox-item">社会</div><div id="_easyui_combobox_i99_2" class="combobox-item">科学</div><div id="_easyui_combobox_i99_3" class="combobox-item">美术</div><div id="_easyui_combobox_i99_4" class="combobox-item"></div><div id="_easyui_combobox_i99_5" class="combobox-item">发的</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i100_0" class="combobox-item combobox-item-selected">选择科目</div><div id="_easyui_combobox_i100_1" class="combobox-item">社会</div><div id="_easyui_combobox_i100_2" class="combobox-item">科学</div><div id="_easyui_combobox_i100_3" class="combobox-item">美术</div><div id="_easyui_combobox_i100_4" class="combobox-item"></div><div id="_easyui_combobox_i100_5" class="combobox-item">发的</div></div></div></body></html>