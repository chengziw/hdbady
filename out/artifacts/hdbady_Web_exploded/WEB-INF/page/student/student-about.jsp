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

<style type="text/css">
    .fitem{ line-height: 30px; }
    .lad_text{ font-size: 12px; width: 70px; display: inline-block;}
    .span_text{ font-size: 12px; color: #999;}
    .span_text2{ font-size: 12px;}
</style>


<form id="ff" method="post" style="height:628px;" data-href="/student/save.html?sinKey=1ad2%257F%258B%25D6%25F5Q%25C1%2591%2518n%251D%2560%25CCu%25D8%2587%2511%25CB%25F3%2594.%2521r%257F%25FCO%2595%25F9%253BjEi%2528%252C%2511c%25AA%2518%252Cr%25CB%25D9%25B0D" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 976px; height: 628px;">

        <div class="panel layout-panel layout-panel-north" style="width: 976px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 958px; height: 540px;" title="" class="panel-body panel-body-noheader layout-body">

            <table style="margin-bottom:18px;" width="100%" cellspacing="1" cellpadding="8" border="0" bgcolor="#dddddd">

                <tbody><tr>
                    <td bgcolor="#EBEBEB" align="right">学生状态：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.status_name_text"/></td>
                    <td bgcolor="#EBEBEB" align="right">离校日期：</td>
                    <td bgcolor="#FFFFFF"></td>
                    <td bgcolor="#EBEBEB" align="right">注册时间：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.enter_date"/></td>
                    <td bgcolor="#EBEBEB" align="right">预约接待老师：</td>
                    <td bgcolor="#FFFFFF"></td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">学号：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.student_no"/></td>
                    <td bgcolor="#EBEBEB" align="right">学校：</td>
                    <td bgcolor="#FFFFFF">华德幼儿园</td>
                    <td bgcolor="#EBEBEB" align="right">年级：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.grade.name"/></td>
                    <td bgcolor="#EBEBEB" align="right">班级：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.classes.class_name"/></td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">姓名：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.name"/></td>
                    <td bgcolor="#EBEBEB" align="right">性别：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.sex"/></td>
                    <td bgcolor="#EBEBEB" align="right">出生日期：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.yearMonthDay"/></td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">本地生源：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.is_local"/></td>
                    <td bgcolor="#EBEBEB" align="right">教职子弟：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.is_teacherson"/></td>
                    <td bgcolor="#EBEBEB" align="right">户口类型：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.census_type"/></td>
                    <td bgcolor="#EBEBEB" align="right">入学日期：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.enter_date"/></td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">家长姓名：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.parent_name"/></td>
                    <td bgcolor="#EBEBEB" align="right">关系：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.relationship"/></td>
                    <td bgcolor="#EBEBEB" align="right">手机号：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.phone"/></td>
                    <td bgcolor="#EBEBEB" align="right">家庭住址：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.address"/></td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">兴趣爱好：</td>
                    <td colspan="7" bgcolor="#FFFFFF">
                                            </td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">学生要求：</td>
                    <td colspan="7" bgcolor="#FFFFFF"><s:property value="student.demand"/></td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">身体状况：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.health_status"/></td>
                    <td bgcolor="#EBEBEB" align="right">有无过敏史：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.is_allergy"/></td>
                    <td bgcolor="#EBEBEB" align="right">有无先天病：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.is_predisease"/></td>
                    <td bgcolor="#EBEBEB" align="right">有无体检表：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.is_health_form"/></td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">验证证明：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.is_health_verify"/></td>
                    <td bgcolor="#EBEBEB" align="right">接种复印件：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.is_ccine"/></td>
                    <td bgcolor="#EBEBEB" align="right">血型：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.blood_type"/></td>
                    <td bgcolor="#EBEBEB" align="right">易患何病：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.commom_disease"/></td>
                </tr>

                <tr>
                    <td bgcolor="#EBEBEB" align="right">就读方式：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.timetype_id"/></td>
                    <td bgcolor="#EBEBEB" align="right">独生子女：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.is_only_child"/></td>
                    <td bgcolor="#EBEBEB" align="right">出生地：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.birthplace"/></td>
                    <td bgcolor="#EBEBEB" align="right">身份证：</td>
                    <td bgcolor="#FFFFFF"><s:property value="student.identity_card"/></td>
                </tr>

				<%-- <tr>
                    <td bgcolor="#EBEBEB" align="right">学校备注：</td>
                    <td colspan="7" bgcolor="#FFFFFF"><s:property value="student.demand"/></td>
                </tr> --%>
				
                <tr>
                    <td bgcolor="#EBEBEB" align="right">学校备注：</td>
                    <td colspan="7" bgcolor="#FFFFFF"><s:property value="student.note"/></td>
                </tr>

          </tbody></table>
		  
		  <table style="margin-bottom:18px;" width="100%" cellspacing="1" cellpadding="8" border="0" bgcolor="#dddddd">
		  	<tbody><tr bgcolor="#FFFFFF" align="left">
		  		<tr>
                				<td width="80" bgcolor="#EBEBEB">自定义资料项1</td>
				<td><s:property value="student.field1"/></td>
				</tr>
				<tr>
                				<td width="80" bgcolor="#EBEBEB">自定义资料项2</td>
				<td><s:property value="student.field2"/></td>
				</tr>
				<tr>
                				<td width="80" bgcolor="#EBEBEB">自定义资料项3</td>
				<td><s:property value="student.field3"/></td>
				</tr>
                			</tr>
		  </tbody></table>

            <%-- <div class="panel datagrid easyui-fluid" style="width: 958px;"><div class="panel-header" style="width: 946px;"><div class="panel-title">已在手机APP注册的家长</div><div class="panel-tool"></div></div><div class="datagrid-wrap panel-body" title="" style="width: 956px;"><div class="datagrid-view" style="width: 956px; height: 50px;"><div class="datagrid-view1" style="width: 31px;"><div class="datagrid-header" style="width: 31px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td rowspan="0"><div class="datagrid-header-rownumber"></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 31px; margin-top: 0px; height: 25px;"><div class="datagrid-body-inner"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r1-1-0" class="datagrid-row" datagrid-row-index="0" style="height: 25px;"><td class="datagrid-td-rownumber"><div class="datagrid-cell-rownumber">1</div></td></tr></tbody></table></div></div><div class="datagrid-footer" style="width: 31px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><div class="datagrid-view2" style="width: 925px;"><div class="datagrid-header" style="width: 925px; height: 24px;"><div class="datagrid-header-inner" style="display: block;"><table class="datagrid-htable" style="height: 25px;" cellspacing="0" cellpadding="0" border="0"><tbody><tr class="datagrid-header-row"><td field="name"><div class="datagrid-cell datagrid-cell-c1-name" style=""><span>家长称呼</span><span class="datagrid-sort-icon"></span></div></td><td field="phone"><div class="datagrid-cell datagrid-cell-c1-phone" style=""><span>手机号</span><span class="datagrid-sort-icon"></span></div></td><td field="qq"><div class="datagrid-cell datagrid-cell-c1-qq" style=""><span>QQ号</span><span class="datagrid-sort-icon"></span></div></td><td field="weixin"><div class="datagrid-cell datagrid-cell-c1-weixin" style=""><span>微信号</span><span class="datagrid-sort-icon"></span></div></td><td field="last_login_time_name"><div class="datagrid-cell datagrid-cell-c1-last_login_time_name" style=""><span>最近登录时间</span><span class="datagrid-sort-icon"></span></div></td><td field="create_time_name"><div class="datagrid-cell datagrid-cell-c1-create_time_name" style=""><span>注册时间</span><span class="datagrid-sort-icon"></span></div></td></tr></tbody></table></div></div><div class="datagrid-body" style="width: 925px; margin-top: 0px; overflow-x: hidden; height: 25px;"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr id="datagrid-row-r1-2-0" class="datagrid-row" datagrid-row-index="0" style="height: 25px;"><td field="name" rowspan="1" colspan="6" class="datagrid-td-merged"><div style="height: auto; width: 898px;" class="datagrid-cell datagrid-cell-c1-name"><div style="text-align:center;color:red">没有找到记录！</div></div></td><td field="phone" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-phone"></div></td><td field="qq" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-qq"></div></td><td field="weixin" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-weixin"></div></td><td field="last_login_time_name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-last_login_time_name"></div></td><td field="create_time_name" style="display: none;"><div style="height:auto;" class="datagrid-cell datagrid-cell-c1-create_time_name"></div></td></tr></tbody></table></div><div class="datagrid-footer" style="width: 925px;"><div class="datagrid-footer-inner" style="display: none;"></div></div></div><table id="tt" class="easyui-datagrid datagrid-f" title="已在手机APP注册的家长" style="display: none;" data-options="url:'/student/get-student-parent.html?student_id=1047',
                            onLoadSuccess: dataLoadSuccess,
                               fitColumns:true,singleSelect:true,rownumbers:true">
                <thead>
                <tr>
                    <th data-options="field:'name',width:100">家长称呼</th>
                    <th data-options="field:'phone',width:100">手机号</th>
                    <th data-options="field:'qq',width:80">QQ号</th>
                    <th data-options="field:'weixin',width:80">微信号</th>
                    <th data-options="field:'last_login_time_name',width:120">最近登录时间</th>
                    <th data-options="field:'create_time_name',width:120">注册时间</th>
                </tr>
                </thead>
            </table><style type="text/css" easyui="true">
.datagrid-cell-c1-name{width:91px}
.datagrid-cell-c1-phone{width:91px}
.datagrid-cell-c1-qq{width:71px}
.datagrid-cell-c1-weixin{width:71px}
.datagrid-cell-c1-last_login_time_name{width:111px}
.datagrid-cell-c1-create_time_name{width:111px}
</style></div></div></div>
        </div></div> --%>


        <div class="panel layout-panel layout-panel-center" style="width: 976px; left: 0px; top: 557px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 976px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <!--<a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="saveFrom()">保存</a>-->
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">关闭</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
    /**
     * 表格加载完成
     * @param data
     */
    function dataLoadSuccess(data){
        if(data.total == 0){ //没有记录 
            $(this).datagrid('appendRow', { name: '&lt;div style="text-align:center;color:red"&gt;没有找到记录！&lt;/div&gt;' })
                .datagrid('mergeCells', { index: 0, field: 'name', colspan: 6 })
        }
    }
</script>


<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
        loadWindow();
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