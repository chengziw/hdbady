<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<form id="ff" method="post" style="height:308px;" data-href="/teacher/save-shift-teacher.html?id=16&amp;sinKey=ae9d%257F%2587%2583G7%25B6%2525%25CDF%258F%25A5%251A%252CEi%25A5%259D%2588%25DB%2507%25D0%25DBw%2580%25EC%25AB%25C29%2502%258AC%25CC%2529%25B78p%258A.%25C3%2512%2501Y" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 796px; height: 308px;">

        <div class="panel layout-panel layout-panel-north" style="width: 796px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 778px; height: 220px;" title="" class="panel-body panel-body-noheader layout-body">

            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td width="200">教职工姓名：</td>
                    <td width="120"><s:property value="teacher.teacher_name"/></td>
                    <td width="100">性别：</td>
                    <td width="60"><s:property value="teacher.sex_name"/></td>
                    <td width="80">出生日期：</td>
                    <td width="100"><s:property value="teacher.brither_name"/></td>
                    <td width="60">工号：</td>
                    <td><s:property value="teacher.worknumber"/></td>
                </tr>

                <tr>
                    <td>当前所属部门：</td>
                    <td colspan="3"><s:property value="teacher.structure.name"/> </td>
                    <td>当前职务：</td>
                    <td><s:property value="teacher.teacherDuty.duty_name"/></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>变更后的部门：</td>
                    <td colspan="3">
                        <input id="structure_id" name="structure.id" value="" required="true" data-options="validType:'noNull',panelHeight:'160'" style="width: 270px; display: none;" class="combotree-f combo-f textbox-f" textboxname="structure_name" comboname="structure_name">
                    </td>
                    <td>变更后职务：</td>
                    <td><input id="duty_id" name="teacherDuty.id" value="" required="true" data-options="validType:'noNull',panelHeight:'160'" style="width: 100px; display: none;" class="combobox-f combo-f textbox-f" textboxname="duty_id" comboname="duty_id"></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>调动日期：</td>
                    <td><input id="change_date" name="change_date" value="0" required="true" data-options="" class="datebox-f combo-f textbox-f" style="display: none;" textboxname="change_date" comboname="change_date"></td>
                    <td>调动备注：</td>
                    <td colspan="5"><input id="note" name="note" class="easyui-textbox textbox-f" style="width: 350px; display: none;" data-options="validType:'MaxLength'" textboxname="note"></td>
                </tr>

                <tr>
                    <td colspan="8"><span style="color:red;font-size:12px;" id="show-error-message-box"></span></td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 796px; left: 0px; top: 237px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 796px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <!-- <input name="action" value="edit" type="hidden"> -->
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>
		<input name="id" value="<s:property value="teacher.id"/>" readonly="true" type="hidden" style："border:none"/></td>             
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
</form>


<script type="text/javascript">
    $.extend($.fn.validatebox.defaults.rules, {
        noNull: {
            validator: function(value, param){
                if(value=='请选择' || value==''){
                    return false;
                }
                return true;
            },
            message: '此输入项为必输项'
        },
        mobile: {//value值为文本框中的值
            validator: function (value) {
                var reg = /^1[3|4|5|7|8|9]\d{9}$/;
                return reg.test(value);
            },
            message: '输入手机号码格式不准确.'
        },
        passW: {//value值为文本框中的值
            validator: function (value) {
                if(value.length < 6) return false;
                else return true;
            },
            message: '密码长度最少6位.'
        },
        MaxLength: {
        	validator: function (value) {
        		var reg=/[\u4E00-\u9FA5]/g;
        		var reg2=/[A-Za-z0-9]/g;
        		var len=0;
        		var len2=0;
        		/* value.match(reg).length  算长度*/
        		
        		if(value.match(reg)!=null){
        			   len=value.match(reg).length*2;
        			}
        			if(value.match(reg2)!=null){
        			   len2=value.match(reg2).length;
        			}
        		var sum=len+len2;
        		if (sum > 32) { //返回中文的个数
        				return false;
        		}
        		return true;
            },
            message: '不能超过32个字母数字或16个汉字.'
        }
    })

    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

        var url = $("#ff").attr('data-href');
        $('#ff').form('submit',{
        	url:'${pageContext.request.contextPath}/teacherAction_shiftTeacher.action',
            onSubmit:function(params){
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


    $(function(){

        //部门
        $('#structure_id').combotree({
        	url:'${pageContext.request.contextPath}/structureAction_findAll.action',
            valueField:'id',
            textField:'name',
            editable:false,
            animate:true,
            lines:true,
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            onLoadSuccess:function(){
                $('#structure_name').combotree('setValue','请选择');
            }
        })

        //职务
        $('#duty_id').combobox({
        	url:'${pageContext.request.contextPath}/teacherDutyAction_findAllTeacherDuty.action',
            valueField:'id',
            textField:'duty_id',
            editable:false,
            value:'',
            onLoadSuccess:function(){
                $('#duty_name').combobox("setValue","请选择");
            }
        });

        //  清空按钮
        var buttons = $.extend([], $.fn.datebox.defaults.buttons);
        buttons.splice(1, 0, {
            text: '清空',
            handler: function(target){
                $('#'+$(target).attr('id')).datebox("setValue","").datebox('hidePanel');
            }
        });

        //变动日期
        $('#change_date').datebox({
            buttons: buttons,
            editable:false
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id=""><ul class="tree tree-lines"><li><div id="_easyui_tree_1" class="tree-node tree-root-one tree-node-last"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">请选择</span></div><ul style="display:block"><li><div id="_easyui_tree_2" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">集团总部</span></div><ul style="display:block"><li><div id="_easyui_tree_3" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">行政部</span></div></li><li><div id="_easyui_tree_4" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">市场部</span></div></li><li><div id="_easyui_tree_5" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-title">财务部</span></div></li></ul></li><li><div id="_easyui_tree_6" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">Dear宝贝示范幼儿园</span></div><ul style="display:block"><li><div id="_easyui_tree_7" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_8" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_9" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_10" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li><li><div id="_easyui_tree_11" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">司南学辅2</span></div><ul style="display:block"><li><div id="_easyui_tree_12" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_13" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_14" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_15" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li><li><div id="_easyui_tree_16" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">司南学辅1</span></div><ul style="display:block"><li><div id="_easyui_tree_17" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_18" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_19" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_20" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li></ul></li></ul></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">董事长</div><div id="_easyui_combobox_i1_1" class="combobox-item">园长</div><div id="_easyui_combobox_i1_2" class="combobox-item">副园长</div><div id="_easyui_combobox_i1_3" class="combobox-item">教务主任</div><div id="_easyui_combobox_i1_4" class="combobox-item">后勤主任</div><div id="_easyui_combobox_i1_5" class="combobox-item">办公室主任</div><div id="_easyui_combobox_i1_6" class="combobox-item">财务主任</div><div id="_easyui_combobox_i1_7" class="combobox-item">年级组长</div><div id="_easyui_combobox_i1_8" class="combobox-item">班主任</div><div id="_easyui_combobox_i1_9" class="combobox-item combobox-item-selected">教师</div><div id="_easyui_combobox_i1_10" class="combobox-item">保健医生</div><div id="_easyui_combobox_i1_11" class="combobox-item">会计</div><div id="_easyui_combobox_i1_12" class="combobox-item">出纳</div><div id="_easyui_combobox_i1_13" class="combobox-item">采购</div><div id="_easyui_combobox_i1_14" class="combobox-item">保安</div><div id="_easyui_combobox_i1_15" class="combobox-item">普通职工</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">2月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2017,1,30" style="">30</td><td class="calendar-day calendar-other-month " abbr="2017,1,31" style="">31</td><td class="calendar-day " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,2,2" style="">2</td><td class="calendar-day " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,5" style="">5</td><td class="calendar-day " abbr="2017,2,6" style="">6</td><td class="calendar-day " abbr="2017,2,7" style="">7</td><td class="calendar-day " abbr="2017,2,8" style="">8</td><td class="calendar-day " abbr="2017,2,9" style="">9</td><td class="calendar-day " abbr="2017,2,10" style="">10</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,12" style="">12</td><td class="calendar-day " abbr="2017,2,13" style="">13</td><td class="calendar-day " abbr="2017,2,14" style="">14</td><td class="calendar-day " abbr="2017,2,15" style="">15</td><td class="calendar-day " abbr="2017,2,16" style="">16</td><td class="calendar-day " abbr="2017,2,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,19" style="">19</td><td class="calendar-day " abbr="2017,2,20" style="">20</td><td class="calendar-day " abbr="2017,2,21" style="">21</td><td class="calendar-day " abbr="2017,2,22" style="">22</td><td class="calendar-day " abbr="2017,2,23" style="">23</td><td class="calendar-day " abbr="2017,2,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day " abbr="2017,2,27" style="">27</td><td class="calendar-day " abbr="2017,2,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2017,3,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,3,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,3,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,3,7" style="">7</td><td class="calendar-day calendar-other-month " abbr="2017,3,8" style="">8</td><td class="calendar-day calendar-other-month " abbr="2017,3,9" style="">9</td><td class="calendar-day calendar-other-month " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div></body></html>