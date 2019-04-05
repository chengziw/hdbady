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



 <body style="padding:0px;margin:0px;">
  <form id="ff" method="post" name="submit" style="height:438px;" data-href="${pageContext.request.contextPath}/teacherAction_addTeacher.action"> 
   <div class="easyui-layout" fit="true" border="true"> 
    <div region="north" border="true" style="overflow:auto; padding:8px;height:368px; "> 
     <table width="100%" border="0" cellspacing="0" cellpadding="8"> 
      <tbody>
       <tr> 
        <td>教职工姓名：</td> 
        <td><input id="teacher_name" name="name" value="" class="easyui-textbox" required="true" data-options="validType: 'nameCheck'" style="width:100px;" /></td> 
        <td>性别：</td> 
        <td><input id="sex_name" name="sex" value="" required="true" data-options="validType:'noNull',panelHeight:'auto'" style="width:100px;" /></td> 
        <td>出生日期：</td> 
        <td><input id="brither_name" name="yearMonthDay" value="" required="true" data-options="" style="width:100px;" /></td> 
        <td>入职日期：</td> 
        <td><input id="entry_time_name" name="entry_time" required="true" value="0" class="easyui-textbox" data-options="" style="width:100px;" /></td> 
       </tr> 
       <tr> 
        <td>所属部门：</td> 
        <td colspan="3"> <input id="structure_id" name="structure_id" value="" required="true" data-options="validType:'noNull'" style="width:294px;" /> </td> 
        <td>职务：</td> 
        <td><input id="duty_id" name="duty_id" value="" required="true" data-options="validType:'noNull'" style="width:100px;" /></td> 
        <td>工号：</td> 
        <td><input id="worknumber" name="worknumber" required="true" value="" class="easyui-textbox"  data-options="validType:['name','MaxLength'],'noNull'" style="width:100px;" /></td> 
       </tr> 
       <tr> 
        <td>手机（登录名）：</td> 
        <td><input id="phone" name="phone" value="" required="true" class="easyui-textbox" data-options="validType:'mobile'" style="width:100px;" /></td> 
        <td>E-mail：</td> 
        <td><input id="email" name="email" value="" class="easyui-textbox" data-options="" style="width:100px;" /></td> 
        <td>微信：</td> 
        <td><input id="weixin" name="weixin" value="" class="easyui-textbox" data-options="validType:'MaxLength'" style="width:100px;" /></td> 
        <td>QQ号：</td> 
        <td><input id="qq" name="qq" value="" class="easyui-textbox" data-options="" style="width:100px;" /></td> 
       </tr> 
       <tr> 
        <td>登录密码：</td> 
        <td><input id="password" name="password" value="" required="true" class="easyui-textbox" data-options="validType:'space'" style="width:100px;" /></td> 
        <td colspan="6"></td> 
       </tr> 
       <tr id="teacherSubjectShow" style="display: none;"> 
        <td>所教科目：</td> 
        <td colspan="7"> 
         <div id="teacherSubject"></div> </td> 
       </tr> 
       <tr> 
        <td colspan="8" style="font-weight:bold; border-bottom:1px solid #cccccc; color:#555555; padding-top:18px;">以下为自定义资料项（若无请忽略）</td> 
       </tr> 
       <tr> 
        <td colspan="8"> 
         <table width="100%" border="0" cellspacing="0" cellpadding="6"> 
          <tbody>
           <tr> 
            <td width="100">自定义资料项1：</td> 
            <td> <input id="field1" name="field1" value="" class="easyui-textbox" data-options="" /> </td> 
            <td width="100">自定义资料项2：</td> 
            <td> <input id="field2" name="field2" value="" class="easyui-textbox" data-options="" /> </td> 
           </tr> 
           <tr> 
            <td>备注3：</td> 
            <td> <input id="field3" name="field3" value="" class="easyui-textbox" data-options="" /> </td> 
            <td>自定义资料项4：</td> 
            <td> <input id="field4" name="field4" value="" class="easyui-textbox" data-options="" /> </td> 
           </tr> 
          </tbody>
         </table> </td> 
       </tr> 
       <tr> 
        <td colspan="8"><span style="color:red;font-size:12px;" id="show-error-message-box"></span></td> 
       </tr> 
      </tbody>
     </table> 
    </div> 
    <div region="center" border="false" style="overflow:hidden;background-color:#E0ECFF; "> 
     <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;"> 
      <input type="hidden" name="action" value="add" /> 
      <a href="#" id="save-btn" class="easyui-linkbutton" iconcls="icon-save" onclick="saveFrom()">保存</a> 
      <a href="#" class="easyui-linkbutton panel-tool-close" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);">取消</a> 
     </div> 
    </div> 
   </div> 
  </form>
 </body>


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
        name:{
        	validator: function (value) {
                var reg = /^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/; 
                return reg.test(value);
            },
            message: '名字格式不准确.'
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
        //alert(url);
        //...
        $('#ff').form('submit',{
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

    /**
     * 根据学校ID 获取 科目
     * @param school_id
     */
    function getSubjectList(school_id){
        $.ajax({
            url:'/teacher/get-order-subject.html',
            data:{school_id:school_id},
            type:'GET',
            dataType:'JSON',
            success:function(data){
                if(data){
                    var i = data.length;
                    if(i>=1 && data[0]['id']) {
                        var html = '';var ids = '';var sinKey ='';
                        for(var $i=0;$i<i;$i++){
                            html += '<label><input type="checkbox" value="'+data[$i]['id']+'" name="subject_id[]">';
                            html += '<span class="">'+data[$i]['name']+'</span></label> &nbsp;&nbsp;';
                        }
                        $("#teacherSubject").html(html);
                    };
                }
            }
        })
    }

    $(function(){
        //部门
        var school_id_lock;
        $('#structure_id').combotree({
        	url:'${pageContext.request.contextPath}/structureAction_findAll.action',
            valueField:'id',
            textField:'text',
            editable:false,
            animate:true,
            lines:true,
            formatter:function(node){
                node.text = node.name;
                return node.text;
            },
            onLoadSuccess:function(){
                $('#structure_id').combotree("setValue","请选择");
            },
            onSelect:function(record){
                if(record.school_id > 0){
                    getSubjectList(record.school_id);
                    $("#teacherSubjectShow").show();
                }else{
                    $("#teacherSubjectShow").hide();
                    $("#teacherSubject").html('');
                }
            }
        })

        //职务
        $('#duty_id').combobox({
        	url:'${pageContext.request.contextPath}/teacherDutyAction_findAllTeacherDutyToSelect.action',
            valueField:'id',
            textField:'duty_id',
            editable:false,
            onLoadSuccess:function(){
                $('#duty_id').combobox("setValue","请选择");
            }
        });

        //性别
        var sex_data = [
            {id:1,sex_name:'男'},
            {id:2,sex_name:'女'}
        ];
        var sex = $('#sex_name').combobox({
            data:sex_data,
            valueField:'id',
            textField:'sex_name',
            editable:false,
            onLoadSuccess:function(){
                $('#sex_name').combobox("setValue","请选择");
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
        //出生日期
        $('#brither_name').datebox({
            buttons: buttons,
            editable:false
        });
        //入职日期
        $('#entry_time_name').datebox({
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id=""><ul class="tree tree-lines"><li><div id="_easyui_tree_1" class="tree-node tree-root-one tree-node-last"><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">请选择</span></div><ul style="display:block"><li><div id="_easyui_tree_2" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">集团总部</span></div><ul style="display:block"><li><div id="_easyui_tree_3" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">行政部</span></div></li><li><div id="_easyui_tree_4" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">市场部</span></div></li><li><div id="_easyui_tree_5" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-title">财务部</span></div></li></ul></li><li><div id="_easyui_tree_6" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">Dear宝贝示范幼儿园</span></div><ul style="display:block"><li><div id="_easyui_tree_7" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_8" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_9" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_10" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li><li><div id="_easyui_tree_11" class="tree-node"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">Dear宝贝【南山】幼儿园</span></div><ul style="display:block"><li><div id="_easyui_tree_12" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_13" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_14" class="tree-node"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_15" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent tree-line"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li><li><div id="_easyui_tree_16" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-hit tree-expanded"></span><span class="tree-icon tree-folder tree-folder-open "></span><span class="tree-title">北京励德幼儿园</span></div><ul style="display:block"><li><div id="_easyui_tree_17" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">教学部</span></div></li><li><div id="_easyui_tree_18" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">保健部</span></div></li><li><div id="_easyui_tree_19" class="tree-node"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-join"></span><span class="tree-icon tree-file "></span><span class="tree-title">后勤部</span></div></li><li><div id="_easyui_tree_20" class="tree-node tree-node-last"><span class="tree-indent"></span><span class="tree-indent"></span><span class="tree-indent tree-joinbottom"></span><span class="tree-icon tree-file "></span><span class="tree-title">家长中心</span></div></li></ul></li></ul></li></ul></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">董事长</div><div id="_easyui_combobox_i1_1" class="combobox-item">园长</div><div id="_easyui_combobox_i1_2" class="combobox-item">副园长</div><div id="_easyui_combobox_i1_3" class="combobox-item">教务主任</div><div id="_easyui_combobox_i1_4" class="combobox-item">后勤主任</div><div id="_easyui_combobox_i1_5" class="combobox-item">办公室主任</div><div id="_easyui_combobox_i1_6" class="combobox-item">财务主任</div><div id="_easyui_combobox_i1_7" class="combobox-item">年级组长</div><div id="_easyui_combobox_i1_8" class="combobox-item">班主任</div><div id="_easyui_combobox_i1_9" class="combobox-item">教师</div><div id="_easyui_combobox_i1_10" class="combobox-item">保健医生</div><div id="_easyui_combobox_i1_11" class="combobox-item">会计</div><div id="_easyui_combobox_i1_12" class="combobox-item">出纳</div><div id="_easyui_combobox_i1_13" class="combobox-item">采购</div><div id="_easyui_combobox_i1_14" class="combobox-item">保安</div><div id="_easyui_combobox_i1_15" class="combobox-item">普通职工</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item">男</div><div id="_easyui_combobox_i2_1" class="combobox-item">女</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day " abbr="2017,1,24" style="">24</td><td class="calendar-day " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">1月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2016,12,25" style="">25</td><td class="calendar-day calendar-other-month " abbr="2016,12,26" style="">26</td><td class="calendar-day calendar-other-month " abbr="2016,12,27" style="">27</td><td class="calendar-day calendar-other-month " abbr="2016,12,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2016,12,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2016,12,30" style="">30</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2016,12,31" style="">31</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,1" style="">1</td><td class="calendar-day " abbr="2017,1,2" style="">2</td><td class="calendar-day " abbr="2017,1,3" style="">3</td><td class="calendar-day " abbr="2017,1,4" style="">4</td><td class="calendar-day " abbr="2017,1,5" style="">5</td><td class="calendar-day " abbr="2017,1,6" style="">6</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,7" style="">7</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,8" style="">8</td><td class="calendar-day " abbr="2017,1,9" style="">9</td><td class="calendar-day " abbr="2017,1,10" style="">10</td><td class="calendar-day " abbr="2017,1,11" style="">11</td><td class="calendar-day " abbr="2017,1,12" style="">12</td><td class="calendar-day " abbr="2017,1,13" style="">13</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,14" style="">14</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,15" style="">15</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,1,16" style="">16</td><td class="calendar-day " abbr="2017,1,17" style="">17</td><td class="calendar-day " abbr="2017,1,18" style="">18</td><td class="calendar-day " abbr="2017,1,19" style="">19</td><td class="calendar-day " abbr="2017,1,20" style="">20</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,21" style="">21</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,22" style="">22</td><td class="calendar-day " abbr="2017,1,23" style="">23</td><td class="calendar-day " abbr="2017,1,24" style="">24</td><td class="calendar-day " abbr="2017,1,25" style="">25</td><td class="calendar-day " abbr="2017,1,26" style="">26</td><td class="calendar-day " abbr="2017,1,27" style="">27</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,1,28" style="">28</td></tr><tr class="calendar-last"><td class="calendar-day calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day " abbr="2017,1,30" style="">30</td><td class="calendar-day " abbr="2017,1,31" style="">31</td><td class="calendar-day calendar-other-month " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,2,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr></tbody></table></div></div></div></div></div></body></html>