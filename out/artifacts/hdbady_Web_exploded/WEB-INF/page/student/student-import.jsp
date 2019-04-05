<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %><!DOCTYPE html>
<html lang="en-US">
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
  <title>Dear宝贝-幼教云管理平台</title> 
  <link rel="stylesheet" type="text/css" href="js/easyui.css" /> 
  <link rel="stylesheet" type="text/css" href="js/icon.css" /> 
  <script type="text/javascript" src="js/jquery_002.js"></script> 
  <script type="text/javascript" src="js/jquery.js"></script> 
  <script type="text/javascript" src="js/common.js"></script> 
  <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script> 
  <link rel="stylesheet" href="js/jquery.css" /> 
  <script type="text/javascript" src="js/jquery_003.js"></script> 
 </head> 
 <body style="padding: 0;margin: 0"> 
  <script type="text/javascript">
    /*loadWindow();*/
</script> 
  <div class="tutorial-content" style="display: none"> 
  </div> 
  <form id="fm" style="height:588px; " method="post" data-href="${pageContext.request.contextPath}/homeWorkAction_.json" enctype="multipart/form-data" class="panel-noscroll"> 
   <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 1366px; height: 588px;"> 
    <div class="panel layout-panel layout-panel-north" style="width: 1366px; left: 0px; top: 0px;">
     <div region="north" border="true" style="overflow: auto; padding: 0px 8px 8px; width: 1348px; height: 508px;" title="" class="panel-body panel-body-noheader layout-body"> 
      <table cellspacing="0" cellpadding="8" border="0"> 
       <tbody>
        <tr> 
         <%-- <td style="line-height:30px;">导入至：<input id="school_id" validtype="validateSchoolId" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" style="width: 150px; display: none;" data-options="novalidate:true" textboxname="school_id" comboname="school_id" /><span class="textbox combo" style="width: 148px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 122px;" value="Dear宝贝示范幼儿园" type="text" /><input class="textbox-value" name="school_id" value="1" type="hidden" /></span> &nbsp;&nbsp;<span id="schoolLastText">该校当前学年：<font color="blue">2016学年（2016年9月 - 2017年7月18号）</font>&nbsp;&nbsp;<span style="color:#555555; font-weight:bold;">183天后自动升级</span>&nbsp;&nbsp;</span><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="grade_id" validtype="validateGradeId" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" style="width: 150px; display: none;" data-options="panelHeight:'auto',novalidate:true" textboxname="grade_id" comboname="grade_id" /><span class="textbox combo" style="width: 148px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 122px;" value="请选择年级" type="text" /><input class="textbox-value" name="grade_id" value="请选择年级" type="hidden" /></span> &nbsp;&nbsp;<span id="gradeLastText"></span><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="class_id" validtype="validateClassId" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" style="width: 150px; display: none;" data-options="panelHeight:'auto',novalidate:true" textboxname="class_id" comboname="class_id" /><span class="textbox combo" style="width: 148px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 122px;" value="请选择班级" type="text" /><input class="textbox-value" name="class_id" value="请选择班级" type="hidden" /></span> &nbsp;&nbsp;文件来源：<input id="filebox" class="easyui-filebox filebox-f textbox-f" data-options="prompt:'请选择excel文件'" buttontext="选择文件" style="display: none;" textboxname="file" /><span class="textbox filebox" style="width: 145px; height: 20px;"><a href="javascript:void(0)" class="textbox-button textbox-button-right l-btn l-btn-small" group="" id="" style="height: 20px; right: 0px;"><span class="l-btn-left" style="margin-top: -2px;"><span class="l-btn-text">选择文件</span></span><label class="filebox-label" for="filebox_file_id_2"></label></a><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" readonly="readonly" placeholder="请选择excel文件" style="margin-left: 0px; margin-right: 57px; padding-top: 2px; padding-bottom: 2px; width: 80px;" value="请选择excel文件" type="text" /><input class="textbox-value" id="filebox_file_id_2" name="file" type="file" /></span> &nbsp;&nbsp;<a href="http://my.dearbaobei.com/student/download.html">不会写？请下载示例模板</a> </td> --%> 
         

  <td style="line-height:30px;">导入至：	
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="grade_id" value="" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" style="width: 150px; display: none;" data-options="panelHeight:'auto',validType:'noNull'" textboxname="grade_id" comboname="grade_id">
                            &nbsp;&nbsp;<span id="gradeLastText"></span><br>
							
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="class_id" value="" class="easyui-validatebox validatebox-text combobox-f combo-f textbox-f" style="width: 150px; display: none;" data-options="panelHeight:'auto',validType:'noNull'" textboxname="class_id" comboname="class_id">
							
							&nbsp;&nbsp;文件来源：<input id="filebox" class="easyui-filebox filebox-f textbox-f" data-options="prompt:'请选择excel文件'" buttontext="选择文件" style="display: none;" textboxname="file">
							<label for="multiple">
							&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/studentAction_downloadStudentTemplet.action">不会写？请下载示例模板</a>
                        </td> 
  
  
  
         
         <td width="168" valign="bottom">&nbsp;&nbsp;</td> 
        </tr> 
       </tbody>
      </table> 
      <div id="main_body_datagrid" style="padding:8px; padding-bottom:0px;"> 
       <!--数据表开始 onClickRow: onClickRowBeginEdit,--> 
       <div class="panel datagrid" style="">
        <div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 1330px; height: 358px;">
         <div class="datagrid-view" style="width: 1330px; height: 358px;">
          <div class="datagrid-view1" style="width: 31px;">
           <div class="datagrid-header" style="width: 31px; height: 24px;">
            <div class="datagrid-header-inner" style="display: block;">
             <table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0">
              <tbody>
               <tr class="datagrid-header-row">
                <td rowspan="0">
                 <div class="datagrid-header-rownumber"></div></td>
               </tr>
              </tbody>
             </table>
            </div>
           </div>
           <div class="datagrid-body" style="width: 31px; margin-top: 0px; height: 333px;">
            <div class="datagrid-body-inner">
             <table cellspacing="0" cellpadding="0" border="0">
              <tbody>
               <tr id="datagrid-row-r1-1-0" class="datagrid-row" datagrid-row-index="0" style="height: 25px;">
                <td class="datagrid-td-rownumber">
                 <div class="datagrid-cell-rownumber">
                  1
                 </div></td>
               </tr>
              </tbody>
             </table>
            </div>
           </div>
           <div class="datagrid-footer" style="width: 31px;">
            <div class="datagrid-footer-inner" style="display: none;"></div>
           </div>
          </div>
          <div class="datagrid-view2" style="width: 1299px;">
           <div class="datagrid-header" style="width: 1299px; height: 24px;">
            <div class="datagrid-header-inner" style="display: block;">
             <table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0">
              <tbody>
               <tr class="datagrid-header-row">
                <td field="ck">
                 <div class="datagrid-header-check">
                  <input type="checkbox" />
                 </div></td>
                <td field="student_no">
                 <div class="datagrid-cell datagrid-cell-c1-student_no" style="">
                  <span>学号</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="name">
                 <div class="datagrid-cell datagrid-cell-c1-name" style="">
                  <span>学生姓名</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="age">
                 <div class="datagrid-cell datagrid-cell-c1-age" style="">
                  <span>年龄</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="sex">
                 <div class="datagrid-cell datagrid-cell-c1-sex" style="">
                  <span>性别</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="yearMonthDay">
                 <div class="datagrid-cell datagrid-cell-c1-yearMonthDay" style="">
                  <span>生日</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="parent_name">
                 <div class="datagrid-cell datagrid-cell-c1-parent_name" style="">
                  <span>家长姓名</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="relationship">
                 <div class="datagrid-cell datagrid-cell-c1-relationship" style="">
                  <span>家长关系</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="phone">
                 <div class="datagrid-cell datagrid-cell-c1-phone" style="">
                  <span>家长手机</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="enter_date">
                 <div class="datagrid-cell datagrid-cell-c1-enter_date" style="">
                  <span>入校日期</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="is_local">
                 <div class="datagrid-cell datagrid-cell-c1-is_local" style="">
                  <span>本地生源</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="is_teacherson">
                 <div class="datagrid-cell datagrid-cell-c1-is_teacherson" style="">
                  <span>教职工子弟</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="census_type" class="">
                 <div class="datagrid-cell datagrid-cell-c1-census_type" style="">
                  <span>户籍类型</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="address">
                 <div class="datagrid-cell datagrid-cell-c1-address" style="">
                  <span>家庭住址</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="census_type">
                 <div class="datagrid-cell datagrid-cell-c1-health_status" style="">
                  <span>身体状况</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="blood_type">
                 <div class="datagrid-cell datagrid-cell-c1-blood_type" style="">
                  <span>血型</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="interest">
                 <div class="datagrid-cell datagrid-cell-c1-interest" style="">
                  <span>兴趣爱好</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="demand">
                 <div class="datagrid-cell datagrid-cell-c1-demand" style="">
                  <span>家长要求</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="note">
                 <div class="datagrid-cell datagrid-cell-c1-note" style="">
                  <span>学校备注</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="timetype_id">
                 <div class="datagrid-cell datagrid-cell-c1-timetype_id" style="">
                  <span>就读方式</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="is_only_child">
                 <div class="datagrid-cell datagrid-cell-c1-is_only_child" style="">
                  <span>独生子女</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="birthplace">
                 <div class="datagrid-cell datagrid-cell-c1-birthplace" style="">
                  <span>出生地</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
                <td field="identity_card">
                 <div class="datagrid-cell datagrid-cell-c1-identity_card" style="">
                  <span>身份证</span>
                  <span class="datagrid-sort-icon"></span>
                 </div></td>
               </tr>
              </tbody>
             </table>
            </div>
           </div>
           <div class="datagrid-body" style="width: 1299px; margin-top: 0px; height: 333px; overflow-x: hidden;">
            <table cellspacing="0" cellpadding="0" border="0">
             <tbody>
              <tr id="datagrid-row-r1-2--1" class="datagrid-row" datagrid-row-index="0" style="height: 25px;">
               <td field="ck">
                <div style="" class="datagrid-cell-check">
                 <input name="ck" value="" type="checkbox" />
                </div></td>
               <td field="student_no" rowspan="1" colspan="22" class="datagrid-td-merged">
                <div style="height: auto; width: 1244px;" class="datagrid-cell datagrid-cell-c1-student_no">
                 <div style="text-align:center;color:red">
                  没有找到记录！
                 </div>
                </div></td>
               <td field="name" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-name"></div></td>
               <td field="age" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-age"></div></td>
               <td field="sex" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-sex"></div></td>
               <td field="yearMonthDay" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-yearMonthDay"></div></td>
               <td field="parent_name" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-parent_name"></div></td>
               <td field="relationship" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-relationship"></div></td>
               <td field="phone" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-phone"></div></td>
               <td field="enter_date" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-enter_date"></div></td>
               <td field="is_local" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-is_local"></div></td>
               <td field="is_teacherson" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-is_teacherson"></div></td>
               <td field="census_type" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-census_type"></div></td>
               <td field="address" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-address"></div></td>
               <td field="health_status" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-health_status"></div></td>
               <td field="blood_type" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-blood_type"></div></td>
               <td field="interest" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-interest"></div></td>
               <td field="demand" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-demand"></div></td>
               <td field="note" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-note"></div></td>
               <td field="timetype_id" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-timetype_id"></div></td>
               <td field="is_only_child" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-is_only_child"></div></td>
               <td field="birthplace" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-birthplace"></div></td>
               <td field="identity_card" style="display: none;">
                <div style="height:auto;" class="datagrid-cell datagrid-cell-c1-identity_card"></div></td>
              </tr>
             </tbody>
            </table>
           </div>
           <div class="datagrid-footer" style="width: 1299px;">
            <div class="datagrid-footer-inner" style="display: none;"></div>
           </div>
          </div>
          <table id="tt" class="easyui-datagrid datagrid-f" style="display: none;" data-options="fitColumns:true,data:[],
						   onLoadSuccess: dataLoadSuccess,
						   onCheckAll: checkAllStudent,
						   rownumbers:true,checkOnSelect:false,"> 
           <thead> 
            <tr> 
             <th data-options="field:'ck',checkbox:true"></th> 
             <th data-options="field:'student_no',width:40, editor:{type:'text'}">学号</th> 
             <th data-options="field:'name',width:60, editor:{type:'text'}">学生姓名</th> 
             <th data-options="field:'age',width:60, editor:{type:'text'}">性别</th> 
             <th data-options="field:'sex',width:40,
							    formatter: sexTypeCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:sexType
                            }}">年龄</th> 
             <th data-options="field:'yearMonthDay',width:65,
							    editor:{type:'datebox',options:{
                            buttons: buttons,
                            editable:false
                            }}">生日</th> 
             <th data-options="field:'parent_name',width:60, editor:{type:'text'}">家长姓名</th> 
             <th data-options="field:'relationship',width:60,
                            formatter: relationshipCall,
                            editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:relationshipType
                            }}">家长关系</th> 
             <th data-options="field:'phone',width:60, editor:{type:'text'}">家长手机</th> 
             <th data-options="field:'enter_date',width:60,
                            editor:{type:'datebox',options:{
                            buttons: buttons,
                            editable:false
                            }}">入校日期</th> 
             <th data-options="field:'is_local',width:60,
							    formatter: isLocalCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:studentStatusInfoType
                            }}">本地生源</th> 
             <th data-options="field:'is_teacherson',width:60,
							    formatter: isTeachersonCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:studentStatusInfoType
                            }}">教职工子弟</th> 
             <th data-options="field:'census_type',width:65,
							    formatter: censusWayCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:censusWay
                            }}">户籍类型</th> 
             <th data-options="field:'address',width:70, editor:{type:'text'}">家庭住址</th> 
             <th data-options="field:'health_status',width:60,
							    formatter: healthStatusCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:healthStatus
                            }}">身体状况</th> 
             <th data-options="field:'blood_type',width:60,
                            formatter: bloodTypeCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:bloodType
                            }}">血型</th> 
             <th data-options="field:'interest',width:60,
                            formatter: interestCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            multiple:true,
                            panelHeight:'auto',
                            data:interest
                            }}">兴趣爱好</th> 
             <th data-options="field:'demand',width:60, editor:{type:'text'}">家长要求</th> 
             <th data-options="field:'note',width:60, editor:{type:'text'}">学校备注</th> 
             <th data-options="field:'timetype_id',width:60,
                            formatter: timetypeIdCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:timetypeId
                            }}">就读方式</th> 
             <th data-options="field:'is_only_child',width:60,
                            formatter: isOnlyChildCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:studentStatusInfoType
                            }}">独生子女</th> 
             <th data-options="field:'birthplace',width:60, editor:{type:'text'}">出生地</th> 
             <th data-options="field:'identity_card',width:60, editor:{type:'text'}">身份证</th> 
            </tr> 
           </thead> 
          </table>
          <style type="text/css" easyui="true">
.datagrid-cell-c1-student_no{width:31px}
.datagrid-cell-c1-name{width:51px}
.datagrid-cell-c1-age{width:51px}
.datagrid-cell-c1-sex{width:31px}
.datagrid-cell-c1-yearMonthDay{width:56px}
.datagrid-cell-c1-parent_name{width:51px}
.datagrid-cell-c1-relationship{width:51px}
.datagrid-cell-c1-phone{width:51px}
.datagrid-cell-c1-enter_date{width:51px}
.datagrid-cell-c1-is_local{width:51px}
.datagrid-cell-c1-is_teacherson{width:51px}
.datagrid-cell-c1-census_type{width:56px}
.datagrid-cell-c1-address{width:61px}
.datagrid-cell-c1-health_status{width:51px}
.datagrid-cell-c1-blood_type{width:51px}
.datagrid-cell-c1-interest{width:51px}
.datagrid-cell-c1-demand{width:51px}
.datagrid-cell-c1-note{width:51px}
.datagrid-cell-c1-timetype_id{width:51px}
.datagrid-cell-c1-is_only_child{width:51px}
.datagrid-cell-c1-birthplace{width:51px}
.datagrid-cell-c1-identity_card{width:51px}
</style>
         </div>
        </div>
       </div> 
       <!--数据表结束--> 
      </div> 
      <div id="show-error-message-box" style="color: red; padding-bottom:8px; padding-top:8px; padding-left:8px;"></div> 
     </div>
    </div> 
    <div class="panel layout-panel layout-panel-center" style="width: 1366px; left: 0px; top: 517px;">
     <div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 1366px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body"> 
      <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;"> 
       <a id="save-btn" href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-ok" onclick="saveImport()" group="">导入选中学生</a> 
       <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a> 
      </div> 
     </div>
    </div> 
    <div class="layout-split-proxy-h"></div>
    <div class="layout-split-proxy-v"></div>
   </div> 
  </form> 
  
  
<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"laveDay":183},{"id":2,"name":"Dear\u5b9d\u8d1d\u3010\u5357\u5c71\u3011\u5e7c\u513f\u56ed","gradeList":[{"id":6,"name":"\u6258\u73ed","sort":1,"classList":[{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"laveDay":183},{"id":8,"name":"\u5317\u4eac\u52b1\u5fb7\u5e7c\u513f\u56ed","gradeList":[{"id":40,"name":"\u6258\u73ed","sort":1,"classList":[]},{"id":41,"name":"\u5c0f\u73ed","sort":2,"classList":[]},{"id":42,"name":"\u4e2d\u73ed","sort":3,"classList":[]},{"id":43,"name":"\u5927\u73ed","sort":4,"classList":[]},{"id":44,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"laveDay":183}]';
    schoolJson = eval('('+schoolJson+')');
    //关系
    var relationshipType = eval('([{"id":1,"name":"\u7238\u7238"},{"id":2,"name":"\u5988\u5988"},{"id":3,"name":"\u7237\u7237"},{"id":4,"name":"\u5976\u5976"},{"id":5,"name":"\u5916\u516c"},{"id":6,"name":"\u5916\u5a46"},{"id":7,"name":"\u53d4\u53d4"},{"id":8,"name":"\u963f\u59e8"},{"id":9,"name":"\u5176\u4ed6\u5bb6\u957f"}])');
    //性别
    var sexType = [{id:1,name:"男"},{id:2,name:"女"}];
    //学生信息状态
    var studentStatusInfoType = [{id:1,name:"是"},{id:2,name:"否"}];
    //户籍
    var censusWay = eval('([{"id":1,"name":"\u975e\u519c"},{"id":2,"name":"\u519c\u6751"}])');
    //健康状态
    var healthStatus = eval('([{"id":1,"name":"\u5065\u5eb7"},{"id":3,"name":"\u4e00\u822c"},{"id":5,"name":"\u8f83\u5dee"}])');
    //血型
    var bloodType = eval('([{"id":0,"name":"\u672a\u77e5"},{"id":1,"name":"A"},{"id":2,"name":"B"},{"id":3,"name":"O"},{"id":4,"name":"AB"}])');
    //兴趣爱好
    var interest = eval('([{"id":1,"name":"\u5531\u6b4c"},{"id":2,"name":"\u8df3\u821e"},{"id":3,"name":"\u4e0b\u68cb"},{"id":4,"name":"\u4f53\u80b2\u8fd0\u52a8"},{"id":5,"name":"\u6e38\u620f"},{"id":6,"name":"\u5176\u4ed6"}])');
    //就读方式
    var timetypeId = eval('([{"id":1,"name":"\u5168\u65e5\u5236"},{"id":2,"name":"\u5bc4\u5bbf\u5236"},{"id":3,"name":"\u534a\u65e5\u5236"}])');

    var url = $('#fm').attr('data-href'); // 导入地址

    /* 表单校验信息 */
    $.extend($.fn.validatebox.defaults.rules, {
        validateSchoolId: {
            validator: function(value){
                var schoolValue = $('#school_id').combobox("getValue");             
                return (isNaN(Number(schoolValue)) || Number(schoolValue) < 1? false: true);
            },
            message: '请选择一个学校'
        },
        validateGradeId: {
            validator: function(value){
                var gradeValue = $('#grade_id').combobox("getValue");             

                return (isNaN(Number(gradeValue)) || Number(gradeValue) < 1? false: true);
            },
            message: '请选择年级'
        },
        validateClassId: {
            validator: function(value){
                var classValue = $('#class_id').combobox("getValue");             
                return (isNaN(Number(classValue)) || Number(classValue) < 1? false: true);

            },
            message: '请选择班级'
        },
        noNull: {
            validator: function(value, param){
                if(value=='请选择' || value=='' || value=='全部年级' || value=='全部班级' ||value=='没有班级'){
                    return false;
                }
                return true;
            },
            message: '此输入项为必输项'
        }
    });
    //  清空按钮
    var buttons = $.extend([], $.fn.datebox.defaults.buttons);
    buttons.splice(1, 0, {
        text: '清空',
        handler: function(target){
            $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
        }
    });

    var editStatus;
    //开始编辑
    function onClickRowBeginEdit(rowIndex, rowData){
        if(editStatus == rowIndex) return;
        if(editStatus != undefined){
            onClickRowEndEdit(editStatus);
        }
        editStatus = rowIndex;
        var t = $("#tt");
        t.datagrid('beginEdit',rowIndex);
    }

    //输入不正确的变红色
    function setTextColor(value){
        var color = '';
        if(value && value.indexOf("输入不正确") != -1){
            color += 'red';
        }
        var rs = value? '<span style="color:'+color+';">'+value+'</span>': '';
        return rs;
    }

    //结束编辑
    function onClickRowEndEdit(rowIndex){
        var t = $("#tt");
        t.datagrid('endEdit',rowIndex);
       var noEdit = false;

        var rowData = t.datagrid('getRows');
        if(rowData){
            for(var i in rowData[rowIndex]){
                var val = rowData[rowIndex][i]+"";
                if(val.indexOf("输入不正确") != -1){
                    noEdit = true;
                }
            }
        }

        if(noEdit){
            $(".datagrid-view2 .datagrid-body .datagrid-btable tr[datagrid-row-index='"+rowIndex+"'] td[field='ck'] input").hide();
        }else{
            $(".datagrid-view2 .datagrid-body .datagrid-btable tr[datagrid-row-index='"+rowIndex+"'] td[field='ck'] input").show();
        }
    }
	var aaa=false;
    //全选的时候 回调方法
    function checkAllStudent(rows){
        var rowData = rows;
        if(rowData){
            var t = $("#tt");
            for(var x in rowData){
                var noEdit = false;
                for(var i in rowData[x]){
                    var val = rowData[x][i]+"";
                    //alert(val+"----"+val.indexOf("输入不正确"));
                    if(val.indexOf("输入不正确") != -1){
                    	noEdit = true;
                    }
                }
                if(noEdit){
                    t.datagrid('unselectRow',x);
                }
            }
            
        }
    }


    //关系回调方法
    function relationshipCall(value,row,index){
        for(var i=0; i<relationshipType.length; i++){
            if(relationshipType[i]['id'] == value){
                row.relationship = value;
                return relationshipType[i]['name'];
            }
        }
        return setTextColor(value);
    }

    //性别回调方法
    function sexTypeCall(value,row,index){
        for(var i=0; i<sexType.length; i++){
            if(sexType[i]['id'] == value){
                row.sex = sexType[i]['id'];
                return sexType[i]['name'];
            }
        }
        return setTextColor(value);
    }

    //本地生回调方法
    function isLocalCall(value,row,index){
        for(var i=0; i<studentStatusInfoType.length; i++){
            if(studentStatusInfoType[i]['id'] == value){
                row.is_local = value;
                return studentStatusInfoType[i]['name'];
            }
        }
        return setTextColor(value);
    }

    //教职工子弟回调方法
    function isTeachersonCall(value,row,index){
        for(var i=0; i<studentStatusInfoType.length; i++){
            if(studentStatusInfoType[i]['id'] == value){
                row.is_teacherson = value;
                return studentStatusInfoType[i]['name'];
            }
        }
        return setTextColor(value);
    }

    //独身子女回调方法
    function isOnlyChildCall(value,row,index){
        for(var i=0; i<studentStatusInfoType.length; i++){
            if(studentStatusInfoType[i]['id'] == value){
                row.is_only_child = value;
                return studentStatusInfoType[i]['name'];
            }
        }
        return setTextColor(value);
    }

    //户籍回调方法
    function censusWayCall(value,row,index){
        for(var i=0; i<censusWay.length; i++){
            if(censusWay[i]['id'] == value){
                row.census_type = value;
                return censusWay[i]['name'];
            }
        }
        return setTextColor(value);
    }

    //健康状态回调
    function healthStatusCall(value,row,index){
        for(var i=0; i<healthStatus.length; i++){
            if(healthStatus[i]['id'] == value){
                row.health_status = value;
                return healthStatus[i]['name'];
            }
        }
        return setTextColor(value);
    }

    //血型回调方法
    function bloodTypeCall(value,row,index){
        for(var i=0; i<bloodType.length; i++){
            if(bloodType[i]['id'] == value){
                row.blood_type = value;
                return bloodType[i]['name'];
            }
        }
        return setTextColor(value);
    }

    //兴趣爱好回调方法
    function interestCall(value,row,index){
        var text = '';
        var val = '';
        for(var i=0; i<interest.length; i++){
            if(value && value.indexOf(interest[i]['id']) != -1){
                text += (text == '' ? '' :',')+interest[i]['name'];
                val += (val == '' ? '' :',')+interest[i]['id'];
            }
        }
        row.interest = text ? text : value;
        row.interest = val;

        return setTextColor(row.interest);
    }

    //就读方式会回调方法
    function timetypeIdCall(value,row,index){
        for(var i=0; i<timetypeId.length; i++){
            if(timetypeId[i]['id'] == value){
                row.timetype_id = value;
                return timetypeId[i]['name'];
            }
        }
        return setTextColor(value);
    }

    /* 保存班级信息 */
    function saveImport(){
        
    	var grade_id=$('#grade_id').combobox("getValue");
        var class_id=$('#class_id').combobox("getValue");
        if(grade_id !="" &&class_id !=""){
    	$('#show-error-message-box').html('');
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        
		//alert("进入方法 ");
        //保存的时候 必须要是勾选的，
        $(".datagrid-view2 .datagrid-body .datagrid-btable tr").each(function(){
            if(!$(this).find("input[name='ck']").is(':hidden') && $(this).find("input[name='ck']").prop('checked')){
                var rowIndex = $(this).attr('datagrid-row-index');
                $('#tt').datagrid('selectRow',rowIndex);
            }else{
                var rowIndex = $(this).attr('datagrid-row-index');
                $('#tt').datagrid('unselectRow',rowIndex);
            }
        })
        
        $('#save-btn').addClass('mylinkbtn-load');
        $('#fm').form('submit',{
            url: '${pageContext.request.contextPath}/studentAction_importStudent.action',
            onSubmit: function(params){
                var studentData = $("#tt").datagrid('getSelections');
                if(! studentData){
                    return false;
                }
                
                //到时候取消下面注释
			    //alert("onSubmit");
                //params.studentData = JSON.stringify(studentData);
				//alert(params.studentData);
                //var flag = $(this).form('enableValidation').form('validate');
                //alert(flag); 
                var flag = true;
                
                if (flag == false) {
                    $('#save-btn').removeClass('mylinkbtn-load');
                } else {
                    loadWindow('show', '正在导入学生数据, 请稍后。。。');                    
                }
                return flag;
            },
            success: function(result){
                loadWindow('close');
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
    }

    /* 上传文件 处理 */
    function saveProcessFile(){
        var url = '${pageContext.request.contextPath}/studentAction_resolveStudent.action';
       	//var url = '${pageContext.request.contextPath}/json/test2.json';
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(params){
                params.fileText = 1;
                return true;
            },
            success:function(result){
                var result = eval('('+result+')');
                
                if(result.status == 1){
                    $('#tt').datagrid('loadData',result.info);
                }else{
                    $.messager.alert('提示',result.info,'error');
                }
            }
        })
    }

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { student_no: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'student_no', colspan: 22 })
        }else{
            for(var x in data.rows){
                var noEdit = false;
                for(var i in data.rows[x]){
                    var val = data.rows[x][i]+"";
                    if(val.indexOf("输入不正确") != -1){
                        noEdit = true;
                    }
                }
                if(noEdit){
                    $(".datagrid-view2 .datagrid-body .datagrid-btable tr[datagrid-row-index='"+x+"'] td[field='ck'] input").hide();
                }else{
                    $(".datagrid-view2 .datagrid-body .datagrid-btable tr[datagrid-row-index='"+x+"'] td[field='ck'] input").show();
                }
            }
        }
    }

    $(function(){

        /* 所属学校 */
        var next_upgrade_year,first_term_month,first_termname;
         $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            value: '',
            onLoadSuccess:function(){
            },
            onSelect: function(record) {
                /* if(record.gradeList){
                    $('#grade_id').combobox('loadData',record.gradeList);
                    var html ='该校当前学年：';
                    html += '<font color="blue">'+(record.next_upgrade_year-1)+'学年（';
                    html += (record.next_upgrade_year-1)+'年'+record.first_term_month+'月 - ';
                    html += record.next_upgrade_year+'年'+record.upgrade_month+'月'+record.upgrade_day+'号）</font>&nbsp;&nbsp;';

                    if(record.laveDay > 15){
                        html += '<span style="color:#555555; font-weight:bold;">'+record.laveDay+'天后自动升级</span>&nbsp;&nbsp;'
                    }else{
                        html += '<span style="color:red; font-weight:bold;">特别提醒：所注册的学生将在'+record.laveDay+'天后自动升级</span>';
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

                    $('#grade_id').combobox('loadData',[{id: 'all', name: '请选择年级'}]);
                } */
            }           
        }); 

       //年级
         $('#grade_id').combobox({
  			url:'${pageContext.request.contextPath}/gradeAction_findAllGradesToSearch.action',
  			//data:[{id:'',name:"全部年级"}],
  			valueField:'id',
             textField:'name',
             editable:false,
             onLoadSuccess:function(){
                 //$('#grade_id').combobox("setValue","全部年级");
             },
             onSelect:function(record){
             	
             	var id = record.id;
             	if(id!=""){
             	var url='${pageContext.request.contextPath}/classesAction_findAllClassByGradeIdToSearch.action?id='+id+'';
             	$('#class_id').combobox({disabled:false,url:url});
             	}
             	else
             		$('#class_id').combobox({disabled:true});
             }
         });

         //班级
         $('#class_id').combobox({
             //data:[{id:'',name:"全部班级"}],
         	valueField:'id',
             textField:'name',
             disabled:true,//不能编辑:true
             editable:false,
             onLoadSuccess:function(){
                 //$('#class_id').combobox("setValue","全部班级");
             }
         });

        if(schoolJson.length > 0){
            $("#school_id").combobox('select',schoolJson[0]['id']);
        }

        $('#filebox').filebox({
            editable:false,
            onChange:function(){
                saveProcessFile();
            }
        })

        //取消编辑 时间
        $(document).click(function(){
            if(editStatus != undefined){
                onClickRowEndEdit(editStatus);
            }
        });

        //行点击事件
        $(document).on('click','.datagrid-view2 .datagrid-body .datagrid-btable tr',function(e){
            var rowIndex = Number($(this).attr('datagrid-row-index'));
            if(editStatus != undefined){
                onClickRowEndEdit(editStatus);
            }

            editStatus = rowIndex;
            var t = $("#tt");
            t.datagrid('beginEdit',rowIndex);//开始编辑

            if($(this).find("input[name='ck']").is(':hidden')){
                t.datagrid('unselectRow',rowIndex);
            }

            e.stopPropagation();
        })

        $(document).on('click','.combo-p',function(e){
            e.stopPropagation();
        })
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
  
  <div class="panel combo-p" style="position: absolute; z-index: 10; display: none;">
   <div class="combo-panel panel-body panel-body-noheader" title="">
    <div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">
     Dear宝贝示范幼儿园
    </div>
    <div id="_easyui_combobox_i1_1" class="combobox-item">
     Dear宝贝【南山】幼儿园
    </div>
    <div id="_easyui_combobox_i1_2" class="combobox-item">
     北京励德幼儿园
    </div>
   </div>
  </div>
  <div class="panel combo-p" style="position: absolute; z-index: 10; display: none;">
   <div class="combo-panel panel-body panel-body-noheader" title="">
    <div id="_easyui_combobox_i2_0" class="combobox-item">
     托班
    </div>
    <div id="_easyui_combobox_i2_1" class="combobox-item">
     小班
    </div>
    <div id="_easyui_combobox_i2_2" class="combobox-item">
     中班
    </div>
    <div id="_easyui_combobox_i2_3" class="combobox-item">
     大班
    </div>
    <div id="_easyui_combobox_i2_4" class="combobox-item">
     学前班
    </div>
   </div>
  </div>
  <div class="panel combo-p" style="position: absolute; z-index: 10; display: none;">
   <div class="combo-panel panel-body panel-body-noheader" title="">
    <div id="_easyui_combobox_i3_0" class="combobox-item">
     请选择年级
    </div>
   </div>
  </div>
 </body>
</html>