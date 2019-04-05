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

<style type="text/css">
    .subject-box{
        width:120px;
        float:left;
    }
    .subject-box table{
        background:#E0ECFF;
    }
    .subject-box td{
        background:#eee;
    }
    .right table{
        background:#E0ECFF;
        width:100%;
    }
    .right td{
        background:#fafafa;
        text-align:center;
        padding:8px;
		padding-bottom:0px;
    }
    .right td{
        background:#fafafa;
    }
    .right td .subject-drop {
        border-bottom:0px solid #cccccc;
		margin-bottom:0px;      
    }
    .right td .subject-drop, .right td .teacher-drop{
        display: block;
        height: 22px;
        width:140px;
    }
    .right td .subject-drop.over, .right td .teacher-drop.over{
        background:#FBEC88;
    }
    .item{
        text-align:center;
        border:1px solid #499B33;
        background:#fafafa;
        width:100px;
    }
    .assigned{
        border:1px solid #BC2A4D;
    }
    .subject-drop input{
        width: 80px;
    }  
    .teacher-drop input{
        width: 80px;
		padding-bottom:0px;
		margin-bottom:0px;
    }    
	td.title{
		font-weight:bold;
		font-size:13px;
		font-family:"微软雅黑";
		padding-bottom:8px;

	}
	td.time{
		font-weight:bold;
		font-size:13px;
		font-family:"微软雅黑";
		padding-bottom:8px;

	}
	td.lunch{
		font-weight:bold;
		font-size:13px;
		font-family:"微软雅黑";
		padding-bottom:8px;

	}	
	
</style>



    <div class="easyui-layout layout easyui-fluid" border="true" fit="true" style="width: 988px; height: 443px;"> 
        <!--1.3region="center",这里的宽度和高度都是由周边决定，不用设置-->
        <div class="panel layout-panel layout-panel-center" style="width: 988px; left: 0px; top: 0px;"><div region="center" border="true" title="" class="panel-body panel-body-noheader layout-body" style="width: 986px; height: 404px;">
            <div class="right">            
                <table id="class-curricula-table" cellspacing="1">
                    <tbody>
                    
                    
                  
                  		 <tr>
                           	<td></td>
                             <s:if test="2==#week_type_label">
		                             <s:iterator begin="0" end="#dayNum-1" id="w" value="{'星期一','星期二','星期三','星期四','星期五','星期六'}">                       
		   									<td class="title"><s:property value="#w"/></td>        
		                             </s:iterator>     
		                        </s:if>
		                        <s:elseif test="3==#week_type_label">
		                        	 <s:iterator begin="0" end="#dayNum-1" id="w" value="{'星期一','星期二','星期三','星期四','星期五','星期日'}">                       
		   									<td class="title"><s:property value="#w"/></td>  
		                             </s:iterator>  
		                        </s:elseif> 
		                        <s:else>
		                        	 <s:iterator begin="0" end="#dayNum-1" id="w" value="{'星期一','星期二','星期三','星期四','星期五','星期六','星期日'}">                       
		   									<td class="title"><s:property value="#w"/></td>                      
		                             </s:iterator>  
		                        </s:else>                      
                         </tr>                                   
                                                                          
			                           <s:iterator begin="1" end="#morning_has_num+#afternoon_has_num" status="vs">
				                           	<s:if test="#vs.index==#morning_has_num">
				                           		<tr><td class="lunch" colspan="9">中午休息时间</td></tr>
				                           	</s:if>
			                          		<tr>
			                          		<td class="time"><s:property value="#start_end_times[#vs.index]"/></td>
			                        	 	  	 	<s:iterator begin="1" end="#dayNum" status="v">
			                        	 	  	 		<td class="drop">
				                          	  	 	    <s:property value="#subject_names[#vs.index][#v.index]"/>(<s:property value="#teacher_names[#vs.index][#v.index]"/>)
                                       					</td>
 									  	 </s:iterator>
 											</tr>
 											
                          </s:iterator>
                  
                     
                     
                                    </tbody></table>            
            </div>
        </div></div>
		
            <div class="panel layout-panel layout-panel-south" style="width: 988px; left: 0px; top: 406px;"><div region="south" border="false" style="background-color: rgb(224, 236, 255); width: 988px; height: 37px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
                 <!-- 保存按钮 -->
                <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:3px; float:right;">
                    
                    <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">关闭</a>
                </div>
            </div></div>		
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>   
	


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

        for (i = 0; i <; helpTutorials.length; i++) {
            /* 判断元素是否存在 */
            if ($(helpTutorials[i].wrapper).length >; 0) {
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