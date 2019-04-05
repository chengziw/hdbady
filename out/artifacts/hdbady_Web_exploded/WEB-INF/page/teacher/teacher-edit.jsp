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


<form id="ff" method="post" style="height:438px;" data-href="/teacher/save.html?id=16&amp;sinKey=d942%25B3%2504%25EF%2597tC%25AE%2506v2f%250A1%25CD%25FDel%25CBU%2519%25F7F%250Dt%257F%2591o%251B%25F4%25BE%251B%25F5S%25C6%25E3%2528%25AA%25CBEK%259D" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 856px; height: 438px;">

        <div class="panel layout-panel layout-panel-north" style="width: 856px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 838px; height: 350px;" title="" class="panel-body panel-body-noheader layout-body">
			<input name="id" type="hidden" value="<s:property value="teacher.id"/>">
            <table width="100%" cellspacing="0" cellpadding="8" border="0">
                <tbody><tr>
                    <td>教职工姓名：</td>
                    <td><input id="teacher_name" name="teacher_name" value="<s:property value="teacher.teacher_name"/>" class="easyui-textbox textbox-f" required="true" data-options="validType:['name','MaxLength']" style="width: 100px; display: none;" textboxname="name"></td>
                    <td>性别：</td>
                    <td><input id="sex_name" name="sex_name" value="<s:property value="teacher.sex_name"/>" class="easyui-combobox combobox-f combo-f textbox-f" required="true" data-options="panelHeight:'auto',validType:'noNull'" style="width: 100px; display: none;" textboxname="sex" comboname="sex"></td>
                    <td>出生日期：</td>
                    <td><input id="brither_name" name="brither_name" value="<s:property value="teacher.brither_name"/>" required="true" data-options="" style="width: 100px; display: none;" class="datebox-f combo-f textbox-f" textboxname="brither_name" comboname="brither_name"></td>
                    <td>入职日期：</td>
                    <td><input id="entry_time_name" name="entry_time_name" required="true" value="<s:property value="teacher.entry_time_name"/>" class="easyui-textbox textbox-f datebox-f combo-f" data-options="" style="width: 100px; display: none;" textboxname="entry_time_name" comboname="entry_time_name"></td>
                </tr>

                <tr>
                    <td>当前所属部门：</td>
                    <td colspan="3"><s:property value="teacher.structure.name"/> </td>
                    <td>职务：</td>
                    <td><s:property value="teacher.teacherDuty.duty_name"/></td>
                    <td>工号：</td>
                    <td><input id="worknumber" name="worknumber" value="<s:property value="teacher.worknumber"/>" class="easyui-textbox textbox-f" data-options="validType:['MaxLength']" style="width: 100px; display: none;" textboxname="worknumber"></td>
                </tr>

                <tr>
                    <td>手机（登录名）：</td>
                    <td><input id="phone" name="phone" value="<s:property value="teacher.phone"/>" required="true" class="easyui-textbox textbox-f" data-options="validType:'mobile'" style="width: 100px; display: none;" textboxname="phone"></td>
                    <td>E-mail：</td>
                    <td><input id="email" name="email" value="<s:property value="teacher.email"/>" class="easyui-textbox textbox-f" data-options="validType:['email','MaxLength']" style="width: 100px; display: none;" textboxname="email"></td>
                    <td>微信：</td>
                    <td><input id="weixin" name="weixin" value="<s:property value="teacher.weixin"/>" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="width: 100px; display: none;" textboxname="weixin"></td>
                    <td>QQ号：</td>
                    <td><input id="qq" name="qq" value="<s:property value="teacher.qq"/>" class="easyui-textbox textbox-f" data-options="validType:['number','MaxLength']" style="width: 100px; display: none;" textboxname="qq"></td>
                </tr>

                <tr>
                    <td>登录密码：</td>
                    <td><div id="passwordStyle" style="position: relative;">
                            <span class="textbox" style="width: 100px; height: 20px;">
<input id="password" name="password" value="<s:property value="teacher.password"/>" class="easyui-textbox textbox-text" type="password"  data-options="validType:['passW','MaxLength']"  autocomplete="off" placeholder="留空不修改" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 100px;"textboxname="password" >
</span>
                        <div id="passwordText" style="display: none;position:absolute; top:5px;left:10px;color:#aaa;font-size:12px;">请输入密码</div>
                        </div>
                    </td>
                    <td>最近登录：</td>
                    <td><s:property value="teacher.last_login_time_name"/></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr id="teacherSubjectShow">
                    <td>所教科目：</td>
                    <td colspan="7">
                    	<div id="teacherSubject">
                    		<s:iterator value="list">
                    			<s:property value="subject_name"/>
                    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    		</s:iterator>
                        </div>
                    
                        <%-- <div id="teacherSubject">
                            <label><input checked="true" value="14" name="subject_id" type="checkbox"><span class="">美术</span></label> &nbsp;&nbsp;
                            <label><input value="13" name="subject_id" type="checkbox"><span class="">科学</span></label> &nbsp;&nbsp;
                            <label><input value="12" name="subject_id" type="checkbox"><span class="">社会</span></label> &nbsp;&nbsp;
                            <label><input value="11" name="subject_id" type="checkbox"><span class="">健康</span></label> &nbsp;&nbsp;
                            <label><input value="10" name="subject_id" type="checkbox"><span class="">语言</span></label> &nbsp;&nbsp;
                            <label><input value="9" name="subject_id" type="checkbox"><span class="">计算</span></label> &nbsp;&nbsp;
                            <label><input value="8" name="subject_id" type="checkbox"><span class="">音乐</span></label> &nbsp;&nbsp;                       
                        </div> --%>
                    </td>
                </tr>			
				
				<input id="id" value="<s:property value="teacher.id"/>" type="hidden">
				
                <tr>
                    
                    <td colspan="8" style="font-weight:bold; border-bottom:1px solid #cccccc; color:#555555; padding-top:18px;">以下为自定义资料项（若无请忽略）</td>
                </tr>
				
                <tr>
                    
                    <td colspan="8">
					
<table width="100%" cellspacing="0" cellpadding="6" border="0">
  <tbody><tr>
    <td width="100">自定义资料项1：</td>
    <td>
                                                    <input id="field1" name="field1" value="<s:property value="teacher.field1"/>" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;" textboxname="field1">
                        	</td>
	
    <td width="100">自定义资料项2：</td>
    <td>
                                                    <input id="field2" name="field2" value="<s:property value="teacher.field2"/>" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;" textboxname="field2">
                        	</td>
  </tr>
  <tr>
	
    <td>自定义资料项3：</td>
    <td>
                                                    <input id="field3" name="field3" value="<s:property value="teacher.field3"/>" class="easyui-textbox textbox-f" data-options="validType:'MaxLength'" style="display: none;" textboxname="field4">
                        	</td>
  </tr>
</tbody></table>

					
					</td>
                </tr>

                <tr>
                    <td colspan="8"><span style="color:red;font-size:12px;" id="show-error-message-box"></span></td>
                </tr>
            </tbody></table>

        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 856px; left: 0px; top: 367px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 856px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <!-- <input name="action" value="edit" type="hidden"> -->
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close',true);" group="" id="">取消</a>
            </div>
        </div></div>

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
                if(value.length < 6 || value.length > 32) return false;
                else return true;
            },
            message: '密码长度应为6位到32位.'
        },
        name:{
        	validator: function (value) {
                var reg = /^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/; 
                return reg.test(value);
            },
            message: '名字格式不准确.'
        },
        number: {
        	validator: function (value) {
                var reg = /^[0-9]*$/;
                return reg.test(value);
            },
            message: '请输入数字！'
        },
        email:{
            validator: function (value) {
                var reg = /^[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$/;
                return reg.test(value);
            },
            message: '输入email格式不准确！'
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
            message: '不能超过32个字母数字或16个汉字'
        }
    })

    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

        var url = $("#ff").attr('data-href');
        $('#ff').form('submit',{
        	url:'${pageContext.request.contextPath}/teacherAction_editTeacher.action',
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
                    i = data.length;
                    if(i>=1 && data[0]['id']) {
                        var html = '';var ids = '';var sinKey ='';
                        for($i=0;$i<i;$i++){
                            html += '&lt;label&gt;&lt;input type="checkbox" value="'+data[$i]['id']+'" name="subject_id"&gt;';
                            html += '&lt;span class=""&gt;'+data[$i]['name']+'&lt;/span&gt;&lt;/label&gt;';
                        }
                        $("#teacherSubject").html(html);
                    };
                }
            }
        })
    }

    $(function(){
        //性别
        var sex_data = [
            {id:'男',sex_name:'男'},
            {id:'女',sex_name:'女'}
        ];
        var sex = $('#sex_name').combobox({
            data:sex_data,
            valueField:'id',
            textField:'sex_name',
            editable:false,
            //value:2,
            onLoadSuccess:function(){
                //$('#sex_name').combobox("setValue","请选择");
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i2_0" class="combobox-item">男</div><div id="_easyui_combobox_i2_1" class="combobox-item combobox-item-selected">女</div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">2月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2017,1,30" style="">30</td><td class="calendar-day calendar-other-month " abbr="2017,1,31" style="">31</td><td class="calendar-day " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,2,2" style="">2</td><td class="calendar-day " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,5" style="">5</td><td class="calendar-day " abbr="2017,2,6" style="">6</td><td class="calendar-day " abbr="2017,2,7" style="">7</td><td class="calendar-day " abbr="2017,2,8" style="">8</td><td class="calendar-day " abbr="2017,2,9" style="">9</td><td class="calendar-day " abbr="2017,2,10" style="">10</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,12" style="">12</td><td class="calendar-day " abbr="2017,2,13" style="">13</td><td class="calendar-day " abbr="2017,2,14" style="">14</td><td class="calendar-day " abbr="2017,2,15" style="">15</td><td class="calendar-day " abbr="2017,2,16" style="">16</td><td class="calendar-day " abbr="2017,2,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,19" style="">19</td><td class="calendar-day " abbr="2017,2,20" style="">20</td><td class="calendar-day " abbr="2017,2,21" style="">21</td><td class="calendar-day " abbr="2017,2,22" style="">22</td><td class="calendar-day " abbr="2017,2,23" style="">23</td><td class="calendar-day " abbr="2017,2,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day " abbr="2017,2,27" style="">27</td><td class="calendar-day " abbr="2017,2,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2017,3,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,3,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,3,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,3,7" style="">7</td><td class="calendar-day calendar-other-month " abbr="2017,3,8" style="">8</td><td class="calendar-day calendar-other-month " abbr="2017,3,9" style="">9</td><td class="calendar-day calendar-other-month " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div><div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;"><div class="datebox-calendar-inner"><div class="calendar" style="width: 176px; height: 176px;"><div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text">2月 2017</span></div></div><div class="calendar-body" style="height: 154px;"><table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0"><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr class="calendar-first"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,1,29" style="">29</td><td class="calendar-day calendar-other-month " abbr="2017,1,30" style="">30</td><td class="calendar-day calendar-other-month " abbr="2017,1,31" style="">31</td><td class="calendar-day " abbr="2017,2,1" style="">1</td><td class="calendar-day calendar-today calendar-selected " abbr="2017,2,2" style="">2</td><td class="calendar-day " abbr="2017,2,3" style="">3</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,4" style="">4</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,5" style="">5</td><td class="calendar-day " abbr="2017,2,6" style="">6</td><td class="calendar-day " abbr="2017,2,7" style="">7</td><td class="calendar-day " abbr="2017,2,8" style="">8</td><td class="calendar-day " abbr="2017,2,9" style="">9</td><td class="calendar-day " abbr="2017,2,10" style="">10</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,11" style="">11</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,12" style="">12</td><td class="calendar-day " abbr="2017,2,13" style="">13</td><td class="calendar-day " abbr="2017,2,14" style="">14</td><td class="calendar-day " abbr="2017,2,15" style="">15</td><td class="calendar-day " abbr="2017,2,16" style="">16</td><td class="calendar-day " abbr="2017,2,17" style="">17</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,18" style="">18</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,19" style="">19</td><td class="calendar-day " abbr="2017,2,20" style="">20</td><td class="calendar-day " abbr="2017,2,21" style="">21</td><td class="calendar-day " abbr="2017,2,22" style="">22</td><td class="calendar-day " abbr="2017,2,23" style="">23</td><td class="calendar-day " abbr="2017,2,24" style="">24</td><td class="calendar-day calendar-saturday calendar-last " abbr="2017,2,25" style="">25</td></tr><tr class=""><td class="calendar-day calendar-sunday calendar-first " abbr="2017,2,26" style="">26</td><td class="calendar-day " abbr="2017,2,27" style="">27</td><td class="calendar-day " abbr="2017,2,28" style="">28</td><td class="calendar-day calendar-other-month " abbr="2017,3,1" style="">1</td><td class="calendar-day calendar-other-month " abbr="2017,3,2" style="">2</td><td class="calendar-day calendar-other-month " abbr="2017,3,3" style="">3</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,4" style="">4</td></tr><tr class="calendar-last"><td class="calendar-day calendar-other-month calendar-sunday calendar-first " abbr="2017,3,5" style="">5</td><td class="calendar-day calendar-other-month " abbr="2017,3,6" style="">6</td><td class="calendar-day calendar-other-month " abbr="2017,3,7" style="">7</td><td class="calendar-day calendar-other-month " abbr="2017,3,8" style="">8</td><td class="calendar-day calendar-other-month " abbr="2017,3,9" style="">9</td><td class="calendar-day calendar-other-month " abbr="2017,3,10" style="">10</td><td class="calendar-day calendar-other-month calendar-saturday calendar-last " abbr="2017,3,11" style="">11</td></tr></tbody></table><div class="calendar-menu" style="display: none;"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div></div></div></div></div></body><!--[if IE]>
<script type="text/javascript">
    $(function(){
        $('#passwordText').show();

        $('#passwordText').click(function(){
            $('#passwordText').hide();
            $('#password').focus();
        })

        $('#password').focus(function(){
            $('#passwordText').hide();
            /*if($(this).val() == $(this).attr('placeholder')){
             $(this).val('');
             }*/
        })

        $('#password').blur(function(){
            if($(this).val() == ''){
                $('#passwordText').show();
            }
        })
    })
</script>
<![endif]--></html>