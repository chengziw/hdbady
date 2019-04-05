/*
 * 自己的JS脚步
 * @Author: iceStone
 * @Date:   2015-12-12 10:59:26
 * @Last Modified by:   iceStone
 * @Last Modified time: 2015-12-12 11:01:38
 */

'use strict';
var fanhui = $(".dayuhao")[0];
fanhui.onclick= function () {
    //console.log(fanhui);
    top.location = "studentAction_p_home.action";
};

Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}





$(function () {
        $.ajax({
            type: 'post',
            url: 'studentVacationAction_t_pageQuery.action',

            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {



                var daoxiao = $(".daoxiao div");
                var daoxiaorenming = daoxiao[3];
                var lixiaorenming = daoxiao[1];
               var json = data.shijia;
                var json1 = data.bingjia;
                //console.log(json);
                for(var i in json){


                   var time ;
                    if(json[i].starttime == json[i].endtime){
                        time = json[i].starttime +"号";

                    }else{
                        time = json[i].starttime +"到"+json[i].endtime+"";
                    }
                    //console.log(time);


                        daoxiaorenming.className = "daoxiaorenming";
                        var span1= $("<span>"+json[i].studentId+"</span>");
                        var span2= $("<span>"+json[i].studentName+"</span>");
                        var span3= $("<span>"+json[i].sexLabel+"</span>");
                        var li= $("<li></li>");
                        var a= $("<a></a>");
                    var spandate= $("<span>"+time+"</span>");
                    spandate.attr("class","spandate");
                    span1.attr("class","span1");
                    span2.attr("class","span2");
                    span3.attr("class","span3");
                    //console.log(spandate[0].className)
                        var button = $("<button>"+"未阅"+"</button>");
                        button.attr("class","btn btn-primary btn-lg");
                        //button.setAttribute("class","btn btn-default btn-lg");
                        //button.className = "btn btn-default btn-lg";
                        a.append(span1);
                        a.append(span2);
                        a.append(span3);
                    a.append(spandate);
                        a.append(button);
                        li.append(a);
                        var ul = daoxiaorenming.children[0];
                        li.appendTo(ul);

                    }
                for(var i in json1){

                    var time ;
                    if(json1[i].starttime == json1[i].endtime){
                        time = json1[i].starttime +"号";

                    }else{
                        time = json1[i].starttime +"到"+json1[i].endtime+"";
                    }
                    //console.log(time);

                        lixiaorenming.className = "lixiaorenming";
                        var span1= $("<span>"+json1[i].studentId+"</span>");
                        var span2= $("<span>"+json1[i].studentName+"</span>");
                        var span3= $("<span>"+json1[i].sexLabel+"</span>");
                    var spandate= $("<span>"+time+"</span>");
                    spandate.attr("class","spandate");
                    span1.attr("class","span1");
                    span2.attr("class","span2");
                    span3.attr("class","span3");
                        var li= $("<li></li>");
                        var a= $("<a></a>");
                        var button = $("<button>"+"未阅"+"</button>");
                        button.attr("class","btn btn-primary btn-lg");
                        a.append(span1);
                        a.append(span2);
                        a.append(span3);
                        a.append(spandate);

                        a.append(button);
                        li.append(a);
                        var ul = lixiaorenming.children[0];
                        li.appendTo(ul);

                    }


                $(".jinriyidaoxiao span:eq(3)").html(json.length);

                $(".jinriweidaoxiao span:eq(3)").html(json1.length);


                $(".daoxiaorenming").slideToggle().stop(true,true);
                $(".lixiaorenming").slideToggle().stop(true,true);

                var flag = true;
                $(".jinriyidaoxiao").click(function () {
                    if(flag){
                        $(".daoxiaorenming").slideToggle("slow", function () {
                            flag = true;
                        });
                        flag = false;
                    }

                });
                $(".jinriweidaoxiao").click(function () {
                    if(flag){
                        $(".lixiaorenming").slideToggle("slow", function () {
                            flag = true;
                        });
                        flag = false;
                    }});


///////////////////////////////////////////////////////////////////////////////////

                $(".lixiaoqiantuinav").eq(0).click(function () {
                    $(".jinriyilixiao,.jinriweilixiao").css("display","block");
                });

                var lixiao = $(".lixiao div");
                var yilixiaorenming = lixiao[3];
                yilixiaorenming.className = "yilixiaorenming";
                var ul = yilixiaorenming.children[0];

                var weilixiaorenming = lixiao[1];
                weilixiaorenming.className = "weilixiaorenming";
                var ul2 = weilixiaorenming.children[0];




//$(".jinriyilixiao span:eq(3)").html(index1);
//$(".jinriweilixiao span:eq(3)").html(json1.length - index1 -1);


                $(".yilixiaorenming").slideToggle().stop(true,true);
                $(".weilixiaorenming").slideToggle().stop(true,true);

                var flag = true;
                $(".jinriyilixiao").click(function () {
                    if(flag){
                        $(".yilixiaorenming").slideToggle("slow", function () {
                            flag = true;
                        });
                        flag = false;
                    }

                });
                $(".jinriweilixiao").click(function () {
                    if(flag){
                        $(".weilixiaorenming").slideToggle("slow", function () {
                            flag = true;
                        });
                        flag = false;
                    }});
///////////////////////////////////////////////////////////////////////////////////
// //给子元素绑定事件
//$( "#dataTable tbody" ).on( "click", "tr", function() {
//    console.log( $( this ).text() );
//});
//    var array = new Array();
                var length1 = 0;
                var length2 = 0;
                var length3 = json.length;
                var length4 = json1.length;

                $("ul.one li").on("click","button", function (event) {
                    event.stopPropagation();
                    //console.log($(this).index());
                    var li =$(this).parent().parent();
                    //
                    length1++;
                    //console.log(li.text());
                    // li.css("display","none");
                    //class="btn btn-default btn-lg " disabled="disabled"
                    $(this).attr({
                        "class":"btn btn-default btn-lg ",
                        "disabled":"disabled",

                    });
                    $(this).html("已阅");

                    //li.attr("display","block");
                    li.slideUp();
                    //array.push(li);
                    $(".jinriweidaoxiao span:eq(3)").html(--json1.length);
                    //console.log(ul);
                    //console.log(array[0]);
                    //var ul = yilixiaorenming.children[0];
                    //li.appendTo(ul);
                    var copyli = li.clone();
                    //console.log(copyli);
                    $("ul.tree").append(copyli);
                    $(".length1").html(length1);


/////////////////////////////////////////////////////////////
                    var studentid = $(this).parent().children(0).html();
                    console.log(studentid);
                    sendbangqian(studentid);

                });


                $("ul.two li").on("click","button", function (event) {
                    event.stopPropagation();
                    var li =$(this).parent().parent();


                    length2++;
                    $(this).attr({
                        "class":"btn btn-default btn-lg ",
                        "disabled":"disabled",

                    });
                    $(this).html("已阅");
                    li.slideUp();
                    $(".jinriyidaoxiao span:eq(3)").html(--length3);
                    var copyli = li.clone();
                    $("ul.four").append(copyli);
                    $(".length2").html(length2);



//////////////////////////////////////////////////////////////
                    var studentid = $(this).parent().children(0).html();
                    console.log(studentid);
                    sendbangqian(studentid);

                });








            },
            error: function () {
                //alert("error occured!!!");
            }

        });

    }
)





//$("ul li").on("click", function (event) {
//    event.stopPropagation();
//    console.log($(this).text()+"haha");
//
//
//});


//发送已阅病假的信息
function sendbangqian(studentid){
    $.ajax({
        type: 'post',
        url: 'studentVacationAction_t_checkStudentVacation.action',
        data:{
            "type":yiyue,
            "studentid":studentid
        },
        dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
        success: function (data) {
            alert("bangqianchenggong")

        },
        error: function () {
            //alert("11111111111111error occured!!!");
        }

    });


}
