<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <title>家长端</title>
    <link rel="stylesheet" href="parent/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="parent/css/main.css">
    <link rel="stylesheet" href="parent/css/index.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<s:if test="#session.loginParent.phone!=null">

<div class="neirong" id="youeryuan">
    <header>

        <!--//时间问候-->
        <div class="shijianwenhou">
            <span class="shijian">晚上好</span>
            <!--人名性别-->
            <span>,</span>
            <span class="renming"><s:property value="#session.loginParent.parent_name"/></span>
            <span class="xingbie"></span>
        </div>


        <div class="renyuanxinxi">
            <!--幼儿园名称-->
            <span class="youeryuanmingcheng">汤圆   幼儿园</span>
            <!--部门-->
            <span> &gt; </span>
            <span class="bumen"><s:property value="#session.loginParent.grade.name"/></span>
            <!--职务-->
            <span>(</span>
            <span class="zhiwu"><s:property value="#session.loginParent.classes.class_name"/></span>
            <span>)</span>
        </div>
    </header>

    <section>

        <table>
       		<input id="longitude" value="<s:property value="#session.longitude"/>" type="hidden">
        	<input id="latitude" value="<s:property value="#session.latitude"/>" type="hidden">
            <tr class="diyi">
                <%-- <td><a href="${pageContext.request.contextPath}/studentBespeakAction_p_add.action" >
                    <div >
                        <img src="parent/img/a/yuyuetoast.png" alt=""/>
                        <span>入园预约</span>
                    </div>
                </a>
                </td> --%>
                <td><a id="daoxiaoqiandao">
                    <div>
                        <img src="parent/img/a/qiandaofalse.png" alt=""/>
                        <span >到校签到</span>
                    </div>
                </a></td>
                <td>
                
                
                </td> 
                <td><a id="lixiaoqiantui">
                    <div>
                        <img src="parent/img/a/lixiaofalse.png" alt=""/>
                        <span>离校签退</span>
                    </div>
                </a></td>
            </tr>
            <tr>
                <td><a href="${pageContext.request.contextPath}/noticeAction_p_notice.action">
                    <div>
                        <img src="parent/img/a/tongzhi.png" alt=""/>
                        <span class="fontsize">通知公告</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/askAction_p_ask.action">
                    <div>
                        <img src="parent/img/a/wenjuan.png" alt=""/>
                        <span class="fontsize">问卷调查</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/studentVacationAction_p_studentVacation.action">
                    <div>
                        <img src="parent/img/a/qingjia.png" alt=""/>
                        <span class="fontsize">宝贝请假</span>
                    </div>
                </a></td>
            </tr>
            <tr>
                
                <td><a href="${pageContext.request.contextPath}/curriculaTableAction_p_classCurricula.action">
                    <div>
                        <img src="parent/img/a/kebiao.png" alt=""/>
                        <span class="fontsize">课程安排</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/studentMonthCheckAction_p_studentMonthCheck.action">
                    <div>
                        <img src="parent/img/a/kaoqing.png" alt=""/>
                        <span class="fontsize">考勤记录</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/homeWorkAction_p_homeWork.action">
                    <div>
                        <img src="parent/img/a/zuoye.png" alt=""/>
                        <span class="fontsize">每日作业</span>
                    </div>
                </a></td>
                
            </tr>
            <tr>
                <td><a href="${pageContext.request.contextPath}/cookBookAction_p_cookBook.action">
                    <div>
                        <img src="parent/img/a/shipu.png" alt=""/>
                        <span class="fontsize">每日食谱</span>
                    </div>
                </a></td>
                <td><a href="${pageContext.request.contextPath}/studentAction_p_about.action">
                    <div>
                        <img src="parent/img/a/dangan.png" alt=""/>
                        <span class="fontsize">宝贝档案</span>
                    </div>
                </a></td>
                <%-- <td><a href="parent/banjiquan.html">
                    <div>
                        <img src="parent/img/a/xinzhuti.png" alt=""/>
                        <span class="fontsize">班级圈</span>
                    </div>
                </a></td> --%>
                <td><a href="${pageContext.request.contextPath}/schoolAction_p_about.action">
                    <div>
                        <img src="parent/img/a/schoolabout.png" alt=""/>
                        <span class="fontsize">学校概况</span>
                    </div>
                </a></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>

                <%-- <td><a href="${pageContext.request.contextPath}/schoolAction_p_about.action">
                    <div>
                        <img src="parent/img/a/schoolabout.png" alt=""/>
                        <span class="fontsize">学校概况</span>
                    </div>
                </a></td> --%>
                <td><a >
                    <!--<div>-->
                        <!--<img src="img/a/shipinzhibo.png" alt=""/>-->
                        <!--<span class="fontsize">视频直播</span>-->
                    <!--</div>-->
                </a></td>
            </tr>
        </table>
    </section>

    <footer id="haha">
        <div><a href="#">
            <div>
                <img class="hidden" src="parent/img/aa/baobei.png" alt=""/>
                <img  src="parent/img/aa/baobei_over.png" alt=""/>
                <span class="dianji">幼儿园</span>
            </div>
        </a></div>
        <div><a href="${pageContext.request.contextPath}/studentAction_p_news.action">
            <div>
                <img  src="parent/img/aa/xiaoxi.png" alt=""/>
                <img   class="hidden" src="parent/img/aa/xiaoxi_over.png" alt=""/>
                <span>消息</span>
            </div>
        </a></div>
        <%-- <div><a id="j-loginBtn">
            <div>
                <img  src="parent/img/aa/tongxunlu.png" alt=""/>
                <img class="hidden"  src="parent/img/aa/tongxunlu_over.png" alt=""/>
                <span>通讯录</span>
            </div>
        </a></div> --%>
        <div><a href="${pageContext.request.contextPath}/studentAction_p_mine.action">
            <div>
                <img  src="parent/img/aa/wode.png" alt=""/>
                <img  class="hidden" src="parent/img/aa/wode_over.png" alt=""/>
                <span>我的</span>
            </div>
        </a></div>
    </footer>


</div>
</s:if><s:else>
	<jsp:forward page="${pageContext.request.contextPath}/studentAction_p_login.action"></jsp:forward>
</s:else>

<script src="parent/lib/jquery/jquery.js"></script>
<script src="parent/lib/bootstrap/js/bootstrap.js"></script>
<script src="parent/js/main.js"></script>
<script src="parent/js/index.js"></script>


<!--//////////////////////-->
<script src="parent/webdemo/3rd/jquery-1.11.3.min.js"></script>
<script src="parent/webdemo/im/js/config.js"></script>
<script src="parent/webdemo/im/js/md5.js"></script>
<script src="parent/webdemo/im/js/util.js"></script>
<script src="parent/webdemo/im/js/login.js"></script>

</body>

</html>
