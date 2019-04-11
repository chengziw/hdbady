<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>汤圆幼儿园</title>
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
            <!-- <div id="main_body_tool" region="west" style="width:588px; padding-right:18px;" border="false"> -->
                <!--<a href="#" onclick="javascript:openParentWindow();return false;" class="easyui-linkbutton" iconCls="icon-help">打开父类窗口</a>-->
                                                    <%-- <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="addSchool();">新建学校</a>


                &nbsp;&nbsp;&nbsp;&nbsp;<span id="schoolText">最多可以创建一所学校,别问为什么,就一个汤圆幼儿园.</span> --%>
                            <!-- </div> -->
            <!--工具栏结束-->

        </div>
        <!--工具按钮和筛选栏目结束-->

    </div>

    <div region="center" border="false" id="main_body_datagrid" style="padding:8px; padding-bottom:0px;">
        
        <!--数据表开始-->
        <table id="school-data-table" class="easyui-datagrid"
        data-options="fitColumns:true,fit:true,pagination:true,
               singleSelect:true,pageList:[15,20,25,30,40,50,100],pageSize:25,rownumbers:true,checkOnSelect:true,
               onLoadSuccess: dataLoadSuccess,
        url:'${pageContext.request.contextPath}/schoolAction_pageQuery.action',method:'get'">
            <thead>
                <tr>
                    <th data-options="field:'school_name',width:120">学校名称</th>
                    <th data-options="field:'province_name',width:50" sortable="true">省份</th>
                    <th data-options="field:'city_name',width:60" sortable="true">城市</th>
                    <th data-options="field:'area_name',width:60" sortable="true">区县</th>
                    <th data-options="field:'school_addr',width:100">详细地址</th>
                    <th data-options="field:'first_start_month',width:100">第一学期（开始月）</th>
                    <th data-options="field:'last_start_month',width:100">第二学期（开始月）</th>
                    <th data-options="field:'next_class_up_date',width:80" sortable="true">下次升级日</th>
                    <th data-options="field:'last_class_up_date',width:80" sortable="true">最近升级日</th>
                    <th data-options="field:'school_level',width:60" sortable="true">在校生数</th>
                    <th data-options="field:'edit',width:160, formatter: formatOper">操作</th>
                </tr>
            </thead>
        </table>
        <!--数据表结束-->
            
    </div>

</div>

<script type="text/javascript">
    var hasEditPermission = 'true';
    hasEditPermission = eval('('+hasEditPermission+')');

    var allSchoolNum = 0;

    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录
            $(this).datagrid('appendRow', { school_name: '<div style="text-align:center;color:red">没有找到记录！</div>' })
                .datagrid('mergeCells', { index: 0, field: 'school_name', colspan: 15 })
        }
        allSchoolNum = data.total;
    }

    /* 格式化操作列 */
    function formatOper(val,row,index){
        var editBtn = '';

        if (hasEditPermission) {
            editBtn = '<a onclick="editSchool('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">编辑</span>' +
                '<span class="l-btn-icon icon-edit">&nbsp;</span></span>' +
                '</a>';

            if(row.lng>0 && row.lat > 0){
                var mapText = '';
            }else{
                var mapText = '<font color="red">(未标注)</font>';
            }

            /* editBtn += '<a onclick="markedSchool('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
                '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">定位'+mapText+'</span>' +
                '<span class="l-btn-icon icon-dingwei">&nbsp;</span></span>' +
                '</a>'; */
        }


        /* editBtn += '<a onclick="webSite('+index+')" href="javascript:void(0);" class="easyui-linkbutton" style="cursor:pointer; color:#000000;">' +
            '<span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">微官网</span>' +
            '<span class="l-btn-icon icon-chakan">&nbsp;</span></span>' +
            '</a>'; */


        var optionsStr = "{editBtn}";

        optionsStr = optionsStr.replace('{editBtn}', editBtn);

        return optionsStr;
    }

    /* 关闭弹窗时, 重新刷新数据 */
    function closeEdit() {
        $('#school-data-table').datagrid('load',{});
    }

    /* 编辑学校 */
    function editSchool(index){
        $('#school-data-table').datagrid('selectRow', index);// 关键在这里  
        var row = $("#school-data-table").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        var id = row.id;
        var url = '${pageContext.request.contextPath}/schoolAction_edit.action?id='+id+'';
        if (row){
            openTopWindow(url, '编辑学校信息', 620, 720, 'closeEdit');
        }
    }
    /* 标注学校 */
    function markedSchool(index){
        $('#school-data-table').datagrid('selectRow', index);// 关键在这里
        var row = $("#school-data-table").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if (row){
            openTopWindow(row.marked_url, '标注学校位置', 808, 528, 'closeEdit');
        }
    }

    /* 学校微官网 */
    function webSite(index){
        $('#school-data-table').datagrid('selectRow', index);// 关键在这里
        var row = $("#school-data-table").datagrid('getSelected'); //将选中的一行记录赋值给一个对象
        if (row){
            openTopWindow(row.webSiteUrl, '预览学校微官网', 380, 620, 'closeEdit');
        }
    }

    /* 添加学校 */
    function addSchool(){
        if(2 <= allSchoolNum){
            $.messager.alert('提示',$("#schoolText").html(),'warning');
            return false;
        }
        var url='${pageContext.request.contextPath}/page_parameter_school-add.action';
        openTopWindow(url, '新建学校', 620, 628, 'closeEdit');
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