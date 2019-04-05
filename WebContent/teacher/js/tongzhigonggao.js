/*
 * 自己的JS脚步
 * @Author: iceStone
 * @Date:   2015-12-12 10:59:26
 * @Last Modified by:   iceStone
 * @Last Modified time: 2015-12-12 11:01:38
 */

'use strict';

var fanhui = $("header span")[0];
var flag = $("#flag").val();
fanhui.onclick= function () {
    //console.log(fanhui);
    top.location = "teacherAction_t_home.action?flag="+flag+"";
    //window.history.back(-1);
};

var yema = 1;

$(function () {
        $.ajax({
            type: 'post',
            url: 'noticeAction_t_pageQuery.action?page=1&rows=3&flag='+flag+'',

            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {

            	yema++;
                //console.log(data);
        /* "noticeList": [
         {
         "content": "“Dear宝贝”是一款专门为幼儿园研发设计的综合管理云应用软件，旨在利用先进的移动互联网和云计算技术，让幼儿园的管理运营变得更加高效、科学和规范。软件拥有安全接送、收费管理、视频监控、家园互动、招生管理等十多项实用功能，支持安卓、苹果、微信等三个用户终端入口，支持无限分园管理，是目前国内功能最全面、用户体验最好的幼教综合管理软件，是开办经营幼儿园的必备好帮手！",
         "createTime": "1489199993",
         "isReaded": "True",
         "noticeId": "16",
         "title": "test一个通知"
         },*/
                //console.log(data.noticeList[0].content);

                var i = 0;//用于表示添加li的序号，方便从json中找,是json中的序号

                $(data.noticeList).each(function (index, value) {

                    //console.log(this.content);
                    //console.log("haha")
                    //$(".kinerNav ul").append("<li><span>aa</span></li>")
                    //console.log('ah')
                    //console.log($(".kinerNav ul"));

                    var time = getshijiancha(parseInt(this.createTime));
                   var li = $("<li class='liitem'></li>").html(
                   " <span class='biaoti'>"+this.title+"</span>"+

                      "  <span class=' glyphicon glyphicon-menu-right '></span>"+
                       " <span class='shijian'>"+time+"</span>"
                    );

                    $("ul.kinerNav").append(li);
                    //console.log("aa" == "aa");

                    var that = this;

                    li.click(function(){
                        //console.log($(this).children(0).html());
                        $("#contentbiaoti").html(that.title);
                        $("#content").html(that.content);
                        
                        //二狗
                        $.ajax({
                            type: 'post',
                            url: 'noticeAction_t_read.action?id='+that.noticeId+'',

                            dataType: 'json', 
                            success: function (data) {
                         	   }
                        });
                        //console.log(that.title);
                        //console.log()
                    });
                })


                var div = $("<div class='jiazai' id='jiazai'>点击加载更多...</div>")

               if(data.hasMore){

                   div.click(function () {

                       var jizai = this;

                       $.ajax({
                           type: 'post',
                           url: 'noticeAction_t_pageQuery.action',

                           data:{"page":yema,"rows":"3","flag":flag},
                           dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                           success: function (data) {

                        	   console.log("yema"+yema);
                        	   yema++;
                               //console.log(data);
                               /* "noticeList": [
                                {
                                "content": "“Dear宝贝”是一款专门为幼儿园研发设计的综合管理云应用软件，旨在利用先进的移动互联网和云计算技术，让幼儿园的管理运营变得更加高效、科学和规范。软件拥有安全接送、收费管理、视频监控、家园互动、招生管理等十多项实用功能，支持安卓、苹果、微信等三个用户终端入口，支持无限分园管理，是目前国内功能最全面、用户体验最好的幼教综合管理软件，是开办经营幼儿园的必备好帮手！",
                                "createTime": "1489199993",
                                "isReaded": "True",
                                "noticeId": "16",
                                "title": "test一个通知"
                                },*/
                               //console.log(data.noticeList[0].content);

                               var i = 0;//用于表示添加li的序号，方便从json中找,是json中的序号

                               $(data.noticeList).each(function (index, value) {

                                   //console.log(this.content);
                                   //console.log("haha")
                                   //$(".kinerNav ul").append("<li><span>aa</span></li>")
                                   //console.log('ah')
                                   //console.log($(".kinerNav ul"));

                                   var time = getshijiancha(parseInt(this.createTime));
                                   var li = $("<li class='liitem'></li>").html(
                                       " <span class='biaoti'>" + this.title + "</span>" +

                                       "  <span class=' glyphicon glyphicon-menu-right '></span>" +
                                       " <span class='shijian'>" + time + "</span>"
                                   );

                                   $("ul.kinerNav").append(li,jiazai);
                                   //console.log("aa" == "aa");

                                   var that = this;

                                   li.click(function () {
                                       //console.log($(this).children(0).html());
                                       $("#contentbiaoti").html(that.title);
                                       $("#content").html(that.content);
                                       //console.log(window.pageYOffset);
                                       biaoji = window.pageYOffset;
                                       $('body,html').animate({scrollTop:0},0);
                                       //console.log(that.title);
                                       //console.log()
                                      
                                       
                                   });



                                   $("html")[0].addEventListener('touchend',function(e){
                                       $('body,html').animate({scrollTop:biaoji},0);
                                       //console.log(biaoji);
                                   });
                                   //$("#ceshiyixia").click(function () {
                                   //    $('body,html').animate({scrollTop:biaoji},1);
                                   //    console.log(biaoji);
                                   //})
                               })

                           }



                       })

                   })


               }

                else{
                   div.html("没有了...");
               }

                $("ul.kinerNav").append(div);




            },
            error: function () {
                //alert("error occured!!!");
            }

        });

    }
)











