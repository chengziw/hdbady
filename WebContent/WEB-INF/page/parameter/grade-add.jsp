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
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
</style>

  

    <form id="fm" style="height:178px; " method="post" data-href="${pageContext.request.contextPath}/gradeAction_addGrade.action" class="panel-noscroll">
        <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 416px; height: 178px;">
            
            <div class="panel layout-panel layout-panel-north" style="width: 416px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 398px; height: 90px;" title="" class="panel-body panel-body-noheader layout-body">        
                <%-- <div class="fitem" style="margin-bottom:15px; margin-top:10px;">
                	<label>选择学校：</label>    	
                	<input id="school_id" value="" data-options="panelHeight:'100',novalidate:true" class="combobox-f combo-f textbox-f" style="display: none;" textboxname="school_id" comboname="school_id"><span class="textbox combo" style="width: 164px; height: 20px;"><span class="textbox-addon textbox-addon-right" style="right: 0px;"><a href="javascript:void(0)" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1" style="width: 18px; height: 20px;"></a></span><input class="textbox-text validatebox-text" autocomplete="off" readonly="readonly" placeholder="" style="margin-left: 0px; margin-right: 18px; padding-top: 2px; padding-bottom: 2px; width: 138px;" type="text"><input class="textbox-value" name="school_id" value="1" type="hidden"></span>
                </div> --%>
                <div class="fitem">
                	<label>年级名称：</label>
                	<input name="name" value="" class="easyui-textbox textbox-f" data-options="prompt:'如：小班/中班/大班等',validType:'MaxLength'" style="width: 165px; display: none;" textboxname="name"><%-- <span class="textbox" style="width: 163px; height: 20px;"><input class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="如：小班/中班/大班等" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 155px;" type="text"><input class="textbox-value" name="name" value="" type="hidden"></span> --%>
                	<%-- <span style="color:red;font-size:12px;" id="check"></span> --%>
                </div> 

            </div></div> 
            <div class="panel layout-panel layout-panel-center" style="width: 416px; left: 0px; top: 107px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 416px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">

                 <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                        <!-- <a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" " group="" id="">保存</a> --> <!-- 原 -->
                        <a href="#" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveGrade()" group="" id="">保存</a>
                        <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-cancel" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
                </div>
                
            </div></div>
        <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>
    </form>
        
        
<script>
    /* 转换PHPJSON为JS JSON格式 */
    var schoolJson = '[{"id":"","name":"\u8bf7\u9009\u62e9\u5b66\u6821"},{"id":1,"name":"Dear\u5b9d\u8d1d\u793a\u8303\u5e7c\u513f\u56ed","gradeList":[]},{"id":2,"name":"\u53f8\u5357\u5b66\u8f852","gradeList":[]},{"id":8,"name":"\u53f8\u5357\u5b66\u8f851","gradeList":[]}]';
    schoolJson = eval('('+schoolJson+')');

    /* 保存学校信息 */
    function saveGrade(){
        /* if ($("#school_id").combobox("getValue") == '请选择学校'){
            setTooltop($('.textbox-text:eq(0)'),'show','请选择学校');
            return false;
        } */

        var url = $('#fm').attr('data-href'); // 保存学校地址
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('enableValidation').form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');
                if (result.errorMsg){
                    setTooltop($('.textbox-text'),'show',result.errorMsg);
                } else {
                	parent.window.closeWinIsReloadData = 1;
                    parent.$('#openWindow').window('close');
                }
            }
        });
    }

    /*搜索  学校*/
    $(function(){
        $('#school_id').combobox({
        data: schoolJson,
        editable:false,
        valueField:'id',
        textField:'name',
        required: true,
        onLoadSuccess:function(){
             $("#school_id").combobox("setValue", '');
        }
        })

        if(schoolJson.length> 1){
            $('#school_id').combobox('select',schoolJson[1]['id']);
        }
    })

    //提示框
    /**
     *
     * @param obj
     * @param type show=&gt;显示  close=&gt;关闭
     * @param text
     */
   
     function setTooltop(obj,type,text){
        text = text==undefined ? '该输入项为必输项': text;
        if(type == 'show'){
            obj.tooltip({
                position: 'right',
                showEvent:'',
                content: '<span style="color:#000">'+text+'</span>',
                onShow: function(){
                    $(this).tooltip('tip').css({
                        backgroundColor: '#FFFFCC',
                        borderColor: '#CC9933'
                    });
                }
            }).tooltip(type);
        }else{
            obj.tooltip(type);
        }
    } 
</script>

<script type="text/javascript">
    /*$(function(){
        loadWindow('close');
    });*/
</script>

<script type="text/javascript">
$.extend($.fn.validatebox.defaults.rules,{
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
});
    var helpTutorials = [];

    function showRightHelp() {
        // Set up tour

        var pagewalkthrough = [];
        var tempData = null;

        for (i = 0; i< helpTutorials.length; i++) {
            /* 判断元素是否存在 */
            if ($(helpTutorials[i].wrapper).length> 0) {
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
<div class="panel combo-p" style="position: absolute; z-index: 10; display: none;"><div class="combo-panel panel-body panel-body-noheader" title=""><div id="_easyui_combobox_i1_0" class="combobox-item">请选择学校</div><div id="_easyui_combobox_i1_1" class="combobox-item combobox-item-selected">Dear宝贝示范幼儿园</div><div id="_easyui_combobox_i1_2" class="combobox-item">司南学辅2</div><div id="_easyui_combobox_i1_3" class="combobox-item">司南学辅1</div></div></div></body></html>