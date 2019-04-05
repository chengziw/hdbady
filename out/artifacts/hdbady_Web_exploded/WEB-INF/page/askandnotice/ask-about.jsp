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

<style type="text/css">
    .pushRange0{}
    .pushRange1{padding: 0 0 0 15px;}
    .pushRange2{padding: 0 0 0 15px;}
    ul,li{ list-style: none;}
    #add_ask_answer_input{}
    #ask_answer{  padding: 0; width: 410px; margin: -10px 0 0 38px; overflow-y:auto; height: 182px;}

    #ask_answer ul{ padding: 0; margin: 0;}
    #ask_answer ul li{ padding: 0 0 0 10px; height: 30px; line-height: 30px;}
    #ask_answer ul li input{padding: 2px 3px; width: 292px;margin-left:25px;}
	a{
		text-decoration:none;
	}
</style>

<body style="padding:0px;margin:0px;">
<form id="ff" method="post" style="height:628px;" data-href="/ask/save.html?id=7&sinKey=743a%2507%25FE%25B0%259F%2523%25A6%25C88%25D2%25FB%259CBC%258F%253CcdV%255C%25D3.G%25A1%2508%25B9%25D1O%2595o%2527.%25C0Z%250C%25BF">
    <div class="easyui-layout" fit="true" border="true">

        <div region="north" border="true" style="overflow:auto; padding:8px;height:558px; ">
            <input type="hidden" id="id" name="id" value="<s:property value="ask.id"/>" class="easyui-validatebox">
            <table width="100%" border="0" cellspacing="0" cellpadding="8">
                <tr>
                    <td>
                        <div style="display: inline">
                            问卷级别：<input id="ask_type" name="ask_type" readonly="true" value="" class="easyui-combobox" data-options="panelHeight:'auto',novalidate:true">
                        </div>
                        <div id="school_box" style="display: inline">
                            &nbsp;&nbsp;所属学校：<input id="school_id" name="school_id" readonly="true"  value="" class="easyui-combobox" data-options="panelHeight:'auto',novalidate:true">
                        </div>
                        <div id="targetman_box" style="display: inline">
                            &nbsp;&nbsp;推送对象：<input id="targetman_type" name="targetman_type" readonly="true"  value="" class="easyui-combobox" data-options="panelHeight:'auto',novalidate:true">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="60" align="left" valign="top">手机推送：</td>
                                <td width="200" valign="top" style="position: relative"><div id="push_range" style="border-radius:5px;padding:4px;border:1px solid #95B8E7;  height: 258px; overflow:auto;"></div>
                                    <div style="height: 344px; position: absolute; top: 0px; left: 0px; width:180px;"></div>
                                </td>
                                <td valign="top" style=" padding:0px;padding-left:20px; line-height:22px;">
                                    <p style="padding:0px; margin:0px;"><label>
                                            <input type="checkbox" name="is_repeatsubmit" checked="checked" value="0">
                                            同一学生的家长只允许其中一个家长代表投票</label>
                                    </p>
                                    <p>
                                        <label>
                                            <input type="checkbox" name="is_anonymous" checked="checked" value="0">
                                            记录每个投票者的所选投票项</label>
                                    </p>
                                    <p>
                                        问卷类型：<label>
                                            <input type="radio" name="is_singlesubmit" checked="checked" value="0">多选
                                        </label>
                                        <label>
                                            <input type="radio" name="is_singlesubmit"  value="1">单选

                                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看结果：<label>
                                            <input type="radio" name="is_showresult" checked="checked" value="1">允许
                                        </label>
                                        <label>
                                            <input type="radio" name="is_showresult"  value="0">不允许

                                        </label>
                                    </p>

                                    <p>
                                    </p>
                                    <p>问卷标题：&nbsp;&nbsp;<input id="title" name="title" readonly="true"  value="哈哈哈哈哈哈哈" required="true" style="width:200px;" class="easyui-textbox" data-options="novalidate:true">&nbsp;&nbsp;截止时间：<input id="end_time" readonly="true"  name="end_time" value="2017-03-13"
                                                     style="cursor:pointer;width: 100px;" class="easyui-datebox" data-options="novalidate:true" ></p>

                                    <div id="ask_answer" style="border-top:1px solid #CCCCCC; margin-top:18px; line-height:20px; padding-top:1px;margin-left:0px; width:448px; height:120px; overflow:auto;">
                                        <table  width="100%" border="0" cellspacing="0" cellpadding="1">
                                            <tr height="26" bgcolor="#EFEFEF">
                                                <td>问卷选项</td>
                                                <td width="60">得票数</td>
                                                <td width="60">得票率</td>
                                                <td width="80"></td>
                                                
                                            </tr>


											<s:iterator value="chance" var="c" status="s">
												<tr>
													<td><s:property value="items[#s.index]"/></td>
													<td><s:property value="list[#s.index]"/></td>
													<td><s:property value="c"/>%</td>
													<td>
            											<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-chakan" onClick="votes('${pageContext.request.contextPath}/askAction_aboutAbout.action?id=<s:property value="ask.id"/>&askItemsId=<s:property value="itemsId[#s.index]"/>')">得票详情</a>                                                                                                    
                                                    </td>
												</tr>
											</s:iterator>



                                                <!-- <tr>
                                                    <td>答案一</td>
                                                    <td>1</td>
                                                    <td>33.33%</td>
                                                    <td>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-chakan" onClick="votes('/ask/votes.html?sinKey=de57%2525%25CB%250A7%25A1%2580%25C3%257C%25EF%2583%25CC%25CA%251C%25BCo%2520%259A%25A8R%259FL%258F%25A8%25DC%25BE%25F7%25EE%2512%25CDEY%25D2r%2520&id=16')">得票详情</a>                                                                                                    
        </td>
                                                </tr>
                                                <tr>
                                                    <td>答案二</td>
                                                    <td>2</td>
                                                    <td>66.67%</td>
                                                    <td>
                                                                                                    
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-chakan" onClick="votes('/ask/votes.html?sinKey=e314%25A0%2598p%25D8%259FF%25A3%25D4%25CB0Z%2587%258F%2586M4R8s%25D1%253Di%25A4%257F%25CE%25A5A%25FB%258D%25F7%25FC%25DD%258F%2516&id=17')">得票详情</a>
                                                                                                    
        </td>
                                                </tr>
                                                <tr>
                                                    <td>答案三</td>
                                                    <td>1</td>
                                                    <td>33.33%</td>
                                                    <td>
                                                                                                    
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-chakan" onClick="votes('/ask/votes.html?sinKey=8b14%25E6%2512b%25F1%2505Z%2521%25AA%2540%2526y%25EE%2586%2505%25B3%25A2%25E8p%2523%2527%25F6K%25D9%25EDu%25A8i%2597%25CF%25F9%2527u%2519%2501&id=18')">得票详情</a>
                                                                                                    
        </td>
                                                </tr> -->
                                                
                                                
                                                
                                                                                    </table>

                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="3"  style="border-top:1px solid #CCCCCC;">
                            <tr>
                                <td width="50%" valign="top">
                                    <p>已投票人员(共<span id="user_view_num"></span>人)</p>
                                    <!--数据表开始-->
                                    <table id="user_view" class="easyui-datagrid" style="height:156px;width:96%;"
                                           data-options="
                                           url:'${pageContext.request.contextPath}/askAction_findCheck.action?id=<s:property value="ask.id"/>',
                                           fitColumns:true, onLoadSuccess: userViewSuccess,
                                           singleSelect:true,checkOnSelect:true">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'show_name',width:140">提交人</th>

                                            <th data-options="field:'submit_time_name',width:120">提交时间</th>
                                        </tr>
                                        </thead>
                                    </table>
                                    <!--数据表结束-->
                                </td>
                                <td width="50%" valign="top">
                                    <p>未投票人员(共<span id="user_noview_num"></span>人)</p>
                                    <!--数据表开始-->
                                    <table id="user_noview" class="easyui-datagrid" style="height:156px;"
                                           data-options="
                                           url:'${pageContext.request.contextPath}/askAction_findNoCheck.action?id=<s:property value="ask.id"/>',
                                           fitColumns:true, onLoadSuccess: userNoviewSuccess,
                                           singleSelect:true,checkOnSelect:true">
                                        <thead>
                                        <tr>
                                            <th data-options="field:'show_name',width:140">提交人</th>

                                            <th data-options="field:'submit_time_name',width:120">提交时间</th>
                                        </tr>
                                        </thead>
                                    </table>
                                    <!--数据表结束-->
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>

        <div region="center" border="false" style="overflow:hidden;background-color:#E0ECFF; ">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <!--<a href="#" id="save-btn" class="easyui-linkbutton" iconCls="icon-save" onclick="saveFrom()">保存</a>-->
                <a href="#" class="easyui-linkbutton panel-tool-close" iconCls="icon-no" onClick="javascript:parent.$('#openWindow').window('close',true);">关闭</a>
            </div>
        </div>

    </div>
</form>
</body>

<script type="text/javascript">

var schoolJson = eval('([{"id":"","name":"\u5168\u90e8\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":6,"name":"\u7ea2\u592a\u9633\u5e7c\u513f\u56ed","gradeList":[]},{"id":7,"name":"\u5e7c\u513f\u56ed","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]},{"id":9,"name":"\u53a6\u95e8\u9752\u82d7\u5e7c\u513f\u56ed","gradeList":[]},{"id":10,"name":"\u4e34\u6c82\u5206\u6821","gradeList":[]},{"id":13,"name":"\u53f8\u5357\u5b66\u8f85","gradeList":[]}])');


var askAllowClassJson = eval('([])');

var askAllowSchoolJson = eval('([1])');

function userViewSuccess(data){
    $('#user_view_num').html(data.total);
}

function userNoviewSuccess(data){
    $('#user_noview_num').html(data.total);
}
/**
 * 通知级别 切换 获取推送范围
 */
var getPushRangeStatus = 1;
 function getPushRange(id,schoolId){
    var schoolId = schoolId == undefined ? 0 : schoolId;
    $('#push_range').html('');
    /* var url = 'json/new-parent.json'; */
    var url = '${pageContext.request.contextPath}/askAction_checkRange.action';
    var id = $('#id').val();
    var data = {id:id,school_id:schoolId};
    $.ajax({
        url:url,
        data:data,
        type:'POST',
        dataType:'JSON',
        success:function(result){
            var html = '';
            if(result.status == 1){
                var data = result.info;
                html += setFamilyInput(data);
                html = '<ul id="pushRangeTree"></ul>';
                var setEasyUiTree = 1;
            }else{
                html += '没有相关信息，请联系客服人员！';
                var setEasyUiTree = 0;
            }
            $('#push_range').html(html);
            if(setEasyUiTree){
                $('#pushRangeTree').tree({
                    data:data,
                    idField:'id',
                    textField: 'text',
                    animate:true,
                    checkbox:true,
                    lines:true,
                    formatter:function(node){
                        node.text = node.name;
                                                        if(askAllowSchoolJson.length>0 && node.pid == 0 && node.id == 0){
                                    node.checked = true;
                                }
                                if(askAllowClassJson.indexOf(parseInt(node.id)) != -1 && node.pid == 2){
                                    node.checked = true;
                                }
                                                return node.text;
                    }
                });
            }
        }
    });
} 

/**
 * 递归构造 推送范围 input
 */
  function setFamilyInput(data,pid,children){

    var pid = pid == undefined ? 0 : pid;
    var children = children == undefined ? 'children' : children;
    var html = '';
    var num = data.length;
    for(var i=0;i<num;i++){
        html += pid != 2 ? '<div class="pushRange'+pid+'" pid="'+pid+'">' : (pid == 2 && i == 0 ? '<div class="pushRange'+pid+'" pid="'+pid+'">' : '');
        html += '<label>';
        html += '<input type="checkbox" class="push_range" name="push_range'+pid+'['+data[i]['id']+']" value="'+data[i]['id']+'">';
        html += data[i]['name'];
        html += '</label>';
        html += data[i][children] ? setFamilyInput(data[i][children],pid+1) : '';
        html += (pid == 2 && i == num-1) ? '</div>' : '';   //三级，
        html += pid <= 1 ? '</div>' : '';   //一级，二级
    }
    return html;
}  

/**
 * 删除 选项
 */
function del(obj){
    $(obj).closest('li').remove();
}

/**
 * 得票详情
 * @param url
 */
function votes(url){
    var url = url;
    var title = '得票详情';
    openTopDialog(url,title,398,398);
}

$(function(){
    $(document).on('click','input[type="checkbox"]',function(){
        return false;
    });
    $(document).on('click','input[type="radio"]',function(){
        return false;
    });

    $('#school_id').combobox({
        data:schoolJson,
        editable:false,
        valueField:'id',
        textField:'name',
        required: true,
        novalidate:true,
        value:'1',
        onLoadSuccess:function(){
            //school_Id.combobox("setValue",'请选择学校');
        },
        onSelect:function(record){
            $('#targetman_box').hide();
            ask_type.combobox('setValue',2);
            getPushRange(2,record.id)
        }
    });

    /* 通知级别 */
    var askTypeData = [
        {id:1,name:"集团级通知"},{id:2,name:"学校级通知",selected:true}    ];
    var ask_type = $('#ask_type').combobox({
        data: askTypeData,
        editable:false,
        valueField:'id',
        textField:'name',
        value:'请选择通知级别',
        onSelect:function(record){
            if(record.id == 1){
                $('#school_box').hide();
                $('#targetman_box').show();
                getPushRange(record.id);
            }else if(record.id == 2){
                $('#school_box').show();
                $('#targetman_box').hide();
                $('#push_range').html('');
                if(parseInt(school_Id.combobox("getValue")) > 0){
                    getPushRange(2,school_Id.combobox("getValue"));
                }
            }
        }
    })

    /* 推送对象 */
    var targetmanTypeData = [
        {id:1,name:"仅家长",selected:true},{id:2,name:"仅教职工"},{id:3,name:"教职工和家长"}    ];
    var targetman_type = $('#targetman_type').combobox({
        data: targetmanTypeData,
        editable:false,
        valueField:'id',
        textField:'name',
        value:'请选择推送对象'
    })

    $(document).on('click','input.push_range',function(){
        var pid = $(this).closest('div').attr('pid');
        var objDiv = $(this).closest('div.pushRange'+pid);
        var checked = $(this).prop('checked');
        switch(pid){
            case '0':    //一级 推送范围
                if(checked){
                    objDiv.find('input.push_range').prop('checked',true);
                }else{
                    objDiv.find('input.push_range').prop('checked',false);
                }
                break;
            case '1':    //二级 推送范围
                if(checked){
                    objDiv.find('input.push_range').prop('checked',true);//所有班级选中
                    //如果全部年级选中了， 勾选学校
                    var is_all1_check = true;
                    objDiv.closest('div.pushRange0').find('div.pushRange1').each(function(){
                        if(!$(this).find('input.push_range:eq(0)').prop('checked')){
                            is_all1_check = false;
                        }
                    })
                    if(is_all1_check){//勾选学校
                        objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',true);
                    }
                }else{
                    objDiv.find('input.push_range').prop('checked',false);  //所有班级取消选中
                    objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',false);//取消学校选中
                }
                break;
            case '2':    //三级 推送范围
                //如果全部班级都选中了， 勾选年级
                if(checked){
                    var is_all2_check = true;
                    objDiv.find('input.push_range').each(function(){
                        if(!$(this).prop('checked')){
                            is_all2_check = false;
                        }
                    })
                    if(is_all2_check){ //勾选年级
                        objDiv.closest('div.pushRange1').find('input.push_range:eq(0)').prop('checked',true);
                        //如果全部年级选中了， 勾选学校
                        var is_all1_check = true;
                        objDiv.closest('div.pushRange0').find('div.pushRange1').each(function(){
                            if(!$(this).find('input.push_range:eq(0)').prop('checked')){
                                is_all1_check = false;
                            }
                        })
                        if(is_all1_check){//勾选学校
                            objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',true);
                        }
                    }
                }else{
                    objDiv.closest('div.pushRange1').find('input.push_range:eq(0)').prop('checked',false);//取消年级选中
                    objDiv.closest('div.pushRange0').find('input.push_range:eq(0)').prop('checked',false);//取消学校选中
                }
                break;
            default :
                break;
        }
    })

    $(document).on('click','#add_ask_answer_input',function(){
        var html = '';
        html += '<li><input class="ask_answer_input textbox" name="ask_answer_input[]" value="">' +

            '<a href="javascript:;" onclick="del(this);"> -删除</a></li>';

        $('#ask_answer ul').append(html);
    })

    /** 编辑默认 **/
            $('#targetman_box').hide();
        getPushRange(2,1);
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