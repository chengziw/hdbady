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

<div class="easyui-layout" fit="true">



    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px; padding-top:0px;">
        
        <div style="width:558px; font-size:14px; padding:18px; padding-left:12px; font-size:13px;">
            <!-- 学生自定义资料项列表 -->
            <div>
                <div class="table-header" style="padding-bottom:12px; font-weight:bold;">学生自定义资料项设置</div>
                <table cellpadding="4" cellspacing="1" bgcolor="#dddddd">
                    <tr height="32" bgcolor="#f0f0f0">
                        <td width="140">资料项名称</td>
                        <td width="80">资料项类型</td>
                        <td width="140">默认值</td>
                        <td width="100">是否列表显示</td>
                        <td width="80"></td>
                    </tr>
                                            <tr bgcolor="#FFFFFF">
                            <td>是否深户</td>
                            <td>单选</td>
                            <td>否</td>
                            <td>显示</td>
                            <td>
                                                                    <a class="easyui-linkbutton" iconCls="icon-edit" href="javascript:void(0);" onclick="editField('/custom-field/edit.html?type=1&field=field1&sinKey=8156%252Ca%2525%25FE%25E7%25A1%25D0%25DF%2507%253E%258F%258B%25D8%255D%25FA%2524N%25F6%25B7%25A6%2597%2582%2510%25B0%25D7%2523%257C%25A9%259F%255B%2528%25B3%25BF%2526%25DC%25EA%25E9%2594%251C')">编辑</a>
                                                            </td>
                        </tr>
                                            <tr bgcolor="#FFFFFF">
                            <td>自定义资料项2</td>
                            <td>文本</td>
                            <td></td>
                            <td>不显示</td>
                            <td>
                                                                    <a class="easyui-linkbutton" iconCls="icon-edit" href="javascript:void(0);" onclick="editField('/custom-field/edit.html?type=1&field=field2&sinKey=443b%25BA%2587%2590G%257D%2517%2581W%258B%25D1%25A2%25A1%25C2%25F9%255E%7E7%2505%25DC%25CD%2598%25A5x%25A7%25D2%259E%25BE%253F%25E0%2591-%25F2%253C%257D%25D1%2502k5%25FE')">编辑</a>
                                                            </td>
                        </tr>
                                            <tr bgcolor="#FFFFFF">
                            <td>自定义资料项3</td>
                            <td>文本</td>
                            <td></td>
                            <td>不显示</td>
                            <td>
                                                                    <a class="easyui-linkbutton" iconCls="icon-edit" href="javascript:void(0);" onclick="editField('/custom-field/edit.html?type=1&field=field3&sinKey=8710%25B0%258F%25DD%25BE%25B8-%25FCA%25B0z%25E0%2527%2589%25BF%259E%25EA%25B8%25B0%25CF%25CC%25E07%25A1%25B6%25EF%25A1a%25F5q%253B%2580%253E%25BF%25B9%25F5%25D7.%25CDM')">编辑</a>
                                                            </td>
                        </tr>
                                            <tr bgcolor="#FFFFFF">
                            <td>自定义资料项3</td>
                            <td>文本</td>
                            <td></td>
                            <td>不显示</td>
                            <td>
                                                                    <a class="easyui-linkbutton" iconCls="icon-edit" href="javascript:void(0);" onclick="editField('/custom-field/edit.html?type=1&field=field4&sinKey=1e59%25F7%253A%25BCf1%25AC%2520%255B%2593%2591%258Fvn%25E30U%2584%25CD%25C9%25F0%2584%25F3%25A1%25C2%25C1%258F%25AA%25EA%25AA%2524%25CA%25FC%25E5%25BD%259CL%2585%259F%2519')">编辑</a>
                                                            </td>
                        </tr>
                                    </table>
            </div>
            <!-- 老师自定义资料项列表 -->
            <div style="margin-top: 20px;">
                <div class="table-header" style="padding-bottom:12px; font-weight:bold;">教职工自定义资料项设置</div>
                <table cellpadding="4" cellspacing="1" bgcolor="#dddddd">
                    <tr height="32" bgcolor="#f0f0f0">
                        <td width="140">资料项名称</td>
                        <td width="80">资料项类型</td>
                        <td width="140">默认值</td>
                        <td width="100">是否列表显示</td>
                        <td width="80"></td>
                    </tr>
                                            <tr bgcolor="#FFFFFF">
                            <td>自定义资料项1</td>
                            <td>文本</td>
                            <td></td>
                            <td>显示</td>
                            <td>
                                                                    <a class="easyui-linkbutton" iconCls="icon-edit" href="javascript:void(0);" onclick="editField('/custom-field/edit.html?type=2&field=field1&sinKey=b8d6%25C6A%253E%2596Y%25B8%2507%258F%25F7c%2594%25BE%25A8%25EE%25EA-%2526%259C%2590%25DA%258E%25F0J%25854%25C9n%2500%2580%2589%25D25%25B1%25B8%25EF%25AD%251F%25B7%25FB')">编辑</a>
                                                            </td>
                        </tr>
                                            <tr bgcolor="#FFFFFF">
                            <td>自定义资料项2</td>
                            <td>文本</td>
                            <td></td>
                            <td>显示</td>
                            <td>
                                                                    <a class="easyui-linkbutton" iconCls="icon-edit" href="javascript:void(0);" onclick="editField('/custom-field/edit.html?type=2&field=field2&sinKey=1822%25C9%25AB%250F%2509%251F%25E5%259C%25925%25C1%25A9%25D5%25FE%2594%2521%25CE%25EE3y%2580%2599%25D5%2504%25C7x%25A7%25D0%25FCc%259Fp%2528%7E%259C%25B6%2511R%2518%2540')">编辑</a>
                                                            </td>
                        </tr>
                                            <tr bgcolor="#FFFFFF">
                            <td>备注</td>
                            <td>文本</td>
                            <td></td>
                            <td>显示</td>
                            <td>
                                                                    <a class="easyui-linkbutton" iconCls="icon-edit" href="javascript:void(0);" onclick="editField('/custom-field/edit.html?type=2&field=field3&sinKey=8bd4H%252Cy%25C6%257F%25CB%25D6i%25C1O%253C%255BG%2595%25D8%25F3%25E5%25AA%25ADQl%251D%2500%25FF%2517%25ADg%25A12Z%2584M%25CC%25F7%25ABP8%252A%250C')">编辑</a>
                                                            </td>
                        </tr>
                                            <tr bgcolor="#FFFFFF">
                            <td>自定义资料项4</td>
                            <td>文本</td>
                            <td></td>
                            <td>显示</td>
                            <td>
                                                                    <a class="easyui-linkbutton" iconCls="icon-edit" href="javascript:void(0);" onclick="editField('/custom-field/edit.html?type=2&field=field4&sinKey=1e78%25E6%2529%253F%250E%2560%25F1%25E0c%2522z%258B%25A3lCG%25A2%2506%251F%258A2%253CY%25A2%2513c%2529%2581XI%25E1X%25B3%2520%25EE%25C6Jz%251Ft')">编辑</a>
                                                            </td>
                        </tr>
                                    </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var isReload = false;
    /* 编辑自定义资料项 */
    function editField(url) {
        if ( ! isReload) {
            openTopWindow(url, '编辑自定义资料项', 508, 428, 'closeEdit');
        }
    }

    function closeEdit() {
        isReload = true;
        window.location.reload(true);
    }
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