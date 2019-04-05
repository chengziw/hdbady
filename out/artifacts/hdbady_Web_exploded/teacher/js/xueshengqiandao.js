/*
 * 自己的JS脚步
 * @Author: iceStone
 * @Date:   2015-12-12 10:59:26
 * @Last Modified by:   iceStone
 * @Last Modified time: 2015-12-12 11:01:38
 */

'use strict';
var fanhui = $(".dayuhao")[0];
var flag = $("#flag").val();
fanhui.onclick= function () {
  //console.log("ha");
    top.location = "teacherAction_t_home.action?flag="+flag+"";
};



$(function () {
        $.ajax({
            type: 'post',
            url: 'studentCheckAction_t_pageQuery.action?flag='+flag+'',
           
            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {

var banji = $(".banji span");
var daban = banji[0];
daban.innerHTML = data.nianjibanhao.nianji;
var banhao = banji[2];
banhao.innerHTML = data.nianjibanhao.banhao;


//// <div class="daoxiaorenming">
//<ul>
//<li><a href="#">
//    <span>renming</span>
//    <span>xuehao</span>
//    <span>&</span>
//    </a></li>

var daoxiao = $(".daoxiao div");
var daoxiaorenming = daoxiao[3];
var lixiaorenming = daoxiao[1];
var json = data.arrive.finsheds;
var json1 = data.arrive.unfinsheds;
for(var i in json) {


    daoxiaorenming.className = "daoxiaorenming";
    var span1 = $("<span style='display:none'>" + json[i].studentId + "</span>");
    var span4 = $("<span>" + json[i].studentNumber + "</span>");
    var span2 = $("<span>" + json[i].studentName + "</span>");
    var span3 = $("<span>" + json[i].sexLabel + "</span>");
    var li = $("<li></li>");
    var a = $("<a></a>");
    var button = $("<button>确定</button>");
    button.attr("class", "btn btn-primary btn-lg");
    a.append(span1);
    a.append(span4);
    a.append(span2);
    a.append(span3);
    a.append(button);
    li.append(a);

    var ul = daoxiaorenming.children[0];
    li.appendTo(ul);

}


                for(var i in json1){



        lixiaorenming.className = "lixiaorenming";
        var span1= $("<span style='display:none'>"+json1[i].studentId+"</span>");
        var span4 = $("<span>" + json1[i].studentNumber + "</span>");
        var span2= $("<span>"+json1[i].studentName+"</span>");
        var span3= $("<span>"+json1[i].sexLabel+"</span>");
        var li= $("<li></li>");
        var a= $("<a></a>");
        var button = $("<button>帮签到</button>");
        button.attr("class","btn btn-primary btn-lg");
        a.append(span1);
        a.append(span4);
        a.append(span2);
        a.append(span3);
        a.append(button);
        li.append(a);
        var ul = lixiaorenming.children[0];
        li.appendTo(ul);


}

                //console.log(json.length);
                //console.log(json1.length);
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
var weilixiaorenming = lixiao[1];
                var json2 = data.leave.finsheds;
                var json3 = data.leave.unfinsheds;
for(var i in json2) {


    yilixiaorenming.className = "yilixiaorenming";
    var span1 = $("<span style='display:none'>" + json2[i].studentId + "</span>");
    var span4 = $("<span>" + json2[i].studentNumber + "</span>");
    var span2 = $("<span>" + json2[i].studentName + "</span>");
    var span3 = $("<span>" + json2[i].sexLabel + "</span>");
    var li = $("<li></li>");
    var a = $("<a></a>");
    var button = $("<button>确定</button>");
    button.attr("class", "btn btn-primary btn-lg");
    a.append(span1);
    a.append(span4);
    a.append(span2);
    a.append(span3);
    a.append(button);
    li.append(a);
    var ul = yilixiaorenming.children[0];
    li.appendTo(ul);

}
    for(var i in json3){

        //
        weilixiaorenming.className = "weilixiaorenming";
        var span1= $("<span style='display:none'>"+json3[i].studentId+"</span>");
        var span4 = $("<span>" + json3[i].studentNumber + "</span>");
        var span2= $("<span>"+json3[i].studentName+"</span>");
        var span3= $("<span>"+json3[i].sexLabel+"</span>");
        var li= $("<li></li>");
        var a= $("<a></a>");
        var button = $("<button>帮签退</button>");
        button.attr("class","btn btn-primary btn-lg");
        a.append(span1);
        a.append(span4);
        a.append(span2);
        a.append(span3);
        a.append(button);
        li.append(a);
        var ul = weilixiaorenming.children[0];
        li.appendTo(ul);


}

$(".jinriyilixiao span:eq(3)").html(json2.length);
$(".jinriweilixiao span:eq(3)").html(json3.length);


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
//
//$("ul:not(0) li").on("click","button", function (event) {
//    event.stopPropagation();
//    //alert($(this).text());
//});



/////////////////////////////////////////////////////////////

             $("ul.one li").on("click","button", function (event) {

                  if(window.confirm('你确定要帮签到吗？')){


                   event.stopPropagation();
                   //console.log($(this).index());
                   var li =$(this).parent().parent();
                   //

                   //console.log(li.text());
                   // li.css("display","none");
                   //class="btn btn-default btn-lg " disabled="disabled"
                   $(this).attr({
                    "class":"btn btn-default btn-lg ",
                    "disabled":"disabled",

                   });
                   $(this).html("已签");

                   li.attr("display","block");
                   li.slideUp();
                   //array.push(li);

                   $(".jinriweidaoxiao span:eq(3)").html(--(json1.length));
                   //console.log(ul);
                   //console.log(array[0]);
                   //var ul = yilixiaorenming.children[0];
                   //li.appendTo(ul);
                   var copyli = li.clone();
                   //console.log(copyli);
                   $("ul.two").append(copyli);
                   //$(".length1").html(length1);
                   $(".jinriyidaoxiao span:eq(3)").html(++json.length);
                   //$(".jinriweidaoxiao span:eq(3)").html(json1.length);



                   //帮签到的学生学号
                   var studentid = $(this).parent().children(0).html();
                  //console.log(studentid);







                  //发送帮签到的信息
                   ///////////////////////////////
                   sendbangqian(studentid,"1");



                  }
             });




             $("ul.tree li").on("click","button", function (event) {



                  if(window.confirm('你确定要帮签退吗？')) {

                   event.stopPropagation();
                   //console.log($(this).index());
                   var li =$(this).parent().parent();
                   //
                   //console.log(li.text());
                   // li.css("display","none");
                   //class="btn btn-default btn-lg " disabled="disabled"
                   $(this).attr({
                    "class":"btn btn-default btn-lg ",
                    "disabled":"disabled",

                   });
                   $(this).html("已签");

                   li.attr("display","block");
                   li.slideUp();
                   //array.push(li);
                   $(".jinriweilixiao span:eq(3)").html(--(json3.length));
                   //console.log(ul);
                   //console.log(array[0]);
                   //var ul = yilixiaorenming.children[0];
                   //li.appendTo(ul);
                   var copyli = li.clone();
                   //console.log(copyli);
                   $("ul.four").append(copyli);
                   //$(".length1").html(length1);
                   $(".jinriyilixiao span:eq(3)").html(++(json2.length));
                   //$(".jinriweidaoxiao span:eq(3)").html(json1.length);

                  }

              //帮签tui的学生学号
              var studentid = $(this).parent().children(0).html();
              console.log(studentid);







              //发送帮签到的信息
              ///////////////////////////////
              sendbangqian(studentid,"2");

             });





            },
            error: function () {
                //alert("error occured!!!");
            }

        });

    }
)

//发送帮签到的信息
function sendbangqian(  studentid, type){
 $.ajax({
  type: 'post',
     url: 'studentCheckAction_t_addStudentCheck.action',
  data:{
   "type":type,
   "student_id":studentid
  },
  dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
  success: function (data) {
	  alert("帮签成功");

  },
  error: function () {
	  alert("帮签失败");
  }

 });


}
