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
                <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-daochu" plain="false" onclick="outExcel();">导出</a> -->
            </div>
            <!--工具栏结束-->

            <!--筛选条件开始-->
            <div id="main_body_search" region="center" border="false" style="padding-left:0px;">筛选：
                <input id="structure_id" name="structure_id" value="" class="easyui-validatebox" data-options="novalidate:true, width: 200"> 
				&nbsp;&nbsp;统计年月：
                <input id="start_year" name="start_year" class="easyui-validatebox" data-options="novalidate:true, width: 70,panelHeight:'auto'" value="2017-03-17">
                <input id="start_month" name="start_month" class="easyui-validatebox" data-options="novalidate:true, width: 70,panelHeight:'auto'" value="2017-03-17"> 至
                <input id="end_year" name="end_year" class="easyui-validatebox" data-options="novalidate:true, width: 70,panelHeight:'auto'" value="2017-03-17">
                <input id="end_month" name="end_month" class="easyui-validatebox" data-options="novalidate:true, width: 70,panelHeight:'auto'" value="2017-03-17">
               &nbsp;&nbsp;<input id="status" name="status" value="" class="easyui-validatebox" data-options="novalidate:true, width: 100,panelHeight:'auto'">
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
       		   url:'${pageContext.request.contextPath}/teacherMonthCheckAction_pageQuery.action',method:'get'">
            <thead>
            <tr>
            	<th data-options="field:'school_name', width:0"></th>
                <th data-options="field:'teacher_name', width:80, formatter:setTeacherName">姓名</th>
                <th data-options="field:'sex_label', width:60, formatter:setSexName">性别</th>
				<th data-options="field:'phone', width:100, formatter:setphone">联系手机</th>
                <th data-options="field:'structure_name', width:160 , formatter:setStructureName">所在部门</th>
                <th data-options="field:'duty_name', width:80, formatter:setDutyName">职务</th>

                <th data-options="field:'month_label', width:80">考勤月份</th>
                <th data-options="field:'total_days', width:80">应出勤天数</th>
                <th data-options="field:'actual_days', width:80">打卡天数</th>
                <th data-options="field:'normal_days', width:80">正常天数</th>
                <th data-options="field:'late_days', width:80">迟到天数</th>
                <th data-options="field:'early_days', width:80">早退天数</th>
                <th data-options="field:'edit',width:80, formatter: formatOper">操作</th>
            </tr>
            </thead>
        </table>
        <!--数据表结束-->

    </div>

</div>

<script type="text/javascript">

    var rootStuctureId = '"1"';
    rootStuctureId = eval('('+rootStuctureId+')');

    var structureJson = '[{"id":"1","name":"\u5168\u90e8\u90e8\u95e8","parent_id":"0","bloc_id":"1","school_id":"0","parent_str":"","sort_id":"1","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=c3e2%252C%255E%25A8%253E%25CD%25DF%2520%250A%25AD%25B4%253D%252F%25A8%25D6%258C1%25D1%25CE%25DC7%25D4tI%25FC%2501%253F%2510%2515%252F%7E%25AF%25AEw%25ED3%25C4%25D3_j%25E0%25F2","delUrl":"\/structure\/delete.html?sinKey=8e93%25A3%258C%25A6%25D6u%25C2%25C4%25C3%25E2e%25E6%2583%25C8%2504%2503j%2590l%2540%259B%2518%259EfB%2502%25C3%2595V%25D5%25C3%25C8%253Ee%259Fh%25EA%255E%2589%2581%259D%251A","children":[{"id":"2","name":"\u96c6\u56e2\u603b\u90e8","parent_id":"1","bloc_id":"1","school_id":"0","parent_str":",1,","sort_id":"2","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=b12a%25E4g%25D5i%25BD%2588%25B0%2525%2503%2517%2593%25C7%25F2%259B%25BC%259B%2580%25EB%25AE%25E1%2519%2596%25BE%258D%25E5%252A%251CM%25B1%25003%25D3a%25B4%2595%2511%253D%2590%2585%25FB%252A","delUrl":"\/structure\/delete.html?sinKey=b47a%252AF%2518%253C%25E6%25BF%2597%25AF%25D1r%2503O_%25A0%25AB%25BE%25D3%25963%2583%25C4f%25CD%25E2RE%250B%253ERe%2583%259Bf%259A%25EF%250C%2586%25E0%259Ev%25EC","children":[{"id":"3","name":"\u884c\u653f\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"3","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=5cc7%25BD%25EBx%250A%259B%25AD%252B%2515%252Cx%253A%25D1%25DFG%25B7h1%25EE%257CY%2591%25B1%259Eh%25BC%2507%259F%250A%25AF%25A9%253D%2514p%25A7%25B1%25916%25F0%2586%258D%250C","delUrl":"\/structure\/delete.html?sinKey=6cea%25FA%2506%25B9%2520%259A%25A8%25AE%25C9%25EFz%251B%250Fd%2596%25AF%2599%25C2%258F6s%25F8%25E6V%25A1%25EC%2582%251BH%2591%25D7%257Fi%2505%25C4%2513%2504%25A3%2503V%25A5%2507","children":[{"id":"137","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"3","bloc_id":"1","school_id":"0","parent_str":",1,2,3,","sort_id":"137","create_time":"1486702753","updateUrl":"\/structure\/save.html?sinKey=5b10X%2595%25DCMD%25E7G%250EN%2520%2581N%25D2%2587%250A%25C3La%250D%251B%25EF%25247T%25A5%25A2%25EE%7Eq%250C6%25F92%2597M%25ECm%25E0%259F%25BFWB%25CA","delUrl":"\/structure\/delete.html?sinKey=b8bc%25B3hB%25C8%2586%25FDE%2507%25E3%25CCd%25B5U%259F%250AI%25B1%252B%25F7%25F9%25EF%2587%2505%25A0t%25CE%2513%2501%2528I%259EX%25B2%2515%25E0%258BJ%25E6%2599%259C%255D%25AF%25B8","children":[{"id":"172","name":"\u65b0\u589e\u5b50\u7c7b1","parent_id":"137","bloc_id":"1","school_id":"0","parent_str":",1,2,3,137,","sort_id":"172","create_time":"1486778502","updateUrl":"\/structure\/save.html?sinKey=fa0c%251E%25B4w%25B1%25F0%2503%25F7%25A1%251CU%2502%25FB%25F9%259AJ%2585%25B1%25BE%25BF%25F3j%25B4%2527%2590%25D9%250Cp%25EC%2505%257CkPf%25D8%25E1%25B4X%2523%251A%25EFz%255D%255D","delUrl":"\/structure\/delete.html?sinKey=9659p%25BB.%25048l%25B77%25B1%25FD%251C%252C%259E%25C1%25B4%25F23c%2529M%2586%25D1M%25AB%25E0%25D3%2517%25FF%25EA%25B3%25F68%25DB%25D6W%2501%2590%253B%25F0x%2515_Y","children":[]}]},{"id":"174","name":"\u6211\u8272\u6f06","parent_id":"3","bloc_id":"1","school_id":"0","parent_str":",1,2,3,","sort_id":"174","create_time":"1486783332","updateUrl":"\/structure\/save.html?sinKey=eb64%25D9%25D8%25D7%251D%253D%258A%251F%2506%25E47%25FA%252Co%2514%25F9%25E2%2506%2594%25B3%25D0%25A7%2504%25EBuV%2586%2583i%2590%25D6%25EA%25F6%25A3%251F%25E2%25C0%25DE%25191in%251A%7E","delUrl":"\/structure\/delete.html?sinKey=0044D%2527%25A3.%255Cs%25F8%25FB%258A%25F1%253C%25C33n%2529%258E%2507%25D7%2519%25C4P%25F08KJo%258C%2520%25D9%25F7%259A%259FI%25ED%253DB%25FA%25DE%25C0%2599%25F0%25F9%250F","children":[]}]},{"id":"4","name":"\u5e02\u573a\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"4","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=0d1b%25B5%2526%25E6J%2501%253C%25F0%25CAK%25F6%2582%25D1%25A3gU%251A%2523%25EFL%2503%252Cx%25AE%25FF%25DA%253D%25E4w7%25FEL%25E3%25A9%25E9%25A6%2524%25A9%259B%25FC%2587%257F","delUrl":"\/structure\/delete.html?sinKey=b7737%2588%25B0%25C4%25DA%251Euu%25234%2522l%258C%259D%25E3e%25FAv%25DAu%25B1%255E%2592%25F1%255C%25EA%251EO%25BF%25A0%253F%250Ey%253Dq%2517%2518%25E1%25F1%25FC%25FF","children":[{"id":"170","name":"\u65b0\u589e\u5b50\u7c7b1","parent_id":"4","bloc_id":"1","school_id":"0","parent_str":",1,2,4,","sort_id":"170","create_time":"1486741282","updateUrl":"\/structure\/save.html?sinKey=fb1d%255B%253E%251E%2586%25A2%25D5%253D3%25F8%25BA%251Eb6%2599%2504%25CD%25A6%259BG%25DD%259F%25B4%2500%253B%25E4i%25C17%2599%2590%2518%25D2%2581%253C%25B3%25CFG%250C%25E4s%2591%25A7%25DE","delUrl":"\/structure\/delete.html?sinKey=6b08%25D1%25C4%2512%25AF%25F1c%251A%2598%2596%25CA%250A%25D6%25D3q%25F1%25CB%2511%250A%25FA%2588%2593%25F6%255E%25A5%25A3%25D6%25F5%25A2%2596%258F%255Cl%25B6%259C%2525%2501%25E3%25AD%2599f%25FB%2500%2510","children":[{"id":"171","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"170","bloc_id":"1","school_id":"0","parent_str":",1,2,4,170,","sort_id":"171","create_time":"1486778481","updateUrl":"\/structure\/save.html?sinKey=7c1e%25DDx.%2581_%2528%259C%259D%25DB%2581h%25EFf%25BDfe%250B%252B%255E%258E%25CC%252F%251D%25EB%252B%2515%253B%25CE%2589w%2540%2581%257D%2512%2512Z_c%251E%2503GoL","delUrl":"\/structure\/delete.html?sinKey=c514%25DC%255D%25EAhn%2514%2517%2524%2540%25F03r%25A1%258ED%25A7%2591%251E%250E1%25B1j%250Bj%251FrV4%2509t%25B5L%25EC7%25E2%25AE%2520%25D7%25ED%25E4%2509C0","children":[]},{"id":"175","name":"\u65b0\u589e\u5b50\u7c7b11","parent_id":"170","bloc_id":"1","school_id":"0","parent_str":",1,2,4,170,","sort_id":"175","create_time":"1486783690","updateUrl":"\/structure\/save.html?sinKey=bcf6%250E%259E%25D2%25A4%25DD%252A%25C8%2585i%251191%25C1%251F%25EBy%2519%259F%25BF%2529RZsI%25EA%25EE%2504%25E9%25E5%255C%25EE%259D%25BE%253D%258A%250E%253F3%258FJ%25C7%25EF%25E0","delUrl":"\/structure\/delete.html?sinKey=32d1f%25202%25F8H%25B4I%251D%25F81%25B8%251Cx%257B_%2528%251C%25F3%259A%2588%2509%250B%25F4%2522%2599%25DB%25A4%2528V%250D%2597%2506%2521%251F%252B%25A7%25A4.%25EB%25F8%25D5%25D7o","children":[]}]}]},{"id":"5","name":"\u8d22\u52a1\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"5","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=2d83c%25EE%25D1%25D7Fu%2522%258B%7E%25F7%2594%25C6%2511%25F4%251D%25C8%25D9%25DB%25D7%25E4%25B0%252F%252A%25E1%25CB%25A8%2508%25CB%25C5m%25824%250A%25CE%2510%252BB%25A46%2522%2515","delUrl":"\/structure\/delete.html?sinKey=410eVi%258B%2502%25C5%253D%2599J%25234%251C%25F8%25C0%25A1%253B%25B5I%25A2%25C0%253F%25CE%25F4%251D%25CD%25EB%258F%25E1%25D1%25FE%25B4V%259B%25D47%25AE%25D2%25A2k%2589.%25B8","children":[]},{"id":"173","name":"\u65b0\u589e\u5b50","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"173","create_time":"1486781279","updateUrl":"\/structure\/save.html?sinKey=1e0a%2511%25E2%25A5%250F%25E6%25C4%2517%25C0%25D3%251E%2524%25EEVEv5%25ADZU%25E6N%25F13.%25EF3%253E%2501%25F0%251A6%25B8%25243%2589%25EEO%25F5%2587%253C%2514%2502Z","delUrl":"\/structure\/delete.html?sinKey=bf7a%250F3_%253EL%25A0%253F%2503U%259E-%25DA%25FF%250E%2503M%2528C%258D%2593%2584%25B9%25FC%25A9%25FA%2501%25C2%25D1O%25A8%255Eu%2586%25C7v%259F%2560%25E3%25CB%25D3%2585%259A_","children":[]},{"id":"176","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"176","create_time":"1486783943","updateUrl":"\/structure\/save.html?sinKey=2ba3%25E5U%25D6v.%2591%25F5t%25C9%258F%25B4%2582%2510_%255BJ%25DD%25CD7%25F36%25A0%252B%253F%25DCuOJ%25E8%25E2%25CC%25FB%25D0zR%25A5%25B6%25C7%2594%25D1%259C%253B%2589","delUrl":"\/structure\/delete.html?sinKey=001e%7E%2598%25F8Dd%2526%25D5%2516%25E6%257B%2520%251AV%25C2j%2507t%252Cj%25A8%25B1%25B9%255E%25B8%2515j%25FFm%255E%25D9o%2520J%250C%253D%25E8%2521.6%2509%2506%250B%257F","children":[]}]},{"id":"6","name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","parent_id":"1","bloc_id":"1","school_id":"1","parent_str":",1,","sort_id":"1","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=ee88%25FA%2522%251EhF%252AA%255C%25B7%25DC6%25FD%2508%25CAC%25A1t%25D74%25A6%2503%2512o%253D%25BDH%25A0%25D0%25C01%257D%25C1%25F6%2528%25B6GJN%253C%25045","delUrl":"\/structure\/delete.html?sinKey=be1d%25BE%25F2-nd%25E0%2511T%2507A%25DB%25A9%253D%25CD%25AAV%25C8d%2588s%25D8ee%2583Y%2527%25E5Q%25A9%252B%25DDV%25C0%258Bgw%2582Qa%2587%25C8","children":[{"id":"7","name":"\u6559\u5b66\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"7","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=4ae6j%2595%253B%25B8%25D9%25B3%25EA%2523%2598%250Aj%25BF0%2560%259E%25AE%255C%25B8%25A2lIw%257B%250Ed%25B5%2508%252C%25DF%251F-%250E%2587T%2526%25BAk%25F7%25E4n%258C","delUrl":"\/structure\/delete.html?sinKey=cc72%25D7%2587S%25A2%258C%258A%259B%259E%25E6c%25EE%259B%258A%2527%7E%2599%25BB1%251C1%25AC%25F3%2584%25B7%25A7%25A9%2593%25D5%2582%25DBU%2595%252C%2521%250F%2596%25E1%2591%25B5%25F3o","children":[]},{"id":"8","name":"\u4fdd\u5065\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"8","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=40f8%25E8o%2588m%2599%2594%25A1m%252A%25AD%251Aa%25E5%2580%25B2%25CB%25A6%25B0%25D9%2516%25E5%25C8%25E5%2583%25C7%25CC%250A%25F1s%25D5%25B7%25C1%25E0%25C0%2519%2522%259Ah%2527%25B7%2529","delUrl":"\/structure\/delete.html?sinKey=9e7c%25FD%258A%25A2%25CA%25AAZ%2501%25DB%25B2%25C1%2598Y%2591%25B9%2512%25F9a%2521%258F%252C%25FC%25C3l%25E0%25F1%25DD%257B%2587Z%25E9%2514gf%25B6%25FA%25F5%250C%25EE%2586%2504%25C3","children":[]},{"id":"9","name":"\u540e\u52e4\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"9","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=c94c%2506%25E8%2528%2527%2580%2587%253C%2508f%25BEx%25A3%259DI%25C6%25AA%25B8%250C%2512%2594g%25F1%25C5Q%2597%2580%25BC%25AB%25A8%25B3%2511%25EE%25B0u%255C%2596j%25E3%2508k%25C4","delUrl":"\/structure\/delete.html?sinKey=3d76%2540%25CBt%25E3%25CB%2514%258CC%2518%25A63%255E%2522E5%25EE%259C%251F%252A%25D4%251D%25A1%25DF%25B3%25F8%255Bh%25D6%259E%2580x%2584%259Dw_Z%25F8%2507Y%259A%25D8","children":[]},{"id":"10","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"10","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=26ea%25F9%2503%2583%2598%253AE%25BBu%258C0%25B6%25C4%2596AC%25EB%2504S%25874%25D6%25A9%253B%251DS%25C1%251D%25BF%25DC%25CB%25E0%253CD%253C%2508%2510%25AC%259A%25FB%250F%25FE%25C2","delUrl":"\/structure\/delete.html?sinKey=b8ac%25E7U%25B4%25C3%25BE%25B7%25BA%25B6%252B%2517%25D9I%2509%25A4%25DC%25A9h%25C5%25A4V%25A4V%25CA%25C9%2506%25A8%25DC%2515C%25D2%2519%25EDP%2509%25A4%2597%25C7d%25C7%2593%2524%25F5","children":[]}]},{"id":"11","name":"\u53f8\u5357\u5b66\u8f852","parent_id":"1","bloc_id":"1","school_id":"2","parent_str":",1,","sort_id":"1","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=58041%25CCX%251BGV3%25A2%25ECBu%25E3%25EDJ%25FC%250Cn%257B%251F%253B%255D%2512o%2520%253B%25CAY%2586%25FD%2593%2528%25A99%25AD%2583%25E5%25BB%258A%25DF-g%25E6","delUrl":"\/structure\/delete.html?sinKey=581d%25EF%255B%25F6%2590%25BA%25A7%25BA%2591tZ%2503Fk%251F%2595%259D%250CT%2591U%25ECg%25C622%25B6%2596%2520%25E1%25A8%2517w%259D%25DE%2594%2504%255C%251C%25A6J1%25E6","children":[{"id":"12","name":"\u6559\u5b66\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"12","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=e2b1%251B%253D%252B%258E%25D4%25DDj%253E%253B%2585%25E2%2523%25C0%2522%25BF%25B1%25D3%253B%255B%25DD%25F8Ra%250DHM%25DF%251D%2593%25F0%2509%258C%25C8%2514%2510%25F1%25E5%25B4%25A3%25BF.%25C7","delUrl":"\/structure\/delete.html?sinKey=96b7%253FH%258B%25DA%25A6%25FE%25D5%250B%253F%2586%25D7%25F7%25F4%250D3%2528%25AE%25C2%2515%25F1%253A%2520%258E%2521%25C7%251A%252A%25FC%25E0t%25EE%25EE%25F5%2526%25AA%25E2%25D2b%25D9%25F9%2582%25E8","children":[]},{"id":"13","name":"\u4fdd\u5065\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"13","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=deac%25F9Pp%258E%2524C%2586%2589%25DA%25A1%25EC%251B%25E1%25B6%253EM%25B7%25EF5B%25E2%2584%259B%25B4%25C7%25FB%25AA%25D1%25F7l%252A%251E%2508%25E7o%25E7%25DDv%25D9X%25C9%25BB","delUrl":"\/structure\/delete.html?sinKey=9a36%250C%2515%253D%25DF%25DA%25AFa%25E7C%25CA3%25F15Ju%25EA%25FD%2585%25DC%2522%25F2f%25F6%25DA%25EB%259Ar%2515%258CuP%25EE%259F%25AD%2596%25F6%25C5%25E2%2518gl%255B","children":[]},{"id":"14","name":"\u540e\u52e4\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"14","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=980e%257FMu%25EEQ%2597%2588%259Ce%2587h%25BD%25A1%2582%25D0%2523%251F%25BD%251F%2597%25D6%250B%25ADEJUw%259Ej%25E4%25BB%259038%25ED%2595%25F7%250A%25A5%250FK%25C6","delUrl":"\/structure\/delete.html?sinKey=a831%25F5R%25960g%2515%25BB%25F4KL%2593%25B5%25A4%25EFl%258Ao%25C8Q%255B%25C1%259F%25E8U%2586%255Eg%25EFt%25C3J%2594%2506%25A3%255D%2528%2588%25B67%25D9%251C%25A5","children":[]},{"id":"15","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"15","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=a34bV%25CC%25B4Jwr.%25E5%25A7%2508j%258D%25E7.%2581%2517j%2525%2585%2513%253Ab%25FC%2598_bD%2523%25DBU%2515Z%25E9%25FFT%25EE%258E%25EC%25C7p%2529%25F6","delUrl":"\/structure\/delete.html?sinKey=134b.%25E0%25AA1%25E8%250D%257D%25AB%25B3%2513%25F1%25B0C%25B8u%2590%25D5%25C6Zn%2515%25B4y%25CE%25D4%25FE%257C%25E7%25C8%25C6%25E4%25D6%253F%2500%2509%253B%253F%2505%25B8%257DKE","children":[]}]},{"id":"56","name":"\u53f8\u5357\u5b66\u8f851","parent_id":"1","bloc_id":"1","school_id":"8","parent_str":",1,","sort_id":"1","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=ec6fQ%2528%25A6%2587%252B%25F8%257FY%2516%259F9%251F%25DC%2500%25A3Ln%25FC7%2516%25BCt%2560%255EA%252A%2525c%25E7teU%258E%25FA%25A6e%25FBp%2526%25C7%257FZ","delUrl":"\/structure\/delete.html?sinKey=a98c%25E2Q%25C9%25D2%25B6%257F%251D%25CDu1%25E1%25F9%2587%2584%2583%2524V%25B3%25803%251A%25CC%25FD%25BB%257B%25EB%25DFT%25DE%2525%2526%25C0%25CD%2581%25A48%2587n%25C2d%252C%25B6","children":[{"id":"57","name":"\u6559\u5b66\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"57","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=7422%255E%2588%25F0%258DnU%252F.%2518%2522%2509%259D%25D9%2598%2591%25E4%25B4%25DC%2516%259B%25A0%253F%258B%25DE%259C7%25C48%250E%253D%25DF%259FU%2520%2525k%2522n%2521%2507%25D3J","delUrl":"\/structure\/delete.html?sinKey=903f%25C5%2513%25808%25D1i%2560%2504B%25B2%2520%253A%252A%252A%259C%253A%25B8%258F%25409%2514m%25E0%2503%25EDb%2503%2515%259B%2580%25F2%25BF%2527%25D5t0k%25CA%25BE%25E3%258D8","children":[]},{"id":"58","name":"\u4fdd\u5065\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"58","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=e907%25BC%25E7I%25B8%252AW%25BF%2511%25A5%25A3%25D4%25941%7E%25E2%2523%2591%258Eq%25E8%25A9%257Fl%25EFg%25D4%25B2%25D5%259C9%25B1u%25C7%258FZ%25E8t%250C%2514p%252A%2510","delUrl":"\/structure\/delete.html?sinKey=b5e6V%258B%25A8%25FE%255E%25D1%25D9%25C9%25BD%25CA%258F%2589%255B%25A3%250DC%2525b%25DD%25E6%25B8%2580jD%25ABw%2500%258A%2528%25DE%258E%2583%2511%25CE%25F6%2509%25C3%253B%25B5G%25B4%253C","children":[]},{"id":"59","name":"\u540e\u52e4\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"59","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=d981%25CD%2599%25C2%2599%2521%2511%252F%253C%259A%251E%25EA%25B5%25B9%25F1%25E5A%2540%253D%25F9A%25F3%25FDu%2506%253A%2507%25C9%25D7%2500P%25D2%2597%2503%25E2W%2500D%2583%25F7%25B1%250E%252F","delUrl":"\/structure\/delete.html?sinKey=ee77%25A4%25E7%259B%25E0%258E%25F3%25BA-%25E4%25D6%2525B%2560%2519%25846%25F7%2501%259EJ%25F6%2521%2598k%250A%2593%252C%25A0%259B%25C7Be%25DCe%7E%25954%25D5%2507G%2585%2506","children":[]},{"id":"60","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"60","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=ab1c%253AF%25A8%251B%2505%25ED%2528G%25EE%259Dt%251D%25FEc%257B%25E8%2513%25B8%258B%25AE%25BE%25C2%25C2%251F%25F53%253Dqb%251F%25BB%25C1%258E%25FAG%25023A%25DA%2583%25A9%253C","delUrl":"\/structure\/delete.html?sinKey=4eab7%25A5%25A6%251A%25BB%25ED%252F%25B2%25D00%2503fh%2599%25AA%255E%25FE%2518%25EC%25EA0%2511%25FD.%2540%2509%2582U%2516%2583I%250A3d%2508%25B5%25F57%252B%2587f%2514","children":[]}]}]}]';
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
                .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: thLength })
        }
    }

    /**
     * 回调 函数
     */
    function closeReload(){
        $('#tt').datagrid('reload',{
            structure_id: $('#structure_id').combotree('getValue'),
            start_year: $('#start_year').datebox('getValue'),
            start_month: $('#start_month').datebox('getValue'),
            end_year: $('#end_year').datebox('getValue'),
            end_month: $('#end_month').datebox('getValue'),
            teacher_name: $('#teacher_name').textbox('getValue'),
            status: $('#status').combobox('getValue'),
            tag:'1'
        });
    }

    /* 月考勤记录详情 */
    function detail(index) {
        $('#tt').datagrid('clearSelections').datagrid('selectRow', index);// 关键在这里
        var row = $("#tt").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        var id = row.id;
        var url = "${pageContext.request.contextPath}/teacherMonthCheckAction_about.action?id="+id+"";
        if (row){
            openTopWindow(url, '月考勤详情', 1053, 730, 'closeReload');
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

    /* 格式化操作列 */
    function formatOper(val,row,index){
        var detailBtn = '';
        detailBtn = '<a onclick="detail('+index+', 1, this)" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">详情</span>' +
            '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
            '</a>';

        var optionsStr = "{detailBtn}";

        optionsStr = optionsStr.replace('{detailBtn}', detailBtn);
        return optionsStr;
    }

    /* 导出excel表格 */
    function outExcel(){
        var structureId = $('#structure_id').combotree('getValue');
        var startYear = $('#start_year').datebox('getValue');
        var startMonth = $('#start_month').datebox('getValue');
        var endYear = $('#end_year').datebox('getValue');
        var endMonth = $('#end_month').datebox('getValue');
        var teacherName = $('#teacher_name').textbox('getValue');
        var status = $('#status').combobox('getValue');


        var form = $("<form>");
        form.attr('style', 'display:none');
        form.attr('target', '');
        form.attr('method', 'get');
        form.attr('action', '/clock-teacher/month-index-list-json.html');

        var input2 = $('<input>');        input2.attr('type', 'hidden');        input2.attr('name', 'structure_id');        input2.attr('value', structureId);

        var input5 = $('<input>');        input5.attr('type', 'hidden');        input5.attr('name', 'start_year');        input5.attr('value', startYear);

        var input6 = $('<input>');        input6.attr('type', 'hidden');        input6.attr('name', 'start_month');        input6.attr('value', startMonth);

        var input7 = $('<input>');        input7.attr('type', 'hidden');        input7.attr('name', 'end_year');        input7.attr('value', endYear);

        var input8 = $('<input>');        input8.attr('type', 'hidden');        input8.attr('name', 'end_month');        input8.attr('value', endMonth);

        var input9 = $('<input>');        input9.attr('type', 'hidden');        input9.attr('name', 'teacher_name');        input9.attr('value', teacherName);

        var input10 = $('<input>');        input10.attr('type', 'hidden');        input10.attr('name', 'status');        input10.attr('value', status);

        var input11 = $('<input>');        input11.attr('type', 'hidden');        input11.attr('name', 'is_download');        input11.attr('value', 1);

        $('body').append(form);
        form.append(input2);        form.append(input5);
        form.append(input6);        form.append(input7);        form.append(input8);
        form.append(input9);        form.append(input10);        form.append(input11);
        form.submit();
        form.remove();
    }

    $(function () {
        /* 所属部门 */
        $('#structure_id').combotree({
            //获取数据URL
            url:'${pageContext.request.contextPath}/structureAction_findAll.action',
            //data: structureJson,
            value: rootStuctureId,
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            //选择树节点触发事件
            onSelect : function(node) {

            }
        });

         /* 审批状态 */
        $('#status').combobox({
            data: [{id: '', name: '所有出勤状态'}, {id: 4, name: '当月有迟到'},{id: 5, name: '当月有早退'},{id: 2, name: '当月有请假'}, {id: 1, name: '当月有缺卡'}, {id: 3, name: '当月无缺勤'}],
            editable:false,
            valueField:'id',
            textField:'name',
            onLoadSuccess:function(){

            }
        });

        var dateObj = new Date();
        var nowYear = dateObj.getFullYear(); // 当前年份

        var years = [{id: nowYear - 1, name: (nowYear - 1) + '年'}, {id: nowYear, name: nowYear + '年'}];

        var months = [{id: 1, name: '1月'}, {id: 2, name: '2月'}, {id: 3, name: '3月'}, {id: 4, name: '4月'}, {id: 5, name: '5月'},
            {id: 6, name: '6月'}, {id: 7, name: '7月'}, {id: 8, name: '8月'}, {id: 9, name: '9月'}, {id: 10, name: '10月'}, {id: 11, name: '11月'}, {id: 12, name: '12月'}];

        /* 开始日期年份 */
        $('#start_year').combobox({
            data: years,
            editable:false,
            valueField:'id',
            textField:'name',
            value: nowYear,
            onLoadSuccess:function(){

            }
        });

        /* 结束日期年份 */
        $('#end_year').combobox({
            data: years,
            editable:false,
            valueField:'id',
            textField:'name',
            value: nowYear,
            onLoadSuccess:function(){

            }
        });

        /* 开始日期月份 */
        $('#start_month').combobox({
            data: months,
            editable:false,
            valueField:'id',
            textField:'name',
            value: dateObj.getMonth()+1,
            onLoadSuccess:function(){

            }
        });

        /* 结束日期月份 */
        $('#end_month').combobox({
            data: months,
            editable:false,
            valueField:'id',
            textField:'name',
            value: dateObj.getMonth()+1,
            onLoadSuccess:function(){

            }
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