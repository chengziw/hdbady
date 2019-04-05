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
<body style="padding: 0;margin: 0" class="panel-noscroll">
<script type="text/javascript">
    /*loadWindow();*/
</script>
<div class="tutorial-content" style="display: none">
    </div>


 
  <div class="tutorial-content" style="display: none"> 
  </div> 
  <div class="easyui-layout layout easyui-fluid" border="true" fit="true" style="width: 788px; height: 443px;"> 
   <!--1.2 region="west",必须指明宽度--> 
   <div class="panel layout-panel layout-panel-west" style="width: 220px; left: 0px; top: 0px;">
    <div region="west" title="" style="width: 218px; height: 404px;" border="true" class="panel-body panel-body-noheader layout-body panel-noscroll"> 
     <div class="panel datagrid easyui-fluid" style="width: 218px;">
      <div class="datagrid-wrap panel-body panel-body-noheader panel-body-noborder" title="" style="width: 218px; height: 404px;">
       <div class="datagrid-view" style="width: 218px; height: 404px;">
        <div class="datagrid-view1" style="width: 0px;">
         <div class="datagrid-header" style="width: 0px; height: 24px;">
          <div class="datagrid-header-inner" style="display: block;">
           <table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0">
            <tbody></tbody>
           </table>
          </div>
         </div>
         <div class="datagrid-body" style="width: 0px; margin-top: 0px; height: 379px;">
          <div class="datagrid-body-inner"></div>
         </div>
         <div class="datagrid-footer" style="width: 0px;">
          <div class="datagrid-footer-inner" style="display: none;"></div>
         </div>
        </div>
  		<%-- ${pageContext.request.contextPath}/userRoleAction_findAllHaveUserRoleTeacher.action?id=34534556765 --%>
        <table id="admin-table" class="easyui-datagrid datagrid-f" title="" fit="true" data-options="fit:true, fitColumns:true,pagination:false,
        url:'<s:url value="pageContext.request.contextPath/roleAction_findHaveRoleTeacher.action"><s:param name="id"><s:property value="userRole.id"/></s:param></s:url>',method:'get', onClickCell: function (rowIndex, field, value) {removeAdmin(rowIndex, field, value);}" toolbar="#tb" style="display: none;" border="false"> 
         <thead> 
          <tr> 
           <th data-options="field:'teacherName',width:100,">管理员姓名</th> 
           <th data-options="field:'opt',width:100,align:'center', formatter: formatRemoveAdmin">操作</th> 
          </tr> 
         </thead> 
        </table>
        <style type="text/css" easyui="true">
.datagrid-cell-c1-teacherName{width:91px}
.datagrid-cell-c1-opt{width:91px}
</style>
       </div>
      </div>
     </div> 
    </div>
   </div> 
   <!--1.3region="center",这里的宽度和高度都是由周边决定，不用设置--> 
   <div class="panel layout-panel layout-panel-center" style="width: 569px; left: 219px; top: 0px;">
    <div region="center" border="true" title="" class="panel-body panel-body-noheader layout-body panel-noscroll" style="width: 567px; height: 404px;"> 
     <!-- 老师数据装载容器 --> 
     <div class="panel datagrid easyui-fluid" style="width: 567px;">
      <div class="datagrid-wrap panel-body panel-body-noheader panel-body-noborder" title="" style="width: 567px; height: 404px;">
       <div id="spare-admin-table-toolbar" class="datagrid-toolbar"> 
        <form style="padding:8px;"> 
         <span> <label> 部门机构： </label> 
         <input id="structure" class="easyui-combotree combotree-f combo-f textbox-f" style="width: 218px; display: none;" />
         <span> <label> &nbsp;&nbsp;姓名： </label> 
         <input id="teacher_name" class="easyui-textbox textbox-f" style="width: 120px; display: none;" />
         </span> 
        <%--  <span> <a id="mysearch_btn" href="#" class="easyui-linkbutton l-btn l-btn-small l-btn-plain" plain="true" data-options="iconCls:'icon-search'" onclick="doSearch('/user-role/edit-admin-get-tearcher-json.html');" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a> </span>  --%>
       <a id="mysearch_btn" href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'" style="margin-left:8px;" onclick="doSearch();return false;">查询</a>
      
        </form> 
       </div>
       <div class="datagrid-view" style="width: 567px; height: 328px;">
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
         <div class="datagrid-body" style="width: 31px; margin-top: 0px; height: 303px;">
          <div class="datagrid-body-inner">
    
          </div>
         </div>
        </div>
      
        <table id="spare-admin-table" class="easyui-datagrid datagrid-f" title="" data-options="fit:true, fitColumns:true,pagination:true,
        rownumbers:true,checkOnSelect:true,singleSelect:true,
        onLoadSuccess: dataLoadSuccess,
        <%-- url:'${pageContext.request.contextPath}/teacherAction_findAllTeacherToRole.action', --%>
        url:'${pageContext.request.contextPath}/roleAction_editMemberPageQuery.action',
        method:'get'" toolbar="#spare-admin-table-toolbar" style="display: none;" border="false"> 
         <thead> 
          <tr> 
           <th data-options="field:'teacherName',width:100, align:'center'">教职工姓名</th> 
           <th data-options="field:'sexName',width:50, align:'center'">性别</th> 
           <th data-options="field:'dutyName',width:80, align:'center'">职务</th> 
           <th data-options="field:'phone',width:100, align:'center'">手机</th> 
           <th data-options="field:'opt',width:100,align:'center', formatter: formataddAdmin">操作</th> 
          </tr> 
         </thead> 
        </table>
        <style type="text/css" easyui="true">
.datagrid-cell-c2-teacherName{width:91px}
.datagrid-cell-c2-sexName{width:41px}
.datagrid-cell-c2-dutyName{width:71px}
.datagrid-cell-c2-phone{width:91px}
.datagrid-cell-c2-opt{width:91px}
</style>
 </div>
       <div class="datagrid-pager pagination">
     
        <div style="clear:both;"></div>
       </div>
      </div>
     </div> 
    </div>
   </div> 
   <div class="panel layout-panel layout-panel-south" style="width: 788px; left: 0px; top: 406px;">
    <div region="south" border="false" style="background-color: rgb(224, 236, 255); width: 788px; height: 37px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body"> 
     <!-- 保存按钮 --> 
     <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:3px; float:right;"> 
      <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveAdmins()" group="">保存</a> 
      <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="cancel()" group="" id="">取消</a> 
     </div> 
    </div>
   </div> 
   <div class="layout-split-proxy-h"></div>
   <div class="layout-split-proxy-v"></div>
  </div> 
 
 
 
<script type="text/javascript">
    /* 转换PHPJSON为JS JSON格式 */
    var structures = '[{"id":"1","name":"Dear\u5b9d\u8d1d\u5e7c\u513f\u56ed\u96c6\u56e2","parent_id":"0","bloc_id":"1","school_id":"0","parent_str":"","sort_id":"1","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=9457%25E7%25C3%2597%2587E%25D5b%2524%25F1%257C%252B%25C9%252B%25D8%25E3%25B1%25BB%255C%2594%253E%25DB%25D9%25C4P%251B%25B3%258A%25B5%25E7%25F1%25A1%2506%25B4%25EB%252C%255C%2596%258DJ%25F7%25E6","delUrl":"\/structure\/delete.html?sinKey=c57e%25C3w%25DE%25F0%25EBZ%25C5%25BC%2593jH%25BA%2519%25FB%25CE%255Cf%259F%252BeMK_%25C5%259D%2596%252Bs%7E%25A9%25F6%25F5.%25C0%2505%25C7V%25D2J%25D3U","children":[{"id":"2","name":"\u96c6\u56e2\u603b\u90e8","parent_id":"1","bloc_id":"1","school_id":"0","parent_str":",1,","sort_id":"2","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=35bd%25CC%25A1%25E1%2522%25A9%25CC%25EEFi%258FEAc1%25FD%25856%25FC%25E8%25F28%25A0c%25C3%2520%25EF47%25CA3A%253F_%25E3%25C4%253B%255C%2512%25AFJ%2584","delUrl":"\/structure\/delete.html?sinKey=4b98M%2512%2590%25D7El%25B7%25FF%25E0%2504G%251B%2505%25FFo%2521%2594%2525%2512%2519%25FE%25F5%2506VOo%2516%2511%2590%2525%25D9I%25DC%259CHM%259B%25D0%2500%259A%25C5","children":[{"id":"3","name":"\u884c\u653f\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"3","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=8545b%2589%250B%25A0Tu%25B9%25CAVg%25E0%250C%25C4%2505%25C0r%258C%253AYL%25C3K%253F%25D1%25E9%25A5%259F%2519M%259A%258B%252C%2523%25E1%252A%25DA%251A%258C%253B%25ADW","delUrl":"\/structure\/delete.html?sinKey=71b4Z%25ACo%25CF%25B5%257D%25E8%25BEh%258B%253E%25FC%25BF%258A%250E%25C5%253F%25E6E%2521z%258A%25E0%259CU_%25F0%25D6ac%257B%25E7%2523%25C79i%25F8%2525%251A%253B%2540","children":[{"id":"137","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"3","bloc_id":"1","school_id":"0","parent_str":",1,2,3,","sort_id":"137","create_time":"1486702753","updateUrl":"\/structure\/save.html?sinKey=f800%2525O%25B7u%255E%25B3%25D5%2540%258F%255E%25A82m%259D%25DA%250A%2582%25D2%258C%25FC%2585%259B%250Bt%25FB%25B4%258BKO%25ACVxHt3%25C1%25C3w%25A3%251Ap%25A9J","delUrl":"\/structure\/delete.html?sinKey=0812%2509%25DD%25EE%25B7%25BF%25C0%2583%2583%25EEzX8%250E%25A3z%25DC%251C%25A4aL%25FAC%25CF%25A4%25B53%25E1%25F5%2598%25D3%252F%25F3%25EE%25DBK%25EF%251C%2525U%25F2%2589%250F%25D1","children":[{"id":"172","name":"\u65b0\u589e\u5b50\u7c7b1","parent_id":"137","bloc_id":"1","school_id":"0","parent_str":",1,2,3,137,","sort_id":"172","create_time":"1486778502","updateUrl":"\/structure\/save.html?sinKey=b4c2%25D6.%2523%258C%25BFY%2590%2501%2501%25FA%25C4%25E0l%255C%25B2%252F.%2505%25E9%2560%2507a%2592%25AE%251A%25F2%25B0%2560Rt%25A9%2518c%258A-%25B5%25C9%25E38y%25B7E%2512","delUrl":"\/structure\/delete.html?sinKey=c8263x%2526c%25FDfP%25230%2502r%25ED%2596%2590%25FC%251D%2518%2524%2527n%259D%255C%259A%25CF%2586%25B6%259B%251FV.%25FE%2521%250D%25CC%251A%2591%25B4%2590%2511%25BE%2529%252F%25D8","children":[]}]},{"id":"174","name":"\u6211\u8272\u6f06","parent_id":"3","bloc_id":"1","school_id":"0","parent_str":",1,2,3,","sort_id":"174","create_time":"1486783332","updateUrl":"\/structure\/save.html?sinKey=18a8%25EE%25D1_%25ABW8%25C7%25D0%25AC%2509W%25FBK%25EF%2599%250C%25CD%25A5d%25B8%2516%25CE%25CAq%258A%2520%25E0%25EBm%251F%25B1%25C0%251B%259F%25E0%25BB%25C9%2500%2522%257B%25C0%25E2%25FD","delUrl":"\/structure\/delete.html?sinKey=bd0bs%2507%25F7%25A9%2591fw%25B9e%250A%2504%2587-%25B8%2592%25E0u%25A5%25E6%25E3%255C%25C6%25CD%253CX%253D%2524%25E2%251C%25EC0D%258A%25F1%2585F%25B5%255D%25D2%2560%25E4%259Ch","children":[]}]},{"id":"4","name":"\u5e02\u573a\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"4","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=69e0%25A7%253D%253C%2524S.I%252AS%2512%250FN%25A5%2506%2511%25A3%25A1%25F1x%25BC%25E6%2508C%25FF%250C%25AD%2588A%258BK%25E4%25DF%2524%25DD%2591%2525A%25E1%25D5%2502%25A2","delUrl":"\/structure\/delete.html?sinKey=f451%2589%25E7%25DB-%2529%2583s%25FF%25BD%25B8%25B6%25BE%25B0k%25D5%25A6%25AF%25F5%2585%25C0n-O%25A1%25A2%259C%2518gI%250F%2597%25F4%25CD%25D7%25B0%25F4%2507%2591%258B%2510%25A1","children":[{"id":"170","name":"\u65b0\u589e\u5b50\u7c7b1","parent_id":"4","bloc_id":"1","school_id":"0","parent_str":",1,2,4,","sort_id":"170","create_time":"1486741282","updateUrl":"\/structure\/save.html?sinKey=6c067%25FA%25C9%25A2ugUk%25C3GC1%25C7%2516%257F%2514G%259F%258A%25ED%2506%25C0%25D6t%2587%25D5%257D%2597%255B%2589%258C%2580EU%25D8%25EDR%25FB%2540%25D3%253F%2586s","delUrl":"\/structure\/delete.html?sinKey=ec36q%259ERcc%25C6X%25AF%2516%25FA%25C7%25DB%258F%2527%25AC%2593%25C9%25BF%25D7%25EC%255Bbis%25C7%252C%2501%25C8%2580%2512%2504%2522%257DPx%2520ofG%25F9%25EE%25955","children":[{"id":"171","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"170","bloc_id":"1","school_id":"0","parent_str":",1,2,4,170,","sort_id":"171","create_time":"1486778481","updateUrl":"\/structure\/save.html?sinKey=ef07%252F%250Bi%2514.%2589%2505%2599ZS%25E7-%25F4%25FB2%2597%25C8%25123F%25FA%25BF%25F7b%2596%25FE%2598%2509%25A2%25FB%252F%2507%25D7hr%25B3%250Fm%2506%255E%258E%2517w","delUrl":"\/structure\/delete.html?sinKey=d0d8%25CAR%2597f%253C%25F0%259Eg%25A8%25F81%25BDg%2580%255D%25BE%25D1%258A%253F2%2585%25B6%257C%25E5%2516V%25A84%25D7W%25FD%25D7%2599%2527D%25E1%258D%25ACl%25EF%25EE%2594%25EB","children":[]},{"id":"175","name":"\u65b0\u589e\u5b50\u7c7b11","parent_id":"170","bloc_id":"1","school_id":"0","parent_str":",1,2,4,170,","sort_id":"175","create_time":"1486783690","updateUrl":"\/structure\/save.html?sinKey=0aef%25C7%250E%2510%2599%25D2%259F5Gr%2560%257C%25E0%25B0%2599%2517%25E359%255C%25EE%2589x%25EC%255B%25E7%258F%25D6U%25BE%251B%25A04%2594V%25DB%25EB%25C4s%25191%25FD%250D3","delUrl":"\/structure\/delete.html?sinKey=bef4m%25AD%259Cv%259A%25F8%25AE%258A%25FF%25DFgY%25D3%25E8%25EC%253B%25F8%2583%25F8%2501%25DCu%25CF%25FB%258FB%25BD%25F8W%25B5%252B%25CD%25E6%25C8%25BD%2594%25DB%2593%2504Z%2507%258C%25D2","children":[]}]}]},{"id":"5","name":"\u8d22\u52a1\u90e8","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"5","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=84b05%25C2a%25E2ze%253F%252F%25E7%2506%2518d%25F4%25BFe%259C%25CE%2517Eb%251D%2522%25D7%25CF%252C%253E%2527%25C1%25B2%259A%253F%257C%250B%25BE%25ADy%25BC%2587%2588%25D5%2593","delUrl":"\/structure\/delete.html?sinKey=aa21%7E%255D%25277%25B4%2585%2524%252F%25BDz%25D9%25C9%25A6D%253C%25AC%255C%25AC%253EQ%25A6%2582%25C2%25A4e%25A2%2585%25ED%253B%25C6%25F7El%25C1%252A%2515%25B4%25CF%25FD%257B%25FA","children":[]},{"id":"173","name":"\u65b0\u589e\u5b50","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"173","create_time":"1486781279","updateUrl":"\/structure\/save.html?sinKey=130a%2505%251B%25F4%253C%259A%25D7%25BC%2584%25E5%253B%25C2%251A%253E5%25C4q%25E3a%258A4%2522%2587%2597%25AC%25E1%25DD%25CA%251D%257C%250D%2597%25F5%25EBs%25CE7%25F5%25C5%257C%2581%258B%25B6%258A","delUrl":"\/structure\/delete.html?sinKey=e38d%25EFv%255B%2502%25FDl%257F%25EC%25B9W%2585%258D%25E5%25F8%2517%25B3f%25F5%2518W%2515%25E0%2597K%2589TJx%258F%2589%2501%25A3%25BB0b%2504%25ED%2510%2597%2513%2508n%25BF","children":[]},{"id":"176","name":"\u65b0\u589e\u5b50\u7c7b","parent_id":"2","bloc_id":"1","school_id":"0","parent_str":",1,2,","sort_id":"176","create_time":"1486783943","updateUrl":"\/structure\/save.html?sinKey=d1a3%25ED%2592%25AC%25DA%2503%25F8%25A2%259FX%25C9n%25F3%25FC%2529%25F4%25B9%2586%7EOU%2583%2582%25AD%259Dn%25A9%25B5L%25B1%25DD%2594E%25FD%258D%25A8%2585c%25E5%252F%2589%25D3%25D0%25DF","delUrl":"\/structure\/delete.html?sinKey=3247%2513%25D4x%25BF%25F3%2500%259A0%257D%25D1e%258CY%253Dbh%25E9%258A%2524q%2594nN2%25AD%255DNv%25A5%257DO8%25DC1%253B%25A5%25D0%250E%25B7%253Eax%25F9","children":[]}]},{"id":"6","name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","parent_id":"1","bloc_id":"1","school_id":"1","parent_str":",1,","sort_id":"1","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=ea5eX%2500%25C2%25A7%25D4%25A6R%258Az9%253EO%25F3e%25C3d%2582O9%25AC%2592%253B%25D8Z%25DB%25DB%25F8%259D%253D%2526v%2589%2526%2523E_%253C%2560%25E4%25BFn","delUrl":"\/structure\/delete.html?sinKey=2828%25F1%257B1J%2502%25E1%2507hz%25BC%25898%25DBL%259D%250E%251C%258F9%251C%250FXm%250EznC%25FD%25E5%253E%25BBW%7E%2594%25FBs%2503.%25F65%25B9","children":[{"id":"7","name":"\u6559\u5b66\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"7","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=f1c5%25CE%25FDB%251B8%25B9%25BA%257B%2510%2586%2521%25CE%2504ng%25F1Z%25DCub%25D1%25DA%25A3x%25DD%25B1%2505%25BA%2503%25AD%2516%25FC_%2580B%258B%25A7%255E%25AEq%253C","delUrl":"\/structure\/delete.html?sinKey=fe78%257Dv%25F1%25AC%25AB%25BB%25CF%25F2%25FF%25C9%259Ds%25AA%2587%25BAVj%25EC%25DBl%25E9%259C%25C8%259D%251ES%259D%25F2%25A4%253E%25D7%7E%259F%25DD%2527%2521H%252B%25E4d%258F","children":[]},{"id":"8","name":"\u4fdd\u5065\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"8","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=87c4%252B2%2599x%2506%25D0o%25AF%25A1%25D1%25B5%25CA%25CD%255C%2580%2504%2584539%259A%25D5%25E3K%2501i%25E0A%25E1%25055%253B%251B%259D%2504%25E6%252B%25BE%2519a%25BE","delUrl":"\/structure\/delete.html?sinKey=2955%2500%25BD%25D1%2520X%258E%2593%25E5%255C%257C5Y%2510K%25FA%25A2%250A%259F%2504%25E9%25FA%2589%2589%253B%25E6%258Bg%25B3%25E5%2580%25A2z%258Eo%2519Ug%257C%25F20%25E3","children":[]},{"id":"9","name":"\u540e\u52e4\u90e8","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"9","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=9c3c%2588%25A0x%25E0%25FA%25F8%2588Mr%25F5lz%250E%25C3%25D0%253E%25E5%25E2J%25ECL%258Fw%25D1%25C9%2586%2591%25FE%25A7%25C7%259EU%2518%2598%25BEh%25B4%258C%2516%250C%25EB","delUrl":"\/structure\/delete.html?sinKey=a8db%2514%25AD%253B%2595%25D9%25BC%25DE%2584%25D4%25A5%25ECq-%25C78%25B8%2592%25A2%259Dr%2582%25D0xx%25ACj%25B1%2580%25C7%2527%25F3%250B7%25FDi%25B5_%25E7%2593%25F0g","children":[]},{"id":"10","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"6","bloc_id":"1","school_id":"1","parent_str":",1,6,","sort_id":"10","create_time":"1471097276","updateUrl":"\/structure\/save.html?sinKey=0bf2r%25E6%2595%2584M2%25E8%2518%25E4TM%252C7E%259A%2582%2514.%25EF%258CAz%25E9%25AAj%25F7%25E9%25AE%25E2%25AE%2500%2502%2594%259Bx%25F1%2596%25E9%25A8%2526%25A2%2519","delUrl":"\/structure\/delete.html?sinKey=3b26%253Flma%25D6%25CC%25894%25E9V%25BA%25FA%7EaJ%25C4%253C%25D7%25C3%252F%251E%2590y%255Cj%25A4GFm%250Bu%2501w%25EDg%25DCE%2590%25F7%25D3%258F8","children":[]}]},{"id":"11","name":"\u53f8\u5357\u5b66\u8f852","parent_id":"1","bloc_id":"1","school_id":"2","parent_str":",1,","sort_id":"1","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=6314%25E4U%2501%25C7E%2597%25E8g7%2523%25D5%25D0%2592%25A4%25AC%251A%251FhP%25F0%25F7%25E4%25BC%251DM%258B%2590%2591%25B8%2527%259CB%255B%25C7%25C8C%25CD%25A9i%2595%2528%252B","delUrl":"\/structure\/delete.html?sinKey=ce1f%25F7%25C3%25DF%25EE%258F%25F1%25D3%25E6l%25A2%25D8%25C4r%252F%250F%25E2%250B%25F9Z%2581%25B2%25F3%25E9B%2593%25FF%2502%2525npAh%2590qy%25C7%258C%257D%255E%25E7%251E%25E6","children":[{"id":"12","name":"\u6559\u5b66\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"12","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=7a6d%25D0%2521%250C%2593Ek%25F6%2526%2589%252A%2590%25B6%25D1%25D3%25E38%25E6-%2597.%258B%2527%25C0%25F2%25A9%2502%2592%25C3%2528%25CA%2592%2586%25AF%25E2%25E6%25D0%25A9%257C.%25F1%2526J","delUrl":"\/structure\/delete.html?sinKey=f611%25A8%2521%251C%2595%258A%25DEG%25B3%25D2%2598%2583%252B%2501%251C%258E%250A%2525%25DF%25AA%25A5%250A%2599%25D8%25AF%25D4%2589%25821%251Bu%250A%2520zF%25C4%2523%2508%25BC%25B7%259Dw%2525","children":[]},{"id":"13","name":"\u4fdd\u5065\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"13","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=bf62%25FBp%251Ez%25E9%25DFL%2515%2524%25C1%25E2%2560n%2587%2592R%25E2X%2511%252B%25BC%2514%2584%258EY%259C%253D%2500TN%25CA%25B6%25B0%25EE%2587p%251E%7EK%7Ex%25BE","delUrl":"\/structure\/delete.html?sinKey=063f%2508%250AU%25E6%257FN%2503ClH%25D5%2596%25F5%25F0%25F7%2581%2590s%2508%258CH%2513%258D%25105T%25E4%25B1%25F4%251D%25D3%25E0%25EEe%2580%259C%2584f7%25D0%25B1%2505","children":[]},{"id":"14","name":"\u540e\u52e4\u90e8","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"14","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=a579%25B2%25B2%2599C%25E0%253E%25BE%2507%25FF_%2526%25A4%25115j%2586%2594%25E0G%25C5%2522%2512%2516n%250F%2597%25DB%25EA%258B%2502%2589%2596%253B%258D%25D3%25C6%258E%25F3%25C3l%2582z","delUrl":"\/structure\/delete.html?sinKey=08e2%25E3%25FE%253F%2507%25FF%2588%2508%2507%25A27%251E%25BDE%25E0%252A%259D%25D6%25F7%25E5%2513%2596%25BBY%25D0_%2527%2599%25FB%2596%25DA%25D7k%259C%251F%253C%25A4%2514%25B8%2594%25EAP%2597","children":[]},{"id":"15","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"11","bloc_id":"1","school_id":"2","parent_str":",1,11,","sort_id":"15","create_time":"1471311166","updateUrl":"\/structure\/save.html?sinKey=66af%25BB%258Cn%2519%2591%257B%255C%25F2%25A5%25ACqr%2580%255D%257F%25A1%259F%2519%251DJUe%25A6J%2515%2592%25A8o%253E%25F1%25F5%2522%253E%25EBh_%2590%25B4%25F1%25DC%25DC%25E9","delUrl":"\/structure\/delete.html?sinKey=cef0%252C%257D%25A7%2511%2522H%25A6%25E4J%25BA%25E4%2512%2586Z%25D6AA%25A4%25C0n%251F%25890%25EB%258C%25FE%25CA%250A%25DD%2521%255E%25C7%25A6%25D8%25E2V%25EF%25EF%25BC%258A%2529d","children":[]}]},{"id":"56","name":"\u53f8\u5357\u5b66\u8f851","parent_id":"1","bloc_id":"1","school_id":"8","parent_str":",1,","sort_id":"1","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=9044%253CS%251C%25EF.%258F%25A1a%25DE%25AB%25F6%25ADF%25216%2593%25CC%2507CS%251E%25DE%257B%25DEB%25CC%25A0%25F1%2588%2523%25CD%2512%25B4%25D0%2587%2501K%25A3Q%25F0%251C%255E","delUrl":"\/structure\/delete.html?sinKey=a4a58eFy%25E9%2506%2523h%25E4U%25FE%257F%25EF%255E%255C%25FA%25CB%25AE%250E8%2593%25B6y%2516%250A%2504%259CS%2508m%2517e%258B%25E2b%25E7C_%2500x%258Bl","children":[{"id":"57","name":"\u6559\u5b66\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"57","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=0d9a.R%25FC%25EA%2516b%2560%258B%25A5%25FE%25F0%2595%25B4x%25D4%25A1%2501%25BAG%2504%25EB8%2583%25F1Rt%25AB%2598U%2522i%25C1%255C%252C%251D%25932%2504%2599D%252B%252B","delUrl":"\/structure\/delete.html?sinKey=5cb0%25D30%252FD%25C4%2588v%2595%2522s%25E1C3Bq%25CAF%253E%2592-%25D8m%259ED%25B96%25E9%258F%255E%258A%25AE%25D6%25E1%25D2%25D8%2581%25C7J%25AC%2521%2508%25DF","children":[]},{"id":"58","name":"\u4fdd\u5065\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"58","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=1923Ggf%2505%258FG%25E7Ys%25E7%25BEq%25E6%25C9%25A0%257F%25D2%25CD%250E%25D5%25B4%25B6%2585%257D%252AO%2594%25C2%2519C.%257C%25E0%25C5u%2526%250E%2585%2527%25AA%25DDb","delUrl":"\/structure\/delete.html?sinKey=cd6e%253C%25C1%25BDv%251Fq%25FB%25AA%250A%25D4%25FDP%251B%2590%25FE%25E7%255Bj%253E%2560%257BC%2598%25EE%259B%259B%25E94B%2593%2584m%25FE%2526%25AAu%25DEa%25A1V%25C0%25B4","children":[]},{"id":"59","name":"\u540e\u52e4\u90e8","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"59","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=978f%255Bx%2587%259C%25EE%25D9%25F1%25F99%25DC%2597%2585%7E%25F1%2580%25C7%25A8%250Evn%2513%25A0%2521%2598%2500VmnQU%251D%2505%25EB%251D%257F%259D%25B0%25EB%252F%25BD%2506%257D","delUrl":"\/structure\/delete.html?sinKey=e2fcq8%251B%252C%2526%2523%25A1C3%259A%25B1%2596%25A4%2504%25EF%25C3Q%25CA%2587%2511%25A1B%2594%25BF%25C6%259A%252Cje%2503m%25D6%2540%25ABF%257B%2519%25D2%25F2%25C4%250E%25D8","children":[]},{"id":"60","name":"\u5bb6\u957f\u4e2d\u5fc3","parent_id":"56","bloc_id":"1","school_id":"8","parent_str":",1,56,","sort_id":"60","create_time":"1478676796","updateUrl":"\/structure\/save.html?sinKey=f976%2585%25F0%7E%25BB%2523%259Aj%2510%250AL%25AD%250A%25F0I%25B3%25FD7%2599%25B9tL%2595%25BD%2500%25F4%2528%2581%25897%25DA%25FC%2524SO%259A%2596%25D6%25CC%25A9oM%2580","delUrl":"\/structure\/delete.html?sinKey=f697y%25B1%25B2t%2510i%2589%25B7%2515m%25ABy%25954%2521%25A3%25C05%25A2%2502%25E4%25BFt%2522a%250FNjc%25A1%250E%2593G%25D0%2515R%25A6%2590%2583%255C%25C2%25B7","children":[]}]}]}]';
    structures = eval('('+structures+')');

    var pageIndex = 1; //页面索引初始值   
    var pageSize = 10; //每页显示条数初始化
    var TableTeamplete = '<input type="checkbox" name="teacher_ids[]" value="{teacherId}"   />{teacherName}'; // 数据页显示模板

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { teacherName: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'teacherName', colspan: 5 })
        }
    }

    /* 格式化管理员列 */
    function formatRemoveAdmin(val,row,index){
    	
        var removeBtn = '<a href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">移除</span>' +
                    '<span class="l-btn-icon icon-remove"></span></span>' +
                    '</a>';
    
        var optionsStr = "{removeBtn}";

        optionsStr = optionsStr.replace('{removeBtn}', removeBtn);

        if(row.head_teacher_id == 1){
            optionsStr = '';    //班主任 不能移除了
        }

        return optionsStr;
    }

    /* 格式化备选管理员列 */
    function formataddAdmin(val,row,index){
        var editBtn = '<a href="javascript:void(0);" onclick="addAdmin('+index+')" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                    '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">加为管理员</span>' +
                    '<span class="l-btn-icon icon-add"></span></span>' +
                    '</a>';
        var optionsStr = "{editBtn}";

        optionsStr = optionsStr.replace('{editBtn}', editBtn);

        return optionsStr;
    }

    /* 删除管理员 */
    function removeAdmin(index, field, value) {
        $('#admin-table').datagrid('clearSelections').datagrid('selectRow', index);
        var row = $('#admin-table').datagrid('getSelected');

        if(row){
            if(row.head_teacher_id == 1){
                //班主任 不移除
            }else{
                $('#admin-table').datagrid('deleteRow', index);
            }
        }
    }

    /* 新增管理员 */
    function addAdmin(index){
        $('#spare-admin-table').datagrid('selectRow', index);// 关键在这里  
        var row = $("#spare-admin-table").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if (row){
            var rowsLength = $('#admin-table').datagrid('getRows');
            var flag = true; //不相等

            if (rowsLength.length > 0) {     

                for (var j = 0; j <= rowsLength.length - 1; j++) {
                    if (rowsLength[j].id == row.id) {
                        flag = false; //相等
                        break;
                    } else {
                        flag = true;                        
                    }
                }//j End                    
            }//iend

            if (flag == true) {
                $('#admin-table').datagrid("appendRow", {
                    id: row.id,
                    teacherName: row.teacherName,
                });
            }
        }        
    }

    /* 根据条件查询符合条件的备选管理员 */
    function doSearch(){
        $('#spare-admin-table').datagrid('load',{
            structure_id: $('#structure').combotree('getValue'),
            teacher_name: $('#teacher_name').val()
        });
    }
    
    /* 取消 */
    function cancel()
    {
        /* 判断是否非班级管理员管理, 如班级管理员管理的话有两层弹窗 */
        if (parent.$('#openDialog').html().length == 0 || parent.$('#openDialog').is(":hidden") == true) {                     
            parent.$('#openWindow').window('close');
        } else {
            parent.$('#openDialog').dialog('close');       
        }
    }

    /* 保存管理员 */
    function saveAdmins()
    {
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        
        $('#save-btn').addClass('mylinkbtn-load');

        /* 获取表格所有的数据, 处理成JSON信息传给服务端 */
        var rows = $('#admin-table').datagrid('getRows');
        var entities = "[";

        for(i = 0;i < rows.length; i++) {            
            entities += (i == 0? '': ',') + JSON.stringify(rows[i]);           
        }

        entities += ']';        

        $.ajax({  
            url: '${pageContext.request.contextPath}/roleAction_editRoleMember.action',  
            type: "post",  
            async: false,  
            dataType: 'json',  
            data: {'entities': entities,'id':'${userRole.id}'},
            success: function (data) {
                $('#save-btn').removeClass('mylinkbtn-load');
                if(data.errMeg) {
                    window.parent.showAlert('操作失败', data.errMeg);
                } else {

                    /* 判断是否非班级管理员管理, 如班级管理员管理的话有两层弹窗 */
                    if (parent.$('#openDialog').html().length == 0 || parent.$('#openDialog').is(":hidden") == true) {
                        parent.window.closeWinIsReloadData = 1;                        
                        parent.$('#openWindow').window('close');
                    } else {

                        parent.window.closeDialogIsReloadData = 1;
                        parent.$('#openDialog').dialog('close');       
                    }
                    return;  
                }
            }
        });

        return false;
    }

    var selectNode;
    /* 异步获取集团结构 */
    $(function(){
        $('#structure').combotree({  
            //获取数据URL  
            //data: structures,
            url:'${pageContext.request.contextPath}/structureAction_findAll.action',
            formatter:function(node){
            	
                if(node.parent_id == 0){
                    node.text = '根目录';
                    selectNode = node;
                }else{
                    node.text = node.name
                }
                return node.text;
            },
            //选择树节点触发事件  
            onSelect : function(node) {

            }  
        });

        $('#structure').combotree('setValue', selectNode.id)
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id=""><ul class="tree"><li><div id="_easyui_tree_1" class="tree-node tree-node-selected"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">根目录</span></div><ul style="display:block"><li><div id="_easyui_tree_2" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">集团总部</span></div><ul style="display:block"><li><div id="_easyui_tree_3" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">行政部</span></div><ul style="display:block"><li><div id="_easyui_tree_4" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">新增子类</span></div><ul style="display:block"><li><div id="_easyui_tree_5" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">新增子类1</span></div></li></ul></li><li><div id="_easyui_tree_6" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">我色漆</span></div></li></ul></li><li><div id="_easyui_tree_7" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">市场部</span></div><ul style="display:block"><li><div id="_easyui_tree_8" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">新增子类1</span></div><ul style="display:block"><li><div id="_easyui_tree_9" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">新增子类</span></div></li><li><div id="_easyui_tree_10" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">新增子类11</span></div></li></ul></li></ul></li><li><div id="_easyui_tree_11" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">财务部</span></div></li><li><div id="_easyui_tree_12" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">新增子</span></div></li><li><div id="_easyui_tree_13" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">新增子类</span></div></li></ul></li><li><div id="_easyui_tree_14" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">Dear宝贝示范幼儿园</span></div><ul style="display:block"><li><div id="_easyui_tree_15" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_16" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_17" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_18" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li><li><div id="_easyui_tree_19" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">司南学辅2</span></div><ul style="display:block"><li><div id="_easyui_tree_20" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_21" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_22" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_23" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li><li><div id="_easyui_tree_24" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">司南学辅1</span></div><ul style="display:block"><li><div id="_easyui_tree_25" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_26" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_27" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_28" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li></ul></li></ul></div></div></body></html>