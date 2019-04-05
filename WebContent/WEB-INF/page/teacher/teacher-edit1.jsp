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
<form id="ff" method="post" style="height:438px;" data-href="/teacher/save.html">
    <div class="easyui-layout" fit="true" border="true">

        <div region="north" border="true" style="overflow:auto; padding:8px;height:368px; ">

            <table width="100%" border="0" cellspacing="0" cellpadding="8">
                <tr>
                    <td>教职工姓名：</td>
                    <td><input id="name" name="name" value="" class="easyui-textbox" required="true" data-options="validType: 'nameCheck'" style="width:100px;"></td>
                    <td>性别：</td>
                    <td><input id="sex" name="sex" value="" required="true" data-options="validType:'noNull',panelHeight:'auto'" style="width:100px;"></td>
                    <td>出生日期：</td>
                    <td><input id="yearMonthDay" name="yearMonthDay" value="" required="true" data-options="" style="width:100px;"></td>
                    <td>入职日期：</td>
                    <td><input id="entry_time" name="entry_time" required="true" value="0" class="easyui-textbox" data-options="" style="width:100px;"></td>
                </tr>

                <tr>
                    <td>所属部门：</td>
                    <td colspan="3">
                        <input id="structure_id" name="structure_id" value="" required="true" data-options="validType:'noNull'" style="width:294px;">
                    </td>
                    <td>职务：</td>
                    <td><input id="duty_id" name="duty_id" value="" required="true" data-options="validType:'noNull'" style="width:100px;"></td>
                    <td>工号：</td>
                    <td><input id="worknumber" name="worknumber" value="" class="easyui-textbox" data-options="" style="width:100px;"></td>
                </tr>

                <tr>
                    <td>手机（登录名）：</td>
                    <td><input id="phone" name="phone" value="" required="true" class="easyui-textbox" data-options="validType:'mobile'" style="width:100px;"></td>
                    <td>E-mail：</td>
                    <td><input id="email" name="email" value="" class="easyui-textbox" data-options="" style="width:100px;"></td>
                    <td>微信：</td>
                    <td><input id="weixin" name="weixin" value="" class="easyui-textbox" data-options="validType:'MaxLength'" style="width:100px;"></td>
                    <td>QQ号：</td>
                    <td><input id="qq" name="qq" value="" class="easyui-textbox" data-options="" style="width:100px;"></td>
                </tr>

                <tr>
                    <td>登录密码：</td>
                    <td><input id="password" name="password" value="" required="true" class="easyui-textbox" data-options="" style="width:100px;"></td>
                    <td colspan="6"></td>
                </tr>

                <tr id="teacherSubjectShow" style="display: none;">
                    <td>所教科目：</td>
                    <td colspan="7">
                        <div id="teacherSubject"></div>
                    </td>
                </tr>
				
				
                <tr>
                    
                    <td colspan="8" style="font-weight:bold; border-bottom:1px solid #cccccc; color:#555555; padding-top:18px;">以下为自定义资料项（若无请忽略）</td>
                </tr>
				
                <tr>
                    
                    <td colspan="8">
					
					
<table width="100%" border="0" cellspacing="0" cellpadding="6">
  <tr>
    <td width="100">自定义资料项1：</td>
    <td>
                                                    <input id="field1" name="field1" value="" class="easyui-textbox" data-options="">
                        	</td>
	
    <td width="100">自定义资料项2：</td>
    <td>
                                                    <input id="field2" name="field2" value="" class="easyui-textbox" data-options="">
                        	</td>
  </tr>
  
  <tr>
    <td>备注：</td>
    <td>
                                                    <input id="field3" name="field3" value="" class="easyui-textbox" data-options="">
                        	</td>
	
    <td>自定义资料项4：</td>
    <td>
                                                    <input id="field4" name="field4" value="" class="easyui-textbox" data-options="">
                        	</td>
  </tr>
</table>
					
					</td>
                </tr>

                <tr>
                    <td colspan="8"><span style="color:red;font-size:12px;" id="show-error-message-box"></span></td>
                </tr>
            </table>

        </div>

        <div region="center" border="false" style="overflow:hidden;background-color:#E0ECFF; ">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <input type="hidden" name="action" value="add">
                <a href="#" id="save-btn" class="easyui-linkbutton" iconCls="icon-save" onClick="saveFrom()">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close" iconCls="icon-no" onClick="javascript:parent.$('#openWindow').window('close',true);">取消</a>
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
        passW: {//value值为文本框中的值
            validator: function (value) {
                if(value.length < 6) return false;
                else return true;
            },
            message: '密码长度最少6位.'
        },
        nameCheck: {
            validator: function(value, param){
                if(filterSpecialChar(value)){
                    return false;
                }
                return true;
            },
            message: '请输入正确的名称！'
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
            url:url,
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
                    //window.parent.showMessage('提示信息', result.info);
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
            url:'/teacher/bor-s-children.html?action=add',
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
            url:'/teacher/duty-list.html?action=add',
            valueField:'id',
            textField:'duty_name',
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
        var sex = $('#sex').combobox({
            data:sex_data,
            valueField:'id',
            textField:'sex_name',
            editable:false,
            onLoadSuccess:function(){
                $('#sex').combobox("setValue","请选择");
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
        $('#yearMonthDay').datebox({
            buttons: buttons,
            editable:false
        });
        //入职日期
        $('#entry_time').datebox({
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