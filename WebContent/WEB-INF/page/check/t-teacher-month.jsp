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

    <title>考勤记录</title>
    <link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="teacher/css/main.css">
    <link rel="stylesheet" href="teacher/css/kaoqinjilu.css">
    <!--[if lt IE 9]>
    <script src="lib/html5shiv/html5shiv.min.js"></script>
    <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <script src="teacher/lib/jquery/jquery.js"></script>
    <script src="teacher/lib/bootstrap/js/bootstrap.js"></script>
    <script src="teacher/js/main.js"></script>


    <script src="teacher/js/kiner-swiper-panel.min.js" type="text/javascript"></script>


    <style type="text/css">
        *{ margin:0; padding:0;}
        a{ text-decoration:none; outline:none;}
        body a{outline:none;

            blr:expression(this.onFocus=this.blur());}
        img{ border:none;}
        ul{ list-style:none;}
        body{ color:#666666;overflow: hidden;
            font-size:14px; font-family:"微软雅黑"; background-color:#fff; height:100%; overflow-y:scroll;*overflow-y:inherit;}
        /*html{ height:100%;}*/
        .clearfix:after{ content:"."; display:block; height:0; clear:both; overflow:hidden;}
        .clearfix{ zoom:1;}



        #aa{margin: 70px auto;
            width: 100%;
            height: 465px;
            /*background: pink;*/
            position: relative;
            margin-bottom: 0px;




        }
        #box{width:100%; position:absolute;
            display: block;}
        #title{width:100%; height:45px;}
        #month{ float:left;width:16.5%; height:49px;text-align:center;cursor:pointer;line-height:49px;}
        #year{float:left;width:16.5%; height:50px;text-align:center;cursor:pointer;line-height:50px;}
        #week{ width:100%;height:46px;}
        #week div{ float:left; width: 13.6621%; height:50px; margin:1px; background:#C90; color:#fff; text-align:center; line-height:48px; cursor:pointer;}
        #con{ width:100%;}
        #con div{

            float:left; width: 13.6621%; height:52px; margin:1px; background:#CCC; color:#333; text-align:center; line-height:48px; cursor:pointer;}
        #con .edate{background:#999;}
        #con .edate:hover{background:#09F; color:#fff;}
        /*#con div.now{background:red; color:#fff;}*/

        .spanclass{
            display: inline-block;
            width: 100%;
            height: 10px;
            background: pink  ;
            position: absolute;
            /*bottom: 0;*/
            bottom: 0;
            left: 0;
            /*position: relative;*/
            z-index: 9;

        }
        #con  span.span1{
            display: inline-block;
            width: 50%;
            height: 10px;
            background: blue;
            float: left;
        }
        #con span.span2{
            display: inline-block;
            width: 50%;
            height: 10px;
            background: whitesmoke;
            float: right;
        }

        #prevmonth,#nextmonth,#prevyear,#nextyear{float:left;width:16.5%; height:50px;text-align:center;cursor:pointer;line-height:50px;}

        #btns{width:315px; height:40px;}
        #nowtime{ float:left; margin:5px; height:30px; line-height:30px; padding:0 5px; background:#09F; cursor:pointer; border-radius:5px;}
        #nowtime:hover{background:#ddd;}
    </style>














</head>

<body>








<div class="neirong" id="youeryuan">
    <header>
        <span class="glyphicon glyphicon-menu-left">考勤记录</span>
    </header>



    <section>


        <!--<p>选择日期：<input type="text" id="date" value="" style="height:40px; line-height:40px;"/></p>-->




        <div class="box">
            <div class="kinerContent">
                <div class="wrapper">
                    <div class="kinerItem">
                        <nav >
                            <ul class="kinerNav" id="tiaomu">
                                <li class="active diyi"></li>



                                <div id="ha"><div id="aa" ></div></div>



                                <!--条色代表-->
                                <div class="tiaosedaibiao">
                                    <div class="zhengchang">
                                        <div class="greenyanse"></div>
                                        <div class="greenzi">正常</div>
                                    </div>
                                    <div class="xiuxi">
                                        <div class="huiyanse"></div>
                                        <div class="huisezi">休息</div>
                                    </div>
                                    <div class="qingjia">
                                        <div class="huangyanse"></div>
                                        <div class="huangsezi">请假</div>
                                    </div>
                                    <div class="queka">
                                        <div class="baiyanse"></div>
                                        <div class="baisezi">缺卡</div>
                                    </div>
                                    <div class="chidaozaotui">
                                        <div class="redyanse"></div>
                                        <div class="redsezi">迟到早退</div>
                                    </div>
                                </div>








                            </ul>

                        </nav>


                    </div>

                    <div class="kinerItem">

                        <div class="hezi">
                            <div class="shijian"><h2 id="nianyue">2017-4-4</h2></div>
                            <div class="daka">
                                <div class="shangban">
                                    <div class="dazi"><h4>上班打卡</h4></div>
                                    <div class="zhuangtai"><h4 id="morningStatusLabel">状态：迟到</h4></div>
                                    <div class="dakashijian"><h4 id="arriveTime">时间：10:32:22</h4></div>
                                </div>


                                <!--  "morningStatus":0,正常，1休息，2请假，3却卡，4迟到早退

                     "morningStatusLabel":"休息",
                     "arriveTime":"9:49:50",
                     "afternoonStatus":4,
                     "afternoonStatusLabel":"迟到",
                     "leaveTime":"15.30,33"
                     }*/-->
                                <div class="xiaban">
                                    <div class="dazi"><h4>下班打卡</h4></div>
                                    <div class="zhuangtai"><h4 id="afternoonStatusLabel">状态：1早退</h4></div>
                                    <div class="dakashijian"><h4 id="leaveTime">时间：101:32:22</h4></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

    </section>

</div>


<script type="text/javascript">
    $(function () {

        //第一步:  实例化一个滑动面板,并绑定响应标签
        var ksp = $.kinerSwiperPanel({
            navSelector: "kinerNav", //导航栏选择器
            conSelector: "kinerContent" //显示面板选择器
        });
        $('.btn11').click(function () {
            var index = $(this).attr("data-slideTo");
            ksp.slideTo(index); //可通过此方法主动调用切换面板方法
        });
        /**
         * 注册change函数,当面板切换时插件将自动调用所给函数,并将当前面板索引通过参数形式返回
         */
        ksp.on(ksp.handlerNameList.change, function (activeIndex, event) {
            $('.eventPanel').text("事件回调信息: 面板已切换至" + (activeIndex + 1) + "号面板");
        });
    });


</script>

<script type="text/javascript">


    var fanhui = $("header span")[0];
    fanhui.onclick= function () {
        //console.log(fanhui);
        top.location = "teacherAction_t_home.action";
    };
    window.onload=function(){





        //创建日历控件基本结构
        var obody1=document.body;
        var obody = document.getElementById("aa");
        createbox();
        function createbox(){

            var ddbox=document.createElement("div");
            ddbox.id="box";
//            ddbox.style.display="none";
            var str="";
            str+='<div id="title"><div id="prevyear">&lt;&lt;</div><div id="prevmonth">&lt;</div><div id="month"></div><div id="year"></div><div id="nextmonth">&gt;</div><div id="nextyear">&gt;&gt;</div></div>';
            str+='<div id="week"><div>日</div><div>一</div><div>二</div><div>三</div><div>四</div><div>五</div><div>六</div></div>';
            str+='<li id="con" class="clearfix"></li>';
            str+='<div id="btns"><div id="nowtime">当前时间</div></div>';
            ddbox.innerHTML=str;
            obody.appendChild(ddbox);
        };
        //===================get ele===============================
        var omonth=document.getElementById("month");
        var oyear=document.getElementById("year");
        var con=document.getElementById("con");
        var prevmonth=document.getElementById("prevmonth");
        var nextmonth=document.getElementById("nextmonth");
        var prevyear=document.getElementById("prevyear");
        var nextyear=document.getElementById("nextyear");
        var nowtime=document.getElementById("nowtime");
//        var date=document.getElementById("date");
        var box=document.getElementById("box");
        //===================show date===============================
//        date.onfocus=function(){//显示控件
//            var datel=this.getBoundingClientRect().left;
//            var datet=this.getBoundingClientRect().top+40;
//            box.style.left=0+"px";
//            box.style.top=0+"px";
//            box.style.display="block";
//        };


        //===================set year month===============================
        //默认时间对象
        var dateObj = new Date();
        //动态控制
        prevmonth.onclick=function(){//上一月
            var ddm=null;
            var ddy=null;
            if((dateObj.getMonth()-1)==-1){
                ddm=11;
                ddy=dateObj.getFullYear()-1;
            }else{
                ddm=dateObj.getMonth()-1;
                ddy=dateObj.getFullYear();
            };
            dateObj.setFullYear(ddy);
            dateObj.setMonth(ddm);
            omonth.innerHTML=toyear(dateObj)+"月";
            oyear.innerHTML=dateObj.getFullYear()+"年";
            remove();
            oneweek=oneyearoneday(dateObj);
            alld=alldays(dateObj);
            nowd=nowday(dateObj);
            init(oneweek,alld,nowd);

            //////////////////////////////////////////////////////////
            var shijian = dateObj.getFullYear()+"-"+toyear(dateObj);
            qingqiu(shijian);

        };
        nextmonth.onclick=function(){//下一月
            var ddm=null;
            var ddy=null;
            if((dateObj.getMonth()+1)==12){
                ddm=0;
                ddy=dateObj.getFullYear()+1;
            }else{
                ddm=dateObj.getMonth()+1;
                ddy=dateObj.getFullYear();
            };
            dateObj.setFullYear(ddy);
            dateObj.setMonth(ddm);
            omonth.innerHTML=toyear(dateObj)+"月";
            oyear.innerHTML=dateObj.getFullYear()+"年";
            remove();
            oneweek=oneyearoneday(dateObj);
            alld=alldays(dateObj);
            nowd=nowday(dateObj);
            init(oneweek,alld,nowd);


            var shijian = dateObj.getFullYear()+"-"+toyear(dateObj);
            qingqiu(shijian);
        };
        prevyear.onclick=function(){//上一年
            var ddy=dateObj.getFullYear()-1;
            dateObj.setFullYear(ddy);
            oyear.innerHTML=dateObj.getFullYear()+"年";
            remove();
            oneweek=oneyearoneday(dateObj);
            alld=alldays(dateObj);
            nowd=nowday(dateObj);
            init(oneweek,alld,nowd);


            var shijian = dateObj.getFullYear()+"-"+toyear(dateObj);
            qingqiu(shijian);
        };
        nextyear.onclick=function(){//下一年
            var ddy=dateObj.getFullYear()+1;
            dateObj.setFullYear(ddy);
            oyear.innerHTML=dateObj.getFullYear()+"年";
            remove();
            oneweek=oneyearoneday(dateObj);
            alld=alldays(dateObj);
            nowd=nowday(dateObj);
            init(oneweek,alld,nowd);


            var shijian = dateObj.getFullYear()+"-"+toyear(dateObj);
            qingqiu(shijian);
        };
        //返回到今时今日
        nowtime.onclick=function(){
            var dddate=new Date();
            var ddm=dddate.getMonth();
            var ddy=dddate.getFullYear();
            dateObj.setFullYear(ddy);
            dateObj.setMonth(ddm);
            omonth.innerHTML=toyear(dateObj)+"月";
            oyear.innerHTML=dateObj.getFullYear()+"年";
            remove();
            oneweek=oneyearoneday(dateObj);
            alld=alldays(dateObj);
            nowd=nowday(dateObj);
            init(oneweek,alld,nowd);

            document.getElementsByClassName("now")[0].style.backgroundColor = "#09F";





            var shijian = dateObj.getFullYear()+"-"+toyear(dateObj);

            qingqiu(shijian);
        };
        //年月获取
        var year=dateObj.getFullYear();
        var month=toyear(dateObj);//0是12月
        //月年的显示
        omonth.innerHTML=month+"月";
        oyear.innerHTML=year+"年";
        //===================set day===============================

        //获取本月1号的周值
        var oneweek=oneyearoneday(dateObj);
        //本月总日数
        var alld=alldays(dateObj);
        //当前是几
        var nowd=nowday(dateObj);
        //初始化显示本月信息
        init(oneweek,alld,nowd);

        //===================function===============================
        //有无指定类名的判断
        function hasclass(str,cla){
            var i=str.search(cla);
            if(i==-1){
                return false;
            }else{
                return true;
            };
        };
        //初始化日期显示方法
        function remove(){
            con.innerHTML="";
        };
        function init(oneweek,alld,nowd){
            for(var i=1;i<=oneweek;i++){//留空
                var eday=document.createElement("div");
                eday.innerHTML="";





                con.appendChild(eday);
            };
            for(var i=1;i<=alld;i++){//正常区域
                var eday=document.createElement("div");

                eday.innerHTML=i;

                eday.style.position = "relative";
                var divb = document.createElement("span");





                divb.setAttribute("class","spanclass");
                var span1 = document.createElement("span");
                var span2 = document.createElement("span");

                span1.className = "span1";
                span2.className = "span2";

                divb.appendChild(span1);
                divb.appendChild(span2);
                eday.appendChild(divb);



                if(i==nowd){
                    eday.className="now edate";
                    con.appendChild(eday);


                }else{

                    eday.className="edate";


                    con.appendChild(eday);
                };
            };
        };
        //获取本月1号的周值
        function oneyearoneday(dateObj){
            var oneyear = new Date();
            var year=dateObj.getFullYear();
            var month=dateObj.getMonth();//0是12月
            oneyear.setFullYear(year);
            oneyear.setMonth(month);//0是12月
            oneyear.setDate(1);
            return oneyear.getDay();
        };
        //当前是几
        function nowday(dateObj){
            return dateObj.getDate();
        };
        //获取本月总日数方法
        function alldays(dateObj){
            var year=dateObj.getFullYear();
            var month=dateObj.getMonth();
            if(isLeapYear(year)){//闰年
                switch(month) {
                    case 0:   return "31";   break;
                    case 1:   return "29";   break;   //2月
                    case 2:   return "31";   break;
                    case 3:   return "30";   break;
                    case 4:   return "31";   break;
                    case 5:   return "30";   break;
                    case 6:   return "31";   break;
                    case 7:   return "31";   break;
                    case 8:   return "30";   break;
                    case 9:   return "31";   break;
                    case 10:   return "30";   break;
                    case 11:   return "31";   break;
                    default:
                };
            }else{//平年
                switch(month) {
                    case 0:   return "31";   break;
                    case 1:   return "28";   break;  //2月
                    case 2:   return "31";   break;
                    case 3:   return "30";   break;
                    case 4:   return "31";   break;
                    case 5:   return "30";   break;
                    case 6:   return "31";   break;
                    case 7:   return "31";   break;
                    case 8:   return "30";   break;
                    case 9:   return "31";   break;
                    case 10:   return "30";   break;
                    case 11:   return "31";   break;
                    default:
                };
            };
        };
        //闰年判断函数
        function isLeapYear(year){
            if( (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0)){
                return true;
            }else{
                return false;
            };
        };
        //月份转化方法
        function toyear(dateObj){
            var month=dateObj.getMonth()
            switch(month) {
                case 0:   return "1";   break;
                case 1:   return "2";   break;
                case 2:   return "3";   break;
                case 3:   return "4";   break;
                case 4:   return "5";   break;
                case 5:   return "6";   break;
                case 6:   return "7";   break;
                case 7:   return "8";   break;
                case 8:   return "9";   break;
                case 9:   return "10";   break;
                case 10:   return "11";   break;
                case 11:   return "12";   break;
                default:
            };
        };
        function qingqiu(shijian){
            $.ajax({
                type: 'post',
                url: 'teacherMonthCheckAction_t_pageQuery.action', 
                /* url: 'teacher/json/kaoqinjilu.json', */
                data:{"check_time":shijian},
                dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                success: function (data) {


                    /*"daylist":[


                     {
                     "day":1,
                     "morningStatus":0,正常，1休息，2请假，3却卡，4迟到早退

                     "morningStatusLabel":"休息",
                     "arriveTime":"9:49:50",
                     "afternoonStatus":4,
                     "afternoonStatusLabel":"迟到",
                     "leaveTime":"15.30,33"
                     }*/


                    //遍历每一个发送的作业条目

                    var array=[];
                    var i = 0;
                    $(data.daylist).each(function (index, value) {

//                        console.log(this.day);

                        i++;


                        var span1 = $("#con div.edate:eq("+parseInt(this.day-1)+") .span1 ");

                        var span2 = $("#con div.edate:eq("+parseInt(this.day-1)+") .span2 ");


                        switch (this.morningStatus){
                            case 0:span1.css("background","green");
                                break;
                            case 1:span1.css("background"," #CCCCCC");break;
                            case 2:span1.css("background","yellow");
                                break;
                            case 3:span1.css("background","whitesmoke");break;
                            case 4:span1.css("background","red");break;
                        }
                        switch (this.afternoonStatus){
                            case 0:span2.css("background","green");break;
                            case 1:span2.css("background"," #CCCCCC");break;
                            case 2:span2.css("background","yellow");break;
                            case 3:span2.css("background","whitesmoke");break;
                            case 4:span2.css("background","red");break;
                        }

                        array[i] = this;
                        con.onclick=function(event){
                            if(event.target.tagName=="DIV" && event.target.nodeType=="1" && hasclass(event.target.className,"edate")){
                                var value=dateObj.getFullYear()+"-"+toyear(dateObj)+"-"+event.target.innerHTML;
                                value=value.split("<")[0];


                                ////////////////////////////////////////////////////
//                                console.log(value);

                                $("#nianyue").html(value);
                                var aa = parseInt(value.split("-")[2]);
//                                console.log(aa);
//                                console.log(array[aa].arriveTime);
                                $("#morningStatusLabel").html("状态："+array[aa].morningStatusLabel);
                                $("#arriveTime").html("时间："+array[aa].arriveTime);
                                $("#afternoonStatusLabel").html("状态："+array[aa].afternoonStatusLabel);
                                $("#leaveTime").html("时间："+array[aa].leaveTime);

                            };
                        };


                    })


                },
                error: function () {
                    //alert("error occured!!!");
                }

            });
        }



        qingqiu(dateObj.getFullYear()+"-"+(dateObj.getMonth()+1)+"");

    };
</script>
<!--<script src="js/kaoqinjilu.js"></script>-->

</body>

</html>


