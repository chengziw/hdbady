<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
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


<form id="ff" method="post" style="height:568px;" enctype="multipart/form-data" data-href="/teacher/save-excel-teacher.html" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 1366px; height: 568px;">

        <div class="panel layout-panel layout-panel-north" style="width: 1366px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 6px 8px 8px; width: 1348px; height: 482px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="100%" cellspacing="0" cellpadding="8" border="0">

                <tbody><tr>
                    
                    <td>
                      	<%--  导入至：<input id="school_id" style="cursor: pointer; display: none;" data-options="panelHeight:'auto',validType:'noNull'" class="combobox-f combo-f textbox-f" textboxname="school_id" comboname="school_id"><span class="textbox combo" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" value="Dear宝贝示范幼儿园" type="text"><input class="textbox-value" name="school_id" value="1" type="hidden"></span>
						&nbsp;&nbsp; --%>
						文件来源：<input class="easyui-filebox filebox-f textbox-f" id="file" data-options="prompt:'请选择excel文件'" style="display: none;" textboxname="file"><span class="textbox filebox" style="width: 145px; height: 20px;"><a href="javascript:void(0)" class="textbox-button textbox-button-right l-btn l-btn-small" group="" id="" style="height: 20px; right: 0px;"><span class="l-btn-left" style="margin-top: -2px;"><span class="l-btn-text">选择文件</span></span><label class="filebox-label" for="filebox_file_id_2"></label></a><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="请选择excel文件" style="margin-left: 0px; margin-right: 57px; padding-top: 2px; padding-bottom: 2px; width: 80px;" readonly="readonly" value="请选择excel文件" type="text"><input class="textbox-value" id="filebox_file_id_2" name="file" type="file"></span>&nbsp;&nbsp;<a href="http://my.dearbaobei.com/teacher/download.html">不会写？请下载示例模板</a>
						&nbsp;&nbsp;
                    </td>
                    
                </tr>

            	</tbody>
            </table>

            <div id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

                <!--数据表开始 onClickRow: onClickRowBeginEdit,-->
                <div class="panel datagrid" style=""><div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 1330px; height: 358px;"><div class="datagrid-view" style="width: 1330px; height: 358px;"><div class="datagrid-view1" style="width: 31px;"><div class="datagrid-header" style="width: 31px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td rowspan="0"><div class="datagrid-header-rownumber"></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 31px; margin-top: 0px; height: 333px;"><div class="datagrid-body-inner"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r1-1-0" class="datagrid-row" datagrid-row-index="0" style="height: 25px;"><td class="datagrid-td-rownumber"><div class="datagrid-cell-rownumber">1</div></td></tr></tbody></table></div></div><div class="datagrid-footer" style="width: 31px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><div class="datagrid-view2" style="width: 1299px;"><div class="datagrid-header" style="width: 1299px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td field="ck"><div class="datagrid-header-check"><input type="checkbox"></div></td><td field="worknumber"><div class="datagrid-cell datagrid-cell-c1-worknumber" style=""><span>工号</span><span class="datagrid-sort-icon"></span></div></td><td field="name"><div class="datagrid-cell datagrid-cell-c1-name" style=""><span>姓名</span><span class="datagrid-sort-icon"></span></div></td><td field="sex_show"><div class="datagrid-cell datagrid-cell-c1-sex_show" style=""><span>性别</span><span class="datagrid-sort-icon"></span></div></td><td field="yearMonthDay"><div class="datagrid-cell datagrid-cell-c1-yearMonthDay" style=""><span>生日</span><span class="datagrid-sort-icon"></span></div></td><td field="structure_show" class=""><div class="datagrid-cell datagrid-cell-c1-structure_show" style=""><span>部门</span><span class="datagrid-sort-icon"></span></div></td><td field="duty_show"><div class="datagrid-cell datagrid-cell-c1-duty_show" style=""><span>职务</span><span class="datagrid-sort-icon"></span></div></td><td field="entry_time"><div class="datagrid-cell datagrid-cell-c1-entry_time" style=""><span>入职日期</span><span class="datagrid-sort-icon"></span></div></td><td field="phone"><div class="datagrid-cell datagrid-cell-c1-phone" style=""><span>手机</span><span class="datagrid-sort-icon"></span></div></td><td field="password"><div class="datagrid-cell datagrid-cell-c1-password" style=""><span>登录密码</span><span class="datagrid-sort-icon"></span></div></td><td field="weixin"><div class="datagrid-cell datagrid-cell-c1-weixin" style=""><span>微信</span><span class="datagrid-sort-icon"></span></div></td><td field="qq"><div class="datagrid-cell datagrid-cell-c1-qq" style=""><span>QQ号</span><span class="datagrid-sort-icon"></span></div></td><td field="email"><div class="datagrid-cell datagrid-cell-c1-email" style=""><span>Email</span><span class="datagrid-sort-icon"></span></div></td><td field="subject_show"><div class="datagrid-cell datagrid-cell-c1-subject_show" style=""><span>所教科目</span><span class="datagrid-sort-icon"></span></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 1299px; margin-top: 0px; height: 333px; overflow-x: hidden;"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r1-2-0" class="datagrid-row" datagrid-row-index="0" style="height: 25px;"><td field="ck"><div style="" class="datagrid-cell-check"><input name="ck" value="" type="checkbox"></div></td><td field="worknumber" rowspan="1" colspan="13" class="datagrid-td-merged"><div style="height: auto; width: 1244px;" class="datagrid-cell datagrid-cell-c1-worknumber"><div style="text-align:center;color:red">没有找到记录！</div></div></td><td field="name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-name"><span style="color:red;">输入不正确！</span></div></td><td field="sex_show" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-sex_show"><span style="color:;">undefined</span></div></td><td field="yearMonthDay" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-yearMonthDay"></div></td><td field="structure_show" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-structure_show"><span style="color:;">undefined</span></div></td><td field="duty_show" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-duty_show"><span style="color:;">undefined</span></div></td><td field="entry_time" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-entry_time"></div></td><td field="phone" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-phone"></div></td><td field="password" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-password"></div></td><td field="weixin" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-weixin"></div></td><td field="qq" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-qq"></div></td><td field="email" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-email"></div></td><td field="subject_show" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-subject_show"><span style="color:;">undefined</span></div></td></tr></tbody></table></div><div class="datagrid-footer" style="width: 1299px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><table id="tt" class="easyui-datagrid datagrid-f" style="display: none;" data-options="fitColumns:true,data:[],
						   onLoadSuccess: dataLoadSuccess,
						   onCheckAll: checkAllStudent,
						   rownumbers:true,checkOnSelect:false,">
                    <thead>
                    <tr>
                        <th data-options="field:'ck',checkbox:true"></th>
                        <th data-options="field:'worknumber',width:50, editor:{type:'text'}">工号</th>
                        <th data-options="field:'teacher_name',width:60,formatter: nameCall, editor:{type:'text'}">姓名</th>
                        <th data-options="field:'sex_name',width:40,
							    formatter: sexTypeCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:sexType
                            }}">性别</th>
                        <th data-options="field:'brither_name',width:65,
							    editor:{type:'datebox',options:{
                            buttons: buttons,
                            editable:false
                            }}">生日</th>
                        <th data-options="field:'structure_name',width:100,
                            formatter: structureCall,
                            editor:{type:'combotree',options:{
                            valueField:'id',
                            textField:'text',
                            editable:false,
                            formatter: function(node){node.text = node.name; return node.text},
                            panelHeight:'auto',
                            data:structureJson
                            }}">部门</th>
                        <th data-options="field:'duty_name',width:60,
                            formatter: dutyCall,
                            editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            panelHeight:'auto',
                            data:dutyJson
                            }}">职务</th>
                        <th data-options="field:'entry_time_name',width:60,
							    editor:{type:'datebox',options:{
                            buttons: buttons,
                            editable:false
                            }}">入职日期</th>
                        <th data-options="field:'phone',width:70,editor:{type:'text'}">手机</th>
                        <th data-options="field:'password',width:65,editor:{type:'text'}">登录密码</th>
                        <th data-options="field:'weixin',width:70, editor:{type:'text'}">微信</th>
                        <th data-options="field:'qq',width:70, editor:{type:'text'}">QQ号</th>
                        <th data-options="field:'email',width:70, editor:{type:'text'}">Email</th>
                        <th data-options="field:'subject_id',width:60,
                            formatter: subjectCall,
							    editor:{type:'combobox',options:{
                            valueField:'id',
                            textField:'name',
                            editable:false,
                            multiple:true,
                            panelHeight:'auto',
                            data:subjectJson
                            }}">所教科目</th>
                    </tr>
                    </thead>
                </table><style type="text/css" easyui="true">
.datagrid-cell-c1-worknumber{width:41px}
.datagrid-cell-c1-name{width:51px}
.datagrid-cell-c1-sex_show{width:31px}
.datagrid-cell-c1-yearMonthDay{width:56px}
.datagrid-cell-c1-structure_show{width:91px}
.datagrid-cell-c1-duty_show{width:51px}
.datagrid-cell-c1-entry_time{width:51px}
.datagrid-cell-c1-phone{width:61px}
.datagrid-cell-c1-password{width:56px}
.datagrid-cell-c1-weixin{width:61px}
.datagrid-cell-c1-qq{width:61px}
.datagrid-cell-c1-email{width:61px}
.datagrid-cell-c1-subject_show{width:51px}
</style></div></div></div>
                <!--数据表结束-->
            </div>

            <div style="color:red;font-size:12px; padding: 10px;" id="show-error-message-box"></div>
        </div></div>


        <div class="panel layout-panel layout-panel-center" style="width: 1366px; left: 0px; top: 497px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 1366px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-ok" onclick="saveFrom()" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导入选中的教职工</span><span class="l-btn-icon icon-ok">&nbsp;</span></span></a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">取消</span><span class="l-btn-icon icon-no">&nbsp;</span></span></a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">

    var schoolListData = eval('([{"id":0,"name":"\u96c6\u56e2\u603b\u90e8","structureList":[{"id":"2","name":"\u96c6\u56e2\u603b\u90e8","parent_id":"1","bloc_id":"1","school_id":"0","parent_str":",1,","sort_id":"2","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=58a8%2581R%25E7%257F%25E0-%2514%2516%25A38%25AE%25FE9%255EZ%2501%2512%25EA%25B8%25E0%2525%2585%25E9%25C5%250F%25A7z%2540%25EB%2598R%25F7%25C6%259F%2560i%2500%251F%25E1%25BB%2505","delUrl":"\/structure\/delete.html?sinKey=99c2K2%2588%25F8T%2590%252CY%25E6%2513%25F3%25CC%258C%25EE%258C%25CC%25BD%2592%25DE%2580%2507%25A8%25F3%25D1%25AF%25CE%25E6%2587m%2523Bn%250Ajw%251B.%253Ez%25B6%25CB","children":[{"id":"3","name":"\u884c\u653f\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"3","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=c06a%2517%25E57S%25F4%2589YK%25B9L%250D%2599tLk%25BA%2521cvZ%258E%2524%25933%25AB%2506W%2593%2508%2511%25F0%2515%25BB%251B%25D2%2585%2521%25E2%251AT%25D0","delUrl":"\/structure\/delete.html?sinKey=3ff6%25CE%25D4i%259F%25A0%2594%25CC%2511%25B5%25FE%2591%25B5%2517%2590%25C6%25E2r%25B6%25AD%25F1%25E0%25BB%250AH%25E6%253A%25BE%2509_Ra%252Bun%25863%25B6%2516g%25A8%25EF","children":[]},{"id":"4","name":"\u5e02\u573a\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"4","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=3967%257C%25A8%25AB%2588%25E4%2540%259F0%25DA%25DE%25EF%25B1%25BD%258Fq%25144k%25D0%25FDc%2513%25FCh%253D%25BC%25BC%253A%257D%25D9%2596r%25F4%2524%25F4vp%25D1%2582s%2513","delUrl":"\/structure\/delete.html?sinKey=ad7f%2507%2583%2525Q%25B5%25E1%25F2%255Ca%25B4%25BB%25E2%252B%257Ba%25DC%25B0D%2591%255C%253D%25A0%2509%25DF%25B5%25FA%25D2%253Ch%25AB7%2524%2522%25A3%25C1%2502%25DC%25A6rHh","children":[]},{"id":"5","name":"\u8d22\u52a1\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"5","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=21fd%2598%2516%25B3H%255E%25CDFp%25AB%25FF%25EFo%25F1%255C%2528%258B%255E%25B8%257D%253A%252A%25B5%25D0%253B%25F1sb%25EC%2593%251A%2528%2527%25A4%25E1%25B2%25BD%2520%2515%25A6%25B9Z","delUrl":"\/structure\/delete.html?sinKey=5334%25A0%25AA%25FE%25C6%250D%25F08%2520%25E1%2516%2512%257B%2523%25CE%25F5%25DE5%2520%25185%2507%251C%2584OU%259Ci%25DD%2585%25B8%25E6dn%2514%2516%25DF%25AD%2503C%25A7%253B","children":[]}]}],"subjectList":[]},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[],"structureList":[{"id":"6","name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","parent_id":"1","bloc_id":"1","school_id":"1","parent_str":",1,","sort_id":"1","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=a529%25F5%25AD%25B9%2588A%25E3%2503%25C5zxVO%259D%2529%25F0%25F5%2521%2598%257F%25A8%258Dh%259A%251D%258D%258D%25BA%259A%2583%2520%25D6%25C4%2527%25F1d%25AE%25AC%25BEf%2528d","delUrl":"\/structure\/delete.html?sinKey=8124%25B3%25ED%259B%25C2%25D9%25832%2560%2517%2599%25BF%251C%25176V%259E6%25EF%255E%257DV%25AA%25E4y04%25C6%25C7_rS%25F4S%25BC%2511%2509%25FA%25C1a%2506%25CC","children":[{"id":"7","name":"\u6559\u5b66\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"7","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=1dee%25D2%2540%2518%25D6%25B5%2526M%257F%259Ft%25BA%25CD%2522%2514n%2512%25C9k%25F5%25B4%25B6%25C7B%2590w6%25F3c%2529%25E5%2502%25A4%2582%2560%25B5%2588%250B%257D%25D7%25FE%253C","delUrl":"\/structure\/delete.html?sinKey=9265%25D7%251D%25A5%25A4%25ACIoMo%2540M%25CC7g%25C5%2582%25DA%259A%25E6%25F4%25E9%259B%25F88%25D6%251F%25E4%250E%25BB%2501%25A0HeJ%250E%2500Z%25FFt%2599%25E0","children":[]},{"id":"8","name":"\u4fdd\u5065\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"8","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=5f4a%25E9%25E9%250B%25EC%250B%251B%2592Sx%25F4%25B4%25CE%2580%25D5%25B3%259A%257D%2588%258A%25F6%2585%2592%25F38T%25AC%25B7%25EB%25F1%25259%25E6%259FJP%257C60%257D%25CE%2527","delUrl":"\/structure\/delete.html?sinKey=b1f8-%25F8%25B6%25F58%25B5z%25A5u%253D%2524H%25DD2%259Fp%250A%25AA%25AB%2507%2598%25E3%2522%250A%25A5%2521%25EA%25DF%25C3%255C%25C1%25CD%253F%251A%25AE%2509%25D7r8%253F%250A","children":[]},{"id":"9","name":"\u540e\u52e4\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"9","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=3459%250C%25C1%25A9b%25D4%25B6%25EA%2590%25AC%25AD%25E38Y%2518%2584%2501%253A%2505%2529%2586%2594%25BCq%25F8%25BA%2517QY%258F%2597%25D4L%7E%2588J%25EC%25E9%25C8%25F9%25C5%2595","delUrl":"\/structure\/delete.html?sinKey=f7afe%25C2%2583%25EE%25CCa%25E0%2586S%25FB%2501%25DA%2510E%25FB%2528%251D%25F1n%25C4%25DD%25F7%2582%2522%2594%25C5%25DEs%2513%25A0%2517%2584%25D8%25CC6%25C3%250D%25CD%2503%25EA%25F0","children":[]},{"id":"10","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"10","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=5223%25FF%25C5%25A9%253C%25EB%25A7aJ%2599%25C4%25B3Y%25E9%25FC%25E3%259A%2584%25FA%25F5%25EA%253CJG%253E%250C%25A3%25AB%251FO%25D7%25FB%2586%25BC%25CD%25DF%25E7%25C4%2508%25C7V%25DA%25D7","delUrl":"\/structure\/delete.html?sinKey=cf9e%2586%2525%25F8%2510%25E3%25AE%250F%25D0%25D3%25D9b%25DA%2592.f%25C5aG%25D9%257B%25B1%2508%2580%25A8%25F5%25FF%25AA%25B1%25E4%25EEL%2512%25CE%25B7%25F2%25EB%2513Q%259A%255C%25E5a","children":[]}]}],"subjectList":[{"id":"1","name":"\u97f3\u4e50","school_id":"1","sort":"1","status":"1"},{"id":"3","name":"\u8bed\u8a00","school_id":"1","sort":"3","status":"1"},{"id":"4","name":"\u5065\u5eb7","school_id":"1","sort":"4","status":"1"},{"id":"5","name":"\u793e\u4f1a","school_id":"1","sort":"5","status":"1"},{"id":"6","name":"\u79d1\u5b66","school_id":"1","sort":"6","status":"1"},{"id":"7","name":"\u7f8e\u672f","school_id":"1","sort":"7","status":"1"}]},{"id":2,"name":"Dear\u5b9d\u8d1d\u3010\u5357\u5c71\u3011\u5e7c\u513f\u56ed","gradeList":[],"structureList":[{"id":"11","name":"Dear\u5b9d\u8d1d\u3010\u5357\u5c71\u3011\u5e7c\u513f\u56ed","parent_id":"1","bloc_id":"1","school_id":"2","parent_str":",1,","sort_id":"1","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=2ab4%2522%25AC%7E%25CC%25D5i%2509%25BC%258E%252A%2540%25F7%2593%25ECJ%25E72%25C0%2594%2502SH%25E5%2526S%25BFb%250C%25834%25BEg%255BO%25B8zP%258B%2502%253C%251B%255C","delUrl":"\/structure\/delete.html?sinKey=1616%25BCec%2521%2595%2593%25C2c%25BC%2501%25B8%2516T%25C9%258C%257F4%25FE%25AC%25E6x%251D%25E5%25C6%2592%2592%25EA%253B%258F%2527%25F6%25B6H%25EF%25A4%2591%25AD3%258F%25B8%2522D","children":[{"id":"12","name":"\u6559\u5b66\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"12","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=72e0%253F%251Ev%25D3%25E5%250Azia%25D7%25A0%25A9r%2501%2507r%2528%25FA%2503%251D%2587%2510%257B4d%25C8%25C9%253D%2596d%25DF%25F4%2527%2522%25FCsJ%25F1%25A9C%2512%2515","delUrl":"\/structure\/delete.html?sinKey=e213TFR%2508%2513%25E2%250A%25E3%25DF-%25B7l%25C5%25AC%259E%25E6k%25F2%2592%25BE%253A%253C%253F%2511%2517nC%2519%259E2%25D4%2595U%25BF%25DF%2596%2597%2524%2525%25AC%25BE%255B","children":[]},{"id":"13","name":"\u4fdd\u5065\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"13","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=1ebc%25AD8%25BD%2528%258BL%25E6%25DA%252F%25CFIU%25D9%258C%25E2_L37P%25FEih%25FF%2528%25D8%25A7%2582%25C5%252B%25FDe%259D%251F%25C6%250E%2500G%25BD%25ADh%25D1","delUrl":"\/structure\/delete.html?sinKey=c90a%253Eg%25ED%25FCe%253Fh%2594%25D9%25B7%2582%25FA%250FSb%2502%25B3%25CE%259Ed%2598P%25EE%253C%2540_%251E%255D%2592%253E%2505r%25D5%259F%253A%25FD%250Cw%25FFY%2583%25C5","children":[]},{"id":"14","name":"\u540e\u52e4\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"14","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=d846%25B5%251B%2598%25A4p%2510%253B%25DB%2584a%251E%25DB%25E5frn%2526Y%25E3%2588%25A9f6m%255B%2588%25CC%2519%25BD%257D%253AC%25BB%255E%25D2z%25BF%2522D%25C1%25F5%250C","delUrl":"\/structure\/delete.html?sinKey=3835%25EE%25D3%2509%25C5U%25D0%25B0J1%25F1M%252F%251C%250D%25C2%258D%2519%2590d%25F2%25C8%2516%2505%258A%25F3%25D14%25D2%2586m%25F7%25D3%2526%257C%25A7%2517%25DD%2501IE%2513%25BE","children":[]},{"id":"15","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"15","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=c59a%25FE%25F3G%2596%25B7%25A5%2509Q%251E%253E%25AE%2596%259D%251C%25C2%2595%25AB%2599%2581%25D8%2501%25D7%25FCw%25B1T%2507_%25C2%2518%2511%2599%25A9%25A9%25C6%259E%25F9%258DPt%2581%2521","delUrl":"\/structure\/delete.html?sinKey=0ba4%25951%25B8%2595%25CF%2517%25B0%2595%25A2%25AB%25E9f%25C4%25C7%2511%2594%250DD%25FB%25B1%2581%25C5%25AC%2500%25EC%250B%2524_%25FE%25B9%25F3%2584a%25D5%2522%25B7%25C8%25F3%25C9%25B9%25C0J","children":[]}]}],"subjectList":[{"id":"8","name":"\u97f3\u4e50","school_id":"2","sort":"1","status":"1"},{"id":"9","name":"\u8ba1\u7b97","school_id":"2","sort":"2","status":"1"},{"id":"10","name":"\u8bed\u8a00","school_id":"2","sort":"3","status":"1"},{"id":"11","name":"\u5065\u5eb7","school_id":"2","sort":"4","status":"1"},{"id":"12","name":"\u793e\u4f1a","school_id":"2","sort":"5","status":"1"},{"id":"13","name":"\u79d1\u5b66","school_id":"2","sort":"6","status":"1"},{"id":"14","name":"\u7f8e\u672f","school_id":"2","sort":"7","status":"1"}]},{"id":8,"name":"\u5317\u4eac\u52b1\u5fb7\u5e7c\u513f\u56ed","gradeList":[],"structureList":[{"id":"56","name":"\u5317\u4eac\u52b1\u5fb7\u5e7c\u513f\u56ed","parent_id":"1","bloc_id":"1","school_id":"8","parent_str":",1,","sort_id":"1","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=e7f9%25E8%25D5U%2514%25DDI%2513%251A%25AA%2504v%25BF8p%25C8%25EE%25F5%25FB%25B8%258B%25C8%251D%25AFs%25AD%259D%25C8%25B0%25CF%25B6N%25DB%25D2t%258E%25E9%2501%25A4%25DA%2520K%2540","delUrl":"\/structure\/delete.html?sinKey=740a%25E9%251D%2504%25E6%25B0A%253B%2594%2511%25F2d%258C%25D2s%25F9%252C3%7E%25FF%2591%25089%252B%25BB%2582%2540%25109%25BF%25CF%25AC%25B8%253C%25DB%2599%25BA%25D1%2584%25B4%25D8%2598%2516","children":[{"id":"57","name":"\u6559\u5b66\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"57","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=dc03%25EC%25BD%258BK%25C0%2587%250A%258A%25C0%259A%25C76%258A%257F%25C8%25FDa%2522%25D0%2518q%2523%25BD%2502%2508L%250C%25C4%255EW%25DFfz%25A8%258C%25C5%25AD%2560%250F%2507Ox","delUrl":"\/structure\/delete.html?sinKey=ed04%251E%25DBQw%25FBkYI%259E%2522%255E%25BC%25806%25EA%250A1w%25CF%25C1El%258F%2593%2584%258F%2583%25ED%2586%259E%252F%2519Z%25E7%2518MyAQ%252A%25D8t","children":[]},{"id":"58","name":"\u4fdd\u5065\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"58","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=c06e%250Fz%25DEy%25D4%25AB%25F8%25F4%25DCV%25E6%25B0P%253DP%259C%25C6%250F%25FE%25A7U8%2509%25A8kYq-%2599%25BA%25FA3%25BAO-%25A0%25D3%25E5%258B%25FD%255B%25EC","delUrl":"\/structure\/delete.html?sinKey=3309Xk%25A4%253E%25D0%25A5%25A0%251A%2514%25B2%25E4l%258EB%252F%257Dm%25F5%258E%2540%2505%25F0C%2506%25F3%25EAU%253C%250Db%25D2%25DF%25ECb%251A%258F3%2594%2529Y%25D4%2525","children":[]},{"id":"59","name":"\u540e\u52e4\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"59","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=053d%25D0%25B1%25CA%25C1%2585%25BDTa%251F%25D6%251E%2588%25A5%25A2%259A%2522%259A%2580%25D6%25BD%2586%2523%255D%25DCeu%2522s%259D%25F2%255B%25ECb%7E%25E3ra%25D4%253B%2581%25C7%2589","delUrl":"\/structure\/delete.html?sinKey=c17e%25CF%25F4%25AF%25C9%2598%25A2%2504%255B%2593%258B%25FC%253E%25C7%25F3%255DH%25E8%25A3%25C6%258D%2587%25AC%258FX%255EZ2%25AD%252C%25DA%25B5PX%251D.%25CFo%25BF%25911%255DM","children":[]},{"id":"60","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"60","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=8ca9%2594%25DD%2505%258B%25A7Ag%2594%2501%2519v%25F4%25C1m%25A6%253D5g%25D4C%25A2%2525%25A4%259E%25DD%255D0%25D5%25F3%2511J%25A6%2505%2592%25E5%25D5%25939%25EFpk%2502","delUrl":"\/structure\/delete.html?sinKey=9c9b%255B%2588%2515%2597%2507%258D%25C6X%25C4%25A2%255DTc%252A%25C8N%25A3%25E4%258E%25EA%2507%252Bb%25D8M%25FE%2512d%251A%259C%250EH%25E3SE%2500%25FD%2595%2594h%25CA%25A2","children":[]}]}],"subjectList":[{"id":"50","name":"\u97f3\u4e50","school_id":"8","sort":"1","status":"1"},{"id":"52","name":"\u8bed\u8a00","school_id":"8","sort":"3","status":"1"},{"id":"53","name":"\u5065\u5eb7","school_id":"8","sort":"4","status":"1"},{"id":"54","name":"\u793e\u4f1a","school_id":"8","sort":"5","status":"1"},{"id":"55","name":"\u79d1\u5b66","school_id":"8","sort":"6","status":"1"},{"id":"56","name":"\u7f8e\u672f","school_id":"8","sort":"7","status":"1"}]}])');
    //性别
    var sexType = [{id:1,name:"男"},{id:2,name:"女"}];
    //部门
    var structureJson = [];
    var structureData = eval('([{"id":"1","name":"Dear\u5b9d\u8d1d\u5e7c\u513f\u56ed\u96c6\u56e2"},{"id":"2","name":"\u96c6\u56e2\u603b\u90e8"},{"id":"3","name":"\u884c\u653f\u90e8"},{"id":"4","name":"\u5e02\u573a\u90e8"},{"id":"5","name":"\u8d22\u52a1\u90e8"},{"id":"6","name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed"},{"id":"7","name":"\u6559\u5b66\u90e8"},{"id":"8","name":"\u4fdd\u5065\u90e8"},{"id":"9","name":"\u540e\u52e4\u90e8"},{"id":"10","name":"\u5bb6\u957f\u4e2d\u5fc3"},{"id":"11","name":"Dear\u5b9d\u8d1d\u3010\u5357\u5c71\u3011\u5e7c\u513f\u56ed"},{"id":"12","name":"\u6559\u5b66\u90e8"},{"id":"13","name":"\u4fdd\u5065\u90e8"},{"id":"14","name":"\u540e\u52e4\u90e8"},{"id":"15","name":"\u5bb6\u957f\u4e2d\u5fc3"},{"id":"46","name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed"},{"id":"47","name":"\u6559\u5b66\u90e8"},{"id":"48","name":"\u4fdd\u5065\u90e8"},{"id":"49","name":"\u540e\u52e4\u90e8"},{"id":"50","name":"\u5bb6\u957f\u4e2d\u5fc3"},{"id":"51","name":"\u5e7c\u513f\u56ed"},{"id":"52","name":"\u6559\u5b66\u90e8"},{"id":"53","name":"\u4fdd\u5065\u90e8"},{"id":"54","name":"\u540e\u52e4\u90e8"},{"id":"55","name":"\u5bb6\u957f\u4e2d\u5fc3"},{"id":"56","name":"\u5317\u4eac\u52b1\u5fb7\u5e7c\u513f\u56ed"},{"id":"57","name":"\u6559\u5b66\u90e8"},{"id":"58","name":"\u4fdd\u5065\u90e8"},{"id":"59","name":"\u540e\u52e4\u90e8"},{"id":"60","name":"\u5bb6\u957f\u4e2d\u5fc3"},{"id":"61","name":"SSS"},{"id":"62","name":"\u6559\u5b66\u90e8"},{"id":"63","name":"\u4fdd\u5065\u90e8"},{"id":"64","name":"\u540e\u52e4\u90e8"},{"id":"65","name":"\u5bb6\u957f\u4e2d\u5fc3"},{"id":"66","name":"\u4e34\u6c82\u5206\u6821"},{"id":"67","name":"\u6559\u5b66\u90e8"},{"id":"68","name":"\u4fdd\u5065\u90e8"},{"id":"69","name":"\u540e\u52e4\u90e8"},{"id":"70","name":"\u5bb6\u957f\u4e2d\u5fc3"},{"id":"91","name":"\u5929\u4f7f\u6559\u80b2"},{"id":"92","name":"\u6559\u5b66\u90e8"},{"id":"93","name":"\u4fdd\u5065\u90e8"},{"id":"94","name":"\u540e\u52e4\u90e8"},{"id":"95","name":"\u5bb6\u957f\u4e2d\u5fc3"}])');
    //职务
    var dutyJson = eval('([{"id":"1","name":"\u666e\u901a\u804c\u5de5"},{"id":"2","name":"\u4fdd\u5b89"},{"id":"3","name":"\u91c7\u8d2d"},{"id":"4","name":"\u51fa\u7eb3"},{"id":"5","name":"\u4f1a\u8ba1"},{"id":"6","name":"\u4fdd\u5065\u533b\u751f"},{"id":"7","name":"\u6559\u5e08"},{"id":"8","name":"\u73ed\u4e3b\u4efb"},{"id":"9","name":"\u5e74\u7ea7\u7ec4\u957f"},{"id":"10","name":"\u8d22\u52a1\u4e3b\u4efb"},{"id":"11","name":"\u529e\u516c\u5ba4\u4e3b\u4efb"},{"id":"12","name":"\u540e\u52e4\u4e3b\u4efb"},{"id":"13","name":"\u6559\u52a1\u4e3b\u4efb"},{"id":"14","name":"\u526f\u56ed\u957f"},{"id":"15","name":"\u56ed\u957f"},{"id":"17","name":"\u8463\u4e8b\u957f"}])');
    //科目
    var subjectJson = [];

    $.extend($.fn.validatebox.defaults.rules, {
        noNull: {
            validator: function(value, param){
                if(value=='请选择' || value==''){
                    return false;
                }
                return true;
            },
            message: '此输入项为必输项'
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
        var rs = '<span style="color:'+color+';">'+value+'</span>';
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

    //全选的时候 回调方法
    function checkAllStudent(rows){
        var rowData = rows;
        if(rowData){
            var t = $("#tt");
            for(var x in rowData){
                var noEdit = false;
                for(var i in rowData[x]){
                    var val = rowData[x][i]+"";
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

    //姓名回调方法
    function nameCall(value,row,index){
        if(! value){
            row.name = '输入不正确！';
            return setTextColor(row.name);
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
    //部门回调方法
    function structureCall(value,row,index){
        for(var i=0; i<structureData.length; i++){
            if(structureData[i]['id'] == value){
                row.structure_id = structureData[i]['id'];
                return structureData[i]['name'];
            }
        }
        return setTextColor(value);
    }
    //职务回调方法
    function dutyCall(value,row,index){
        for(var i=0; i<dutyJson.length; i++){
            if(dutyJson[i]['id'] == value){
                row.duty_id = dutyJson[i]['id'];
                return dutyJson[i]['name'];
            }
        }
        return setTextColor(value);
    }
    //科目回调方法
    function subjectCall(value,row,index){
        var text = '';
        var val = '';
        for(var i=0; i<subjectJson.length; i++){
            if(value && value.indexOf(subjectJson[i]['id']) != -1){
                text += (text == '' ? '' :',')+subjectJson[i]['name'];
                val += (val == '' ? '' :',')+subjectJson[i]['id'];
            }
        }
        row.subject_show = text ? text : value;
        row.subject = val ? val : row.subject;

        return setTextColor(row.subject_show);
    }

    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

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

        var url = $("#ff").attr('data-href');
        $('#ff').form('submit',{
            url:url,
            onSubmit:function(params){

                var teacherData = $("#tt").datagrid('getSelections');
                if(! teacherData){
                    return false;
                }

                params.teacherData = JSON.stringify(teacherData);

                var result = $(this).form('enableValidation').form('validate');
                if(!result){
                    $('#save-btn').removeClass('mylinkbtn-load');
                };
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
                }
            }
        });
    }

    /* 上传文件 处理 */
    function saveProcessFile(){
        var url = '${pageContext.request.contextPath}/teacherAction_resolveTeacher.action';
        $('#ff').form('submit',{
            url: url,
            onSubmit: function(params){
                params.fileText = 1;
                return true;
            },
            success:function(result){
                var result = eval('('+result+')');
                if(result.status == 1){
                    $('#tt').datagrid('loadData',result.info);
                    tableData = result.info;
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
            $(this).datagrid('appendRow', { worknumber: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'worknumber', colspan: 13 })
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
        $('#school_id').combobox({
            data:schoolListData,
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){
                $('#school_id').combobox("setValue", '');
                var data = $('#school_id').combobox('getData');

                if (data.length >= 2) {
                    $('#school_id').combobox('select', data[1].id);
                }else{
                    $('#school_id').combobox('select', data[0].id);
                }
            },
            onSelect:function(record){
                if(record.subjectList){
                    subjectJson = record.subjectList;
                }else{
                    subjectJson = [];
                }

                if(record.structureList){
                    structureJson = record.structureList
                }else{
                    structureJson = [];
                }
            }
        });

        $('#file').filebox({
            buttonText:'选择文件',
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

            var structureObj = t.datagrid('getEditor', {index:rowIndex,field:'structure_show'});
            $(structureObj.target).combotree( 'loadData' , structureJson);

            var subjectObj = t.datagrid('getEditor', {index:rowIndex,field:'subject_show'});
            $(subjectObj.target).combobox( 'loadData' , subjectJson);

            if($(this).find("input[name='ck']").is(':hidden')){
                t.datagrid('unselectRow',rowIndex);
            }

            e.stopPropagation();
        })

        //取消冒泡
        $(document).on('click','.combo-p',function(e){
            e.stopPropagation();
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">集团总部</div><div id="_easyui_combobox_i1_1" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_2" class="combobox-item">Dear宝贝【南山】幼儿园</div><div id="_easyui_combobox_i1_3" class="combobox-item">北京励德幼儿园</div></div></div></body></html>