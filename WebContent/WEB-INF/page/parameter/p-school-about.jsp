<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <title>校园概括</title>
    <link rel="stylesheet" href="parent/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="parent/css/main.css">

    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->



    <script src="parent/lib/jquery/jquery.js"></script>
    <script src="parent/lib/bootstrap/js/bootstrap.js"></script>
    <script src="parent/js/shijianjuli/TimeDifference.js"></script>
    <script src="parent/js/main.js"></script>


    <link rel="stylesheet" href="parent/css/xiaoyuangaikuo.css">


    <style type="text/css">
        html {
            position: relative;
            min-height: 100%;
        }
        body {
            background-color: #ECEFF1;
            color: #37474F;
            font-family: 'Raleway', sans-serif;
            font-weight: 300;
            font-size: 16px;
        }
        h1, h2, h3 {
            font-weight: 200;
        }

        .xyhjz {
            width: 100%;
            /* background: pink; */
            height: 50px;
            margin-top: 28px;
            font-size: 20px;
            margin-left: 10px;
            padding-top: 8px;
        }

        .szllz{
            width: 100%;
            /*background: pink;*/
            height: 50px;
            margin-top: 20px;
            font-size: 20px;
            margin-left: 10px;
        }
        .bbzpyrcz{
            width: 100%;
            /* background: pink; */
            height: 50px;
            margin-top: -16px;
            font-size: 20px;
            margin-left: 10px;
            padding-top: 8px;
        }
        .shizililiang{
            width: 100%;
            padding-right: 20px;
            margin-top: -83px;

        }





        .material-card.mc-active .mc-footer {

            right: -19px;

        }

        .baguetteBoxOne {
            width: 100%;
            margin: 0 auto;
            /*margin-top: 45px;*/
            /*background: #000000;*/
        }
        #baguetteBox-overlay {
            background:rgba(0,0,0,1);
        }


        .xiaoyuanjianjie{
            color: #727183;
            padding-left: 10px;
            padding-right: 10px;
            text-indent: 15px;
            padding-bottom: 30px;;
        }


        .deer{
            margin-bottom: 30px;;
        }
        .zhaoshengfangshi{
            margin-left: 10px;
            margin-right: 30px;
        }
        .nianlingfanwei{
            color: blue;
        }

        .jj{
            margin-top: 50px;
        }
    </style>
</head>

<body>
<div class="neirong" id="youeryuan">
    <header>
        <span class="glyphicon glyphicon-menu-left">校园概括</span>

    </header>



    <section>

        <div class="xuexiaohuanjing">

            <div class="xyhjz">校园环境</div>

            <div id="xiaoyuanhuanjinglunbo">


            </div>




            <div class="szllz">校园简介</div><s:property value="school.about_info"/>

            <div class="xiaoyuanjianjie" id="xiaoyuanjianjie"><s:property value="school.about_info"/></div>


            <div class="bbzpyrcz">宝贝作品与日常</div>



            <div id="baobeizuopin"></div>



            <div class="jj"></div>
            <div class="bbzpyrcz ">招生介绍</div>




            <div></div><span class="zhaoshengfangshi">招生方式:</span><span><s:property value="school.supply_way"/></span>
            <div></div><span class="zhaoshengfangshi">招生范围:</span><span class="nianlingfanwei" id="nianling"><s:property value="school.supply_range"/></span>
            <div></div><span class="zhaoshengfangshi">招生人数:</span>
            <div></div><span class="zhaoshengfangshi"><s:property value="school.supply_number"/></span>
            
            <%-- <div></div> <span class="zhaoshengfangshi">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span>小班:&nbsp&nbsp</span><span class="nianlingfanwei" id="xiaobanrenshu">20</span><span>人</span>
            <div></div> <span class="zhaoshengfangshi">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span>中班:&nbsp&nbsp</span><span class="nianlingfanwei" id="zhongbanrenshu">20</span><span>人</span>
            <div></div> <span class="zhaoshengfangshi">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span>大班:&nbsp&nbsp</span><span class="nianlingfanwei" id="dabanrenshu">20</span><span>人</span> --%>

            <div></div><span class="zhaoshengfangshi">收费标准:</span><span><s:property value="school.supply_fee"/></span>
            <%-- <span class="nianlingfanwei" id="feiyong">600</span><span>元/月</span><div  class="zhaoshengfangshi">其余按物价局规定收取</div> --%>



        </div>




    </section>

</div>

<script src="parent/js/xiaoyuangaikuo.js"></script>

</body>
</html>




<script>

</script>