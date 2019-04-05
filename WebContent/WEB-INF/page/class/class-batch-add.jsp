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

<style type="text/css">
.className,.teacherName{margin: 0;padding: 0;}
.add_class_box{max-height: 471px; overflow: auto;}
.grade_class_tr{text-align:left;}
.grade_class_tr .grade_class_left_td{background-color:#FFFFFF; margin:0px; line-height:21px;}
.grade_class_tr .grade_class_right_td{background-color:#FFFFFF; margin:0px;}
.grade_class_tr .grade_class_right_td .grade_class_right_table{}
.grade_class_tr .grade_class_right_td .grade_class_right_table .grade_class_right_table_tr{}
.grade_class_tr .grade_class_right_td .grade_class_right_table .grade_class_right_table_tr td{}
.grade_class_tr .grade_class_right_td .grade_class_right_table .grade_class_right_table_tr .grade_class_right_table_td_01{width: 310px;padding:3px; }
.grade_class_tr .grade_class_right_td .grade_class_right_table .grade_class_right_table_tr .grade_class_right_table_td_02{width: 310px;padding:3px;}
.grade_class_tr .grade_class_right_td .grade_class_right_table .grade_class_right_table_tr .grade_class_right_table_td_03{width: 310px;padding:3px;}
.grade_class_tr .grade_class_right_td .grade_class_right_table .grade_class_right_table_tr .grade_class_right_table_td_04{width: 200px;padding:3px;}
</style>

    <form id="fm" style="height:588px; " method="post" data-href="/class/save-batch.html" class="panel-noscroll">
        <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 788px; height: 588px;">
            <div class="panel layout-panel layout-panel-north" style="width: 788px; left: 0px; top: 0px;"><div region="north" border="false" style="padding: 0px; overflow: hidden; width: 788px; height: 518px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
                <table width="100%" cellspacing="0" cellpadding="12" border="0">
                    <tbody><tr>
                        <td>
                            <input id="school_id" required="true" value="" validtype="validateSchoolId" style="width: 180px; display: none;" data-options="" class="combobox-f combo-f textbox-f" textboxname="school_id" comboname="school_id"><span class="textbox combo" style="width: 178px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 152px;" type="text"><input class="textbox-value" name="school_id" value="1" type="hidden"></span>
                            <span id="schoolLastText">当前学年：<font color="blue">2016学年（2016年9月 - 2017年7月18日）</font>&nbsp;&nbsp;，下次升级：2017年7月18号(今年)</span>
                        </td>
                    </tr>
              </tbody></table>

                <div class="add_class_box">
                
                
                
                
                
                
                
                
                
                
			                
			  <%-- <table class="table_box" id="tt" width="100%" cellspacing="1" cellpadding="8" bgcolor="#dddddd"> 
			   <tbody>
			    <tr style="font-weight:100;" bgcolor="#f0f0f0" align="left"> 
			     <td>年级</td> 
			     <td width="620"> 
			      <table width="100%" cellspacing="0" cellpadding="3" border="0"> 
			       <tbody>
			        <tr align="left"> 
			         <td width="170">班级名称</td> 
			         <td width="170">班主任</td> 
			         <td width="170">班级类型</td> 
			         <td>操作</td> 
			        </tr> 
			       </tbody>
			      </table> </td> 
			    </tr> 
			    <tr class="grade_class_tr grade_class_tr_1" grade-id="1">
			     <td class="grade_class_left_td grade_class_left_td_1">托班(2016年入学)<br /><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td>
			     <td class="grade_class_right_td grade_class_right_td_1">
			      <table class="grade_class_right_table grade_class_right_table_1">
			       <tbody>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">一班</td>
			         <td class="grade_class_right_table_td_02">唐国辉</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">二班</td>
			         <td class="grade_class_right_table_td_02">龙邵华</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">三班</td>
			         <td class="grade_class_right_table_td_02">李小兰</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			       </tbody>
			      </table></td>
			    </tr>
			    <tr class="grade_class_tr grade_class_tr_2" grade-id="2">
			     <td class="grade_class_left_td grade_class_left_td_2">小班(2015年入学)<br /><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td>
			     <td class="grade_class_right_td grade_class_right_td_2">
			      <table class="grade_class_right_table grade_class_right_table_2">
			       <tbody>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">一班</td>
			         <td class="grade_class_right_table_td_02">陈震</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">二班</td>
			         <td class="grade_class_right_table_td_02">刘亚真</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			       </tbody>
			      </table></td>
			    </tr>
			    <tr class="grade_class_tr grade_class_tr_3" grade-id="3">
			     <td class="grade_class_left_td grade_class_left_td_3">中班(2014年入学)<br /><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td>
			     <td class="grade_class_right_td grade_class_right_td_3">
			      <table class="grade_class_right_table grade_class_right_table_3">
			       <tbody>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">一班</td>
			         <td class="grade_class_right_table_td_02">陈震</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">二班</td>
			         <td class="grade_class_right_table_td_02">陈子源</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">三班</td>
			         <td class="grade_class_right_table_td_02">陈震</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			       </tbody>
			      </table></td>
			    </tr>
			    <tr class="grade_class_tr grade_class_tr_4" grade-id="4">
			     <td class="grade_class_left_td grade_class_left_td_4">大班(2013年入学)<br /><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td>
			     <td class="grade_class_right_td grade_class_right_td_4">
			      <table class="grade_class_right_table grade_class_right_table_4">
			       <tbody>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">一班</td>
			         <td class="grade_class_right_table_td_02">龙邵华</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">二班</td>
			         <td class="grade_class_right_table_td_02">唐勇辉</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			       </tbody>
			      </table></td>
			    </tr>
			    <tr class="grade_class_tr grade_class_tr_5" grade-id="5">
			     <td class="grade_class_left_td grade_class_left_td_5">学前班(2012年入学)<br /><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td>
			     <td class="grade_class_right_td grade_class_right_td_5">
			      <table class="grade_class_right_table grade_class_right_table_5">
			       <tbody>
			        <tr class="grade_class_right_table_tr">
			         <td class="grade_class_right_table_td_01">一班</td>
			         <td class="grade_class_right_table_td_02">曾文尝</td>
			         <td class="grade_class_right_table_td_03">普通班</td>
			         <td class="grade_class_right_table_td_04"></td>
			        </tr>
			       </tbody>
			      </table></td>
			    </tr>
			   </tbody>
			  </table> --%> 

                
                
                
                
                
                
                
                
                
                
                
                    <!--数据表开始-->
                   <table class="table_box" id="tt" width="100%" cellspacing="1" cellpadding="8" bgcolor="#dddddd">
                        <tbody><tr style="font-weight:100;" bgcolor="#f0f0f0" align="left">
                            <td>年级</td>
                            <td width="620">
							
<table width="100%" cellspacing="0" cellpadding="3" border="0">
  <tbody><tr align="left">
    <td width="170">班级名称</td>
    <td width="170">班主任</td>
    <td width="170">班级类型</td>
    <td>操作</td>
  </tr>
</tbody></table>
							</td>
                        </tr>
                  <tr class="grade_class_tr grade_class_tr_1" grade-id="1"><td class="grade_class_left_td grade_class_left_td_1">托班(2016年入学)<br><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td><td class="grade_class_right_td grade_class_right_td_1"><table class="grade_class_right_table grade_class_right_table_1"><tbody><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">一班</td><td class="grade_class_right_table_td_02">唐国辉</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">二班</td><td class="grade_class_right_table_td_02">龙邵华</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">三班</td><td class="grade_class_right_table_td_02">李小兰</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr></tbody></table></td></tr><tr class="grade_class_tr grade_class_tr_2" grade-id="2"><td class="grade_class_left_td grade_class_left_td_2">小班(2015年入学)<br><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td><td class="grade_class_right_td grade_class_right_td_2"><table class="grade_class_right_table grade_class_right_table_2"><tbody><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">一班</td><td class="grade_class_right_table_td_02">陈震</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">二班</td><td class="grade_class_right_table_td_02">刘亚真</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr></tbody></table></td></tr><tr class="grade_class_tr grade_class_tr_3" grade-id="3"><td class="grade_class_left_td grade_class_left_td_3">中班(2014年入学)<br><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td><td class="grade_class_right_td grade_class_right_td_3"><table class="grade_class_right_table grade_class_right_table_3"><tbody><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">一班</td><td class="grade_class_right_table_td_02">陈震</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">二班</td><td class="grade_class_right_table_td_02">陈子源</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">三班</td><td class="grade_class_right_table_td_02">陈震</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr></tbody></table></td></tr><tr class="grade_class_tr grade_class_tr_4" grade-id="4"><td class="grade_class_left_td grade_class_left_td_4">大班(2013年入学)<br><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td><td class="grade_class_right_td grade_class_right_td_4"><table class="grade_class_right_table grade_class_right_table_4"><tbody><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">一班</td><td class="grade_class_right_table_td_02">龙邵华</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">二班</td><td class="grade_class_right_table_td_02">唐勇辉</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr></tbody></table></td></tr><tr class="grade_class_tr grade_class_tr_5" grade-id="5"><td class="grade_class_left_td grade_class_left_td_5">学前班(2012年入学)<br><a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-add" plain="false" onclick="addTableClass(this)" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">添加班级</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a></td><td class="grade_class_right_td grade_class_right_td_5"><table class="grade_class_right_table grade_class_right_table_5"><tbody><tr class="grade_class_right_table_tr"><td class="grade_class_right_table_td_01">一班</td><td class="grade_class_right_table_td_02">曾文尝</td><td class="grade_class_right_table_td_03">普通班</td><td class="grade_class_right_table_td_04"></td></tr></tbody></table></td></tr></tbody></table>
             
          		 <!--数据表结束-->
                </div>




                <!--老师名称模糊搜索框-->
                <%-- <div id="teacherTableBox" style="position:absolute;top:1000px;left:-1000px;height:168px;width:250px;z-index:9;display: none;">
                    <div class="panel datagrid" style="width: 330px;"><div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 328px; height: 166px;"><div class="datagrid-view" style="width: 328px; height: 0px;"><div class="datagrid-view1" style="width: 0px;"><div class="datagrid-header" style="width: 0px; height: 0px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 0px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td rowspan="0"><div class="datagrid-header-rownumber"></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 0px; margin-top: 0px; height: 165px;"><div class="datagrid-body-inner"><table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody></tbody></table></div></div><div class="datagrid-footer" style="width: 0px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><div class="datagrid-view2" style="width: 328px;"><div class="datagrid-header" style="width: 328px; height: 0px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 0px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td field="teacher_name"><div class="datagrid-cell datagrid-cell-c1-teacher_name" style=""><span>姓名</span><span class="datagrid-sort-icon"></span></div></td><td field="sex"><div class="datagrid-cell datagrid-cell-c1-sex" style=""><span>性别</span><span class="datagrid-sort-icon"></span></div></td><td field="structure_name"><div class="datagrid-cell datagrid-cell-c1-structure_name" style=""><span>部门</span><span class="datagrid-sort-icon"></span></div></td><td field="duty_name"><div class="datagrid-cell datagrid-cell-c1-duty_name" style=""><span>职务</span><span class="datagrid-sort-icon"></span></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 328px; margin-top: 0px; height: 165px; overflow-x: hidden;"><table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody></tbody></table></div><div class="datagrid-footer" style="width: 328px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><table id="teacherTable" class="easyui-datagrid datagrid-f" style="display: none;" 
                    					   data-options="url:'${pageContext.request.contextPath}/teacherAction_findTeacher.action',
                                           onLoadSuccess:teacherDataLoadSuccess,onClickRow:teacherClickRow,
                                           rownumbers:true,singleSelect:true">
                        <thead>
                        <tr>
                            <th data-options="field:'teacher_name',width:80">姓名</th>
                            <th data-options="field:'sex',width:40">性别</th>
                            <th data-options="field:'structure_name',width:80">部门</th>
                            <th data-options="field:'duty_name',width:80">职务</th>
                        </tr>
                    </thead></table><style type="text/css" easyui="true">
.datagrid-cell-c1-teacher_name{width:71px}
.datagrid-cell-c1-sex{width:31px}
.datagrid-cell-c1-structure_name{width:71px}
.datagrid-cell-c1-duty_name{width:71px}
</style></div></div></div></div> --%>






			  <div id="teacherTableBox" style="position:absolute;top:1000px;left:-1000px;height:168px;width:250px;z-index:9;display: none;"> 
			   <div class="panel datagrid" style="width: 330px;">
			    <div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 328px; height: 166px;">
			     <div class="datagrid-view" style="width: 328px; height: 0px;">
			     
			      <table id="teacherTable" class="easyui-datagrid datagrid-f" style="display: none;" 
			      							data-options="url:'${pageContext.request.contextPath}/teacherAction_findTeacher.action',
			                                onLoadSuccess:teacherDataLoadSuccess,onClickRow:teacherClickRow,
			                                rownumbers:true,singleSelect:true"> 
			       <thead> 
			        <tr> 
			         <th data-options="field:'teacher_name',width:80">姓名</th> 
			         <th data-options="field:'sex_name',width:40">性别</th> 
			         <th data-options="field:'structure_name',width:80">部门</th> 
			         <th data-options="field:'duty_name',width:80">职务</th> 
			        </tr> 
			       </thead>
			      </table>
			      <style type="text/css" easyui="true">
			.datagrid-cell-c1-teacher_name{width:71px}
			.datagrid-cell-c1-sex_name{width:31px}
			.datagrid-cell-c1-structure_name{width:71px}
			.datagrid-cell-c1-duty_name{width:71px}
			</style>
			     </div>
			    </div>
			   </div> 
			  </div>






                

                <div id="error-help-message-box" style="color: red">
                </div>
            </div></div>
            <div class="panel layout-panel layout-panel-center" style="width: 788px; left: 0px; top: 518px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 788px; height: 70px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                    <a id="save-btn" href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveClass()" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">保存</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a>
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">取消</span><span class="l-btn-icon icon-no">&nbsp;</span></span></a>
                </div>
            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
    </form>


<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[{"id":1,"name":"\u6258\u73ed","sort":1,"classList":[{"id":1,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"},{"id":16,"name":"\u4e8c\u73ed(2016\u5e74\u5165\u5b66)"},{"id":27,"name":"\u4e09\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":2,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":2,"name":"\u4e00\u73ed(2015\u5e74\u5165\u5b66)"},{"id":18,"name":"\u4e8c\u73ed(2015\u5e74\u5165\u5b66)"}]},{"id":3,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":3,"name":"\u4e00\u73ed(2014\u5e74\u5165\u5b66)"},{"id":19,"name":"\u4e8c\u73ed(2014\u5e74\u5165\u5b66)"},{"id":24,"name":"\u4e09\u73ed(2014\u5e74\u5165\u5b66)"}]},{"id":4,"name":"\u5927\u73ed","sort":4,"classList":[{"id":4,"name":"\u4e00\u73ed(2013\u5e74\u5165\u5b66)"},{"id":20,"name":"\u4e8c\u73ed(2013\u5e74\u5165\u5b66)"}]},{"id":5,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":5,"name":"\u4e00\u73ed(2012\u5e74\u5165\u5b66)"}]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"tableData":[{"grade_id":1,"grade_name":"\u6258\u73ed(2016\u5e74\u5165\u5b66)","class_id":1,"class_name":"\u4e00\u73ed","teacher_id":1,"teacher_name":"\u5510\u56fd\u8f89","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":1,"grade_name":"\u6258\u73ed(2016\u5e74\u5165\u5b66)","class_id":16,"class_name":"\u4e8c\u73ed","teacher_id":4,"teacher_name":"\u9f99\u90b5\u534e","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":1,"grade_name":"\u6258\u73ed(2016\u5e74\u5165\u5b66)","class_id":27,"class_name":"\u4e09\u73ed","teacher_id":43,"teacher_name":"\u674e\u5c0f\u5170","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":2,"grade_name":"\u5c0f\u73ed(2015\u5e74\u5165\u5b66)","class_id":2,"class_name":"\u4e00\u73ed","teacher_id":3,"teacher_name":"\u9648\u9707","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":2,"grade_name":"\u5c0f\u73ed(2015\u5e74\u5165\u5b66)","class_id":18,"class_name":"\u4e8c\u73ed","teacher_id":2,"teacher_name":"\u5218\u4e9a\u771f","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":3,"grade_name":"\u4e2d\u73ed(2014\u5e74\u5165\u5b66)","class_id":3,"class_name":"\u4e00\u73ed","teacher_id":3,"teacher_name":"\u9648\u9707","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":3,"grade_name":"\u4e2d\u73ed(2014\u5e74\u5165\u5b66)","class_id":19,"class_name":"\u4e8c\u73ed","teacher_id":21,"teacher_name":"\u9648\u5b50\u6e90","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":3,"grade_name":"\u4e2d\u73ed(2014\u5e74\u5165\u5b66)","class_id":24,"class_name":"\u4e09\u73ed","teacher_id":3,"teacher_name":"\u9648\u9707","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":4,"grade_name":"\u5927\u73ed(2013\u5e74\u5165\u5b66)","class_id":4,"class_name":"\u4e00\u73ed","teacher_id":4,"teacher_name":"\u9f99\u90b5\u534e","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":4,"grade_name":"\u5927\u73ed(2013\u5e74\u5165\u5b66)","class_id":20,"class_name":"\u4e8c\u73ed","teacher_id":19,"teacher_name":"\u5510\u52c7\u8f89","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":5,"grade_name":"\u5b66\u524d\u73ed(2012\u5e74\u5165\u5b66)","class_id":5,"class_name":"\u4e00\u73ed","teacher_id":5,"teacher_name":"\u66fe\u6587\u5c1d","class_type":1,"class_type_name":"\u666e\u901a\u73ed"}]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[{"id":6,"name":"\u6258\u7ba1\u73ed","sort":1,"classList":[{"id":6,"name":"1210(2016\u5e74\u5165\u5b66)"},{"id":7,"name":"1209(2016\u5e74\u5165\u5b66)"}]},{"id":7,"name":"\u5c0f\u73ed","sort":2,"classList":[{"id":8,"name":"1208(2015\u5e74\u5165\u5b66)"},{"id":9,"name":"1207(2015\u5e74\u5165\u5b66)"}]},{"id":8,"name":"\u4e2d\u73ed","sort":3,"classList":[{"id":10,"name":"1206(2014\u5e74\u5165\u5b66)"},{"id":11,"name":"1205(2014\u5e74\u5165\u5b66)"}]},{"id":9,"name":"\u5927\u73ed","sort":4,"classList":[{"id":12,"name":"1204(2013\u5e74\u5165\u5b66)"},{"id":13,"name":"1203(2013\u5e74\u5165\u5b66)"}]},{"id":10,"name":"\u5b66\u524d\u73ed","sort":5,"classList":[{"id":14,"name":"1202(2012\u5e74\u5165\u5b66)"},{"id":15,"name":"1201(2012\u5e74\u5165\u5b66)"}]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"tableData":[{"grade_id":6,"grade_name":"\u6258\u7ba1\u73ed(2016\u5e74\u5165\u5b66)","class_id":6,"class_name":"1210","teacher_id":17,"teacher_name":"\u5f20\u5a1f","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":6,"grade_name":"\u6258\u7ba1\u73ed(2016\u5e74\u5165\u5b66)","class_id":7,"class_name":"1209","teacher_id":16,"teacher_name":"\u9648\u8273\u541b","class_type":3,"class_type_name":"\u821e\u8e48\u73ed"},{"grade_id":7,"grade_name":"\u5c0f\u73ed(2015\u5e74\u5165\u5b66)","class_id":8,"class_name":"1208","teacher_id":15,"teacher_name":"\u5218\u6653\u8389","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":7,"grade_name":"\u5c0f\u73ed(2015\u5e74\u5165\u5b66)","class_id":9,"class_name":"1207","teacher_id":14,"teacher_name":"\u5f20\u7389\u5b8f","class_type":2,"class_type_name":"\u7f8e\u672f\u73ed"},{"grade_id":8,"grade_name":"\u4e2d\u73ed(2014\u5e74\u5165\u5b66)","class_id":10,"class_name":"1206","teacher_id":13,"teacher_name":"\u5218\u7fe0\u73b2","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":8,"grade_name":"\u4e2d\u73ed(2014\u5e74\u5165\u5b66)","class_id":11,"class_name":"1205","teacher_id":12,"teacher_name":"\u9a6c\u56fd\u826f","class_type":2,"class_type_name":"\u7f8e\u672f\u73ed"},{"grade_id":9,"grade_name":"\u5927\u73ed(2013\u5e74\u5165\u5b66)","class_id":12,"class_name":"1204","teacher_id":11,"teacher_name":"\u9a6c\u91d1\u5170","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":9,"grade_name":"\u5927\u73ed(2013\u5e74\u5165\u5b66)","class_id":13,"class_name":"1203","teacher_id":10,"teacher_name":"\u6731\u65b0\u7586","class_type":3,"class_type_name":"\u821e\u8e48\u73ed"},{"grade_id":10,"grade_name":"\u5b66\u524d\u73ed(2012\u5e74\u5165\u5b66)","class_id":14,"class_name":"1202","teacher_id":9,"teacher_name":"\u4e8e\u6d77","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":10,"grade_name":"\u5b66\u524d\u73ed(2012\u5e74\u5165\u5b66)","class_id":15,"class_name":"1201","teacher_id":8,"teacher_name":"\u8d3a\u5409\u4e91","class_type":4,"class_type_name":"\u7279\u957f\u73ed"}]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[{"id":40,"name":"\u6258\u7ba1\u73ed1","sort":1,"classList":[{"id":54,"name":"\u4e00\u73ed(2016\u5e74\u5165\u5b66)"}]},{"id":41,"name":"\u6258\u7ba1\u73ed2","sort":2,"classList":[]},{"id":42,"name":"\u6258\u7ba1\u73ed3","sort":3,"classList":[]}],"first_termname":"\u79cb\u5b66\u671f","first_term_month":9,"last_termname":"\u6625\u5b66\u671f","last_term_month":2,"next_upgrade_year":2017,"upgrade_month":7,"upgrade_day":18,"tableData":[{"grade_id":40,"grade_name":"\u6258\u7ba1\u73ed1(2016\u5e74\u5165\u5b66)","class_id":54,"class_name":"\u4e00\u73ed","teacher_id":59,"teacher_name":"\u4e8e\u82b9","class_type":1,"class_type_name":"\u666e\u901a\u73ed"},{"grade_id":41,"grade_name":"\u6258\u7ba1\u73ed2(2015\u5e74\u5165\u5b66)","class_id":0,"class_name":"","teacher_id":0,"teacher_name":"","class_type":0,"class_type_name":""},{"grade_id":42,"grade_name":"\u6258\u7ba1\u73ed3(2014\u5e74\u5165\u5b66)","class_id":0,"class_name":"","teacher_id":0,"teacher_name":"","class_type":0,"class_type_name":""}]}]';
    schoolJson = eval('('+schoolJson+')');

    //班级类型
    var classTypeJson = eval('([{"id":"3","name":"\u821e\u8e48\u73ed"},{"id":"2","name":"\u7f8e\u672f\u73ed"},{"id":"1","name":"\u666e\u901a\u73ed"},{"id":"4","name":"\u7279\u957f\u73ed"},{"id":"17","name":"\u7b97\u672f\u73ed"}])');

    var url = $('#fm').attr('data-href'); // 保存学校地址

    var valIndex = 0;

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
        className: {
            validator: function(value) {
                var result = true;
                $(this).closest('.grade_class_right_table').find('.grade_class_right_table_td_01').each(function(){
                    if($(this).html() == $.trim(value)){
                        result = false;
                    }
                })

                if($(this).closest('.grade_class_right_table').find('.className').length > 1){
                    var classIndex = $(this).closest('.className').attr('class-index');
                    $(this).closest('.grade_class_right_table').find('.className').each(function(){
                        if($(this).attr('class-index') != classIndex && $(this).find('.textbox-text').val() == $.trim(value)){
                            result = false;
                        }
                    })
                }
                return result;
            },
            message: '您输入的班级名称已存在，请更换。'
        },
        teacherName: {
            validator: function(value) {
                var index = Number($(this).closest('.datagrid-row').attr('datagrid-row-index'));
                var className = $("#datagrid-row-r1-2-"+index+" td[field='class_name'] .easyui-textbox").textbox('getValue');
                if(className != ''){
                    if(value == '') return false;
                    if($(this).closest('.teacherName').find('.teacher_id').val() == '') return false;
                }
                return true;
            },
            message: '请选择班主任。'
        }
    });

    /* 保存班级信息 */
    function saveClass(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#error-help-message-box').html('');
        $('#save-btn').addClass('mylinkbtn-load');

        $('#fm').form('submit',{
            url: url,
            onSubmit: function(params){
                var classNameCheck = false;
                if($('.className').length > 0){
                    $('.className').each(function(){
                        if($(this).find('input.easyui-textbox').length>0 && $(this).find('input.easyui-textbox').textbox('getValue') &&
                            ! $(this).closest('tr.grade_class_right_table_tr').find('td.grade_class_right_table_td_02 input.teacher_id').val()){
                            setTooltop($(this).closest('tr.grade_class_right_table_tr').find('td.grade_class_right_table_td_02 input.textbox-text'),'show',"请选择班主任！");
                            classNameCheck = true;
                            return false;
                        }
                        if($(this).find('input').eq(0).val() &&
                            ! $(this).closest('tr.grade_class_right_table_tr').find('td.grade_class_right_table_td_02 input.teacher_id').val()){
                            setTooltop($(this).closest('tr.grade_class_right_table_tr').find('.grade_class_right_table_td_02 input.textbox-text'),'show',"请选择班主任！");
                            classNameCheck = true;
                            return false;
                        }
                    })
                }
                if($('.teacherName').length > 0){
                    $('.teacherName').each(function(){
                        if($(this).find('input.easyui-textbox').length>0 && $(this).find('input.easyui-textbox').textbox('getValue') == '' &&
                            $(this).closest('.grade_class_right_table_tr').find('td.grade_class_right_table_td_01').text() != ''){
                            setTooltop($(this).closest('tr.grade_class_right_table_tr').find('.grade_class_right_table_td_02 input.textbox-text'),'show',"请选择班主任！");
                            classNameCheck = true;
                            return false;
                        }
                    })
                }
                if(classNameCheck){
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
                    $('#error-help-message-box').html(result.errMeg);
                } else {
                    parent.window.closeWinIsReloadData = 1;
                    parent.$('#openWindow').window('close');
                }
            }
        });
    }

    // 上下方向键移动
    var teacherEditDom;
    var upDownKeySelectedTeacherIndex = 0;
    var valueTeacherData;
    function upDownKeySelected(target,index){
        $(target).datagrid('clearSelections').datagrid('selectRow',index);
    }
    //学生名称 搜索下拉 表格数据加载完成
    function teacherDataLoadSuccess(data){
        if(data.total == 0 && !$("#teacherTableBox").is(':hidden')){
            $('#teacherTable').datagrid('appendRow', { teacher_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
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

        //<div style="text-align:center;color:red">没有找到记录！</div>
        if(rowData.teacher_name.indexOf('没有找到记录') != -1){
            $('#teacherTableBox').hide(); //  下拉框隐藏
            return false;
        }

        if(rowData.length < 1){
            $('#teacherTableBox').hide(); //  下拉框隐藏
            return false;
        }

        if(teacherEditDom == undefined){
            $.messager.alert("提示","操作异常，请关闭本页面，重新打开操作！","error");
            return false;
        }

        //console.log(rowData);
        //更新数据
        teacherEditDom.find('.easyui-textbox').textbox('setValue', rowData.teacher_name);
        teacherEditDom.find('input.teacher_id').val(rowData.id);

        upDownKeySelectedTeacherIndex = rowIndex;
        $('#teacherTableBox').hide(); //  下拉框隐藏
        teacherEditDom = undefined;
    }

    //初始化表格数据
    function setTableDataHtml(tableData){
        if(tableData.length == ''){
            return false;
        }

        if($(".grade_class_tr").length > 0){
            $(".grade_class_tr").remove();
        }
        //console.log(tableData);
        //先循环 年级信息
        for(var i=0; i<tableData.length; i++){
            var html = '';
            var gradeId = tableData[i]['grade_id'];
            if($(".grade_class_tr_"+gradeId).length > 0) continue;
            html += '<tr class="grade_class_tr grade_class_tr_'+gradeId+'" grade-id="'+gradeId+'">';
            html += '<td class="grade_class_left_td grade_class_left_td_'+gradeId+'">';
            html += tableData[i]['grade_name'];
            html += '<br/><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="addTableClass(this)">添加班级</a>';
            html += '</td>';
            html += '<td class="grade_class_right_td grade_class_right_td_'+gradeId+'">';
            html += '<table class="grade_class_right_table grade_class_right_table_'+gradeId+'">';
            html += '</table>';
            html += '</td>';
            html += '</tr>';
            $("#tt").append(html);
        }

        //下拉 选项
        var selectHtml = '';
        for(var i=0; i<classTypeJson.length; i++){
            selectHtml += '<option value="'+classTypeJson[i]['id']+'" '+(classTypeJson[i]['name']=='普通班'?'selected="true"':'')+' >'+classTypeJson[i]['name']+'</option>';
        }

        //继续循环出 班级信息
        for(var i=0; i<tableData.length; i++){
            var html = '';
            var gradeId = tableData[i]['grade_id'];
            html += '<tr class="grade_class_right_table_tr">';

            if(tableData[i]['class_name'] == ''){//没有班级
                //班级名称
                html += '<td class="grade_class_right_table_td_01"><div class="className" class-index="'+valIndex+'">';
                html += '<input class="easyui-textbox" data-options="width:120" value="" validType="className" name="class_name['+gradeId+'][]">';
                html += '</div></td>';
                //班主任
                html += '<td class="grade_class_right_table_td_02"><div class="teacherName">';
                html += '<input class="easyui-textbox" data-options="width:120" value="" name="teacher_name['+gradeId+'][]">';
                html += '<input type="hidden" class="teacher_id" name="teacher_id['+gradeId+'][]">';
                html += '<input type="hidden" value="0" name="id['+gradeId+'][]">';
                html += '</div></td>';
                //班级类型
                html += '<td class="grade_class_right_table_td_03">';
                html += '<select class="easyui-combobox" data-options="width:120,editable:false,panelHeight:'+"'auto'"+'" name="class_type_name['+gradeId+'][]">';
                html += selectHtml;
                html += '</select>';
                html += '<input type="hidden" name="class_type['+gradeId+'][]">';
                html += '</td>';
                //操作
                html += '<td class="grade_class_right_table_td_04">';
                html += '<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="delTableClass(this)">删除</a>';
                html += '</td>';
                valIndex++;
            }else{ //
                html += '<td class="grade_class_right_table_td_01">'+tableData[i]['class_name']+'</td>';
                if(tableData[i]['teacher_name'] == ''){//没有班主任
                    html += '<td  class="grade_class_right_table_td_02"><div class="teacherName">';
                    html += '<input class="easyui-textbox" value="" name="teacher_name['+gradeId+'][]">';
                    html += '<input type="hidden" class="teacher_id" name="teacher_id['+gradeId+'][]">';
                    html += '<input type="hidden" value="'+tableData[i]['class_name']+'" name="class_name['+gradeId+'][]">';
                    html += '<input type="hidden" value="'+tableData[i]['class_type']+'" name="class_type_name['+gradeId+'][]">';
                    html += '<input type="hidden" value="'+tableData[i]['class_id']+'" name="id['+gradeId+'][]">';
                    html += '</div></td>';
                }else{
                    html += '<td class="grade_class_right_table_td_02">'+tableData[i]['teacher_name']+'</td>';
                }
                html += '<td class="grade_class_right_table_td_03">'+tableData[i]['class_type_name']+'</td>';

                html += '<td class="grade_class_right_table_td_04"></td>';
            }
            html += '</tr>';
            $(".grade_class_right_table_"+gradeId).append(html);
        }

        $.parser.parse($("#tt"));
    }

    function addTableClass(obj){
        $(".tooltip").remove();
        var html = '';
        var gradeId = $(obj).closest('.grade_class_tr').attr('grade-id');
        html += '<tr class="grade_class_right_table_tr">';
        //班级名称
        html += '<td  class="grade_class_right_table_td_01"><div class="className" class-index="'+valIndex+'">';
        html += '<input class="easyui-textbox" data-options="width:120" value="" validType="className" name="class_name['+gradeId+'][]">';
        html += '</div></td>';
        //班主任
        html += '<td  class="grade_class_right_table_td_02"><div class="teacherName">';
        html += '<input class="easyui-textbox" data-options="width:120" value="" name="teacher_name['+gradeId+'][]">';
        html += '<input type="hidden" class="teacher_id" name="teacher_id['+gradeId+'][]">';
        html += '<input type="hidden" value="0" name="id['+gradeId+'][]">';
        html += '</div></td>';
        //班级类型
        html += '<td  class="grade_class_right_table_td_03">';
        html += '<select class="easyui-combobox" data-options="width:120,editable:false,panelHeight:'+"'auto'"+'" name="class_type_name['+gradeId+'][]">';
        for(var i=0; i<classTypeJson.length; i++){
            html += '<option value="'+classTypeJson[i]['id']+'" '+(classTypeJson[i]['name']=='普通班'?'selected="true"':'')+' >'+classTypeJson[i]['name']+'</option>';
        }
        html += '</select>';
        html += '<input type="hidden" name="class_type['+gradeId+'][]">';
        html += '</td>';
        //操作
        html += '<td class="grade_class_right_table_td_04">';
        html += '<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="delTableClass(this)">删除</a>';
        html += '</td>';
        html += '</tr>';
        $(".grade_class_right_table_"+gradeId).append(html);
        valIndex++;
        $.parser.parse($(obj).closest('.grade_class_tr').find('.grade_class_right_table'));
    }

    function delTableClass(obj){
        setTooltop($(obj).closest('tr.grade_class_right_table_tr').find('td.grade_class_right_table_td_02 .textbox-text'), false);
        $(obj).closest('tr.grade_class_right_table_tr').remove();
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
        type = type ? 'show' : 'destroy';
        if(type == 'show'){
            obj.addClass('validatebox-invalid').closest('span').addClass('textbox-invalid');
            obj.tooltip({
                position: 'right',
                showEvent:'',
                content: '<span style="color:#000">'+text+'</span>',
                onShow: function(){
                    $(this).tooltip('tip').css({
                        backgroundColor: '#FFFFCC',
                        borderColor: '#CC9933'
                    });
                    $(this).attr('title', text);
                }
            }).tooltip(type);
        }else{
            obj.removeClass('validatebox-invalid').closest('span').removeClass('textbox-invalid');
            obj.tooltip(type);
        }
    }

    $(function(){
        var nowYear = (new Date()).getFullYear(); //当前年
        /* 所属学校 */
        $('#school_id').combobox({
            data: schoolJson,
            editable:false,
            valueField:'id',
            textField:'name',
            required: true,
            onLoadSuccess:function(){
            },
            onSelect: function(record) {
                var html ='当前学年：';
                html += '<font color="blue">'+(record.next_upgrade_year-1)+'学年（';
                html += (record.next_upgrade_year-1)+'年'+record.first_term_month+'月 - ';
                html += record.next_upgrade_year+'年'+record.upgrade_month+'月'+record.upgrade_day+'日）</font>&amp;nbsp;&amp;nbsp;';

                html += '，下次升级：';
                html += record.next_upgrade_year+'年'+record.upgrade_month+'月'+record.upgrade_day+'号';
                html += '('+(record.next_upgrade_year == nowYear ? '今年' : '明年')+')';
                $("#schoolLastText").html(html);
                setTableDataHtml(record.tableData);
            }
        });

        if (schoolJson.length) {
            $('#school_id').combobox('select', schoolJson[0]['id']);
        }

        // 老师名称 触发下拉搜索
        $(document).on('focus keyup','.teacherName .textbox-text',function(e){
            if(e.keyCode == 13 || e.keyCode == 40 || e.keyCode == 38) return false;
            teacherEditDom = $(this).closest('.teacherName');
            if($(this).offset().top + $("#teacherTableBox").height() + 90 > $(document).height()){
                $("#teacherTableBox").css({left:$(this).offset().left, top:$(this).offset().top - $("#teacherTableBox").height()}).show();
            }else{
                $("#teacherTableBox").css({left:$(this).offset().left, top:$(this).offset().top + 20}).show();
            }
            var teacherName = $(this).val();
            if(teacherName == '') $(this).closest('.teacherName').find('input.teacher_id').val('');
            $('#teacherTable').datagrid('load',{
                school_id: $('#school_id').combobox('getValue'),
                teacher_name:teacherName
            });
            valueTeacherData = teacherName;
        })

        $(document).on('keydown','.teacherName .textbox-text',function(e){
            var target = "#teacherTable";
            var data =$(target).datagrid('getData');
            if(! $('#teacherTableBox').is(':hidden')){
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

        // 老师名称搜索框 隐藏事件
        $(document).click(function(e){
            $('#teacherTableBox').hide();
        });
        $(document).on('click','.teacherName',function(e){
            e.stopPropagation();
        });
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_1" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i1_2" class="combobox-item">司南学辅1</div></div></div></body></html>