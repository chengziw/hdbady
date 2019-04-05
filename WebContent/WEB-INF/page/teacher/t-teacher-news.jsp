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

    <title>消息</title>
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">

    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <script src="teacher/lib/jquery/jquery.js"></script>
    <script src="teacher/lib/bootstrap/js/bootstrap.js"></script>
    <style>
        .neirong{
            overflow: hidden;
        }
        header{
            width: 100%;
            height: 70px;
            background: #219CE2;
            vertical-align: middle;
            line-height: 70px;
            overflow: hidden;
            position: fixed;


        }

        header span{
            font-size: 24px;
            color: #D3F0FC;
            padding-left: 10px;
            /*background: pink;*/
            display: block;
            height: 40px;
        }




        section{
            margin-top: 70px;
        }

        .ul-list li{
            width: 100%;
            height: 80px;
            /*background: pink;*/
            border-bottom: 1px solid #C1C1C1;
            padding-bottom: 10px;
            padding-top: 10px;
        }
        .ul-list li .tupian{
            width: 18%;
            height: 60px;
            /*background: blue;*/
            float: left;

        }
        .ul-list li .tupian img{
            width: 100%;
            height: 60px;
            /*background: red;*/

        }
        .ul-list li .jianjie{
            width: 80%;
            height: 60px;
            /*background: red;*/
            float: right;
            padding-top: 13px;
            padding-left: 6px;
        }
        .ul-list li .jianjie div:first-child{
            font-size: 18px;
        }


    </style>
</head>

<body>

<div class="neirong" id="youeryuan">
    <header>
        <span class="glyphicon glyphicon-menu-left">消息</span>
    </header>

    <section>
        <ul class="ul-list">
            <!--<li>-->
                <!--<div class="tupian">-->
                    <!--<img src="aa.png" alt=""/>-->

                <!--</div>-->
                <!--<div class="jianjie">-->
                    <!--<div>学生考勤</div>-->
                    <!--<div>今天已到学生0个，未到学生24个</div>-->
                <!--</div>-->
            <!--</li>-->
            <!--<li>-->
                <!--<div class="tupian">-->
                    <!--<img src="aa.png" alt=""/>-->

                <!--</div>-->
                <!--<div class="jianjie">-->
                    <!--<div>学生考勤</div>-->
                    <!--<div>今天已到学生0个，未到学生24个</div>-->
                <!--</div>-->
            <!--</li>-->
        </ul>
    </section>



</div>





</body>

</html>

<script>
    var fanhui = $("header span")[0];
    fanhui.onclick= function () {
        //console.log(fanhui);
        top.location = "teacherAction_t_home.action";
        //window.history.back(-1);
    };
</script>

<script>

    $(function () {
                $.ajax({
                    type: 'post',
                    url: 'teacherAction_t_teacherNews.action',

                    dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                    success: function (data) {

//
                        /*"messageList":[
                         {
                         "desc":"今天已到学生0，未到100",
                         "title":"学生考勤",
                         "type":1
                         },*/
                        $(data.messageList).each(function (index, value) {

//                            console.log(this.type);
                            var li = $("<li>" +
                                    "<div class='tupian'>"+
                            "<img src='aa.png' />"+
                                    "</div>"+
                                    "<div class='jianjie'>"+
                                    "<div>"+this.title+"</div>"+
                                    "<div>"+this.desc+"</div>"+
                            "</div>" +
                                    "</li>");



                            var img = li[0].children[0].children[0];


                            switch (this.type){



                                case 1:url="teacher/img/aa/xsqdtongzhi.png";break;
                                case 2:url="teacher/img/aa/xsqjtongzhi.png";break;
                                case 3:url="teacher/img/aa/jiaofei.png";break;
                                case 4:url="teacher/img/aa/tongzhi.png";break;
                         /*        case 5:url="img/aa/wenjuan.png";break;
                                case 6:url="img/aa/qingjia.png";break;
                                case 7:url="img/aa/kaoqing.png";break;
                                case 8:url="img/aa/kebiao.png";break;
                                case 9:url="img/aa/zuoye.png";break;
                                case 10:url="img/aa/shipu.png";break;
                                case 11:url="img/aa/xinzhuti.png";break; */

                            }


                            img.src =url;






                            $(".ul-list").append(li);


                            var that = this;
                            li.click(function () {
//                                top.location = "index.html";
//                                console.log(that.type);
                                var url;
                                switch (that.type){
                                    case 1:url="${pageContext.request.contextPath}/studentCheckAction_t_studentComeAndGo.action?flag=1";break;
                                    case 2:url="${pageContext.request.contextPath}/studentVacationAction_t_studentVacationCheck.action?flag=1";break;
                                    case 4:url="${pageContext.request.contextPath}/noticeAction_t_notice.action?flag=1";break;
                                    case 5:url="${pageContext.request.contextPath}/askAction_t_ask.action?flag=1";break;
                                    /* case 5:url="wenjuandiaocha.html";break;
                                    case 6:url="jiaoshiqingjia.html";break;
                                    case 7:url="kaoqinjilu.html";break;
                                    case 8:url="kcap.html";break;
                                    case 9:url="meirizuoye.html";break;
                                    case 10:url="meirishipu.html";break;
                                    case 11:url="banjiquan.html";break; */

                                }


                                top.location = url;
                            });

                        })

                    },
                    error: function () {
                        alert("error occured!!!");
                    }

                });

            }
    )

</script>