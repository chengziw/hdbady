/*
 * 自己的JS脚步
 * @Author: iceStone
 * @Date:   2015-12-12 10:59:26
 * @Last Modified by:   iceStone
 * @Last Modified time: 2015-12-12 11:01:38
 */

'use strict';

var fanhui = $("header span")[0];
fanhui.onclick= function () {
    //console.log(fanhui);
    top.location = "teacherAction_t_home.action";
};



var i=0;
var yema = 1;
$(function () {
    $.ajax({
        type: 'post',
        url: 'cookBookAction_t_pageQuery.action?page='+yema+'&rows=3',

        dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
        success: function (data) {

        	yema++;
            //遍历每一个发送的作业条目
            $(data.cookbookList).each(function (index, value) {

                //找到ul，然后把生成的li及里面的东西，把数据填进去
                ///*     <li>
                //<div>
                //<span>社会</span>
                //<span>昨天</span>
                //</div>
                //<div class="tuisongbanji">
                //    <span>推送班级：</span>
                //<span>一班，二班</span>
                //</div>
                //<div class="xiaoxineirong">
                //    把课本第二课，ABC抄一遍
                //把课本第二课，ABC抄一遍
                //把课本第二课，ABC抄一遍
                //把课本第二课，ABC抄一遍
                //把课本第二课，ABC抄一遍
                //把课本第二课，ABC抄一遍
                //把课本第二课，ABC抄一遍
                //把课本第二课，ABC抄一遍
                //</div>
                //<div class="tupian">
                //    <img src="img/jietu/捕获.PNG" alt=""/>
                //    <img src="img/jietu/捕获.PNG" alt=""/>
                //    <img src="img/jietu/捕获.PNG" alt=""/>
                //    </div>
                //    <div></div>
                //    </li>
                //    */
                var tupian = "tupian"+i;
                i++;
              //console.log($(this.images));

                var createTime = getshijiancha(this.create_time);



                var divss =  "<div class='bianjikuang'>" +
                    "<div class='shanchu' value="+this.homeworkid+">删除</div>" +
                    "<div class='querenfabu' value="+this.homeworkid+">确认发布</div>" +

                    "" +
                    "</div>";

                if(!this.hasshanchu){


                    divss = "";

                }


                $("#ul-list").append(
                    $("<li></li>").html(
                        "<div>" +
                        "<span>"+this.typeName+"</span>" +
                        "<span>"+createTime+"</span>" +
                        "</div>" +
                        "<div class='tuisongbanji'>"+
                        "<span>推送班级：</span>"+
                        "<span>"+this.classlist.classname+"</span>"+
                        "</div>"+
                        "<div class='xiaoxineirong'>"+this.content+"</div>"+
                        "<div class='tupian' id="+tupian+">"+


                        " </div>"+
                        divss

                    )
                );
                var tu = "#"+tupian;
                $(this.images).each(function(i,v){
                    var img = $('<img />');
                    $(img).attr("src", v.imgurl);
                    $(tu).append(img);
                   //console.log(v.imgurl);
                   // console.log($(img).attr("src"));
                })


            })






            var div = $("<div class='jiazai' id='jiazai'>点击加载更多...</div>")

            if(data.hasMore){

                div.click(function () {
                    $.ajax({
                        type: 'post',
                        url: 'cookBookAction_t_pageQuery.action',
                        data:{"page":yema,"rows":"3"},
                        dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                        success: function (data) {

                        	console.log("yema"+yema);
                            //遍历每一个发送的作业条目
                            $(data.cookbookList).each(function (index, value) {

                                //找到ul，然后把生成的li及里面的东西，把数据填进去
                                ///*     <li>
                                //<div>
                                //<span>社会</span>
                                //<span>昨天</span>
                                //</div>
                                //<div class="tuisongbanji">
                                //    <span>推送班级：</span>
                                //<span>一班，二班</span>
                                //</div>
                                //<div class="xiaoxineirong">
                                //    把课本第二课，ABC抄一遍
                                //把课本第二课，ABC抄一遍
                                //把课本第二课，ABC抄一遍
                                //把课本第二课，ABC抄一遍
                                //把课本第二课，ABC抄一遍
                                //把课本第二课，ABC抄一遍
                                //把课本第二课，ABC抄一遍
                                //把课本第二课，ABC抄一遍
                                //</div>
                                //<div class="tupian">
                                //    <img src="img/jietu/捕获.PNG" alt=""/>
                                //    <img src="img/jietu/捕获.PNG" alt=""/>
                                //    <img src="img/jietu/捕获.PNG" alt=""/>
                                //    </div>
                                //    <div></div>
                                //    </li>
                                //    */
                                var tupian = "tupian"+i;
                                i++;
                                //console.log($(this.images));

                                var createTime = getshijiancha(this.create_time);



                                var divss =  "<div class='bianjikuang'>" +
                                    "<div class='shanchu' value="+this.homeworkid+">删除</div>" +
                                    "<div class='querenfabu' value="+this.homeworkid+">确认发布</div>" +

                                    "" +
                                    "</div>";

                                if(!this.hasshanchu){


                                    divss = "";

                                }

                                $("#ul-list").append(
                                    $("<li></li>").html(
                                        "<div>" +
                                        "<span>"+this.typeName+"</span>" +
                                        "<span>"+createTime+"</span>" +
                                        "</div>" +
                                        "<div class='tuisongbanji'>"+
                                        "<span>推送班级：</span>"+
                                        "<span>"+this.classlist.classname+"</span>"+
                                        "</div>"+
                                        "<div class='xiaoxineirong'>"+this.content+"</div>"+
                                        "<div class='tupian' id="+tupian+">"+


                                        " </div>"+
                                        divss

                                    ),jiazai
                                );
                                var tu = "#"+tupian;
                                $(this.images).each(function(i,v){
                                    var img = $('<img />');
                                    $(img).attr("src", v.imgurl);
                                    $(tu).append(img);
                                    //console.log(v.imgurl);
                                    // console.log($(img).attr("src"));
                                })


                            })



//////////////////////////////////////////////////////////////////////////

                            $(".shanchu").click(function () {

                                //console.log($(this).attr("value"))
                                var homeworkid = $(this).attr("value");
                                //send(homeworkid,"shanchu");

                                if(window.confirm('你确定要删除该信息吗？')) {

                                    if(sendshanchu(homeworkid,"shanchu")){

                                        $(this.parentNode.parentNode).remove();
                                    }


                                }



                            });



                            $(".querenfabu").click(function () {

                                //console.log($(this).attr("value"))
                                var homeworkid = $(this).attr("value");
                                //send(homeworkid,"shanchu");



                                if(sendshanchu(homeworkid,"fabu")){

                                    $(this.parentNode).hide();
                                }






                            });



                        },
                        error: function () {
                            //alert("error occured!!!");
                        }

                    });




                })
            }


            else{
                div.html("没有了...");
            }

            $("#ul-list").append(div);










            //////////////////////////////////////////
            $(".shanchu").click(function () {

                //console.log($(this).attr("value"))
                var homeworkid = $(this).attr("value");
                //send(homeworkid,"shanchu");

                if(window.confirm('你确定要删除该信息吗？')) {

                    if(sendshanchu(homeworkid,"shanchu")){

                        $(this.parentNode.parentNode).remove();
                    }


                }



            });



            $(".querenfabu").click(function () {

                //console.log($(this).attr("value"))
                var homeworkid = $(this).attr("value");
                //send(homeworkid,"shanchu");



                if(sendshanchu(homeworkid,"fabu")){

                    $(this.parentNode).hide();
                }






            });


        },
        error: function () {
            //alert("error occured!!!");
        }

    });

}
)



function sendshanchu(homeworkid,type){
    //console.log(homeworkid)
    var falg = false;
    $.ajax({

        type: 'post',
        url: 'index.java',
        data:{
            "type":type,
            "studentid":homeworkid
        },

        async:false,
        //dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
        success: function (data) {
            alert("chenggong");
            falg = true;

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //alert("11111111111111error occured!!!");
            console.log(XMLHttpRequest.readyState)
            console.log(textStatus)
            console.log(errorThrown)
            falg = false;
        }

    });


    return falg;
}


