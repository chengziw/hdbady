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
</head><html lang="en-US"><head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Dear宝贝-幼教云管理平台</title>
    <link rel="stylesheet" type="text/css" href="/dear_assets/js/easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/dear_assets/js/easyui-1.4.4/themes/icon.css">

    <script type="text/javascript" src="/dear_assets/js/easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="/dear_assets/js/easyui-1.4.4/jquery.easyui.min.js"></script>    
    <script type="text/javascript" src="/dear_assets/js/common.js"></script>
    <script type="text/javascript" src="/dear_assets/js/easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    
    <link rel="stylesheet" href="/dear_assets/js/pagewalkthrough/css/jquery.pagewalkthrough.css">
    <script type="text/javascript" src="/dear_assets/js/pagewalkthrough/jquery.pagewalkthrough.right.min.js"></script>
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


<form id="ff" style="height:328px; margin:auto; " method="post" data-href="/subject/save.html?sinKey=718c%250C2%2508%25EA%25BC%250B0%25C7%253D%255B%25DD%2516%25A9%25BB%258FCW%25AFN%2503%259F%25A1%25C8%2514%25B5xYY%2588%25DC%258B%251F%25CA%2585%2522%25E3" class="panel-noscroll">

    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 476px; height: 328px;">

        <div class="panel layout-panel layout-panel-north" style="width: 476px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 8px; width: 458px; height: 60px;" title="" class="panel-body panel-body-noheader layout-body">

            <!-- <div class="fitem" style="display: none">
                <label class="lad_text"> 学 校：</label>
                <input name="school_id" value="8" class="easyui-validatebox validatebox-text" data-options="panelHeight:'auto'">
            </div> -->

            <div class="fitem">
                <label class="lad_text"> 学科名称： </label>
                <input id="name" name="name" value="<s:property value="subject.name"/>" class="easyui-textbox textbox-f" data-options="prompt:'如：音乐/舞蹈/美术等',validType:'MaxLength'" style="width: 165px; display: none;" required="true" textboxname="name"><%-- <span class="textbox" style="width: 163px; height: 20px;"><input class="textbox-text validatebox-text" autocomplete="off" placeholder="如：音乐/舞蹈/美术等" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 155px;" type="text"><input class="textbox-value" name="name" value="社会" type="hidden"></span> --%>
                <span style="color:red;font-size:12px;" id="name_text"></span>
            </div>

          <%--   <div class="fitem">
                <label class="lad_text"> 适用年级：<br><br><br><br> </label>
                <div id="gradecheck" style="display: inline-block;line-height: 16px; margin-top:15px;">
                    <label><input class="all_grade_id" type="checkbox"><span class="span_text2">全部年级</span></label><br><label><input class="grade_id" checked="" name="grade_id[0]" value="40" type="checkbox"><span class="span_text2">托管班1</span></label><br><label><input class="grade_id" checked="" name="grade_id[1]" value="41" type="checkbox"><span class="span_text2">456585684</span></label><br><label><input class="grade_id" checked="" name="grade_id[2]" value="42" type="checkbox"><span class="span_text2">托管班3</span></label><br><label><input class="grade_id" checked="" name="grade_id[3]" value="43" type="checkbox"><span class="span_text2">大班</span></label><br><label><input class="grade_id" checked="" name="grade_id[4]" value="44" type="checkbox"><span class="span_text2">学前班</span></label><br>                </div>
                <span style="color:red;font-size:12px;" id="subject_gradecheck_text"></span>
            </div> --%>
            
            
            
	<%-- 	   <div class="fitem"> 
			   <label class="lad_text"> 适用年级：<br /><br /><br /><br /> </label> 
			   <div id="gradecheck" style="display: inline-block;line-height: 16px; margin-top:15px;"> 
			    <label><input class="all_grade_id" type="checkbox" /><span class="span_text2">全部年级</span></label>
			    <br />
			    
			    <s:iterator value="grade" var="g">
			    	<label><input class="grade_id" checked="" name="grade_id" value="<s:property value="#g"/>" type="checkbox" /><span class="span_text2"><s:property value="#g"/></span></label>
   			   	    <br />
			    </s:iterator>
			    
			   </div> 
			   <span style="color:red;font-size:12px;" id="subject_gradecheck_text"></span> 
		   </div> --%>
            
            
            
        </div></div>

        <div class="panel layout-panel layout-panel-center" style="width: 476px; left: 0px; top: 71px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 476px; height: 71px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <input name="id" value="<s:property value="subject.id"/>" type="hidden">

                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveFrom()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
            </div>
        </div></div>

    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>

</form>


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
		        message: '不能超过32个字母数字或16个汉字'
		    }
		});

    function saveFrom(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        $('#save-btn').addClass('mylinkbtn-load');

        var url = $("#ff").attr('data-href');
        $('#ff').form('submit',{
        	url:'${pageContext.request.contextPath}/subjectAction_editSubject',
            onSubmit:function(){
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
                }else if(result.status==2){ // 学科无选择
                    $('#save-btn').removeClass('mylinkbtn-load');
                    setTooltop($("#subject_gradecheck_text"),'show',result.info);
                }else {
                    $('#save-btn').removeClass('mylinkbtn-load');
                    setTooltop($("#subject_name_text"),'show',result.info);
                }
            }
        });
    }

    //提示框
    /**
     *
     * @param obj
     * @param type show=>显示  close=>关闭
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


    $(function(){
        $(document).on('click','.grade_id',function(){
            var checked = true;
            $('.grade_id').each(function(){
                if(! $(this).prop('checked')){
                    checked = false;
                }
            })
            if(checked){
                $('.all_grade_id').prop('checked',true);
            }else{
                $('.all_grade_id').prop('checked',false);
            }
        })

        $(document).on('click','.all_grade_id',function(){
            if($(this).prop('checked')){
                $('.grade_id').prop('checked',true);
            }else{
                $('.grade_id').prop('checked',false);
            }
        });

        var checked = true;
        $('.grade_id').each(function(){
            if(! $(this).prop('checked')){
                checked = false;
            }
        })
        if(checked){
            $('.all_grade_id').prop('checked',true);
        }else{
            $('.all_grade_id').prop('checked',false);
        }
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
</body></html>