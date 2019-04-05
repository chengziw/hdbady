/*
 * 自己的JS脚步
 * @Author: iceStone
 * @Date:   2015-12-12 10:59:26
 * @Last Modified by:   iceStone
 * @Last Modified time: 2015-12-12 11:01:38
 */

'use strict';
var shijian = document.getElementsByClassName("shijian")[0];
var date = new Date();
var hours = date.getHours();
if(hours<9){
    shijian.innerHTML = "早上好" ;
}else if(hours <12){
    shijian.innerHTML = "上午好" ;
}else if(hours <18){
    shijian.innerHTML = "下午好" ;
}else if(hours <=23){
    shijian.innerHTML = "晚上好" ;
}

var longitude = $("#longitude").val();
var latitude = $("#latitude").val();

//json 人名，性别，部门，职务



/*$(function () {
        $.ajax({
            type: 'post',
            url: 'studentAction_p_studentCheck.action',

            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , 
            success: function (json) {



                $(".renming")[0].innerHTML = json.renming;
                $(".xingbie")[0].innerHTML = json["xingbie"];
                $(".bumen")[0].innerHTML = json.bumen;
                $(".zhiwu")[0].innerHTML = json.zhiwu;

            },
            error: function () {
                alert("error occured!!!");
            }

        });

    }
)
*/





/////////////////////////////////到校签到

var daoxiaoqiandao = $("#daoxiaoqiandao");
var lixiaoqiantui = $("#lixiaoqiantui");
daoxiaoqiandao.click(function () {


        //window.confirm('你确定要帮签到吗？');
        //alert("0k");


        var w = longitude;
        var h = latitude;
        alert(w);

        var j1 = 45.872101;
        var j2 = 126.534503;

        var juli = Math.pow((w - j1) * (w - j1) + (j2 - h) * (j2 - h), 0.5);

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

        function showPosition(position) {

            var w1 = position.coords.latitude;
            var h1 = position.coords.longitude;
            var calX = w1 - w;
            var calY = h1 - h;
            var ss = Math.pow((calX * calX + calY * calY), 0.5);
            //x.innerHTML="Latitude: " + position.coords.latitude + "<br />Longitude: " + position.coords.longitude + "<br />Longitude: " +ss;

            if (ss > juli) {
                alert("您未到校");
            }
            else {


                alert("haha");
                //////////////////////////////////
                $.ajax({
                    type: 'post',
                    url: 'studentCheckAction_p_addStudentCheck.action',


                    dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                    success: function (data) {

                        alert(data.type);
                        /*switch(data.daoxiaoqiandaotype){

                            case 0: alert("网络不稳定，失败");break;
                            case 1: alert("签到成功");break;
                            case 2: alert("您已签到过了");break;

                        }*/



                    },
                    error: function () {
                        alert("error occured!!!");
                    }

                });


            }
        }



            getLocation();


})
lixiaoqiantui.click(function () {


    //window.confirm('你确定要帮签到吗？');
    alert("0k");


    var w = 45.875037;
    var h = 126.537705;

    var j1 = 45.872101;
    var j2 = 126.534503;

    var juli = Math.pow((w - j1) * (w - j1) + (j2 - h) * (j2 - h), 0.5);

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }

    function showPosition(position) {

        var w1 = position.coords.latitude;
        var h1 = position.coords.longitude;
        var calX = w1 - w;
        var calY = h1 - h;
        var ss = Math.pow((calX * calX + calY * calY), 0.5);
        //x.innerHTML="Latitude: " + position.coords.latitude + "<br />Longitude: " + position.coords.longitude + "<br />Longitude: " +ss;

        if (ss > juli) {
            alert("您未到达校园区域");
        }
        else {



            //////////////////////////////////
            $.ajax({
                type: 'post',
                url: 'json/woxiangsi.json',


                dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                success: function (data) {

                	alert("waw");
                    switch(data.lixiaoqiantuitype){

                        case 0: alert("网络不稳定，失败");break;
                        case 1: alert("签退成功");break;
                        case 2: alert("您已签退过了");break;
                        case 3: alert("您还未签到，请先签到");break;

                    }



                },
                error: function () {
                    alert("error occured!!!");
                }

            });


        }
    }



    getLocation();


})
