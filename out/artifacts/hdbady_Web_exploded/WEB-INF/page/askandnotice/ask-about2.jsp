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
    #ask_answer ul li input{padding: 2px 3px; width: 292px;margin-left:25px;}
	a{
		text-decoration:none;
	}
</style>


<form id="ff" method="post" style="height:628px;" data-href="/ask/save.html?id=7&amp;sinKey=847d%252C%25FD%259A%25A4%255E%25FB%2514P%25E0%25B6g%259D%25F8%2587%25A4%25A0%2582C%255C%251C%259D%25C6%25EF%25BC%25F3%25F1%2580%258B%253D%2500%25B6%25D7%25AF1%25A3" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 768px; height: 628px;">

        <div class="panel layout-panel layout-panel-north" style="width: 768px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 750px; height: 540px;" title="" class="panel-body panel-body-noheader layout-body">
            <input name="id" value="" class="easyui-validatebox validatebox-text" type="hidden">
            <table cellspacing="0" cellpadding="8" border="0" width="100%">
                <tbody><tr>
                    <td>
                        <div style="display: inline">
                            问卷级别：<input id="ask_type" readonly="true" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none;" textboxname="ask_type" comboname="ask_type"><%-- <span class="textbox combo textbox-readonly" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow textbox-icon-disabled" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="ask_type" value="2" type="hidden"></span> --%>
                        </div>
                        <div id="school_box" style="display: inline">
                            &nbsp;&nbsp;所属学校：<input id="school_id" readonly="true" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none;" textboxname="school_id" comboname="school_id"><%-- <span class="textbox combo textbox-readonly" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow textbox-icon-disabled" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="school_id" value="1" type="hidden"></span> --%>
                        </div>
                        <div id="targetman_box" style="display: none;">
                            &nbsp;&nbsp;推送对象：<input id="targetman_type" readonly="true" value="" class="easyui-combobox combobox-f combo-f textbox-f" data-options="panelHeight:'auto',novalidate:true" style="display: none;" textboxname="targetman_type" comboname="targetman_type"><span class="textbox combo textbox-readonly" style="width: 145px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow textbox-icon-disabled" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 119px;" type="text"><input class="textbox-value" name="targetman_type" value="1" type="hidden"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tbody><tr>
                                <td valign="top" align="left" width="60">手机推送：</td>
                                <td style="position: relative" valign="top" width="200"><div id="push_range" style="border-radius:5px;padding:4px;border:1px solid #95B8E7;  height: 258px; overflow:auto;"><ul id="pushRangeTree" class="tree tree-lines"><li><div id="_easyui_tree_1" class="tree-node tree-root-first"><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox0"></span><span class="tree-title">全校教职工</span></div></li><li><div id="_easyui_tree_2" class="tree-node tree-node-last"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">全校学生家长</span></div><ul style="display:block"><li><div id="_easyui_tree_3" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">托班</span></div><ul style="display:block"><li><div id="_easyui_tree_4" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">一班</span></div></li><li><div id="_easyui_tree_5" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">二班</span></div></li><li><div id="_easyui_tree_6" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">三班</span></div></li><li><div id="_easyui_tree_7" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">fg</span></div></li><li><div id="_easyui_tree_8" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">454</span></div></li><li><div id="_easyui_tree_9" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">四班</span></div></li><li><div id="_easyui_tree_10" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">八班</span></div></li><li><div id="_easyui_tree_11" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">苗苗班</span></div></li></ul></li><li><div id="_easyui_tree_12" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">小班</span></div><ul style="display:block"><li><div id="_easyui_tree_13" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">一班</span></div></li><li><div id="_easyui_tree_14" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">二班</span></div></li><li><div id="_easyui_tree_15" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">小班2</span></div></li><li><div id="_easyui_tree_16" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">10班级</span></div></li><li><div id="_easyui_tree_17" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">3432</span></div></li></ul></li><li><div id="_easyui_tree_18" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">中班</span></div><ul style="display:block"><li><div id="_easyui_tree_19" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">一班</span></div></li><li><div id="_easyui_tree_20" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">二班</span></div></li><li><div id="_easyui_tree_21" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">三班</span></div></li></ul></li><li><div id="_easyui_tree_22" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">大班</span></div><ul style="display:block"><li><div id="_easyui_tree_23" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">一班</span></div></li><li><div id="_easyui_tree_24" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">二班</span></div></li></ul></li><li><div id="_easyui_tree_25" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">学前班</span></div><ul style="display:block"><li><div id="_easyui_tree_26" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-checkbox tree-checkbox1"></span><span class="tree-title">大班</span></div></li></ul></li></ul></li></ul></div>
                                    <div style="height: 344px; position: absolute; top: 0px; left: 0px; width:180px;"></div>
                                </td>
                                <td style=" padding:0px;padding-left:20px; line-height:22px;" valign="top">
                                    <p style="padding:0px; margin:0px;"><label>
                                            <input name="is_repeatsubmit" checked="checked" value="0" type="checkbox">
                                            同一学生的家长只允许其中一个家长代表投票</label>
                                    </p>
                                    <p>
                                        <label>
                                            <input name="is_anonymous" checked="checked" value="0" type="checkbox">
                                            记录每个投票者的所选投票项</label>
                                    </p>
                                    <p>
                                        问卷类型：<label>
                                            <input name="is_singlesubmit" checked="checked" value="0" type="radio">多选
                                        </label>
                                        <label>
                                            <input name="is_singlesubmit" value="1" type="radio">单选
                                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看结果：<label>
                                            <input name="is_showresult" checked="checked" value="1" type="radio">允许
                                        </label>
                                        <label>
                                            <input name="is_showresult" value="0" type="radio">不允许
                                        </label>
                                    </p>

                                    <p>
                                    </p>

                                    <p>问卷标题：&nbsp;&nbsp;<input id="title" readonly="true" value="哈哈哈哈哈哈哈" required="true" style="width: 200px; display: none;" class="easyui-textbox textbox-f" data-options="novalidate:true" textboxname="title"><%-- <span class="textbox textbox-readonly" style="width: 198px; height: 20px;"><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 190px;" type="text"><input class="textbox-value" name="title" value="哈哈哈哈哈哈哈" type="hidden"></span>&nbsp;&nbsp;截止时间：<input id="end_time" readonly="true" value="2017-03-13" style="cursor: pointer; width: 100px; display: none;" class="easyui-datebox datebox-f combo-f textbox-f" data-options="novalidate:true" textboxname="end_time" comboname="end_time"><span class="textbox textbox-readonly combo datebox" style="width: 98px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow textbox-icon-disabled" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 72px;" type="text"><input class="textbox-value" name="end_time" value="2017-03-13" type="hidden"></span> --%></p>

                                    <div id="ask_answer" style="border-top:1px solid #CCCCCC; margin-top:18px; line-height:20px; padding-top:1px;margin-left:0px; width:448px; height:120px; overflow:auto;">
                                        <table cellspacing="0" cellpadding="1" border="0" width="100%">
                                            <tbody><tr bgcolor="#EFEFEF" height="26">
                                                <td>问卷选项</td>
                                                <td width="60">得票数</td>
                                                <td width="60">得票率</td>
                                                <td width="80"></td>
                                            </tr>

                                                                                            <tr>
                                                    <td>答案一</td>
                                                    <td>1</td>
                                                    <td>100.00%</td>
                                                    <td>
                                                                                                                <a href="#" class="easyui-linkbutton l-btn l-btn-small l-btn-plain" plain="true" iconcls="icon-chakan" onclick="votes('/ask/votes.html?sinKey=6575%25F8D5%259D%25AB%251F%25DE%25AB%25CA%25C8%25A4%2505%25EA_Xc%25B0%258A%252B%25D5%250Bc%25B2%25FBU%2525%25C8z%25ABz%25C1%2502%258F%25A1&amp;id=16')" group="" id="">得票详情<%-- <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">得票详情</span><span class="l-btn-icon icon-chakan">&nbsp;</span></span> --%></a>
                                                                                                            </td>
                                                </tr>
                                                                                            <tr>
                                                    <td>答案二</td>
                                                    <td>1</td>
                                                    <td>100.00%</td>
                                                    <td>
                                                                                                                <a href="#" class="easyui-linkbutton l-btn l-btn-small l-btn-plain" plain="true" iconcls="icon-chakan" onclick="votes('/ask/votes.html?sinKey=8f70%2591j%25B6%253D%2594%25E92v%2599%2517em%25BB%2597%2527%25BD%25C6x%2503M%25CEC%259E-y%25EF%259F%25CD%25C2%2500I%25C7%2519%25AA&amp;id=17')" group="" id="">得票详情<%-- <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">得票详情</span><span class="l-btn-icon icon-chakan">&nbsp;</span></span> --%></a>
                                                                                                            </td>
                                                </tr>
                                                                                            <tr>
                                                    <td>答案三</td>
                                                    <td>0</td>
                                                    <td>0.00%</td>
                                                    <td>
                                                                                                                <a href="#" class="easyui-linkbutton l-btn l-btn-small l-btn-plain" plain="true" iconcls="icon-chakan" onclick="votes('/ask/votes.html?sinKey=7ea1w%25E7%25B5%25C36%25E8%251A%25B5%25E5%2509%25D6%25B1%251EjyF%25DC%25C9%25A5E%25824%255B%253E3%2516%25C4%25B7%25A4%253D%250Bk%2522%25A7&amp;id=18')" group="" id="">得票详情<%-- <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">得票详情</span><span class="l-btn-icon icon-chakan">&nbsp;</span></span> --%></a>
                                                                                                            </td>
                                                </tr>
                                                                                    </tbody></table>

                                    </div>
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="border-top:1px solid #CCCCCC;" cellspacing="0" cellpadding="3" border="0" width="100%">
                            <tbody><tr>
                                <td valign="top" width="50%">
                                    <p>已投票人员(共<span id="user_view_num">9</span>人)</p>
                                    <!--数据表开始-->
                                    <div class="panel datagrid easyui-fluid" style="width: 346px;"><div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 344px; height: 154px;"><div class="datagrid-view" style="width: 344px; height: 154px;"><div class="datagrid-view1" style="width: 0px;"><div class="datagrid-header" style="width: 0px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody></tbody></table></div></div><div class="datagrid-body" style="width: 0px; margin-top: 0px; height: 129px;"><div class="datagrid-body-inner"></div></div><div class="datagrid-footer" style="width: 0px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><div class="datagrid-view2" style="width: 344px;"><div class="datagrid-header" style="width: 344px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td field="show_name"><div class="datagrid-cell datagrid-cell-c1-show_name" style=""><span>提交人</span><span class="datagrid-sort-icon"></span></div></td><td field="submit_time_name"><div class="datagrid-cell datagrid-cell-c1-submit_time_name" style=""><span>提交时间</span><span class="datagrid-sort-icon"></span></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 344px; margin-top: 0px; height: 129px; overflow-x: hidden;"><table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r1-2-0" datagrid-row-index="0" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的爸爸</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr><tr id="datagrid-row-r1-2-1" datagrid-row-index="1" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的妈妈</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr><tr id="datagrid-row-r1-2-2" datagrid-row-index="2" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的阿姨</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr><tr id="datagrid-row-r1-2-3" datagrid-row-index="3" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的叔叔</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr><tr id="datagrid-row-r1-2-4" datagrid-row-index="4" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的外婆</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr><tr id="datagrid-row-r1-2-5" datagrid-row-index="5" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的爷爷</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr><tr id="datagrid-row-r1-2-6" datagrid-row-index="6" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的奶奶</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr><tr id="datagrid-row-r1-2-7" datagrid-row-index="7" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的外公</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr><tr id="datagrid-row-r1-2-8" datagrid-row-index="8" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-show_name">唐一诺的其他家长</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-submit_time_name">2017-03-11 10:51</div></td></tr></tbody></table></div><div class="datagrid-footer" style="width: 344px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><table id="user_view" class="easyui-datagrid datagrid-f" style="display: none;" data-options="
                                           url:'${pageContext.request.contextPath}/askAction_findCheck.action?id=<s:property value="ask.id"/>',
                                           fitColumns:true,onLoadSuccess: userViewSuccess,
                                           singleSelect:true,checkOnSelect:true">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'show_name',width:140">提交人</th>
                                            <th data-options="field:'submit_time_name',width:120">提交时间</th>
                                        </tr>
                                        </thead>
                                    </table><style type="text/css" easyui="true">
.datagrid-cell-c1-show_name{width:131px}
.datagrid-cell-c1-submit_time_name{width:111px}
</style></div></div></div>
                                    <!--数据表结束-->
                                </td>
                                <td valign="top" width="50%">
                                    <p>未投票人员(共<span id="user_noview_num">14</span>人)</p>
                                    <!--数据表开始-->
                                    <div class="panel datagrid" style=""><div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 359px; height: 154px;"><div class="datagrid-view" style="width: 359px; height: 154px;"><div class="datagrid-view1" style="width: 0px;"><div class="datagrid-header" style="width: 0px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody></tbody></table></div></div><div class="datagrid-body" style="width: 0px; margin-top: 0px; height: 129px;"><div class="datagrid-body-inner"></div></div><div class="datagrid-footer" style="width: 0px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><div class="datagrid-view2" style="width: 359px;"><div class="datagrid-header" style="width: 359px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td field="show_name"><div class="datagrid-cell datagrid-cell-c2-show_name" style=""><span>提交人</span><span class="datagrid-sort-icon"></span></div></td><td field="submit_time_name"><div class="datagrid-cell datagrid-cell-c2-submit_time_name" style=""><span>提交时间</span><span class="datagrid-sort-icon"></span></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 359px; margin-top: 0px; height: 129px; overflow-x: hidden;"><table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r2-2-0" datagrid-row-index="0" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">文君的其他家长</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-1" datagrid-row-index="1" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">小伙伴的其他家长</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-2" datagrid-row-index="2" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">唐乐鸣的爸爸</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-3" datagrid-row-index="3" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">唐乐鸣的妈妈</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-4" datagrid-row-index="4" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">陈婷的爸爸</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-5" datagrid-row-index="5" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">唐杨杨的妈妈</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-6" datagrid-row-index="6" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">曾小星的叔叔</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-7" datagrid-row-index="7" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">曾小星的外公</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-8" datagrid-row-index="8" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">龙小花的爸爸</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-9" datagrid-row-index="9" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">龙小花的妈妈</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-10" datagrid-row-index="10" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">陈小二的爸爸</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-11" datagrid-row-index="11" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">陈小二的妈妈</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-12" datagrid-row-index="12" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">陈小二的叔叔</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr><tr id="datagrid-row-r2-2-13" datagrid-row-index="13" class="datagrid-row  "><td field="show_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-show_name">陈小二的阿姨</div></td><td field="submit_time_name"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-submit_time_name">未提交</div></td></tr></tbody></table></div><div class="datagrid-footer" style="width: 359px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><table id="user_noview" class="easyui-datagrid datagrid-f" style="display: none;" data-options="
                                           url:'${pageContext.request.contextPath}/askAction_findNoCheck.action?id=<s:property value="ask.id"/>',
                                           fitColumns:true,onLoadSuccess: userNoviewSuccess,
                                           singleSelect:true,checkOnSelect:true">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'show_name',width:140">提交人</th>
                                            <th data-options="field:'submit_time_name',width:120">提交时间</th>
                                        </tr>
                                        </thead>
                                    </table><style type="text/css" easyui="true">
.datagrid-cell-c2-show_name{width:131px}
.datagrid-cell-c2-submit_time_name{width:111px}
</style></div></div></div>
                                    <!--数据表结束-->
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 768px; left: 0px; top: 557px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 768px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <!--<a href="#" id="save-btn" class="easyui-linkbutton" iconCls="icon-save" onclick="saveFrom()">保存</a>-->
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">关闭</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>

<script type="text/javascript">

var schoolJson = eval('([{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[]},{"id":7,"name":"\u5e7c\u513f\u56ed","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]},{"id":9,"name":"\u53a6\u95e8\u9752\u82d7\u5e7c\u513f\u56ed","gradeList":[]},{"id":10,"name":"\u4e34\u6c82\u5206\u6821","gradeList":[]},{"id":13,"name":"\u53f8\u5357\u5b66\u8f85","gradeList":[]}])');


var askAllowClassJson = eval('([])');

var askAllowSchoolJson = eval('([1])');

function userViewSuccess(data){
    $('#user_view_num').html(data.total);
}

function userNoviewSuccess(data){
    $('#user_noview_num').html(data.total);
}
/**
 * 通知级别 切换 获取推送范围
 */
var getPushRangeStatus = 1;
function getPushRange(id,schoolId){
    var schoolId = schoolId == undefined ? 0 : schoolId;
    $('#push_range').html('');
    var url = '/ask/get-push-range.html';
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
            $('#push_range').html(html);
            if(setEasyUiTree){
                $('#pushRangeTree').tree({
                    data:data,
                    idField:'id',
                    textField: 'text',
                    animate:true,
                    checkbox:true,
                    lines:true,
                    formatter:function(node){
                        node.text = node.name;
                                                        if(askAllowSchoolJson.length>0 && node.pid == 0 && node.id == 0){
                                    node.checked = true;
                                }
                                if(askAllowClassJson.indexOf(parseInt(node.id)) != -1 && node.pid == 2){
                                    node.checked = true;
                                }
                                                return node.text;
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
        html += pid != 2 ? '<div class="pushRange'+pid+'" pid="'+pid+'">' : (pid == 2 && i == 0 ? '<div
 class="pushRange'+pid+'" pid="'+pid+'">' : '');
        html += '<label>';
        html += '<input type="checkbox" class="push_range" name="push_range'+pid+'['+data[i]['id']+']" value="'+data[i]['id']+'">';
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

/**
 * 得票详情
 * @param url
 */
function votes(url){
    var url = url;
    var title = '得票详情';
    openTopDialog(url,title,398,398);
}

$(function(){
    $(document).on('click','input[type="checkbox"]',function(){
        return false;
    });
    $(document).on('click','input[type="radio"]',function(){
        return false;
    });

    $('#school_id').combobox({
        data:schoolJson,
        editable:false,
        valueField:'id',
        textField:'name',
        required: true,
        novalidate:true,
        value:'1',
        onLoadSuccess:function(){
            //school_Id.combobox("setValue",'请选择学校');
        },
        onSelect:function(record){
            $('#targetman_box').hide();
            ask_type.combobox('setValue',2);
            getPushRange(2,record.id)
        }
    });

    /* 通知级别 */
    var askTypeData = [
        {id:1,name:"集团级通知"},{id:2,name:"学校级通知",selected:true}    ];
    var ask_type = $('#ask_type').combobox({
        data: askTypeData,
        editable:false,
        valueField:'id',
        textField:'name',
        value:'请选择通知级别',
        onSelect:function(record){
            if(record.id == 1){
                $('#school_box').hide();
                $('#targetman_box').show();
                getPushRange(record.id);
            }else if(record.id == 2){
                $('#school_box').show();
                $('#targetman_box').hide();
                $('#push_range').html('');
                if(parseInt(school_Id.combobox("getValue")) > 0){
                    getPushRange(2,school_Id.combobox("getValue"));
                }
            }
        }
    })

    /* 推送对象 */
    var targetmanTypeData = [
        {id:1,name:"仅家长",selected:true},{id:2,name:"仅教职工"},{id:3,name:"教职工和家长"}    ];
    var targetman_type = $('#targetman_type').combobox({
        data: targetmanTypeData,
        editable:false,
        valueField:'id',
        textField:'name',
        value:'请选择推送对象'
    })

    $(document).on('click','input.push_range',function(){
        var pid = $(this).closest('div').attr('pid');
        var objDiv = $(this).closest('div.pushRange'+pid);
        var checked = $(this).prop('checked');
        switch(pid){
            case '0':    //一级 推送范围
                if(checked){
                    objDiv.find('input.push_range').prop('checked',true);
                }else{
                    objDiv.find('input.push_range').prop('checked',false);
                }
                break;
            case '1':    //二级 推送范围
                if(checked){
                    objDiv.find('input.push_range').prop('checked',true);//所有班级选中
                    //如果全部年级选中了， 勾选学校
                    var is_all1_check = true;
                    objDiv.closest('div.pushRange0').find('div.pushRange1').each(function(){
                        if(!$(this).find('input.push_range:eq(0)').prop('checked')){
                            is_all1_check = false;
                        }
                    })
                    if(is_all1_check){//勾选学校
                        objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',true);
                    }
                }else{
                    objDiv.find('input.push_range').prop('checked',false);  //所有班级取消选中
                    objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',false);//取消学校选中
                }
                break;
            case '2':    //三级 推送范围
                //如果全部班级都选中了， 勾选年级
                if(checked){
                    var is_all2_check = true;
                    objDiv.find('input.push_range').each(function(){
                        if(!$(this).prop('checked')){
                            is_all2_check = false;
                        }
                    })
                    if(is_all2_check){ //勾选年级
                        objDiv.closest('div.pushRange1').find('input.push_range:eq(0)').prop('checked',true);
                        //如果全部年级选中了， 勾选学校
                        var is_all1_check = true;
                        objDiv.closest('div.pushRange0').find('div.pushRange1').each(function(){
                            if(!$(this).find('input.push_range:eq(0)').prop('checked')){
                                is_all1_check = false;
                            }
                        })
                        if(is_all1_check){//勾选学校
                            objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',true);
                        }
                    }
                }else{
                    objDiv.closest('div.pushRange1').find('input.push_range:eq(0)').prop('checked',false);//取消年级选中
                    objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',false);//取消学校选中
                }
                break;
            default :
                break;
        }
    })

    $(document).on('click','#add_ask_answer_input',function(){
        var html = '';
        html += '<li><input class="ask_answer_input textbox" name="ask_answer_input[]" value="">' +

            '<a href="javascript:;" onclick="del(this);"> -删除</a></li>';

        $('#ask_answer ul').append(html);
    })

    /** 编辑默认 **/
            $('#targetman_box').hide();
        getPushRange(2,1);
    })
</script>


<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>
</body>
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
</html>