<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

    <div region="north" border="false" style="padding:10px;height:48px; padding-top:16px; padding-bottom:0px; overflow:hidden;">

        <!--工具按钮和筛选栏目开始-->
        <div id="tb" class="easyui-layout" fit="true" border="false">

            <!--工具栏开始-->
            <div id="main_body_tool" region="west" style="width:86px; padding-right:0px;" border="false">
                <!--<a href="#" onclick="javascript:openParentWindow();return false;" class="easyui-linkbutton" iconCls="icon-help">打开父类窗口</a>-->
                                    <!--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="addClockTeacher('/clock-teacher/add.html');">手工录入考勤信息</a>不使用，录入在手机APP端-->
                                <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-daochu" plain="false" onclick="outExcel();">导出</a> -->
            </div>
            <!--工具栏结束-->

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：
                <input id="structure_id" name="structure_id" value="" class="easyui-validatebox" data-options="novalidate:true, width: 180">
				&nbsp;&nbsp;考勤日期：
                <input id="date" name="date" class="easyui-validatebox" data-options="novalidate:true, width: 100" value="2017-03-17">
                <input id="check_status" name="check_status" class="easyui-validatebox" data-options="novalidate:true, width: 100,panelHeight:'auto'" value="">
               
                <input id="teacher_name" name="teacher_name" value="" class="easyui-textbox easyui-validatebox" data-options="novalidate:true, width: 120, prompt:'请输入教职工姓名'">
                <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="closeReload();return false;">查询</a>
            </div> 
            <!--筛选条件结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->
    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">

        <!--数据表开始-->
        <table id="tt" class="easyui-datagrid"
               data-options="fitColumns:true,fit:true,pagination:true,
               singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true,
               onLoadSuccess: dataLoadSuccess,
       		   url:'${pageContext.request.contextPath}/teacherCheckAction_pageQuery.action',method:'get'">
            <thead>
            <tr>
            	<th data-options="field:'school_name', width:0"></th>
             	<th data-options="field:'teacher_name', width:80, formatter:setTeacherName">姓名</th>
                <th data-options="field:'sex_label', width:60, formatter:setSexName">性别</th>
				<th data-options="field:'phone', width:100, formatter:setphone">联系手机</th>
                <th data-options="field:'structure_name', width:160 , formatter:setStructureName">所在部门</th>
                <th data-options="field:'duty_name', width:80, formatter:setDutyName">职务</th>   
                             
                <th data-options="field:'date_label', width:100">考勤日期</th>
                <th data-options="field:'arrive_time', width:120,formatter: setArriveColor">上班时间</th>
                <th data-options="field:'leave_time', width:120,formatter: setArriveColor">下班时间</th>
                <th data-options="field:'note',width:70">备注</th>
                <th data-options="field:'edit',width:230, formatter: formatOper">操作</th>
            </tr>
            </thead>
        </table>
        <!--数据表结束-->

    </div>

</div>


<script type="text/javascript">
    var hasEditPermission = 'true';
    hasEditPermission = eval('('+hasEditPermission+')');

    var rootStuctureId = '"1"';
    rootStuctureId = eval('('+rootStuctureId+')');

     var structureJson = '[{"id":"1","name":"\u5168\u90e8\u90e8\u95e8","parent_id":"0","bloc_id":"1","school_id":"0","parent_str":"","sort_id":"1","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=394d%258E%259B%2529%25CA%25EA%2512%25118%258D%25D1%25AB%259D%2501%251E%250B%255D%255EM%25EF%2580%25F6%250C%250E%7E%2598%25D0%25E3%25AC%25F8%25DD2%25F1%255D%2510%25D01A%25BCx%25D8%251E","delUrl":"\/structure\/delete.html?sinKey=d470q%2516%251E%253F%25A5%25EE%25D8%25E0%25850%2560%25D1y%25C8N%25D2%25AA%25EA%2528%2513%25B0%25E2%251ANe%259C%250E%25DEQ%251B%25AB%7E_%259F%25FF%25BF%25BA%25C3%2589%2583I","children":[{"id":"2","name":"\u96c6\u56e2\u603b\u90e8","parent_id":"1","bloc_id":"1","school_id":"0","parent_str":",1,","sort_id":"2","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=b81a%25E7%25B0Iej%25C8%253C%253B%25969%252F%25C5%251Fs%25FD%2592%25B9%25A09%25A9%25D8%25F2F%25C2%25AF%25BE%25CC%25F4%2505D%2505685%25AD%2502d%25F0%25B6g%25DE","delUrl":"\/structure\/delete.html?sinKey=57f7%25C9%258A%2580%253CF%2560%2587%25F4%2529Yh%2508%25B8%2597l5%25D5%2503%25FA%25CCUEE%25C3%2591%25F1%252A%2515%25BE%252F%250D%255B%25F0%2587%25F4%257C%25DE%2515%25FD%255D%25AC","children":[{"id":"3","name":"\u884c\u653f\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"3","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=6c49.p-%2586%25E4%25D4%2596%25C1%25D4v%25B6l%2522%25D3%25A5%25BF%2580%2501%25D5%259C%2521%25DDX4%25CB%2585%2517%25DD%25EFC%25FBf0y%259B%25B9%2528%250C%252B%25A5%25BE","delUrl":"\/structure\/delete.html?sinKey=adb9%25BA%25C0%2513%2508%259D%253A%258E%25C3%25DD%2599%259E%2589%25A6%25B9g%25D7%2593Oo%2520%257B%25B4%2599%255D%25CA%250E%251B%25E7_%25D2%25B6%25CC%25A6%25D3wx%25BC%259C%25E1%25E1-","children":[{"id":"137","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"3","bloc_id":"1","school_id":"0","parent_str":",1,2,3,","sort_id":"137","create_time":"1486702753","updateUrl":"\/structure\/save.html?sinKey=8389Q%25ED%259A%2595%25FB_%255D%259C7%2501W%257C%25C9Cb%2514%25BD%25E2%25146%25FE%2523%251B%2591%255B%25A6%25A3%25E1W%2540%25E3Wn%25DE%252F%252F%25AB%25D6%25C8%25B5%2513%2519%2591","delUrl":"\/structure\/delete.html?sinKey=e1f0%252A%25FEF%2560%25D4%25E8%25D5%25D0%258A%25AA%2514%253D%253F%25C2%25E42G%25A5%2527M%25EA%259D%25DCr%2587%2528%25AA%25B73%2510%2509%25AE6%25F3%25DEB%25A72%25CAH%2540%25E5X","children":[{"id":"172","name":"\u65b0\u589e\u5b50\u7c7b1","parent_id":"137","bloc_id":"1","school_id":"0","parent_str":",1,2,3,137,","sort_id":"172","create_time":"1486778502","updateUrl":"\/structure\/save.html?sinKey=d6c9%25A4%2510%25B4%2599V%25C4%2580%259E%25F0m%25DD%2583b%257B%258C%25845%2588T%25EF%250B%25E8%25F4%25A4Y_7%250B%7E%25DF%253A%25DC%2504%2580%251A%253C%2502T%25DE%2508%25C2%259Ai","delUrl":"\/structure\/delete.html?sinKey=19fd%2589%25AC%2540%250D%257D%2522%25F5%250B%25AB%25CE%251E%25A9%2509.P%251C%258D%25C5%25F8%25D5%25A3%250C%25FF%2585-%25CF%25F5%25FF%25B4%25D6%25F5%2598cI%25E4%250F%2505%255Co%2521%25B6%250B%2506","children":[]}]},{"id":"174","name":"\u6211\u8272\u6f06","parent_id":"3","bloc_id":"1","school_id":"0","parent_str":",1,2,3,","sort_id":"174","create_time":"1486783332","updateUrl":"\/structure\/save.html?sinKey=bb00%2560%25C6%25F6%2581%25967%25B0%25C8e%2590%25B8m%257D%2596%253A%2504%25B3%2511%250C%2515P%25D1%25E1%257D%25BB%255C%2511%2501%25F9%25B8%2587%252A9l%250B%258A%25AA%25C7%2589%25D7%250BG%2599","delUrl":"\/structure\/delete.html?sinKey=c5f2%251EM%258B%25DEd%2560cD%25E6%25EC%25B5%2510%25B4T%259A%258C%2599K%25A6%25B2%2503y%2523W%2507%25F9%25CC%25DBc%2514%2525l%25FC%255Eo%2596%2581%2592%255B%25FA%25F7w%251C","children":[]}]},{"id":"4","name":"\u5e02\u573a\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"4","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=700b%2509%2585%25A7%2540%25BD%25D5%25D9%25ED%253A%2591%25B3%25C37%25D1%25CE%259D%7E%2582%251FE%2580.A%25D1%25D6%25E3%251C%2505%25CFu%2508%2598%2510%7E%25F4f%25F1%25C0%25C4%253B%25FD","delUrl":"\/structure\/delete.html?sinKey=2e23%2519%253F%25EB%2593I%251AcD%259B%25EF5%25E4%258F%2510r%2524%2527%25A0%25A5%255E3%25CC%2512%25D0%2596%2598%259C%25AD%250C%25F9d%252F%259Ej%250D%251B%25C4%2517%2502Nt","children":[{"id":"170","name":"\u65b0\u589e\u5b50\u7c7b1","parent_id":"4","bloc_id":"1","school_id":"0","parent_str":",1,2,4,","sort_id":"170","create_time":"1486741282","updateUrl":"\/structure\/save.html?sinKey=933f%251C%258C%2585%25CC%2585%258D%2594%25EDg%2510%257D%257BK%259F%25C0%258F%25CA%25F7%25B0%25A8KV%2502%25C4w%2587m%25BB%253F%25CD%2580%2597%250CA%2505%2587%25E7%25E2%25BC%25BA%2506Gd","delUrl":"\/structure\/delete.html?sinKey=493e%25BA%2512%25AE4%2596%2513%25EC%2560n%25F0%2594%25FAQ%25DA%25AC%25FA%2500%2524%25D9%25FA%251A%25B9.%252Cq%25A6%251F%25F5%251A%255B%25ED%25E2%2599%25EB%253A%258E%2501%2581%25D0z%25B88%2599","children":[{"id":"171","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"170","bloc_id":"1","school_id":"0","parent_str":",1,2,4,170,","sort_id":"171","create_time":"1486778481","updateUrl":"\/structure\/save.html?sinKey=36b5o%2584%255DAK%252B%25B3z%2522%257B%25DF%259F%2505Z%25EEOu%25B3%258C%251C3%25E1%259Ad%25A1%25DE%2515%25A0%25E5i%25AD%2595%2596%25EAE%2514%25D3%25C3%25DB%252F%25D8%255DO","delUrl":"\/structure\/delete.html?sinKey=62ed0%25EE%25EC%25D8%2504%25D1I%259F%2513%25B2%25B6%253B%25F8%2581%2585%2512S4%25A4%2513%25EA%25E5%2588%250A%25F0pm5c9%2525%2520%25BF%25E7M%25F2%25F0%25E3z%25B5%250E%25EA%25A6","children":[]},{"id":"175","name":"\u65b0\u589e\u5b50\u7c7b11","parent_id":"170","bloc_id":"1","school_id":"0","parent_str":",1,2,4,170,","sort_id":"175","create_time":"1486783690","updateUrl":"\/structure\/save.html?sinKey=82aed%250C%25F9%25F8%2506%2512%253F%25DD%258A%250D%258A%25EA%2511%25A4%2511%25E8p%25FF%2512%2589%25D0%25015%253Af%250F%2504%25C5%25D8z%257B%251E%25B03%25C0%25ED%250B%25CB%2594%25A4%2521%25F8%25B0","delUrl":"\/structure\/delete.html?sinKey=59b1%25BE%25AE%2513%2593%25E8%25C7%25A7%25D8%25E0%25CD%25E0%25BF%25CDd%259A%2590%2526%25FA%2514%253C%25A0%25A9%2519Q%2590%25EB%259E%25D9E%25F8%25AD%25A3%25FA%25221%2520%25BE%25C7%25B99Q%2507d","children":[]}]}]},{"id":"5","name":"\u8d22\u52a1\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"5","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=290a%25F2%2504G%2519%259E%25F7%2589%2511%258E%7E%25C9%259DezTt%25B1%2594k%251F%2509%25AD3%25B9%25FB%257D%251C%25B5%2597%25C5%25E7%25D90%25A2%25AE%255D%250FKZ%25C7%259A","delUrl":"\/structure\/delete.html?sinKey=66a8%253F%2560%2525%25C5.%259Bn%2519A%25DA%25E5_l%2590%25A0%25A4%25BE%2500%2593%258F%25FB%2519%25FF%253F%25F5%259A%2515%25FF%25FB%25CC%25F0%2504%25DF%250D%25CC%25DADx%25BD%2580%255D","children":[]},{"id":"173","name":"\u65b0\u589e\u5b50","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"173","create_time":"1486781279","updateUrl":"\/structure\/save.html?sinKey=2c9b%25C2n%25E8%251F%25DD%25CB%250E%25FD%25FE%259B%25E42koH%2589%25C0%25F3y%2507%25BD%25DC%25ADtq%25DC%251B%257F%25F5%25BA%25D7%2560%257F%255C%2513%25CF%251D%2515%25F4%25D4%2560%25ED%25B4","delUrl":"\/structure\/delete.html?sinKey=b878%2540%253BF%2507pX%25C1y%25DC%25B0K%2598%25B8E%258EmxI%2599%2514%2590%258C%2590%2593X%25B2%25BE%25C0%25D3%25F5z%2511C%25F3j%2501%251F%258A7%253AK%25E9c","children":[]},{"id":"176","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"176","create_time":"1486783943","updateUrl":"\/structure\/save.html?sinKey=62c5%25DF%2593%2583%2520%2502%2584%2512%25DC%25EE%25F0%2500%25A1%25E3%253A%25E1l%253C%2587%2599%25CFE%25BC%251D%255CP%25DD%25A7%259Ft1%251F%2560%25B3d%25834%25C4%25C4MT%25B4%25ECc","delUrl":"\/structure\/delete.html?sinKey=77ba%25F3g%2595%257DZM%25DCZ3j%257F%25BBo%25E9%259EGaq%25D5%25D1%25A9%250C%25BF%255E%259C%25AA%258E%25CE%2502%25C0%2526%25E5%25AD%259Bx%251F%259Ec%25EEa%25FD%25DB%25BB","children":[]}]},{"id":"6","name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","parent_id":"1","bloc_id":"1","school_id":"1","parent_str":",1,","sort_id":"1","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=297f%25D9%25A8%2597%2592l%25BC6L%2525%255C%25F9%2592%259AN%257BxO%25A1%2518%25A9%25F9%25B4%25F2n%25FAj%25F8v%2508%25AD.%251C%7E%251A%25CFh%253C%25D4%25A7a%25B3","delUrl":"\/structure\/delete.html?sinKey=1438%25084i%2526-%251F%25B2%2581%2517%2500%2522GC%25D7%25FFj-%25B0%25CC%252F_%25C1O%25A3e%257C%252Fg%25C7%253F%258E%2582%25181%2504%25B3%255D%25FD%25B2%2540w","children":[{"id":"7","name":"\u6559\u5b66\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"7","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=98bb%2517%25B87%25EBJppA%25DB%251F%2525%2511%2510%2512zf%251A%25BF%2510N%25A0%25E9D%255E%255D%258F%2519%2523oa%2591z%2516%252F%25A82AA%251E%2509q","delUrl":"\/structure\/delete.html?sinKey=68a5yH%25C1%25DF%25F4%25BBDT%255D%25D5%25E8%25A4%25BB%25F6%25E5%25FA7%25AC%25F1LHQ%25F3%25F6%25B7%2596S%257CO%2595G%25E41%25FD%25E2%258A%25D1%252C%25B24%255D","children":[]},{"id":"8","name":"\u4fdd\u5065\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"8","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=134d%25F2%25F9%25861%25B2%25F9A%25E3%2528%7E%2594%25CEZ%255B%25CC%25E7%259DY%2597%2506%250E%25A5%258Fo%2503%25F0%2593%25BF%25F1%25E3ibXZ%25AD%2527%25F4%2517%25AB%253C%25BC","delUrl":"\/structure\/delete.html?sinKey=29b2%25BF%25AC%251F%25B3%25081R%25853B%25E7N%25DD%25F1%25F8%25FDM3%2582%2592%25A3%25BF%255Ds%25A5%2540_%25D5%251D1%25D2%2586%2522%25CD%25BA%25EF%2518Q%253F%25F6%2501","children":[]},{"id":"9","name":"\u540e\u52e4\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"9","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=3e5br%25A9%250C4%25F9e%2506%2524o%251ED%25BB%25E5%253D%2584%2508%258D%25A7%25BB%2599%25D3%25B9hFX%25CE%2521G%25AF%25F2I4%251E%25A3%258F%25D9%250D%2586%2502%259A%2521","delUrl":"\/structure\/delete.html?sinKey=fd65%25C4%25E9%251B%25FC%253A%250D%2599%257C8Ed%25FD%25C2%25DA%25273%25DDG%2592%25BD%2520%25E6%255C%2560%2513%259A%25E5%25E1%25E1%2507%255D%259B%25B8%25CF%2506%25AF%25EA%2585%25FE%252C%251E","children":[]},{"id":"10","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"10","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=9b40x%25A4%25AB%25DE%25FDZw%25E8%2514%25E1%25C5%2524e%25A6%25C33C%253F%259D%251F%25D5x%2507%253A%25BF%25CEO%25B2u%25AC%2512%25FA%2512%255B%25BC%257D%2587%25A9%250D%2596%253E%2518","delUrl":"\/structure\/delete.html?sinKey=e9fdR%25A5%25AD%25C8%2513%2582%259C%25A6%25A6%25F4%2591%250A%25EE%25C8%2582%25E0%25A4%25BC%25F5%251F%25E2%258C%252Fz6%250A%255E%2500y%25E6R%25EC%25EF%250Fek%25E4%2589%25C1%2590V%2585","children":[]}]},{"id":"11","name":"\u53f8\u5357\u5b66\u8f852","parent_id":"1","bloc_id":"1","school_id":"2","parent_str":",1,","sort_id":"1","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=6e08%25A1%2510%25B9%25E9%251C%253C%25DBp%2509%25D4%25ACNL%259D%251AC_%25F4%25D4%252Bl%25FA%259B%252F%25C2%25C9%2506%25D8%25C6%2517%25C5%25A1i%2526%25DF%25AF%25EB%253Dp%258C%25C5%25D9","delUrl":"\/structure\/delete.html?sinKey=4bbe%2560N%2526%25EC6%25ED%258E7%252A%25DD%25ADQ%25F9%2523%25ED6%255B%25A2%258C%25AF%25CD%25B8%25A9%2506gp9ow%25C1%2513D%25F6%2583%250A8%2528%251B%25F7v%25EDv","children":[{"id":"12","name":"\u6559\u5b66\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"12","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=be44%25C0%25AB%25CD%7E%2502%2585%25F7K%25BB%2509E%2583z%25A8%25A2%25BE0%252A%25DD%250D%250A%25FC%250E1%258B%2524%25F4%25DD%25A8%25CE%258EY%2505%2503%25E4j%2593%25E6Y%25AEK5","delUrl":"\/structure\/delete.html?sinKey=89c66%25BB%25E1%25F0_%25B9%25D6v%258B%2590%2592%2515%259B%25D0Z%25E2a%25B1%250Fy%25F8%251E%25B3m%25C1_%257DWr%2599Ad%25F0%252F%2508%25FB%2510Uj%250C%253D-","children":[]},{"id":"13","name":"\u4fdd\u5065\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"13","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=e2e0%25D3%25D4%25CE0%25F5%25B4%2512%25C4%25EBn%2524%2503%25D1%2597%251F%2512%25F0%2500%25F6%259C%25AE%25EF%2515%2594f%25D9W%25EE%2560%25EEl%25CD%2507%2540y%25C4%25B3%2509%25216U%2598","delUrl":"\/structure\/delete.html?sinKey=03fd1%258E%25C8%2587%7E%25C0%257B%250F%25BE%2520%25D1%253E%25C7%25F3%2596%25C3%2540i%25D9H%258E%2518%25FEJ%25E8f%25D9%2519%2589%25F4B%25C5%25BC%25C8%25D0%251D%25CE%258FD%25A9%258F%2595","children":[]},{"id":"14","name":"\u540e\u52e4\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"14","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=1966%25E4%252B%2594%2588%25B7-%25E6aj%25EC%25D0%25AB%250B8%2592%25C8%2586x%2522%2540t%2511yT%25A5%2527%25D4%2586%2582R%252F%25B6%25ABr%25A9%25C5%25BC%25CC%25B0%25C2%25CF%2599","delUrl":"\/structure\/delete.html?sinKey=ea51%25C6%25EE%25AC%2510%2517%25C5%25D9%250C%251A%25E2%25A4%2514n%253BdZ%251D%259B%2595%2587%2522e%250A%25C1%2589B%2519Gyk%2519%250C%2595%25AC%25ACL%25BF%2592%25FE2L%25B4","children":[]},{"id":"15","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"15","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=77ae%25EC%25BA%25B5%2513t%25E1%25B7%25D4%25CF%25BC%25C4%25F1%2599%2514%25EA%2517%25E1%25B9%2509%25FB%25EB%25E00%259A.%25A2%25FEO%25CF%25FC%257C%258Eg%25BE%25FD%2587KA%25EA5%25F9%25F3","delUrl":"\/structure\/delete.html?sinKey=93fc%2523%25F6%2524%2592b%25811%2523%25A3h%25FA%25F5%25E1%25E0%253E%2522%259F%2516%25887s%25F8%25A7%25A8z9%25EB%2595%2588%25F7%25A75%25F8%250C%25E1%250E%25BF%25A1b%25B5%25B7%25C1","children":[]}]},{"id":"56","name":"\u53f8\u5357\u5b66\u8f851","parent_id":"1","bloc_id":"1","school_id":"8","parent_str":",1,","sort_id":"1","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=0a42S%25D8zj%255E%25C8%25D8%258A-%2512%25FA%257B%258F%25E3%252A%2599%25B8%2583S%251A%2560xG%25FAu%2511%25CF%2506%25DA%25B2%25B6Q%25FE%25BBn%25A71%2524%25D91-Y","delUrl":"\/structure\/delete.html?sinKey=ab55%2593%258E%25D0%2527_%25E3%25BA%25EEf%25E1%25D1%25FC%25A5%251F%2504%25DFA%25B0%25AC%250B%2580%25CA%25E2%2512%25E1%25F0w%259A%25D5%25C1%25F3%2523x%2595Wr%2589%25B6%25E0%25EA%2524d","children":[{"id":"57","name":"\u6559\u5b66\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"57","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=b0a2k%2524%25D3uz%25AB%259E%25F4lI%258F%25E5%258CB%2517d%25DD%2594T%25C5%25E6Xu%25E0B%252B%25D6%2500%25C8%25C8%25BE%25F2%2503%2592%258D%2506%2518%25BB%255E%25B2%25C4%2580","delUrl":"\/structure\/delete.html?sinKey=759ci-%25E7%258FB%2590%2589%25EB%2589%258D%25F8%251E%2522%25AC%2525%253C%25A9%259B%25E2%25F2%2591%25FF%2513%25AC%25A3%2517%252A%25A9%257D%25C8%25A0%25BB%2592%25C1P%259EP%25E1%250F%25A4%25A3%251D","children":[]},{"id":"58","name":"\u4fdd\u5065\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"58","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=2500%2598%25AB%25C1%25B6%25AC%25AA%251D%7EOX%25DA%25BE%2596H06%25959%255DA%2512%25B5%2581%2590%2513%25C3%2506%252BN%25DET%2520O%25E6%25E8%251B%25F3%25C8%2508%25FB%259D%25E5","delUrl":"\/structure\/delete.html?sinKey=35d1%250AFj%25CFg644%25A8%258Bc%25F6%2588%2502%255D%258EA%25CF%2517%257B%25CC%2520%25E8%25F2s%7E%25E7Z%2596%25D3%25C4bP%255B%25CDC%252C%2597%2509%25E0%2586%25BE","children":[]},{"id":"59","name":"\u540e\u52e4\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"59","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=5f78%2510u%25AA%25C2%258CS%25E0%2520%2518%258E%2524%2594%2560%252A%2514%258B%25E9%2598%258F%25D2%2503%25C7u%25E0nB%258A%255DN%25BE%25A6S%25F9%2509%25C5%25F8%25EA%25B3Z4E%2503","delUrl":"\/structure\/delete.html?sinKey=85b6%25AC%25CE%2589%25C6N%25FE%251C%2597m%2525%25FA%2524z%251A%258A%25DC%25A5-%25CC%2599%2523%25D8%2584%252C%2584%259BR%2528q%25FB%259A3%25E2_%25B8%25CD%25C2%25E78%25B6%25AC%25CF","children":[]},{"id":"60","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"60","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=0bbfI%257CY%25BE%25B4%2529%25DE%258C%25C9%25C0%25E0%25F7%2589%255E%25D3P%25F2%25BCi%253D%2503%259Dk%25A3%25FEG%2520%25AAf%250C%25FEG%25A2%25C4%25B33%258A%253D%2560%25A1%25AA%25C5","delUrl":"\/structure\/delete.html?sinKey=9749%259A%25D3s%2586E%2523zo%25286%25A3%2526L%250A%25D7%25C0%25CE%259DJX1j%25A7%25EA%25A8%251F%2587%25CE%25271D%25E1%25B4O%257FjU%2595f%25F9%25ECl","children":[]}]}]}]';
    structureJson = eval('('+structureJson+')');

    var vacationStudentTypeJson = '[{"id":"","name":"\u6240\u6709\u4f11\u5047\u7c7b\u578b"},{"id":1,"name":"\u4e8b\u5047"},{"id":2,"name":"\u75c5\u5047"},{"id":3,"name":"\u5176\u4ed6\u5047"}]';
    vacationStudentTypeJson = eval('('+vacationStudentTypeJson+')');

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
    	var thLength = $('#tt tr:first').find('th').length;
        if (data.rows.length == 0) {
                $('#tt').datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                    .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: thLength });

                $('#tt').closest('div.datagrid-wrap').find('div.datagrid-pager').hide();
        }
    }

    /**
     * 手工录入考勤信息
     * @param data
     */
    function addClockTeacher(addUrl) {
        openTopWindow(addUrl, '手工录入考勤信息', 800, 600, 'closeReload');
    }

    /**
     * 回调 函数
     */
    function closeReload(){
        $('#tt').datagrid('reload',{
            date: $('#date').datebox('getValue'),
            structure_id: $('#structure_id').combotree('getValue'),
            check_status: $('#check_status').combobox('getValue'),
            teacher_name: $('#teacher_name').textbox('getValue'),
            tag:'1'
        });
    }

    /* 考勤备注 */
    function addNote(index){
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        var id = row.id;
        if(row){
            var url = "${pageContext.request.contextPath}/teacherCheckAction_addNote.action?id="+id+"";
            var title = '教职工当日考勤备注';
            openTopWindow(url, title, 418, 198, 'closeReload');
        }
    }

    /* 考勤位置详情 */
    function seatInfo(index){
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if(row){
            var url = row.seatInfo;
            var title = '教职工考勤位置';
            openTopWindow(url, title, 800, 500, 'closeReload');
        }
    }

    function setArriveColor(val,row,index){
        var color = '';
        if(val){
            if(val.indexOf('请假') != -1){
                color += '#FF6600';
            }else if(val.indexOf('迟到') != -1 || val.indexOf('早退') != -1){
                color += '#FF0000';
            }else if(val.indexOf('缺卡') != -1){

            }else{
                color += '#006600';
            }
        }
        var rs = '<span style="color:'+color+'">'+val+'</span>';
        return rs;
    }

    /* 考勤图片展示 */
    function showImg(index){
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if(row){
            var url = row.showImgUrl;
            var title = '考勤照片展示';
            openTopWindow(url, title, 760, 420, 'closeReload');
        }
    }
    
    function setTeacherName(value, rec) 
    { 
   		 return rec.teacher!= null ? rec.teacher.teacher_name : ""; 
    }
    function setSexName(value, rec) 
    { 
    	return rec.teacher!= null ? rec.teacher.sex_name : ""; 
    }
    function setphone(value, rec) 
    { 
    	return rec.teacher!= null ? rec.teacher.phone : ""; 
    }
    function setStructureName(value, rec) 
    { 
   	 if(rec.teacher != null){
    		if(rec.teacher.structure != null){
    			return rec.teacher.structure.name;
    		}
    	}
    	return "";
    }
    function setDutyName(value, rec) 
    { 
   	 if(rec.teacher != null){
    		if(rec.teacher.teacherDuty != null){
    			return rec.teacher.teacherDuty.duty_name;
    		}
    	}
    	return "";
    }
    
    /* 操作回调方法 */
    function formatOper(val,row,index){
        var approvalBtn = '';
        if (hasEditPermission) {
            //添加备注按钮
            approvalBtn += '<a onclick="addNote('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">备注</span>' +
                '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                '</a>';

            /* if(row.arrive_clockImg != '' || row.leave_clockImg != ''){
                approvalBtn += '<a onclick="showImg('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                     '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">照片</span>' + 
                    '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
                    '</a>';
            } */

            //添加位置按钮
            //var statusData = [0,1,10,11,2,20,21,22];
            //if(statusData.indexOf(Number(row.status)) == -1){
            /* if(row.arrive_lat>0 || row.leave_lat>0){
                approvalBtn += '<a onclick="seatInfo('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">位置</span>' +
                    '<span class="l-btn-icon icon-dingwei">&nbsp;</span></span>' +
                    '</a>';
            } */
        }

        var optionsStr = "{editBtn}";

        optionsStr = optionsStr.replace('{editBtn}', approvalBtn);
        return optionsStr;
    }

    /* 导出excel表格 */
    function outExcel(){
        var date = $('#date').datebox('getValue');
        var structureId = $('#structure_id').combotree('getValue');
        var checkStatus = $('#check_status').combobox('getValue');
        var teacherName = $('#teacher_name').textbox('getValue');

        var form = $("<form>");
        form.attr('style', 'display:none');
        form.attr('target', '');
        form.attr('method', 'get');
        form.attr('action', '/clock-teacher/day-index-list-json.html');

        var input2 = $('<input>');
        input2.attr('type', 'hidden');
        input2.attr('name', 'date');
        input2.attr('value', date);

        var input4 = $('<input>');
        input4.attr('type', 'hidden');
        input4.attr('name', 'structure_id');
        input4.attr('value', structureId);

        var input5 = $('<input>');
        input5.attr('type', 'hidden');
        input5.attr('name', 'check_status');
        input5.attr('value', checkStatus);

        var input7 = $('<input>');
        input7.attr('type', 'hidden');
        input7.attr('name', 'teacher_name');
        input7.attr('value', teacherName);

        var input8 = $('<input>');
        input8.attr('type', 'hidden');
        input8.attr('name', 'is_download');
        input8.attr('value', 1);

        $('body').append(form);
        form.append(input2);
        form.append(input4);
        form.append(input5);
        form.append(input7);
        form.append(input8);
        form.submit();
        form.remove();
    }

    $(function () {
        /* 所属部门 */
        $('#structure_id').combotree({
            //获取数据URL
            url:'${pageContext.request.contextPath}/structureAction_findAll.action',
            //data: structureJson,
            //value: rootStuctureId,
            value:'全部部门',
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            //选择树节点触发事件
            onSelect : function(node) {

            }
        });

        /* 审批状态 */
        $('#check_status').combobox({
            data: [
                {id: '', name: '全部状态'},
                {id: 1, name: '有缺卡'},
                {id: 2, name: '有请假'},
                {id: 3, name: '考勤正常'},
            ],
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){

            },
            onSelect:function(recode){
                var val = recode.name.replace(/&nbsp;&nbsp;/,"");
                $("#check_status").combobox("setValue",recode.id).combobox('setText',val);
            }
        });

        /* 休假开始日期 */
        $('#date').datebox({
            editable: false
        });
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