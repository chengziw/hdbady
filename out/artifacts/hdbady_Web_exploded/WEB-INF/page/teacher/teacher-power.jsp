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


<form id="ff" method="post" style="height:468px;" data-href="" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 756px; height: 468px;">

        <div class="panel layout-panel layout-panel-north" style="width: 756px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 738px; height: 380px;" title="" class="panel-body panel-body-noheader layout-body">
            <div>
                <p style="color: red;">
                    配置教职工的角色权限，请到 “基础参数设置 > 角色权限设置” 中操作
                </p>
            </div>
            <!--数据表开始-->
            <div style="height: 330px;" class="panel-noscroll">
                <div class="panel datagrid easyui-fluid" style="width: 738px;"><div class="datagrid-wrap panel-body panel-body-noheader" title="" style="width: 736px; height: 328px;"><div class="datagrid-view" style="width: 736px; height: 328px;"><div class="datagrid-view1" style="width: 0px;"><div class="datagrid-header" style="width: 0px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody></tbody></table></div></div><div class="datagrid-body" style="width: 0px; margin-top: 0px; height: 303px;"><div class="datagrid-body-inner"></div></div><div class="datagrid-footer" style="width: 0px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><div class="datagrid-view2" style="width: 736px;"><div class="datagrid-header" style="width: 736px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td field="roleName"><div class="datagrid-cell datagrid-cell-c2-roleName" style=""><span>角色</span><span class="datagrid-sort-icon"></span></div></td><td field="isHave"><div class="datagrid-cell datagrid-cell-c2-isHave" style=""><span>是否具备</span><span class="datagrid-sort-icon"></span></div></td><td field="mangerName" class=""><div class="datagrid-cell datagrid-cell-c2-mangerName" style=""><span>可管理的数据范围</span><span class="datagrid-sort-icon"></span></div></td><td field="edit"><div class="datagrid-cell datagrid-cell-c2-edit" style=""><span>可使用的功能模块</span><span class="datagrid-sort-icon"></span></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 736px; margin-top: 0px; height: 303px; overflow-x: hidden;"><table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r2-2-0" datagrid-row-index="0" class="datagrid-row"><td field="roleName"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-roleName">全局管理员</div></td><td field="isHave"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-isHave"><a class="easyui-linkbutton" style="cursor:pointer; color:#000000;"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text"></span><span class="l-btn-icon icon-cancel">&nbsp;</span></span></a></div></td><td field="mangerName"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-mangerName"></div></td><td field="edit"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-edit"></div></td></tr><tr id="datagrid-row-r2-2-1" datagrid-row-index="1" class="datagrid-row"><td field="roleName"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-roleName">学校管理员</div></td><td field="isHave"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-isHave"><a class="easyui-linkbutton" style="cursor:pointer; color:#000000;"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text"></span><span class="l-btn-icon icon-cancel">&nbsp;</span></span></a></div></td><td field="mangerName"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-mangerName"></div></td><td field="edit"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-edit"></div></td></tr><tr id="datagrid-row-r2-2-2" datagrid-row-index="2" class="datagrid-row"><td field="roleName"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-roleName">班级管理员</div></td><td field="isHave"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-isHave"><a class="easyui-linkbutton" style="cursor:pointer; color:#000000;"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text"></span><span class="l-btn-icon icon-ok">&nbsp;</span></span></a></div></td><td field="mangerName"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-mangerName">司南学辅2：托管班（1209）</div></td><td field="edit"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-edit"><a onclick="functionList(2);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">功能列表</span><span class="l-btn-icon icon-chakan">&nbsp;</span></span></a></div></td></tr><tr id="datagrid-row-r2-2-3" datagrid-row-index="3" class="datagrid-row"><td field="roleName"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-roleName">财务会计</div></td><td field="isHave"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-isHave"><a class="easyui-linkbutton" style="cursor:pointer; color:#000000;"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text"></span><span class="l-btn-icon icon-cancel">&nbsp;</span></span></a></div></td><td field="mangerName"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-mangerName"></div></td><td field="edit"><div style="height:auto;" class="datagrid-cell datagrid-cell-c2-edit"></div></td></tr></tbody></table></div><div class="datagrid-footer" style="width: 736px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><table id="tt" class="easyui-datagrid datagrid-f" data-options="fitColumns:true,fit:true,pagination:false,
			   singleSelect:true" style="display: none;">
                    <thead>
                    <tr>
                        <th data-options="field:'roleName',width:60">角色</th>
                        <th data-options="field:'isHave',width:60, formatter: setIsHave">是否具备</th>
                        <th data-options="field:'mangerName',width:240">可管理的数据范围</th>
                        <th data-options="field:'edit',width:60,formatter:  rowformater">可使用的功能模块</th>
                    </tr>
                    </thead>
                </table><style type="text/css" easyui="true">
.datagrid-cell-c2-roleName{width:93px}
.datagrid-cell-c2-isHave{width:93px}
.datagrid-cell-c2-mangerName{width:402px}
.datagrid-cell-c2-edit{width:94px}
</style></div></div></div>
            </div>
            <!--数据表结束-->
        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 756px; left: 0px; top: 397px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 756px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <input name="action" value="edit" type="hidden">
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">关闭</a>
            </div>
        </div></div>
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
/**
 *
 * @param value
 * @param row
 * @param index
 */
function rowformater(value,row,index){
    var rs = '';
    if(row.isHave){
        rs += '<a onclick="functionList('+index+');" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">功能列表</span>' +
            '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
            '</a>';
    }
    if(row.isHave && row.role_type == 0){
        rs = '全部功能';
    }
    if(row.isHave && row.role_type == 1){
        rs = '';
    }

    return rs;
}

function setIsHave(value,row,index){

    return '<a class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
        '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text"></span>' +
        '<span class="l-btn-icon icon-'+(value? 'ok': 'cancel')+'">&nbsp;</span></span>' +
        '</a>';
}

function functionList(index){
    $('#tt').datagrid('selectRow', index);
    var row = $('#tt').datagrid('getSelected');
    var url = row.functionUrl;
    var title = '功能列表';
    openTopDialog(url,title,788,508);
}

$(function(){
    var data = eval('([{"roleName":"\u5168\u5c40\u7ba1\u7406\u5458","role_id":-1,"role_type":0,"isHave":0,"mangerName":"","functionUrl":"\/teacher\/show-module.html?teacher_id=16&type=0&sinKey=0f5f%25C8z%250C%2518d%25AE%250F%2590%2527%251FFv%25B4%25A6%259CF%2594-%258B%25F1%252C%2560C%2583k%2503%2583NLAS%25F7%25BE%25D4%2505%25EA%25CA%25C0%2540%25C2%2526N"},{"mangerName":"","roleName":"\u5b66\u6821\u7ba1\u7406\u5458","role_id":-1,"role_type":1,"isHave":0,"functionUrl":"\/teacher\/show-module.html?teacher_id=16&type=1&sinKey=9b23%25F3pd%25F9%25C5%252C%259C%2503%25C0%2560%251Fh%253C%25E9%25C1%25F4%25A05%251D%25EFmZ%2525%2589G%25E0%2582%25EBc%250D%252F%25CB%25C4%25F2%25EC%25F3%25C7C%25B9%25F9%2508%251A"},{"roleName":"\u73ed\u7ea7\u7ba1\u7406\u5458","isHave":1,"role_id":-1,"role_type":2,"mangerName":"\u53f8\u5357\u5b66\u8f852\uff1a\u6258\u7ba1\u73ed\uff081209\uff09","functionUrl":"\/teacher\/show-module.html?teacher_id=16&type=2&sinKey=c2f9%252Fp%25F7%25D9p%2528%2515f9%25A0%259Eh%2510%2504%2596%251B%25AD%25AA%253D%25FA%2511g%25EA%25CB%25CB%2504%25EA%258B%2514%25DER3%25D6%258E%25D7n%2508%255E%258C%25F9%253E%257F"},{"roleName":"\u8d22\u52a1\u4f1a\u8ba1","isHave":0,"role_id":"19","role_type":88,"mangerName":"","functionUrl":"\/teacher\/show-module.html?teacher_id=16&type=88&role_id=19&sinKey=b182%25160%2588%25FD%25CA%25BC%253E%255E%25E8%2560%25D2%25C2y%2597%2586%25B7%253BH%25A3%25C4%2501%250BUU%2590%25E8%25D6%7E%252A%25A2%25F15%2516%2526q%25CCN%2519%257C%2580Sq%2588"}])');
    $("#tt").datagrid({
        data: data
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
</body></html>