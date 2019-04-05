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
	.module-big-name{
		height:28px;
		line-height:28px;
		font-size:12px;
		font-weight: normal;
		font-family:"微软雅黑";
		margin-top:12px;
	}
    .module-big-name span{ font-size:13px; font-weight:bold;font-size: 12px; font-weight: normal; display: inline-block; width: 152px; }
	.module-items{
		height:24px;
		line-height:24px;
		font-family:"微软雅黑";
	}
	.module-items span{
		padding-left:10px;
	}
	
	.module-name{
		float:left;
		width:120px;
		height:24px;
		line-height:24px;
		font-family:"微软雅黑";
	}	
</style>


<form id="fm" style="height:508px; " method="post" data-href="/user-role/save-modules.html?sinKey=71ae%2517k%258F2%25FB%25AE%25B4%25D8%2590%253E%25C83%255B%2588%257B%25EC%25CF%253B%259C%250A%25D9%25B1h%25C2%252F%25267%2514%25B2%251A%25A3%25F1%25E2%2524%259Ea%25D2" class="panel-noscroll">
    <div class="easyui-layout layout easyui-fluid" fit="true" border="true" style="width: 516px; height: 508px;">

        <div class="panel layout-panel layout-panel-north" style="width: 516px; left: 0px; top: 0px;"><div region="north" border="true" style="overflow: auto; padding: 0px 8px 18px 18px; width: 488px; height: 388px;" title="" class="panel-body panel-body-noheader layout-body">
            <input name="id" value="<s:property value="role.id"/>" class="easyui-validatebox validatebox-text" type="hidden">
                            <div>
                            
                            <%-- <s:iterator value="allelements" id="element" status="s">
								<s:property value="#s.index"/>	
								<s:property value="#element.code"/><br>
							</s:iterator> --%> 
                            
                    <div class="module-big-name"><span>学生管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生预约管理</div>                
                            <div class="module-items" style="padding-left:40px;">
             
                            						<s:if test="allelements[0].eindex==1">
                                                                    <span><label><input name="modules" value="page_student_student-bespeak" type="checkbox" checked="checked">
                                        查看</label></span>
                            						</s:if><s:else>
                            										<span><label><input name="modules" value="page_student_student-bespeak" type="checkbox">
                                        查看</label></span>
                            						</s:else>
                            						<s:if test="allelements[1].eindex==2">
                            										<span><label><input name="modules" value="page_student_student-bespeak_add" type="checkbox" checked="checked">
                                        添加</label></span>
                            						</s:if><s:else>
                            										<span><label><input name="modules" value="page_student_student-bespeak_add" type="checkbox">
                                        添加</label></span>
                            						</s:else>
													<s:if test="allelements[2].eindex==3">
																	<span><label><input name="modules" value="page_student_student-bespeak_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_student_student-bespeak_edit" type="checkbox" >
                                        编辑</label></span>
													</s:else>   
													<s:if test="allelements[3].eindex==4">
																	<span><label><input name="modules" value="page_student_student-bespeak_check" type="checkbox" checked="checked">
                                        审核</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_student_student-bespeak_check" type="checkbox">
                                        审核</label></span>
													</s:else> 
													                       						
       				                         </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[4].eindex==5">
                            										<span><label><input name="modules" value="page_student_student" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_student_student" type="checkbox">
                                        查看</label></span>
													</s:else>
													
													<s:if test="allelements[5].eindex==6">
																	<span><label><input name="modules" value="page_student_student_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_student_student_add" type="checkbox">
                                        添加</label></span>
													</s:else>                        						
													
													<s:if test="allelements[6].eindex==7">
																	<span><label><input name="modules" value="page_student_student_check" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_student_student_check" type="checkbox">
                                        编辑</label></span>
													</s:else>                        						                        						
              
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生变动记录</div>                
                            <div class="module-items" style="padding-left:40px;">
                            
                            						<s:if test="allelements[7].eindex==8">
                            										<span><label><input name="modules" value="page_student_student-change-log" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_student_student-change-log" type="checkbox">
                                        查看</label></span>
													</s:else>   
													                     						
                                                            </div>
                        </div>
                                    </div>
                                 <div>
                    <div class="module-big-name"><span>教职工管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">教职工管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[8].eindex==9">
                            										<span><label><input name="modules" value="page_teacher_teacher" type="checkbox"  checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_teacher_teacher" type="checkbox">
                                        查看</label></span>
													</s:else>   
													                     						
													<s:if test="allelements[9].eindex==10">
																	<span><label><input name="modules" value="page_teacher_teacher_add" type="checkbox"  checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_teacher_teacher_add" type="checkbox">
                                        添加</label></span>
													</s:else>     
													                   						
													<s:if test="allelements[10].eindex==11">
																	<span><label><input name="modules" value="page_teacher_teacher_edit" type="checkbox"  checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_teacher_teacher_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>                        														
                          
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">教职工变动记录</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[11].eindex==12">
                            						<span><label><input name="modules" value="page_teacher_teacher-change-log" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_teacher_teacher-change-log" type="checkbox">
                                        查看</label></span>
													</s:else>                        						
                                  
                                                            </div>
                        </div>
                                    </div>
                            <div>
                    <div class="module-big-name"><span>班级管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">班级管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[12].eindex==13">
                            										<span><label><input name="modules" value="page_class_class" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_class_class" type="checkbox">
                                        查看</label></span>
													</s:else>                        						
													
													<s:if test="allelements[13].eindex==14">
																	<span><label><input name="modules" value="page_class_class_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_class_class_add" type="checkbox">
                                        添加</label></span>
													</s:else>                        						
													
													<s:if test="allelements[14].eindex==15">
																	<span><label><input name="modules" value="page_class_class_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_class_class_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>                        						
                    
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">班级变动记录</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[15].eindex==16">
																	<span><label><input name="modules" value="page_class_class-change-log" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_class_class-change-log" type="checkbox">
                                        查看</label></span>
													</s:else>
                        
                                                            </div>
                        </div>
                                    </div>
                     <div>
                    <div class="module-big-name"><span>课程表管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">课程表管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[16].eindex==17">
																	<span><label><input name="modules" value="page_kebiao_class-curricula" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_kebiao_class-curricula" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[17].eindex==18">
																	<span><label><input name="modules" value="page_kebiao_class-curricula_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_kebiao_class-curricula_add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[18].eindex==19">
																	<span><label><input name="modules" value="page_kebiao_class-curricula_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_kebiao_class-curricula_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
													<s:if test="allelements[19].eindex==20">
																	<span><label><input name="modules" value="page_kebiao_class-curricula_delete" type="checkbox" checked="checked">
                                        删除</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_kebiao_class-curricula_delete" type="checkbox">
                                        删除</label></span>
													</s:else>
													<s:if test="allelements[20].eindex==21">
																	<span><label><input name="modules" value="page_kebiao_class-curricula_publish" type="checkbox" checked="checked">
                                        发布</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_kebiao_class-curricula_publish" type="checkbox">
                                        发布</label></span>
													</s:else>
                            	
                                                            </div>
                        </div>
                                           
                                    </div>
                            <%-- <div>
                    <div class="module-big-name"><span>收费管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">收费项管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="136" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="137" checked="checked" type="checkbox">
                                        添加</label></span>
                                                                    <span><label><input name="modules" value="138" checked="checked" type="checkbox">
                                        编辑</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">收费任务管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="173" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="175" checked="checked" type="checkbox">
                                        添加</label></span>
                                                                    <span><label><input name="modules" value="176" checked="checked" type="checkbox">
                                        编辑</label></span>
                                                                    <span><label><input name="modules" value="200" checked="checked" type="checkbox">
                                        审批</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">我要收退费</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="227" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="229" checked="checked" type="checkbox">
                                        收费</label></span>
                                                                    <span><label><input name="modules" value="230" checked="checked" type="checkbox">
                                        删除</label></span>
                                                                    <span><label><input name="modules" value="231" checked="checked" type="checkbox">
                                        退费</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">收退费流水</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="256" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="257" checked="checked" type="checkbox">
                                        删除</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">APP收费账户管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="432" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="433" checked="checked" type="checkbox">
                                        编辑</label></span>
                                                                    <span><label><input name="modules" value="435" checked="checked" type="checkbox">
                                        提现</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生账户管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="268" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="269" checked="checked" type="checkbox">
                                        充值</label></span>
                                                                    <span><label><input name="modules" value="270" checked="checked" type="checkbox">
                                        提现</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生账户流水</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="284" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="285" checked="checked" type="checkbox">
                                        删除</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">收费统计报表</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="296" checked="checked" type="checkbox">
                                        查看</label></span>
                                                            </div>
                        </div>
                                    </div>--%>
                            <div>
                    <div class="module-big-name"><span>考勤管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生请假管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                           							<s:if test="allelements[21].eindex==22">
                           							<span><label><input name="modules" value="page_check_student-vacation" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_student-vacation" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[22].eindex==23">
													<span><label><input name="modules" value="page_check_student-vacation-add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_student-vacation-add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[23].eindex==24">
													<span><label><input name="modules" value="page_check_student-vacation-check" type="checkbox" checked="checked">
                                        审批</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_student-vacation-check" type="checkbox">
                                        审批</label></span>
													</s:else>
													
                                                            </div>
                        </div>
                           
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生日考勤记录</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[24].eindex==25">
                            						<span><label><input name="modules" value="page_check_student-day" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_student-day" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[25].eindex==26">
													<span><label><input name="modules" value="page_check_student-day-edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_student-day-edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
                                                                 
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生月考勤统计</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[26].eindex==27">
                            						<span><label><input name="modules" value="page_check_student-month" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_student-month" type="checkbox">
                                        查看</label></span>
													</s:else>
      
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">教职工请假管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						
                            						<s:if test="allelements[27].eindex==28">
                            						<span><label><input name="modules" value="page_check_teacher-vacation" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_teacher-vacation" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[28].eindex==29">
													<span><label><input name="modules" value="page_check_teacher-vacation-add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_teacher-vacation-add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[29].eindex==30">
													<span><label><input name="modules" value="page_check_teacher-vacation-check" type="checkbox" checked="checked">
                                        审核</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_teacher-vacation-check" type="checkbox">
                                        审核</label></span>
													</s:else>
													<s:if test="allelements[30].eindex==31">
													<span><label><input name="modules" value="page_check_teacher-vacation-destroy" type="checkbox" checked="checked">
                                        销假</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_teacher-vacation-destroy" type="checkbox">
                                        销假</label></span>
													</s:else>
                    
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">教职工日考勤记录</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[31].eindex==32">
                            						<span><label><input name="modules" value="page_check_teacher-day" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_teacher-day" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[32].eindex==33">
													<span><label><input name="modules" value="page_check_teacher-day-add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_teacher-day-add" type="checkbox">
                                        添加</label></span>
													</s:else>
												
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">教职工月考勤统计</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[33].eindex==34">
                            						<span><label><input name="modules" value="page_check_teacher-month" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
													<span><label><input name="modules" value="page_check_teacher-month" type="checkbox">
                                        查看</label></span>
													</s:else>
                                                                   
                                                            </div>
                        </div>
                                    </div> 
                            <div>
                   <div class="module-big-name"><span>公告问卷管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">通知公告管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[34].eindex==35">
																	<span><label><input name="modules" value="page_askandnotice_notice" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_notice" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[35].eindex==36">
																	<span><label><input name="modules" value="page_askandnotice_notice_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_notice_add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[36].eindex==37">
																	<span><label><input name="modules" value="page_askandnotice_notice_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_notice_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
													<s:if test="allelements[37].eindex==38">
																	<span><label><input name="modules" value="page_askandnotice_notice_publish" type="checkbox" checked="checked">
                                        发布</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_notice_publish" type="checkbox">
                                        发布</label></span>
													</s:else>
													<s:if test="allelements[38].eindex==39">
																	<span><label><input name="modules" value="page_askandnotice_notice_delete" type="checkbox" checked="checked">
                                        删除</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_notice_delete" type="checkbox">
                                        删除</label></span>
													</s:else>
													
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">问卷调查管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                            
                           							 <s:if test="allelements[39].eindex==40">
																	<span><label><input name="modules" value="page_askandnotice_ask" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_ask" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[40].eindex==41">
																	<span><label><input name="modules" value="page_askandnotice_ask_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_ask_add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[41].eindex==42">
																	<span><label><input name="modules" value="page_askandnotice_ask_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_ask_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
													<s:if test="allelements[42].eindex==43">
																	<span><label><input name="modules" value="page_askandnotice_ask_publish" type="checkbox" checked="checked">
                                        发布</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_ask_publish" type="checkbox">
                                        发布</label></span>
													</s:else>
													<s:if test="allelements[43].eindex==44">
																	<span><label><input name="modules" value="page_askandnotice_ask_delete" type="checkbox" checked="checked">
                                        删除</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_askandnotice_ask_delete" type="checkbox">
                                        删除</label></span>
													</s:else>
                            
                                                            </div>
                        </div>
                                    </div>
                                    
                            <div>
                            
                            
                    <div class="module-big-name"><span>作业管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">作业查询</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[44].eindex==45">
																	<span><label><input name="modules" value="page_homework_homework" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_homework_homework" type="checkbox">
                                        查看</label></span>
													</s:else>
								
                                                  </div>
                        </div>
                              
                                    </div>
                                    
                                           <div>
                    <div class="module-big-name"><span>食谱管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">食谱查询</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[45].eindex==46">
																	<span><label><input name="modules" value="page_cookbook_cookbook" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_cookbook_cookbook" type="checkbox">
                                        查看</label></span>
													</s:else>
													
                                                            </div>
                        </div>
                                            <!-- <div class="module-items" style="padding-left:26px;"> -->
                            
                                    </div>
                                 	
                                 	
                                    
                                    
                                    
                       <%--      <div>
                    <div class="module-big-name"><span>会员服务管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学生考勤卡管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="444" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="445" checked="checked" type="checkbox">
                                        发卡</label></span>
                                                                    <span><label><input name="modules" value="470" checked="checked" type="checkbox">
                                        导出考勤卡</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">教职工考勤卡管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="449" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="451" checked="checked" type="checkbox">
                                        发卡</label></span>
                                                                    <span><label><input name="modules" value="473" checked="checked" type="checkbox">
                                        导出考勤卡</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">视频会员管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="506" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="508" checked="checked" type="checkbox">
                                        订购</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">视频会员订购记录</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="511" checked="checked" type="checkbox">
                                        查看</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">短信会员管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="514" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="516" checked="checked" type="checkbox">
                                        订购</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">短信会员订购记录</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="519" checked="checked" type="checkbox">
                                        查看</label></span>
                                                            </div>
                        </div>
                                    </div>
                            <div>
                    <div class="module-big-name"><span>账户和订购管理</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">注册资料管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="7" checked="checked" type="checkbox">
                                        查看</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">账户在线充值管理</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="29" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="31" checked="checked" type="checkbox">
                                        充值</label></span>
                                                                    <span><label><input name="modules" value="35" checked="checked" type="checkbox">
                                        取消订单</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">账户出入账记录</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="11" checked="checked" type="checkbox">
                                        查看</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">云平台订购</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="15" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="17" checked="checked" type="checkbox">
                                        订购</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">考勤卡订购</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="485" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="487" checked="checked" type="checkbox">
                                        订购考勤卡</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">短信数量订购</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="466" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="468" checked="checked" type="checkbox">
                                        订购短信</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">视频会员时长订购</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="500" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="502" checked="checked" type="checkbox">
                                        订购视频会员</label></span>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">短信会员时长订购</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="495" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="497" checked="checked" type="checkbox">
                                        订购短信会员</label></span>
                                                            </div>
                        </div>
                                    </div> --%>
                                    
                                    
                                    
                         
                    
                             <div>
                    <div class="module-big-name"><span>基础参数设置</span> <label><input class="all_module" type="checkbox"> 全选</label></div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">学校设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            
                            						<s:if test="allelements[46].eindex==47">
																	<span><label><input name="modules" value="page_parameter_school" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_school"  type="checkbox">
                                        查看</label></span>
													</s:else>
												
													<s:if test="allelements[47].eindex==48">
																	<span><label><input name="modules" value="page_parameter_school_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_school_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
                            
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">年级设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[48].eindex==49">
																	<span><label><input name="modules" value="page_parameter_grade" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_grade" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[49].eindex==50">
																	<span><label><input name="modules" value="page_parameter_grade_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_grade_add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[50].eindex==51">
																	<span><label><input name="modules" value="page_parameter_grade_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_grade_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
													
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">用户资料项设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[51].eindex==52">
																	<span><label><input name="modules" value="page_parameter_custom-field" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_custom-field" type="checkbox">
                                        查看</label></span>
													</s:else>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">班级类型设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[52].eindex==53">
																	<span><label><input name="modules" value="page_parameter_class-type" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_class-type" type="checkbox">
                                        查看</label></span>
													</s:else>
                                
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">课程表设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                           							<s:if test="allelements[53].eindex==54">
																	<span><label><input name="modules" value="page_parameter_schedule-template" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_schedule-template" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[54].eindex==55">
																	<span><label><input name="modules" value="page_parameter_schedule-template_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_schedule-template_add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[55].eindex==56">
																	<span><label><input name="modules" value="page_parameter_schedule-template_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_schedule-template_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
													
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">教学科目设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[56].eindex==57">
																	<span><label><input name="modules" value="page_parameter_subject" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_subject" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[57].eindex==58">
																	<span><label><input name="modules" value="page_parameter_subject_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_subject_add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[58].eindex==59">
																	<span><label><input name="modules" value="page_parameter_subject_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_subject_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
													
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">教职工职务设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[59].eindex==60">
																	<span><label><input name="modules" value="page_parameter_teacher-duty" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_teacher-duty" type="checkbox">
                                        查看</label></span>
													</s:else>
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">组织机构设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[60].eindex==61">
																	<span><label><input name="modules" value="page_parameter_structure" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_structure" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[61].eindex==62">
																	<span><label><input name="modules" value="page_parameter_structure_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_structure_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
													<s:if test="allelements[62].eindex==63">
																	<span><label><input name="modules" value="page_parameter_structure_delete" type="checkbox" checked="checked">
                                        删除</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_structure_delete" type="checkbox">
                                        删除</label></span>
													</s:else>
													
                                                            </div>
                        </div>
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">考勤参数设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            						<s:if test="allelements[63].eindex==64">
																	<span><label><input name="modules" value="page_parameter_clock-config" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_clock-config" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[64].eindex==65">
																	<span><label><input name="modules" value="page_parameter_clock-config_add" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_clock-config_add" type="checkbox">
                                        编辑</label></span>
													</s:else>
													<s:if test="allelements[65].eindex==66">
																	<span><label><input name="modules" value="page_parameter_clock-config_edit" type="checkbox" checked="checked">
                                        考勤机添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_clock-config_edit" type="checkbox">
                                        考勤机添加</label></span>
													</s:else>
													
                                                            </div>
                        </div>
                        
                        
                        
                                          <%-- <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">会员参数设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                                                                    <span><label><input name="modules" value="524" checked="checked" type="checkbox">
                                        查看</label></span>
                                                                    <span><label><input name="modules" value="526" checked="checked" type="checkbox">
                                        编辑</label></span>
                                                            </div>
                        </div> --%> 
                        
                        
                        
                                            <div class="module-items" style="padding-left:26px;">
                            <div class="module-name">角色权限设置</div>                
                            <div class="module-items" style="padding-left:40px;">
                            								<s:if test="allelements[56].eindex==67">
																	<span><label><input name="modules" value="page_parameter_role" type="checkbox" checked="checked">
                                        查看</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_role" type="checkbox">
                                        查看</label></span>
													</s:else>
													<s:if test="allelements[67].eindex==68">
																	<span><label><input name="modules" value="page_parameter_role_add" type="checkbox" checked="checked">
                                        添加</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_role_add" type="checkbox">
                                        添加</label></span>
													</s:else>
													<s:if test="allelements[68].eindex==69">
																	<span><label><input name="modules" value="page_parameter_role_edit" type="checkbox" checked="checked">
                                        编辑</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_role_edit" type="checkbox">
                                        编辑</label></span>
													</s:else>
													<s:if test="allelements[69].eindex==70">
																	<span><label><input name="modules" value="page_parameter_role_delete" type="checkbox" checked="checked">
                                        删除</label></span>
													</s:if><s:else>
																	<span><label><input name="modules" value="page_parameter_role_delete" type="checkbox">
                                        删除</label></span>
													</s:else>
                            
                                                            </div>
                        </div>
                                    </div>
                    </div></div> 
                    
                    
                    
                    
        <div class="panel layout-panel layout-panel-center" style="width: 516px; left: 0px; top: 407px;"><div region="center" border="false" style="overflow: hidden; background-color: rgb(224, 236, 255); width: 516px; height: 101px;" title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
            <div id="dlg-buttons" style="background-color:#E0ECFF; padding-top:8px; padding-bottom:0px; float:right;">
                <a href="#" id="save-btn" class="easyui-linkbutton l-btn l-btn-small" iconcls="icon-save" onclick="saveUserRoleModules()" group="">保存</a>
                <a href="#" class="easyui-linkbutton panel-tool-close l-btn l-btn-small" iconcls="icon-no" onclick="javascript:parent.$('#openWindow').window('close');" group="" id="">取消</a>
            </div>
        </div></div>
&nbsp;
    <div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div></div>    

</form>


<script type="text/javascript">
    /* 保存角色模块权限 */
    function saveUserRoleModules(){
        if ($('#save-btn').hasClass('mylinkbtn-load')) {
            return false;
        }
        
        $('#save-btn').addClass('mylinkbtn-load');

        $('#fm').form('submit',{
        	url: "${pageContext.request.contextPath}/roleAction_editRolePower.action",
            onSubmit: function(){
                var flag = $(this).form('enableValidation').form('validate');
                if (flag == false) {
                    $('#save-btn').removeClass('mylinkbtn-load');
                }
                return flag;
            },
            success: function(result){
                $('#save-btn').removeClass('mylinkbtn-load');
                
                var result = eval('('+result+')');
                if (result.errMeg){
                    window.parent.showAlert('操作失败', result.errMeg);
                } else {
                    parent.window.closeWinIsReloadData = 1;
                    parent.$('#openWindow').window('close');
                }
            }
        });
    }

    $(function(){

        /* 监听checkbox点击事件 */
        $('body').on('click', 'input[name="modules"]', function(){
            if ($(this).prop('checked') == true) {
                /* 选择编辑修改则一定要选择列表 */
                $(this).closest('.module-items').find('input[name="modules"]:eq(0)').prop('checked', true);
                if($(this).closest('.module-items').parent('.module-items').parent().find('input[name="modules"]').not('input:checked').length == 0){
                    $(this).closest('.module-items').parent('.module-items').parent().find('.all_module').prop('checked', true);
                }
            } else {
                /* 如果列表没有选择, 则其他也不可以选择 */                
                if ($(this).parent('span').index() == 0) {
                    $(this).closest('.module-items').find('input[name="modules"]').prop('checked', false);
                }
                $(this).closest('.module-items').parent('.module-items').parent().find('.all_module').prop('checked', false);
            }
        });

        //全选
        $('body').on('click', '.all_module', function(){
            if($(this).prop('checked')){
                $(this).closest('.module-big-name').parent().find('input[name="modules"]').prop('checked', true);
            }else{
                $(this).closest('.module-big-name').parent().find('input[name="modules"]').prop('checked', false);
            }
        })

        /* 初始化 全选 */
        $('input[name="modules"]').each(function(){
            if ($(this).prop('checked') == true) {
                /* 选择编辑修改则一定要选择列表 */
                $(this).closest('.module-items').find('input[name="modules"]:eq(0)').prop('checked', true);
                if($(this).closest('.module-items').parent('.module-items').parent().find('input[name="modules"]').not('input:checked').length == 0){
                    $(this).closest('.module-items').parent('.module-items').parent().find('.all_module').prop('checked', true);
                }
            } else {
                /* 如果列表没有选择, 则其他也不可以选择 */
                if ($(this).parent('span').index() == 0) {
                    $(this).closest('.module-items').find('input[name="modules"]').prop('checked', false);
                }
                $(this).closest('.module-items').parent('.module-items').parent().find('.all_module').prop('checked', false);
            }
        })
    });
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