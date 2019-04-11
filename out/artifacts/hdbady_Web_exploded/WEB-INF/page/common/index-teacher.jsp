<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <title>教师端</title>
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/index.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<s:if test="#session.loginTeacher.phone!=null">
<div class="neirong" id="youeryuan">
    <header>

        <!--//时间问候-->
        <div class="shijianwenhou">
            <span class="shijian">晚上好</span>
            <!--人名性别-->
            <span>,</span>
            <span class="renming"><s:property value="#session.loginTeacher.teacher_name"/></span>
            <%-- <span class="xingbie"><s:property value="#session.loginTeacher.sex_name"/></span> --%>
        </div>


        <div class="renyuanxinxi">
            <!--幼儿园名称-->
            <span class="youeryuanmingcheng">汤圆幼儿园</span>
            <!--部门-->
            <span> &gt; </span>
            <span class="bumen"><s:property value="#session.loginTeacher.teacherDuty.duty_name"/></span>
            <!--职务-->
            <span>(</span>
            <span class="zhiwu"><s:property value="#session.loginTeacher.structure.name"/></span>
            <span>)</span>
        </div>
    </header>

    <section>

        <table>
        	<input id="longitude" value="<s:property value="#session.longitude"/>" type="hidden">
        	<input id="latitude" value="<s:property value="#session.latitude"/>" type="hidden">
            <tr class="diyi">
                <td><a href="${pageContext.request.contextPath}/studentCheckAction_t_studentComeAndGo.action" >
                    <div >
                        <img src="teacher\img\aa\xsqdtongzhi.png" alt=""/>
                        <span>学生签到</span>
                    </div>
                </a>
                </td>
                <td>
                
                </td>
                <td id="shangbandaka"> <a>
                    <div>
                        <img src="teacher/img\aa\xsqdtongzhi.png" alt=""/>
                        <span class="vacation">上班打卡</span>
                    </div>
                </a>
                </td>
            </tr>
            <tr>
               
                <td><a href="${pageContext.request.contextPath}/noticeAction_t_notice.action">
                    <div>
                        <img src="teacher\img\aa\tongzhi.png" alt=""/>
                        <span >通知公告</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/askAction_t_ask.action">
                    <div>
                        <img src="teacher/img\aa\wenjuan.png" alt=""/>
                        <span >问卷调查</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/teacherVacationAction_t_teacherVacation.action">

                    <div>
                        <img src="teacher/img\aa\qingjia.png" alt=""/>
                        <span >教师请假</span>
                    </div>
                </a></td>
            </tr>
            <tr>
                <td><a href="${pageContext.request.contextPath}/teacherMonthCheckAction_t_teacherMonthCheck.action">
                    <div>
                        <img src="teacher/img\aa\kaoqing.png" alt=""/>
                        <span >考勤记录</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/curriculaTableAction_t_classCurricula.action">
                    <div>
                        <img src="teacher\img\aa\kebiao.png" alt=""/>
                        <span >学生课表</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/homeWorkAction_t_homeWork.action">
                    <div>
                        <img src="teacher\img\aa\zuoye.png" alt=""/>
                        <span >每日作业</span>
                   </div>
                </a></td>
            </tr>
            <tr>
                <td><a href="${pageContext.request.contextPath}/cookBookAction_t_cookBook.action">
                    <div>
                        <img src="teacher\img\aa\shipu.png" alt=""/>
                        <span >每日食谱</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/studentAction_t_studentPhoto.action">
                    <div>
                        <img src="teacher/img\aa\xsqdtongzhi.png" alt=""/>
                        <span>学生相册</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/studentVacationAction_t_studentVacationCheck.action">
                    <div>
                        <img src="teacher\img\aa\xsqjtongzhi.png" alt=""/>
                        <span>学生请假</span>
                    </div>
                </a></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </section>

    <footer id="haha">
        <div><a href="#">
            <div>
                <img class="hidden" src="teacher\img\aa\baobei.png" alt=""/>
                <img  src="teacher\img\aa\baobei_over.png" alt=""/>
                <span class="dianji">幼儿园</span>
            </div>
        </a></div>
        <div><%-- <a href="${pageContext.request.contextPath}/teacherAction_t_teacherNews.action"> --%>
        <a href="${pageContext.request.contextPath}/teacherAction_t_news.action">
            <div>
                <img  src="teacher\img\aa\xiaoxi.png" alt=""/>
                <img   class="hidden" src="teacher\img\aa\xiaoxi_over.png" alt=""/>
                <span>消息</span>
            </div>
        </a></div>
        <%-- <div><a href="#">
            <div>
                <img  src="teacher\img\aa\tongxunlu.png" alt=""/>
                <img class="hidden"  src="teacher\img\aa\tongxunlu_over.png" alt=""/>
                <span>通讯录</span>
            </div>
        </a></div> --%>
        <div><a href="${pageContext.request.contextPath}/teacherAction_t_mine.action">
            <div>
                <img  src="teacher\img\aa\wode.png" alt=""/>
                <img  class="hidden" src="teacher\img\aa\wode_over.png" alt=""/>
                <span>我的</span>
            </div>
        </a></div>
    </footer>


</div>
</s:if><s:else>
<jsp:forward page="${pageContext.request.contextPath}/teacherAction_t_login.action"></jsp:forward>
</s:else>

<script src="teacher/lib/jquery/jquery.js"></script>
<script src="teacher/lib/bootstrap/js/bootstrap.js"></script>
<script src="teacher/js/main.js"></script>
<script src="teacher/js/index.js"></script>

<!--//////////////////////-->
<script src="teacher/webdemo/3rd/jquery-1.11.3.min.js"></script>
<script src="teacher/webdemo/im/js/config.js"></script>
<script src="teacher/webdemo/im/js/md5.js"></script>
<script src="teacher/webdemo/im/js/util.js"></script>
<script src="teacher/webdemo/im/js/login.js"></script>

</body>

</html>
