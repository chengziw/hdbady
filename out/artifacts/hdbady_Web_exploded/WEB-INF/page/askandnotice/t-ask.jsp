<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <title>问卷调查</title>
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/wenjuandiaocha.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <script src="teacher/lib/jquery/jquery.js"></script>
    <script src="teacher/lib/bootstrap/js/bootstrap.js"></script>
    <script src="teacher/js/shijianjuli/TimeDifference.js"></script>
    <script src="teacher/js/main.js"></script>
    <script src="teacher/js/huadongli.js"></script>
    <style>


    </style>
</head>

<body>

<div class="neirong" id="youeryuan">
    <header>
        <span class="glyphicon glyphicon-menu-left">问卷调查</span>
    </header>



    <section>

        <ul class="ul-list">
            <!--<li class="aa">-->
                <!--<div class="bb">-->
                    <!--<span class="title">国防生事故国防生事故国防生事故国防生事故</span>-->
                    <!--<span class="glyphicon glyphicon-menu-right"></span>-->
                    <!--<span class="shijian">2017-02-28</span>-->
                <!--</div>-->
                <!--<div class="btn">删除</div>-->
            <!--</li>-->
            <!--<li class="aa">-->
                <!--<div class="bb">-->
                    <!--<span class="title">国防</span>-->
                    <!--<span class="glyphicon glyphicon-menu-right"></span>-->
                    <!--<span class="shijian">2017-02-28</span>-->
                <!--</div>-->
                <!--<div class="btn">删除</div>-->
            <!--</li>-->
        </ul>

        <div class="content hidden">
            <button class="btn " id="fanli">返回列表</button>
            <div class="content-header">

                <div class="content-title">什么事情什么事情么事情什么事情么事情什么事情什么事情</div>
                <div class="content-shijian">2017-01-16 15:30:29</div>
            </div>

            <div class="renshuhang">
                <div class="renshu">
                    已填人数：<span id="renshu">4</span>人(该结果不记名）
                </div>
                <span class="jieguo">查看结果</span>
            </div>






            <form action="${pageContext.request.contextPath}/askAction_t_checkAsk.action" method="post">
                 <div class="tijiao ">
                <div class="xuanxiang">


                    <!--<div>-->
                        <!--<label class="checkbox-inline">-->
                        <!--<input type="checkbox" id="inlineCheckbox1" value="option1"> &nbsp&nbsp   社会-->
                        <!--</label>-->

                    <!--</div>-->
                    <!--<div>-->
                        <!--<label class="checkbox-inline">-->
                            <!--<input type="checkbox" id="inlineCheckbox2" value="option2"> &nbsp&nbsp  科学-->
                        <!--</label>-->

                    <!--</div>-->
                    <!--<div>-->
                        <!--<label class="checkbox-inline">-->
                            <!--<input type="checkbox" id="inlineCheckbox3" value="option3">&nbsp&nbsp 语文-->
                        <!--</label>-->
                    <!--</div>-->

                </div>


                <div class="jiesu"> 2017-01-20 23:59:59</div>
                <div class="button">

                    <button type="submit" class="btn btn-primary btn-lg btn-block" id="buttontijiao">提交</button>
                </div>
            </div>
            </form>

            <div class="xiangjie " id="bilibiao">
                <table>
                    <tr>
                        <td>选项</td>
                        <td>得票</td>
                        <td>比例</td>
                    </tr>
                    <tr>
                        <td>打雪仗</td>
                        <td>3</td>
                        <td>75%</td>
                    </tr>
                    <tr>
                        <td>吃烤羊肉</td>
                        <td>4</td>
                        <td>100%</td>
                    </tr>
                    <tr>
                        <td>游泳比赛</td>
                        <td>1</td>
                        <td>25%</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
<input id="flag" value="<s:property value="flag"/>" type="hidden">
</div>




<script src="teacher/js/wenjuandiaocha.js"></script>

</body>
</html>


